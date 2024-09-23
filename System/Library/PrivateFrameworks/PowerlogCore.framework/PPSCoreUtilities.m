@implementation PPSCoreUtilities

+ (BOOL)shouldOverrideAllowlist
{
  NSObject *v3;
  uint8_t v4[16];

  if (+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
    return +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("overrideAllowlist"), 1);
  PPSLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_INFO, "Cannot override allowlist on customer OS", v4, 2u);
  }

  return 0;
}

+ (BOOL)shouldLogMetric:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(a1, "isValidModeForMetric:", v4) & 1) == 0)
  {
    PPSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[PPSCoreUtilities shouldLogMetric:].cold.3(v4);
    goto LABEL_6;
  }
  if ((objc_msgSend(a1, "isAllowedMetric:", v4) & 1) == 0)
  {
    if (objc_msgSend(a1, "shouldOverrideAllowlist"))
    {
      objc_msgSend(v4, "subsystem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(a1, "isAllowedSubsystem:", v8);

      if (v9)
      {
        if (!objc_msgSend(a1, "isPrivacySensitive:", v4))
          goto LABEL_3;
        PPSLogCommon();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138412546;
          v12 = v10;
          v13 = 1024;
          v14 = objc_msgSend(v4, "privacyClassification");
          _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_INFO, "Metric %@ is not a metric in allowlist and its privacy classification is %d", (uint8_t *)&v11, 0x12u);

        }
      }
      else
      {
        PPSLogCommon();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          +[PPSCoreUtilities shouldLogMetric:].cold.1(v4);
      }
    }
    else
    {
      PPSLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        +[PPSCoreUtilities shouldLogMetric:].cold.2(v4);
    }
LABEL_6:

    v5 = 0;
    goto LABEL_7;
  }
LABEL_3:
  v5 = 1;
LABEL_7:

  return v5;
}

+ (BOOL)isAllowedMetric:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;

  v4 = a3;
  if (+[PLDefaults fullMode](PLDefaults, "fullMode"))
  {
    if (!objc_msgSend(a1, "isPrivacySensitive:", v4))
    {
      v6 = 1;
      goto LABEL_13;
    }
    PPSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSCoreUtilities isAllowedMetric:].cold.1(v4);
    v6 = 1;
  }
  else
  {
    +[PPSCoreUtilities getAllowlist](PPSCoreUtilities, "getAllowlist");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subsystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "category");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "doubleValue");
    v14 = v13;
    objc_msgSend(v4, "version");
    v16 = vabdd_f64(v14, v15);
    v6 = v16 < 0.001;
    if (v16 >= 0.001)
    {
      PPSLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        +[PPSCoreUtilities isAllowedMetric:].cold.2(v4);

    }
  }

LABEL_13:
  return v6;
}

+ (id)getAllowlist
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PPSCoreUtilities_getAllowlist__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getAllowlist_once_token != -1)
    dispatch_once(&getAllowlist_once_token, block);
  return (id)getAllowlist_allowlist;
}

+ (BOOL)isValidModeForMetric:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL v5;
  BOOL v6;

  v3 = a3;
  switch(objc_msgSend(v3, "mode"))
  {
    case 0u:
      PPSLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[PPSCoreUtilities isValidModeForMetric:].cold.2(v3);
      goto LABEL_6;
    case 1u:
      if (+[PLDefaults liteMode](PLDefaults, "liteMode"))
        goto LABEL_16;
      goto LABEL_15;
    case 2u:
      v6 = +[PLDefaults liteMode](PLDefaults, "liteMode");
      goto LABEL_14;
    case 3u:
      goto LABEL_11;
    case 4u:
      goto LABEL_13;
    case 5u:
      if (+[PLDefaults liteMode](PLDefaults, "liteMode"))
        goto LABEL_16;
LABEL_11:
      v6 = +[PLDefaults taskMode](PLDefaults, "taskMode");
      goto LABEL_14;
    case 6u:
      if (!+[PLDefaults liteMode](PLDefaults, "liteMode"))
        goto LABEL_13;
      goto LABEL_16;
    case 7u:
LABEL_15:
      if (+[PLDefaults taskMode](PLDefaults, "taskMode"))
      {
LABEL_16:
        v5 = 1;
      }
      else
      {
LABEL_13:
        v6 = +[PLDefaults fullMode](PLDefaults, "fullMode");
LABEL_14:
        v5 = v6;
      }
LABEL_17:

      return v5;
    default:
      PPSLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[PPSCoreUtilities isValidModeForMetric:].cold.1(v3);
LABEL_6:

      v5 = 0;
      goto LABEL_17;
  }
}

