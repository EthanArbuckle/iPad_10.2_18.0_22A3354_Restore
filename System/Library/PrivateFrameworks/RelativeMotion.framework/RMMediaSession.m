@implementation RMMediaSession

+ (BOOL)isAvailable
{
  return +[RMRelativeMotionManager isAudioListenerPoseAvailable](RMRelativeMotionManager, "isAudioListenerPoseAvailable");
}

+ (BOOL)_isClientModeAvailable:(int64_t)a3
{
  BOOL result;

  result = +[RMMediaSession isAvailable](RMMediaSession, "isAvailable");
  if ((unint64_t)a3 >= 5)
    return 0;
  return result;
}

+ (double)defaultFaceToDevicePitchAngle
{
  double result;

  objc_msgSend(MEMORY[0x24BDC13F0], "defaultFaceToDevicePitchAngle");
  return result;
}

- (RMMediaSession)init
{
  return (RMMediaSession *)-[RMMediaSession _initWithOptions:](self, "_initWithOptions:", 0);
}

- (id)_initWithOptions:(id)a3
{
  id v4;
  RMMediaSession *v5;
  dispatch_queue_t v6;
  RMRelativeMotionManager *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RMMediaSession;
  v5 = -[RMMediaSession init](&v13, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("RMMediaSessionQueue", 0);
    v7 = -[RMRelativeMotionManager initWithQueue:]([RMRelativeMotionManager alloc], "initWithQueue:", v6);
    -[RMMediaSession setManager:](v5, "setManager:", v7);

    if (v4)
    {
      v14[0] = *MEMORY[0x24BDC1458];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "clientMode"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v8;
      v14[1] = *MEMORY[0x24BDC1460];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "predictionIntervalMicroseconds"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RMMediaSession manager](v5, "manager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAudioListenerPoseOptions:", v10);

      -[RMMediaSession setClientMode:](v5, "setClientMode:", objc_msgSend(v4, "clientMode"));
    }
    -[RMMediaSession startMonitoringAXHeadTrackingSetting](v5, "startMonitoringAXHeadTrackingSetting");
    -[RMMediaSession setSessionStartTimestamp:](v5, "setSessionStartTimestamp:", 0.0);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[RMMediaSession stopMonitoringAXHeadTrackingSetting](self, "stopMonitoringAXHeadTrackingSetting");
  v3.receiver = self;
  v3.super_class = (Class)RMMediaSession;
  -[RMMediaSession dealloc](&v3, sel_dealloc);
}

- (BOOL)_start
{
  RMMediaSession *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[RMMediaSession isAXHeadTrackingSettingEnabled](v2, "isAXHeadTrackingSettingEnabled");
  if (onceToken_ConnectionClient_Default != -1)
    dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global);
  v4 = (id)logObject_ConnectionClient_Default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67240448;
    v7[1] = -[RMMediaSession clientMode](v2, "clientMode");
    v8 = 1026;
    v9 = v3;
    _os_log_impl(&dword_228261000, v4, OS_LOG_TYPE_DEFAULT, "[RMMediaSession] Starting session, clientMode: %{public}d, trackingEnabled: %{public}d", (uint8_t *)v7, 0xEu);
  }

  if ((_DWORD)v3)
  {
    -[RMMediaSession manager](v2, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startReceivingAudioListenerPoseWithStatusCallback:", 0);

  }
  -[RMMediaSession setSessionStartedWithTracking:](v2, "setSessionStartedWithTracking:", v3);
  -[RMMediaSession setSessionStartTimestamp:](v2, "setSessionStartTimestamp:", CFAbsoluteTimeGetCurrent());
  objc_sync_exit(v2);

  return 1;
}

- (void)_stop
{
  RMMediaSession *v2;
  double v3;
  void *v4;
  double Current;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  RMMediaSession *v11;
  double v12;

  v2 = self;
  objc_sync_enter(v2);
  -[RMMediaSession sessionStartTimestamp](v2, "sessionStartTimestamp");
  if (v3 != 0.0)
  {
    if (-[RMMediaSession sessionStartedWithTracking](v2, "sessionStartedWithTracking"))
    {
      -[RMMediaSession manager](v2, "manager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopReceivingAudioListenerPose");

      -[RMMediaSession setSessionStartedWithTracking:](v2, "setSessionStartedWithTracking:", 0);
    }
    else
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[RMMediaSession sessionStartTimestamp](v2, "sessionStartTimestamp");
      v7 = MEMORY[0x24BDAC760];
      v8 = 3221225472;
      v9 = __23__RMMediaSession__stop__block_invoke;
      v10 = &unk_24F0D3E90;
      v12 = Current - v6;
      v11 = v2;
      AnalyticsSendEventLazy();
    }
    -[RMMediaSession setSessionStartTimestamp:](v2, "setSessionStartTimestamp:", 0.0, v7, v8, v9, v10, v11, *(_QWORD *)&v12);
  }
  objc_sync_exit(v2);

}

