@implementation PRItemLocalizer

+ (BOOL)isInternalBuild
{
  if (+[PRItemLocalizer isInternalBuild]::onceToken != -1)
    dispatch_once(&+[PRItemLocalizer isInternalBuild]::onceToken, &__block_literal_global_1);
  return +[PRItemLocalizer isInternalBuild]::isInternalBuild;
}

uint64_t __34__PRItemLocalizer_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  +[PRItemLocalizer isInternalBuild]::isInternalBuild = result;
  return result;
}

- (PRItemLocalizer)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PRItemLocalizer *v10;
  PRItemLocalizer *v11;
  PRItemLocalizer *v12;
  dispatch_queue_t v13;
  id v14;
  void *v15;
  void *v16;
  dispatch_queue_t v17;
  void *v18;
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *v19;
  RoseSyntheticApertureFiltering::PRRoseRangeFilter *v20;
  id v21;
  id v22;
  os_log_t v23;
  OS_os_log *logger;
  NSObject *v25;
  PRFindMyCoreAnalytics *v26;
  void *v28;
  void *v29;
  uint8_t buf[8];
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRItemLocalizer.mm"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRItemLocalizer.mm"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_3:
  v31.receiver = self;
  v31.super_class = (Class)PRItemLocalizer;
  v10 = -[PRItemLocalizer init](&v31, sel_init);
  v11 = v10;
  v12 = v10;
  if (v10)
  {
    -[PRItemLocalizer setDelegate:](v10, "setDelegate:", v7);
    -[PRItemLocalizer setDelegateQueue:](v12, "setDelegateQueue:", v9);
    v13 = dispatch_queue_create("com.apple.findmy.ranging", 0);
    -[PRItemLocalizer setProximityQueue:](v12, "setProximityQueue:", v13);

    *(_QWORD *)&v12->_clientState = 1;
    v12->_lastSuccessfulCompanionCommunicationOrInitMachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
    v14 = objc_alloc(MEMORY[0x24BE7B430]);
    -[PRItemLocalizer proximityQueue](v12, "proximityQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithDelegate:queue:", v12, v15);
    -[PRItemLocalizer setSession:](v12, "setSession:", v16);

    v17 = dispatch_queue_create("com.apple.findmy.itemlocalizer", 0);
    -[PRItemLocalizer setEstimatorQueue:](v12, "setEstimatorQueue:", v17);

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 512);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRItemLocalizer setTrajectory:](v12, "setTrajectory:", v18);

    v19 = (RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *)operator new();
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::PRRoseSyntheticApertureBatchFilter(v19);
    std::unique_ptr<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter>::reset[abi:ne180100]((RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter **)&v11->_itemLocationFilter, v19);
    v20 = (RoseSyntheticApertureFiltering::PRRoseRangeFilter *)operator new();
    RoseSyntheticApertureFiltering::PRRoseRangeFilter::PRRoseRangeFilter(v20);
    *(_QWORD *)buf = 0;
    std::unique_ptr<RoseSyntheticApertureFiltering::PRRoseRangeFilter>::reset[abi:ne180100]((uint64_t *)&v11->_rangeFilter, (uint64_t)v20);
    std::unique_ptr<RoseSyntheticApertureFiltering::PRRoseRangeFilter>::reset[abi:ne180100]((uint64_t *)buf, 0);
    v21 = objc_alloc_init(MEMORY[0x24BDC13F8]);
    -[PRItemLocalizer setDeviceActivityManager:](v12, "setDeviceActivityManager:", v21);

    -[PRItemLocalizer setDeviceIsMoving:](v12, "setDeviceIsMoving:", 1);
    v22 = objc_alloc_init(MEMORY[0x24BDD1710]);
    -[PRItemLocalizer setActivityQueue:](v12, "setActivityQueue:", v22);

    -[PRItemLocalizer setTargetIsMoving:](v12, "setTargetIsMoving:", 0);
    -[PRItemLocalizer setPathIsDegenerate:](v12, "setPathIsDegenerate:", 0);
    -[PRItemLocalizer setFirstRangeArrow:](v12, "setFirstRangeArrow:", 0);
    -[PRItemLocalizer setFirstAoAArrow:](v12, "setFirstAoAArrow:", 0);
    -[PRItemLocalizer setPreviousVIOPoseTime:](v12, "setPreviousVIOPoseTime:", 0.0);
    -[PRItemLocalizer setRequiresLowerRangingFrequency:](v12, "setRequiresLowerRangingFrequency:", 0);
    -[PRItemLocalizer reset](v12, "reset");
    v23 = os_log_create("com.apple.proximity", "itemlocalizer");
    logger = v12->_logger;
    v12->_logger = (OS_os_log *)v23;

    v25 = v12->_logger;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2230E5000, v25, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting _clientState to LOCALIZER_CLIENT_READY_FOR_CONFIG initWithDelegate", buf, 2u);
    }
    v26 = objc_alloc_init(PRFindMyCoreAnalytics);
    -[PRItemLocalizer setAnalytics:](v12, "setAnalytics:", v26);

    -[PRItemLocalizer setConfigurationParameters:](v12, "setConfigurationParameters:", 0);
  }

  return v12;
}

- (BOOL)configureForDeviceWithId:(id)a3
{
  id v4;
  void *v5;
  NSObject *logger;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  const __CFString *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "ItemLocalizer configuring for item %@", buf, 0xCu);
  }
  if (objc_msgSend((id)objc_opt_class(), "isInternalBuild"))
  {
    v12 = CFSTR("deviceId");
    v13 = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRItemLocalizer analytics](self, "analytics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCustomData:", v7);

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7B440]), "initWithCompanionUUID:", v4);
  -[PRItemLocalizer setRemoteDevice:](self, "setRemoteDevice:", v9);

  v10 = -[PRItemLocalizer commonConfigure:](self, "commonConfigure:", 0);
  return v10;
}

- (BOOL)configureForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  OS_os_log *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  BOOL v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRItemLocalizer setProductUUID:](self, "setProductUUID:", v6);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isOwned"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRItemLocalizer setIsOwner:](self, "setIsOwner:", v7);

  -[PRItemLocalizer setRequiresLowerRangingFrequency:](self, "setRequiresLowerRangingFrequency:", objc_msgSend(v4, "requiresLowerRangingFrequency"));
  v8 = objc_msgSend(v4, "isOwned");
  -[PRItemLocalizer productUUID](self, "productUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self->_logger;
  v11 = os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      objc_msgSend(v5, "UUIDString");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[PRItemLocalizer productUUID](self, "productUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = "true";
      v22 = 138412802;
      v23 = (uint64_t)v12;
      if (v8)
        v16 = "false";
      v24 = 2112;
      v25 = v14;
      v26 = 2080;
      v27 = v16;
      _os_log_impl(&dword_2230E5000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "ItemLocalizer configuring for item %@ with productUUID %@, isUT: %s", (uint8_t *)&v22, 0x20u);

    }
  }
  else if (v11)
  {
    objc_msgSend(v5, "UUIDString");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = "true";
    if (v8)
      v19 = "false";
    v22 = 138412546;
    v23 = v17;
    v24 = 2080;
    v25 = (uint64_t)v19;
    _os_log_impl(&dword_2230E5000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "ItemLocalizer configuring for item %@ with no productUUID, isUT: %s", (uint8_t *)&v22, 0x16u);

  }
  v20 = -[PRItemLocalizer configureForDeviceWithId:](self, "configureForDeviceWithId:", v5);

  return v20;
}

- (BOOL)commonConfigure:(id)a3
{
  id v4;
  NSObject *logger;
  void *v6;
  int8x8_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t v29[16];
  uint8_t buf[8];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_clientState == 1)
  {
    self->_clientState = 2;
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting _clientState to LOCALIZER_CLIENT_CONFIGURING commonConfigure", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v31 = 0;
    objc_msgSend(v6, "getUUIDBytes:", buf);
    v7 = vceqz_s8(*(int8x8_t *)buf);
    if ((v7.i8[0] & 1) != 0)
      buf[0] = 1;
    if ((v7.i8[1] & 1) != 0)
      buf[1] = 1;
    if ((v7.i8[2] & 1) != 0)
      buf[2] = 1;
    if ((v7.i8[3] & 1) != 0)
      buf[3] = 1;
    if ((v7.i8[4] & 1) != 0)
      buf[4] = 1;
    if ((v7.i8[5] & 1) != 0)
      buf[5] = 1;
    if ((v7.i8[6] & 1) != 0)
      buf[6] = 1;
    if ((v7.i8[7] & 1) != 0)
      buf[7] = 1;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRItemLocalizer remoteDevice](self, "remoteDevice");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "setRoseMACAddress:", v8);

    -[PRItemLocalizer setConfigurationParameters:](self, "setConfigurationParameters:", v4);
    -[PRItemLocalizer configurationParameters](self, "configurationParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = v10 == 0;

    if ((v9 & 1) != 0
      || (-[PRItemLocalizer configurationParameters](self, "configurationParameters"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = PRSetRoseGlobalConfigParams(),
          v11,
          (v12 & 1) != 0))
    {
      v13 = (void *)MEMORY[0x24BDBCED8];
      -[PRItemLocalizer configurationParameters](self, "configurationParameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dictionaryWithDictionary:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = -[PRItemLocalizer requiresLowerRangingFrequency](self, "requiresLowerRangingFrequency");
      v17 = self->_logger;
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v18)
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_2230E5000, v17, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting gatt ranging to true", v29, 2u);
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("GattRanging"));
      }
      else
      {
        if (v18)
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_2230E5000, v17, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting gatt ranging to false", v29, 2u);
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("GattRanging"));
      }

      -[PRItemLocalizer setConfigurationParameters:](self, "setConfigurationParameters:", v15);
      self->_rangingState = 2;
      -[PRItemLocalizer session](self, "session");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRItemLocalizer remoteDevice](self, "remoteDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRItemLocalizer configurationParameters](self, "configurationParameters");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "configureForCompanionRanging:options:", v23, v24);

      -[PRItemLocalizer analytics](self, "analytics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRItemLocalizer productUUID](self, "productUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRItemLocalizer isOwner](self, "isOwner");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "configureSessionWithProductUUID:withOwner:", v26, v27);

      v21 = 1;
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v20 = self->_logger;
    v21 = 0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2230E5000, v20, OS_LOG_TYPE_DEFAULT, "#companion-retry Unexpected call to configure", buf, 2u);
      v21 = 0;
    }
  }

  return v21;
}

