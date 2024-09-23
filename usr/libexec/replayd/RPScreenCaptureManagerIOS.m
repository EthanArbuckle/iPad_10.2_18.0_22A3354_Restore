@implementation RPScreenCaptureManagerIOS

- (RPScreenCaptureManagerIOS)init
{
  RPScreenCaptureManagerIOS *v2;
  RPScreenCaptureManagerIOS *v3;
  FigScreenCaptureController *screenCaptureController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPScreenCaptureManagerIOS;
  v2 = -[RPScreenCaptureManagerIOS init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    screenCaptureController = v2->_screenCaptureController;
    v2->_screenCaptureController = 0;

  }
  return v3;
}

- (void)setCloneMirroringMode:(BOOL)a3 contextIDs:(id)a4
{
  _BOOL4 v4;
  uint64_t v6;
  id v7;
  FigScreenCaptureController *screenCaptureController;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  FigScreenCaptureController *v16;
  void *v17;
  FigScreenCaptureController *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;

  v4 = a3;
  v7 = a4;
  if (v4)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "-[RPScreenCaptureManagerIOS setCloneMirroringMode:contextIDs:]";
      v27 = 1024;
      v28 = 62;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d mirror mode", buf, 0x12u);
    }
    BKSDisplayServicesSetCloneMirroringMode(1);
    screenCaptureController = self->_screenCaptureController;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    -[FigScreenCaptureController setFigVirtualDisplayOption:forKey:](screenCaptureController, "setFigVirtualDisplayOption:forKey:", v9, kFigVirtualDisplayOption_MirroringMode);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "-[RPScreenCaptureManagerIOS setCloneMirroringMode:contextIDs:]";
      v27 = 1024;
      v28 = 66;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d replay mode", buf, 0x12u);
    }
    v9 = (void *)objc_opt_new(NSMutableSet, v6);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPStringUtility numberFromString:](RPStringUtility, "numberFromString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), (_QWORD)v20));
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    v16 = self->_screenCaptureController;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
    -[FigScreenCaptureController setFigVirtualDisplayOption:forKey:](v16, "setFigVirtualDisplayOption:forKey:", v17, kFigVirtualDisplayOption_ContentIDs);

    v18 = self->_screenCaptureController;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
    -[FigScreenCaptureController setFigVirtualDisplayOption:forKey:](v18, "setFigVirtualDisplayOption:forKey:", v19, kFigVirtualDisplayOption_MirroringMode);

    BKSDisplayServicesSetCloneMirroringMode(3);
  }

}

