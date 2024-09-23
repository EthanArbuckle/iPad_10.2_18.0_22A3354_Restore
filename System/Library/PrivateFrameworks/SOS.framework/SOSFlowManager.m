@implementation SOSFlowManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SOSFlowManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sSOSFlowManager;
}

void __32__SOSFlowManager_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedInstance_sSOSFlowManager;
  sharedInstance_sSOSFlowManager = v1;

}

- (SOSFlowManager)init
{
  SOSFlowManager *v3;

  +[SOSFlowManager sharedInstance](SOSFlowManager, "sharedInstance");
  v3 = (SOSFlowManager *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_init
{
  SOSFlowManager *v2;
  NSObject *v3;
  HKHealthStore *v4;
  HKHealthStore *healthStore;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SOSFlowManager;
  v2 = -[SOSFlowManager init](&v8, sel_init);
  if (v2)
  {
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSFlowManager, init", v7, 2u);
    }

    v4 = (HKHealthStore *)objc_alloc_init(MEMORY[0x1E0CB6780]);
    healthStore = v2->_healthStore;
    v2->_healthStore = v4;

    -[HKHealthStore setDebugIdentifier:](v2->_healthStore, "setDebugIdentifier:", CFSTR("com.apple.sos"));
    -[HKHealthStore resume](v2->_healthStore, "resume");
  }
  return v2;
}

- (void)kappaWasRequested
{
  id v2;

  -[SOSFlowManager activeSOSFlow](self, "activeSOSFlow");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleSOSFlowEvent:withMetaData:", 12, 0);

}

- (void)emergencyCallInitiated
{
  id v2;

  -[SOSFlowManager activeSOSFlow](self, "activeSOSFlow");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleSOSFlowEvent:withMetaData:", 13, 0);

}

- (void)startSOSFlowWithTriggerMechanism:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    SOSStringForSOSTriggerMechanism(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[SOSFlowManager startSOSFlowWithTriggerMechanism:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "%s: Starting SOSFlow with trigger: %@", (uint8_t *)&v7, 0x16u);

  }
  -[SOSFlowManager startFreshSOSFlowWithTriggerMechanism:](self, "startFreshSOSFlowWithTriggerMechanism:", a3);
}

- (void)startFreshSOSFlowWithTriggerMechanism:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  SOSFlow *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[SOSFlowManager startFreshSOSFlowWithTriggerMechanism:]";
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "%s: Starting a fresh SOSFlow", (uint8_t *)&v15, 0xCu);
  }

  -[SOSFlowManager activeSOSFlow](self, "activeSOSFlow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SOSFlowManager activeSOSFlow](self, "activeSOSFlow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", self);

  }
  v8 = -[SOSFlow initWithTriggerMechanism:healthStore:]([SOSFlow alloc], "initWithTriggerMechanism:healthStore:", a3, self->_healthStore);
  -[SOSFlowManager setActiveSOSFlow:](self, "setActiveSOSFlow:", v8);

  -[SOSFlowManager activeSOSFlow](self, "activeSOSFlow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

  v10 = (void *)MEMORY[0x1E0C99D80];
  -[SOSFlowManager activeSOSFlow](self, "activeSOSFlow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObject:forKey:", v11, CFSTR("activeSOSFlow"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("SOSFlowWillStartNotification"), 0, v12);

  -[SOSFlowManager activeSOSFlow](self, "activeSOSFlow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleSOSFlowEvent:withMetaData:", 0, 0);

}

- (void)sosFlow:(id)a3 didChangeToState:(int64_t)a4
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (+[SOSFlow isTerminalState:](SOSFlow, "isTerminalState:", a4))
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[SOSFlowManager sosFlow:didChangeToState:]";
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "%s: SOSFlow reached terminal state, tearing down", (uint8_t *)&v7, 0xCu);
    }

    -[SOSFlowManager activeSOSFlow](self, "activeSOSFlow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

    -[SOSFlowManager setActiveSOSFlow:](self, "setActiveSOSFlow:", 0);
  }
}

- (SOSFlow)activeSOSFlow
{
  return self->_activeSOSFlow;
}

- (void)setActiveSOSFlow:(id)a3
{
  objc_storeStrong((id *)&self->_activeSOSFlow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSOSFlow, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