- (BOOL)startWithDevicePoseProvider:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *logger;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  _QWORD block[4];
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v6;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "ItemLocalizer start with pose provider %@", buf, 0xCu);
  }
  if (self->_clientState == 3)
  {
    self->_clientState = 4;
    v8 = self->_logger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2230E5000, v8, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting _clientState to LOCALIZER_CLIENT_RANGING startWithDevicePoseProvider", buf, 2u);
    }
    -[PRItemLocalizer setPoseProvider:](self, "setPoseProvider:", v6);
    -[PRItemLocalizer poseProvider](self, "poseProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

    -[PRItemLocalizer reset](self, "reset");
    -[PRItemLocalizer setFirstRangeArrow:](self, "setFirstRangeArrow:", 0);
    -[PRItemLocalizer setFirstAoAArrow:](self, "setFirstAoAArrow:", 0);
    -[PRItemLocalizer setPreviousVIOPoseTime:](self, "setPreviousVIOPoseTime:", 0.0);
    objc_initWeak((id *)buf, self);
    -[PRItemLocalizer estimatorQueue](self, "estimatorQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__PRItemLocalizer_startWithDevicePoseProvider_error___block_invoke;
    block[3] = &unk_24EC11360;
    objc_copyWeak(&v28, (id *)buf);
    dispatch_async(v10, block);

    -[PRItemLocalizer setDeviceIsMoving:](self, "setDeviceIsMoving:", 1);
    -[PRItemLocalizer deviceActivityManager](self, "deviceActivityManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRItemLocalizer activityQueue](self, "activityQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v11;
    v23 = 3221225472;
    v24 = __53__PRItemLocalizer_startWithDevicePoseProvider_error___block_invoke_2;
    v25 = &unk_24EC11810;
    objc_copyWeak(&v26, (id *)buf);
    objc_msgSend(v12, "startActivityUpdatesToQueue:withHandler:", v13, &v22);

    -[PRItemLocalizer analytics](self, "analytics", v22, v23, v24, v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "start");

    -[PRItemLocalizer sendItemLocalizerChangedActivity:](self, "sendItemLocalizerChangedActivity:", 1);
    if (self->_rangingState == 3)
    {
      -[PRItemLocalizer session](self, "session");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRItemLocalizer remoteDevice](self, "remoteDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "startCompanionRanging:options:error:", v16, 0, a4);

      if (!v17)
      {
        -[PRItemLocalizer didFailWithError:](self, "didFailWithError:", *a4);
        v19 = 0;
        goto LABEL_13;
      }
      -[PRItemLocalizer dataRecorder](self, "dataRecorder");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "start");

      self->_rangingState = 4;
    }
    v19 = 1;
LABEL_13:
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
    goto LABEL_14;
  }
  v20 = self->_logger;
  v19 = 0;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2230E5000, v20, OS_LOG_TYPE_DEFAULT, "#companion-retry Unexpected call to start", buf, 2u);
    v19 = 0;
  }
LABEL_14:

  return v19;
}

void __53__PRItemLocalizer_startWithDevicePoseProvider_error___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  RoseSyntheticApertureFiltering::PRRoseRangeFilter *v3;
  uint64_t *v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v4 = (uint64_t *)objc_loadWeakRetained(v1);
    v3 = (RoseSyntheticApertureFiltering::PRRoseRangeFilter *)operator new();
    RoseSyntheticApertureFiltering::PRRoseRangeFilter::PRRoseRangeFilter(v3);
    std::unique_ptr<RoseSyntheticApertureFiltering::PRRoseRangeFilter>::reset[abi:ne180100](v4 + 2, (uint64_t)v3);

  }
}

void __53__PRItemLocalizer_startWithDevicePoseProvider_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  _QWORD *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  __int16 v13;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(v4);
    v7 = objc_msgSend(v3, "stationary");
    v8 = v6[3];
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v13 = 0;
        v10 = "#itemlocalizerActivity stationary now";
        v11 = (uint8_t *)&v13;
LABEL_8:
        _os_log_impl(&dword_2230E5000, v8, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else if (v9)
    {
      LOWORD(v12) = 0;
      v10 = "#itemlocalizerActivity NON-stationary now";
      v11 = (uint8_t *)&v12;
      goto LABEL_8;
    }
    objc_msgSend(v6, "setDeviceIsMoving:", v7 ^ 1u, v12);
    goto LABEL_10;
  }
  v6 = 0;
LABEL_10:

}

- (BOOL)stop:(id *)a3
{
  NSObject *logger;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v18[8];
  _QWORD block[4];
  id v20;
  id buf[2];

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "ItemLocalizer stop", (uint8_t *)buf, 2u);
  }
  if (self->_clientState == 4)
  {
    -[PRItemLocalizer poseProvider](self, "poseProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", 0);

    -[PRItemLocalizer analytics](self, "analytics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stop");

    v8 = self->_logger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2230E5000, v8, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting _clientState to LOCALIZER_CLIENT_CONFIGURED stop", (uint8_t *)buf, 2u);
    }
    self->_clientState = 3;
    -[PRItemLocalizer reset](self, "reset");
    objc_initWeak(buf, self);
    -[PRItemLocalizer estimatorQueue](self, "estimatorQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __24__PRItemLocalizer_stop___block_invoke;
    block[3] = &unk_24EC11360;
    objc_copyWeak(&v20, buf);
    dispatch_async(v9, block);

    -[PRItemLocalizer deviceActivityManager](self, "deviceActivityManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopActivityUpdates");

    -[PRItemLocalizer sendItemLocalizerChangedActivity:](self, "sendItemLocalizerChangedActivity:", 2);
    if (self->_rangingState == 4)
    {
      -[PRItemLocalizer session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRItemLocalizer remoteDevice](self, "remoteDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "stopCompanionRanging:error:", v12, a3);

      if (!v13)
      {
        v16 = self->_logger;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_2230E5000, v16, OS_LOG_TYPE_DEFAULT, "#companion-retry Failed to stop - triggering retry", v18, 2u);
        }
        -[PRItemLocalizer didFailWithError:](self, "didFailWithError:", *a3);
        v14 = 0;
        goto LABEL_15;
      }
      self->_rangingState = 3;
    }
    v14 = 1;
LABEL_15:
    objc_destroyWeak(&v20);
    objc_destroyWeak(buf);
    return v14;
  }
  v15 = self->_logger;
  v14 = 0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2230E5000, v15, OS_LOG_TYPE_DEFAULT, "#companion-retry Unexpected call to stop", (uint8_t *)buf, 2u);
    return 0;
  }
  return v14;
}

void __24__PRItemLocalizer_stop___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  RoseSyntheticApertureFiltering::PRRoseRangeFilter *v3;
  uint64_t *v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v4 = (uint64_t *)objc_loadWeakRetained(v1);
    v3 = (RoseSyntheticApertureFiltering::PRRoseRangeFilter *)operator new();
    RoseSyntheticApertureFiltering::PRRoseRangeFilter::PRRoseRangeFilter(v3);
    std::unique_ptr<RoseSyntheticApertureFiltering::PRRoseRangeFilter>::reset[abi:ne180100](v4 + 2, (uint64_t)v3);

  }
}

- (void)presentTargetEstimate:(id)a3
{
  id v4;
  OS_os_log *v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  float v13;
  uint64_t v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  uint8_t buf[4];
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_logger;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "vector");
    v18 = v6;
    objc_msgSend(v4, "vector");
    v17 = v7;
    objc_msgSend(v4, "vector");
    v16 = v8;
    objc_msgSend(v4, "uncertainty", v9);
    v11 = v10;
    objc_msgSend(v4, "weight");
    v13 = v12;
    objc_msgSend(v4, "timestamp");
    *(_DWORD *)buf = 134219264;
    v20 = v18;
    v21 = 2048;
    v22 = v17;
    v23 = 2048;
    v24 = v16;
    v25 = 2048;
    v26 = v11;
    v27 = 2048;
    v28 = v13;
    v29 = 2048;
    v30 = v14;
    _os_log_impl(&dword_2230E5000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Sending target to delegate: (%f, %f, %f), uncertainty = %f, weight = %f, time %f", buf, 0x3Eu);
  }

  -[PRItemLocalizer updateDelegateWithSelector:object:](self, "updateDelegateWithSelector:object:", sel_didUpdateItemPosition_, v4);
  -[PRItemLocalizer analytics](self, "analytics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "targetComputed:", v4);

}

- (void)revokeTargetEstimateWithLastSolution:(BatchSolution *)a3
{
  BatchSolutionParticle *begin;
  int v5;
  NSObject *v6;
  PRItemLocalizer *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *logger;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  begin = a3->BatchSolutionList.__begin_;
  if (begin == a3->BatchSolutionList.__end_)
  {
    -[PRItemLocalizer revokeTargetEstimate:](self, "revokeTargetEstimate:", 2);
  }
  else
  {
    v5 = *((_DWORD *)begin + 40);
    if (v5)
    {
      if (v5 == 2)
      {
        if (a3->solutionStatus == 5)
        {
          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "Revoke Straight path solution", v11, 2u);
          }
        }
        v7 = self;
        v8 = 4;
      }
      else
      {
        if (v5 != 1)
          return;
        if (a3->solutionStatus == 5)
        {
          v6 = self->_logger;
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2230E5000, v6, OS_LOG_TYPE_DEFAULT, "Revoke SA solution due to multipath", buf, 2u);
          }
        }
        v7 = self;
        v8 = 2;
      }
    }
    else
    {
      if (a3->solutionStatus == 5)
      {
        v9 = self->_logger;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_2230E5000, v9, OS_LOG_TYPE_DEFAULT, "Revoke AoA solution due to multipath", v12, 2u);
        }
      }
      v7 = self;
      v8 = 3;
    }
    -[PRItemLocalizer revokeTargetEstimate:](v7, "revokeTargetEstimate:", v8);
  }
}

- (void)revokeTargetEstimate:(unint64_t)a3
{
  NSObject *logger;
  void *v6;
  __int128 v7;
  void *__p[2];
  __int128 v9;
  uint8_t buf[16];

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "Revoking item position. Sending nil to delegate", buf, 2u);
  }
  -[PRItemLocalizer updateDelegateWithSelector:object:](self, "updateDelegateWithSelector:object:", sel_didUpdateItemPosition_, 0);
  -[PRItemLocalizer analytics](self, "analytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetRevokedWithReason:", a3);

  *(_OWORD *)__p = 0u;
  v9 = 0u;
  v7 = 0u;
  -[PRItemLocalizer setLastSolution:](self, "setLastSolution:", &v7);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)presentRangeEstimate:(id)a3
{
  id v4;
  double MachTimeSeconds;
  double v6;
  OS_os_log *v7;
  double v8;
  id v9;
  float v10;
  PRProximity *v11;
  double v12;
  double v13;
  int v14;
  int v15;
  int v16;
  double v17;
  double v18;
  double v19;
  PRProximity *v20;
  OS_os_log *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  int v26;
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  MachTimeSeconds = PRCommonGetMachTimeSeconds();
  objc_msgSend(v4, "timestamp");
  if (MachTimeSeconds - v6 <= 2.0)
  {
    v9 = v4;
    objc_msgSend(v9, "range");
    if (v10 >= 0.0)
    {
      v21 = self->_logger;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "range");
        v26 = 134217984;
        v27 = v25;
        _os_log_impl(&dword_2230E5000, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "Sending range to delegate: %f", (uint8_t *)&v26, 0xCu);
      }
    }
    else
    {
      v11 = [PRProximity alloc];
      objc_msgSend(v9, "timestamp");
      v13 = v12;
      objc_msgSend(v9, "azimuth");
      v15 = v14;
      objc_msgSend(v9, "elevation");
      LODWORD(v17) = v16;
      LODWORD(v18) = 0;
      LODWORD(v19) = v15;
      v20 = -[PRProximity initWithTime:range:azimuth:elevation:](v11, "initWithTime:range:azimuth:elevation:", v13, v18, v19, v17);

      v21 = self->_logger;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "range");
        v23 = v22;
        -[PRProximity range](v20, "range");
        v26 = 134218240;
        v27 = v23;
        v28 = 2048;
        v29 = v24;
        _os_log_impl(&dword_2230E5000, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "PresentRangeEstimate overriding negative range = %f. Sending range = %f to delegate", (uint8_t *)&v26, 0x16u);
      }
      v9 = v20;
    }

    -[PRItemLocalizer updateDelegateWithSelector:object:](self, "updateDelegateWithSelector:object:", sel_didUpdateRangeEstimate_, v9);
  }
  else
  {
    v7 = self->_logger;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "timestamp");
      v26 = 134218240;
      v27 = MachTimeSeconds;
      v28 = 2048;
      v29 = v8;
      _os_log_impl(&dword_2230E5000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Not presenting too stale range estimate to the delegate, current time = %f, range estimate time = %f", (uint8_t *)&v26, 0x16u);
    }

    -[PRItemLocalizer analytics](self, "analytics");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "revokeRangeEstimate");
  }

}

- (id)saveData
{
  void *v2;
  void *v3;

  -[PRItemLocalizer dataRecorder](self, "dataRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAndSave");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)discardData
{
  id v2;

  -[PRItemLocalizer dataRecorder](self, "dataRecorder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAndDiscard");

}

