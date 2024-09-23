@implementation PRBTLocalizer

+ (BOOL)isInternalBuild
{
  if (+[PRBTLocalizer isInternalBuild]::onceToken != -1)
    dispatch_once(&+[PRBTLocalizer isInternalBuild]::onceToken, &__block_literal_global_0);
  return +[PRBTLocalizer isInternalBuild]::isInternalBuild;
}

uint64_t __32__PRBTLocalizer_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  +[PRBTLocalizer isInternalBuild]::isInternalBuild = result;
  return result;
}

- (PRBTLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 isUT:(BOOL)a6 productUUID:(id)a7
{
  return -[PRBTLocalizer initWithDelegate:queue:id:isUT:productUUID:withAnalytics:](self, "initWithDelegate:queue:id:isUT:productUUID:withAnalytics:", a3, a4, a5, a6, a7, 1);
}

- (PRBTLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 isUT:(BOOL)a6 productUUID:(id)a7 withAnalytics:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PRBTLocalizer *v19;
  PRBTLocalizer *v20;
  dispatch_queue_t v21;
  dispatch_queue_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  os_log_t v27;
  OS_os_log *logger;
  PRBTCoreAnalytics *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  objc_super v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRBTLocalizer.mm"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    if (v16)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRBTLocalizer.mm"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    goto LABEL_3;
  }
  if (!v16)
    goto LABEL_10;
LABEL_3:
  v36.receiver = self;
  v36.super_class = (Class)PRBTLocalizer;
  v19 = -[PRBTLocalizer init](&v36, sel_init);
  v20 = v19;
  if (v19)
  {
    -[PRBTLocalizer setDelegate:](v19, "setDelegate:", v15);
    -[PRBTLocalizer setDelegateQueue:](v20, "setDelegateQueue:", v16);
    v21 = dispatch_queue_create("com.apple.findmy.btranging", 0);
    -[PRBTLocalizer setProximityQueue:](v20, "setProximityQueue:", v21);

    v22 = dispatch_queue_create("com.apple.findmy.btlocalizer", 0);
    -[PRBTLocalizer setEstimatorQueue:](v20, "setEstimatorQueue:", v22);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7B440]), "initWithCompanionUUID:", v17);
    -[PRBTLocalizer setRemoteDevice:](v20, "setRemoteDevice:", v23);

    -[PRBTLocalizer setProductUUID:](v20, "setProductUUID:", v18);
    v24 = objc_alloc(MEMORY[0x24BE7B428]);
    -[PRBTLocalizer proximityQueue](v20, "proximityQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithDelegate:queue:", v20, v25);
    -[PRBTLocalizer setSession:](v20, "setSession:", v26);

    v20->_localizerState = 0;
    v20->_clientState = 0;
    v20->_isUT = a6;
    v20->_didFetchTxPower = 0;
    v20->_shouldLogAnalytics = a8;
    v20->_lastMeasurementTime = PRCommonGetMachContinuousTimeSeconds();
    v27 = os_log_create("com.apple.proximity", "btlocalizer");
    logger = v20->_logger;
    v20->_logger = (OS_os_log *)v27;

    if (v20->_shouldLogAnalytics)
    {
      v29 = objc_alloc_init(PRBTCoreAnalytics);
      -[PRBTLocalizer setAnalytics:](v20, "setAnalytics:", v29);

      objc_msgSend(v17, "UUIDString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)objc_opt_class(), "isInternalBuild"))
      {
        v37 = CFSTR("deviceId");
        v38[0] = v30;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRBTLocalizer analytics](v20, "analytics");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setCustomData:", v31);

      }
    }
  }

  return v20;
}

- (BOOL)configure
{
  OS_os_log *v3;
  void *v4;
  void *v5;
  void *v6;
  int clientState;
  OS_os_log *v8;
  void *v9;
  void *v10;
  void *v11;
  OS_os_log *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 isUT;
  void *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = self->_logger;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PRBTLocalizer remoteDevice](self, "remoteDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v6;
    _os_log_impl(&dword_2230E5000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "BTLocalizer configuring for item %@", (uint8_t *)&v23, 0xCu);

  }
  clientState = self->_clientState;
  if (clientState)
  {
    v8 = self->_logger;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PRBTLocalizer remoteDevice](self, "remoteDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v11;
      _os_log_impl(&dword_2230E5000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: Unexpected call to configure", (uint8_t *)&v23, 0xCu);

    }
    goto LABEL_10;
  }
  self->_clientState = 1;
  v12 = self->_logger;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    -[PRBTLocalizer remoteDevice](self, "remoteDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v15;
    _os_log_impl(&dword_2230E5000, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: Setting _clientState to LOCALIZER_CLIENT_CONFIGURING configure", (uint8_t *)&v23, 0xCu);

  }
  -[PRBTLocalizer session](self, "session");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRBTLocalizer remoteDevice](self, "remoteDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUT);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchTxPower:isUT:", v18, v19);

  if (self->_shouldLogAnalytics)
  {
    -[PRBTLocalizer analytics](self, "analytics");
    v8 = (OS_os_log *)objc_claimAutoreleasedReturnValue();
    isUT = self->_isUT;
    -[PRBTLocalizer productUUID](self, "productUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[OS_os_log configureSession:withProductUUID:](v8, "configureSession:withProductUUID:", !isUT, v21);

LABEL_10:
  }
  return clientState == 0;
}

