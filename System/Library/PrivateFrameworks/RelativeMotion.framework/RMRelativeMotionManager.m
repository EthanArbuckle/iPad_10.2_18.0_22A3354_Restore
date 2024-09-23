@implementation RMRelativeMotionManager

- (RMRelativeMotionManager)initWithQueue:(id)a3
{
  id v5;
  RMRelativeMotionManager *v6;
  RMRelativeMotionManager *v7;
  RMDummyDataManager *v8;
  RMDummyDataManager *dummyDataManager;
  uint64_t v10;
  NSUserDefaults *defaults;
  RMAudioListenerPoseManager *v12;
  RMAudioListenerPoseManager *audioListenerPoseManager;
  NSUserDefaults *v14;
  NSObject *v15;
  int verboseLatencyAnalysisLogging;
  __int128 v17;
  __int128 v18;
  objc_super v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RMRelativeMotionManager;
  v6 = -[RMRelativeMotionManager init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = -[RMDummyDataManager initWithQueue:]([RMDummyDataManager alloc], "initWithQueue:", v5);
    dummyDataManager = v7->_dummyDataManager;
    v7->_dummyDataManager = v8;

    v7->_shouldReceiveDummyData = 0;
    v7->_dummyDataBufferLock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.RelativeMotion"));
    defaults = v7->_defaults;
    v7->_defaults = (NSUserDefaults *)v10;

    v12 = -[RMAudioListenerPoseManager initWithQueue:]([RMAudioListenerPoseManager alloc], "initWithQueue:", v5);
    audioListenerPoseManager = v7->_audioListenerPoseManager;
    v7->_audioListenerPoseManager = v12;

    v7->_shouldReceiveAudioListenerPose = 0;
    v7->_audioListenerPoseBufferLock._os_unfair_lock_opaque = 0;
    v14 = v7->_defaults;
    v7->_verboseLatencyAnalysisLogging = -[NSUserDefaults BOOLForKey:](v14, "BOOLForKey:", CFSTR("TempestEnableVerboseLatencyLogging"));

    if (onceToken_RelativeMotionManager_Default != -1)
      dispatch_once(&onceToken_RelativeMotionManager_Default, &__block_literal_global_0);
    v15 = logObject_RelativeMotionManager_Default;
    if (os_log_type_enabled((os_log_t)logObject_RelativeMotionManager_Default, OS_LOG_TYPE_DEFAULT))
    {
      verboseLatencyAnalysisLogging = v7->_verboseLatencyAnalysisLogging;
      *(_DWORD *)buf = 67240192;
      v22 = verboseLatencyAnalysisLogging;
      _os_log_impl(&dword_228261000, v15, OS_LOG_TYPE_DEFAULT, "[RelativeMotionManager] verbose latency logging: %{public}d", buf, 8u);
    }
    v7->_audioListenerPoseBuffer[0].quaternion.x = 0.0;
    v7->_audioListenerPoseBuffer[0].quaternion.y = 0.0;
    v7->_audioListenerPoseBuffer[0].quaternion.z = 0.0;
    *(_OWORD *)&v7->_audioListenerPoseBuffer[0].quaternion.w = xmmword_22826CCB0;
    v17 = *(_OWORD *)&v7->_audioListenerPoseBuffer[0].consumedAuxTimestamp;
    v7->_audioListenerPoseBuffer[1].machAbsTimestamp = v7->_audioListenerPoseBuffer[0].machAbsTimestamp;
    v18 = *(_OWORD *)&v7->_audioListenerPoseBuffer[0].quaternion.z;
    *(_OWORD *)&v7->_audioListenerPoseBuffer[1].quaternion.x = *(_OWORD *)&v7->_audioListenerPoseBuffer[0].quaternion.x;
    *(_OWORD *)&v7->_audioListenerPoseBuffer[1].quaternion.z = v18;
    *(_OWORD *)&v7->_audioListenerPoseBuffer[1].timestamp = *(_OWORD *)&v7->_audioListenerPoseBuffer[0].timestamp;
    *(_OWORD *)&v7->_audioListenerPoseBuffer[1].consumedAuxTimestamp = v17;
  }

  return v7;
}

- (void)setQueue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 224), a2);
}

- (void)setDummyDataManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 232), a2);
}

- (uint64_t)setShouldReceiveDummyData:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 208) = a2;
  return result;
}

- (void)setDefaults:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 240), a2);
}

- (void)setAudioListenerPoseManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 248), a2);
}

