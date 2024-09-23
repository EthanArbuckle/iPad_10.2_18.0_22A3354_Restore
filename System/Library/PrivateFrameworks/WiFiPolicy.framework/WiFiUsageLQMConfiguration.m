@implementation WiFiUsageLQMConfiguration

+ (void)initialize
{
  void *v2;

  v2 = (void *)_dataPathTelemetryConfig;
  _dataPathTelemetryConfig = 0;

}

+ (void)setConfig:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToDictionary:", _dataPathTelemetryConfig) & 1) == 0)
  {
    objc_storeStrong((id *)&_dataPathTelemetryConfig, a3);
    objc_msgSend(a1, "getConfigForPlatform");
    NSLog(CFSTR("%s: Updated dataPathTelemetryConfig from Mobile Assets"), "+[WiFiUsageLQMConfiguration setConfig:]");
    +[WiFiUsageLQMRollingWindow updateConfig](WiFiUsageLQMRollingWindow, "updateConfig");
    +[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateLQMWindowCriteria");

    +[WiFiUsageLQMTransformations updateConfig](WiFiUsageLQMTransformations, "updateConfig");
    +[WiFiUsageLQMWindowAnalysis updateConfig](WiFiUsageLQMWindowAnalysis, "updateConfig");
  }

}

+ (id)getConfigForKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)_dataPathTelemetryConfig, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    NSLog(CFSTR("%s: dataPathTelemetryConfig does not contain %@"), "+[WiFiUsageLQMConfiguration getConfigForKey:]", v3);

  return v4;
}

+ (void)getConfigForPlatform
{
  __objc2_class **p_superclass;
  void *v3;
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __objc2_class **v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  __objc2_class *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  __objc2_class *v39;
  const __CFString *v40;
  char v41;
  uint64_t v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  p_superclass = TBTileFetchRequestDescriptor.superclass;
  objc_msgSend((id)_dataPathTelemetryConfig, "objectForKey:", CFSTR("platformDependent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v34 = (__objc2_class *)(id)_dataPathTelemetryConfig;
    goto LABEL_38;
  }
  objc_msgSend((id)_dataPathTelemetryConfig, "objectForKeyedSubscript:", CFSTR("platformDependent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v35 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)_dataPathTelemetryConfig, "objectForKeyedSubscript:", CFSTR("platformDependent"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("%s: Cannot parse DataPathTelemetry.platformDependent: %@"), "+[WiFiUsageLQMConfiguration getConfigForPlatform]", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v37), "UTF8String"));
      v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v50 = objc_msgSend(v38, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v34 = 0;
    goto LABEL_38;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend((id)_dataPathTelemetryConfig, "objectForKeyedSubscript:", CFSTR("platformDependent"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (!v6)
  {
    v22 = 0;
    v34 = 0;
    goto LABEL_36;
  }
  v7 = v6;
  v40 = 0;
  v8 = CFSTR("validOnPlatforms");
  v9 = *(_QWORD *)v45;
  do
  {
    v10 = 0;
    v42 = v7;
    do
    {
      if (*(_QWORD *)v45 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_17;
      objc_msgSend(v11, "objectForKeyedSubscript:", v8);
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_17;
      v13 = (void *)v12;
      v14 = v9;
      v15 = p_superclass;
      v16 = v8;
      objc_msgSend(v11, "objectForKeyedSubscript:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DataPathTelemetry")),
            (v18 = objc_claimAutoreleasedReturnValue()) == 0))
      {

        v8 = v16;
        v9 = v14;
        v7 = v42;
LABEL_17:
        v24 = (void *)MEMORY[0x1E0CB3940];
        -[__objc2_class objectForKeyedSubscript:](p_superclass[399], "objectForKeyedSubscript:", CFSTR("platformDependent"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%s: Cannot parse DataPathTelemetry.platformDependent: %@"), "+[WiFiUsageLQMConfiguration getConfigForPlatform]", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v26), "UTF8String"));
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v28 = objc_msgSend(v27, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v50 = v28;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        goto LABEL_20;
      }
      v19 = (void *)v18;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DataPathTelemetry"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v41 = objc_opt_isKindOfClass();

      p_superclass = v15;
      v8 = v16;
      v9 = v14;
      v7 = v42;
      if ((v41 & 1) == 0)
        goto LABEL_17;
      switch(MGGetSInt32Answer())
      {
        case 1u:
        case 2u:
        case 3u:
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = CFSTR("phone");
          v23 = objc_msgSend(v21, "containsObject:", CFSTR("phone"));

          if (!v23)
            break;
          goto LABEL_26;
        case 4u:
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          v22 = CFSTR("tv");
          goto LABEL_25;
        case 6u:
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          v22 = CFSTR("watch");
          goto LABEL_25;
        case 9u:
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          v22 = CFSTR("mac");
LABEL_25:
          v31 = objc_msgSend(v29, "containsObject:", v22);

          if ((v31 & 1) == 0)
            break;
LABEL_26:
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DataPathTelemetry"));
          v32 = objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v34 = (__objc2_class *)v32;
            goto LABEL_36;
          }
          v40 = v22;
          break;
        default:
          break;
      }
LABEL_20:
      ++v10;
    }
    while (v7 != v10);
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    v7 = v33;
  }
  while (v33);
  v34 = 0;
  v22 = v40;
LABEL_36:

  NSLog(CFSTR("%s: received config for platform %@"), "+[WiFiUsageLQMConfiguration getConfigForPlatform]", v22);
  if (!v34)
    NSLog(CFSTR("%s: unable to find DataPathTelemetry configuration for current platform"), "+[WiFiUsageLQMConfiguration getConfigForPlatform]");
LABEL_38:
  v39 = p_superclass[399];
  p_superclass[399] = v34;

}

@end
