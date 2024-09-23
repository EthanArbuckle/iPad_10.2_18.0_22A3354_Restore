@implementation RPSystemRecordSession

- (id)outputPath
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession bundleID](self, "bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputPath:bundleID:", 2, v4));

  return v5;
}

- (void)startSystemRecordingWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7
{
  double height;
  double width;
  _BOOL8 v10;
  _BOOL8 v11;
  id v13;
  void (**v14)(id, void *);
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  unsigned int v25;
  id *v26;
  id v27;
  RPMovieWriter *v28;
  void *v29;
  RPMovieWriter *v30;
  RPMovieWriter *movieWriter;
  RPMovieWriter *v32;
  void (**v33)(id, void *);
  void *v34;
  _QWORD v35[5];
  void (**v36)(id, void *);
  _QWORD v37[5];
  objc_super v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  RPSystemRecordSession *v44;
  __int16 v45;
  unsigned int v46;

  height = a6.height;
  width = a6.width;
  v10 = a4;
  v11 = a3;
  v13 = a5;
  v14 = (void (**)(id, void *))a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v40 = "-[RPSystemRecordSession startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
    v41 = 1024;
    v42 = 47;
    v43 = 2048;
    v44 = self;
    v45 = 1024;
    v46 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p starting in session state %d", buf, 0x22u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:](self, "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:", v11, v10, width, height));
  if (v15)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000517A0();
    if (objc_msgSend(v15, "code") == (id)-5805)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5805, 0));
      -[RPSession showAlertRecordingCaptureSessionWithError:](self, "showAlertRecordingCaptureSessionWithError:", v16);

    }
    -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v15);
    if (v14)
      v14[2](v14, v15);
  }
  else
  {
    v38.receiver = self;
    v38.super_class = (Class)RPSystemRecordSession;
    -[RPSession startWithContextID:windowSize:](&v38, "startWithContextID:windowSize:", v13, width, height);
    if (-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:](self, "getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:", v11, v10))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPFeatureFlagUtility sharedInstance](RPFeatureFlagUtility, "sharedInstance"));
      v18 = objc_msgSend(v17, "systemBannerEnabled");

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[RPAngelProxy sharedInstance](RPAngelProxy, "sharedInstance"));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10003F9A4;
        v37[3] = &unk_100081FC8;
        v37[4] = self;
        objc_msgSend(v19, "connectToAngelWithCompletionHandler:", v37);

      }
      -[RPSystemRecordSession adjustedWindowSizeForSystemRecording](self, "adjustedWindowSizeForSystemRecording");
      v21 = v20;
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[RPFeatureFlagUtility sharedInstance](RPFeatureFlagUtility, "sharedInstance"));
      v25 = objc_msgSend(v24, "replayKitScreenRecordingHEVC");
      v26 = (id *)&AVVideoCodecTypeHEVC;
      if (!v25)
        v26 = (id *)&AVVideoCodecTypeH264;
      v27 = *v26;

      v28 = [RPMovieWriter alloc];
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPSystemRecordSession outputPath](self, "outputPath"));
      v30 = -[RPMovieWriter initWithWindowSize:outputPath:videoCodecType:](v28, "initWithWindowSize:outputPath:videoCodecType:", v29, v27, v21, v23);
      movieWriter = self->_movieWriter;
      self->_movieWriter = v30;

      v32 = self->_movieWriter;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10003FB04;
      v35[3] = &unk_100081390;
      v35[4] = self;
      v33 = v14;

      v36 = v33;
      -[RPMovieWriter startWritingHandler:](v32, "startWritingHandler:", v35);

    }
    else
    {
      -[RPSession setSessionState:](self, "setSessionState:", 3);
      if (v14)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5803, 0));
        v14[2](v14, v34);

      }
    }
  }

}

