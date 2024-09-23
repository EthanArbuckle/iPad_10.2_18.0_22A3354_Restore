@implementation STYUserScenario

- (STYUserScenario)initWithLifecycleScenarioCategoryAndModelName:(id)a3 modelName:(id)a4 titleText:(id)a5
{
  id v9;
  id v10;
  id v11;
  STYUserScenario *v12;
  STYUserScenario *v13;
  uint64_t v14;
  NSString *scenarioID;
  STYUserScenario *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)STYUserScenario;
  v12 = -[STYUserScenario init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_scenarioGroup, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v10, v9);
    v14 = objc_claimAutoreleasedReturnValue();
    scenarioID = v13->_scenarioID;
    v13->_scenarioID = (NSString *)v14;

    objc_storeStrong((id *)&v13->_titleText, a5);
    v13->_kpi = -1000;
    v16 = v13;
  }

  return v13;
}

- (STYUserScenario)initWithConfiguration:(id)a3 scenarioGroup:(id)a4 kpi:(int64_t)a5 processBundleID:(id)a6 titleText:(id)a7 processName:(id)a8 processID:(int)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  STYUserScenario *v19;
  STYUserScenario *v20;
  STYUserScenario *v21;
  id v24;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v24 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)STYUserScenario;
  v19 = -[STYUserScenario init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_scenarioID, a3);
    objc_storeStrong((id *)&v20->_scenarioGroup, a4);
    v20->_kpi = a5;
    objc_storeStrong((id *)&v20->_titleText, a7);
    objc_storeStrong((id *)&v20->_appBundleId, a6);
    objc_storeStrong((id *)&v20->_appName, a8);
    v20->_appProcessID = a9;
    v21 = v20;
  }

  return v20;
}

+ (id)scenarioFromSignpostEvent:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[STYUserScenarioCache sharedCache](STYUserScenarioCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scenarioFromSignpostEvent:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)scenarioFromSignpostInterval:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[STYUserScenarioCache sharedCache](STYUserScenarioCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scenarioFromSignpostInterval:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)scenarioGroup
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)scenarioID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)kpi
{
  return self->_kpi;
}

- (NSString)titleText
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)appBundleId
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (int)appProcessID
{
  return self->_appProcessID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_scenarioID, 0);
  objc_storeStrong((id *)&self->_scenarioGroup, 0);
}

@end
