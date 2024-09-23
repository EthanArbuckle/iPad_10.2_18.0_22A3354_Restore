@implementation RPAppAudioCaptureManager

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

- (RPAppAudioCaptureManager)init
{
  char *v2;
  dispatch_queue_t v3;
  void *v4;
  void *v5;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RPAppAudioCaptureManager;
  v2 = -[RPAppAudioCaptureManager init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ReplayKit.AppAudioCaptureQueue", 0);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = 0;

    +[RPAppAudioCaptureManager audioStreamBasicDescriptionWithStereo:](RPAppAudioCaptureManager, "audioStreamBasicDescriptionWithStereo:", 1);
    *(_OWORD *)(v2 + 56) = v7;
    *(_OWORD *)(v2 + 72) = v8;
    *((_QWORD *)v2 + 11) = v9;
  }
  return (RPAppAudioCaptureManager *)v2;
}

- (BOOL)handleStartAudioQueueFailed:(int)a3 didFailHandler:(id)a4
{
  void (**v5)(id, void *);
  void *v6;

  v5 = (void (**)(id, void *))a4;
  if (a3)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10005087C();
      if (!v5)
        goto LABEL_6;
      goto LABEL_5;
    }
    if (v5)
    {
LABEL_5:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5803, 0));
      v5[2](v5, v6);

    }
  }
LABEL_6:

  return a3 != 0;
}

- (void)startWithConfig:(id)a3 outputHandler:(id)a4 didStartHandler:(id)a5
{
  id var2;
  uint64_t v7;
  id v9;
  id v10;
  NSObject *audioDispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t v18;
  id v19;

  var2 = a3.var2;
  v7 = *(_QWORD *)&a3.var0;
  v9 = a4;
  v10 = a5;
  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = sub_100038E60;
  block[3] = &unk_100081EA0;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v7;
  v19 = var2;
  v12 = var2;
  v13 = v10;
  v14 = v9;
  dispatch_async(audioDispatchQueue, block);

}

- (void)resumeWithConfig:(id)a3
{
  self->_resumed = 1;
  -[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:](self, "startWithConfig:outputHandler:didStartHandler:", *(_QWORD *)&a3.var0, a3.var2, self->_appAudioOutputHandler, &stru_100081ED0);
}

- (void)stop
{
  NSObject *audioDispatchQueue;
  _QWORD block[5];

  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000398B8;
  block[3] = &unk_100080E00;
  block[4] = self;
  dispatch_sync(audioDispatchQueue, block);
}

+ ($C9ED33C4FD2E7C77AE94B0FA51C6668E)audioCaptureConfigForSystemRecording:(BOOL)a3 processID:(int)a4 contextID:(id)a5
{
  uint64_t v5;
  void *v6;
  $C9ED33C4FD2E7C77AE94B0FA51C6668E result;

  v5 = *(_QWORD *)&a4 << 32;
  v6 = 0;
  result.var2 = v6;
  result.var0 = v5;
  result.var1 = HIDWORD(v5);
  return result;
}

- (id)newAudioTapForAudioCaptureConfig:(id)a3
{
  id var2;
  unint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  var2 = a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  v5 = objc_msgSend(objc_alloc((Class)AVAudioFormat), "initWithStreamDescription:", &self->_audioBasicDescription);
  if (!v5)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100050C08();
    goto LABEL_15;
  }
  if ((_DWORD)v4 == 2)
  {
    v6 = objc_msgSend(objc_alloc((Class)ATAudioTapDescription), "initScreenSharingTapWithFormat:", v5);
  }
  else if ((_DWORD)v4 == 1)
  {
    if (!var2)
    {
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100050D7C();
      goto LABEL_15;
    }
    v6 = objc_msgSend(objc_alloc((Class)ATAudioTapDescription), "initPreSpatialSceneIdentifierTapWithFormat:sceneIdentifier:", v5, var2);
  }
  else
  {
    if ((_DWORD)v4)
    {
LABEL_12:
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100050C84();
LABEL_15:
      v7 = 0;
LABEL_16:
      v10 = 0;
      goto LABEL_17;
    }
    v6 = objc_msgSend(objc_alloc((Class)ATAudioTapDescription), "initProcessTapWithFormat:PID:", v5, HIDWORD(v4));
  }
  v7 = v6;
  if (!v6)
    goto LABEL_12;
  v8 = objc_msgSend(objc_alloc((Class)ATAudioTap), "initWithTapDescription:", v6);
  v9 = v8;
  if (!v8)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100050D00();
    goto LABEL_16;
  }
  objc_msgSend(v8, "setScreenSharingHost:", 1);
  v10 = v9;
LABEL_17:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAudioDate, 0);
  objc_storeStrong(&self->_appTapDidStartHandler, 0);
  objc_storeStrong(&self->_appAudioOutputHandler, 0);
  objc_storeStrong((id *)&self->_audioDispatchQueue, 0);
}

@end
