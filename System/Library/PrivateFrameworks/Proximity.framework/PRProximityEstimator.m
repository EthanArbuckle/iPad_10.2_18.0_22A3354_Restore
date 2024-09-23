@implementation PRProximityEstimator

- (PRProximityEstimator)init
{
  -[PRProximityEstimator doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PRProximityEstimator)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v7;
  id v8;
  PRProximityEstimator *v9;
  os_log_t v10;
  OS_os_log *logger;
  NSMutableDictionary *v12;
  NSMutableDictionary *devicesMonitered;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRProximityEstimator.mm"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PRProximityEstimator;
  v9 = -[PRProximityEstimator init](&v16, sel_init);
  if (v9)
  {
    v10 = os_log_create("com.apple.nearbyd", "PRProximityEstimator");
    logger = v9->_logger;
    v9->_logger = (OS_os_log *)v10;

    objc_storeWeak((id *)&v9->_delegate, v7);
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    devicesMonitered = v9->devicesMonitered;
    v9->devicesMonitered = v12;

    v9->usingST = 0;
  }

  return v9;
}

- (id)initSingleThresholdEstmatorWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v7;
  id v8;
  PRProximityEstimator *v9;
  os_log_t v10;
  OS_os_log *logger;
  NSMutableDictionary *v12;
  NSMutableDictionary *devicesMonitered;
  NSObject *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRProximityEstimator.mm"), 337, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PRProximityEstimator;
  v9 = -[PRProximityEstimator init](&v17, sel_init);
  if (v9)
  {
    v10 = os_log_create("com.apple.nearbyd", "PRProximityEstimator");
    logger = v9->_logger;
    v9->_logger = (OS_os_log *)v10;

    objc_storeWeak((id *)&v9->_delegate, v7);
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    devicesMonitered = v9->devicesMonitered;
    v9->devicesMonitered = v12;

    v9->usingST = 1;
    v14 = v9->_logger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PRProximityEstimator initSingleThresholdEstmatorWithDelegate:delegateQueue:].cold.1(v14);
  }

  return v9;
}

- (BOOL)startEstimatingProximityFor:(id)a3 peerDeviceModel:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id *v14;
  PRProximitySingleThresholdDevice *v15;
  id v16;
  PRProximityEstimator *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->devicesMonitered, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (self->usingST)
    {
      v24 = 0;
      v14 = (id *)&v24;
      v15 = -[PRProximitySingleThresholdDevice initWithPeer:andPeerModel:withError:]([PRProximitySingleThresholdDevice alloc], "initWithPeer:andPeerModel:withError:", v8, v9, &v24);
    }
    else
    {
      v23 = 0;
      v14 = (id *)&v23;
      v15 = -[PRProximityDevice initWithPeer:andPeerModel:withError:]([PRProximityDevice alloc], "initWithPeer:andPeerModel:withError:", v8, v9, &v23);
    }
    v10 = v15;
    v16 = *v14;
    v12 = v16;
    if (v10)
    {
      v17 = self;
      objc_sync_enter(v17);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->devicesMonitered, "setObject:forKeyedSubscript:", v10, v8);
      objc_sync_exit(v17);

      v13 = 1;
    }
    else
    {
      if (v16)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v16, "userInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Proximity.ErrorDomain"), 200, v19);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      else if (a5)
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v27 = *MEMORY[0x1E0CB2D50];
        v28[0] = CFSTR("Memeory Allocation failure");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Proximity.ErrorDomain"), 200, v21);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v13 = 0;
    }
    goto LABEL_15;
  }
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("Peer Already being monitored");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Proximity.ErrorDomain"), 200, v12);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (BOOL)stopEstimatingProximityFor:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  PRProximityEstimator *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->devicesMonitered, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    -[NSMutableDictionary removeObjectForKey:](self->devicesMonitered, "removeObjectForKey:", v6);
    objc_sync_exit(v8);

  }
  else if (a4)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("Peer not being monitored");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Proximity.ErrorDomain"), 201, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7 != 0;
}

- (BOOL)addRssiSample:(double)a3 channel:(unsigned int)a4 forPeer:(id)a5 withError:(id *)a6
{
  id v10;
  void *v11;
  PRProximityEstimator *v12;
  id WeakRetained;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  PRProximityEstimator *v19;
  id v20;
  _QWORD v21[2];
  unsigned int v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->devicesMonitered, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = self;
    objc_sync_enter(v12);
    v21[0] = PRCommonGetMachContinuousTimeSeconds();
    *(double *)&v21[1] = a3;
    v22 = a4;
    objc_msgSend(v11, "addSample:", v21);
    if (objc_msgSend(v11, "proxReady"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&v12->_delegate);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __64__PRProximityEstimator_addRssiSample_channel_forPeer_withError___block_invoke;
      v17[3] = &unk_1E3D04DA0;
      v18 = WeakRetained;
      v19 = v12;
      v20 = v11;
      v14 = WeakRetained;
      -[PRProximityEstimator invokeDelegateBlock:](v12, "invokeDelegateBlock:", v17);

    }
    objc_sync_exit(v12);
    goto LABEL_7;
  }
  if (a6)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Peer not being monitored");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v12 = (PRProximityEstimator *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Proximity.ErrorDomain"), 202, v12);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  }
  return v11 != 0;
}

void __64__PRProximityEstimator_addRssiSample_channel_forPeer_withError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_msgSend(*(id *)(a1 + 48), "deviceProximity");
  objc_msgSend(*(id *)(a1 + 48), "peer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "estimator:didEstimateProximity:toPeer:", v3, v4);

}

- (void)invokeDelegateBlock:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *delegateQueue;
  id v6;

  v4 = (void (**)(_QWORD))a3;
  delegateQueue = self->_delegateQueue;
  v6 = v4;
  if (delegateQueue)
    dispatch_async(delegateQueue, v4);
  else
    v4[2](v4);

}

- (PRProximityEstimatorDelegate)delegate
{
  return (PRProximityEstimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->devicesMonitered, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)initSingleThresholdEstmatorWithDelegate:(os_log_t)log delegateQueue:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19BF46000, log, OS_LOG_TYPE_DEBUG, "Using Single Threshold estimator.", v1, 2u);
}

@end