- (unint64_t)trajectoryIndexForTime:(double)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;

  -[PRItemLocalizer trajectory](self, "trajectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRItemLocalizer trajectory](self, "trajectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v6, 1024, &__block_literal_global_39);

  return v9;
}

uint64_t __42__PRItemLocalizer_trajectoryIndexForTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "timestamp");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "timestamp");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "compare:", v11);

  return v12;
}

- (void)deleteTrajectoryWaypointsBeforeTime:(double)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  id v10;

  -[PRItemLocalizer estimatorQueue](self, "estimatorQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[PRItemLocalizer trajectory](self, "trajectory");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "count");

  if (v5)
  {
    v6 = -[PRItemLocalizer trajectoryIndexForTime:](self, "trajectoryIndexForTime:", a3);
    if (v6)
    {
      v7 = v6 - 1;
      -[PRItemLocalizer trajectory](self, "trajectory");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectsInRange:", 0, v7);

    }
  }
}

- (id)estimatorInputForProximity:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  PREstimatorInput *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  OS_os_log *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  simd_float4 v44;
  simd_float4 v45;
  simd_float4 v46;
  simd_float4 v47;
  simd_float4 v48;
  simd_float4 v49;
  simd_float4 v50;
  simd_float4 v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float v57;
  float v58;
  float32x4_t v59;
  int8x16_t v60;
  float32x4_t v61;
  int8x16_t v62;
  float v63;
  float v64;
  BOOL v65;
  float v66;
  uint64_t v67;
  float32x2_t v68;
  float32x2_t v69;
  float v70;
  float32x4_t v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float32x4_t v76;
  int8x16_t v77;
  float32x2_t v78;
  unint64_t v79;
  unsigned __int32 v80;
  float32x2_t v81;
  float32x2_t v82;
  float32x4_t v83;
  float32x4_t v84;
  id v85;
  simd_float4 v86;
  simd_float4 v87;
  simd_float4 v88;
  simd_float4 v89;
  simd_float4 v90;
  float32x4_t v91;
  simd_float4 v92;
  float v93;
  float v94;
  float32x4_t v95;
  simd_float4 v96;
  float32x4_t v97;
  float32x4_t v98;
  simd_float4 v99;
  float32x4_t v100;
  double v101;
  float v102;
  _QWORD v103[2];
  _QWORD v104[2];
  uint8_t buf[4];
  uint64_t v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  uint64_t v111;
  simd_float4x4 v112;
  simd_float4x4 v113;

  v111 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  objc_msgSend(v4, "mach_absolute_time_sec");
  v6 = -[PRItemLocalizer trajectoryIndexForTime:](self, "trajectoryIndexForTime:");
  if (!v6)
  {
    -[PRItemLocalizer trajectory](self, "trajectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRItemLocalizer trajectory](self, "trajectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    if (!v11 || !v13)
      goto LABEL_15;
    v14 = self->_logger;
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v5, "mach_absolute_time_sec");
    v16 = v15;
    objc_msgSend(v11, "timestamp");
    v18 = v17;
    objc_msgSend(v13, "timestamp");
    *(_DWORD *)buf = 134218496;
    v106 = v16;
    v107 = 2048;
    v108 = v18;
    v109 = 2048;
    v110 = v19;
    v20 = "ItemLocalizer failed to match sensor inputs at time %f (Measurement is earlier than the first cached pose). Ca"
          "ched pose time range: %f -> %f";
    v21 = v14;
    v22 = 32;
LABEL_13:
    _os_log_impl(&dword_2230E5000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    goto LABEL_14;
  }
  -[PRItemLocalizer trajectory](self, "trajectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 != v8)
  {
    -[PRItemLocalizer trajectory](self, "trajectory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndex:", v6 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRItemLocalizer trajectory](self, "trajectory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndex:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "timestamp");
    v26 = v25;
    objc_msgSend(v5, "mach_absolute_time_sec");
    if (v26 != v27)
    {
      objc_msgSend(v13, "timestamp");
      v29 = v28;
      objc_msgSend(v5, "mach_absolute_time_sec");
      if (v29 != v30)
      {
        objc_msgSend(v13, "timestamp");
        v34 = v33;
        objc_msgSend(v11, "timestamp");
        if (v34 == v35)
        {
          v103[0] = CFSTR("prior");
          v103[1] = CFSTR("subsequent");
          v104[0] = v11;
          v104[1] = v13;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
          objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("TimingErrorException"), CFSTR("Invalid timestamp found on device pose waypoint"), objc_claimAutoreleasedReturnValue());
          v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_exception_throw(v85);
        }
        objc_msgSend(v5, "mach_absolute_time_sec");
        v37 = v36;
        objc_msgSend(v11, "timestamp");
        v39 = v38;
        objc_msgSend(v13, "timestamp");
        v41 = v40;
        objc_msgSend(v11, "timestamp");
        v43 = v42;
        objc_msgSend(v11, "pose");
        v96 = v45;
        v99 = v44;
        v90 = v47;
        v92 = v46;
        objc_msgSend(v13, "pose");
        v88 = v49;
        v89 = v48;
        v86 = v51;
        v87 = v50;
        v48.f32[0] = (v37 - v39) / (v41 - v43);
        v102 = v48.f32[0];
        v112.columns[1] = v96;
        v112.columns[0] = v99;
        v112.columns[3] = v90;
        v112.columns[2] = v92;
        *(double *)v52.i64 = simd_quaternion(v112);
        v100 = v52;
        v113.columns[1] = v88;
        v113.columns[0] = v89;
        v113.columns[3] = v86;
        v113.columns[2] = v87;
        *(double *)v53.i64 = simd_quaternion(v113);
        v54 = vmulq_f32(v100, v53);
        v55 = (float32x4_t)vextq_s8((int8x16_t)v54, (int8x16_t)v54, 8uLL);
        *(float32x2_t *)v54.f32 = vadd_f32(*(float32x2_t *)v54.f32, *(float32x2_t *)v55.f32);
        v54.f32[0] = vaddv_f32(*(float32x2_t *)v54.f32);
        v55.i32[0] = 0;
        v56 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v54, v55)), 0), (int8x16_t)vnegq_f32(v53), (int8x16_t)v53);
        v57 = 1.0;
        v58 = 1.0 - v102;
        v59 = vsubq_f32(v100, v56);
        v60 = (int8x16_t)vmulq_f32(v59, v59);
        v97 = v56;
        v61 = vaddq_f32(v100, v56);
        v62 = (int8x16_t)vmulq_f32(v61, v61);
        v63 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v60.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v60, v60, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v62.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v62, v62, 8uLL)))));
        v64 = v63 + v63;
        v65 = (float)(v63 + v63) == 0.0;
        v66 = 1.0;
        if (!v65)
          v66 = sinf(v64) / v64;
        v67 = LODWORD(v66);
        v68 = vrecpe_f32((float32x2_t)LODWORD(v66));
        v69 = vmul_f32(v68, vrecps_f32((float32x2_t)v67, v68));
        LODWORD(v70) = vmul_f32(v69, vrecps_f32((float32x2_t)v67, v69)).u32[0];
        if ((float)(v58 * v64) != 0.0)
        {
          v93 = v70;
          v69.f32[0] = sinf(v58 * v64);
          v70 = v93;
          v57 = v69.f32[0] / (float)(v58 * v64);
        }
        v69.f32[0] = v58 * (float)(v70 * v57);
        v71 = (float32x4_t)vdupq_lane_s32((int32x2_t)v69, 0);
        v72 = v102;
        v73 = v64 * v102;
        v74 = 1.0;
        if (v73 != 0.0)
        {
          v91 = v71;
          v94 = v70;
          v75 = sinf(v73);
          v72 = v102;
          v71 = v91;
          v70 = v94;
          v74 = v75 / v73;
        }
        v76 = vmlaq_f32(vmulq_n_f32(v97, (float)(v70 * v74) * v72), v100, v71);
        v77 = (int8x16_t)vmulq_f32(v76, v76);
        v78 = vadd_f32(*(float32x2_t *)v77.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v77, v77, 8uLL));
        if (vaddv_f32(v78) == 0.0)
        {
          v79 = 0;
        }
        else
        {
          v80 = vadd_f32(v78, (float32x2_t)vdup_lane_s32((int32x2_t)v78, 1)).u32[0];
          v81 = vrsqrte_f32((float32x2_t)v80);
          v82 = vmul_f32(v81, vrsqrts_f32((float32x2_t)v80, vmul_f32(v81, v81)));
          v79 = vmulq_n_f32(v76, vmul_f32(v82, vrsqrts_f32((float32x2_t)v80, vmul_f32(v82, v82))).f32[0]).u64[0];
        }
        v101 = *(double *)&v79;
        objc_msgSend(v11, "pose", *(_OWORD *)&v86, *(_OWORD *)&v87, *(_OWORD *)&v88, *(_OWORD *)&v89);
        v98 = v83;
        objc_msgSend(v13, "pose");
        v95 = v84;
        v9 = objc_alloc_init(PREstimatorInput);
        objc_msgSend(v5, "mach_absolute_time_sec");
        -[PREstimatorInput setTimestamp:](v9, "setTimestamp:");
        objc_msgSend(v11, "timestamp");
        -[PREstimatorInput setPriorTimestamp:](v9, "setPriorTimestamp:");
        objc_msgSend(v13, "timestamp");
        -[PREstimatorInput setSubsequentTimestamp:](v9, "setSubsequentTimestamp:");
        -[PREstimatorInput setRotation:](v9, "setRotation:", v101);
        -[PREstimatorInput setTranslation:](v9, "setTranslation:", *(double *)vmlaq_n_f32(v98, vsubq_f32(v95, v98), v102).i64);
        -[PREstimatorInput setProximity:](v9, "setProximity:", v5);
        goto LABEL_15;
      }
    }
    v14 = self->_logger;
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    objc_msgSend(v5, "mach_absolute_time_sec");
    *(_DWORD *)buf = 134217984;
    v106 = v31;
    v20 = "ItemLocalizer skipping proximity measurement due to pose timestamp equality at time %f";
    v21 = v14;
    v22 = 12;
    goto LABEL_13;
  }
LABEL_4:
  v9 = 0;
LABEL_16:

  return v9;
}