- (BOOL)start:(id *)a3
{
  OS_os_log *v4;
  void *v5;
  void *v6;
  void *v7;
  int clientState;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  OS_os_log *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = self->_logger;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PRBTLocalizer remoteDevice](self, "remoteDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v7;
    _os_log_impl(&dword_2230E5000, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "BTLocalizer start for item %@", (uint8_t *)&v18, 0xCu);

  }
  clientState = self->_clientState;
  if (clientState != 2)
  {
    v13 = self->_logger;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      -[PRBTLocalizer remoteDevice](self, "remoteDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_2230E5000, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: Unexpected call to start", (uint8_t *)&v18, 0xCu);

    }
    goto LABEL_11;
  }
  self->_clientState = 3;
  self->_localizerState = 2;
  -[PRBTLocalizer sendBTLocalizerChangedState:](self, "sendBTLocalizerChangedState:", 2);
  v9 = !self->_isUT;
  -[PRBTLocalizer session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRBTLocalizer remoteDevice](self, "remoteDevice");
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startOwnerRanging:", v12);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startUTRanging:", v12);
  }

  if (self->_shouldLogAnalytics)
  {
    -[PRBTLocalizer analytics](self, "analytics");
    v13 = (OS_os_log *)objc_claimAutoreleasedReturnValue();
    -[OS_os_log start](v13, "start");
LABEL_11:

  }
  return clientState == 2;
}

- (BOOL)stop:(id *)a3
{
  OS_os_log *v4;
  void *v5;
  void *v6;
  void *v7;
  int clientState;
  uint64_t v9;
  void *v10;
  OS_os_log *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  OS_os_log *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t localizerState;
  OS_os_log *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  OS_os_log *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD block[4];
  id v39;
  id location;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = self->_logger;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PRBTLocalizer remoteDevice](self, "remoteDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v42 = v7;
    _os_log_impl(&dword_2230E5000, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "BTLocalizer stop for item %@", buf, 0xCu);

  }
  clientState = self->_clientState;
  if (clientState == 3)
  {
    self->_clientState = 2;
    objc_initWeak(&location, self);
    v9 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __22__PRBTLocalizer_stop___block_invoke;
    block[3] = &unk_24EC11360;
    objc_copyWeak(&v39, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    if (self->_isUT)
    {
      v36[0] = v9;
      v36[1] = 3221225472;
      v36[2] = __22__PRBTLocalizer_stop___block_invoke_2;
      v36[3] = &unk_24EC11360;
      objc_copyWeak(&v37, &location);
      v10 = (void *)MEMORY[0x24BDAC9B8];
      dispatch_async(MEMORY[0x24BDAC9B8], v36);

      v11 = self->_logger;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PRBTLocalizer remoteDevice](self, "remoteDevice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = v14;
        _os_log_impl(&dword_2230E5000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "BTlocalizer sending stop UT ranging command for item %@", buf, 0xCu);

      }
      -[PRBTLocalizer session](self, "session");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRBTLocalizer remoteDevice](self, "remoteDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stopUTRanging:", v17);

      self->_localizerState = 1;
      -[PRBTLocalizer sendBTLocalizerChangedState:](self, "sendBTLocalizerChangedState:", 1);
      objc_destroyWeak(&v37);
    }
    else
    {
      localizerState = self->_localizerState;
      if (localizerState == 2)
      {
        v32 = self->_logger;
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
        {
          -[PRBTLocalizer remoteDevice](self, "remoteDevice");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "UUID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "UUIDString");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v42 = v35;
          _os_log_impl(&dword_2230E5000, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, "BTlocalizer has requested ranging for %@ and will send stop later", buf, 0xCu);

        }
      }
      else if (localizerState == 3)
      {
        v25 = self->_logger;
        if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
        {
          -[PRBTLocalizer remoteDevice](self, "remoteDevice");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "UUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "UUIDString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v42 = v28;
          _os_log_impl(&dword_2230E5000, (os_log_t)v25, OS_LOG_TYPE_DEFAULT, "BTlocalizer sending stop owner ranging command for item %@", buf, 0xCu);

        }
        -[PRBTLocalizer session](self, "session");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRBTLocalizer remoteDevice](self, "remoteDevice");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "UUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stopOwnerRanging:", v31);

        self->_localizerState = 4;
        -[PRBTLocalizer sendBTLocalizerChangedState:](self, "sendBTLocalizerChangedState:", 4);
      }
    }
    if (self->_shouldLogAnalytics)
    {
      -[PRBTLocalizer analytics](self, "analytics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stop");

    }
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  else
  {
    v19 = self->_logger;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      -[PRBTLocalizer remoteDevice](self, "remoteDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v22;
      _os_log_impl(&dword_2230E5000, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: Unexpected call to stop", buf, 0xCu);

    }
  }
  return clientState == 3;
}

void __22__PRBTLocalizer_stop___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "measurementTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    objc_msgSend(v6, "setMeasurementTimer:", 0);
    objc_msgSend(v6, "btTrendTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(v6, "setBtTrendTimer:", 0);
    v5 = v6;
  }
  else
  {
    v5 = 0;
  }

}

void __22__PRBTLocalizer_stop___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "utRetryTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    objc_msgSend(v5, "setUtRetryTimer:", 0);
    v4 = v5;
  }
  else
  {
    v4 = 0;
  }

}

- (void)didFetchTxPower:(id)a3 fromDevice:(id)a4 withError:(id)a5
{
  id v9;
  id v10;
  id v11;
  OS_os_log *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  BTFinding::PRRSSIFilter *v21;
  PRRSSIFilter *value;
  int v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self->_logger;
  v13 = os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      objc_msgSend(v10, "UUIDString");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = 136315394;
      v24 = objc_msgSend(v14, "UTF8String");
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_2230E5000, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "BTlocalizer could not fetch TX power from device:%s #error:%@", (uint8_t *)&v23, 0x16u);

    }
    -[PRBTLocalizer session](self, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRBTLocalizer remoteDevice](self, "remoteDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUT);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchTxPower:isUT:", v17, v18);

    goto LABEL_11;
  }
  if (v13)
  {
    objc_msgSend(v10, "UUIDString");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = 136315394;
    v24 = objc_msgSend(v19, "UTF8String");
    v25 = 1024;
    LODWORD(v26) = objc_msgSend(v9, "intValue");
    _os_log_impl(&dword_2230E5000, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "BTlocalizer didFetchTxPower from device:%s txPower:%d", (uint8_t *)&v23, 0x12u);

  }
  self->_didFetchTxPower = 1;
  objc_storeStrong((id *)&self->_txPower, a3);
  v20 = -[NSNumber intValue](self->_txPower, "intValue");
  v21 = (BTFinding::PRRSSIFilter *)operator new();
  BTFinding::PRRSSIFilter::PRRSSIFilter(v21, v20);
  value = self->_rssiFilter.__ptr_.__value_;
  self->_rssiFilter.__ptr_.__value_ = (PRRSSIFilter *)v21;
  if (value)
    std::default_delete<BTFinding::PRRSSIFilter>::operator()[abi:ne180100]((uint64_t)&self->_rssiFilter, (uint64_t)value);
  self->_localizerState = 1;
  self->_clientState = 2;
  -[PRBTLocalizer sendBTLocalizerChangedState:](self, "sendBTLocalizerChangedState:", 1);
  if (self->_shouldLogAnalytics)
  {
    -[PRBTLocalizer analytics](self, "analytics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configureComplete:", -[NSNumber intValue](self->_txPower, "intValue"));
LABEL_11:

  }
}

