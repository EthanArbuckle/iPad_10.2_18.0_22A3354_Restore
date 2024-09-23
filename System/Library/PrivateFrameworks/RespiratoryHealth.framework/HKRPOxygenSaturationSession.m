@implementation HKRPOxygenSaturationSession

- (HKRPOxygenSaturationSession)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKRPOxygenSaturationSession)initWithHealthStore:(id)a3
{
  id v5;
  HKRPOxygenSaturationSession *v6;
  HKRPOxygenSaturationSession *v7;
  id v8;
  HKHealthStore *healthStore;
  void *v10;
  void *v11;
  uint64_t v12;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKRPOxygenSaturationSession;
  v6 = -[HKRPOxygenSaturationSession init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc(MEMORY[0x24BDD4038]);
    healthStore = v7->_healthStore;
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", healthStore, v10, v7, v11);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v12;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v7;
}

- (void)startWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__HKRPOxygenSaturationSession_startWithCompletion___block_invoke;
  v10[3] = &unk_24CD49750;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __51__HKRPOxygenSaturationSession_startWithCompletion___block_invoke_2;
  v8[3] = &unk_24CD49778;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __51__HKRPOxygenSaturationSession_startWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __51__HKRPOxygenSaturationSession_startWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)abortWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__HKRPOxygenSaturationSession_abortWithCompletion___block_invoke;
  v10[3] = &unk_24CD49750;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __51__HKRPOxygenSaturationSession_abortWithCompletion___block_invoke_2;
  v8[3] = &unk_24CD49778;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __51__HKRPOxygenSaturationSession_abortWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_abortWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __51__HKRPOxygenSaturationSession_abortWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clientRemote_didSendFeedback:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HKHealthStore clientQueue](self->_healthStore, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__HKRPOxygenSaturationSession_clientRemote_didSendFeedback___block_invoke;
  v6[3] = &unk_24CD497A0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __60__HKRPOxygenSaturationSession_clientRemote_didSendFeedback___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v4, "oxygenSaturationSession:didSendFeedback:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)clientRemote_didStartWithStartTime:(double)a3 expectedDuration:(double)a4
{
  NSObject *v7;
  _QWORD block[7];

  -[HKHealthStore clientQueue](self->_healthStore, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__HKRPOxygenSaturationSession_clientRemote_didStartWithStartTime_expectedDuration___block_invoke;
  block[3] = &unk_24CD497C8;
  block[4] = self;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(v7, block);

}

void __83__HKRPOxygenSaturationSession_clientRemote_didStartWithStartTime_expectedDuration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "oxygenSaturationSession:didStartWithStartTime:expectedDuration:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (void)clientRemote_didEndWithReason:(int64_t)a3 saturation:(id)a4 barometricPressure:(id)a5 averageHeartRate:(id)a6 averageHeartRateUUID:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int64_t v31;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  -[HKHealthStore clientQueue](self->_healthStore, "clientQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __135__HKRPOxygenSaturationSession_clientRemote_didEndWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID_error___block_invoke;
  block[3] = &unk_24CD497F0;
  v30 = v18;
  v31 = a3;
  block[4] = self;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v29 = v17;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  dispatch_async(v19, block);

}

void __135__HKRPOxygenSaturationSession_clientRemote_didEndWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "oxygenSaturationSession:didEndWithReason:saturation:barometricPressure:averageHeartRate:averageHeartRateUUID:error:", a1[4], a1[10], a1[5], a1[6], a1[7], a1[8], a1[9]);

}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B4A880);
}

+ (id)serverInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B4DDF8);
}

- (id)exportedInterface
{
  return +[HKRPOxygenSaturationSession clientInterface](HKRPOxygenSaturationSession, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKRPOxygenSaturationSession serverInterface](HKRPOxygenSaturationSession, "serverInterface");
}

- (void)connectionInterrupted
{
  NSObject *v3;
  _QWORD block[5];

  -[HKHealthStore clientQueue](self->_healthStore, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HKRPOxygenSaturationSession_connectionInterrupted__block_invoke;
  block[3] = &unk_24CD49818;
  block[4] = self;
  dispatch_async(v3, block);

}

void __52__HKRPOxygenSaturationSession_connectionInterrupted__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 100, CFSTR("Connection interrupted"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "oxygenSaturationSession:didEndWithReason:saturation:barometricPressure:averageHeartRate:averageHeartRateUUID:error:", *(_QWORD *)(a1 + 32), 4, 0, 0, 0, 0, v3);

}

- (HKRPOxygenSaturationSessionDelegate)delegate
{
  return (HKRPOxygenSaturationSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proxyProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