- (BatchSolution)performLocationFiltering:(SEL)a3
{
  id v6;
  NSObject *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  double MachTimeSeconds;
  double v46;
  char v47;
  BatchSolution *result;
  float v49;
  uint64_t v50;
  float v51;
  uint64_t v52;
  float v53;
  float v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  float v58;
  float v59;
  double v60;
  _BYTE v61[8];
  double v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  double v79;

  v6 = a4;
  -[PRItemLocalizer estimatorQueue](self, "estimatorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[PRItemLocalizer logEstimatorInput:](self, "logEstimatorInput:", v6);
  objc_msgSend(v6, "translation");
  v59 = v8;
  objc_msgSend(v6, "translation");
  v58 = v9;
  objc_msgSend(v6, "translation");
  v57 = v10;
  objc_msgSend(v6, "rotation");
  v54 = v11;
  objc_msgSend(v6, "rotation");
  v53 = v12;
  objc_msgSend(v6, "rotation");
  v51 = v13;
  objc_msgSend(v6, "rotation");
  v49 = v14;
  objc_msgSend(v6, "proximity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "antenna_type");
  if ((unint64_t)(v16 - 1) < 4)
    v17 = v16;
  else
    v17 = 0;

  v64 = 0;
  v65 = 0;
  v66 = 0x3FB999999999999ALL;
  v67 = 0;
  LOBYTE(v68) = 0;
  v75 = 0;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0.0;
  objc_msgSend(v6, "proximity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  v19 = v54;
  v20 = v53;
  if ((objc_msgSend(v18, "az_valid") & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v6, "proximity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "el_valid");

  if (!v22)
  {
LABEL_9:
    objc_msgSend(v6, "proximity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "mach_absolute_time_sec");
    v29 = v28;
    objc_msgSend(v6, "proximity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "range_m");
    v64 = v29;
    v65 = v31;
    v66 = 0x3FB999999999999ALL;
    v67 = v17;
    LOBYTE(v68) = 0;
    v75 = 0;
    *(double *)&v76 = v60;
    *((double *)&v76 + 1) = v58;
    *(double *)&v77 = v57;
    *((double *)&v77 + 1) = v54;
    *(double *)&v78 = v53;
    *((double *)&v78 + 1) = v51;
    v79 = v49;
    goto LABEL_12;
  }
  objc_msgSend(v6, "proximity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "multipath_probability_valid");

  if (v24)
  {
    objc_msgSend(v6, "proximity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "multipath_probability");
    v56 = v26;

    v55 = 1;
  }
  else
  {
    v55 = 0;
    v56 = 0;
  }
  objc_msgSend(v6, "proximity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "mach_absolute_time_sec");
  v52 = v32;
  objc_msgSend(v6, "proximity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "range_m");
  v50 = v33;
  objc_msgSend(v6, "proximity");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "el_deg");
  v36 = v35;
  objc_msgSend(v6, "proximity");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "az_deg");
  v39 = v38;
  objc_msgSend(v6, "proximity");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sweep_angle_deg");
  v42 = v41;
  objc_msgSend(v6, "proximity");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "track_score");
  v64 = v52;
  v65 = v50;
  v66 = 0x3FB999999999999ALL;
  v67 = v17;
  v68 = v36;
  v69 = v39;
  v70 = 0x4024000000000000;
  v71 = v42;
  v72 = v44;
  v73 = v56;
  v74 = v55;
  v75 = 1;
  *(double *)&v76 = v60;
  *((double *)&v76 + 1) = v58;
  *(double *)&v77 = v57;
  *((double *)&v77 + 1) = v19;
  *(double *)&v78 = v20;
  *((double *)&v78 + 1) = v51;
  v79 = v49;

LABEL_12:
  if (*(_BYTE *)self->_rangeFilter.__ptr_.__value_)
  {
    MachTimeSeconds = PRCommonGetMachTimeSeconds();
    RoseSyntheticApertureFiltering::PRRoseRangeFilter::getCurrentState((RoseSyntheticApertureFiltering::PRRoseRangeFilter *)self->_rangeFilter.__ptr_.__value_, (uint64_t)v61);
    v46 = v62;
    v47 = MachTimeSeconds - v63 <= 2.0;
  }
  else
  {
    v47 = 0;
    v46 = 0.0;
  }
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::setCurrentRangeFilterEstimate((uint64_t)self->_itemLocationFilter.__ptr_.__value_, v46, v47);
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::addMeasurement((RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *)self->_itemLocationFilter.__ptr_.__value_, (uint64_t)&v64, retstr);

  return result;
}

- (id)produceBlendedRangeEstimateForPose:(id)a3
{
  id v4;
  PRRoseRangeFilter *value;
  double CurrentState;
  PRRoseSyntheticApertureBatchFilter *v7;
  double v8;
  double v9;
  float v10;
  void *v11;
  PRProximity *v12;
  double v13;
  PRProximity *v14;
  uint64_t v15;
  uint64_t v17;
  void *__p;
  void *v19;
  _BYTE v20[8];
  double v21;
  double v22;

  v4 = a3;
  value = self->_rangeFilter.__ptr_.__value_;
  if (*(_BYTE *)value)
  {
    CurrentState = RoseSyntheticApertureFiltering::PRRoseRangeFilter::getCurrentState((RoseSyntheticApertureFiltering::PRRoseRangeFilter *)value, (uint64_t)v20);
    v7 = self->_itemLocationFilter.__ptr_.__value_;
    objc_msgSend(v4, "timestamp", CurrentState);
    v9 = v8;
    objc_msgSend(v4, "pose");
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::updateCurrentBatchSolution((RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *)v7, v9, v10, &v17);
    if ((_DWORD)v17 == 5)
    {
      objc_msgSend(v4, "pose");
      objc_msgSend(v4, "timestamp");
      v14 = [PRProximity alloc];
      objc_msgSend(v4, "timestamp");
      v15 = -[PRProximity initWithTime:range:](v14, "initWithTime:range:");
    }
    else
    {
      v12 = [PRProximity alloc];
      HIDWORD(v13) = HIDWORD(v21);
      *(float *)&v13 = v21;
      v15 = -[PRProximity initWithTime:range:](v12, "initWithTime:range:", v22, v13);
    }
    v11 = (void *)v15;
    if (__p)
    {
      v19 = __p;
      operator delete(__p);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)logEstimatorInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  OS_os_log *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
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
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  BOOL v58;
  void *v59;
  float v60;
  float v61;
  float v62;
  void *v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  void *v71;
  float v72;
  float v73;
  float v74;
  void *v75;
  float v76;
  uint8_t buf[4];
  double v78;
  __int16 v79;
  double v80;
  __int16 v81;
  double v82;
  __int16 v83;
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  _BYTE v96[18];
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  int v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  uint64_t v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "proximity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "az_valid") & 1) != 0)
  {
    objc_msgSend(v4, "proximity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "el_valid");

    if (v7)
    {
      v8 = self->_logger;
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "rotation");
        v73 = v9;
        objc_msgSend(v4, "rotation");
        v69 = v10;
        objc_msgSend(v4, "rotation");
        v68 = v11;
        objc_msgSend(v4, "rotation");
        v66 = v12;
        objc_msgSend(v4, "translation");
        v62 = v13;
        objc_msgSend(v4, "translation");
        v61 = v14;
        objc_msgSend(v4, "translation");
        v60 = v15;
        objc_msgSend(v4, "proximity", v16);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "range_m");
        v18 = v17;
        objc_msgSend(v4, "proximity");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "range_unc_m");
        v20 = v19;
        objc_msgSend(v4, "proximity");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "az_deg");
        v22 = v21;
        objc_msgSend(v4, "proximity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "az_unc_deg");
        v25 = v24;
        objc_msgSend(v4, "proximity");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "el_deg");
        v28 = v27;
        objc_msgSend(v4, "proximity");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "el_unc_deg");
        v31 = v30;
        objc_msgSend(v4, "proximity");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "antenna_type");
        objc_msgSend(v4, "timestamp");
        v35 = v34;
        objc_msgSend(v4, "proximity");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "track_score");
        v38 = v37;
        objc_msgSend(v4, "proximity");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "sweep_angle_deg");
        *(_DWORD *)buf = 134222080;
        v78 = v73;
        v79 = 2048;
        v80 = v69;
        v81 = 2048;
        v82 = v68;
        v83 = 2048;
        v84 = v66;
        v85 = 2048;
        v86 = v62;
        v87 = 2048;
        v88 = v61;
        v89 = 2048;
        v90 = v60;
        v91 = 2048;
        v92 = v18;
        v93 = 2048;
        v94 = v20;
        v95 = 2048;
        *(_QWORD *)v96 = v22;
        *(_WORD *)&v96[8] = 2048;
        *(_QWORD *)&v96[10] = v25;
        v97 = 2048;
        v98 = v28;
        v99 = 2048;
        v100 = v31;
        v101 = 1024;
        v102 = v33;
        v103 = 2048;
        v104 = v35;
        v105 = 2048;
        v106 = v38;
        v107 = 2048;
        v108 = v40;
        _os_log_impl(&dword_2230E5000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Estimator input: quat = (%f, %f, %f, %f), trans = (%f, %f, %f), range_m = %f, range_unc_m = %f, az_deg = %f, az_unc_deg = %f, el_deg = %f, el_unc_deg = %f, antenna = %d, time = %f, track_score = %f, sweep_angle_deg = %f", buf, 0xA8u);

      }
      goto LABEL_8;
    }
  }
  else
  {

  }
  v8 = self->_logger;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "rotation");
    v76 = v41;
    objc_msgSend(v4, "rotation");
    v74 = v42;
    objc_msgSend(v4, "rotation");
    v72 = v43;
    objc_msgSend(v4, "rotation");
    v70 = v44;
    objc_msgSend(v4, "translation");
    v67 = v45;
    objc_msgSend(v4, "translation");
    v65 = v46;
    objc_msgSend(v4, "translation");
    v64 = v47;
    objc_msgSend(v4, "proximity");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "range_m");
    v50 = v49;
    objc_msgSend(v4, "proximity");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "range_unc_m");
    v53 = v52;
    objc_msgSend(v4, "proximity");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "antenna_type");
    objc_msgSend(v4, "timestamp");
    *(_DWORD *)buf = 134220544;
    v78 = v76;
    v79 = 2048;
    v80 = v74;
    v81 = 2048;
    v82 = v72;
    v83 = 2048;
    v84 = v70;
    v85 = 2048;
    v86 = v67;
    v87 = 2048;
    v88 = v65;
    v89 = 2048;
    v90 = v64;
    v91 = 2048;
    v92 = v50;
    v93 = 2048;
    v94 = v53;
    v95 = 1024;
    *(_DWORD *)v96 = v55;
    *(_WORD *)&v96[4] = 2048;
    *(_QWORD *)&v96[6] = v56;
    _os_log_impl(&dword_2230E5000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Estimator input: quat = (%f, %f, %f, %f), trans = (%f, %f, %f), range_m = %f, range_unc_m = %f, antenna = %d, time = %f", buf, 0x6Cu);

  }
LABEL_8:

  -[PRItemLocalizer dataRecorder](self, "dataRecorder");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v57 == 0;

  if (!v58)
  {
    -[PRItemLocalizer dataRecorder](self, "dataRecorder");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "recordEstimatorInput:", v4);

  }
}

- (void)logAndPresentSolution:(BatchSolution *)a3 withTimeStamp:(double)a4
{
  BatchSolutionParticle *begin;
  BatchSolutionParticle *i;
  double v9;
  double v10;
  float v11;
  double v12;
  int verticalState;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  begin = a3->BatchSolutionList.__begin_;
  for (i = a3->BatchSolutionList.__end_; begin != i; begin = (BatchSolutionParticle *)((char *)begin + 168))
  {
    v9 = *((double *)begin + 1);
    v10 = *((double *)begin + 2);
    *(float *)&v12 = *(double *)begin;
    v11 = v9;
    *((float *)&v12 + 1) = v11;
    verticalState = a3->verticalState;
    if (verticalState == 2)
      v14 = 2;
    else
      v14 = verticalState == 1;
    *(float *)&v9 = *((double *)begin + 9);
    *(float *)&v10 = *((double *)begin + 10);
    +[PRTargetEstimate targetEstimateWithTime:vector:uncertainty:weight:isResolved:verticalState:](PRTargetEstimate, "targetEstimateWithTime:vector:uncertainty:weight:isResolved:verticalState:", a3->isVerticalResolved, v14, a4, v12, v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v15);

  }
  -[PRItemLocalizer logTargetEstimates:](self, "logTargetEstimates:", v17);
  objc_msgSend(v17, "objectAtIndex:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRItemLocalizer presentTargetEstimate:](self, "presentTargetEstimate:", v16);

}

- (void)logTargetEstimates:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  OS_os_log *v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v44, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v9 = self->_logger;
        if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "vector");
          v25 = v10;
          objc_msgSend(v8, "vector");
          v24 = v11;
          objc_msgSend(v8, "vector");
          v23 = v12;
          objc_msgSend(v8, "uncertainty");
          v14 = v13;
          objc_msgSend(v8, "weight");
          v16 = v15;
          objc_msgSend(v8, "timestamp");
          v18 = v17;
          v19 = objc_msgSend(v8, "verticalState");
          *(_DWORD *)buf = 134219520;
          v31 = v25;
          v32 = 2048;
          v33 = v24;
          v34 = 2048;
          v35 = v23;
          v36 = 2048;
          v37 = v14;
          v38 = 2048;
          v39 = v16;
          v40 = 2048;
          v41 = v18;
          v42 = 2048;
          v43 = v19;
          _os_log_impl(&dword_2230E5000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Target: estimate = (%f, %f, %f), uncertainty = %f, weight = %f, time %f, verticalState %lu", buf, 0x48u);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v44, 16);
    }
    while (v5);
  }

  -[PRItemLocalizer dataRecorder](self, "dataRecorder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (!v21)
  {
    -[PRItemLocalizer dataRecorder](self, "dataRecorder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "recordTargetEstimates:", v4);

  }
}

- (void)logRangeEstimate:(id)a3
{
  id v4;
  OS_os_log *v5;
  float v6;
  float v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  int v12;
  double v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_logger;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "range");
    v7 = v6;
    objc_msgSend(v4, "timestamp");
    v12 = 134218240;
    v13 = v7;
    v14 = 2048;
    v15 = v8;
    _os_log_impl(&dword_2230E5000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "RangeEstimator output: range = %f, time %f", (uint8_t *)&v12, 0x16u);
  }

  -[PRItemLocalizer dataRecorder](self, "dataRecorder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (!v10)
  {
    -[PRItemLocalizer dataRecorder](self, "dataRecorder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordRangeEstimate:", v4);

  }
}