void __32__PPSCoreUtilities_getAllowlist__block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = +[PLPlatform internalBuild](PLPlatform, "internalBuild");
  objc_msgSend(*(id *)(a1 + 32), "getPrivacyAllowlist");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)getAllowlist_allowlist;
  getAllowlist_allowlist = v3;

  if (v2)
  {
    v5 = getAllowlist_allowlist;
    objc_msgSend(*(id *)(a1 + 32), "getTestAllowlist");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[PPSCoreUtilities mergeNestedDictionary:withDict:](PPSCoreUtilities, "mergeNestedDictionary:withDict:", v5, v8);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)getAllowlist_allowlist;
    getAllowlist_allowlist = v6;

  }
}

+ (id)getTestAllowlist
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D70A10], "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("Test/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("testAllowlist.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v7, &v12);
  v9 = v12;
  if (v9)
  {
    PPSLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[PPSCoreUtilities getTestAllowlist].cold.1();

  }
  return v8;
}

+ (BOOL)isSetupAllowedForMetric:(id)a3
{
  id v4;
  char v5;
  unsigned int v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;

  v4 = a3;
  v5 = objc_msgSend(a1, "isValidModeForMetric:", v4);
  v6 = objc_msgSend(v4, "mode");
  v7 = v6 > 7 || ((1 << v6) & 0xA8) == 0;
  if (!v7 && +[PLDefaults taskMode](PLDefaults, "taskMode"))
  {
    +[PPSSubmissionUtilities taskingTables](PPSSubmissionUtilities, "taskingTables");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[PPSSubmissionUtilities taskingTables](PPSSubmissionUtilities, "taskingTables");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subsystem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[PPSSubmissionUtilities taskingTables](PPSSubmissionUtilities, "taskingTables");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subsystem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "category");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "containsObject:", v15);

    if (v11)
      v17 = v16;
    else
      v17 = 0;
    if (!v8)
      v17 = 0;
    v5 &= v17;
  }

  return v5;
}

+ (id)deviceCapabilityMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PPSCoreUtilities_deviceCapabilityMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceCapabilityMapping_onceToken != -1)
    dispatch_once(&deviceCapabilityMapping_onceToken, block);
  return (id)deviceCapabilityMapping_deviceCapabilityMap;
}

void __43__PPSCoreUtilities_deviceCapabilityMapping__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  void *v5;

  v2 = objc_opt_new();
  v3 = (void *)deviceCapabilityMapping_deviceCapabilityMap;
  deviceCapabilityMapping_deviceCapabilityMap = v2;

  for (i = 0; i != 22; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "hasCapability:", i));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)deviceCapabilityMapping_deviceCapabilityMap, "setObject:atIndexedSubscript:", v5, i);

  }
}

+ (BOOL)hasCapability:(int)a3
{
  BOOL result;

  result = 0;
  switch(a3)
  {
    case 1:
    case 16:
      result = 1;
      break;
    case 2:
      result = +[PLPlatform hasANE](PLPlatform, "hasANE");
      break;
    case 4:
      result = +[PLPlatform hasAOT](PLPlatform, "hasAOT");
      break;
    case 5:
      result = +[PLPlatform hasBaseband](PLPlatform, "hasBaseband");
      break;
    case 6:
      result = +[PLUtilities hasBattery](PLUtilities, "hasBattery");
      break;
    case 8:
      result = !+[PLPlatform isDisplayClass:](PLPlatform, "isDisplayClass:", 0xFFFFFFFFLL);
      break;
    case 9:
      result = +[PLPlatform hasDCP](PLPlatform, "hasDCP");
      break;
    case 10:
      result = +[PLPlatform hasLPEM](PLPlatform, "hasLPEM");
      break;
    case 12:
      result = +[PLPlatform hasNFC](PLPlatform, "hasNFC");
      break;
    case 18:
      result = +[PLPlatform isBasebandIce](PLPlatform, "isBasebandIce");
      break;
    case 19:
      result = +[PLPlatform isBasebandMav](PLPlatform, "isBasebandMav");
      break;
    case 20:
      result = +[PLPlatform isBasebandProto](PLPlatform, "isBasebandProto");
      break;
    case 21:
      result = +[PLPlatform hasGenerativeModelSystems](PLPlatform, "hasGenerativeModelSystems");
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)shouldSetupMetric:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;

  v4 = a3;
  if (!v4)
  {
    PPSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[PPSCoreUtilities shouldSetupMetric:].cold.1(v6);
    goto LABEL_14;
  }
  if ((objc_msgSend(a1, "isSetupAllowedForMetric:", v4) & 1) == 0)
  {
    PPSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[PPSCoreUtilities shouldSetupMetric:].cold.4(v4);
    goto LABEL_14;
  }
  if ((objc_msgSend(a1, "isAllowedPopulation:", objc_msgSend(v4, "enabledPopulation")) & 1) == 0)
  {
    PPSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[PPSCoreUtilities shouldSetupMetric:].cold.3(v4);
    goto LABEL_14;
  }
  if ((objc_msgSend(a1, "hasCapability:", objc_msgSend(v4, "deviceCapability")) & 1) == 0)
  {
    PPSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[PPSCoreUtilities shouldSetupMetric:].cold.2(v4);
LABEL_14:

    v5 = 0;
    goto LABEL_15;
  }
  v5 = 1;
LABEL_15:

  return v5;
}