- (uint64_t)setShouldReceiveAudioListenerPose:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 209) = a2;
  return result;
}

- (uint64_t)defaults
{
  if (result)
    return *(_QWORD *)(result + 240);
  return result;
}

- (uint64_t)setVerboseLatencyAnalysisLogging:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 210) = a2;
  return result;
}

- (uint64_t)verboseLatencyAnalysisLogging
{
  if (result)
    return *(_BYTE *)(result + 210) & 1;
  return result;
}

- (void)startReceivingDummyData
{
  OS_dispatch_queue *queue;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id location;

  if (!self)
    goto LABEL_6;
  if (self->_shouldReceiveDummyData)
  {
    -[RMRelativeMotionManager startReceivingDummyData].cold.1();
LABEL_6:
    queue = 0;
    location = 0;
    goto LABEL_4;
  }
  self->_shouldReceiveDummyData = 1;
  objc_initWeak(&location, self);
  queue = self->_queue;
LABEL_4:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__RMRelativeMotionManager_startReceivingDummyData__block_invoke;
  block[3] = &unk_24F0D3F40;
  v4 = queue;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (uint64_t)shouldReceiveDummyData
{
  if (result)
    return *(_BYTE *)(result + 208) & 1;
  return result;
}

- (uint64_t)queue
{
  if (result)
    return *(_QWORD *)(result + 224);
  return result;
}

void __50__RMRelativeMotionManager_startReceivingDummyData__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = (void *)*((_QWORD *)WeakRetained + 29);
  else
    v5 = 0;
  v6 = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__RMRelativeMotionManager_startReceivingDummyData__block_invoke_2;
  v7[3] = &unk_24F0D3F18;
  objc_copyWeak(&v8, v2);
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "startReceivingDummyDataUpdates:", v7);

  objc_destroyWeak(&v8);
}

- (uint64_t)dummyDataManager
{
  if (result)
    return *(_QWORD *)(result + 232);
  return result;
}

void __50__RMRelativeMotionManager_startReceivingDummyData__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v8;
  int v9;
  BOOL v10;
  char v11;
  int v12;
  id v13;

  v6 = a2;
  if (!a3)
  {
    v13 = v6;
    WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
    v8 = WeakRetained;
    if (WeakRetained && (WeakRetained[52]._os_unfair_lock_opaque & 1) != 0)
    {
      v9 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v10 = __OFADD__(v9++, 1);
      v11 = (v9 < 0) ^ v10;
      v12 = v9 & 1;
      if (v11)
        v12 = -v12;
      objc_storeStrong((id *)&WeakRetained[2 * v12 + 2], a2);
      os_unfair_lock_lock(v8 + 7);
      ++v8[8]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(v8 + 7);
    }

    v6 = v13;
  }

}

- (void)stopReceivingDummyData
{
  RMDummyDataManager *v3;
  NSObject *queue;
  RMDummyDataManager *v5;
  uint64_t v6;
  _QWORD block[4];
  RMDummyDataManager *v8;

  if (self && self->_shouldReceiveDummyData)
  {
    self->_shouldReceiveDummyData = 0;
    v3 = self->_dummyDataManager;
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__RMRelativeMotionManager_stopReceivingDummyData__block_invoke;
    block[3] = &unk_24F0D3F68;
    v8 = v3;
    v5 = v3;
    dispatch_async(queue, block);

  }
  else
  {
    v6 = -[RMRelativeMotionManager stopReceivingDummyData].cold.1();
    __49__RMRelativeMotionManager_stopReceivingDummyData__block_invoke(v6);
  }
}

uint64_t __49__RMRelativeMotionManager_stopReceivingDummyData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopReceivingDummyDataUpdates");
}

- (id)getCurrentDummyData
{
  os_unfair_lock_s *p_dummyDataBufferLock;
  int v4;
  RMDummyData *v5;

  p_dummyDataBufferLock = &self->_dummyDataBufferLock;
  os_unfair_lock_lock(&self->_dummyDataBufferLock);
  if (self->_currentDummyDataBufferIndex >= 0)
    v4 = self->_currentDummyDataBufferIndex & 1;
  else
    v4 = -(self->_currentDummyDataBufferIndex & 1);
  v5 = self->_dummyDataBuffer[v4];
  os_unfair_lock_unlock(p_dummyDataBufferLock);
  return v5;
}

+ (BOOL)isAudioListenerPoseAvailable
{
  return 1;
}