- (void)logTargetIsMovingChange:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *logger;
  uint64_t v6;
  void *v7;
  double MachContinuousTimeSeconds;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "TargetMovingState = %d", (uint8_t *)v10, 8u);
  }
  -[PRItemLocalizer analytics](self, "analytics");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "targetMovingStateChanged:", v3);

  -[PRItemLocalizer dataRecorder](self, "dataRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = v7 == 0;

  if ((v6 & 1) == 0)
  {
    MachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
    -[PRItemLocalizer dataRecorder](self, "dataRecorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordTargetMovingStateChanged:atTime:", v3, MachContinuousTimeSeconds);

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
  -[PRItemLocalizer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PRItemLocalizer delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__PRItemLocalizer_updateDelegateWithSelector_object___block_invoke;
    block[3] = &unk_24EC113D8;
    v10 = v7;
    v12 = a3;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __53__PRItemLocalizer_updateDelegateWithSelector_object___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)devicePoseUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  PRItemLocalizer *v12;
  id v13;
  char v14;
  BOOL v15;
  id location;

  v4 = a3;
  -[PRItemLocalizer updateDelegateWithSelector:object:](self, "updateDelegateWithSelector:object:", sel_willIntegrateDevicePose_, v4);
  -[PRItemLocalizer analytics](self, "analytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateTravelDistanceWithPose:", v4);

  -[PRItemLocalizer dataRecorder](self, "dataRecorder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordPoseMeasurement:", v4);

  LOBYTE(v6) = -[PRItemLocalizer targetIsMoving](self, "targetIsMoving");
  v7 = -[PRItemLocalizer deviceIsMoving](self, "deviceIsMoving");
  objc_initWeak(&location, self);
  -[PRItemLocalizer estimatorQueue](self, "estimatorQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__PRItemLocalizer_devicePoseUpdated___block_invoke;
  block[3] = &unk_24EC11878;
  objc_copyWeak(&v13, &location);
  v14 = (char)v6;
  v15 = v7;
  v11 = v4;
  v12 = self;
  v9 = v4;
  dispatch_async(v8, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __37__PRItemLocalizer_devicePoseUpdated___block_invoke(uint64_t x0_0)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *v16;
  double v17;
  double v18;
  float v19;
  void *v20;
  __int128 *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[13];
  _QWORD v26[4];
  __int128 v27;
  void *__p[2];
  __int128 v29;
  _BYTE buf[14];
  _BYTE v31[10];
  uint64_t v32;
  __int16 v33;
  _BYTE v34[18];
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;
  simd_float4x4 v42;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(x0_0 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(x0_0 + 48));

  if (!WeakRetained)
    return;
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "trajectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", *(_QWORD *)(x0_0 + 32));

  objc_msgSend(v4, "latestProximity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "estimatorInputForProximity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "performFilteringWithEstimatorInput:targetMoving:deviceMoving:", v7, *(unsigned __int8 *)(x0_0 + 56), *(unsigned __int8 *)(x0_0 + 57));
    objc_msgSend(*(id *)(x0_0 + 32), "timestamp");
    objc_msgSend(*(id *)(x0_0 + 40), "setPreviousVIOPoseTime:");
    objc_msgSend(v4, "setLatestProximity:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(x0_0 + 32), "timestamp");
    v9 = v8;
    objc_msgSend(*(id *)(x0_0 + 40), "previousVIOPoseTime");
    if (v9 - v10 >= 0.5)
    {
      objc_msgSend(*(id *)(x0_0 + 32), "pose");
      *(double *)&v11 = simd_quaternion(v42);
      v24 = v11;
      objc_msgSend(*(id *)(x0_0 + 32), "pose");
      v23 = v12;
      v13 = *(id *)(*(_QWORD *)(x0_0 + 40) + 24);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(x0_0 + 32), "timestamp");
        *(_DWORD *)buf = 134219776;
        *(double *)&buf[4] = *(float *)&v24;
        *(_WORD *)&buf[12] = 2048;
        *(double *)v31 = *((float *)&v24 + 1);
        *(_WORD *)&v31[8] = 2048;
        *(double *)&v32 = *((float *)&v24 + 2);
        v33 = 2048;
        *(double *)v34 = *((float *)&v24 + 3);
        *(_WORD *)&v34[8] = 2048;
        *(double *)&v34[10] = *(float *)&v23;
        v35 = 2048;
        v36 = *((float *)&v23 + 1);
        v37 = 2048;
        v38 = *((float *)&v23 + 2);
        v39 = 2048;
        v40 = v14;
        _os_log_impl(&dword_2230E5000, v13, OS_LOG_TYPE_DEFAULT, "VIO pose: quat = (%f, %f, %f, %f), trans = (%f, %f, %f), time = %f", buf, 0x52u);
      }

      objc_msgSend(*(id *)(x0_0 + 32), "timestamp");
      objc_msgSend(*(id *)(x0_0 + 40), "setPreviousVIOPoseTime:");
    }
  }
  objc_msgSend(v4, "produceBlendedRangeEstimateForPose:", *(_QWORD *)(x0_0 + 32), v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v4, "logRangeEstimate:", v15);
    objc_msgSend(v4, "presentRangeEstimate:", v15);
  }
  v16 = (RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *)v4[1];
  objc_msgSend(*(id *)(x0_0 + 32), "timestamp");
  v18 = v17;
  objc_msgSend(*(id *)(x0_0 + 32), "pose");
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::updateCurrentBatchSolution(v16, v18, v19, buf);
  if (*(_DWORD *)buf != 5)
  {
    v22 = *(void **)(x0_0 + 40);
    if (v22)
    {
      objc_msgSend(v22, "lastSolution");
    }
    else
    {
      *(_OWORD *)__p = 0u;
      v29 = 0u;
      v27 = 0u;
    }
    objc_msgSend(v4, "revokeTargetEstimateWithLastSolution:", &v27);
    v20 = __p[0];
    if (!__p[0])
      goto LABEL_20;
    v21 = &v27;
    goto LABEL_19;
  }
  if (buf[12])
  {
    *(_QWORD *)v25 = *(_QWORD *)buf;
    *(_QWORD *)&v25[5] = *(_QWORD *)&buf[5];
    memset(v26, 0, 24);
    std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(v26, *(const void **)&v31[2], v32, 0xCF3CF3CF3CF3CF3DLL * ((v32 - *(_QWORD *)&v31[2]) >> 3));
    v26[3] = *(_QWORD *)&v34[6];
    objc_msgSend(*(id *)(x0_0 + 32), "timestamp");
    objc_msgSend(v4, "logAndPresentSolution:withTimeStamp:", v25);
    v20 = (void *)v26[0];
    if (v26[0])
    {
      v21 = (__int128 *)v25;
LABEL_19:
      *((_QWORD *)v21 + 3) = v20;
      operator delete(v20);
    }
  }
LABEL_20:
  objc_msgSend(v4, "updateDelegateWithSelector:object:", sel_didUpdateDevicePose_, *(_QWORD *)(x0_0 + 32));
  if (*(_QWORD *)&v31[2])
  {
    v32 = *(uint64_t *)&v31[2];
    operator delete(*(void **)&v31[2]);
  }

}

- (void)setDegeneratePath:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *logger;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  if (-[PRItemLocalizer pathIsDegenerate](self, "pathIsDegenerate") != a3)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "Informing delegate that degenerate path state changed to %d", (uint8_t *)v7, 8u);
    }
    -[PRItemLocalizer setPathIsDegenerate:](self, "setPathIsDegenerate:", v3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRItemLocalizer updateDelegateWithSelector:object:](self, "updateDelegateWithSelector:object:", sel_pathIsDegenerate_, v6);

  }
}

- (void)performFilteringWithEstimatorInput:(id)a3 targetMoving:(BOOL)a4 deviceMoving:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *logger;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28[16];
  void *v29;
  void *v30;
  uint8_t buf[16];
  void *v32;
  void *v33;
  _QWORD v34[2];
  void *__p;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  void *v45;
  _BYTE *v46;
  uint64_t v47;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  if (a4)
  {
    objc_msgSend(v8, "proximity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PRItemLocalizer performRangeFilteringWithoutVIO:targetMoving:deviceMoving:](self, "performRangeFilteringWithoutVIO:targetMoving:deviceMoving:", v10, 1, v5);

    goto LABEL_30;
  }
  -[PRItemLocalizer performLocationFiltering:](self, "performLocationFiltering:", v8);
  if (LODWORD(v44[0]) == 3)
  {
    -[PRItemLocalizer setDegeneratePath:](self, "setDegeneratePath:", 1);
    -[PRItemLocalizer lastSolution](self, "lastSolution");
    -[PRItemLocalizer revokeTargetEstimateWithLastSolution:](self, "revokeTargetEstimateWithLastSolution:", v28);
    v22 = v29;
    if (!v29)
      goto LABEL_28;
    v30 = v29;
LABEL_27:
    operator delete(v22);
    goto LABEL_28;
  }
  if (LODWORD(v44[0]) == 6)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "RESET_FROM_HIGH_RESIDUALS detected: Resetting VIO & estimators.", buf, 2u);
    }
    -[PRItemLocalizer lastSolution](self, "lastSolution");
    v18 = v32;
    v19 = v33;
    if (v32)
    {
      v33 = v32;
      operator delete(v32);
    }
    if (v18 != v19)
    {
      v20 = self->_logger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2230E5000, v20, OS_LOG_TYPE_DEFAULT, "Revoke solution due to high residual reset", buf, 2u);
      }
    }
    -[PRItemLocalizer setDegeneratePath:](self, "setDegeneratePath:", 0);
    -[PRItemLocalizer poseProvider](self, "poseProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reset");

    -[PRItemLocalizer reset](self, "reset");
    -[PRItemLocalizer revokeTargetEstimate:](self, "revokeTargetEstimate:", 5);
    goto LABEL_28;
  }
  if (LODWORD(v44[0]) != 5)
  {
    -[PRItemLocalizer setDegeneratePath:](self, "setDegeneratePath:", 0);
    -[PRItemLocalizer lastSolution](self, "lastSolution");
    -[PRItemLocalizer revokeTargetEstimateWithLastSolution:](self, "revokeTargetEstimateWithLastSolution:", &v25);
    v22 = v26;
    if (!v26)
      goto LABEL_28;
    v27 = v26;
    goto LABEL_27;
  }
  v39[0] = v44[0];
  *(_QWORD *)((char *)v39 + 5) = *(_QWORD *)((char *)v44 + 5);
  v40 = 0;
  v41 = 0;
  v42 = 0;
  std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(&v40, v45, (uint64_t)v46, 0xCF3CF3CF3CF3CF3DLL * ((v46 - (_BYTE *)v45) >> 3));
  v43 = v47;
  objc_msgSend(v9, "proximity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mach_absolute_time_sec");
  -[PRItemLocalizer logAndPresentSolution:withTimeStamp:](self, "logAndPresentSolution:withTimeStamp:", v39);

  if (v40)
  {
    v41 = v40;
    operator delete(v40);
  }
  -[PRItemLocalizer setDegeneratePath:](self, "setDegeneratePath:", 0);
  v34[0] = v44[0];
  *(_QWORD *)((char *)v34 + 5) = *(_QWORD *)((char *)v44 + 5);
  __p = 0;
  v36 = 0;
  v37 = 0;
  std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(&__p, v45, (uint64_t)v46, 0xCF3CF3CF3CF3CF3DLL * ((v46 - (_BYTE *)v45) >> 3));
  v38 = v47;
  -[PRItemLocalizer setLastSolution:](self, "setLastSolution:", v34);
  if (__p)
  {
    v36 = __p;
    operator delete(__p);
  }
  -[PRItemLocalizer lastSolution](self, "lastSolution");
  v13 = *((_DWORD *)v32 + 40);
  v33 = v32;
  operator delete(v32);
  if (v13)
  {
    if (v13 == 1 && !-[PRItemLocalizer firstRangeArrow](self, "firstRangeArrow"))
    {
      -[PRItemLocalizer setFirstRangeArrow:](self, "setFirstRangeArrow:", 1);
      -[PRItemLocalizer analytics](self, "analytics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstArrowFromRange");

      v15 = self->_logger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "First arrow from SA";
LABEL_34:
        _os_log_impl(&dword_2230E5000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
      }
    }
  }
  else if (!-[PRItemLocalizer firstAoAArrow](self, "firstAoAArrow"))
  {
    -[PRItemLocalizer setFirstAoAArrow:](self, "setFirstAoAArrow:", 1);
    -[PRItemLocalizer analytics](self, "analytics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstArrowFromAoA");

    v15 = self->_logger;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "First arrow from AoA";
      goto LABEL_34;
    }
  }