- (void)stopSystemRecordingWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RPMovieWriter *movieWriter;
  NSString *sessionID;
  _BOOL8 mixAudioTracks;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  RPSystemRecordSession *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  RPSystemRecordSession *v21;
  __int16 v22;
  unsigned int v23;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v17 = "-[RPSystemRecordSession stopSystemRecordingWithHandler:]";
    v18 = 1024;
    v19 = 154;
    v20 = 2048;
    v21 = self;
    v22 = 1024;
    v23 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", buf, 0x22u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
  objc_msgSend(v5, "stopCaptureForDelegate:", self);

  if (-[RPSession cameraEnabled](self, "cameraEnabled"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPAngelProxy sharedInstance](RPAngelProxy, "sharedInstance"));
    objc_msgSend(v6, "disableCameraPip");

  }
  movieWriter = self->_movieWriter;
  if (movieWriter)
  {
    sessionID = self->_sessionID;
    mixAudioTracks = self->_mixAudioTracks;
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1000400D4;
    v13 = &unk_100081390;
    v14 = self;
    v15 = v4;
    -[RPMovieWriter finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:](movieWriter, "finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:", sessionID, mixAudioTracks, &v10);

  }
  else
  {
    -[RPSession setSessionState:](self, "setSessionState:", 3);
    -[RPSession reportSummaryEvent:recordedFileSize:](self, "reportSummaryEvent:recordedFileSize:", -5824, 0);
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[RPSystemRecordSession stopSystemRecordingWithHandler:]";
      v18 = 1024;
      v19 = 190;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d no movie writer instance when attempting to stop", buf, 0x12u);
    }
    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }
  -[RPSession clearSystemRecordingUI](self, "clearSystemRecordingUI", v10, v11, v12, v13, v14);
  -[RPSession checkAndPlaySystemSessionSound:](self, "checkAndPlaySystemSessionSound:", 0);

}

- (void)stopSystemRecordingWithURLHandler:(id)a3
{
  id v4;
  void *v5;
  RPMovieWriter *movieWriter;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  RPSystemRecordSession *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  RPSystemRecordSession *v18;
  __int16 v19;
  unsigned int v20;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v14 = "-[RPSystemRecordSession stopSystemRecordingWithURLHandler:]";
    v15 = 1024;
    v16 = 206;
    v17 = 2048;
    v18 = self;
    v19 = 1024;
    v20 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", buf, 0x22u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
  objc_msgSend(v5, "stopCaptureForDelegate:", self);

  movieWriter = self->_movieWriter;
  if (movieWriter)
  {
    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = sub_100040464;
    v10 = &unk_1000813B8;
    v11 = self;
    v12 = v4;
    -[RPMovieWriter finishWritingWithHandler:](movieWriter, "finishWritingWithHandler:", &v7);

  }
  else
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100051918();
    -[RPSession setSessionState:](self, "setSessionState:", 3);
    -[RPSession reportSummaryEvent:recordedFileSize:](self, "reportSummaryEvent:recordedFileSize:", -5824, 0);
    if (v4)
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
  -[RPSession clearSystemRecordingUI](self, "clearSystemRecordingUI", v7, v8, v9, v10, v11);
  -[RPSession checkAndPlaySystemSessionSound:](self, "checkAndPlaySystemSessionSound:", 0);

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
  RPSystemRecordSession *v10;
  __int16 v11;
  unsigned int v12;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v6 = "-[RPSystemRecordSession pauseSession]";
    v7 = 1024;
    v8 = 248;
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
    -[RPMovieWriter notifyRecordingMayBeStopped](self->_movieWriter, "notifyRecordingMayBeStopped");
    v4.receiver = self;
    v4.super_class = (Class)RPSystemRecordSession;
    -[RPSession pauseSession](&v4, "pauseSession");
  }
}

- (void)setCaptureMicrophoneEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[RPSession setMicrophoneEnabled:](self, "setMicrophoneEnabled:");
  if (v3)
  {
    self->_mixAudioTracks = 1;
    if (-[RPSession sessionState](self, "sessionState") == 1 && v3)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
      objc_msgSend(v5, "enableMicrophone");

    }
  }
  else
  {
    -[RPSession sessionState](self, "sessionState");
  }
}

- (CGSize)adjustedWindowSizeForSystemRecording
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  CGSize result;

  -[RPSession windowSize](self, "windowSize");
  v3 = v2;
  v5 = v4;
  if ((((v2 > v4) ^ +[RPHardwareUtility isNativeScreenOrientationPortrait](RPHardwareUtility, "isNativeScreenOrientationPortrait")) & 1) != 0)
  {
    v6 = v5;
    v5 = v3;
    v3 = v6;
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446978;
    v10 = "-[RPSystemRecordSession adjustedWindowSizeForSystemRecording]";
    v11 = 1024;
    v12 = 275;
    v13 = 2048;
    v14 = v5;
    v15 = 2048;
    v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d rotating to window size width %.1f x height:%.1f", (uint8_t *)&v9, 0x26u);
  }
  v7 = v5;
  v8 = v3;
  result.height = v8;
  result.width = v7;
  return result;
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
    v9[2] = sub_1000409CC;
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
  RPSystemRecordSession *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100040B20;
  v5[3] = &unk_100080FF0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v5);

}

- (id)dispatchCaptureQueue
{
  if (qword_100095D08 != -1)
    dispatch_once(&qword_100095D08, &stru_100082010);
  return (id)qword_100095D00;
}