- (void)startSessionWithPID:(int)a3 windowSize:(CGSize)a4 systemRecording:(BOOL)a5 contextIDs:(id)a6 mixedRealityCamera:(BOOL)a7 outputHandler:(id)a8 didStartHandler:(id)a9
{
  _BOOL4 v11;
  _BOOL8 v12;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  id didStartScreenCaptureHandler;
  FigScreenCaptureController *v21;
  FigScreenCaptureController *screenCaptureController;
  id v23;
  FigScreenCaptureController *v24;
  Float64 Seconds;
  id v26;
  id screenCaptureOutputHandler;
  CMTime v28;
  CMTime v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  FigScreenCaptureController *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  Float64 v43;
  __int16 v44;
  _BOOL4 v45;

  v11 = a7;
  v12 = a5;
  height = a4.height;
  width = a4.width;
  v17 = a6;
  v18 = a8;
  v19 = objc_retainBlock(a9);
  didStartScreenCaptureHandler = self->super._didStartScreenCaptureHandler;
  self->super._didStartScreenCaptureHandler = v19;

  self->super._screenCaptureDidStart = 0;
  if (!self->_screenCaptureController)
  {
    CMTimeMake(&v29, 1, 60);
    v21 = (FigScreenCaptureController *)objc_claimAutoreleasedReturnValue(+[FigScreenCaptureController screenCaptureControllerWithSize:minIntervalBetweenFrames:](FigScreenCaptureController, "screenCaptureControllerWithSize:minIntervalBetweenFrames:", &v29, width, height));
    screenCaptureController = self->_screenCaptureController;
    self->_screenCaptureController = v21;

  }
  -[RPScreenCaptureManagerIOS setCloneMirroringMode:contextIDs:](self, "setCloneMirroringMode:contextIDs:", v12, v17);
  if (dword_100095B40 <= 1)
  {
    v23 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_screenCaptureController;
      if (v24)
        -[FigScreenCaptureController minIntervalBetweenFrames](self->_screenCaptureController, "minIntervalBetweenFrames");
      else
        memset(&v28, 0, sizeof(v28));
      Seconds = CMTimeGetSeconds(&v28);
      *(_DWORD *)buf = 136448002;
      v31 = "-[RPScreenCaptureManagerIOS startSessionWithPID:windowSize:systemRecording:contextIDs:mixedRealityCamera:out"
            "putHandler:didStartHandler:]";
      v32 = 1024;
      v33 = 124;
      v34 = 2048;
      v35 = v24;
      v36 = 1024;
      v37 = a3;
      v38 = 2048;
      v39 = width;
      v40 = 2048;
      v41 = height;
      v42 = 2048;
      v43 = Seconds;
      v44 = 1024;
      v45 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d starting capture with FigCaptureController %p, pid %d, window size width %.1f x height:%.1f, minIntervalBetweenFrames(seconds): %lf mixedRealityCamera=%d", buf, 0x46u);
    }

  }
  -[FigScreenCaptureController setDelegate:](self->_screenCaptureController, "setDelegate:", self, v28.value, *(_QWORD *)&v28.timescale, v28.epoch);
  v26 = objc_retainBlock(v18);

  screenCaptureOutputHandler = self->super._screenCaptureOutputHandler;
  self->super._screenCaptureOutputHandler = v26;

  -[FigScreenCaptureController startCapture](self->_screenCaptureController, "startCapture");
}

- (void)stop
{
  FigScreenCaptureController *screenCaptureController;
  FigScreenCaptureController *v4;
  FigScreenCaptureController *v5;
  id screenCaptureOutputHandler;
  id didStartScreenCaptureHandler;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  FigScreenCaptureController *v13;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    screenCaptureController = self->_screenCaptureController;
    v8 = 136446722;
    v9 = "-[RPScreenCaptureManagerIOS stop]";
    v10 = 1024;
    v11 = 131;
    v12 = 2048;
    v13 = screenCaptureController;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop capture with FigCaptureController: %p", (uint8_t *)&v8, 0x1Cu);
  }
  v4 = self->_screenCaptureController;
  if (v4)
  {
    -[FigScreenCaptureController stopCapture](v4, "stopCapture");
    -[FigScreenCaptureController setDelegate:](self->_screenCaptureController, "setDelegate:", 0);
    v5 = self->_screenCaptureController;
    self->_screenCaptureController = 0;

  }
  BKSDisplayServicesSetCloneMirroringMode(0);
  screenCaptureOutputHandler = self->super._screenCaptureOutputHandler;
  self->super._screenCaptureOutputHandler = 0;

  didStartScreenCaptureHandler = self->super._didStartScreenCaptureHandler;
  self->super._didStartScreenCaptureHandler = 0;

  self->super._screenCaptureDidStart = 0;
  -[RPScreenCaptureManager setSystemBroadcastHostBundleId:](self, "setSystemBroadcastHostBundleId:", 0);
}