- (void)didStartRangingOnDevice:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  OS_os_log *v8;
  _BOOL4 v9;
  id v10;
  id v11;
  OS_os_log *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 isUT;
  OS_os_log *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD block[4];
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_logger;
  v9 = os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v6, "UUIDString");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      v34 = objc_msgSend(v10, "UTF8String");
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_2230E5000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "BTlocalizer could not start ranging on device:%s #error:%@", buf, 0x16u);

    }
  }
  else
  {
    if (v9)
    {
      objc_msgSend(v6, "UUIDString");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      v34 = objc_msgSend(v11, "UTF8String");
      _os_log_impl(&dword_2230E5000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "BTlocalizer didStartRangingOnDevice:%s", buf, 0xCu);

    }
    if (self->_clientState == 3)
    {
      if (self->_localizerState == 2)
        -[PRBTLocalizer sendBTLocalizerChangedState:](self, "sendBTLocalizerChangedState:", 3);
      self->_localizerState = 3;
      if (self->_isUT)
      {
        objc_initWeak((id *)buf, self);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __51__PRBTLocalizer_didStartRangingOnDevice_withError___block_invoke;
        block[3] = &unk_24EC11360;
        objc_copyWeak(&v32, (id *)buf);
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      v12 = self->_logger;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        -[PRBTLocalizer remoteDevice](self, "remoteDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v34 = (uint64_t)v15;
        _os_log_impl(&dword_2230E5000, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "BTlocalizer received didStartRangingOnDevice despite client not ranging for item %@", buf, 0xCu);

      }
      isUT = self->_isUT;
      v17 = self->_logger;
      v18 = os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT);
      if (isUT)
      {
        if (v18)
        {
          -[PRBTLocalizer remoteDevice](self, "remoteDevice");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "UUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "UUIDString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v34 = (uint64_t)v21;
          _os_log_impl(&dword_2230E5000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "BTlocalizer sending stop UT ranging command for item %@", buf, 0xCu);

        }
        -[PRBTLocalizer session](self, "session");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRBTLocalizer remoteDevice](self, "remoteDevice");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stopUTRanging:", v24);

      }
      else
      {
        if (v18)
        {
          -[PRBTLocalizer remoteDevice](self, "remoteDevice");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "UUIDString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v34 = (uint64_t)v27;
          _os_log_impl(&dword_2230E5000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "BTlocalizer sending stop owner ranging command for item %@", buf, 0xCu);

        }
        -[PRBTLocalizer session](self, "session");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRBTLocalizer remoteDevice](self, "remoteDevice");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "UUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stopOwnerRanging:", v30);

      }
    }
  }

}

void __51__PRBTLocalizer_didStartRangingOnDevice_withError___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "utRetryTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(v3, "setUtRetryTimer:", 0);
    v5 = (void *)MEMORY[0x24BDBCF40];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__PRBTLocalizer_didStartRangingOnDevice_withError___block_invoke_2;
    v8[3] = &unk_24EC11388;
    v6 = v3;
    v9 = v6;
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 110.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUtRetryTimer:", v7);

  }
}

void __51__PRBTLocalizer_didStartRangingOnDevice_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "remoteDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_2230E5000, v4, OS_LOG_TYPE_DEFAULT, "BTlocalizer resending start UT ranging for item %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "remoteDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startUTRanging:", v10);

}

- (void)didStopOwnerRangingOnDevice:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  OS_os_log *v8;
  _BOOL4 v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!self->_isUT)
  {
    v8 = self->_logger;
    v9 = os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        objc_msgSend(v6, "UUIDString");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v12 = 136315394;
        v13 = objc_msgSend(v10, "UTF8String");
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_2230E5000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "BTlocalizer could not stop owner ranging on device:%s #error:%@", (uint8_t *)&v12, 0x16u);

      }
    }
    else
    {
      if (v9)
      {
        objc_msgSend(v6, "UUIDString");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v12 = 136315394;
        v13 = objc_msgSend(v11, "UTF8String");
        v14 = 2112;
        v15 = 0;
        _os_log_impl(&dword_2230E5000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "BTlocalizer stopped owner ranging on device:%s #error:%@", (uint8_t *)&v12, 0x16u);

      }
      self->_localizerState = 1;
      -[PRBTLocalizer sendBTLocalizerChangedState:](self, "sendBTLocalizerChangedState:", 1);
    }
  }

}

- (void)sendBTLocalizerChangedState:(unint64_t)a3
{
  OS_os_log *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id WeakRetained;
  _QWORD v13[4];
  id v14;
  id v15[2];
  _QWORD block[4];
  id v17;
  id v18[2];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = self->_logger;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PRBTLocalizer remoteDevice](self, "remoteDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v8;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_2230E5000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: ItemLocalizer changed state: %ld", buf, 0x16u);

  }
  -[PRBTLocalizer delegateQueue](self, "delegateQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PRBTLocalizer delegateQueue](self, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = MEMORY[0x24BDAC9B8];
    v11 = MEMORY[0x24BDAC9B8];
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__PRBTLocalizer_sendBTLocalizerChangedState___block_invoke;
    block[3] = &unk_24EC113B0;
    objc_copyWeak(v18, (id *)buf);
    v17 = WeakRetained;
    v18[1] = (id)a3;
    dispatch_async(v10, block);

    objc_destroyWeak(v18);
    objc_destroyWeak((id *)buf);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __45__PRBTLocalizer_sendBTLocalizerChangedState___block_invoke_2;
    v13[3] = &unk_24EC113B0;
    objc_copyWeak(v15, (id *)buf);
    v14 = WeakRetained;
    v15[1] = (id)a3;
    dispatch_async(v10, v13);

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)buf);
  }

}

