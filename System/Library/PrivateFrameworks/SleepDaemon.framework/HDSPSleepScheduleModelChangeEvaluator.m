@implementation HDSPSleepScheduleModelChangeEvaluator

- (HDSPSleepScheduleModelChangeEvaluator)initWithEnvironment:(id)a3
{
  id v4;
  HDSPSleepScheduleModelChangeEvaluator *v5;
  HDSPSleepScheduleModelChangeEvaluator *v6;
  HDSPSleepScheduleModelChangeEvaluator *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPSleepScheduleModelChangeEvaluator;
  v5 = -[HDSPSleepScheduleModelChangeEvaluator init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = v6;
  }

  return v6;
}

- (void)_loadPersistedModel
{
  HDSPEnvironment **p_environment;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_environment = &self->_environment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hksp_objectForKey:", CFSTR("HKSPLastSchedule"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v7, "userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hksp_objectForKey:", CFSTR("HKSPLastSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v10, "userDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hksp_objectForKey:", CFSTR("HKSPLastRecord"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v6 || v9 || v12)
  {
    if (v14)
    {
      v20 = 138543362;
      v21 = (id)objc_opt_class();
      v19 = v21;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] restoring previous model", (uint8_t *)&v20, 0xCu);

    }
    -[HDSPSleepScheduleModelChangeEvaluator _restorePersistedModelWithScheduleData:settingsData:recordData:](self, "_restorePersistedModelWithScheduleData:settingsData:recordData:", v6, v9, v12);
  }
  else
  {
    if (v14)
    {
      v20 = 138543362;
      v21 = (id)objc_opt_class();
      v15 = v21;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] no previous model to restore", (uint8_t *)&v20, 0xCu);

    }
    v16 = objc_loadWeakRetained((id *)p_environment);
    objc_msgSend(v16, "sleepScheduleModelManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sleepScheduleModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPSleepScheduleModelChangeEvaluator _persistModel:](self, "_persistModel:", v18);

  }
}

- (void)_restorePersistedModelWithScheduleData:(id)a3 settingsData:(id)a4 recordData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPSleepScheduleModelChangeEvaluator setLastSchedule:](self, "setLastSchedule:", v10);

  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPSleepScheduleModelChangeEvaluator setLastSettings:](self, "setLastSettings:", v11);

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPSleepScheduleModelChangeEvaluator setLastRecord:](self, "setLastRecord:", v12);

  }
}

- (void)_persistModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "sleepSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepScheduleModelChangeEvaluator _persistSchedule:](self, "_persistSchedule:", v5);

  objc_msgSend(v4, "sleepSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepScheduleModelChangeEvaluator _persistSettings:](self, "_persistSettings:", v6);

  objc_msgSend(v4, "sleepEventRecord");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepScheduleModelChangeEvaluator _persistRecord:](self, "_persistRecord:", v7);
}

- (void)_persistSchedule:(id)a3
{
  void *v5;
  void *v6;
  void *WeakRetained;
  void *v8;
  id v9;

  -[HDSPSleepScheduleModelChangeEvaluator setLastSchedule:](self, "setLastSchedule:");
  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDD1618];
    -[HDSPSleepScheduleModelChangeEvaluator lastSchedule](self, "lastSchedule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(WeakRetained, "userDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hksp_setObject:forKey:", v9, CFSTR("HKSPLastSchedule"));

  }
  else
  {
    v9 = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(v9, "userDefaults");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "hksp_removeObjectForKey:", CFSTR("HKSPLastSchedule"));
  }

}

- (void)_persistSettings:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;

  -[HDSPSleepScheduleModelChangeEvaluator setLastSettings:](self, "setLastSettings:", a3);
  v4 = (void *)MEMORY[0x24BDD1618];
  -[HDSPSleepScheduleModelChangeEvaluator lastSettings](self, "lastSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hksp_setObject:forKey:", v8, CFSTR("HKSPLastSettings"));

}

- (void)_persistRecord:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;

  -[HDSPSleepScheduleModelChangeEvaluator setLastRecord:](self, "setLastRecord:", a3);
  v4 = (void *)MEMORY[0x24BDD1618];
  -[HDSPSleepScheduleModelChangeEvaluator lastRecord](self, "lastRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hksp_setObject:forKey:", v8, CFSTR("HKSPLastRecord"));

}

