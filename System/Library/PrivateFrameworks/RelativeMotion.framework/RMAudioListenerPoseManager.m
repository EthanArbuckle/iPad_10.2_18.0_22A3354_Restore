@implementation RMAudioListenerPoseManager

- (RMAudioListenerPoseManager)initWithQueue:(id)a3
{
  id v5;
  RMAudioListenerPoseManager *v6;
  RMAudioListenerPoseManager *v7;
  id *v8;
  RMConnectionClient *connectionClient;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMAudioListenerPoseManager;
  v6 = -[RMAudioListenerPoseManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = -[RMConnectionClient initWithQueue:serviceName:messageHandler:]((id *)[RMConnectionClient alloc], v5, CFSTR("com.apple.relatived.tempest"), &__block_literal_global_1);
    connectionClient = v7->_connectionClient;
    v7->_connectionClient = (RMConnectionClient *)v8;

  }
  return v7;
}

- (void)setQueue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setConnectionClient:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)invalidate
{
  RMConnectionClient *connectionClient;
  const char *v4;

  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (self->_isReceivingRelatveData)
      -[RMAudioListenerPoseManager stopReceivingAudioListenerPoseUpdates](self, "stopReceivingAudioListenerPoseUpdates");
    connectionClient = self->_connectionClient;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    connectionClient = 0;
  }
  -[RMConnectionClient invalidate]((uint64_t)connectionClient);
  -[RMAudioListenerPoseManager setConnectionClient:]((uint64_t)self, 0);
  if (self)
    objc_setProperty_nonatomic_copy(self, v4, 0, 32);
}

- (uint64_t)queue
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (BOOL)isReceivingRelatveData
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

- (uint64_t)connectionClient
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (void)setPoseCallbackInternal:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 32);
}

- (id)audioListenerPoseConfigurationWithForceSessionRestart:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v12[8];
  id v13;

  if (!a1)
    return 0;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("ABC0BF2F-620E-4ADF-8291-7624B6B0889A"), CFSTR("Identifier"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24F0D6B80, CFSTR("Interval"));
  objc_msgSend(a1, "tempestOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "tempestOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("TempestOptions"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("ForceSessionRestart"));

  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (!v8)
  {
    if (onceToken_TempestDataManager_Default != -1)
      dispatch_once(&onceToken_TempestDataManager_Default, &__block_literal_global_55);
    v10 = logObject_TempestDataManager_Default;
    if (os_log_type_enabled((os_log_t)logObject_TempestDataManager_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_228261000, v10, OS_LOG_TYPE_ERROR, "failed to archive configurations\n", v12, 2u);
    }
  }

  return v8;
}

- (void)startReceivingAudioListenerPoseUpdatesWithForceSessionRestart:(BOOL)a3 poseCallbackInternal:(id)a4 statusCallback:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  SEL v10;
  SEL v11;
  RMConnectionClient *connectionClient;
  void *v13;
  RMConnectionClient *v14;
  NSObject *v15;
  RMConnectionClient *v16;
  uint8_t v17[8];
  _QWORD v18[5];

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    objc_setProperty_nonatomic_copy(self, v10, v8, 32);
    objc_setProperty_nonatomic_copy(self, v11, v9, 40);
    connectionClient = self->_connectionClient;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    connectionClient = 0;
  }
  -[RMConnectionClient connect]((uint64_t)connectionClient);
  -[RMAudioListenerPoseManager audioListenerPoseConfigurationWithForceSessionRestart:](self, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v14 = self->_connectionClient;
  else
    v14 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __128__RMAudioListenerPoseManager_startReceivingAudioListenerPoseUpdatesWithForceSessionRestart_poseCallbackInternal_statusCallback___block_invoke;
  v18[3] = &unk_24F0D4068;
  v18[4] = self;
  -[RMConnectionClient requestStreamingWithMessage:data:callback:]((uint64_t)v14, CFSTR("kRMStartStreamingAudioListenerPose"), v13, v18);
  if (onceToken_TempestDataReceiver_Default != -1)
    dispatch_once(&onceToken_TempestDataReceiver_Default, &__block_literal_global_58);
  v15 = logObject_TempestDataReceiver_Default;
  if (os_log_type_enabled((os_log_t)logObject_TempestDataReceiver_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_228261000, v15, OS_LOG_TYPE_DEFAULT, "Sending message for relatived to hold onto priority.", v17, 2u);
  }
  if (self)
    v16 = self->_connectionClient;
  else
    v16 = 0;
  -[RMConnectionClient sendMessage:withData:reply:]((uint64_t)v16, CFSTR("kRMConnectionMessagePriorityBoost"), 0, &__block_literal_global_25);

}

- (void)setStatusCallback:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 40);
}

