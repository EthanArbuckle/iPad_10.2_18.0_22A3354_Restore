@implementation STYUserScenarioCache

- (id)bundleIdForProcessName:(id)a3
{
  NSDictionary *bundleIdForAppName;
  id v5;
  void *v6;
  void *v7;

  bundleIdForAppName = self->_bundleIdForAppName;
  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](bundleIdForAppName, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[NSDictionary objectForKeyedSubscript:](self->_bundleIdForAppName, "objectForKeyedSubscript:", v5);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleId For %@ not available"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)scenarioIdForSignpostInterval:(id)a3
{
  NSDictionary *bundleIdForAppName;
  id v4;
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

  bundleIdForAppName = self->_bundleIdForAppName;
  v4 = a3;
  objc_msgSend(v4, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](bundleIdForAppName, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  if (v7)
  {
    objc_msgSend(v4, "subsystem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "category");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@-%@-%@"), v7, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "endEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subsystem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "category");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@-%@-%@"), v10, v11, v13, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)scenarioIdForSignpostEmittedEvent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subsystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%@-%@"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (STYUserScenarioCache)initWithPlatform:(id)a3
{
  id v4;
  STYUserScenarioCache *v5;
  uint64_t v6;
  NSString *hwModel;
  uint64_t v8;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSError *bundledIdLookupFailedrror;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSError *badConfigError;
  STYUserScenarioCache *v38;
  void *v40;
  objc_super v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)STYUserScenarioCache;
  v5 = -[STYUserScenarioCache init](&v41, sel_init);
  if (v5)
  {
    +[STYDeviceInfo hardwareModel](STYDeviceInfo, "hardwareModel");
    v6 = objc_claimAutoreleasedReturnValue();
    hwModel = v5->_hwModel;
    v5->_hwModel = (NSString *)v6;

    -[NSString stringByReplacingOccurrencesOfString:withString:](v5->_hwModel, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v5->_hwModel;
    v5->_hwModel = (NSString *)v8;

    -[NSString stringByReplacingOccurrencesOfString:withString:](v5->_hwModel, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), CFSTR("_"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v5->_hwModel;
    v5->_hwModel = (NSString *)v10;

    v12 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = objc_claimAutoreleasedReturnValue();
    +[STYUserScenarioCache internalResourceBundle](STYUserScenarioCache, "internalResourceBundle");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
    {
      v47[0] = v14;
      v47[1] = v13;
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = v47;
      v18 = 2;
    }
    else
    {
      v46 = v13;
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = &v46;
      v18 = 1;
    }
    objc_msgSend(v16, "arrayWithObjects:count:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)v13;
    v20 = 0x1E0CB3000uLL;
    v21 = 0x1E0C99000uLL;
    if (-[STYUserScenarioCache setupWhitelistedScenarios:bundles:](v5, "setupWhitelistedScenarios:bundles:", v4, v19))
    {
      -[STYUserScenarioCache setupBundleIdWhitelists:bundles:](v5, "setupBundleIdWhitelists:bundles:", v4, v19);
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = STYUserScenarioErrorDomain;
      v24 = *MEMORY[0x1E0CB2D50];
      v44 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Failed to retrieve bundle id for signpost event"), &stru_1E86A0F60, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v22;
      v20 = 0x1E0CB3000;
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v23, -2008, v27);
      v29 = objc_claimAutoreleasedReturnValue();
      bundledIdLookupFailedrror = v5->_bundledIdLookupFailedrror;
      v5->_bundledIdLookupFailedrror = (NSError *)v29;

      v21 = 0x1E0C99000;
      v12 = 0x1E0CB3000;
    }
    else
    {
      v24 = *MEMORY[0x1E0CB2D50];
    }
    v31 = *(void **)(v20 + 1480);
    v32 = STYUserScenarioErrorDomain;
    v42 = v24;
    objc_msgSend(*(id *)(v12 + 1232), "mainBundle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Framework is not Configured properly. Please file a bug against Sentry | Framework"), &stru_1E86A0F60, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v34;
    objc_msgSend(*(id *)(v21 + 3456), "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, -2007, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    badConfigError = v5->_badConfigError;
    v5->_badConfigError = (NSError *)v36;

    v38 = v5;
  }

  return v5;
}

+ (id)internalResourceBundle
{
  return 0;
}

- (BOOL)setupWhitelistedScenarios:(id)a3 bundles:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a4;
  v7 = a3;
  v8 = -[STYUserScenarioCache setupWhitelistedResponsivenessScenarios:bundles:](self, "setupWhitelistedResponsivenessScenarios:bundles:", v7, v6);
  LOBYTE(self) = -[STYUserScenarioCache setupWhitelistedAnimationScenarios:bundles:](self, "setupWhitelistedAnimationScenarios:bundles:", v7, v6);

  return v8 | self;
}

- (id)loadWhitelist:(id)a3 platform:(id)a4 bundles:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "pathForResource:ofType:", v8, CFSTR("plist"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v17 = v9;
          goto LABEL_13;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logHandle");
  v17 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[STYUserScenarioCache loadWhitelist:platform:bundles:].cold.1();
  v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)setupWhitelistedResponsivenessScenarios:(id)a3 bundles:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  NSDictionary *responsivenessConfigForWhitelistedSubsystems;
  NSDictionary *v10;
  NSDictionary *responsivenessConfigForWhitelistedCategories;
  NSDictionary *v12;
  NSDictionary *responsivenessConfigForWhitelistedNames;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  -[STYUserScenarioCache loadWhitelist:platform:bundles:](self, "loadWhitelist:platform:bundles:", CFSTR("STYWhitelistedSubsystems-Responsiveness"), v6, v7);
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  responsivenessConfigForWhitelistedSubsystems = self->_responsivenessConfigForWhitelistedSubsystems;
  self->_responsivenessConfigForWhitelistedSubsystems = v8;

  if (self->_responsivenessConfigForWhitelistedSubsystems
    && (-[STYUserScenarioCache loadWhitelist:platform:bundles:](self, "loadWhitelist:platform:bundles:", CFSTR("STYWhitelistedCategories-Responsiveness"), v6, v7), v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue(), responsivenessConfigForWhitelistedCategories = self->_responsivenessConfigForWhitelistedCategories, self->_responsivenessConfigForWhitelistedCategories = v10, responsivenessConfigForWhitelistedCategories, self->_responsivenessConfigForWhitelistedCategories))
  {
    -[STYUserScenarioCache loadWhitelist:platform:bundles:](self, "loadWhitelist:platform:bundles:", CFSTR("STYWhitelistedNames-Responsiveness"), v6, v7);
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    responsivenessConfigForWhitelistedNames = self->_responsivenessConfigForWhitelistedNames;
    self->_responsivenessConfigForWhitelistedNames = v12;

    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)setupWhitelistedAnimationScenarios:(id)a3 bundles:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  NSDictionary *animationConfigForWhitelistedSubsystems;
  NSDictionary *v10;
  NSDictionary *animationConfigForWhitelistedCategories;
  NSDictionary *v12;
  NSDictionary *animationConfigForWhitelistedNames;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  -[STYUserScenarioCache loadWhitelist:platform:bundles:](self, "loadWhitelist:platform:bundles:", CFSTR("STYWhitelistedSubsystems-Animation"), v6, v7);
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  animationConfigForWhitelistedSubsystems = self->_animationConfigForWhitelistedSubsystems;
  self->_animationConfigForWhitelistedSubsystems = v8;

  if (self->_animationConfigForWhitelistedSubsystems
    && (-[STYUserScenarioCache loadWhitelist:platform:bundles:](self, "loadWhitelist:platform:bundles:", CFSTR("STYWhitelistedCategories-Animation"), v6, v7), v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue(), animationConfigForWhitelistedCategories = self->_animationConfigForWhitelistedCategories, self->_animationConfigForWhitelistedCategories = v10, animationConfigForWhitelistedCategories, self->_animationConfigForWhitelistedCategories))
  {
    -[STYUserScenarioCache loadWhitelist:platform:bundles:](self, "loadWhitelist:platform:bundles:", CFSTR("STYWhitelistedNames-Animation"), v6, v7);
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    animationConfigForWhitelistedNames = self->_animationConfigForWhitelistedNames;
    self->_animationConfigForWhitelistedNames = v12;

    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)setupBundleIdWhitelists:(id)a3 bundles:(id)a4
{
  void *v5;
  void *v6;

  -[STYUserScenarioCache loadWhitelist:platform:bundles:](self, "loadWhitelist:platform:bundles:", CFSTR("STYWhitelistedBundleIds"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bundleIdForAppName, v5);
    v5 = v6;
  }

}

- (float)latencyGoalsForSignpostInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDictionary *responsivenessConfigForWhitelistedSubsystems;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  float v17;
  float v18;

  v4 = a3;
  objc_msgSend(v4, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  responsivenessConfigForWhitelistedSubsystems = self->_responsivenessConfigForWhitelistedSubsystems;
  objc_msgSend(v4, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](responsivenessConfigForWhitelistedSubsystems, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_responsivenessConfigForWhitelistedCategories, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("kSTYLatencyThresholdInMs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_responsivenessConfigForWhitelistedCategories, "objectForKeyedSubscript:", v5);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_responsivenessConfigForWhitelistedNames, "objectForKeyedSubscript:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("kSTYLatencyThresholdInMs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_responsivenessConfigForWhitelistedNames, "objectForKeyedSubscript:", v6);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v15;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kSTYLatencyThresholdInMs"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;

  return v18;
}

- (id)issueCategoryForSignpostInterval:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_responsivenessConfigForWhitelistedNames, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("issueCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (float)framerateGoalsForSignpostInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDictionary *animationConfigForWhitelistedSubsystems;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  float v17;
  float v18;

  v4 = a3;
  objc_msgSend(v4, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  animationConfigForWhitelistedSubsystems = self->_animationConfigForWhitelistedSubsystems;
  objc_msgSend(v4, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](animationConfigForWhitelistedSubsystems, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_animationConfigForWhitelistedCategories, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("kSTYFrameRateThreshold"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_animationConfigForWhitelistedCategories, "objectForKeyedSubscript:", v5);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_animationConfigForWhitelistedCategories, "objectForKeyedSubscript:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("kSTYFrameRateThreshold"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_animationConfigForWhitelistedNames, "objectForKeyedSubscript:", v6);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v15;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kSTYFrameRateThreshold"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;

  return v18;
}

- (BOOL)isResponsivenessScenarioWhitelisted:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSDictionary allKeys](self->_responsivenessConfigForWhitelistedSubsystems, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (!v9)
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logHandle");
    v20 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[STYUserScenarioCache isResponsivenessScenarioWhitelisted:error:].cold.3(v6);
    goto LABEL_16;
  }
  -[NSDictionary allKeys](self->_responsivenessConfigForWhitelistedCategories, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if (!v12)
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "logHandle");
    v20 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[STYUserScenarioCache isResponsivenessScenarioWhitelisted:error:].cold.2(v6);
    goto LABEL_16;
  }
  -[NSDictionary allKeys](self->_responsivenessConfigForWhitelistedNames, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if ((v15 & 1) == 0)
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "logHandle");
    v20 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[STYUserScenarioCache isResponsivenessScenarioWhitelisted:error:].cold.1(v6);
    goto LABEL_16;
  }
  objc_msgSend(v6, "subsystem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.app_launch_measurement")) & 1) == 0)
    goto LABEL_22;
  objc_msgSend(v6, "category");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ApplicationLaunch")) & 1) == 0)
  {

LABEL_22:
    goto LABEL_23;
  }
  objc_msgSend(v6, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("ApplicationLaunchExtendedResponsive"));

  if (!v19)
  {
LABEL_23:
    v34 = 1;
    goto LABEL_20;
  }
  objc_msgSend(v6, "number1Name");
  v20 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject isEqualToString:](v20, "isEqualToString:", CFSTR("IsForeground")) & 1) == 0)
  {
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v6, "number1Value");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqual:", MEMORY[0x1E0C9AAB0]);

  if ((v22 & 1) != 0)
    goto LABEL_23;
