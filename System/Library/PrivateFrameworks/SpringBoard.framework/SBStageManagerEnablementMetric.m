@implementation SBStageManagerEnablementMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v6 = a4;
  v7 = v6;
  if (a3 == 11)
  {
    v10 = 0;
  }
  else
  {
    if (a3 != 60)
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "eventPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DABED0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

  }
  -[SBStageManagerEnablementMetric sendCoreAnalyticsEventWithName:source:](self, "sendCoreAnalyticsEventWithName:source:", CFSTR("com.apple.SpringBoard.StageManager"), v10);
  v11 = 1;
LABEL_7:

  return v11;
}

- (SBStageManagerEnablementMetric)initWithAnalyticsClient:(id)a3
{
  id v5;
  SBStageManagerEnablementMetric *v6;
  SBStageManagerEnablementMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBStageManagerEnablementMetric;
  v6 = -[SBStageManagerEnablementMetric init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_analyticsClient, a3);

  return v7;
}

- (SBStageManagerEnablementMetric)init
{
  void *v3;
  SBStageManagerEnablementMetric *v4;

  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBStageManagerEnablementMetric initWithAnalyticsClient:](self, "initWithAnalyticsClient:", v3);

  return v4;
}

- (id)chamoisPreferencesSnapshotWithSource:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appSwitcherDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "chamoisWindowingEnabled");
  v7 = objc_msgSend(v5, "chamoisHideStrips");
  v8 = objc_msgSend(v5, "chamoisHideDock");
  v9 = objc_msgSend(v5, "chamoisHideStripsExternal");
  v10 = objc_msgSend(v5, "chamoisHideDockExternal");
  v19[0] = CFSTR("StageManagerEnablement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v19[1] = CFSTR("EmbeddedStripHidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  v19[2] = CFSTR("EmbeddedDockHidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v13;
  v19[3] = CFSTR("ExternalStripHidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v14;
  v19[4] = CFSTR("ExternalDockHidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v15;
  v19[5] = CFSTR("StageManagerPreferenceChangingSource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 source:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  const __CFString *v11;
  NSObject *v12;
  id v14;

  v6 = a3;
  -[SBStageManagerEnablementMetric chamoisPreferencesSnapshotWithSource:](self, "chamoisPreferencesSnapshotWithSource:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v14 = v7;
    v9 = AnalyticsSendEventLazy();

    if ((v9 & 1) != 0)
    {
      v10 = 1;
      goto LABEL_9;
    }
    v11 = CFSTR("CoreAnalytics sending failed");
  }
  else
  {
    v11 = CFSTR("Missing payload");
  }
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[SBStageManagerEnablementMetric sendCoreAnalyticsEventWithName:source:].cold.1((uint64_t)v11, v12);

  v10 = 0;
LABEL_9:

  return v10;
}

id __72__SBStageManagerEnablementMetric_sendCoreAnalyticsEventWithName_source___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (SBFAnalyticsClient)analyticsClient
{
  return self->_analyticsClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsClient, 0);
}

- (void)sendCoreAnalyticsEventWithName:(uint64_t)a1 source:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Failed to log Stage Manager preferences with reason: %@.", (uint8_t *)&v2, 0xCu);
}

@end