void __128__RMAudioListenerPoseManager_startReceivingAudioListenerPoseUpdatesWithForceSessionRestart_poseCallbackInternal_statusCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, __int128 *, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  RMMediaSessionStatus *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, __int128 *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v11 = a3;
  if (v11)
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      v12 = *(_QWORD *)(v12 + 32);
    if (v12)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v14 = *(void (**)(uint64_t, __int128 *, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 16);
      v38 = 0;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v14(v13, &v34, v11, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    v15 = objc_msgSend(v5, "length");
    if (v15 == 8)
    {
      v24 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
      v25 = *(_QWORD *)(a1 + 32);
      if (v25)
        v25 = *(_QWORD *)(v25 + 40);
      if (v25)
      {
        v26 = -[RMMediaSessionStatus initWithInternal:]([RMMediaSessionStatus alloc], "initWithInternal:", v24);
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();

      }
    }
    else
    {
      v16 = v15;
      if (v15 == 72)
      {
        v22 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
        if (*(_QWORD *)(v22 + 40) == 2)
          v23 = 0;
        else
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("kRMErrorDomain"), *(_QWORD *)(v22 + 40), 0);
        v28 = *(_QWORD *)(a1 + 32);
        if (v28)
          v28 = *(_QWORD *)(v28 + 32);
        if (v28)
        {
          v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
          v30 = *(void (**)(uint64_t, __int128 *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 16);
          v34 = *(_OWORD *)v22;
          v31 = *(_OWORD *)(v22 + 16);
          v32 = *(_OWORD *)(v22 + 32);
          v33 = *(_OWORD *)(v22 + 48);
          v38 = *(_QWORD *)(v22 + 64);
          v36 = v32;
          v37 = v33;
          v35 = v31;
          v30(v29, &v34, v23, v17, v18, v19, v20, v21);
        }

      }
      else
      {
        if (onceToken_TempestDataReceiver_Default != -1)
          dispatch_once(&onceToken_TempestDataReceiver_Default, &__block_literal_global_58);
        v27 = logObject_TempestDataReceiver_Default;
        if (os_log_type_enabled((os_log_t)logObject_TempestDataReceiver_Default, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v34) = 134217984;
          *(_QWORD *)((char *)&v34 + 4) = v16;
          _os_log_impl(&dword_228261000, v27, OS_LOG_TYPE_DEFAULT, "invalid data size %lu", (uint8_t *)&v34, 0xCu);
        }
      }
    }
  }

}

- (uint64_t)poseCallbackInternal
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)statusCallback
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

void __128__RMAudioListenerPoseManager_startReceivingAudioListenerPoseUpdatesWithForceSessionRestart_poseCallbackInternal_statusCallback___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a2;
  v5 = a3;
  if (onceToken_TempestDataReceiver_Default != -1)
    dispatch_once(&onceToken_TempestDataReceiver_Default, &__block_literal_global_58);
  v6 = logObject_TempestDataReceiver_Default;
  if (os_log_type_enabled((os_log_t)logObject_TempestDataReceiver_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_228261000, v6, OS_LOG_TYPE_DEFAULT, "Received reply for priority message.", v7, 2u);
  }

}

- (void)startReceivingAudioListenerPoseUpdatesWithForceSessionRestart:(BOOL)a3 poseCallback:(id)a4 statusCallback:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v8 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __120__RMAudioListenerPoseManager_startReceivingAudioListenerPoseUpdatesWithForceSessionRestart_poseCallback_statusCallback___block_invoke;
  v10[3] = &unk_24F0D40D0;
  v11 = v8;
  v9 = v8;
  -[RMAudioListenerPoseManager startReceivingAudioListenerPoseUpdatesWithForceSessionRestart:poseCallbackInternal:statusCallback:](self, "startReceivingAudioListenerPoseUpdatesWithForceSessionRestart:poseCallbackInternal:statusCallback:", v6, v10, a5);

}

void __120__RMAudioListenerPoseManager_startReceivingAudioListenerPoseUpdatesWithForceSessionRestart_poseCallback_statusCallback___block_invoke(uint64_t a1, double *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v7 = -[RMAttitude _initWithQuaternion:timestamp:]([RMAttitude alloc], "_initWithQuaternion:timestamp:", *a2, a2[1], a2[2], a2[3], a2[4]);
  v6 = -[RMPose _initWithAttitude:consumedAuxTimestamp:receivedAuxTimestamp:machAbsTimestamp:]([RMPose alloc], "_initWithAttitude:consumedAuxTimestamp:receivedAuxTimestamp:machAbsTimestamp:", v7, a2[6], a2[7], a2[8]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)stopReceivingAudioListenerPoseUpdates
{
  RMConnectionClient *connectionClient;
  const char *v4;
  SEL v5;

  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    connectionClient = self->_connectionClient;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    connectionClient = 0;
  }
  -[RMConnectionClient stopStreaming]((uint64_t)connectionClient);
  if (self)
  {
    self->_isReceivingRelatveData = 0;
    objc_setProperty_nonatomic_copy(self, v4, 0, 32);
    objc_setProperty_nonatomic_copy(self, v5, 0, 40);
  }
}

- (uint64_t)setIsReceivingRelatveData:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 8) = a2;
  return result;
}

- (NSDictionary)tempestOptions
{
  return self->_tempestOptions;
}

- (void)setTempestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_tempestOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionClient, 0);
  objc_storeStrong(&self->_statusCallback, 0);
  objc_storeStrong(&self->_poseCallbackInternal, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tempestOptions, 0);
}

@end