void __45__PRBTLocalizer_sendBTLocalizerChangedState___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(*(id *)(a1 + 32), "btLocalizerChangedState:", *(_QWORD *)(a1 + 48));
    v4 = v5;
  }
  else
  {
    v4 = 0;
  }

}

void __45__PRBTLocalizer_sendBTLocalizerChangedState___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v9 = v4;
    objc_msgSend(v4, "remoteDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "btLocalizerChangedState:onItem:", v6, v8);

  }
}

- (void)didConnectDevice:(id)a3 error:(id)a4
{
  id v5;
  OS_os_log *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = self->_logger;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    -[PRBTLocalizer remoteDevice](self, "remoteDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_2230E5000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "BTlocalizer didConnectDevice %@ error: %@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)updateDelegateWithSelector:(SEL)a3 object:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  SEL v12;

  v6 = a4;
  -[PRBTLocalizer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PRBTLocalizer delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__PRBTLocalizer_updateDelegateWithSelector_object___block_invoke;
    block[3] = &unk_24EC113D8;
    v10 = v7;
    v12 = a3;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __51__PRBTLocalizer_updateDelegateWithSelector_object___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)didReceiveNewBTRSSI:(id)a3
{
  id v4;
  OS_os_log *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_logger;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PRBTLocalizer remoteDevice](self, "remoteDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    *(_DWORD *)buf = 138413058;
    v18 = v8;
    v19 = 2048;
    v20 = v9;
    v21 = 1024;
    v22 = objc_msgSend(v4, "rssi_dbm");
    v23 = 1024;
    v24 = objc_msgSend(v4, "channel");
    _os_log_impl(&dword_2230E5000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "BTlocalizer received new measurement from %@ with timestamp %f, RSSI %d, channel %d", buf, 0x22u);

  }
  if (self->_localizerState == 3)
  {
    -[PRBTLocalizer notifyDelegateOfRawMeasurement:](self, "notifyDelegateOfRawMeasurement:", v4);
    objc_initWeak((id *)buf, self);
    -[PRBTLocalizer estimatorQueue](self, "estimatorQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__PRBTLocalizer_didReceiveNewBTRSSI___block_invoke;
    block[3] = &unk_24EC11400;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v4;
    dispatch_async(v10, block);

    v12[0] = v11;
    v12[1] = 3221225472;
    v12[2] = __37__PRBTLocalizer_didReceiveNewBTRSSI___block_invoke_2;
    v12[3] = &unk_24EC11360;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_async(MEMORY[0x24BDAC9B8], v12);
    objc_destroyWeak(&v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

}

void __37__PRBTLocalizer_didReceiveNewBTRSSI___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(*(id *)(a1 + 32), "timestamp");
    v6[6] = v4;
    objc_msgSend(v6, "processRssiMeasurement:", *(_QWORD *)(a1 + 32));
    v5 = v6;
  }
  else
  {
    v5 = 0;
  }

}

void __37__PRBTLocalizer_didReceiveNewBTRSSI___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "measurementTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(v3, "setMeasurementTimer:", 0);
    v5 = (void *)MEMORY[0x24BDBCF40];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __37__PRBTLocalizer_didReceiveNewBTRSSI___block_invoke_3;
    v8[3] = &unk_24EC11388;
    v6 = v3;
    v9 = v6;
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 10.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMeasurementTimer:", v7);

  }
}

uint64_t __37__PRBTLocalizer_didReceiveNewBTRSSI___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkForMeasurementTimeout");
}

- (void)checkForMeasurementTimeout
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PRBTLocalizer estimatorQueue](self, "estimatorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__PRBTLocalizer_checkForMeasurementTimeout__block_invoke;
  v4[3] = &unk_24EC11360;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __43__PRBTLocalizer_checkForMeasurementTimeout__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  double v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  PRBTProximityMeasurement *v10;
  double MachContinuousTimeSeconds;
  void *v12;
  void *v13;
  PRBTProximityMeasurement *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    v4 = PRCommonGetMachContinuousTimeSeconds() - *((double *)v3 + 6);
    v5 = *((id *)v3 + 2);
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4 <= 10.0)
    {
      if (v6)
      {
        objc_msgSend(v3, "remoteDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "UUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v18;
        _os_log_impl(&dword_2230E5000, v5, OS_LOG_TYPE_DEFAULT, "BTlocalizer measurement timer for %@ fired erroneously - no need to send unknown level", (uint8_t *)&v19, 0xCu);

      }
    }
    else
    {
      if (v6)
      {
        objc_msgSend(v3, "remoteDevice");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        v20 = v9;
        v21 = 2048;
        v22 = 0x4024000000000000;
        _os_log_impl(&dword_2230E5000, v5, OS_LOG_TYPE_DEFAULT, "BTlocalizer has not received new measurements from %@ in %2.1f seconds - resetting proximity level", (uint8_t *)&v19, 0x16u);

      }
      v10 = [PRBTProximityMeasurement alloc];
      MachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
      objc_msgSend(v3, "remoteDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PRBTProximityMeasurement initWithTime:proximityLevel:rssi:continuousProximityLevel:uuid:proximityTrend:](v10, "initWithTime:proximityLevel:rssi:continuousProximityLevel:uuid:proximityTrend:", 0, 0, v13, 0, MachContinuousTimeSeconds, -128.0);
      objc_msgSend(v3, "setLatestProximityMeasurement:", v14);

      objc_msgSend(v3, "latestProximityMeasurement");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "updateDelegateWithSelector:object:", sel_didUpdateBTProximity_, v15);

      if (*((_BYTE *)v3 + 42))
        objc_msgSend(*((id *)v3 + 19), "revokeProximityLevel");
    }
  }
  else
  {
    v3 = 0;
  }

}

