@implementation PLSensorAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSensorAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("MotionActivity");
  +[PLSensorAgent entryEventPointDefinitionActivity](PLSensorAgent, "entryEventPointDefinitionActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("DeviceOrientation");
  +[PLSensorAgent entryEventPointDefinitionOrientation](PLSensorAgent, "entryEventPointDefinitionOrientation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("PocketState");
  +[PLSensorAgent entryEventPointDefinitionPocketState](PLSensorAgent, "entryEventPointDefinitionPocketState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("Proximity");
  +[PLSensorAgent entryEventPointDefinitionProximity](PLSensorAgent, "entryEventPointDefinitionProximity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v9[4] = CFSTR("ALS");
  +[PLSensorAgent entryEventPointDefinitionALS](PLSensorAgent, "entryEventPointDefinitionALS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionActivity
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653700;
  v14[1] = MEMORY[0x1E0C9AAB0];
  v13[2] = *MEMORY[0x1E0D80330];
  v14[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("Stationary");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("Confidence");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionOrientation
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653700;
  v12[1] = MEMORY[0x1E0C9AAB0];
  v11[2] = *MEMORY[0x1E0D80330];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Orientation");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionPocketState
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653700;
  v12[1] = MEMORY[0x1E0C9AAB0];
  v11[2] = *MEMORY[0x1E0D80330];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionProximity
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653700;
  v12[1] = MEMORY[0x1E0C9AAB0];
  v11[2] = *MEMORY[0x1E0D80330];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionALS
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653710;
  v14[1] = MEMORY[0x1E0C9AAB0];
  v13[2] = *MEMORY[0x1E0D80330];
  v14[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("Lux");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("RearLux");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PLSensorAgent)init
{
  PLSensorAgent *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLSensorAgent;
  v2 = -[PLAgent init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[PLOperator workQueue](v2, "workQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setUnderlyingQueue:](v2->_operationQueue, "setUnderlyingQueue:", v5);

    v2->_firstProximityEvent = 0;
  }
  return v2;
}

- (void)initTaskOperatorDependancies
{
  PLStateTrackingComposition *v3;
  PLStateTrackingComposition *stateTracker;
  CMPocketStateManager *v5;
  CMPocketStateManager *pocketStateManager;
  CMMotionActivityManager *v7;
  CMMotionActivityManager *motionActivityManager;
  CMDeviceOrientationManager *v9;
  CMDeviceOrientationManager *deviceOrientationManager;
  BrightnessSystemClient *v11;
  BrightnessSystemClient *brightnessSystemClient;
  CMMotionActivityManager *v13;
  void *v14;
  uint64_t v15;
  CMDeviceOrientationManager *v16;
  void *v17;
  CMPocketStateManager *v18;
  void *v19;
  BrightnessSystemClient *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];

  objc_msgSend(MEMORY[0x1E0D80038], "sharedInstance");
  v3 = (PLStateTrackingComposition *)objc_claimAutoreleasedReturnValue();
  stateTracker = self->_stateTracker;
  self->_stateTracker = v3;

  v5 = (CMPocketStateManager *)objc_alloc_init(MEMORY[0x1E0CA56A8]);
  pocketStateManager = self->_pocketStateManager;
  self->_pocketStateManager = v5;

  v7 = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x1E0CA5660]);
  motionActivityManager = self->_motionActivityManager;
  self->_motionActivityManager = v7;

  v9 = (CMDeviceOrientationManager *)objc_alloc_init(MEMORY[0x1E0CA5628]);
  deviceOrientationManager = self->_deviceOrientationManager;
  self->_deviceOrientationManager = v9;

  self->_proximityHIDClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  v11 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E0D15710]);
  brightnessSystemClient = self->_brightnessSystemClient;
  self->_brightnessSystemClient = v11;

  v13 = self->_motionActivityManager;
  -[PLSensorAgent operationQueue](self, "operationQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke;
  v30[3] = &unk_1E85804A0;
  v30[4] = self;
  -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](v13, "startActivityUpdatesToQueue:withHandler:", v14, v30);

  v16 = self->_deviceOrientationManager;
  -[PLSensorAgent operationQueue](self, "operationQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_2;
  v29[3] = &unk_1E85804C8;
  v29[4] = self;
  -[CMDeviceOrientationManager startDeviceOrientationUpdatesToQueue:withHandler:](v16, "startDeviceOrientationUpdatesToQueue:withHandler:", v17, v29);

  -[CMPocketStateManager setDelegate:](self->_pocketStateManager, "setDelegate:", self);
  v18 = self->_pocketStateManager;
  -[PLOperator workQueue](self, "workQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_3;
  v28[3] = &unk_1E85804F0;
  v28[4] = self;
  -[CMPocketStateManager queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:](v18, "queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:", v19, v28, 0.0, 1.0);

  v20 = self->_brightnessSystemClient;
  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_4;
  v27[3] = &unk_1E857BA78;
  v27[4] = self;
  -[BrightnessSystemClient registerNotificationBlock:forProperties:](v20, "registerNotificationBlock:forProperties:", v27, &unk_1E86523D0);
  IOHIDEventSystemClientSetMatching();
  -[PLOperator workQueue](self, "workQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  IOHIDEventSystemClientScheduleWithDispatchQueue();

  IOHIDEventSystemClientRegisterEventCallback();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("EnableALSProximity"), 1))
  {
    v22 = objc_alloc(MEMORY[0x1E0D80070]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_66;
    v26[3] = &unk_1E8578078;
    v26[4] = self;
    v25 = (void *)objc_msgSend(v22, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v23, 1, 0, v24, v26, 60.0, 0.0);
    -[PLSensorAgent setProximityTimer:](self, "setProximityTimer:", v25);

  }
}

uint64_t __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleMotionActivityManagerNotification:", a2);
}

uint64_t __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleOrientationManagerNotification:", a2);
}

uint64_t __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePocketStateManagerNotification:", a2);
}

uint64_t __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrightnessClientNotification:withValue:", a2, a3);
}