LABEL_17:
  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "subsystem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "category");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("scenario %@.%@.%@ is not whitelisted"), v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", v30, &stru_1E86A0F60, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", STYUserScenarioErrorDomain, -2000, v33);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v34 = 0;
LABEL_20:

  return v34;
}

- (BOOL)isAnimationScenarioWhitelisted:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSDictionary allKeys](self->_animationConfigForWhitelistedSubsystems, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (!v9)
    goto LABEL_5;
  -[NSDictionary allKeys](self->_animationConfigForWhitelistedCategories, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if (!v12)
    goto LABEL_5;
  -[NSDictionary allKeys](self->_animationConfigForWhitelistedNames, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if ((v15 & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
LABEL_5:
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "subsystem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "category");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("scenario %@.%@.%@ is not whitelisted"), v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", v21, &stru_1E86A0F60, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", STYUserScenarioErrorDomain, -2000, v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v16 = 0;
  }

  return v16;
}

- (BOOL)scenarioWhitelisted:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  BOOL v10;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v6, "subsystem"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.SpringBoard")),
        v7,
        (v8 & 1) == 0))
  {
    v9 = -[STYUserScenarioCache isAnimationScenarioWhitelisted:error:](self, "isAnimationScenarioWhitelisted:error:", v6, a4);
  }
  else
  {
    v9 = -[STYUserScenarioCache isResponsivenessScenarioWhitelisted:error:](self, "isResponsivenessScenarioWhitelisted:error:", v6, a4);
  }
  v10 = v9;

  return v10;
}

