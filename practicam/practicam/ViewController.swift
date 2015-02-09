//
//  ViewController.swift
//  cameraSample
//
//  Created by ken morobayashi on 2014/11/15.
//  Copyright (c) 2014年 ken morobayashi. All rights reserved.

import UIKit
import AVFoundation
import Social

class ViewController: UIViewController,NADIconLoaderDelegate{
    
    // セッション
    var avSession : AVCaptureSession!
    // デバイス
    var avDevice : AVCaptureDevice!
    // 画像のアウトプット
    var avImageOutput : AVCaptureStillImageOutput!
    // デバイスポジション
    var avDevicePosition : AVCaptureDevicePosition!
    
    // sns
    var composeView : SLComposeViewController!
    
    // nend
    private var iconLoader: NADIconLoader!
    let ICON_COUNT:Int = 6
    
    // 撮影画像
    var currentImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.avDevicePosition = AVCaptureDevicePosition.Back;
        createView()
    }
    
    override func viewDidDisappear(animated: Bool) {
        tearDownAVCapture()
    }
    
    func createView(){
        
        setupAVCapture()
        
        // Viewに追加
        ViewHelper.viewHelperInstance.addSubLayer(self.view , avCaptureVideoPreviewLayer:createVideoLayer() , key:UINoStruct.VIDEO_LAYER)
        
        // セッション開始
        self.avSession.startRunning()
        
        // メニュー
        var menuView = MenuView(view:self.view)
        menuView.createViewEffectBlur()
        let cameraButton = menuView.createCameraButton()
        let cameraChangeButton = menuView.createCameraChangeButton()
        let gridButton = menuView.createGridButton()
        
        //イベント追加
        cameraButton.addTarget(self, action: "onClickCameraButton:", forControlEvents: .TouchUpInside)
        cameraChangeButton.addTarget(self, action: "onClickCameraChangeButton:", forControlEvents: .TouchUpInside)
        gridButton.addTarget(self, action: "onClickGridButton:", forControlEvents: .TouchUpInside)
    }
    
    //AV要素を生成
    func setupAVCapture(){
        // セッションの作成
        self.avSession = AVCaptureSession()
        // デバイス一覧の取得
        let devices = AVCaptureDevice.devices()
        // カメラを格納
        for device in devices{
            if(device.position == self.avDevicePosition){
                self.avDevice = device as AVCaptureDevice
                break
            }
        }
        
        // バックカメラからVideoInputを取得
        let videoInput = AVCaptureDeviceInput.deviceInputWithDevice(self.avDevice, error: nil) as AVCaptureDeviceInput
        
        // セッションに追加
        self.avSession.addInput(videoInput)
        // 出力先を生成
        self.avImageOutput = AVCaptureStillImageOutput()
        // セッションに追加
        self.avSession.addOutput(avImageOutput)
    }
    
    
    func tearDownAVCapture(){
        self.avSession.stopRunning()
        for output in self.avSession.outputs {
            self.avSession.removeOutput(output as AVCaptureOutput)
        }
        for input in self.avSession.inputs {
            self.avSession.removeInput(input as AVCaptureInput)
        }
        self.avImageOutput = nil
        self.avSession = nil
    }
    
    // 画像を表示するレイヤーを生成
    func createVideoLayer()->AVCaptureVideoPreviewLayer {
        
        let videoLayer : AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.layerWithSession(self.avSession) as AVCaptureVideoPreviewLayer
        
        switch self.interfaceOrientation.rawValue {
        case 1: // 1:ホームボタンが下
            videoLayer.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
            break
        case 2: // 2:ホームボタンが上
            videoLayer.connection.videoOrientation = AVCaptureVideoOrientation.PortraitUpsideDown
            break
        case 3: // 3:ホームボタンが右
            videoLayer.connection.videoOrientation = AVCaptureVideoOrientation.LandscapeRight
            break
        case 4: // 4:ホームボタンが左
            videoLayer.connection.videoOrientation = AVCaptureVideoOrientation.LandscapeLeft
            break
        default:
            break
        }
        videoLayer.position = CGPoint(x:0,y:0)
        videoLayer.frame = self.view.bounds
        videoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        return videoLayer
    }
    
    func createIconView(){
        
        var sizeAdjuster = SizeAdjuster(view:self.view)
        
        let ICON_SIZE:CGFloat = 75
        
        //NADIconLoaderクラスの生成
        iconLoader = NADIconLoader()
        
        var overHalf = 0
        for(var i = 0; i < self.ICON_COUNT; i++){
            var x = 2
            var y = (i + 1) * 3
            if(i != 0 && i >= ICON_COUNT / 2){
                x += 25
                y = (overHalf + 1) * 3
                overHalf++
            }
            var iconView:NADIconView!
            iconView = NADIconView(frame: CGRect(x: sizeAdjuster.sizeDicWidth[x]!, y: sizeAdjuster.sizeDicHeight[y]!, width: ICON_SIZE, height: ICON_SIZE))
            //テキスト色の設定
            iconView.setTextColor(UIColor.whiteColor())
            //テキストの表示or非表示
            iconView.textHidden = false
            
            var no = UINoStruct.NEND_ICON + i
            ViewHelper.viewHelperInstance.addSubview(self.view , iconView:iconView , no:no)
            
            //loaderへ追加
            iconLoader.addIconView(iconView)
        }
        
        //loaderへの設定
        iconLoader.setNendID("befe374f76bb99964ce70373657c7a43b130a5f2",spotID: "303158")
        iconLoader.delegate = self
        iconLoader.isOutputLog = true
        //load開始
        iconLoader.load()
    }
    
    func closeIconView(){
        
        for(var i = 0; i < self.ICON_COUNT; i++){
            var no = UINoStruct.NEND_ICON + i
            if(self.view.viewWithTag(no) != nil){
                var old: NADIconView = self.view.viewWithTag(no) as NADIconView
                old.removeFromSuperview()
            }
        }
    }
    
    // ボタンイベント
    func onClickCameraButton(sender: UIButton){
        
        // ビデオ出力に接続
        let videoConnection = avImageOutput.connectionWithMediaType(AVMediaTypeVideo)
        
        // 接続から画像を取得
        self.avImageOutput.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: { (imageDataBuffer, error) -> Void in
            
            // 取得したImageのDataBufferをJpegに変換
            let imageData : NSData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataBuffer)
            
            // JpegからUIIMageを作成
            let image : UIImage! = UIImage(data: imageData)
            var saveImage : UIImage!
            // 向きを整える
            switch self.interfaceOrientation.rawValue {
            case 2: // 2:ホームボタンが上
                saveImage = UIImage(CGImage: image.CGImage, scale: 1.0, orientation: UIImageOrientation.Left)
                break
            case 3: // 3:ホームボタンが右
                saveImage = UIImage(CGImage: image.CGImage, scale: 1.0, orientation: UIImageOrientation.Up)
                break
            case 4: // 4:ホームボタンが左
                saveImage = UIImage(CGImage: image.CGImage, scale: 1.0, orientation: UIImageOrientation.Down)
                break
            default: // 1:ホームボタンが下
                saveImage = image
                break
            }
            
            // nend
            self.createIconView()
            
            // preview
            self.currentImage = saveImage;
            var preview = Preview(view:self.view)
            preview.createPreview(saveImage)
            UIImageWriteToSavedPhotosAlbum(saveImage, self, nil, nil)
            var closeButton = preview.createCloseButton()
            closeButton.addTarget(self, action: "onClickPreviewClose:", forControlEvents: .TouchUpInside)
            var facebookButton = preview.createFacebookButton()
            facebookButton.addTarget(self, action: "onClickPreviewFacebook:", forControlEvents: .TouchUpInside)
            var twitterButton = preview.createTwitterButton()
            twitterButton.addTarget(self, action: "onClickPreviewTwitter:", forControlEvents: .TouchUpInside)
        })
    }
    
    // ボタンイベント
    func onClickCameraChangeButton(sender: UIButton){
        self.avDevicePosition = self.avDevicePosition == AVCaptureDevicePosition.Back ? AVCaptureDevicePosition.Front : AVCaptureDevicePosition.Back;
        tearDownAVCapture()
        createView()
    }
    
    // ボタンイベント
    func onClickGridButton(sender: UIButton){
        
        var gridSelectLabel = GridSelectLabel(view:self.view)
        if(self.view.viewWithTag(UINoStruct.GRID_SELECT_BASE) != nil){
            gridSelectLabel.close()
        }else{
            gridSelectLabel.createBaseLabel()
            var button1 = gridSelectLabel.createButton1()
            var button2 = gridSelectLabel.createButton2()
            var button3 = gridSelectLabel.createButton3()
            var button4 = gridSelectLabel.createButton4()
            var button5 = gridSelectLabel.createButton5()
            var button6 = gridSelectLabel.createButton6()
            var button7 = gridSelectLabel.createButton7()
            var button8 = gridSelectLabel.createButton8()
            button1.addTarget(self, action: "onClickGrid1:", forControlEvents: .TouchUpInside)
            button2.addTarget(self, action: "onClickGrid2:", forControlEvents: .TouchUpInside)
            button3.addTarget(self, action: "onClickGrid3:", forControlEvents: .TouchUpInside)
            button4.addTarget(self, action: "onClickGrid4:", forControlEvents: .TouchUpInside)
            button5.addTarget(self, action: "onClickGrid5:", forControlEvents: .TouchUpInside)
            button6.addTarget(self, action: "onClickGrid6:", forControlEvents: .TouchUpInside)
            button7.addTarget(self, action: "onClickGrid7:", forControlEvents: .TouchUpInside)
            button8.addTarget(self, action: "onClickGrid8:", forControlEvents: .TouchUpInside)
        }
        
    }
    
    func onClickGrid1(sender: UIButton) {
        
        var gridView = GridView(view:self.view)
        if(self.view.viewWithTag(UINoStruct.LABEL_GRID_1_1) != nil){
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_1_1)
        }else{
            gridView.createCircle()
        }
    }
    
    func onClickGrid2(sender: UIButton) {
        
        var gridView = GridView(view:self.view)
        if(self.view.viewWithTag(UINoStruct.LABEL_GRID_2_1) != nil){
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_2_1)
        }else{
            gridView.createS()
        }
    }
    
    func onClickGrid3(sender: UIButton) {
        
        var gridView = GridView(view:self.view)
        if(self.view.viewWithTag(UINoStruct.LABEL_GRID_3_1) != nil){
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_3_1)
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_3_2)
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_3_3)
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_3_4)
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_3_5)
        }else{
            gridView.create3Div()
        }
    }
    
    func onClickGrid4(sender: UIButton) {
        
        var gridView = GridView(view:self.view)
        if(self.view.viewWithTag(UINoStruct.LABEL_GRID_4_1) != nil){
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_4_1)
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_4_2)
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_4_3)
        }else{
            gridView.create2Div()
        }
    }
    
    func onClickGrid5(sender: UIButton) {
        
        var gridView = GridView(view:self.view)
        if(self.view.viewWithTag(UINoStruct.LABEL_GRID_5_1) != nil){
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_5_1)
        }else{
            gridView.createDiagonalRight()
        }
    }
    
    func onClickGrid6(sender: UIButton) {
        
        var gridView = GridView(view:self.view)
        if(self.view.viewWithTag(UINoStruct.LABEL_GRID_6_1) != nil){
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_6_1)
        }else{
            gridView.createDiagonalLeft()
        }
    }
    
    func onClickGrid7(sender: UIButton) {
        
        var gridView = GridView(view:self.view)
        if(self.view.viewWithTag(UINoStruct.LABEL_GRID_7_1) != nil){
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_7_1)
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_7_2)
        }else{
            gridView.createDwindle()
        }
    }
    
    func onClickGrid8(sender: UIButton) {
        
        var gridView = GridView(view:self.view)
        if(self.view.viewWithTag(UINoStruct.LABEL_GRID_8_1) != nil){
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_8_1)
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_8_2)
            ViewHelper.viewHelperInstance.removeFromSuperview(self.view, no: UINoStruct.LABEL_GRID_8_3)
        }else{
            gridView.createGap()
        }
    }
    
    func onClickPreviewClose(sender: UIButton) {
        
        var preview = Preview(view:self.view)
        preview.close()
        closeIconView()
        self.currentImage = nil
    }
    
    func onClickPreviewFacebook(sender: UIButton) {
        
        composeView = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        // テキストを指定.
        composeView.setInitialText("Created By practice-camera\nhttps://itunes.apple.com/us/app/practice-camera-picture-composition/id954811892?mt=8")
        // 投稿する画像を指定.
        composeView.addImage(self.currentImage)
        // composeViewの画面遷移.
        self.presentViewController(composeView, animated: true, completion: nil)
    }
    
    func onClickPreviewTwitter(sender: UIButton) {
        
        composeView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        // テキストを指定.
        composeView.setInitialText("Created By practice-camera\nhttps://itunes.apple.com/us/app/practice-camera-picture-composition/id954811892?mt=8")
        // 投稿する画像を指定.
        composeView.addImage(self.currentImage)
        // composeViewの画面遷移.
        self.presentViewController(composeView, animated: true, completion: nil)
    }
    
    // メモリ解放
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        tearDownAVCapture()
        createView()
    }
    
    // 回転イベント
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        
        tearDownAVCapture()
        createView()
        
        var gridSelectLabel = GridSelectLabel(view:self.view)
        if(self.view.viewWithTag(UINoStruct.GRID_SELECT_BASE) != nil){
            gridSelectLabel.close()
        }
        
        var preview = Preview(view:self.view)
        if(self.view.viewWithTag(UINoStruct.PREVIEW_BASE) != nil){
            preview.close()
            closeIconView()
        }
    }
    
}

