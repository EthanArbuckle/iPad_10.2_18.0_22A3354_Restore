@implementation RPCaptureSession

- (void)startCaptureWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7
{
  double height;
  double width;
  _BOOL8 v10;
  _BOOL8 v11;
  id v13;
  void (**v14)(id, void *);
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  RPCaptureSession *v22;
  __int16 v23;
  unsigned int v24;

  height = a6.height;
  width = a6.width;
  v10 = a4;
  v11 = a3;
  v13 = a5;
  v14 = (void (**)(id, void *))a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPCaptureSession startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
    v19 = 1024;
    v20 = 35;
    v21 = 2048;
    v22 = self;
    v23 = 1024;
    v24 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p starting in session state %d", buf, 0x22u);
  }
  if (-[RPSession sessionState](self, "sessionState") != 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPCaptureSession: attempting to start capture session when session was not in stopped state", buf, 2u);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5830, 0));
    -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v15);
    if (!v14)
      goto LABEL_16;
LABEL_14:
    v14[2](v14, v15);
    goto LABEL_16;
  }
  v16.receiver = self;
  v16.super_class = (Class)RPCaptureSession;
  -[RPSession startWithContextID:windowSize:](&v16, "startWithContextID:windowSize:", v13, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:](self, "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:", v11, v10, width, height));
  if (!v15)
  {
    -[RPCaptureSession presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:](self, "presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:", v11, v10, v14);
    goto LABEL_16;
  }
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100051E7C((uint64_t)v15);
  -[RPSession setSessionState:](self, "setSessionState:", 3);
  if (v14)
    goto LABEL_14;
LABEL_16:

}

- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t callingPID;
  _BOOL8 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:](self, "getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:", v6, v5))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
    callingPID = self->super._callingPID;
    v11 = -[RPSession microphoneEnabled](self, "microphoneEnabled");
    -[RPSession windowSize](self, "windowSize");
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession contextID](self, "contextID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v16));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000452CC;
    v19[3] = &unk_100081390;
    v19[4] = self;
    v20 = v8;
    objc_msgSend(v9, "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:didStartHandler:", self, callingPID, v11, 0, v17, v19, v13, v15);

  }
  else
  {
    -[RPSession setSessionState:](self, "setSessionState:", 3);
    if (v8)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5801, 0));
      (*((void (**)(id, void *))v8 + 2))(v8, v18);

    }
  }

}

- (void)stopCaptureWithHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  RPCaptureSession *v12;
  __int16 v13;
  unsigned int v14;

  v4 = (void (**)(id, void *))a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446978;
    v8 = "-[RPCaptureSession stopCaptureWithHandler:]";
    v9 = 1024;
    v10 = 108;
    v11 = 2048;
    v12 = self;
    v13 = 1024;
    v14 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", (uint8_t *)&v7, 0x22u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 3
    || !-[RPSession sessionState](self, "sessionState")
    || -[RPSession sessionState](self, "sessionState") == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5829, 0));
    -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v5);
    if (v4)
      v4[2](v4, v5);

  }
  else
  {
    -[RPSession setSessionState:](self, "setSessionState:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
    objc_msgSend(v6, "stopCaptureForDelegate:", self);

    -[RPSession setSessionState:](self, "setSessionState:", 3);
    -[RPSession reportSummaryEvent:recordedFileSize:](self, "reportSummaryEvent:recordedFileSize:", 0, 0);
    if (v4)
      v4[2](v4, 0);
  }

}

- (void)pauseSession
{
  void *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  RPCaptureSession *v10;
  __int16 v11;
  unsigned int v12;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v6 = "-[RPCaptureSession pauseSession]";
    v7 = 1024;
    v8 = 136;
    v9 = 2048;
    v10 = self;
    v11 = 1024;
    v12 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p pausing in session state %d", buf, 0x22u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
    objc_msgSend(v3, "stopCaptureForDelegate:", self);

    -[RPClientProtocol recordingDidPause](self->super._clientProxy, "recordingDidPause");
    v4.receiver = self;
    v4.super_class = (Class)RPCaptureSession;
    -[RPSession pauseSession](&v4, "pauseSession");
  }
}

- (id)dispatchCaptureQueue
{
  if (qword_100095D28 != -1)
    dispatch_once(&qword_100095D28, &stru_100082198);
  return (id)qword_100095D20;
}

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  uint64_t v6;
  uint64_t v8;
  RPCaptureSession *v9;
  opaqueCMSampleBuffer *v10;
  uint64_t v11;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;

  v6 = *(_QWORD *)&a3;
  if (-[RPSession sessionState](self, "sessionState", *(_QWORD *)&a3, a4, a5) == 1)
  {
    -[RPSession updateReportingSampleCount:](self, "updateReportingSampleCount:", v6);
    if ((_DWORD)v6 == 2)
    {
      if (!-[RPSession microphoneEnabled](self, "microphoneEnabled"))
      {
        DataBuffer = CMSampleBufferGetDataBuffer(a4);
        DataLength = CMBlockBufferGetDataLength(DataBuffer);
        CMBlockBufferFillDataBytes(0, DataBuffer, 0, DataLength);
      }
      v9 = self;
      v10 = a4;
      v11 = 3;
    }
    else
    {
      if ((_DWORD)v6 != 1)
      {
        if (!(_DWORD)v6)
          -[RPCaptureSession processVideoSampleBuffer:](self, "processVideoSampleBuffer:", a4, v8);
        return;
      }
      v9 = self;
      v10 = a4;
      v11 = 2;
    }
    -[RPCaptureSession packageAudioSampleBufferForCapture:withType:](v9, "packageAudioSampleBufferForCapture:withType:", v10, v11);
  }
}