- (void)notifyDelegateOfRawMeasurement:(id)a3
{
  PRBTRssiMeasurement *v4;
  double v5;
  double v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PRBTRssiMeasurement *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = [PRBTRssiMeasurement alloc];
  objc_msgSend(v14, "timestamp");
  v6 = v5;
  v7 = objc_msgSend(v14, "rssi_dbm");
  v8 = objc_msgSend(v14, "channel") - 37;
  if (v8 >= 3)
    v9 = 3;
  else
    v9 = v8;
  -[PRBTLocalizer remoteDevice](self, "remoteDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PRBTRssiMeasurement initWithTime:rssi:channel:uuid:](v4, "initWithTime:rssi:channel:uuid:", v7, v9, v11, v6);

  -[PRBTLocalizer updateDelegateWithSelector:object:](self, "updateDelegateWithSelector:object:", sel_willIntegrateBTRSSI_, v12);
  if (self->_shouldLogAnalytics)
  {
    -[PRBTLocalizer analytics](self, "analytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateWithRssiMeasurement:", v12);

  }
}

- (void)processRssiMeasurement:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  OS_os_log *v7;
  void *v8;
  void *v9;
  void *v10;
  OS_os_log *v11;
  void *v12;
  void *v13;
  void *v14;
  _OWORD v15[2];
  _OWORD v16[2];
  int v17;
  uint64_t v18;
  int v19;
  uint8_t buf[16];
  __int128 v21;
  _BYTE v22[32];
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "channel") == 37)
  {
    v5 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "channel") == 38)
  {
    v5 = 1;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "channel") == 39)
  {
    v5 = 2;
LABEL_7:
    v17 = objc_msgSend(v4, "rssi_dbm");
    objc_msgSend(v4, "timestamp");
    v18 = v6;
    v19 = v5;
    BTFinding::PRRSSIFilter::addRSSImeasurement((uint64_t)self->_rssiFilter.__ptr_.__value_, (uint64_t)&v17, (uint64_t)v22);
    if (v23)
    {
      *(_OWORD *)buf = *(_OWORD *)v22;
      v21 = *(_OWORD *)&v22[16];
      v16[0] = *(_OWORD *)v22;
      v16[1] = *(_OWORD *)&v22[16];
      -[PRBTLocalizer logEstimatorOutput:](self, "logEstimatorOutput:", v16);
      v15[0] = *(_OWORD *)buf;
      v15[1] = v21;
      -[PRBTLocalizer notifyDelegateOfFilterOutput:](self, "notifyDelegateOfFilterOutput:", v15);
    }
    else
    {
      v7 = self->_logger;
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        -[PRBTLocalizer remoteDevice](self, "remoteDevice");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl(&dword_2230E5000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "BTlocalizer for %@ no output produced for estimator input", buf, 0xCu);

      }
    }
    goto LABEL_15;
  }
  v11 = self->_logger;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
  {
    -[PRBTLocalizer remoteDevice](self, "remoteDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v22 = 138412546;
    *(_QWORD *)&v22[4] = v14;
    *(_WORD *)&v22[12] = 1024;
    *(_DWORD *)&v22[14] = objc_msgSend(v4, "channel");
    _os_log_error_impl(&dword_2230E5000, (os_log_t)v11, OS_LOG_TYPE_ERROR, "BTlocalizer for %@ received a measurement with an unusable channel %d, discarding measurement", v22, 0x12u);

  }
LABEL_15:

}

- (void)logEstimatorOutput:(RSSIFilterResult *)a3
{
  int var2;
  OS_os_log *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double var3;
  double var0;
  double var1;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  int v25;
  void *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  var2 = a3->var2;
  if (var2 == 2)
  {
    v6 = self->_logger;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PRBTLocalizer remoteDevice](self, "remoteDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      var3 = a3->var3;
      var0 = a3->var0;
      var1 = a3->var1;
      v25 = 138413058;
      v26 = v15;
      v27 = 2048;
      v28 = var0;
      v29 = 2048;
      v30 = var3;
      v31 = 2048;
      v32 = var1;
      _os_log_impl(&dword_2230E5000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "BTlocalizer received estimator output for %@ with level: FAR, rssi: %f dB, continuous level: %3.2f, timestamp %f s", (uint8_t *)&v25, 0x2Au);

    }
  }
  else if (var2 == 1)
  {
    v6 = self->_logger;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PRBTLocalizer remoteDevice](self, "remoteDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = a3->var3;
      v23 = a3->var0;
      v24 = a3->var1;
      v25 = 138413058;
      v26 = v21;
      v27 = 2048;
      v28 = v23;
      v29 = 2048;
      v30 = v22;
      v31 = 2048;
      v32 = v24;
      _os_log_impl(&dword_2230E5000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "BTlocalizer received estimator output for %@ with level: CLOSE, rssi: %f dB, continuous level: %3.2f, timestamp %f s", (uint8_t *)&v25, 0x2Au);

    }
  }
  else
  {
    if (var2)
      return;
    v6 = self->_logger;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PRBTLocalizer remoteDevice](self, "remoteDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = a3->var3;
      v11 = a3->var0;
      v12 = a3->var1;
      v25 = 138413058;
      v26 = v9;
      v27 = 2048;
      v28 = v11;
      v29 = 2048;
      v30 = v10;
      v31 = 2048;
      v32 = v12;
      _os_log_impl(&dword_2230E5000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "BTlocalizer received estimator output for %@ with level: NEARBY, rssi: %f dB, continuous level: %3.2f, timestamp %f s", (uint8_t *)&v25, 0x2Au);

    }
  }

}

