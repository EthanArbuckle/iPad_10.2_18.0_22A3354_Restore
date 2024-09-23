@implementation RMDummyDataManager

- (RMDummyDataManager)initWithQueue:(id)a3
{
  id v4;
  RMDummyDataManager *v5;
  RMDummyDataManager *v6;
  id *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMDummyDataManager;
  v5 = -[RMDummyDataManager init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[RMDummyDataManager setQueue:](v5, "setQueue:", v4);
    v7 = -[RMConnectionClient initWithQueue:serviceName:messageHandler:]((id *)[RMConnectionClient alloc], v4, CFSTR("com.apple.relatived.tempest"), &__block_literal_global_5);
    -[RMDummyDataManager setConnectionClient:](v6, "setConnectionClient:", v7);

  }
  return v6;
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;

  -[RMDummyDataManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[RMDummyDataManager isReceivingRelatveData](self, "isReceivingRelatveData"))
    -[RMDummyDataManager stopReceivingDummyDataUpdates](self, "stopReceivingDummyDataUpdates");
  -[RMDummyDataManager connectionClient](self, "connectionClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMConnectionClient invalidate]((uint64_t)v4);

  -[RMDummyDataManager setConnectionClient:](self, "setConnectionClient:", 0);
  -[RMDummyDataManager setRelativeDataCallback:](self, "setRelativeDataCallback:", 0);
}

- (id)dummyDataConfiguration
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[8];
  id v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", &unk_24F0D6BE8, 1, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (!v2)
  {
    if (onceToken_TempestDataManager_Default != -1)
      dispatch_once(&onceToken_TempestDataManager_Default, &__block_literal_global_58_0);
    v4 = logObject_TempestDataManager_Default;
    if (os_log_type_enabled((os_log_t)logObject_TempestDataManager_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_228261000, v4, OS_LOG_TYPE_ERROR, "failed to archive configurations\n", v6, 2u);
    }
  }

  return v2;
}

- (void)startReceivingDummyDataUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  -[RMDummyDataManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[RMDummyDataManager setRelativeDataCallback:](self, "setRelativeDataCallback:", v4);
  -[RMDummyDataManager connectionClient](self, "connectionClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMConnectionClient connect]((uint64_t)v6);

  -[RMDummyDataManager connectionClient](self, "connectionClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMDummyDataManager dummyDataConfiguration](self, "dummyDataConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__RMDummyDataManager_startReceivingDummyDataUpdates___block_invoke;
  v9[3] = &unk_24F0D4068;
  v9[4] = self;
  -[RMConnectionClient requestStreamingWithMessage:data:callback:]((uint64_t)v7, CFSTR("kRMStartStreamingDummyData"), v8, v9);

}

void __53__RMDummyDataManager_startReceivingDummyDataUpdates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  __int128 *v8;
  RMDummyData *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  RMDummyData *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  _OWORD v16[4];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "relativeDataCallback");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v6);

  }
  else
  {
    v8 = (__int128 *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
    v9 = [RMDummyData alloc];
    v10 = *v8;
    v11 = v8[1];
    v12 = v8[3];
    v16[2] = v8[2];
    v16[3] = v12;
    v16[0] = v10;
    v16[1] = v11;
    v13 = -[RMDummyData initWithPayload:](v9, "initWithPayload:", v16);
    objc_msgSend(*(id *)(a1 + 32), "relativeDataCallback");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      __53__RMDummyDataManager_startReceivingDummyDataUpdates___block_invoke_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "relativeDataCallback");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, RMDummyData *, _QWORD))v15)[2](v15, v13, 0);

  }
}

- (void)stopReceivingDummyDataUpdates
{
  NSObject *v3;
  void *v4;

  -[RMDummyDataManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[RMDummyDataManager connectionClient](self, "connectionClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMConnectionClient stopStreaming]((uint64_t)v4);

  -[RMDummyDataManager setIsReceivingRelatveData:](self, "setIsReceivingRelatveData:", 0);
  -[RMDummyDataManager setRelativeDataCallback:](self, "setRelativeDataCallback:", 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)isReceivingRelatveData
{
  return self->_isReceivingRelatveData;
}

- (void)setIsReceivingRelatveData:(BOOL)a3
{
  self->_isReceivingRelatveData = a3;
}

- (id)relativeDataCallback
{
  return self->_relativeDataCallback;
}

- (void)setRelativeDataCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RMConnectionClient)connectionClient
{
  return self->_connectionClient;
}

- (void)setConnectionClient:(id)a3
{
  objc_storeStrong((id *)&self->_connectionClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionClient, 0);
  objc_storeStrong(&self->_relativeDataCallback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __53__RMDummyDataManager_startReceivingDummyDataUpdates___block_invoke_cold_1()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
  uint8_t buf[40];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  _CLLogObjectForCategory_ConnectionClient_Default_0();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    OUTLINED_FUNCTION_0();
    _os_log_impl(&dword_228261000, v0, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Streamed data received while no callback was in place\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  _CLLogObjectForCategory_ConnectionClient_Default_0();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v1))
  {
    OUTLINED_FUNCTION_0();
    _os_signpost_emit_with_name_impl(&dword_228261000, v1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Streamed data received while no callback was in place", "{\"msg%{public}.0s\":\"Streamed data received while no callback was in place\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  _CLLogObjectForCategory_ConnectionClient_Default_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    OUTLINED_FUNCTION_0();
    _os_log_impl(&dword_228261000, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Streamed data received while no callback was in place\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  abort_report_np();
  return AnalyticsSendEventLazy();
}

@end