- (void)handleSystemAlertStop
{
  _QWORD v3[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v5 = "-[RPSystemRecordSession handleSystemAlertStop]";
    v6 = 1024;
    v7 = 332;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100040D34;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v3);
  }
}

- (void)handleMemoryWarning
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  _QWORD *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[RPSystemRecordSession handleMemoryWarning]";
    v13 = 1024;
    v14 = 344;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v4 = objc_msgSend(v3, "_srDeviceHasSufficientFreeSpaceForRecording");

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = objc_msgSend(v5, "_srDeviceHasSufficientSpaceForCurrentRecording");

    if (v4)
    {
      if (v6)
      {
        if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v12 = "-[RPSystemRecordSession handleMemoryWarning]";
          v13 = 1024;
          v14 = 352;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Disk space can still support current recording", buf, 0x12u);
        }
        return;
      }
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v12 = "-[RPSystemRecordSession handleMemoryWarning]";
        v13 = 1024;
        v14 = 355;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Disk space cannot support current continued recording, Stopping and discarding current recording", buf, 0x12u);
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000411A0;
      v10[3] = &unk_100081698;
      v10[4] = self;
      v7 = v10;
    }
    else if (v6)
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v12 = "-[RPSystemRecordSession handleMemoryWarning]";
        v13 = 1024;
        v14 = 367;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Crossed disk threshold: Disk space can support saving current recording", buf, 0x12u);
      }
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000412A8;
      v9[3] = &unk_100081698;
      v9[4] = self;
      v7 = v9;
    }
    else
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v12 = "-[RPSystemRecordSession handleMemoryWarning]";
        v13 = 1024;
        v14 = 376;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Crossed disk threshold: Disk space cannot support saving current recording", buf, 0x12u);
      }
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000413B0;
      v8[3] = &unk_100081698;
      v8[4] = self;
      v7 = v8;
    }
    -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v7);
  }
}

- (void)handleIncomingCallWarning
{
  _QWORD v3[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v5 = "-[RPSystemRecordSession handleIncomingCallWarning]";
    v6 = 1024;
    v7 = 389;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000415DC;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v3);
  }
}

- (void)handleDeviceLockedWarning
{
  _QWORD v3[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v5 = "-[RPSystemRecordSession handleDeviceLockedWarning]";
    v6 = 1024;
    v7 = 401;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000417D0;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v3);
  }
}

- (void)handleDeviceRestrictionWarning
{
  _QWORD v3[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v5 = "-[RPSystemRecordSession handleDeviceRestrictionWarning]";
    v6 = 1024;
    v7 = 413;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000419C4;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v3);
  }
}

- (void)handleTimerDidUpdate:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[RPSystemRecordSession handleTimerDidUpdate:]";
    v10 = 1024;
    v11 = 425;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPFeatureFlagUtility sharedInstance](RPFeatureFlagUtility, "sharedInstance"));
    v6 = objc_msgSend(v5, "systemBannerEnabled");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPAngelProxy sharedInstance](RPAngelProxy, "sharedInstance"));
      objc_msgSend(v7, "updateTimer:", v4);

    }
    -[RPClientProtocol recordingTimerDidUpdate:](self->super._clientProxy, "recordingTimerDidUpdate:", v4);
  }

}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  RPSystemRecordSession *v21;
  __int16 v22;
  unsigned int v23;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v17 = "-[RPSystemRecordSession handleResumeCaptureWithCompletionHandler:]";
    v18 = 1024;
    v19 = 439;
    v20 = 2048;
    v21 = self;
    v22 = 1024;
    v23 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  self->super._sessionIsResuming = 1;
  -[RPMovieWriter notifyRecordingResumed](self->_movieWriter, "notifyRecordingResumed");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
  v6 = -[RPSession microphoneEnabled](self, "microphoneEnabled");
  -[RPSession windowSize](self, "windowSize");
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession contextID](self, "contextID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v11));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100041DF0;
  v14[3] = &unk_100081390;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v5, "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:mixedRealityCamera:didStartHandler:", self, 0xFFFFFFFFLL, v6, 1, v12, 1, v8, v10, v14);

}

- (void)handleResumeContextIDFailure
{
  _QWORD v3[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v5 = "-[RPSystemRecordSession handleResumeContextIDFailure]";
    v6 = 1024;
    v7 = 460;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004201C;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPSystemRecordSession stopSystemRecordingWithHandler:](self, "stopSystemRecordingWithHandler:", v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_movieWriter, 0);
}

@end