- (void)notifyDelegateOfFilterOutput:(RSSIFilterResult *)a3
{
  uint64_t var2;
  unint64_t v6;
  PRBTProximityMeasurement *latestProximityMeasurement;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  OS_os_log *v11;
  void *v12;
  void *v13;
  void *v14;
  PRBTProximityMeasurement *v15;
  double var0;
  double var1;
  void *v18;
  void *v19;
  void *v20;
  PRBTProximityMeasurement *v21;
  PRBTProximityMeasurement *v22;
  void *v23;
  OS_os_log *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD block[4];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  unint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  var2 = a3->var2;
  if (var2 > 2)
    v6 = 0;
  else
    v6 = qword_223118ED8[var2];
  latestProximityMeasurement = self->_latestProximityMeasurement;
  if (!latestProximityMeasurement
    || (v8 = -[PRBTProximityMeasurement proximityLevel](latestProximityMeasurement, "proximityLevel")) == 0)
  {
LABEL_8:
    v11 = self->_logger;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      -[PRBTLocalizer remoteDevice](self, "remoteDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v14;
      _os_log_impl(&dword_2230E5000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "BTlocalizer current bt rssi trend for %@ : UNKNOWN", buf, 0xCu);

    }
    v10 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v9 = v8;
  if (v6 != v8)
  {
    v24 = self->_logger;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      -[PRBTLocalizer remoteDevice](self, "remoteDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v40 = v27;
      v41 = 2048;
      v42 = v9;
      v43 = 2048;
      v44 = v6;
      _os_log_impl(&dword_2230E5000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "BTlocalizer detected a level change %@ with previous level: %lu, new level: %lu", buf, 0x20u);

    }
    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__PRBTLocalizer_notifyDelegateOfFilterOutput___block_invoke;
    block[3] = &unk_24EC11360;
    objc_copyWeak(&v38, (id *)buf);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
    if (v6 <= v9)
    {
LABEL_21:
      v11 = self->_logger;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PRBTLocalizer remoteDevice](self, "remoteDevice");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "UUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "UUIDString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v33;
        _os_log_impl(&dword_2230E5000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "BTlocalizer current bt rssi trend for %@ : DECREASING", buf, 0xCu);

      }
      v10 = 1;
    }
    else
    {
LABEL_18:
      v11 = self->_logger;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PRBTLocalizer remoteDevice](self, "remoteDevice");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "UUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "UUIDString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v30;
        _os_log_impl(&dword_2230E5000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "BTlocalizer current bt rssi trend for %@ : INCREASING", buf, 0xCu);

      }
      v10 = 3;
    }
    goto LABEL_11;
  }
  v10 = -[PRBTProximityMeasurement proximityTrend](self->_latestProximityMeasurement, "proximityTrend");
  switch(v10)
  {
    case 0uLL:
      goto LABEL_8;
    case 1uLL:
      goto LABEL_21;
    case 2uLL:
      v11 = self->_logger;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PRBTLocalizer remoteDevice](self, "remoteDevice");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "UUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "UUIDString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v36;
        _os_log_impl(&dword_2230E5000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "BTlocalizer current bt rssi trend for %@ : STABLE", buf, 0xCu);

      }
      v10 = 2;
      goto LABEL_11;
    case 3uLL:
      goto LABEL_18;
    default:
      break;
  }
LABEL_12:
  v15 = [PRBTProximityMeasurement alloc];
  var0 = a3->var0;
  var1 = a3->var1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->var3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRBTLocalizer remoteDevice](self, "remoteDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PRBTProximityMeasurement initWithTime:proximityLevel:rssi:continuousProximityLevel:uuid:proximityTrend:](v15, "initWithTime:proximityLevel:rssi:continuousProximityLevel:uuid:proximityTrend:", v6, v18, v20, v10, var1, var0);
  v22 = self->_latestProximityMeasurement;
  self->_latestProximityMeasurement = v21;

  -[PRBTLocalizer updateDelegateWithSelector:object:](self, "updateDelegateWithSelector:object:", sel_didUpdateBTProximity_, self->_latestProximityMeasurement);
  if (self->_shouldLogAnalytics)
  {
    -[PRBTLocalizer analytics](self, "analytics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateWithProximityLevel:", self->_latestProximityMeasurement);

  }
}

void __46__PRBTLocalizer_notifyDelegateOfFilterOutput___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "btTrendTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(v3, "setBtTrendTimer:", 0);
    v5 = (void *)MEMORY[0x24BDBCF40];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __46__PRBTLocalizer_notifyDelegateOfFilterOutput___block_invoke_2;
    v8[3] = &unk_24EC11388;
    v6 = v3;
    v9 = v6;
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 9.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBtTrendTimer:", v7);

  }
}

uint64_t __46__PRBTLocalizer_notifyDelegateOfFilterOutput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetBtTrend");
}

- (void)resetBtTrend
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PRBTLocalizer estimatorQueue](self, "estimatorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__PRBTLocalizer_resetBtTrend__block_invoke;
  v4[3] = &unk_24EC11360;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __29__PRBTLocalizer_resetBtTrend__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = (id *)objc_loadWeakRetained(v1);
    v4 = v3[2];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "remoteDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 134218242;
      v22 = 0x4023000000000000;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_2230E5000, v4, OS_LOG_TYPE_DEFAULT, "BTLocalizer has not seen a bt level change in %2.1f seconds seconds - resetting trend to stable for %@", (uint8_t *)&v21, 0x16u);

    }
    objc_msgSend(v3, "latestProximityMeasurement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timestamp");
    v10 = v9;
    objc_msgSend(v3, "latestProximityMeasurement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "proximityLevel");
    objc_msgSend(v3, "latestProximityMeasurement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rssi");
    v15 = v14;
    objc_msgSend(v3, "latestProximityMeasurement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "continuousProximityLevel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "latestProximityMeasurement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRBTProximityMeasurement btProximityWithTime:proximityLevel:rssi:continuousProximityLevel:uuid:proximityTrend:](PRBTProximityMeasurement, "btProximityWithTime:proximityLevel:rssi:continuousProximityLevel:uuid:proximityTrend:", v12, v17, v19, 2, v10, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLatestProximityMeasurement:", v20);

  }
}

