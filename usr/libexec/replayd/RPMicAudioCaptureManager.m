@implementation RPMicAudioCaptureManager

+ (AudioStreamBasicDescription)audioStreamBasicDescriptionWithStereo:(SEL)a3
{
  UInt32 v4;
  UInt32 v5;

  retstr->mSampleRate = 44100.0;
  *(_QWORD *)&retstr->mFormatID = 0xE6C70636DLL;
  if (a4)
    v4 = 4;
  else
    v4 = 2;
  if (a4)
    v5 = 2;
  else
    v5 = 1;
  retstr->mBytesPerFrame = v4;
  retstr->mChannelsPerFrame = v5;
  retstr->mBytesPerPacket = v4;
  retstr->mFramesPerPacket = 1;
  *(_QWORD *)&retstr->mBitsPerChannel = 16;
  return result;
}

- (void)handleAudioSessionInterruption:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", AVAudioSessionInterruptionTypeKey));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6)
  {
    if (v6 == (id)1)
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136446466;
        v8 = "-[RPMicAudioCaptureManager handleAudioSessionInterruption:]";
        v9 = 1024;
        v10 = 83;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAudioSessionInterruptionTypeBegan", (uint8_t *)&v7, 0x12u);
      }
      self->_micInterrupted = 1;
    }
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[RPMicAudioCaptureManager handleAudioSessionInterruption:]";
    v9 = 1024;
    v10 = 87;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAudioSessionInterruptionTypeEnded", (uint8_t *)&v7, 0x12u);
  }
}

- (RPMicAudioCaptureManager)init
{
  char *v2;
  uint64_t v3;
  __int128 v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RPMicAudioCaptureManager;
  v2 = -[RPMicAudioCaptureManager init](&v13, "init");
  if (v2)
  {
    +[RPMicAudioCaptureManager audioStreamBasicDescriptionWithStereo:](RPMicAudioCaptureManager, "audioStreamBasicDescriptionWithStereo:", 0);
    v3 = v12;
    v4 = v11;
    *(_OWORD *)(v2 + 24) = v10;
    *(_OWORD *)(v2 + 40) = v4;
    *((_QWORD *)v2 + 7) = v3;
    v5 = dispatch_queue_create("com.apple.ReplayKit.MicAudioCaptureQueue", 0);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    v7 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = 0;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "handleAudioSessionInterruption:", AVAudioSessionInterruptionNotification, 0);

  }
  return (RPMicAudioCaptureManager *)v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, AVAudioSessionInterruptionNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)RPMicAudioCaptureManager;
  -[RPMicAudioCaptureManager dealloc](&v4, "dealloc");
}

- (void)startCaptureSession
{
  AVCaptureSession *v3;
  AVCaptureSession *captureSession;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPMicAudioCaptureManager startCaptureSession]";
    v7 = 1024;
    v8 = 109;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  if (!self->_sessionInProgress)
  {
    self->_sessionInProgress = 1;
    v3 = (AVCaptureSession *)objc_alloc_init((Class)AVCaptureSession);
    captureSession = self->_captureSession;
    self->_captureSession = v3;

  }
}

- (void)stopCaptureSession
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPMicAudioCaptureManager stopCaptureSession]";
    v5 = 1024;
    v6 = 119;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  if (self->_sessionInProgress)
  {
    self->_sessionInProgress = 0;
    -[AVCaptureSession removeObserver:forKeyPath:](self->_captureSession, "removeObserver:forKeyPath:", self, CFSTR("running"));
    -[AVCaptureSession stopRunning](self->_captureSession, "stopRunning");
  }
}

- (void)stopAllCapture
{
  id microphoneOutputHandler;
  NSDate *lastMicAudioDate;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPMicAudioCaptureManager stopAllCapture]";
    v7 = 1024;
    v8 = 134;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  -[RPMicAudioCaptureManager stopCaptureSession](self, "stopCaptureSession");
  -[RPMicAudioCaptureManager stopMicrophoneCapture](self, "stopMicrophoneCapture");
  microphoneOutputHandler = self->_microphoneOutputHandler;
  self->_microphoneOutputHandler = 0;

  lastMicAudioDate = self->_lastMicAudioDate;
  self->_lastMicAudioDate = 0;

}

- (void)startMicrophoneCaptureWithOutput:(id)a3 didStartHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *audioDispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[RPMicAudioCaptureManager startMicrophoneCaptureWithOutput:didStartHandler:]";
    v16 = 1024;
    v17 = 142;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000068A0;
  block[3] = &unk_100080DD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(audioDispatchQueue, block);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("running")))
  {
    -[RPMicAudioCaptureManager dispatchedDidStartHandler](self, "dispatchedDidStartHandler");
    objc_msgSend(v10, "removeObserver:forKeyPath:", self, CFSTR("running"));
  }

}