LABEL_28:
  v23 = -[PRItemLocalizer performRangeFilteringWithVIO:](self, "performRangeFilteringWithVIO:", v9);
  if (v45)
  {
    v46 = v45;
    operator delete(v45);
  }
LABEL_30:

}

- (void)reset
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PRItemLocalizer estimatorQueue](self, "estimatorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __24__PRItemLocalizer_reset__block_invoke;
  v4[3] = &unk_24EC11360;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __24__PRItemLocalizer_reset__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter **v3;
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *v4;
  void *v5;
  __int128 v6;
  void *__p[2];
  __int128 v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = (RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter **)objc_loadWeakRetained(v1);
    v4 = (RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *)operator new();
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::PRRoseSyntheticApertureBatchFilter(v4);
    std::unique_ptr<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter>::reset[abi:ne180100](v3 + 1, v4);
    objc_msgSend(v3, "setLatestProximity:", 0);
    objc_msgSend(v3, "setDegeneratePath:", 0);
    *(_OWORD *)__p = 0u;
    v8 = 0u;
    v6 = 0u;
    objc_msgSend(v3, "setLastSolution:", &v6);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    objc_msgSend(v3, "trajectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

  }
}

- (void)invalidPoseDetected
{
  NSObject *logger;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  void *v9;
  void *v10;

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "invalidPoseDetected: Resetting location estimator", v8, 2u);
  }
  -[PRItemLocalizer lastSolution](self, "lastSolution");
  v4 = v9;
  v5 = v10;
  if (v9)
  {
    v10 = v9;
    operator delete(v9);
  }
  if (v4 != v5)
  {
    v6 = self->_logger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2230E5000, v6, OS_LOG_TYPE_DEFAULT, "Revoke solution due to VIO reset", v8, 2u);
    }
  }
  -[PRItemLocalizer reset](self, "reset");
  -[PRItemLocalizer revokeTargetEstimate:](self, "revokeTargetEstimate:", 0);
  -[PRItemLocalizer analytics](self, "analytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidPoseDetected");

}

- (void)didReceiveNewSolutions:(id)a3
{
  id v4;
  OS_os_log *v5;
  uint64_t v6;
  void *v7;
  OS_os_log *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  PRProximity *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  NSObject *logger;
  PRProximity *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  NSObject *v51;
  _QWORD block[4];
  id v53;
  id v54;
  char v55;
  BOOL v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  int v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_logger;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v58) = objc_msgSend(v4, "count");
    _os_log_impl(&dword_2230E5000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Received %d solutions from Proximity", buf, 8u);
  }

  self->_lastSuccessfulCompanionCommunicationOrInitMachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_58);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "az_valid") && objc_msgSend(v7, "el_valid"))
    {
      v8 = self->_logger;
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "range_m");
        v10 = v9;
        objc_msgSend(v7, "az_deg");
        v12 = v11;
        objc_msgSend(v7, "el_deg");
        v14 = v13;
        objc_msgSend(v7, "mach_absolute_time_sec");
        v16 = v15;
        objc_msgSend(v7, "track_score");
        v18 = v17;
        v19 = objc_msgSend(v7, "previous_solution_is_bad");
        objc_msgSend(v7, "sweep_angle_deg");
        *(_DWORD *)buf = 134219520;
        v58 = v10;
        v59 = 2048;
        v60 = v12;
        v61 = 2048;
        v62 = v14;
        v63 = 2048;
        v64 = v16;
        v65 = 2048;
        v66 = v18;
        v67 = 1024;
        v68 = v19;
        v69 = 2048;
        v70 = v20;
        v21 = "Found raw measurement with range_m %f m, az_deg %f deg, el_deg %f deg for time %f, track score %f, prev_so"
              "lution_is_bad %d, sweep_angle_deg %f";
        v22 = v8;
        v23 = 68;
LABEL_10:
        _os_log_impl(&dword_2230E5000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
    else
    {
      v8 = self->_logger;
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "range_m");
        v25 = v24;
        objc_msgSend(v7, "mach_absolute_time_sec");
        *(_DWORD *)buf = 134218240;
        v58 = v25;
        v59 = 2048;
        v60 = v26;
        v21 = "Found raw measurement with range_m %f m for time %f";
        v22 = v8;
        v23 = 22;
        goto LABEL_10;
      }
    }

    objc_msgSend(v7, "range_m");
    if (v27 <= -0.5)
    {
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
        -[PRItemLocalizer didReceiveNewSolutions:].cold.1(logger);
    }
    else
    {
      if (objc_msgSend(v7, "az_valid") && objc_msgSend(v7, "el_valid"))
      {
        v28 = [PRProximity alloc];
        objc_msgSend(v7, "mach_absolute_time_sec");
        v30 = v29;
        objc_msgSend(v7, "range_m");
        v32 = v31;
        objc_msgSend(v7, "az_deg");
        v34 = v33;
        objc_msgSend(v7, "el_deg");
        *(float *)&v35 = v32;
        *(float *)&v36 = v34;
        *(float *)&v38 = v37;
        v39 = -[PRProximity initWithTime:range:azimuth:elevation:](v28, "initWithTime:range:azimuth:elevation:", v30, v35, v36, v38);
      }
      else
      {
        v41 = [PRProximity alloc];
        objc_msgSend(v7, "mach_absolute_time_sec");
        v43 = v42;
        objc_msgSend(v7, "range_m");
        *(float *)&v45 = v44;
        v39 = -[PRProximity initWithTime:range:](v41, "initWithTime:range:", v43, v45);
      }
      v46 = (void *)v39;
      -[PRItemLocalizer updateDelegateWithSelector:object:](self, "updateDelegateWithSelector:object:", sel_willIntegrateProximity_, v39);
      -[PRItemLocalizer analytics](self, "analytics");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "updateWithRangeEstimate:", v46);

      if (objc_msgSend(v7, "soi_rssi_valid"))
      {
        -[PRItemLocalizer analytics](self, "analytics");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "soi_rssi_dbm");
        objc_msgSend(v48, "updateSOIRSSI:");

      }
      -[PRItemLocalizer dataRecorder](self, "dataRecorder");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "recordProximityMeasurement:", v7);

      LOBYTE(v49) = -[PRItemLocalizer targetIsMoving](self, "targetIsMoving");
      v50 = -[PRItemLocalizer deviceIsMoving](self, "deviceIsMoving");
      objc_initWeak((id *)buf, self);
      -[PRItemLocalizer estimatorQueue](self, "estimatorQueue");
      v51 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __42__PRItemLocalizer_didReceiveNewSolutions___block_invoke_61;
      block[3] = &unk_24EC118E0;
      objc_copyWeak(&v54, (id *)buf);
      v53 = v7;
      v55 = (char)v49;
      v56 = v50;
      dispatch_async(v51, block);

      objc_destroyWeak(&v54);
      objc_destroyWeak((id *)buf);

    }
  }

}

BOOL __42__PRItemLocalizer_didReceiveNewSolutions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "variant"))
    v3 = objc_msgSend(v2, "variant") == 2;
  else
    v3 = 1;

  return v3;
}

void __42__PRItemLocalizer_didReceiveNewSolutions___block_invoke_61(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(*(id *)(a1 + 32), "mach_absolute_time_sec");
    objc_msgSend(v4, "deleteTrajectoryWaypointsBeforeTime:");
    objc_msgSend(v4, "latestProximity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v4[3];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_2230E5000, v6, OS_LOG_TYPE_DEFAULT, "Unprocessed proximity measurement found. Using non-vio range filtering", v13, 2u);
      }
      objc_msgSend(v4, "latestProximity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "performRangeFilteringWithoutVIO:targetMoving:deviceMoving:", v7, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "logRangeEstimate:", v8);
      objc_msgSend(v4, "presentRangeEstimate:", v8);
      objc_msgSend(v4, "setLatestProximity:", 0);

    }
    objc_msgSend(v4, "estimatorInputForProximity:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "performFilteringWithEstimatorInput:targetMoving:deviceMoving:", v9, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
      objc_msgSend(v4, "trajectory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "produceBlendedRangeEstimateForPose:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v4, "logRangeEstimate:", v12);
        objc_msgSend(v4, "presentRangeEstimate:", v12);
      }

    }
    else
    {
      objc_msgSend(v4, "setLatestProximity:", *(_QWORD *)(a1 + 32));
    }

  }
}

- (id)performRangeFilteringWithoutVIO:(id)a3 targetMoving:(BOOL)a4 deviceMoving:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  unint64_t v9;
  int v10;
  double v11;
  double v12;
  double v13;
  PRProximity *v14;
  PRProximity *v15;
  uint64_t v17;
  double v18[3];
  int v19;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_msgSend(v8, "antenna_type") - 1;
  if (v9 < 4)
    v10 = v9 + 1;
  else
    v10 = 0;
  objc_msgSend(v8, "mach_absolute_time_sec");
  v12 = v11;
  objc_msgSend(v8, "range_m");
  v18[0] = v12;
  v18[1] = v13;
  v18[2] = 0.1;
  v19 = v10;
  RoseSyntheticApertureFiltering::PRRoseRangeFilter::addMeasurementWithoutVIO((uint64_t)self->_rangeFilter.__ptr_.__value_, v18, v6, v5, (uint64_t)&v17);
  v14 = [PRProximity alloc];
  objc_msgSend(v8, "mach_absolute_time_sec");
  v15 = -[PRProximity initWithTime:range:](v14, "initWithTime:range:");

  return v15;
}