- (id)appNameFromBundleId:(id)a3
{
  id v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_bundleIdForAppName;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_bundleIdForAppName, "objectForKeyedSubscript:", v10, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v13 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)processWhitelisted:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)processBundleIdForSignpostInterval:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSDictionary *bundleIdForAppName;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "scope")
    && (objc_msgSend(v4, "subsystem"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.hangtracer.signposts")),
        v5,
        !v6))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    bundleIdForAppName = self->_bundleIdForAppName;
    objc_msgSend(v4, "endEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](bundleIdForAppName, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "string1Value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (int)processIdForSignpostEvent:(id)a3
{
  return objc_msgSend(a3, "processID");
}

- (id)scenarioGroupForSignpostInterval:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@.%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)kpiIsLatency:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "subsystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.SpringBoard"));

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)scenarioFromSignpostInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  STYUserScenario *v16;
  void *v17;
  void *v18;
  STYUserScenario *v19;
  uint64_t v21;

  v6 = a3;
  if (-[STYUserScenarioCache processWhitelisted:error:](self, "processWhitelisted:error:", v6, a4)
    && -[STYUserScenarioCache scenarioWhitelisted:error:](self, "scenarioWhitelisted:error:", v6, a4))
  {
    -[STYUserScenarioCache scenarioIdForSignpostInterval:](self, "scenarioIdForSignpostInterval:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STYUserScenarioCache scenarioGroupForSignpostInterval:](self, "scenarioGroupForSignpostInterval:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STYUserScenarioCache processBundleIdForSignpostInterval:](self, "processBundleIdForSignpostInterval:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[STYUserScenarioCache processIdForSignpostEvent:](self, "processIdForSignpostEvent:", v10);

    objc_opt_class();
    v12 = -1000;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "subsystem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.SpringBoard"));

      if (v14)
        v12 = -1000;
      else
        v12 = -1001;
    }
    if (-[STYUserScenarioCache kpiIsLatency:](self, "kpiIsLatency:", v6))
      v15 = -1000;
    else
      v15 = v12;
    v16 = [STYUserScenario alloc];
    objc_msgSend(v6, "beginEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "processName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = v11;
    v19 = -[STYUserScenario initWithConfiguration:scenarioGroup:kpi:processBundleID:titleText:processName:processID:](v16, "initWithConfiguration:scenarioGroup:kpi:processBundleID:titleText:processName:processID:", v7, v8, v15, v9, 0, v18, v21);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)scenarioForFrontboardLaunchWatchdog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  STYUserScenario *v19;
  uint64_t v21;

  v4 = a3;
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("BundleIdOverride"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;

    v5 = v8;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "subsystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.%@.%@.%@"), v10, v11, v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "subsystem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@.%@"), v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v21) = -[STYUserScenarioCache processIdForSignpostEvent:](self, "processIdForSignpostEvent:", v4);
  v19 = -[STYUserScenario initWithConfiguration:scenarioGroup:kpi:processBundleID:titleText:processName:processID:]([STYUserScenario alloc], "initWithConfiguration:scenarioGroup:kpi:processBundleID:titleText:processName:processID:", v13, v18, -1000, v7, 0, v5, v21);

  return v19;
}

