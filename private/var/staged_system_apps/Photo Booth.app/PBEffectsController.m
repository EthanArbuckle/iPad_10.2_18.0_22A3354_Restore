@implementation PBEffectsController

- (PBEffectsController)init
{
  PBEffectsController *v2;
  id v3;
  double v4;
  CAMCaptureGraphConfiguration *v5;
  NSUserDefaults *v6;
  id v7;
  NSString *v8;
  NSString *v9;
  PBEffectsView *v10;
  PBEffectsView *v11;
  int AppBooleanValue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PBEffectsController;
  v2 = -[PBEffectsController init](&v14, "init");
  if (v2)
  {
    v2->__motionController = (CAMMotionController *)objc_alloc_init((Class)CAMMotionController);
    v3 = objc_msgSend(objc_alloc((Class)CAMCaptureConfiguration), "initForPhotoBoothWithCaptureDevice:", -[PBEffectsController _frontCaptureDevice](v2, "_frontCaptureDevice"));
    v2->__currentGraphConfiguration = (CAMCaptureGraphConfiguration *)+[CAMCaptureConfiguration captureGraphConfigurationUsingConfiguration:outputToExternalStorage:](CAMCaptureConfiguration, "captureGraphConfigurationUsingConfiguration:outputToExternalStorage:", v3, 0);
    objc_msgSend(+[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities"), "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:", -[CAMCaptureGraphConfiguration mode](v2->__currentGraphConfiguration, "mode"), -[CAMCaptureGraphConfiguration device](v2->__currentGraphConfiguration, "device"), -[CAMCaptureGraphConfiguration videoConfiguration](v2->__currentGraphConfiguration, "videoConfiguration"), -[CAMMotionController captureOrientation](v2->__motionController, "captureOrientation"));
    v2->_cameraController = (CUCaptureController *)objc_msgSend(objc_alloc((Class)CUCaptureController), "initWithCaptureConfiguration:zoomFactor:outputToExternalStorage:engineOptions:locationController:motionController:burstController:protectionController:powerController:irisVideoController:remoteShutterController:", v3, 0, 0, 0, v2->__motionController, 0, v4, 0, 0, 0, 0);

    v5 = v2->__currentGraphConfiguration;
    -[CUCaptureController registerEffectsPreviewSampleBufferDelegate:](v2->_cameraController, "registerEffectsPreviewSampleBufferDelegate:", v2);
    -[CUCaptureController setConfigurationDelegate:](v2->_cameraController, "setConfigurationDelegate:", v2);
    -[CUCaptureController registerCaptureService:](v2->_cameraController, "registerCaptureService:", v2);
    -[CUCaptureController setRunningDelegate:](v2->_cameraController, "setRunningDelegate:", v2);
    v6 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    -[NSUserDefaults synchronize](v6, "synchronize");
    v7 = -[NSUserDefaults integerForKey:](v6, "integerForKey:", CFSTR("Current Effect Mode"));
    v8 = -[NSUserDefaults stringForKey:](v6, "stringForKey:", CFSTR("Current Effect"));
    if (v7 == (id)1)
      v9 = 0;
    else
      v9 = v8;
    v10 = [PBEffectsView alloc];
    -[UIScreen bounds](+[UIScreen mainScreen](UIScreen, "mainScreen"), "bounds");
    v11 = -[PBEffectsView initWithFrame:effectNamed:](v10, "initWithFrame:effectNamed:", v9);
    v2->_effectsView = v11;
    -[PBEffectsView setDelegate:](v11, "setDelegate:", v2);
    -[PBEffectsView setMirrorFilterRendering:](v2->_effectsView, "setMirrorFilterRendering:", -[PBEffectsController _isFrontCamera](v2, "_isFrontCamera"));
    objc_msgSend(-[PBEffectsController view](v2, "view"), "addSubview:", v2->_effectsView);

    *(_WORD *)&v2->_flags |= 2u;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AllowSystemPreferredCamera"), CFSTR("com.apple.Photo-Booth"), 0);
    v2->__systemPreferredCameraSupported = AppBooleanValue != 0;
    if (AppBooleanValue)
      +[AVCaptureDevice addObserver:forKeyPath:options:context:](AVCaptureDevice, "addObserver:forKeyPath:options:context:", v2, CFSTR("systemPreferredCamera"), 7, off_1000429D0);
  }
  return v2;
}

+ (void)initialize
{
  if ((byte_1000434D8 & 1) == 0)
  {
    byte_1000434D8 = 1;
    -[NSUserDefaults registerDefaults:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "registerDefaults:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1), CFSTR("Camera Device"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1), CFSTR("Current Effect Mode"), 0));
  }
}

- (int64_t)_frontCaptureDevice
{
  if (-[PBEffectsController _shouldUseSystemPreferredCamera](self, "_shouldUseSystemPreferredCamera"))
    return 11;
  else
    return 1;
}

+ (CGAffineTransform)_correctionTransformForOrientation:(SEL)a3
{
  CGFloat v4;
  __int128 v5;

  switch(a4)
  {
    case 2:
      v4 = 3.14159265;
      return CGAffineTransformMakeRotation(retstr, v4);
    case 3:
      v4 = -1.57079633;
      return CGAffineTransformMakeRotation(retstr, v4);
    case 4:
      v4 = 1.57079633;
      return CGAffineTransformMakeRotation(retstr, v4);
  }
  v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[PBEffectsView setDelegate:](self->_effectsView, "setDelegate:", 0);

  -[CUCaptureController invalidateController](self->_cameraController, "invalidateController");
  -[CUCaptureController unregisterEffectsPreviewSampleBufferDelegate:](self->_cameraController, "unregisterEffectsPreviewSampleBufferDelegate:", self);
  -[CUCaptureController unregisterCaptureService:](self->_cameraController, "unregisterCaptureService:", self);

  if (self->__systemPreferredCameraSupported)
    +[AVCaptureDevice removeObserver:forKeyPath:context:](AVCaptureDevice, "removeObserver:forKeyPath:context:", self, CFSTR("systemPreferredCamera"), off_1000429D0);
  v3.receiver = self;
  v3.super_class = (Class)PBEffectsController;
  -[PBEffectsController dealloc](&v3, "dealloc");
}

- (void)_applyCorrectionTransformToEffectsView
{
  PBEffectsView *effectsView;
  void *v4;
  id v5;
  PBEffectsView *v6;
  _OWORD v7[3];

  effectsView = self->_effectsView;
  v4 = (void *)objc_opt_class(self, a2);
  v5 = objc_msgSend(UIApp, "statusBarOrientation");
  if (v4)
    objc_msgSend(v4, "_correctionTransformForOrientation:", v5);
  else
    memset(v7, 0, sizeof(v7));
  -[PBEffectsView setTransform:](effectsView, "setTransform:", v7);
  v6 = self->_effectsView;
  objc_msgSend(-[PBEffectsController view](self, "view"), "bounds");
  -[PBEffectsView setFrame:](v6, "setFrame:");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PBEffectsController;
  -[PBEffectsController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PBEffectsController;
  -[PBEffectsController viewWillTransitionToSize:withTransitionCoordinator:](&v7, "viewWillTransitionToSize:withTransitionCoordinator:", a3.width, a3.height);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000024F0;
  v6[3] = &unk_100034A20;
  v6[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v6, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBEffectsController;
  -[PBEffectsController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[PBEffectsController _setSwitchingCamera:](self, "_setSwitchingCamera:", 0);
  -[PBEffectsController _applyCorrectionTransformToEffectsView](self, "_applyCorrectionTransformToEffectsView");
  -[PBEffectsView setOrientation:duration:](self->_effectsView, "setOrientation:duration:", objc_msgSend(UIApp, "statusBarOrientation"), 0.0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBEffectsController;
  -[PBEffectsController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PBEffectsView becomeFirstResponder](self->_effectsView, "becomeFirstResponder");
}

- (void)start
{
  -[CUCaptureController startCaptureSession](self->_cameraController, "startCaptureSession");
}

- (void)stop
{
  -[CUCaptureController stopCaptureSession](self->_cameraController, "stopCaptureSession");
}

- (void)startRendering:(id)a3
{
  *(_WORD *)&self->_flags |= 2u;
}

- (void)stopRendering:(id)a3
{
  *(_WORD *)&self->_flags &= ~2u;
}

- (void)takePicture:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  if (objc_msgSend(a3, "isEnabled"))
  {
    v4 = objc_alloc((Class)UIView);
    -[UIScreen bounds](+[UIScreen mainScreen](UIScreen, "mainScreen"), "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    objc_msgSend(v5, "setBackgroundColor:", +[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(-[PBEffectsView window](self->_effectsView, "window"), "addSubview:", v5);

    v9 = 0;
    -[CUCaptureController captureStillImageWithRequest:error:](self->_cameraController, "captureStillImageWithRequest:error:", -[PBEffectsController _stillImageCaptureRequestForPhotoBooth](self, "_stillImageCaptureRequestForPhotoBooth"), &v9);
    if (v9)
    {
      v6 = os_log_create("com.apple.camera", "PhotoBooth");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10001D168(&v9, v6);
    }
    v7[4] = v5;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000027D8;
    v8[3] = &unk_100034A48;
    v8[4] = v5;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000027E4;
    v7[3] = &unk_100034A70;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, v8, v7, 0.8, 0.0);
  }
}

- (id)_stillImageCaptureRequestForPhotoBooth
{
  id v3;
  int64_t v4;
  id v5;

  v3 = -[CAMMotionController captureOrientation](self->__motionController, "captureOrientation");
  v4 = -[PBEffectsController _currentDevice](self, "_currentDevice");
  v5 = objc_alloc_init((Class)CAMMutableStillImageCaptureRequest);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setCaptureOrientation:", v3);
  objc_msgSend(v5, "setCaptureDevice:", v4);
  objc_msgSend(v5, "setCaptureMode:", 0);
  objc_msgSend(v5, "setPhotoQualityPrioritization:", 0);
  objc_msgSend(v5, "setWantsAutoDualCameraFusion:", 0);
  objc_msgSend(v5, "setWantsSquareCrop:", 0);
  objc_msgSend(v5, "setWantsHighResolutionStills:", 1);
  objc_msgSend(v5, "setWantsDepthData:", 0);
  objc_msgSend(v5, "setCapturedFromPhotoBooth:", 1);
  objc_msgSend(v5, "setFlashMode:", 0);
  objc_msgSend(v5, "setHdrMode:", 0);
  objc_msgSend(v5, "setIrisMode:", 0);
  objc_msgSend(v5, "setWantsAudioForCapture:", 1);
  objc_msgSend(v5, "setWantsSemanticSceneFilter:", 0);
  objc_msgSend(v5, "setPersistenceOptions:", 2);
  objc_msgSend(v5, "setTemporaryPersistenceOptions:", 0);
  return v5;
}

- (void)toggleEffectsMode:(id)a3
{
  -[PBEffectsView toggleEffectsMode:](self->_effectsView, "toggleEffectsMode:", a3);
}

- (void)toggleCamera:(id)a3
{
  -[PBEffectsController _reconfigureCameraForDevicePosition:](self, "_reconfigureCameraForDevicePosition:", -[PBEffectsController _currentDevicePosition](self, "_currentDevicePosition", a3) == 0);
}

- (void)_reconfigureCameraForDevicePosition:(int64_t)a3
{
  int64_t v4;
  id v5;

  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    if (a3 == 1)
      v4 = -[PBEffectsController _frontCaptureDevice](self, "_frontCaptureDevice");
    else
      v4 = 0;
    -[PBEffectsView disableUpdate](self->_effectsView, "disableUpdate");
    -[PBEffectsController _setSwitchingCamera:](self, "_setSwitchingCamera:", 1);
    v5 = -[PBEffectsController _graphConfigurationForChangeToDevice:](self, "_graphConfigurationForChangeToDevice:", v4);
    objc_msgSend(+[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities"), "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:", objc_msgSend(v5, "mode"), objc_msgSend(v5, "device"), objc_msgSend(v5, "videoConfiguration"), -[CAMMotionController captureOrientation](-[PBEffectsController _motionController](self, "_motionController"), "captureOrientation"));
    -[CUCaptureController changeToGraphConfiguration:zoomFactor:minimumExecutionTime:outputToExternalStorage:](self->_cameraController, "changeToGraphConfiguration:zoomFactor:minimumExecutionTime:outputToExternalStorage:", v5, 0);
  }
}

- (void)resetEffects:(id)a3
{
  if ((id)-[PBEffectsView mode](self->_effectsView, "mode", a3) != (id)1)
    -[PBEffectsView toggleEffectsMode:](self->_effectsView, "toggleEffectsMode:", self);
  -[PBEffectsView resetAllEffects](self->_effectsView, "resetAllEffects");
}

- (void)stillImageRequest:(id)a3 didCompleteStillImageCaptureWithResult:(id)a4
{
  NSObject *v8;
  NSObject *global_queue;
  _QWORD block[7];
  uint8_t buf[4];
  NSString *v12;

  v8 = os_log_create("com.apple.camera", "PhotoBooth");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = NSStringFromSelector(a2);
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  -[PBEffectsController _setCurrentImagesInflight:imageWriterQueueAvailable:](self, "_setCurrentImagesInflight:imageWriterQueueAvailable:", (self->_currentImagesInflight + 1), -[CUCaptureController isCaptureAvailable](self->_cameraController, "isCaptureAvailable"));
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002BD8;
  block[3] = &unk_100034A98;
  block[4] = a4;
  block[5] = self;
  block[6] = a3;
  dispatch_async(global_queue, block);
}

- (void)captureControllerDidStartRunning:(id)a3
{
  NSObject *v5;
  int v6;
  NSString *v7;

  v5 = os_log_create("com.apple.camera", "PhotoBooth");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = NSStringFromSelector(a2);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
  if ((objc_opt_respondsToSelector(self->_delegate, "effectsControllerCaptureSessionDidStartRunning") & 1) != 0)
    -[PBEffectsControllerDelegate effectsControllerCaptureSessionDidStartRunning](self->_delegate, "effectsControllerCaptureSessionDidStartRunning");
}

- (void)captureControllerDidStopRunning:(id)a3
{
  NSObject *v5;
  int v6;
  NSString *v7;

  v5 = os_log_create("com.apple.camera", "PhotoBooth");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = NSStringFromSelector(a2);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
  *(_WORD *)&self->_flags &= ~1u;
  if ((objc_opt_respondsToSelector(self->_delegate, "effectsControllerCaptureSessionDidStopRunning") & 1) != 0)
    -[PBEffectsControllerDelegate effectsControllerCaptureSessionDidStopRunning](self->_delegate, "effectsControllerCaptureSessionDidStopRunning");
}

- (void)effectsViewDidChangeMode:(id)a3
{
  __int16 flags;

  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *(_WORD *)&self->_flags = flags & 0xFFFB;
    -[PBEffectsControllerDelegate effectsControllerDidChangeMode:](self->_delegate, "effectsControllerDidChangeMode:", self);
  }
}

- (void)effectsView:(id)a3 willChangeMode:(int64_t)a4 toMode:(int64_t)a5
{
  __int16 flags;

  flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    if (!a5)
      *(_WORD *)&self->_flags = flags | 4;
    -[PBEffectsControllerDelegate effectsControllerWillChangeMode:](self->_delegate, "effectsControllerWillChangeMode:", self, a4);
  }
}

- (int64_t)_currentDevice
{
  return (int64_t)-[CAMCaptureGraphConfiguration device](-[PBEffectsController _currentGraphConfiguration](self, "_currentGraphConfiguration"), "device");
}

- (int64_t)_currentDevicePosition
{
  int64_t v2;

  v2 = -[PBEffectsController _currentDevice](self, "_currentDevice");
  if ((unint64_t)(v2 - 1) > 0xA)
    return 0;
  else
    return qword_100026F58[v2 - 1];
}

- (BOOL)canTakePhoto
{
  return (*(_WORD *)&self->_flags & 4) != 0 || -[PBEffectsView mode](self->_effectsView, "mode") == 0;
}

- (void)_setSwitchingCamera:(BOOL)a3
{
  _BOOL4 v3;
  __int16 v5;

  if (((((*(_WORD *)&self->_flags & 8) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[PBEffectsController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isSwitchingCamera"));
    if (v3)
      v5 = 8;
    else
      v5 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v5;
    -[PBEffectsController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isSwitchingCamera"));
  }
}

- (BOOL)isSwitchingCamera
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)_isFrontCamera
{
  return (id)-[PBEffectsController _currentDevicePosition](self, "_currentDevicePosition") == (id)1;
}

- (BOOL)isPreviewing
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_setCurrentImagesInflight:(int)a3 imageWriterQueueAvailable:(BOOL)a4
{
  PBEffectsControllerDelegate *delegate;

  self->_currentImagesInflight = a3;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    delegate = self->_delegate;
    if (a3 < 5)
      -[PBEffectsControllerDelegate effectsControllerDidChangeCaptureAbility:](delegate, "effectsControllerDidChangeCaptureAbility:", a4);
    else
      -[PBEffectsControllerDelegate effectsControllerDidChangeCaptureAbility:](delegate, "effectsControllerDidChangeCaptureAbility:", 0);
  }
}

- (void)setDelegate:(id)a3
{
  __int16 v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;

  if (self->_delegate != a3)
  {
    self->_delegate = (PBEffectsControllerDelegate *)a3;
    if (a3)
    {
      if ((objc_opt_respondsToSelector(a3, "effectsControllerDidChangeMode:") & 1) != 0)
        v4 = 32;
      else
        v4 = 0;
      *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v4;
      if ((objc_opt_respondsToSelector(self->_delegate, "effectsControllerWillChangeMode:") & 1) != 0)
        v5 = 64;
      else
        v5 = 0;
      *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v5;
      if ((objc_opt_respondsToSelector(self->_delegate, "effectsControllerDidStartPreview:") & 1) != 0)
        v6 = 128;
      else
        v6 = 0;
      *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v6;
      if ((objc_opt_respondsToSelector(self->_delegate, "effectsControllerDidChangeCaptureAbility:") & 1) != 0)
        v7 = 256;
      else
        v7 = 0;
      *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v7;
    }
    else
    {
      *(_WORD *)&self->_flags &= 0xFE1Fu;
    }
  }
}

- (PBEffectsControllerDelegate)delegate
{
  return self->_delegate;
}

- (PBEffectsView)effectsView
{
  if ((-[PBEffectsController isViewLoaded](self, "isViewLoaded") & 1) == 0)
    -[PBEffectsController view](self, "view");
  return self->_effectsView;
}

- (void)effectsPreviewVideoDataOutputDidOutputSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  _QWORD v5[6];

  CFRetain(a3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000036A4;
  v5[3] = &unk_100034AC0;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)effectsPreviewVideoDataOutputDidDropSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *v3;

  v3 = os_log_create("com.apple.camera", "PhotoBooth");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10001D29C(v3);
}

- (id)_graphConfigurationForChangeToDevice:(int64_t)a3
{
  id v3;
  id v4;

  v3 = objc_msgSend(objc_alloc((Class)CAMCaptureConfiguration), "initForPhotoBoothWithCaptureDevice:", a3);
  v4 = +[CAMCaptureConfiguration captureGraphConfigurationUsingConfiguration:outputToExternalStorage:](CAMCaptureConfiguration, "captureGraphConfigurationUsingConfiguration:outputToExternalStorage:", v3, 0);

  return v4;
}

- (void)captureController:(id)a3 didChangeToGraphConfiguration:(id)a4 forDesiredConfiguration:(id)a5 requestID:(int)a6
{
  NSObject *v9;
  id v10;
  _BOOL8 v11;
  int v12;
  NSString *v13;

  v9 = os_log_create("com.apple.camera", "PhotoBooth");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = NSStringFromSelector(a2);
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v12, 0xCu);
  }
  v10 = objc_msgSend(a4, "device");
  if (v10 != (id)-[PBEffectsController _currentDevice](self, "_currentDevice"))
  {
    -[PBEffectsController _setCurrentGraphConfiguration:](self, "_setCurrentGraphConfiguration:", a4);
    v11 = -[PBEffectsController _isFrontCamera](self, "_isFrontCamera");
    -[PBEffectsView resetQueueDimensions](self->_effectsView, "resetQueueDimensions");
    -[PBEffectsView flipAppearance:](self->_effectsView, "flipAppearance:", v11);
    -[PBEffectsView setMirrorFilterRendering:](self->_effectsView, "setMirrorFilterRendering:", v11);
    -[PBEffectsController _setSwitchingCamera:](self, "_setSwitchingCamera:", 0);
  }
}

- (void)_handleSystemPreferredCameraChanged:(id)a3
{
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;

  v5 = (uint64_t)objc_msgSend(a3, "objectForKeyedSubscript:", NSKeyValueChangeNewKey);
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", NSKeyValueChangeOldKey);
  v7 = os_log_create("com.apple.camera", "PhotoBooth");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "systemPreferredCamera changed from %{public}@ to: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (v5)
  {
    v9 = objc_opt_class(AVCaptureDevice, v8);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0
      && objc_msgSend(objc_msgSend((id)v5, "deviceType"), "isEqualToString:", AVCaptureDeviceTypeExternalUnknown))
    {
      v5 = 1;
      -[PBEffectsController _setDidObserveExternalSystemPreferredCamera:](self, "_setDidObserveExternalSystemPreferredCamera:", 1);
    }
    else
    {
      v5 = 0;
    }
  }
  -[PBEffectsController _setShouldUseSystemPreferredCamera:](self, "_setShouldUseSystemPreferredCamera:", v5);
  v10 = -[PBEffectsController _currentDevicePosition](self, "_currentDevicePosition");
  if (-[PBEffectsController _didObserveExternalSystemPreferredCamera](self, "_didObserveExternalSystemPreferredCamera"))
  {
    if (v10 == 1)
      -[PBEffectsController _reconfigureCameraForDevicePosition:](self, "_reconfigureCameraForDevicePosition:", 1);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v8;
  _QWORD block[6];

  if (off_1000429D0 == a6)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread", a3, a4))
    {
      -[PBEffectsController _handleSystemPreferredCameraChanged:](self, "_handleSystemPreferredCameraChanged:", a5);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100003B50;
      block[3] = &unk_100034AE8;
      block[4] = self;
      block[5] = a5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PBEffectsController;
    -[PBEffectsController observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (CAMMotionController)_motionController
{
  return self->__motionController;
}

- (CAMCaptureGraphConfiguration)_currentGraphConfiguration
{
  return self->__currentGraphConfiguration;
}

- (void)_setCurrentGraphConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)_systemPreferredCameraSupported
{
  return self->__systemPreferredCameraSupported;
}

- (BOOL)_didObserveExternalSystemPreferredCamera
{
  return self->__didObserveExternalSystemPreferredCamera;
}

- (void)_setDidObserveExternalSystemPreferredCamera:(BOOL)a3
{
  self->__didObserveExternalSystemPreferredCamera = a3;
}

- (BOOL)_shouldUseSystemPreferredCamera
{
  return self->__shouldUseSystemPreferredCamera;
}

- (void)_setShouldUseSystemPreferredCamera:(BOOL)a3
{
  self->__shouldUseSystemPreferredCamera = a3;
}

@end