- (id)evaluateSleepScheduleAdd:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule added", (uint8_t *)&v11, 0xCu);

  }
  -[HDSPSleepScheduleModelChangeEvaluator _persistSchedule:](self, "_persistSchedule:", v4);

  HKSPSleepScheduleProperties();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSPSleepScheduleModelChangeEvaluation significantChangeWithTopLevelChangeKeys:](HDSPSleepScheduleModelChangeEvaluation, "significantChangeWithTopLevelChangeKeys:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)evaluateSleepScheduleUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  HDSPSleepScheduleModelChangeEvaluation *v12;
  void *v13;
  HDSPSleepScheduleModelChangeEvaluation *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[HDSPSleepScheduleModelChangeEvaluator lastSchedule](self, "lastSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = objc_msgSend(v5, "_evaluateChangesFromObject:toObject:outChangeSet:", v6, v4, &v16);
  v8 = v16;

  -[HDSPSleepScheduleModelChangeEvaluator _persistSchedule:](self, "_persistSchedule:", v4);
  if (v7 == 2)
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      v11 = v10;
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule changes were significant", buf, 0xCu);

    }
  }
  v12 = [HDSPSleepScheduleModelChangeEvaluation alloc];
  objc_msgSend(v8, "topLevelChangeKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDSPSleepScheduleModelChangeEvaluation initWithIsSignificantChange:topLevelChangeKeys:](v12, "initWithIsSignificantChange:topLevelChangeKeys:", v7 == 2, v13);

  return v14;
}

- (id)evaluateSleepScheduleRemove
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v4 = v10;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule removed", (uint8_t *)&v9, 0xCu);

  }
  -[HDSPSleepScheduleModelChangeEvaluator _persistSchedule:](self, "_persistSchedule:", 0);
  HKSPSleepScheduleProperties();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSPSleepScheduleModelChangeEvaluation significantChangeWithTopLevelChangeKeys:](HDSPSleepScheduleModelChangeEvaluation, "significantChangeWithTopLevelChangeKeys:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)evaluateSleepSettingsAdd:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep settings added", (uint8_t *)&v11, 0xCu);

  }
  -[HDSPSleepScheduleModelChangeEvaluator _persistSettings:](self, "_persistSettings:", v4);

  HKSPSleepSettingsProperties();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSPSleepScheduleModelChangeEvaluation significantChangeWithTopLevelChangeKeys:](HDSPSleepScheduleModelChangeEvaluation, "significantChangeWithTopLevelChangeKeys:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)evaluateSleepSettingsUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  HDSPSleepScheduleModelChangeEvaluation *v12;
  void *v13;
  HDSPSleepScheduleModelChangeEvaluation *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[HDSPSleepScheduleModelChangeEvaluator lastSettings](self, "lastSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = objc_msgSend(v5, "_evaluateChangesFromObject:toObject:outChangeSet:", v6, v4, &v16);
  v8 = v16;

  -[HDSPSleepScheduleModelChangeEvaluator _persistSettings:](self, "_persistSettings:", v4);
  if (v7 == 2)
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      v11 = v10;
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep settings changes were significant", buf, 0xCu);

    }
  }
  v12 = [HDSPSleepScheduleModelChangeEvaluation alloc];
  objc_msgSend(v8, "topLevelChangeKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDSPSleepScheduleModelChangeEvaluation initWithIsSignificantChange:topLevelChangeKeys:](v12, "initWithIsSignificantChange:topLevelChangeKeys:", v7 == 2, v13);

  return v14;
}

- (id)evaluateSleepRecordAdd:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  HDSPSleepScheduleModelChangeEvaluation *v7;
  void *v8;
  void *v9;
  HDSPSleepScheduleModelChangeEvaluation *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v6 = v13;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep record added", (uint8_t *)&v12, 0xCu);

  }
  -[HDSPSleepScheduleModelChangeEvaluator _persistRecord:](self, "_persistRecord:", v4);

  v7 = [HDSPSleepScheduleModelChangeEvaluation alloc];
  HKSPSleepEventRecordProperties();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDSPSleepScheduleModelChangeEvaluation initWithIsSignificantChange:topLevelChangeKeys:](v7, "initWithIsSignificantChange:topLevelChangeKeys:", 1, v9);

  return v10;
}