- (void)startReceivingAudioListenerPoseWithStatusCallback:(id)a3
{
  -[RMRelativeMotionManager startReceivingAudioListenerPoseWithForceSessionRestart:statusCallback:]((uint64_t)self, 0, a3);
}

- (void)startReceivingAudioListenerPoseWithForceSessionRestart:(void *)a3 statusCallback:
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[5];
  id v10;
  id v11;
  char v12;
  id location;

  v5 = a3;
  if (!a1)
    goto LABEL_4;
  if ((*(_BYTE *)(a1 + 209) & 1) == 0)
  {
    *(_BYTE *)(a1 + 209) = 1;
    objc_initWeak(&location, (id)a1);
    v6 = *(void **)(a1 + 224);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __97__RMRelativeMotionManager_startReceivingAudioListenerPoseWithForceSessionRestart_statusCallback___block_invoke;
    block[3] = &unk_24F0D3FB8;
    v7 = v6;
    objc_copyWeak(&v11, &location);
    block[4] = a1;
    v12 = a2;
    v10 = v5;
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
LABEL_4:

    return;
  }
  v8 = -[RMRelativeMotionManager startReceivingAudioListenerPoseWithForceSessionRestart:statusCallback:].cold.1();
  -[RMRelativeMotionManager shouldReceiveAudioListenerPose](v8);
}

- (uint64_t)shouldReceiveAudioListenerPose
{
  if (result)
    return *(_BYTE *)(result + 209) & 1;
  return result;
}

void __97__RMRelativeMotionManager_startReceivingAudioListenerPoseWithForceSessionRestart_statusCallback___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "audioListenerPoseOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
    WeakRetained = (_QWORD *)WeakRetained[31];
  objc_msgSend(WeakRetained, "setTempestOptions:", v2);

  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = v5;
  if (v5)
    v7 = (void *)*((_QWORD *)v5 + 31);
  else
    v7 = 0;
  v8 = v7;
  v9 = *(unsigned __int8 *)(a1 + 56);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __97__RMRelativeMotionManager_startReceivingAudioListenerPoseWithForceSessionRestart_statusCallback___block_invoke_2;
  v10[3] = &unk_24F0D3F90;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  objc_msgSend(v8, "startReceivingAudioListenerPoseUpdatesWithForceSessionRestart:poseCallbackInternal:statusCallback:", v9, v10, *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&v11);
}

- (uint64_t)audioListenerPoseManager
{
  if (result)
    return *(_QWORD *)(result + 248);
  return result;
}

void __97__RMRelativeMotionManager_startReceivingAudioListenerPoseWithForceSessionRestart_statusCallback___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v7;
  NSObject *v8;
  uint64_t v9;
  int os_unfair_lock_opaque;
  BOOL v11;
  char v12;
  int v13;
  os_unfair_lock_s *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained && BYTE1(WeakRetained[52]._os_unfair_lock_opaque))
  {
    if (BYTE2(WeakRetained[52]._os_unfair_lock_opaque))
    {
      if (onceToken_RelativeMotionManager_Default != -1)
        dispatch_once(&onceToken_RelativeMotionManager_Default, &__block_literal_global_0);
      v8 = logObject_RelativeMotionManager_Default;
      if (os_log_type_enabled((os_log_t)logObject_RelativeMotionManager_Default, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a2 + 32);
        v21 = 134349056;
        v22 = v9;
        _os_log_impl(&dword_228261000, v8, OS_LOG_TYPE_INFO, "[RelativeMotionManager] receivingAudioListenerPose %{public}f", (uint8_t *)&v21, 0xCu);
      }
    }
    os_unfair_lock_opaque = v7[53]._os_unfair_lock_opaque;
    v11 = __OFADD__(os_unfair_lock_opaque++, 1);
    v12 = (os_unfair_lock_opaque < 0) ^ v11;
    v13 = os_unfair_lock_opaque & 1;
    if (v12)
      v13 = -v13;
    v14 = &v7[18 * v13];
    *(_OWORD *)&v14[10]._os_unfair_lock_opaque = *(_OWORD *)a2;
    v16 = *(_OWORD *)(a2 + 32);
    v15 = *(_OWORD *)(a2 + 48);
    v17 = *(_QWORD *)(a2 + 64);
    *(_OWORD *)&v14[14]._os_unfair_lock_opaque = *(_OWORD *)(a2 + 16);
    *(_QWORD *)&v14[26]._os_unfair_lock_opaque = v17;
    *(_OWORD *)&v14[22]._os_unfair_lock_opaque = v15;
    *(_OWORD *)&v14[18]._os_unfair_lock_opaque = v16;
    v18 = objc_msgSend(v5, "code");
    v19 = v7[53]._os_unfair_lock_opaque;
    v11 = __OFADD__(v19++, 1);
    v12 = (v19 < 0) ^ v11;
    v20 = v19 & 1;
    if (v12)
      v20 = -v20;
    *(_QWORD *)&v7[2 * v20 + 46]._os_unfair_lock_opaque = v18;
    os_unfair_lock_lock(v7 + 51);
    ++v7[53]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v7 + 51);
  }

}