- (void)captureDidFailWithError:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  RPCaptureSession *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000458A0;
  v5[3] = &unk_100080FF0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[RPCaptureSession stopCaptureWithHandler:](self, "stopCaptureWithHandler:", v5);

}

- (void)processVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CVImageBufferRef ImageBuffer;
  IOSurfaceRef IOSurface;
  RPIOSurfaceObject *v7;
  void *v8;
  CMSampleTimingInfo v9;

  if (-[RPSession sessionState](self, "sessionState") == 4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9.duration.value) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "session is paused discard sample", (uint8_t *)&v9, 2u);
    }
  }
  else
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    CFRetain(ImageBuffer);
    IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
    v7 = objc_alloc_init(RPIOSurfaceObject);
    -[RPIOSurfaceObject setIOSurface:](v7, "setIOSurface:", IOSurface);
    memset(&v9, 0, sizeof(v9));
    CMSampleBufferGetSampleTimingInfo(a3, 0, &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v9, 72));
    -[RPClientProtocol captureHandlerWithSample:timingData:](self->super._clientProxy, "captureHandlerWithSample:timingData:", v7, v8);
    CFRelease(ImageBuffer);

  }
}

- (void)packageAudioSampleBufferForCapture:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4
{
  id v6;
  id v7;

  v6 = sub_100046C34(a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[RPClientProtocol captureHandlerWithAudioSample:bufferType:](self->super._clientProxy, "captureHandlerWithAudioSample:bufferType:", v7, a4);

}

- (void)handleDisplayWarning
{
  _QWORD v3[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  unsigned int v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPCaptureSession handleDisplayWarning]";
    v6 = 1024;
    v7 = 246;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100045BD8;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPCaptureSession stopCaptureWithHandler:](self, "stopCaptureWithHandler:", v3);
  }
}

- (void)handleDeviceLockedWarning
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  unsigned int v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446722;
    v4 = "-[RPCaptureSession handleDeviceLockedWarning]";
    v5 = 1024;
    v6 = 257;
    v7 = 1024;
    v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
}

- (void)handleDeviceRestrictionWarning
{
  _QWORD v3[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  unsigned int v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPCaptureSession handleDeviceRestrictionWarning]";
    v6 = 1024;
    v7 = 275;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100045EB4;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPCaptureSession stopCaptureWithHandler:](self, "stopCaptureWithHandler:", v3);
  }
}

- (void)handleResumeContextIDFailure
{
  _QWORD v3[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  unsigned int v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPCaptureSession handleResumeContextIDFailure]";
    v6 = 1024;
    v7 = 287;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000460B8;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPCaptureSession stopCaptureWithHandler:](self, "stopCaptureWithHandler:", v3);
  }
}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t callingPID;
  _BOOL8 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  RPCaptureSession *v22;
  __int16 v23;
  unsigned int v24;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPCaptureSession handleResumeCaptureWithCompletionHandler:]";
    v19 = 1024;
    v20 = 297;
    v21 = 2048;
    v22 = self;
    v23 = 1024;
    v24 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  self->super._sessionIsResuming = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
  callingPID = self->super._callingPID;
  v7 = -[RPSession microphoneEnabled](self, "microphoneEnabled");
  -[RPSession windowSize](self, "windowSize");
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession contextID](self, "contextID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v12));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004638C;
  v15[3] = &unk_100081390;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  objc_msgSend(v5, "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:didStartHandler:", self, callingPID, v7, 0, v13, v15, v9, v11);

}

- (void)handleClientApplicationDidEnterBackground
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  unsigned int v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446722;
    v4 = "-[RPCaptureSession handleClientApplicationDidEnterBackground]";
    v5 = 1024;
    v6 = 318;
    v7 = 1024;
    v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  -[RPCaptureSession pauseSession](self, "pauseSession");
}

- (void)handleClientApplicationDidEnterForeground
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  unsigned int v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446722;
    v4 = "-[RPCaptureSession handleClientApplicationDidEnterForeground]";
    v5 = 1024;
    v6 = 325;
    v7 = 1024;
    v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 4)
    -[RPClientProtocol shouldResumeSessionType:](self->super._clientProxy, "shouldResumeSessionType:", CFSTR("RPInAppCapture"));
}

@end