- (id)evaluateSleepRecordUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  HDSPSleepScheduleModelChangeEvaluation *v12;
  void *v13;
  HDSPSleepScheduleModelChangeEvaluation *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[HDSPSleepScheduleModelChangeEvaluator lastRecord](self, "lastRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = objc_msgSend(v5, "_evaluateChangesFromObject:toObject:outChangeSet:", v6, v4, &v16);
  v8 = v16;

  -[HDSPSleepScheduleModelChangeEvaluator _persistRecord:](self, "_persistRecord:", v4);
  if (v7 == 2)
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      v11 = v10;
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep record changes were significant", buf, 0xCu);

    }
  }
  v12 = [HDSPSleepScheduleModelChangeEvaluation alloc];
  objc_msgSend(v8, "topLevelChangeKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDSPSleepScheduleModelChangeEvaluation initWithIsSignificantChange:topLevelChangeKeys:](v12, "initWithIsSignificantChange:topLevelChangeKeys:", v7 == 2, v13);

  return v14;
}

- (id)evaluateSleepScheduleModelChange:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "sleepSchedule");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[HDSPSleepScheduleModelChangeEvaluator lastSchedule](self, "lastSchedule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v4, "sleepSchedule");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSleepScheduleModelChangeEvaluator evaluateSleepScheduleAdd:](self, "evaluateSleepScheduleAdd:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  objc_msgSend(v4, "sleepSchedule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    -[HDSPSleepScheduleModelChangeEvaluator lastSchedule](self, "lastSchedule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HDSPSleepScheduleModelChangeEvaluator evaluateSleepScheduleRemove](self, "evaluateSleepScheduleRemove");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);
LABEL_12:

      goto LABEL_13;
    }
  }
  objc_msgSend(v4, "sleepSchedule");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[HDSPSleepScheduleModelChangeEvaluator lastSchedule](self, "lastSchedule");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "sleepSchedule");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSleepScheduleModelChangeEvaluator evaluateSleepScheduleUpdate:](self, "evaluateSleepScheduleUpdate:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v16 = (void *)v14;
      objc_msgSend(v5, "addObject:", v14);

      goto LABEL_12;
    }
  }
LABEL_13:
  objc_msgSend(v4, "sleepSettings");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[HDSPSleepScheduleModelChangeEvaluator lastSettings](self, "lastSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v4, "sleepSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSleepScheduleModelChangeEvaluator evaluateSleepSettingsAdd:](self, "evaluateSleepSettingsAdd:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  objc_msgSend(v4, "sleepSettings");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[HDSPSleepScheduleModelChangeEvaluator lastSettings](self, "lastSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "sleepSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSleepScheduleModelChangeEvaluator evaluateSleepSettingsUpdate:](self, "evaluateSleepSettingsUpdate:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_19:
      v25 = (void *)v24;
      objc_msgSend(v5, "addObject:", v24);

    }
  }
  objc_msgSend(v4, "sleepEventRecord");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[HDSPSleepScheduleModelChangeEvaluator lastRecord](self, "lastRecord");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      objc_msgSend(v4, "sleepEventRecord");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSleepScheduleModelChangeEvaluator evaluateSleepRecordAdd:](self, "evaluateSleepRecordAdd:", v32);
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
  }
  objc_msgSend(v4, "sleepEventRecord");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[HDSPSleepScheduleModelChangeEvaluator lastRecord](self, "lastRecord");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v4, "sleepEventRecord");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSleepScheduleModelChangeEvaluator evaluateSleepRecordUpdate:](self, "evaluateSleepRecordUpdate:", v32);
      v33 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      v34 = (void *)v33;
      objc_msgSend(v5, "addObject:", v33);

    }
  }
  +[HDSPSleepScheduleModelChangeEvaluation combinedEvaluation:](HDSPSleepScheduleModelChangeEvaluation, "combinedEvaluation:", v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

+ (unint64_t)_evaluateChangesFromObject:(id)a3 toObject:(id)a4 outChangeSet:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  v6 = a3;
  HKSPGenerateChangeSetBetweenObjects();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a5)
    *a5 = objc_retainAutorelease(v7);
  objc_msgSend(v8, "changes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = (void *)objc_msgSend(v6, "mutableCopy");
    HKSPApplyChangesToObject();
    v12 = HKSPEvaluateChangesToObject();

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HKSPSleepSchedule)lastSchedule
{
  return self->_lastSchedule;
}

- (void)setLastSchedule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKSPSleepSettings)lastSettings
{
  return self->_lastSettings;
}

- (void)setLastSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HKSPSleepEventRecord)lastRecord
{
  return self->_lastRecord;
}

- (void)setLastRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRecord, 0);
  objc_storeStrong((id *)&self->_lastSettings, 0);
  objc_storeStrong((id *)&self->_lastSchedule, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