- (void)stopReceivingAudioListenerPose
{
  RMAudioListenerPoseManager *v3;
  NSObject *queue;
  RMAudioListenerPoseManager *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  _QWORD block[4];
  RMAudioListenerPoseManager *v10;

  if (self && self->_shouldReceiveAudioListenerPose)
  {
    self->_shouldReceiveAudioListenerPose = 0;
    v3 = self->_audioListenerPoseManager;
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__RMRelativeMotionManager_stopReceivingAudioListenerPose__block_invoke;
    block[3] = &unk_24F0D3F68;
    v10 = v3;
    v5 = v3;
    dispatch_async(queue, block);
    os_unfair_lock_lock(&self->_audioListenerPoseBufferLock);
    self->_audioListenerPoseBuffer[0].quaternion.y = 0.0;
    self->_audioListenerPoseBuffer[0].quaternion.z = 0.0;
    self->_audioListenerPoseBuffer[0].quaternion.x = 0.0;
    *(_OWORD *)&self->_audioListenerPoseBuffer[0].quaternion.w = xmmword_22826CCB0;
    v6 = *(_OWORD *)&self->_audioListenerPoseBuffer[0].consumedAuxTimestamp;
    self->_audioListenerPoseBuffer[1].machAbsTimestamp = self->_audioListenerPoseBuffer[0].machAbsTimestamp;
    v7 = *(_OWORD *)&self->_audioListenerPoseBuffer[0].quaternion.z;
    *(_OWORD *)&self->_audioListenerPoseBuffer[1].timestamp = *(_OWORD *)&self->_audioListenerPoseBuffer[0].timestamp;
    *(_OWORD *)&self->_audioListenerPoseBuffer[1].consumedAuxTimestamp = v6;
    *(_OWORD *)&self->_audioListenerPoseBuffer[1].quaternion.x = *(_OWORD *)&self->_audioListenerPoseBuffer[0].quaternion.x;
    *(_OWORD *)&self->_audioListenerPoseBuffer[1].quaternion.z = v7;
    os_unfair_lock_unlock(&self->_audioListenerPoseBufferLock);

  }
  else
  {
    v8 = -[RMRelativeMotionManager stopReceivingAudioListenerPose].cold.1();
    __57__RMRelativeMotionManager_stopReceivingAudioListenerPose__block_invoke(v8);
  }
}

uint64_t __57__RMRelativeMotionManager_stopReceivingAudioListenerPose__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopReceivingAudioListenerPoseUpdates");
}

- (void)resetAudioListenerPoseTrackingForAllClients
{
  if (self)
  {
    if (self->_shouldReceiveAudioListenerPose)
    {
      -[RMRelativeMotionManager stopReceivingAudioListenerPose](self, "stopReceivingAudioListenerPose");
      -[RMRelativeMotionManager startReceivingAudioListenerPoseWithForceSessionRestart:statusCallback:]((uint64_t)self, 1, 0);
    }
  }
}