- (void)stopMicrophoneCapture
{
  NSObject *audioDispatchQueue;
  _QWORD block[5];

  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006BB8;
  block[3] = &unk_100080E00;
  block[4] = self;
  dispatch_sync(audioDispatchQueue, block);
}

- (void)setCaptureSession:(id)a3
{
  AVCaptureSession *v5;
  AVCaptureSession *captureSession;

  v5 = (AVCaptureSession *)a3;
  captureSession = self->_captureSession;
  if (captureSession != v5)
  {
    -[AVCaptureSession removeObserver:forKeyPath:](captureSession, "removeObserver:forKeyPath:", self, CFSTR("running"));
    objc_storeStrong((id *)&self->_captureSession, a3);
  }

}

- (void)checkAndHandleMicInterruption
{
  void *v3;
  double v4;
  Float64 v5;
  __int128 v6;
  CMSampleBufferRef v7;
  $95D729B680665BEAEFA1D6FCA8238556 micInterruptionPresentationTimeStamp;
  _BYTE buf[32];
  uint64_t v10;

  if (self->_micInterrupted)
  {
    if (self->_microphoneOutputHandler)
    {
      self->_micInterrupted = 0;
      if (self->_lastMicAudioDate)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastMicAudioDate);
        if (v4 > 0.0)
        {
          v5 = v4;
          if (dword_100095B40 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[RPMicAudioCaptureManager checkAndHandleMicInterruption]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 245;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d gap since last mic tap, filling with empty sample buffer", buf, 0x12u);
          }
          micInterruptionPresentationTimeStamp = self->_micInterruptionPresentationTimeStamp;
          v6 = *(_OWORD *)&self->_audioBasicDescription.mBytesPerPacket;
          *(_OWORD *)buf = *(_OWORD *)&self->_audioBasicDescription.mSampleRate;
          *(_OWORD *)&buf[16] = v6;
          v10 = *(_QWORD *)&self->_audioBasicDescription.mBitsPerChannel;
          v7 = sub_100047114((CMTime *)&micInterruptionPresentationTimeStamp, (uint64_t)buf, v5);
          (*((void (**)(void))self->_microphoneOutputHandler + 2))();
          if (v7)
            CFRelease(v7);
        }

      }
    }
  }
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  AVCaptureAudioDataOutput *v8;
  id v9;
  float v10;
  float v11;
  void *v12;
  id v13;
  NSDate *v14;
  NSDate *lastMicAudioDate;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  _BYTE buf[28];

  v8 = (AVCaptureAudioDataOutput *)a3;
  v9 = a5;
  if (self->_captureSessionAudioDataOutput == v8 && self->_microphoneOutputHandler)
  {
    -[RPMicAudioCaptureManager checkAndHandleMicInterruption](self, "checkAndHandleMicInterruption");
    if (!self->_lastMicAudioDate)
    {
      v10 = sub_100047668(a4);
      if (dword_100095B40 <= 1)
      {
        v11 = v10;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[RPMicAudioCaptureManager captureOutput:didOutputSampleBuffer:fromConnection:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 262;
          *(_WORD *)&buf[18] = 2048;
          *(double *)&buf[20] = v11;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d first sample received at time %.3f", buf, 0x1Cu);
        }
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    CMSampleBufferGetDuration(&time, a4);
    v13 = objc_msgSend(v12, "dateByAddingTimeInterval:", CMTimeGetSeconds(&time));
    v14 = (NSDate *)objc_claimAutoreleasedReturnValue(v13);
    lastMicAudioDate = self->_lastMicAudioDate;
    self->_lastMicAudioDate = v14;

    CMSampleBufferGetPresentationTimeStamp(&lhs, a4);
    CMSampleBufferGetDuration(&rhs, a4);
    CMTimeAdd((CMTime *)buf, &lhs, &rhs);
    *(_OWORD *)&self->_micInterruptionPresentationTimeStamp.value = *(_OWORD *)buf;
    self->_micInterruptionPresentationTimeStamp.epoch = *(_QWORD *)&buf[16];
    (*((void (**)(void))self->_microphoneOutputHandler + 2))();
  }

}

- (void)dispatchedDidStartHandler
{
  NSObject *audioDispatchQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v6 = "-[RPMicAudioCaptureManager dispatchedDidStartHandler]";
    v7 = 1024;
    v8 = 274;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000716C;
  block[3] = &unk_100080E00;
  block[4] = self;
  dispatch_async(audioDispatchQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_micDidStartHandler, 0);
  objc_storeStrong((id *)&self->_lastMicAudioDate, 0);
  objc_storeStrong((id *)&self->_captureSessionAudioDataOutput, 0);
  objc_storeStrong((id *)&self->_captureDeviceAudioInput, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong(&self->_microphoneOutputHandler, 0);
  objc_storeStrong((id *)&self->_audioDispatchQueue, 0);
}

@end