- (id)performRangeFilteringWithVIO:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  PRProximity *v21;
  void *v22;
  PRProximity *v23;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  _BYTE v32[8];
  _QWORD v33[3];
  int v34;
  char v35;
  char v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;

  v4 = a3;
  objc_msgSend(v4, "translation");
  v31 = v5;
  objc_msgSend(v4, "translation");
  v30 = v6;
  objc_msgSend(v4, "translation");
  v29 = v7;
  objc_msgSend(v4, "rotation");
  v28 = v8;
  objc_msgSend(v4, "rotation");
  v27 = v9;
  objc_msgSend(v4, "rotation");
  v26 = v10;
  objc_msgSend(v4, "rotation");
  objc_msgSend(v4, "proximity", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "antenna_type");
  if ((unint64_t)(v14 - 1) < 4)
    v15 = v14;
  else
    v15 = 0;

  objc_msgSend(v4, "proximity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mach_absolute_time_sec");
  v18 = v17;
  objc_msgSend(v4, "proximity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "range_m");
  v33[0] = v18;
  v33[1] = v20;
  v33[2] = 0x3FB999999999999ALL;
  v34 = v15;
  v35 = 0;
  v36 = 0;
  v37 = v31;
  v38 = v30;
  v39 = v29;
  v40 = v28;
  v41 = v27;
  v42 = v26;
  v43 = v25;

  RoseSyntheticApertureFiltering::PRRoseRangeFilter::addMeasurementWithVIO((uint64_t)self->_rangeFilter.__ptr_.__value_, (uint64_t)v33, (uint64_t)v32);
  v21 = [PRProximity alloc];
  objc_msgSend(v4, "proximity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mach_absolute_time_sec");
  v23 = -[PRProximity initWithTime:range:](v21, "initWithTime:range:");

  return v23;
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  NSObject *logger;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int clientState;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received PRRangingServiceStateUnknown", buf, 2u);
      }
      goto LABEL_4;
    case 1uLL:
      v21 = self->_logger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2230E5000, v21, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received PRRangingServiceStateNotReady", buf, 2u);
      }
      v6 = 1;
      break;
    case 2uLL:
      v7 = self->_logger;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2230E5000, v7, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received PRRangingServiceStateReady", buf, 2u);
      }
      if (!self->_rangingState)
        self->_rangingState = 1;
      v8 = self->_logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        clientState = self->_clientState;
        *(_DWORD *)buf = 67109120;
        v31 = clientState;
        _os_log_impl(&dword_2230E5000, v8, OS_LOG_TYPE_DEFAULT, "#companion-retry rangingServiceDidUpdateState PRRangingServiceStateReady _clientState=%i", buf, 8u);
      }
      if ((self->_clientState - 2) <= 2 && self->_rangingState == 1)
      {
        v10 = self->_logger;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2230E5000, v10, OS_LOG_TYPE_DEFAULT, "#companion-retry Configuring due to client state", buf, 2u);
        }
        -[PRItemLocalizer session](self, "session");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRItemLocalizer remoteDevice](self, "remoteDevice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRItemLocalizer configurationParameters](self, "configurationParameters");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "configureForCompanionRanging:options:", v12, v13);

        self->_rangingState = 2;
      }
      v14 = self->_logger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v6 = 2;
        _os_log_impl(&dword_2230E5000, v14, OS_LOG_TYPE_DEFAULT, "#companion-retry sending PRItemLocalizerStateReady to client", buf, 2u);
      }
      else
      {
        v6 = 2;
      }
      break;
    case 3uLL:
      v22 = self->_logger;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2230E5000, v22, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received PRRangingServiceStateError", buf, 2u);
      }
      v23 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD0FC8];
      v29 = CFSTR("Received RangingServiceStateError");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE7B448], 999, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[PRItemLocalizer didFailWithError:](self, "didFailWithError:", v25);
      v6 = 3;
      break;
    case 4uLL:
      v15 = self->_logger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2230E5000, v15, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received PRRangingServiceStateOff", buf, 2u);
      }
      v16 = self->_logger;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_clientState;
        *(_DWORD *)buf = 67109120;
        v31 = v17;
        _os_log_impl(&dword_2230E5000, v16, OS_LOG_TYPE_DEFAULT, "#companion-retry rangingServiceDidUpdateState PRRangingServiceStateOff _clientState=%i", buf, 8u);
      }
      if ((self->_clientState - 1) <= 3)
      {
        v18 = (void *)MEMORY[0x24BDD1540];
        v26 = *MEMORY[0x24BDD0FC8];
        v27 = CFSTR("Received RangingServiceStateOff after at least attempting to config");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE7B448], 999, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[PRItemLocalizer didFailWithError:](self, "didFailWithError:", v20);
      }
      v6 = 4;
      break;
    default:
LABEL_4:
      v6 = 0;
      break;
  }
  -[PRItemLocalizer sendItemLocalizerChangedState:](self, "sendItemLocalizerChangedState:", v6, a4);
}

- (void)sendPRItemState:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  -[PRItemLocalizer delegateQueue](self, "delegateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PRItemLocalizer delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = MEMORY[0x24BDAC9B8];
    v7 = MEMORY[0x24BDAC9B8];
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __35__PRItemLocalizer_sendPRItemState___block_invoke;
    v9[3] = &unk_24EC113B0;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a3;
    v10 = WeakRetained;
    dispatch_async(v6, v9);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }

}

void __35__PRItemLocalizer_sendPRItemState___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    v5 = v4[3];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = 134217984;
      v8 = v6;
      _os_log_impl(&dword_2230E5000, v5, OS_LOG_TYPE_DEFAULT, "#companion-retry Remote item changed state: %lu", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "itemChangedState:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4 = 0;
  }

}

- (void)sendItemLocalizerChangedActivity:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  -[PRItemLocalizer delegateQueue](self, "delegateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PRItemLocalizer delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = MEMORY[0x24BDAC9B8];
    v7 = MEMORY[0x24BDAC9B8];
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__PRItemLocalizer_sendItemLocalizerChangedActivity___block_invoke;
    v9[3] = &unk_24EC113B0;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a3;
    v10 = WeakRetained;
    dispatch_async(v6, v9);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }

}

void __52__PRItemLocalizer_sendItemLocalizerChangedActivity___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    v5 = v4[3];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = 134217984;
      v8 = v6;
      _os_log_impl(&dword_2230E5000, v5, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer changed activity: %lu", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "itemLocalizerChangedActivity:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4 = 0;
  }

}

- (void)sendItemLocalizerChangedState:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  -[PRItemLocalizer delegateQueue](self, "delegateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PRItemLocalizer delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = MEMORY[0x24BDAC9B8];
    v7 = MEMORY[0x24BDAC9B8];
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __49__PRItemLocalizer_sendItemLocalizerChangedState___block_invoke;
    v9[3] = &unk_24EC113B0;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a3;
    v10 = WeakRetained;
    dispatch_async(v6, v9);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }

}

void __49__PRItemLocalizer_sendItemLocalizerChangedState___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    v5 = v4[3];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = 134217984;
      v8 = v6;
      _os_log_impl(&dword_2230E5000, v5, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer changed state: %lu", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "itemLocalizerChangedState:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4 = 0;
  }

}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *logger;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = v3;
  v14 = v4;
  switch(a3)
  {
    case 0uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 0;
        v6 = "#companion-retry ItemLocalizer received PRRangingRequestStatusUnknown";
        v7 = (uint8_t *)&v12;
        goto LABEL_12;
      }
      break;
    case 1uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 0;
        v6 = "#companion-retry ItemLocalizer received PRRangingRequestStatusDidStart";
        v7 = (uint8_t *)&v11;
        goto LABEL_12;
      }
      break;
    case 2uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 0;
        v6 = "#companion-retry ItemLocalizer received PRRangingRequestStatusStopped";
        v7 = (uint8_t *)&v10;
        goto LABEL_12;
      }
      break;
    case 3uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 0;
        v6 = "#companion-retry ItemLocalizer received PRRangingRequestStatusInvalidated";
        v7 = (uint8_t *)&v9;
        goto LABEL_12;
      }
      break;
    case 4uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 0;
        v6 = "#companion-retry ItemLocalizer received PRRangingRequestStatusFailedToStart";
        v7 = (uint8_t *)&v8;
LABEL_12:
        _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *logger;
  const char *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int clientState;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[PRItemLocalizer remoteDevice](self, "remoteDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    switch(a4)
    {
      case 0:
        logger = self->_logger;
        if (!os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_WORD *)buf = 0;
        v12 = "#companion-retry ItemLocalizer received PRRemoteDeviceStateUnknown";
        goto LABEL_18;
      case 1:
        v13 = self->_logger;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2230E5000, v13, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received PRRemoteDeviceStateReady", buf, 2u);
        }
        if (self->_rangingState == 2)
        {
          self->_rangingState = 3;
          self->_lastSuccessfulCompanionCommunicationOrInitMachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
          -[PRItemLocalizer analytics](self, "analytics");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "configureComplete");

        }
        v15 = self->_logger;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          clientState = self->_clientState;
          *(_DWORD *)buf = 67109120;
          v29 = clientState;
          _os_log_impl(&dword_2230E5000, v15, OS_LOG_TYPE_DEFAULT, "#companion-retry remoteDeviceDidChangeState _clientState=%i", buf, 8u);
        }
        v17 = self->_clientState;
        if (v17 == 4)
        {
          v19 = self->_logger;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2230E5000, v19, OS_LOG_TYPE_DEFAULT, "#companion-retry Restarting ranging on PRRemoteDeviceStateReady.", buf, 2u);
          }
          -[PRItemLocalizer session](self, "session");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRItemLocalizer remoteDevice](self, "remoteDevice");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0;
          v22 = objc_msgSend(v20, "startCompanionRanging:options:error:", v21, 0, &v27);
          v23 = v27;

          if ((v22 & 1) != 0)
          {
            self->_rangingState = 4;
            v24 = self->_logger;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2230E5000, v24, OS_LOG_TYPE_DEFAULT, "#companion-retry Sending PRItemStateReconnected", buf, 2u);
            }
            -[PRItemLocalizer sendPRItemState:](self, "sendPRItemState:", 3);
          }
          else
          {
            v25 = self->_logger;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2230E5000, v25, OS_LOG_TYPE_DEFAULT, "Failed to restart ranging on PRRemoteDeviceStateReady.", buf, 2u);
            }
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE7B448], 301, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[PRItemLocalizer didFailWithError:](self, "didFailWithError:", v26);

          }
        }
        else if (v17 == 2)
        {
          self->_clientState = 3;
          v18 = self->_logger;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2230E5000, v18, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting _clientState to LOCALIZER_CLIENT_CONFIGURED remoteDeviceDidChangeState", buf, 2u);
          }
          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v12 = "#companion-retry Sending PRItemStateFindable";
LABEL_18:
            _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
          }
LABEL_19:
          -[PRItemLocalizer sendPRItemState:](self, "sendPRItemState:", a4);
        }
        break;
      case 2:
        -[PRItemLocalizer remoteDeviceDidMove](self, "remoteDeviceDidMove");
        break;
      case 3:
        -[PRItemLocalizer sendPRItemState:](self, "sendPRItemState:", 6);
        break;
      default:
        break;
    }
  }

}

- (void)remoteDeviceDidMove
{
  NSObject *logger;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD block[4];
  id v9;
  id buf[2];
  void *v11;
  void *v12;

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "Setting targetIsMoving = YES", (uint8_t *)buf, 2u);
  }
  -[PRItemLocalizer setTargetIsMoving:](self, "setTargetIsMoving:", 1);
  -[PRItemLocalizer sendPRItemState:](self, "sendPRItemState:", 4);
  -[PRItemLocalizer lastSolution](self, "lastSolution");
  v4 = v11;
  v5 = v12;
  if (v11)
  {
    v12 = v11;
    operator delete(v11);
  }
  if (v4 != v5)
  {
    v6 = self->_logger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2230E5000, v6, OS_LOG_TYPE_DEFAULT, "Revoke solution due to target motion", (uint8_t *)buf, 2u);
    }
  }
  -[PRItemLocalizer revokeTargetEstimate:](self, "revokeTargetEstimate:", 1);
  -[PRItemLocalizer reset](self, "reset");
  -[PRItemLocalizer logTargetIsMovingChange:](self, "logTargetIsMovingChange:", -[PRItemLocalizer targetIsMoving](self, "targetIsMoving"));
  -[PRItemLocalizer movementTimer](self, "movementTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  objc_initWeak(buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__PRItemLocalizer_remoteDeviceDidMove__block_invoke;
  block[3] = &unk_24EC11360;
  objc_copyWeak(&v9, buf);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

void __38__PRItemLocalizer_remoteDeviceDidMove__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    v4 = (void *)MEMORY[0x24BDBCF40];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__PRItemLocalizer_remoteDeviceDidMove__block_invoke_2;
    v7[3] = &unk_24EC11388;
    v5 = v3;
    v8 = v5;
    objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 2.5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMovementTimer:", v6);

  }
}

