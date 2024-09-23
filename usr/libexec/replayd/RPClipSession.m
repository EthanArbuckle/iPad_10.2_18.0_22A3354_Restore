@implementation RPClipSession

- (void)startClipWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7
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
  RPClipSession *v22;
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
    v18 = "-[RPClipSession startClipWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
    v19 = 1024;
    v20 = 50;
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
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClipSession: attempting to start clip session when session was not in stopped state", buf, 2u);
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
  v16.super_class = (Class)RPClipSession;
  -[RPSession startWithContextID:windowSize:](&v16, "startWithContextID:windowSize:", v13, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:](self, "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:", v11, v10, width, height));
  if (!v15)
  {
    -[RPClipSession presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:](self, "presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:", v11, v10, v14);
    goto LABEL_16;
  }
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004DE28();
  -[RPSession setSessionState:](self, "setSessionState:", 3);
  if (v14)
    goto LABEL_14;
LABEL_16:

}

- (void)stopClipWithHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  OpaqueVTCompressionSession *encodeSession;
  OpaqueVTCompressionSession *v8;
  _BYTE v9[28];
  __int16 v10;
  unsigned int v11;

  v4 = (void (**)(id, void *))a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v9 = 136446978;
    *(_QWORD *)&v9[4] = "-[RPClipSession stopClipWithHandler:]";
    *(_WORD *)&v9[12] = 1024;
    *(_DWORD *)&v9[14] = 91;
    *(_WORD *)&v9[18] = 2048;
    *(_QWORD *)&v9[20] = self;
    v10 = 1024;
    v11 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", v9, 0x22u);
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

    encodeSession = self->_encodeSession;
    *(_OWORD *)v9 = *(_OWORD *)&kCMTimeInvalid.value;
    *(_QWORD *)&v9[16] = kCMTimeInvalid.epoch;
    VTCompressionSessionCompleteFrames(encodeSession, (CMTime *)v9);
    VTCompressionSessionInvalidate(self->_encodeSession);
    v8 = self->_encodeSession;
    if (v8)
      CFRelease(v8);
    self->_encodeSession = 0;
    -[RPClipWriter flushClipBuffer](self->_clipWriter, "flushClipBuffer");
    -[RPSession reportSummaryEvent:recordedFileSize:](self, "reportSummaryEvent:recordedFileSize:", 0, 0);
    -[RPSession setSessionState:](self, "setSessionState:", 3);
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
  RPClipSession *v10;
  __int16 v11;
  unsigned int v12;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v6 = "-[RPClipSession pauseSession]";
    v7 = 1024;
    v8 = 125;
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

    -[RPClipWriter flushClipBuffer](self->_clipWriter, "flushClipBuffer");
    -[RPClientProtocol recordingDidPause](self->super._clientProxy, "recordingDidPause");
    v4.receiver = self;
    v4.super_class = (Class)RPClipSession;
    -[RPSession pauseSession](&v4, "pauseSession");
  }
}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  double v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, void *);
  double v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v19 = "-[RPClipSession exportClipToURL:duration:completionHandler:]";
    v20 = 1024;
    v21 = 136;
    v22 = 2048;
    v23 = (uint64_t)self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v10 = 15.0;
  if (a4 <= 15.0)
  {
    if (a4 > 0.0)
    {
LABEL_13:
      v10 = a4;
      goto LABEL_14;
    }
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10004DEB0();
      if (v9)
        goto LABEL_12;
    }
    else if (v9)
    {
LABEL_12:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5834, 0));
      v9[2](v9, v11);

      goto LABEL_13;
    }
    if (-[RPSession sessionState](self, "sessionState") != 1)
      goto LABEL_18;
    goto LABEL_15;
  }
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v19 = "-[RPClipSession exportClipToURL:duration:completionHandler:]";
    v20 = 1024;
    v21 = 138;
    v22 = 2048;
    v23 = 0x402E000000000000;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d clipping to maximum length %f seconds", buf, 0x1Cu);
  }
LABEL_14:
  a4 = v10;
  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
LABEL_15:
    v12 = objc_claimAutoreleasedReturnValue(-[RPClipSession dispatchCaptureQueue](self, "dispatchCaptureQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001B2CC;
    v14[3] = &unk_100081650;
    v14[4] = self;
    v15 = v8;
    v17 = a4;
    v16 = v9;
    dispatch_async(v12, v14);

    goto LABEL_18;
  }
  if (v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5829, 0));
    v9[2](v9, v13);

  }
LABEL_18:

}