+ (BOOL)isAllowedPopulation:(int)a3
{
  BOOL result;

  result = 1;
  switch(a3)
  {
    case 0:
    case 4:
      result = 0;
      break;
    case 1:
      goto LABEL_6;
    case 2:
      if (+[PLPlatform seedBuild](PLPlatform, "seedBuild"))
        result = 1;
      else
LABEL_6:
        result = +[PLPlatform internalBuild](PLPlatform, "internalBuild");
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)isPrivacySensitive:(id)a3
{
  return objc_msgSend(a3, "privacyClassification") != 1;
}

+ (BOOL)isAllowedSubsystem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;

  v3 = a3;
  if (v3)
  {
    +[PPSCoreUtilities getAllowlist](PPSCoreUtilities, "getAllowlist");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v5 != 0;
    if (!v5)
    {
      PPSLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        +[PPSCoreUtilities isAllowedSubsystem:].cold.1();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isAllowedSubsystem:(id)a3 category:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if (+[PLDefaults fullMode](PLDefaults, "fullMode"))
    {
      v8 = 1;
    }
    else
    {
      +[PPSCoreUtilities getAllowlist](PPSCoreUtilities, "getAllowlist");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v11 != 0;
      if (!v11)
      {
        PPSLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          +[PPSCoreUtilities isAllowedSubsystem:category:].cold.1();

      }
    }
  }

  return v8;
}

+ (id)md5Hash:(id)a3
{
  const char *v3;
  CC_LONG v4;
  unsigned __int8 md[8];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  *(_QWORD *)md = 0;
  v7 = 0;
  v4 = strlen(v3);
  CC_MD5(v3, v4, md);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X"), md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], v7, BYTE1(v7), BYTE2(v7), BYTE3(v7), BYTE4(v7), BYTE5(v7), BYTE6(v7), HIBYTE(v7));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)mergeNestedDictionary:(id)a3 withDict:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithDictionary:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__PPSCoreUtilities_mergeNestedDictionary_withDict___block_invoke;
  v14[3] = &unk_1E6A53450;
  v15 = v5;
  v9 = v8;
  v16 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __51__PPSCoreUtilities_mergeNestedDictionary_withDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSCoreUtilities mergeNestedDictionary:withDict:](PPSCoreUtilities, "mergeNestedDictionary:withDict:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v8, v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v9);
  }

}

+ (void)getTestAllowlist
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(MEMORY[0x1E0D70A10], "containerPath");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingString:", CFSTR("Test/"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("testAllowlist.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B6AB6000, v4, v5, "Could not read test allowlist at path: %@", v6, v7, v8, v9, v10);

}

+ (void)isValidModeForMetric:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_0_4(&dword_1B6AB6000, v2, v3, "Invalid mode for metric: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

+ (void)isValidModeForMetric:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_0_4(&dword_1B6AB6000, v2, v3, "Unknown mode for metric: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

+ (void)shouldSetupMetric:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_ERROR, "Nil metric sent for setup", v1, 2u);
}

+ (void)shouldSetupMetric:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_0_4(&dword_1B6AB6000, v2, v3, "Metric %@ could not be setup - does not meet device capability", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

+ (void)shouldSetupMetric:(void *)a1 .cold.3(void *a1)
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
  OUTLINED_FUNCTION_0_4(&dword_1B6AB6000, v2, v3, "Metric %@ could not be setup - does not meet population criteria", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

+ (void)shouldSetupMetric:(void *)a1 .cold.4(void *a1)
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
  OUTLINED_FUNCTION_0_4(&dword_1B6AB6000, v2, v3, "Metric %@ could not be setup - does not meet setup criteria", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

+ (void)shouldLogMetric:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_0_3(&dword_1B6AB6000, v2, v3, "Subsystem %@ is not in allowlist", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

+ (void)shouldLogMetric:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_0_3(&dword_1B6AB6000, v2, v3, "Metric %@ is not a metric in allowlist", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

+ (void)shouldLogMetric:(void *)a1 .cold.3(void *a1)
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
  OUTLINED_FUNCTION_0_3(&dword_1B6AB6000, v2, v3, "Invalid mode for metric %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

+ (void)isAllowedMetric:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_0_4(&dword_1B6AB6000, v2, v3, "Device is in full mode. Flagging privacy sensitive metric %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

+ (void)isAllowedMetric:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_0_3(&dword_1B6AB6000, v2, v3, "Logging not allowed for metric: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

+ (void)isAllowedSubsystem:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1B6AB6000, v0, OS_LOG_TYPE_DEBUG, "Subsystem %@ not in allowlist", v1, 0xCu);
}

+ (void)isAllowedSubsystem:category:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1B6AB6000, v1, OS_LOG_TYPE_DEBUG, "EntryKey setup not allowed for %@/%@", v2, 0x16u);
}

@end