void __38__PRItemLocalizer_remoteDeviceDidMove__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2230E5000, v4, OS_LOG_TYPE_DEFAULT, "Setting targetIsMoving = NO", v5, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setTargetIsMoving:", 0);
  objc_msgSend(*(id *)(a1 + 32), "logTargetIsMovingChange:", objc_msgSend(*(id *)(a1 + 32), "targetIsMoving"));
  objc_msgSend(*(id *)(a1 + 32), "sendPRItemState:", 5);

}

- (void)didFailWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *logger;
  OS_os_log *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id location;
  uint8_t buf[4];
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PRItemLocalizer analytics](self, "analytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rangingFailedWithError:", v4);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = *(double *)&v4;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "#companion-retry received didFailWithError error:%@", buf, 0xCu);
  }
  if (objc_msgSend(v4, "code") == 300)
  {
    -[PRItemLocalizer updateDelegateWithSelector:object:](self, "updateDelegateWithSelector:object:", sel_didFailWithError_, v4);
  }
  else
  {
    v7 = self->_logger;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v4, "code");
      *(_DWORD *)buf = 134217984;
      v23 = *(double *)&v8;
      _os_log_impl(&dword_2230E5000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received error code %lld", buf, 0xCu);
    }

    if (objc_msgSend(v4, "code") == 302)
    {
      v9 = self->_logger;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2230E5000, v9, OS_LOG_TYPE_DEFAULT, "#companion-retry sending PRItemStateReconnecting", buf, 2u);
      }
      -[PRItemLocalizer sendPRItemState:](self, "sendPRItemState:", 2);
    }
    -[PRItemLocalizer session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (v11)
    {
      v18 = self->_logger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2230E5000, v18, OS_LOG_TYPE_DEFAULT, "#companion-retry not attempting to retry - current session is nil and a new one is scheduled", buf, 2u);
      }
    }
    else
    {
      -[PRItemLocalizer session](self, "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invalidate");

      -[PRItemLocalizer setSession:](self, "setSession:", 0);
      self->_rangingState = 0;
      objc_initWeak(&location, self);
      v13 = NomininalRetryTimeMilliseconds;
      v14 = PRCommonGetMachContinuousTimeSeconds()
          - self->_lastSuccessfulCompanionCommunicationOrInitMachContinuousTimeSeconds;
      if (v14 > *(double *)&RetryTimeStartBackoffSeconds)
      {
        v13 = BackoffRetryTimeMilliseconds;
        v15 = self->_logger;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v23 = v14;
          _os_log_impl(&dword_2230E5000, v15, OS_LOG_TYPE_DEFAULT, "#companion-retry Attempting retry at the backoff rate.  It has been %lf seconds since last successful configure or init.  ", buf, 0xCu);
        }
      }
      v16 = dispatch_time(0, 1000000 * v13);
      -[PRItemLocalizer proximityQueue](self, "proximityQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __36__PRItemLocalizer_didFailWithError___block_invoke;
      block[3] = &unk_24EC11908;
      block[4] = self;
      objc_copyWeak(&v20, &location);
      dispatch_after(v16, v17, block);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }

}

void __36__PRItemLocalizer_didFailWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  uint8_t v8[16];

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2230E5000, v2, OS_LOG_TYPE_DEFAULT, "#companion-retry PRCompanionRangingSession initWithDelegate", v8, 2u);
  }
  v3 = objc_alloc(MEMORY[0x24BE7B430]);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "proximityQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithDelegate:queue:", v4, v5);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setSession:", v6);

}

- (void)dealloc
{
  NSObject *logger;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[16];

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "Destructing PRItemLocalizer and invalidating nearbyd XCP connection.", buf, 2u);
  }
  -[PRItemLocalizer session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[PRItemLocalizer movementTimer](self, "movementTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[PRItemLocalizer analytics](self, "analytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deinit");

  v7.receiver = self;
  v7.super_class = (Class)PRItemLocalizer;
  -[PRItemLocalizer dealloc](&v7, sel_dealloc);
}

- (void)analyticsLogTorchButtonPresented
{
  NSObject *logger;
  void *v4;
  uint8_t v5[16];

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "PRItemLocalizer logging external TorchButtonPresented event", v5, 2u);
  }
  -[PRItemLocalizer analytics](self, "analytics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "torchButtonPresented");

}

- (void)analyticsLogTorchChangedState:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *logger;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("off");
    if (v3)
      v6 = CFSTR("on");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "PRItemLocalizer logging external TorchChangedState event with state = %@", (uint8_t *)&v8, 0xCu);
  }
  -[PRItemLocalizer analytics](self, "analytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "torchChangedState:", v3);

}

- (PRItemLocalizerDelegate)delegate
{
  return (PRItemLocalizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PRDevicePoseProvider)poseProvider
{
  return self->_poseProvider;
}

- (void)setPoseProvider:(id)a3
{
  objc_storeStrong((id *)&self->_poseProvider, a3);
}

- (PRCompanionRangingSession)session
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

- (NSNumber)isOwner
{
  return self->_isOwner;
}

- (void)setIsOwner:(id)a3
{
  objc_storeStrong((id *)&self->_isOwner, a3);
}

- (NSDictionary)configurationParameters
{
  return self->_configurationParameters;
}

- (void)setConfigurationParameters:(id)a3
{
  objc_storeStrong((id *)&self->_configurationParameters, a3);
}

- (OS_dispatch_queue)proximityQueue
{
  return self->_proximityQueue;
}

- (void)setProximityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_proximityQueue, a3);
}

- (BOOL)requiresLowerRangingFrequency
{
  return self->_requiresLowerRangingFrequency;
}

- (void)setRequiresLowerRangingFrequency:(BOOL)a3
{
  self->_requiresLowerRangingFrequency = a3;
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

- (NSMutableArray)trajectory
{
  return self->_trajectory;
}

- (void)setTrajectory:(id)a3
{
  objc_storeStrong((id *)&self->_trajectory, a3);
}

- (PRRoseSolution)latestProximity
{
  return self->_latestProximity;
}

- (void)setLatestProximity:(id)a3
{
  objc_storeStrong((id *)&self->_latestProximity, a3);
}

- (BatchSolution)lastSolution
{
  BatchSolution *result;

  *(_QWORD *)&retstr->solutionStatus = *(_QWORD *)&self->_lastSolution.solutionStatus;
  *(_QWORD *)(&retstr->isVerticalResolved + 1) = *(_QWORD *)(&self->_lastSolution.isVerticalResolved + 1);
  retstr->BatchSolutionList.__end_ = 0;
  retstr->BatchSolutionList.__end_cap_.__value_ = 0;
  retstr->BatchSolutionList.__begin_ = 0;
  result = (BatchSolution *)std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(&retstr->BatchSolutionList.__begin_, self->_lastSolution.BatchSolutionList.__begin_, (uint64_t)self->_lastSolution.BatchSolutionList.__end_, 0xCF3CF3CF3CF3CF3DLL* ((self->_lastSolution.BatchSolutionList.__end_- self->_lastSolution.BatchSolutionList.__begin_) >> 3));
  retstr->lastTestStatisticValue = self->_lastSolution.lastTestStatisticValue;
  return result;
}

- (void)setLastSolution:(BatchSolution *)a3
{
  uint64_t v5;

  v5 = *(_QWORD *)(&a3->isVerticalResolved + 1);
  *(_QWORD *)&self->_lastSolution.solutionStatus = *(_QWORD *)&a3->solutionStatus;
  *(_QWORD *)(&self->_lastSolution.isVerticalResolved + 1) = v5;
  if (&self->_lastSolution != a3)
    std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__assign_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>((char *)&self->_lastSolution.BatchSolutionList, (char *)a3->BatchSolutionList.__begin_, (uint64_t)a3->BatchSolutionList.__end_, 0xCF3CF3CF3CF3CF3DLL * ((a3->BatchSolutionList.__end_ - a3->BatchSolutionList.__begin_) >> 3));
  self->_lastSolution.lastTestStatisticValue = a3->lastTestStatisticValue;
}

- (BOOL)firstRangeArrow
{
  return self->_firstRangeArrow;
}

- (void)setFirstRangeArrow:(BOOL)a3
{
  self->_firstRangeArrow = a3;
}

- (BOOL)firstAoAArrow
{
  return self->_firstAoAArrow;
}

- (void)setFirstAoAArrow:(BOOL)a3
{
  self->_firstAoAArrow = a3;
}

- (double)previousVIOPoseTime
{
  return self->_previousVIOPoseTime;
}

- (void)setPreviousVIOPoseTime:(double)a3
{
  self->_previousVIOPoseTime = a3;
}

- (BOOL)targetIsMoving
{
  return self->_targetIsMoving;
}

- (void)setTargetIsMoving:(BOOL)a3
{
  self->_targetIsMoving = a3;
}

- (BOOL)deviceIsMoving
{
  return self->_deviceIsMoving;
}

- (void)setDeviceIsMoving:(BOOL)a3
{
  self->_deviceIsMoving = a3;
}

- (BOOL)pathIsDegenerate
{
  return self->_pathIsDegenerate;
}

- (void)setPathIsDegenerate:(BOOL)a3
{
  self->_pathIsDegenerate = a3;
}

- (NSTimer)movementTimer
{
  return self->_movementTimer;
}

- (void)setMovementTimer:(id)a3
{
  objc_storeStrong((id *)&self->_movementTimer, a3);
}

- (CMMotionActivityManager)deviceActivityManager
{
  return self->_deviceActivityManager;
}

- (void)setDeviceActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_deviceActivityManager, a3);
}

- (NSOperationQueue)activityQueue
{
  return self->_activityQueue;
}

- (void)setActivityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activityQueue, a3);
}

- (PRFindMyCoreAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (PRItemLocalizerDataRecorder)dataRecorder
{
  return self->_dataRecorder;
}

- (void)setDataRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_dataRecorder, a3);
}

- (void).cxx_destruct
{
  BatchSolutionParticle *begin;

  begin = self->_lastSolution.BatchSolutionList.__begin_;
  if (begin)
  {
    self->_lastSolution.BatchSolutionList.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_dataRecorder, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_deviceActivityManager, 0);
  objc_storeStrong((id *)&self->_movementTimer, 0);
  objc_storeStrong((id *)&self->_latestProximity, 0);
  objc_storeStrong((id *)&self->_trajectory, 0);
  objc_storeStrong((id *)&self->_estimatorQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_proximityQueue, 0);
  objc_storeStrong((id *)&self->_configurationParameters, 0);
  objc_storeStrong((id *)&self->_isOwner, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_poseProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
  std::unique_ptr<RoseSyntheticApertureFiltering::PRRoseRangeFilter>::reset[abi:ne180100]((uint64_t *)&self->_rangeFilter, 0);
  std::unique_ptr<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter>::reset[abi:ne180100]((RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter **)&self->_itemLocationFilter, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 50) = 0;
  *((_BYTE *)self + 204) = 0;
  *((_DWORD *)self + 52) = 0;
  *((_BYTE *)self + 212) = 0;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)didReceiveNewSolutions:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2230E5000, log, OS_LOG_TYPE_ERROR, "Ignoring too negative range measurement", v1, 2u);
}

@end