- (os_unfair_lock_s)getCurrentAudioListenerPoseInternal:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v4;
  int v5;
  os_unfair_lock_s *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  int v10;

  v2 = a1;
  if (a1)
  {
    v4 = a1 + 51;
    os_unfair_lock_lock(a1 + 51);
    if (a2)
    {
      if ((v2[53]._os_unfair_lock_opaque & 0x80000000) == 0)
        v5 = v2[53]._os_unfair_lock_opaque & 1;
      else
        v5 = -(v2[53]._os_unfair_lock_opaque & 1);
      v6 = &v2[18 * v5];
      *(_OWORD *)a2 = *(_OWORD *)&v6[10]._os_unfair_lock_opaque;
      v7 = *(_OWORD *)&v6[14]._os_unfair_lock_opaque;
      v8 = *(_OWORD *)&v6[18]._os_unfair_lock_opaque;
      v9 = *(_OWORD *)&v6[22]._os_unfair_lock_opaque;
      *(_QWORD *)(a2 + 64) = *(_QWORD *)&v6[26]._os_unfair_lock_opaque;
      *(_OWORD *)(a2 + 32) = v8;
      *(_OWORD *)(a2 + 48) = v9;
      *(_OWORD *)(a2 + 16) = v7;
    }
    if ((v2[53]._os_unfair_lock_opaque & 0x80000000) == 0)
      v10 = v2[53]._os_unfair_lock_opaque & 1;
    else
      v10 = -(v2[53]._os_unfair_lock_opaque & 1);
    v2 = *(os_unfair_lock_s **)&v2[2 * v10 + 46]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v4);
  }
  return v2;
}

- (int64_t)getCurrentAudioListenerPose:(id *)a3 timestamp:(double *)a4
{
  os_unfair_lock_s *v7;
  __int128 v8;
  NSObject *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = -[RMRelativeMotionManager getCurrentAudioListenerPoseInternal:]((os_unfair_lock_s *)self, (uint64_t)&v11);
  if (a3)
  {
    v8 = v12;
    *(_OWORD *)&a3->var0 = v11;
    *(_OWORD *)&a3->var2 = v8;
  }
  if (a4)
    *(_QWORD *)a4 = v13;
  if (self && self->_verboseLatencyAnalysisLogging)
  {
    if (onceToken_RelativeMotionManager_Default != -1)
      dispatch_once(&onceToken_RelativeMotionManager_Default, &__block_literal_global_0);
    v9 = logObject_RelativeMotionManager_Default;
    if (os_log_type_enabled((os_log_t)logObject_RelativeMotionManager_Default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134285313;
      v17 = v11;
      v18 = 2049;
      v19 = *((_QWORD *)&v11 + 1);
      v20 = 2049;
      v21 = v12;
      v22 = 2049;
      v23 = *((_QWORD *)&v12 + 1);
      v24 = 2049;
      v25 = v14;
      v26 = 2049;
      v27 = *((_QWORD *)&v14 + 1);
      v28 = 2049;
      v29 = v15;
      v30 = 2049;
      v31 = v13;
      _os_log_impl(&dword_228261000, v9, OS_LOG_TYPE_INFO, "[RelativeMotionManager] currentAudioListenerPose RMPose,q.x,%{private}f,q.y,%{private}f,q.z,%{private}f,q.w,%{private}f,consumedAuxTimestamp,%{private}f,receivedAuxTimestamp,%{private}f,machAbsTimestamp,%{private}f,timestamp,%{private}f", buf, 0x52u);
    }
  }
  return (int64_t)v7;
}

- (id)getCurrentAudioListenerPoseWithError:(int64_t *)a3
{
  os_unfair_lock_s *v4;
  RMAttitude *v5;
  id v6;
  RMPose *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double v14;

  v14 = 0.0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = -[RMRelativeMotionManager getCurrentAudioListenerPoseInternal:]((os_unfair_lock_s *)self, (uint64_t)&v10);
  if (a3)
    *a3 = (int64_t)v4;
  v5 = [RMAttitude alloc];
  v6 = -[RMAttitude _initWithQuaternion:timestamp:](v5, "_initWithQuaternion:timestamp:", v10, v11, *(double *)&v12);
  v7 = [RMPose alloc];
  v8 = -[RMPose _initWithAttitude:consumedAuxTimestamp:receivedAuxTimestamp:machAbsTimestamp:](v7, "_initWithAttitude:consumedAuxTimestamp:receivedAuxTimestamp:machAbsTimestamp:", v6, v13, v14);

  return v8;
}

- (void)dealloc
{
  RMRelativeMotionManager *v2;
  RMDummyDataManager *v3;
  NSObject *queue;
  RMRelativeMotionManager *v5;
  RMDummyDataManager *v6;
  objc_super v7;
  _QWORD block[4];
  RMDummyDataManager *v9;
  RMRelativeMotionManager *v10;

  v2 = self;
  if (self)
  {
    v3 = self->_dummyDataManager;
    self = v2->_audioListenerPoseManager;
    queue = v2->_queue;
  }
  else
  {
    v3 = 0;
    queue = 0;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__RMRelativeMotionManager_dealloc__block_invoke;
  block[3] = &unk_24F0D3FE0;
  v9 = v3;
  v10 = self;
  v5 = self;
  v6 = v3;
  dispatch_async(queue, block);

  v7.receiver = v2;
  v7.super_class = (Class)RMRelativeMotionManager;
  -[RMRelativeMotionManager dealloc](&v7, sel_dealloc);
}

uint64_t __34__RMRelativeMotionManager_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (NSDictionary)audioListenerPoseOptions
{
  return self->_audioListenerPoseOptions;
}

- (void)setAudioListenerPoseOptions:(id)a3
{
  objc_storeStrong((id *)&self->_audioListenerPoseOptions, a3);
}

- (uint64_t)currentAudioListenerPoseBufferIndex
{
  if (result)
    return *(unsigned int *)(result + 212);
  return result;
}

- (uint64_t)setCurrentAudioListenerPoseBufferIndex:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 212) = a2;
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)&self->_audioListenerPoseManager, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_dummyDataManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioListenerPoseOptions, 0);
  v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (uint64_t)startReceivingDummyData
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26;

  _CLLogObjectForCategory_RelativeMotionManager_Default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_228261000, v2, v3, "{\"msg%{public}.0s\":\"Called startReceivingDummyData while already registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v22, v23, v24, v25, v26);
  }

  _CLLogObjectForCategory_RelativeMotionManager_Default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_6(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_228261000, v9, v10, v11, "Called startReceivingDummyData while already registered to receive data", "{\"msg%{public}.0s\":\"Called startReceivingDummyData while already registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v22, v23, v24, v25, v26);
  }

  _CLLogObjectForCategory_RelativeMotionManager_Default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_228261000, v15, v16, "{\"msg%{public}.0s\":\"Called startReceivingDummyData while already registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v22, v23, v24, v25, v26);
  }

  result = abort_report_np();
  __break(1u);
  return result;
}