- (void)didFailWithError:(id)a3
{
  id v4;
  OS_os_log *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id WeakRetained;
  OS_os_log *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  dispatch_time_t v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD block[4];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_logger;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PRBTLocalizer remoteDevice](self, "remoteDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v8;
    v38 = 2112;
    v39 = (uint64_t)v4;
    _os_log_impl(&dword_2230E5000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "BTlocalizer for %@ didFailWithError: %@", buf, 0x16u);

  }
  if (self->_shouldLogAnalytics)
  {
    -[PRBTLocalizer analytics](self, "analytics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rangingFailedWithError:", v4);

  }
  if (objc_msgSend(v4, "code") == 303 || objc_msgSend(v4, "code") == 304)
  {
    -[PRBTLocalizer updateDelegateWithSelector:object:](self, "updateDelegateWithSelector:object:", sel_didFailWithError_, v4);
    objc_initWeak((id *)buf, self);
    -[PRBTLocalizer estimatorQueue](self, "estimatorQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__PRBTLocalizer_didFailWithError___block_invoke_35;
    block[3] = &unk_24EC11360;
    objc_copyWeak(&v31, (id *)buf);
    dispatch_async(v10, block);

    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __34__PRBTLocalizer_didFailWithError___block_invoke_2_36;
    v28[3] = &unk_24EC11360;
    objc_copyWeak(&v29, (id *)buf);
    dispatch_async(MEMORY[0x24BDAC9B8], v28);
    -[PRBTLocalizer delegateQueue](self, "delegateQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[PRBTLocalizer delegateQueue](self, "delegateQueue");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = MEMORY[0x24BDAC9B8];
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v24[0] = v11;
      v24[1] = 3221225472;
      v24[2] = __34__PRBTLocalizer_didFailWithError___block_invoke_3;
      v24[3] = &unk_24EC11428;
      objc_copyWeak(&v27, (id *)buf);
      v25 = WeakRetained;
      v26 = v4;
      dispatch_async(v13, v24);

      objc_destroyWeak(&v27);
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = self->_logger;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      -[PRBTLocalizer remoteDevice](self, "remoteDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v4, "code");
      *(_DWORD *)buf = 138412546;
      v37 = v18;
      v38 = 2048;
      v39 = v19;
      _os_log_impl(&dword_2230E5000, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: BTLocalizer received error code %lld", buf, 0x16u);

    }
    v20 = MEMORY[0x24BDAC760];
    if (self->_isUT)
    {
      objc_initWeak((id *)buf, self);
      v34[0] = v20;
      v34[1] = 3221225472;
      v34[2] = __34__PRBTLocalizer_didFailWithError___block_invoke;
      v34[3] = &unk_24EC11360;
      objc_copyWeak(&v35, (id *)buf);
      dispatch_async(MEMORY[0x24BDAC9B8], v34);
      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
    }
    -[PRBTLocalizer session](self, "session");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "invalidate");

    -[PRBTLocalizer setSession:](self, "setSession:", 0);
    objc_initWeak((id *)buf, self);
    v22 = dispatch_time(0, 100000000);
    -[PRBTLocalizer proximityQueue](self, "proximityQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v32[0] = v20;
    v32[1] = 3221225472;
    v32[2] = __34__PRBTLocalizer_didFailWithError___block_invoke_2;
    v32[3] = &unk_24EC11400;
    objc_copyWeak(&v33, (id *)buf);
    v32[4] = self;
    dispatch_after(v22, v23, v32);

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }

}

void __34__PRBTLocalizer_didFailWithError___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "utRetryTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    objc_msgSend(v5, "setUtRetryTimer:", 0);
    v4 = v5;
  }
  else
  {
    v4 = 0;
  }

}

void __34__PRBTLocalizer_didFailWithError___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = (id *)objc_loadWeakRetained(v2);
    v5 = v4[2];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "remoteDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138412290;
      v39 = v8;
      _os_log_impl(&dword_2230E5000, v5, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: PRBTRangingSession initWithDelegate", (uint8_t *)&v38, 0xCu);

    }
    v9 = objc_alloc(MEMORY[0x24BE7B428]);
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "proximityQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithDelegate:queue:", v10, v11);
    objc_msgSend(v4, "setSession:", v12);

    v13 = (char *)v4[4];
    if ((unint64_t)(v13 - 2) < 2)
    {
      v21 = *((unsigned __int8 *)v4 + 41);
      if (*((_DWORD *)v4 + 6) == 3)
      {
        v22 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v21)
        {
          if (v23)
          {
            objc_msgSend(v4, "remoteDevice");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "UUID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "UUIDString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 138412290;
            v39 = v26;
            _os_log_impl(&dword_2230E5000, v22, OS_LOG_TYPE_DEFAULT, "BTlocalizer reattempt start UT ranging for %@", (uint8_t *)&v38, 0xCu);

          }
          objc_msgSend(*(id *)(a1 + 32), "session");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "remoteDevice");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "UUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "startUTRanging:", v20);
        }
        else
        {
          if (v23)
          {
            objc_msgSend(v4, "remoteDevice");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "UUID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "UUIDString");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 138412290;
            v39 = v37;
            _os_log_impl(&dword_2230E5000, v22, OS_LOG_TYPE_DEFAULT, "BTlocalizer reattempt start owner ranging for %@", (uint8_t *)&v38, 0xCu);

          }
          objc_msgSend(*(id *)(a1 + 32), "session");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "remoteDevice");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "UUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "startOwnerRanging:", v20);
        }
        goto LABEL_27;
      }
      if (!*((_BYTE *)v4 + 41))
      {
        v14 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "remoteDevice");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "UUID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "UUIDString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138412290;
          v39 = v34;
          _os_log_impl(&dword_2230E5000, v14, OS_LOG_TYPE_DEFAULT, "BTLocalizer stop for %@", (uint8_t *)&v38, 0xCu);

        }
LABEL_10:

        objc_msgSend(*(id *)(a1 + 32), "session");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "remoteDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stopOwnerRanging:", v20);
