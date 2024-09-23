@implementation RPRecordSession

- (id)outputPath
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession bundleID](self, "bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputPath:bundleID:", 0, v4));

  return v5;
}

- (void)startRecordingWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7
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
  RPRecordSession *v22;
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
    v18 = "-[RPRecordSession startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
    v19 = 1024;
    v20 = 45;
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
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordSession: attempting to start record session when session was not in stopped state", buf, 2u);
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
  v16.super_class = (Class)RPRecordSession;
  -[RPSession startWithContextID:windowSize:](&v16, "startWithContextID:windowSize:", v13, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:](self, "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:", v11, v10, width, height));
  if (!v15)
  {
    -[RPRecordSession presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:](self, "presentAcknowledgmentWithMicrophoneEnabled:cameraEnabled:withHandler:", v11, v10, v14);
    goto LABEL_16;
  }
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100052770((uint64_t)v15);
  -[RPSession setSessionState:](self, "setSessionState:", 3);
  if (v14)
    goto LABEL_14;
LABEL_16:

}

- (void)stopRecordingWithHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  RPMovieWriter *movieWriter;
  _QWORD v8[5];
  void (**v9)(id, _QWORD, void *);
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  RPRecordSession *v15;
  __int16 v16;
  unsigned int v17;

  v4 = (void (**)(id, _QWORD, void *))a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v11 = "-[RPRecordSession stopRecordingWithHandler:]";
    v12 = 1024;
    v13 = 85;
    v14 = 2048;
    v15 = self;
    v16 = 1024;
    v17 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", buf, 0x22u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 3
    || !-[RPSession sessionState](self, "sessionState")
    || -[RPSession sessionState](self, "sessionState") == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5829, 0));
    -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v5);
    if (v4)
      v4[2](v4, 0, v5);

  }
  else
  {
    -[RPSession setSessionState:](self, "setSessionState:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
    objc_msgSend(v6, "stopCaptureForDelegate:", self);

    movieWriter = self->_movieWriter;
    if (movieWriter)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10004A6F4;
      v8[3] = &unk_1000813B8;
      v8[4] = self;
      v9 = v4;
      -[RPMovieWriter finishWritingWithHandler:](movieWriter, "finishWritingWithHandler:", v8);

    }
    else
    {
      -[RPSession setSessionState:](self, "setSessionState:", 3);
      -[RPSession reportSummaryEvent:recordedFileSize:](self, "reportSummaryEvent:recordedFileSize:", -5824, 0);
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v11 = "-[RPRecordSession stopRecordingWithHandler:]";
        v12 = 1024;
        v13 = 122;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d no movie writer instance when attempting to stop", buf, 0x12u);
      }
      if (v4)
        v4[2](v4, 0, 0);
    }
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
  RPRecordSession *v10;
  __int16 v11;
  unsigned int v12;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v6 = "-[RPRecordSession pauseSession]";
    v7 = 1024;
    v8 = 131;
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

    -[RPMovieWriter notifyRecordingMayBeStopped](self->_movieWriter, "notifyRecordingMayBeStopped");
    -[RPClientProtocol recordingDidPause](self->super._clientProxy, "recordingDidPause");
    v4.receiver = self;
    v4.super_class = (Class)RPRecordSession;
    -[RPSession pauseSession](&v4, "pauseSession");
  }
}

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSURL *currentRecordingURL;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (-[RPSession sessionState](self, "sessionState") == 3 && self->_currentRecordingURL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    currentRecordingURL = self->_currentRecordingURL;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004AAB0;
    v7[3] = &unk_100081390;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "_srRemoveFile:completion:", currentRecordingURL, v7);

  }
}

- (id)dispatchCaptureQueue
{
  if (qword_100095D60 != -1)
    dispatch_once(&qword_100095D60, &stru_1000822D8);
  return (id)qword_100095D58;
}

- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  RPMovieWriter *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  RPMovieWriter *v15;
  RPMovieWriter *movieWriter;
  RPMovieWriter *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:](self, "getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:", v6, v5))
  {
    v9 = [RPMovieWriter alloc];
    -[RPSession windowSize](self, "windowSize");
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordSession outputPath](self, "outputPath"));
    v15 = -[RPMovieWriter initWithWindowSize:outputPath:](v9, "initWithWindowSize:outputPath:", v14, v11, v13);
    movieWriter = self->_movieWriter;
    self->_movieWriter = v15;

    v17 = self->_movieWriter;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004ACEC;
    v19[3] = &unk_100081390;
    v19[4] = self;
    v20 = v8;
    -[RPMovieWriter startWritingHandler:](v17, "startWritingHandler:", v19);

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
  uint64_t v7;
  _QWORD v9[6];
  int v10;

  v7 = *(_QWORD *)&a3;
  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    -[RPSession updateReportingSampleCount:](self, "updateReportingSampleCount:", v7);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004B090;
    v9[3] = &unk_100081FF0;
    v10 = v7;
    v9[4] = self;
    v9[5] = a5;
    -[RPSession updatePauseOffsetForSampleBuffer:withSampleType:handler:](self, "updatePauseOffsetForSampleBuffer:withSampleType:handler:", a4, v7, v9);
  }
}

- (void)captureDidFailWithError:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  RPRecordSession *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004B1E4;
  v5[3] = &unk_100082300;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[RPRecordSession stopRecordingWithHandler:](self, "stopRecordingWithHandler:", v5);

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
  RPRecordSession *v22;
  __int16 v23;
  unsigned int v24;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPRecordSession handleResumeCaptureWithCompletionHandler:]";
    v19 = 1024;
    v20 = 277;
    v21 = 2048;
    v22 = self;
    v23 = 1024;
    v24 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  self->super._sessionIsResuming = 1;
  -[RPMovieWriter notifyRecordingResumed](self->_movieWriter, "notifyRecordingResumed");
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
  v15[2] = sub_10004B48C;
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
    v4 = "-[RPRecordSession handleClientApplicationDidEnterBackground]";
    v5 = 1024;
    v6 = 300;
    v7 = 1024;
    v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  -[RPRecordSession pauseSession](self, "pauseSession");
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
    v4 = "-[RPRecordSession handleClientApplicationDidEnterForeground]";
    v5 = 1024;
    v6 = 307;
    v7 = 1024;
    v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 4)
    -[RPClientProtocol shouldResumeSessionType:](self->super._clientProxy, "shouldResumeSessionType:", CFSTR("RPInAppRecording"));
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
    v5 = "-[RPRecordSession handleDisplayWarning]";
    v6 = 1024;
    v7 = 317;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004B8AC;
    v3[3] = &unk_100082328;
    v3[4] = self;
    -[RPRecordSession stopRecordingWithHandler:](self, "stopRecordingWithHandler:", v3);
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
    v4 = "-[RPRecordSession handleDeviceLockedWarning]";
    v5 = 1024;
    v6 = 328;
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
    v5 = "-[RPRecordSession handleDeviceRestrictionWarning]";
    v6 = 1024;
    v7 = 346;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004BB88;
    v3[3] = &unk_100082328;
    v3[4] = self;
    -[RPRecordSession stopRecordingWithHandler:](self, "stopRecordingWithHandler:", v3);
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
    v5 = "-[RPRecordSession handleResumeContextIDFailure]";
    v6 = 1024;
    v7 = 358;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004BD8C;
    v3[3] = &unk_100082328;
    v3[4] = self;
    -[RPRecordSession stopRecordingWithHandler:](self, "stopRecordingWithHandler:", v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRecordingURL, 0);
  objc_storeStrong((id *)&self->_movieWriter, 0);
}

@end