- (uint64_t)stopReceivingDummyData
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27;

  _CLLogObjectForCategory_RelativeMotionManager_Default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_228261000, v2, v3, "{\"msg%{public}.0s\":\"Called stopReceivingDummyData while not registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_RelativeMotionManager_Default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_6(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_228261000, v9, v10, v11, "Called stopReceivingDummyData while not registered to receive data", "{\"msg%{public}.0s\":\"Called stopReceivingDummyData while not registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_RelativeMotionManager_Default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_228261000, v15, v16, "{\"msg%{public}.0s\":\"Called stopReceivingDummyData while not registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  v21 = abort_report_np();
  return -[RMRelativeMotionManager startReceivingAudioListenerPoseWithForceSessionRestart:statusCallback:].cold.1(v21);
}

- (uint64_t)startReceivingAudioListenerPoseWithForceSessionRestart:statusCallback:.cold.1()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26;

  _CLLogObjectForCategory_RelativeMotionManager_Default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_228261000, v2, v3, "{\"msg%{public}.0s\":\"Called startReceivingAudioListenerPose while already registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v22, v23, v24, v25, v26);
  }

  _CLLogObjectForCategory_RelativeMotionManager_Default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_6(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_228261000, v9, v10, v11, "Called startReceivingAudioListenerPose while already registered to receive data", "{\"msg%{public}.0s\":\"Called startReceivingAudioListenerPose while already registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v22, v23, v24, v25, v26);
  }

  _CLLogObjectForCategory_RelativeMotionManager_Default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_228261000, v15, v16, "{\"msg%{public}.0s\":\"Called startReceivingAudioListenerPose while already registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v22, v23, v24, v25, v26);
  }

  result = abort_report_np();
  __break(1u);
  return result;
}

- (uint64_t)stopReceivingAudioListenerPose
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27;

  _CLLogObjectForCategory_RelativeMotionManager_Default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_228261000, v2, v3, "{\"msg%{public}.0s\":\"Called stopReceivingAudioListenerPose while not registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_RelativeMotionManager_Default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_6(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_228261000, v9, v10, v11, "Called stopReceivingAudioListenerPose while not registered to receive data", "{\"msg%{public}.0s\":\"Called stopReceivingAudioListenerPose while not registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_RelativeMotionManager_Default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_228261000, v15, v16, "{\"msg%{public}.0s\":\"Called stopReceivingAudioListenerPose while not registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  v21 = abort_report_np();
  return -[RMConnectionEndpoint handleXpcMessage:replyBlock:].cold.1(v21);
}

@end