id __23__RMMediaSession__stop__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = MEMORY[0x24BDBD1C0];
  v9[0] = CFSTR("trackingEnabled");
  v9[1] = CFSTR("sessionDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v2;
  v9[2] = CFSTR("trackingClientMode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "clientMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (onceToken_ConnectionClient_Default != -1)
    dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global);
  v5 = logObject_ConnectionClient_Default;
  if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_INFO))
  {
    v7 = 138477827;
    v8 = v4;
    _os_log_impl(&dword_228261000, v5, OS_LOG_TYPE_INFO, "[RMMediaSession] Sending analytics:\n%{private}@", (uint8_t *)&v7, 0xCu);
  }
  return v4;
}

- (void)_resetTrackingForAllClients
{
  NSObject *v3;
  RMMediaSession *v4;
  void *v5;
  uint8_t v6[16];

  if (onceToken_ConnectionClient_Default != -1)
    dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global);
  v3 = logObject_ConnectionClient_Default;
  if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_228261000, v3, OS_LOG_TYPE_DEFAULT, "[RMMediaSession] Resetting tracking for all clients", v6, 2u);
  }
  v4 = self;
  objc_sync_enter(v4);
  -[RMMediaSession manager](v4, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetAudioListenerPoseTrackingForAllClients");

  objc_sync_exit(v4);
}

- (int64_t)_currentAudioListenerPose:(id *)a3 timestamp:(double *)a4
{
  void *v7;
  int64_t v8;

  -[RMMediaSession manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "getCurrentAudioListenerPose:timestamp:", a3, a4);

  if (-[RMMediaSession sessionStartedWithTracking](self, "sessionStartedWithTracking"))
    return v8;
  else
    return 4;
}

- (int64_t)_currentAudioListenerPose:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;
  uint64_t v11;

  v11 = 0;
  v5 = (void *)MEMORY[0x22E2AD4E4](self, a2);
  -[RMMediaSession manager](self, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCurrentAudioListenerPoseWithError:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  v8 = objc_retainAutorelease(v7);
  *a3 = v8;
  if (-[RMMediaSession sessionStartedWithTracking](self, "sessionStartedWithTracking"))
  {
    v9 = v11;
  }
  else
  {
    v9 = 4;
    v11 = 4;
  }

  return v9;
}

- (BOOL)isAXHeadTrackingSettingEnabled
{
  uint64_t v3;
  NSObject *v4;
  int64_t v5;
  uint64_t v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = _AXSSpatialAudioHeadTracking();
  if (onceToken_ConnectionClient_Default != -1)
    dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global);
  v4 = logObject_ConnectionClient_Default;
  if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67240192;
    v8[1] = v3;
    _os_log_impl(&dword_228261000, v4, OS_LOG_TYPE_DEFAULT, "[RMMediaSession] _AXSSpatialAudioHeadTracking: %{public}d", (uint8_t *)v8, 8u);
  }
  v5 = -[RMMediaSession clientMode](self, "clientMode");
  v6 = 1;
  if (v5 != 1)
    v6 = 2;
  return (v6 & v3) != 0;
}

- (void)startMonitoringAXHeadTrackingSetting
{
  __CFNotificationCenter *v3;

  v3 = -[RMMediaSession axNotificationCenter](self, "axNotificationCenter");
  CFNotificationCenterAddObserver(v3, self, (CFNotificationCallback)axHeadTrackingSettingChanged, (CFStringRef)*MEMORY[0x24BED26C0], 0, (CFNotificationSuspensionBehavior)0);
}

- (void)stopMonitoringAXHeadTrackingSetting
{
  __CFNotificationCenter *v3;

  v3 = -[RMMediaSession axNotificationCenter](self, "axNotificationCenter");
  CFNotificationCenterRemoveObserver(v3, self, (CFNotificationName)*MEMORY[0x24BED26C0], 0);
}

- (void)axHeadTrackingSettingChanged
{
  RMMediaSession *v2;
  double v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = self;
  objc_sync_enter(v2);
  -[RMMediaSession sessionStartTimestamp](v2, "sessionStartTimestamp");
  if (v3 != 0.0)
  {
    v4 = -[RMMediaSession sessionStartedWithTracking](v2, "sessionStartedWithTracking");
    if (v4 != -[RMMediaSession isAXHeadTrackingSettingEnabled](v2, "isAXHeadTrackingSettingEnabled"))
    {
      if (onceToken_ConnectionClient_Default != -1)
        dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global);
      v5 = logObject_ConnectionClient_Default;
      if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_228261000, v5, OS_LOG_TYPE_DEFAULT, "[RMMediaSession] AX head tracking setting has changed, restarting session", v6, 2u);
      }
      -[RMMediaSession _stop](v2, "_stop");
      -[RMMediaSession _start](v2, "_start");
    }
  }
  objc_sync_exit(v2);

}

- (RMRelativeMotionManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (double)sessionStartTimestamp
{
  return self->_sessionStartTimestamp;
}

- (void)setSessionStartTimestamp:(double)a3
{
  self->_sessionStartTimestamp = a3;
}

- (BOOL)sessionStartedWithTracking
{
  return self->_sessionStartedWithTracking;
}

- (void)setSessionStartedWithTracking:(BOOL)a3
{
  self->_sessionStartedWithTracking = a3;
}

- (int64_t)clientMode
{
  return self->_clientMode;
}

- (void)setClientMode:(int64_t)a3
{
  self->_clientMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