- (void)encodeBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *v5;
  _QWORD v6[6];

  CFRetain(a3);
  v5 = objc_claimAutoreleasedReturnValue(-[RPClipSession dispatchCaptureQueue](self, "dispatchCaptureQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001B528;
  v6[3] = &unk_100080EE0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)createEncodingSessionWithWidth:(int)a3 withHeight:(int)a4
{
  RPClipWriter *outputCallbackRefCon;
  OpaqueVTCompressionSession **p_encodeSession;
  CFNumberRef v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v11 = "-[RPClipSession createEncodingSessionWithWidth:withHeight:]";
    v12 = 1024;
    v13 = 202;
    v14 = 1024;
    v15 = a3;
    v16 = 1024;
    v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d VTCompressionSessionCreate w:%d h:%d", buf, 0x1Eu);
  }
  outputCallbackRefCon = self->_clipWriter;
  p_encodeSession = &self->_encodeSession;
  if (VTCompressionSessionCreate(kCFAllocatorDefault, a3, a4, 0x61766331u, 0, 0, kCFAllocatorDefault, (VTCompressionOutputCallback)sub_10001B850, outputCallbackRefCon, p_encodeSession))
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004E030();
  }
  else
  {
    VTSessionSetProperty(*p_encodeSession, kVTCompressionPropertyKey_RealTime, kCFBooleanTrue);
    *(_DWORD *)buf = 1056964608;
    v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloat32Type, buf);
    VTSessionSetProperty(*p_encodeSession, kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration, v9);
    CFRelease(v9);
  }
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
    v19[2] = sub_10001BA90;
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

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  id v8;
  void *v9;
  CMSampleBufferRef v10;
  CMSampleBufferRef v11;

  if (a4)
  {
    -[RPSession updateReportingSampleCount:](self, "updateReportingSampleCount:", *(_QWORD *)&a3, a4, a5);
    if (a3)
    {
      v8 = sub_100046C34(a4, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = sub_100046E54(v9);
      if (v10)
      {
        v11 = v10;
        if (a3 == 2)
        {
          -[RPClipWriter appendAudio2SampleBuffer:](self->_clipWriter, "appendAudio2SampleBuffer:", v10);
        }
        else if (a3 == 1)
        {
          -[RPClipWriter appendAudio1SampleBuffer:](self->_clipWriter, "appendAudio1SampleBuffer:", v10);
        }
        CFRelease(v11);
      }
      else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10004E220();
      }

    }
    else
    {
      -[RPClipSession encodeBuffer:](self, "encodeBuffer:", a4);
    }
  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004E1A4();
  }
}

- (void)captureDidFailWithError:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  RPClipSession *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001BD9C;
  v5[3] = &unk_100080FF0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[RPClipSession stopClipWithHandler:](self, "stopClipWithHandler:", v5);

}

- (id)dispatchCaptureQueue
{
  if (qword_100095BB0 != -1)
    dispatch_once(&qword_100095BB0, &stru_100081670);
  return (id)qword_100095BA8;
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
  RPClipSession *v22;
  __int16 v23;
  unsigned int v24;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPClipSession handleResumeCaptureWithCompletionHandler:]";
    v19 = 1024;
    v20 = 342;
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
  v15[2] = sub_10001C090;
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
    v4 = "-[RPClipSession handleClientApplicationDidEnterBackground]";
    v5 = 1024;
    v6 = 364;
    v7 = 1024;
    v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  -[RPClipSession pauseSession](self, "pauseSession");
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
    v4 = "-[RPClipSession handleClientApplicationDidEnterForeground]";
    v5 = 1024;
    v6 = 371;
    v7 = 1024;
    v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 4)
    -[RPClientProtocol shouldResumeSessionType:](self->super._clientProxy, "shouldResumeSessionType:", CFSTR("RPInAppClip"));
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
    v5 = "-[RPClipSession handleDisplayWarning]";
    v6 = 1024;
    v7 = 381;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001C4B0;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPClipSession stopClipWithHandler:](self, "stopClipWithHandler:", v3);
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
    v4 = "-[RPClipSession handleDeviceLockedWarning]";
    v5 = 1024;
    v6 = 392;
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
    v5 = "-[RPClipSession handleDeviceRestrictionWarning]";
    v6 = 1024;
    v7 = 410;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001C78C;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPClipSession stopClipWithHandler:](self, "stopClipWithHandler:", v3);
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
    v5 = "-[RPClipSession handleResumeContextIDFailure]";
    v6 = 1024;
    v7 = 422;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001C990;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPClipSession stopClipWithHandler:](self, "stopClipWithHandler:", v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipWriter, 0);
}

@end