void __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_66(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "stateTracker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getCurrState:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "BOOLValue") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFirstProximityEvent:", 1);
    BKSHIDServicesRequestProximityStatusEvent();
    PLLogSensor();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Requested Proximity Status from BackBoardServices", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "brightnessSystemClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("ActivateALS"));

    PLLogSensor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "Activated CoreBrightness ALS", v7, 2u);
    }

  }
}

- (void)logEventPointALS:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLSensorAgent, "entryKeyForType:andName:", v4, CFSTR("ALS"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointDeviceOrientation:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLSensorAgent, "entryKeyForType:andName:", v4, CFSTR("DeviceOrientation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointActivity:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLSensorAgent, "entryKeyForType:andName:", v4, CFSTR("MotionActivity"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointPocketState:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLSensorAgent, "entryKeyForType:andName:", v4, CFSTR("PocketState"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointProximity:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLSensorAgent, "entryKeyForType:andName:", v4, CFSTR("Proximity"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)handleBrightnessClientNotification:(id)a3 withValue:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  id v15;
  __int128 buf;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(a3, "isEqual:", CFSTR("Lux"));
  if (v6 && v7)
  {
    -[PLSensorAgent stateTracker](self, "stateTracker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getCurrState:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "BOOLValue") & 1) == 0)
    {
      -[PLSensorAgent brightnessSystemClient](self, "brightnessSystemClient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("ActivateALS"));

      if (+[PLSensorAgent shouldLogRearLux](PLSensorAgent, "shouldLogRearLux"))
      {
        v18 = 0;
        *(_QWORD *)&buf = &v21;
        *((_QWORD *)&buf + 1) = &v20;
        v17 = &v22;
        v19 = 0x4E0000001;
        -[PLOperator workQueue](self, "workQueue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        ApplePhotonDetectorServicesGetLux();

      }
      v14 = CFSTR("Lux");
      v15 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSensorAgent logEventPointALS:](self, "logEventPointALS:", v12);

      PLLogSensor();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v6;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "Received ALS event (display-off) Front: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }

}

+ (BOOL)shouldLogRearLux
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0D80020], "isiPhone");
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x1E0D80020], "kPLDeviceClassIsOneOf:", 102040, 102041, 0);
  return v2;
}

- (void)handleOrientationManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLLogSensor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v12 = objc_msgSend(v4, "orientation");
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Device orientation event: %d", buf, 8u);
    }

    if (objc_msgSend(v4, "orientation") == 5)
    {
      v6 = 0;
    }
    else if (objc_msgSend(v4, "orientation") == 6)
    {
      v6 = 1;
    }
    else
    {
      v6 = 2;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6, CFSTR("Orientation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSensorAgent logEventPointDeviceOrientation:](self, "logEventPointDeviceOrientation:", v8);

  }
}

- (void)handleMotionActivityManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLLogSensor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Device activity event: %@", buf, 0xCu);
    }

    if (objc_msgSend(v4, "confidence") >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "stationary", CFSTR("Stationary")));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[1] = CFSTR("Confidence");
      v10[0] = v6;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "confidence"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSensorAgent logEventPointActivity:](self, "logEventPointActivity:", v8);

    }
  }

}

- (void)handlePocketStateManagerNotification:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLLogSensor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v11 = a3;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Pocket state event: %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, CFSTR("State"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSensorAgent logEventPointPocketState:](self, "logEventPointPocketState:", v7);

}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  if (a3)
    -[PLSensorAgent handlePocketStateManagerNotification:](self, "handlePocketStateManagerNotification:", a4);
}

- (BOOL)firstProximityEvent
{
  return self->_firstProximityEvent;
}

- (void)setFirstProximityEvent:(BOOL)a3
{
  self->_firstProximityEvent = a3;
}

- (PLTimer)proximityTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProximityTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLStateTrackingComposition)stateTracker
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BrightnessSystemClient)brightnessSystemClient
{
  return (BrightnessSystemClient *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBrightnessSystemClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CMPocketStateManager)pocketStateManager
{
  return (CMPocketStateManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPocketStateManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CMMotionActivityManager)motionActivityManager
{
  return (CMMotionActivityManager *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMotionActivityManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CMDeviceOrientationManager)deviceOrientationManager
{
  return (CMDeviceOrientationManager *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeviceOrientationManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (__IOHIDEventSystemClient)proximityHIDClient
{
  return self->_proximityHIDClient;
}

- (void)setProximityHIDClient:(__IOHIDEventSystemClient *)a3
{
  self->_proximityHIDClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOrientationManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_proximityTimer, 0);
}

@end
