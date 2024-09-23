@implementation REDeviceMotionPredictor

+ (id)supportedFeatures
{
  REFeatureSet *v2;
  void *v3;
  void *v4;
  void *v5;
  REFeatureSet *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = [REFeatureSet alloc];
  +[REFeature isStationaryFeature](REFeature, "isStationaryFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[REFeature deviceMotionFeature](REFeature, "deviceMotionFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REFeatureSet initWithFeatures:](v2, "initWithFeatures:", v5);

  return v6;
}

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  objc_super v21[2];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21[0].receiver = self;
  v21[0].super_class = (Class)REDeviceMotionPredictor;
  v2 = -[objc_super _init](v21, sel__init);
  if (v2)
  {
    if (!CoreMotionLibraryCore_frameworkLibrary)
    {
      v21[1] = (objc_super)xmmword_24CF90C00;
      v22 = 0;
      CoreMotionLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (!CoreMotionLibraryCore_frameworkLibrary
      || !objc_msgSend(getCMMotionActivityManagerClass(), "isActivityAvailable"))
    {
      RELogForDomain(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[REDeviceMotionPredictor _init].cold.1(v5, v13, v14, v15, v16, v17, v18, v19);
      goto LABEL_11;
    }
    getCMMotionActivityManagerClass();
    v3 = objc_opt_new();
    v4 = (void *)v2[8];
    v2[8] = v3;

    if (objc_msgSend(getCMMotionActivityManagerClass(), "authorizationStatus") != 3)
    {
      RELogForDomain(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[REDeviceMotionPredictor _init].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_11:

    }
  }
  return v2;
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;

  v7 = a3;
  +[REFeature isStationaryFeature](REFeature, "isStationaryFeature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", -[REDeviceMotionPredictor isStationary](self, "isStationary"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[REFeature deviceMotionFeature](REFeature, "deviceMotionFeature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "isEqual:", v11);

    if (!v12)
    {
      v13 = 0;
      goto LABEL_7;
    }
    +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", -[REDeviceMotionPredictor motionType](self, "motionType"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;
LABEL_7:

  return v13;
}

- (void)resume
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  REUpNextScheduler *v7;
  REUpNextScheduler *scheduler;
  CMMotionActivityManager *activityManager;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = objc_alloc_init(MEMORY[0x24BDD1710]);
  -[REPredictor queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUnderlyingQueue:", v4);

  objc_initWeak(&location, self);
  -[REPredictor queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __33__REDeviceMotionPredictor_resume__block_invoke;
  v12[3] = &unk_24CF8AAC8;
  objc_copyWeak(&v13, &location);
  +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v5, v12, 300.0);
  v7 = (REUpNextScheduler *)objc_claimAutoreleasedReturnValue();
  scheduler = self->_scheduler;
  self->_scheduler = v7;

  activityManager = self->_activityManager;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __33__REDeviceMotionPredictor_resume__block_invoke_2;
  v10[3] = &unk_24CF90BE0;
  objc_copyWeak(&v11, &location);
  -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](activityManager, "startActivityUpdatesToQueue:withHandler:", v3, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __33__REDeviceMotionPredictor_resume__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateWithActivity:", WeakRetained[10]);
    WeakRetained = v2;
  }

}

void __33__REDeviceMotionPredictor_resume__block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 10, a2);
    objc_msgSend(v5[9], "schedule");
  }

}

- (void)pause
{
  REUpNextScheduler *scheduler;

  -[CMMotionActivityManager stopActivityUpdates](self->_activityManager, "stopActivityUpdates");
  scheduler = self->_scheduler;
  self->_scheduler = 0;

}

- (void)_updateWithActivity:(id)a3
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  id v7;

  v7 = a3;
  v4 = -[REDeviceMotionPredictor isStationary](self, "isStationary");
  -[REDeviceMotionPredictor setStationary:](self, "setStationary:", objc_msgSend(v7, "stationary"));
  if ((objc_msgSend(v7, "walking") & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v7, "running") & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v7, "automotive") & 1) != 0)
  {
    v5 = 4;
  }
  else if ((objc_msgSend(v7, "cycling") & 1) != 0)
  {
    v5 = 8;
  }
  else
  {
    objc_msgSend(v7, "unknown");
    v5 = 0;
  }
  v6 = -[REDeviceMotionPredictor motionType](self, "motionType");
  -[REDeviceMotionPredictor setMotionType:](self, "setMotionType:", v5);
  if (v4 != objc_msgSend(v7, "stationary") || v6 != v5)
    -[REPredictor updateObservers](self, "updateObservers");

}

- (CMMotionActivityManager)activityManager
{
  return self->_activityManager;
}

- (BOOL)isStationary
{
  return self->_stationary;
}

- (void)setStationary:(BOOL)a3
{
  self->_stationary = a3;
}

- (unint64_t)motionType
{
  return self->_motionType;
}

- (void)setMotionType:(unint64_t)a3
{
  self->_motionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivity, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

- (void)_init
{
  OUTLINED_FUNCTION_0_0(&dword_2132F7000, a1, a3, "Process not entitled for CoreMoiton data", a5, a6, a7, a8, 0);
}

@end