LABEL_27:

      }
    }
    else
    {
      if (v13)
      {
        if (v13 != (char *)4 || *((_BYTE *)v4 + 41))
          goto LABEL_28;
        v14 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "remoteDevice");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "UUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138412290;
          v39 = v17;
          _os_log_impl(&dword_2230E5000, v14, OS_LOG_TYPE_DEFAULT, "BTLocalizer reattempt stop owner ranging for %@", (uint8_t *)&v38, 0xCu);

        }
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 40))
      {
        v27 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "remoteDevice");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "UUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "UUIDString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138412290;
          v39 = v30;
          _os_log_impl(&dword_2230E5000, v27, OS_LOG_TYPE_DEFAULT, "BTlocalizer reattempt fetchTX power for %@", (uint8_t *)&v38, 0xCu);

        }
        objc_msgSend(v4, "session");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "remoteDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v4 + 41));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fetchTxPower:isUT:", v20, v31);

        goto LABEL_27;
      }
    }
LABEL_28:

  }
}

void __34__PRBTLocalizer_didFailWithError___block_invoke_35(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  PRBTProximityMeasurement *v3;
  double MachContinuousTimeSeconds;
  void *v5;
  void *v6;
  PRBTProximityMeasurement *v7;
  void *v8;
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained(v1);
    v3 = [PRBTProximityMeasurement alloc];
    MachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
    objc_msgSend(v9, "remoteDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PRBTProximityMeasurement initWithTime:proximityLevel:rssi:continuousProximityLevel:uuid:proximityTrend:](v3, "initWithTime:proximityLevel:rssi:continuousProximityLevel:uuid:proximityTrend:", 0, 0, v6, 0, MachContinuousTimeSeconds, -128.0);
    objc_msgSend(v9, "setLatestProximityMeasurement:", v7);

    objc_msgSend(v9, "latestProximityMeasurement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateDelegateWithSelector:object:", sel_didUpdateBTProximity_, v8);

  }
}

void __34__PRBTLocalizer_didFailWithError___block_invoke_2_36(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "measurementTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    objc_msgSend(v7, "setMeasurementTimer:", 0);
    objc_msgSend(v7, "btTrendTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(v7, "setBtTrendTimer:", 0);
    objc_msgSend(v7, "utRetryTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    objc_msgSend(v7, "setUtRetryTimer:", 0);
    v6 = v7;
  }
  else
  {
    v6 = 0;
  }

}

void __34__PRBTLocalizer_didFailWithError___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v9 = v4;
    objc_msgSend(v4, "remoteDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didFailWithError:onItem:", v6, v8);

  }
}

- (void)dealloc
{
  OS_os_log *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = self->_logger;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PRBTLocalizer remoteDevice](self, "remoteDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_2230E5000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "%@: Destructing PRBTLocalizer and invalidating nearbyd XCP connection.", buf, 0xCu);

  }
  if (!self->_isUT && self->_localizerState == 3)
  {
    -[PRBTLocalizer session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRBTLocalizer remoteDevice](self, "remoteDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopOwnerRanging:", v9);

  }
  if (self->_shouldLogAnalytics)
  {
    -[PRBTLocalizer analytics](self, "analytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deinit");

  }
  -[PRBTLocalizer measurementTimer](self, "measurementTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidate");

  -[PRBTLocalizer utRetryTimer](self, "utRetryTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

  -[PRBTLocalizer btTrendTimer](self, "btTrendTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidate");

  -[PRBTLocalizer session](self, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidate");

  -[PRBTLocalizer setSession:](self, "setSession:", 0);
  v15.receiver = self;
  v15.super_class = (Class)PRBTLocalizer;
  -[PRBTLocalizer dealloc](&v15, sel_dealloc);
}

- (PRBTLocalizerDelegate)delegate
{
  return (PRBTLocalizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PRBTRangingSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (PRRemoteDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
  objc_storeStrong((id *)&self->_productUUID, a3);
}

- (OS_dispatch_queue)proximityQueue
{
  return self->_proximityQueue;
}

- (void)setProximityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_proximityQueue, a3);
}

- (NSTimer)measurementTimer
{
  return self->_measurementTimer;
}

- (void)setMeasurementTimer:(id)a3
{
  objc_storeStrong((id *)&self->_measurementTimer, a3);
}

- (NSTimer)utRetryTimer
{
  return self->_utRetryTimer;
}

- (void)setUtRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_utRetryTimer, a3);
}

- (NSTimer)btTrendTimer
{
  return self->_btTrendTimer;
}

- (void)setBtTrendTimer:(id)a3
{
  objc_storeStrong((id *)&self->_btTrendTimer, a3);
}

- (PRBTProximityMeasurement)latestProximityMeasurement
{
  return self->_latestProximityMeasurement;
}

- (void)setLatestProximityMeasurement:(id)a3
{
  objc_storeStrong((id *)&self->_latestProximityMeasurement, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (OS_dispatch_queue)estimatorQueue
{
  return self->_estimatorQueue;
}

- (void)setEstimatorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_estimatorQueue, a3);
}

- (NSNumber)txPower
{
  return self->_txPower;
}

- (void)setTxPower:(id)a3
{
  objc_storeStrong((id *)&self->_txPower, a3);
}

- (PRBTCoreAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (void).cxx_destruct
{
  uint64_t v3;
  unique_ptr<BTFinding::PRRSSIFilter, std::default_delete<BTFinding::PRRSSIFilter>> *p_rssiFilter;
  PRRSSIFilter *value;

  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_txPower, 0);
  objc_storeStrong((id *)&self->_estimatorQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_latestProximityMeasurement, 0);
  objc_storeStrong((id *)&self->_btTrendTimer, 0);
  objc_storeStrong((id *)&self->_utRetryTimer, 0);
  objc_storeStrong((id *)&self->_measurementTimer, 0);
  objc_storeStrong((id *)&self->_proximityQueue, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
  value = self->_rssiFilter.__ptr_.__value_;
  p_rssiFilter = &self->_rssiFilter;
  v3 = (uint64_t)value;
  p_rssiFilter->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<BTFinding::PRRSSIFilter>::operator()[abi:ne180100]((uint64_t)p_rssiFilter, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