- (id)scenarioFromSignpostEvent:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "subsystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.FrontBoard")))
    goto LABEL_6;
  objc_msgSend(v6, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Watchdog")) & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("WatchdogKill"));

  if (v10)
  {
    -[STYUserScenarioCache scenarioForFrontboardLaunchWatchdog:](self, "scenarioForFrontboardLaunchWatchdog:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_7:
  if (*a4)
  {
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Signpost is not whitelisted."), &stru_1E86A0F60, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", STYUserScenarioErrorDomain, -2000, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = 0;
LABEL_10:

  return v11;
}

+ (id)sharedCache
{
  if (sharedCache_setup != -1)
    dispatch_once(&sharedCache_setup, &__block_literal_global_6);
  return (id)sharedCache_sharedInstance;
}

void __35__STYUserScenarioCache_sharedCache__block_invoke()
{
  STYUserScenarioCache *v0;
  void *v1;

  v0 = -[STYUserScenarioCache initWithPlatform:]([STYUserScenarioCache alloc], "initWithPlatform:", CFSTR("iOS"));
  v1 = (void *)sharedCache_sharedInstance;
  sharedCache_sharedInstance = (uint64_t)v0;

}

- (NSMutableDictionary)scenarioObjects
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setScenarioObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)bundleIdForAppName
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdForAppName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)hwModel
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHwModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSError)badConfigError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBadConfigError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSError)bundledIdLookupFailedrror
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundledIdLookupFailedrror:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)responsivenessConfigForWhitelistedSubsystems
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setResponsivenessConfigForWhitelistedSubsystems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)responsivenessConfigForWhitelistedCategories
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResponsivenessConfigForWhitelistedCategories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDictionary)responsivenessConfigForWhitelistedNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResponsivenessConfigForWhitelistedNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDictionary)animationConfigForWhitelistedSubsystems
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAnimationConfigForWhitelistedSubsystems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDictionary)animationConfigForWhitelistedCategories
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAnimationConfigForWhitelistedCategories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)animationConfigForWhitelistedNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAnimationConfigForWhitelistedNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableDictionary)lifecycleScenarios
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLifecycleScenarios:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifecycleScenarios, 0);
  objc_storeStrong((id *)&self->_animationConfigForWhitelistedNames, 0);
  objc_storeStrong((id *)&self->_animationConfigForWhitelistedCategories, 0);
  objc_storeStrong((id *)&self->_animationConfigForWhitelistedSubsystems, 0);
  objc_storeStrong((id *)&self->_responsivenessConfigForWhitelistedNames, 0);
  objc_storeStrong((id *)&self->_responsivenessConfigForWhitelistedCategories, 0);
  objc_storeStrong((id *)&self->_responsivenessConfigForWhitelistedSubsystems, 0);
  objc_storeStrong((id *)&self->_bundledIdLookupFailedrror, 0);
  objc_storeStrong((id *)&self->_badConfigError, 0);
  objc_storeStrong((id *)&self->_hwModel, 0);
  objc_storeStrong((id *)&self->_bundleIdForAppName, 0);
  objc_storeStrong((id *)&self->_scenarioObjects, 0);
}

- (void)loadWhitelist:platform:bundles:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1CB87B000, v0, OS_LOG_TYPE_ERROR, "Unable to load plist: %@", v1, 0xCu);
}

- (void)isResponsivenessScenarioWhitelisted:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1CB87B000, v2, v3, "Name %@ is not whitelisted", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)isResponsivenessScenarioWhitelisted:(void *)a1 error:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1CB87B000, v2, v3, "Category %@ is not whitelisted", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)isResponsivenessScenarioWhitelisted:(void *)a1 error:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "subsystem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1CB87B000, v2, v3, "Subsystem %@ is not whitelisted", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