- (void)screenCaptureController:(id)a3 didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a4 transformFlags:(unint64_t)a5
{
  id v8;
  __CVBuffer *ImageBuffer;
  size_t Width;
  size_t Height;
  size_t v12;
  void (**screenCaptureOutputHandler)(id, opaqueCMSampleBuffer *, unint64_t);
  float v14;
  float v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  double v21;
  __int16 v22;
  size_t v23;
  __int16 v24;
  int v25;

  v8 = a3;
  if (a4)
  {
    if (!self->super._screenCaptureDidStart)
    {
      if (self->super._didStartScreenCaptureHandler)
      {
        self->super._screenCaptureDidStart = 1;
        (*((void (**)(void))self->super._didStartScreenCaptureHandler + 2))();
        v14 = sub_100047668(a4);
        if (dword_100095B40 <= 1)
        {
          v15 = v14;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v16 = 136446722;
            v17 = "-[RPScreenCaptureManagerIOS screenCaptureController:didReceiveSampleBuffer:transformFlags:]";
            v18 = 1024;
            v19 = 171;
            v20 = 2048;
            v21 = v15;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d first sample received at time %.3f", (uint8_t *)&v16, 0x1Cu);
          }
        }
      }
    }
    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    Width = CVPixelBufferGetWidth(ImageBuffer);
    Height = CVPixelBufferGetHeight(ImageBuffer);
    if (dword_100095B40 <= 1)
    {
      v12 = Height;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136447234;
        v17 = "-[RPScreenCaptureManagerIOS screenCaptureController:didReceiveSampleBuffer:transformFlags:]";
        v18 = 1024;
        v19 = 177;
        v20 = 2048;
        v21 = *(double *)&Width;
        v22 = 2048;
        v23 = v12;
        v24 = 1024;
        v25 = a5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d screen sampled at window size width:%zu heigth:%zu transformFlags %d", (uint8_t *)&v16, 0x2Cu);
      }
    }
    screenCaptureOutputHandler = (void (**)(id, opaqueCMSampleBuffer *, unint64_t))self->super._screenCaptureOutputHandler;
    if (screenCaptureOutputHandler)
      screenCaptureOutputHandler[2](screenCaptureOutputHandler, a4, a5);
  }

}

- (void)handleScreenCaptureFailureWithError:(id)a3
{
  id v4;

  v4 = a3;
  -[RPScreenCaptureManagerIOS stop](self, "stop");
  -[RPScreenCaptureManagerProtocol screenCaptureDidFailWithError:](self->super._delegate, "screenCaptureDidFailWithError:", v4);

}

- (void)screenCaptureController:(id)a3 didFailWithStatus:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSErrorUserInfoKey v11;
  void *v12;

  v6 = a3;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004DCA0();
  if (a4 == -12073)
  {
    v10 = -5803;
LABEL_9:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", v10, 0));
    -[RPScreenCaptureManagerIOS handleScreenCaptureFailureWithError:](self, "handleScreenCaptureFailureWithError:", v9);
    goto LABEL_10;
  }
  if (a4 != -1030)
  {
    v10 = -5817;
    goto LABEL_9;
  }
  v11 = NSLocalizedDescriptionKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("RECORDING_ERROR_FAILED_TO_START_LIGHTING")));
  v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ReplayKit.RPRecordingErrorDomain"), -5803, v8));
  (*((void (**)(void))self->super._didStartScreenCaptureHandler + 2))();

LABEL_10:
}

- (void)screenCaptureControllerWasPreempted:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004DD30();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5806, 0));
  -[RPScreenCaptureManagerIOS handleScreenCaptureFailureWithError:](self, "handleScreenCaptureFailureWithError:", v5);

}

- (void)screenCaptureControllerMediaServicesWereReset:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004DDAC();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5817, 0));
  -[RPScreenCaptureManagerIOS handleScreenCaptureFailureWithError:](self, "handleScreenCaptureFailureWithError:", v5);

}

- (void)screenCaptureControllerDidReceiveClearScreen:(id)a3
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v3 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPScreenCaptureManagerIOS screenCaptureControllerDidReceiveClearScreen:]";
    v6 = 1024;
    v7 = 228;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d repeated clear screen likely DRM playback", (uint8_t *)&v4, 0x12u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenCaptureController, 0);
}

@end
