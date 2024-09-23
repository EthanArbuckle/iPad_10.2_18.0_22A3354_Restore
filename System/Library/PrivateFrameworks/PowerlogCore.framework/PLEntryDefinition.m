@implementation PLEntryDefinition

+ (signed)aggregateFunctionForEntryDefinition:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  signed __int16 v9;

  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Keys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AggregateFunction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shortValue");

  return v9;
}

+ (BOOL)isAggregateForEntryDefinition:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "aggregateBucketDefinitionsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)aggregateBucketDefinitionsForEntryDefinition:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKey:", CFSTR("AggregateBuckets"));
}

+ (id)allKeysForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "keyConfigsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)keyConfigsForEntryDefinition:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKey:", CFSTR("Keys"));
}

+ (id)allAggregateKeysForEntryDefinition:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AggregateKeys"));
}

+ (BOOL)isAggregateWallClockBucket:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isAggregateWallClockBucketForEntryDefinition:", v4);

  return (char)v3;
}

+ (BOOL)isAggregateWallClockBucketForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "configsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("AggregateWallClockBucket"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (id)allAggregatePrimaryKeysForEntryDefinition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "allKeysForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(a1, "allAggregateKeysForEntryDefinition:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectsInArray:", v7);
  return v6;
}

+ (id)definitionForEntryKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[PLEntryKey PLEntryKeyForEntryKey:](PLEntryKey, "PLEntryKeyForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entryDefinitionsForOperatorClass:", objc_msgSend(v4, "operatorClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryDefinitionsForOperatorClass:(Class)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[5];
  _QWORD v27[6];
  _QWORD v28[8];

  v28[6] = *MEMORY[0x1E0C80C00];
  if (entryDefinitionsForOperatorClass__onceToken != -1)
  {
    dispatch_once(&entryDefinitionsForOperatorClass__onceToken, &__block_literal_global_13);
    if (a3)
      goto LABEL_3;
LABEL_14:
    v5 = 0;
    return v5;
  }
  if (!a3)
    goto LABEL_14;
LABEL_3:
  dispatch_semaphore_wait((dispatch_semaphore_t)entryDefinitionsForOperatorClass__entryDefinitionsSem, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)entryDefinitionsForOperatorClass__entryDefinitions, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v6 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__PLEntryDefinition_entryDefinitionsForOperatorClass___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (entryDefinitionsForOperatorClass__defaultOnce != -1)
        dispatch_once(&entryDefinitionsForOperatorClass__defaultOnce, block);
      if (entryDefinitionsForOperatorClass__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setting up entry Definitions for %@"), a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLEntryDefinition.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLEntryDefinition entryDefinitionsForOperatorClass:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 116);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFileSP copyAndPrepareLog].cold.1((uint64_t)v7, v11);

      }
    }
    v27[0] = CFSTR("EventPoint");
    -[objc_class entryEventPointDefinitions](a3, "entryEventPointDefinitions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "constructEntryDefinition:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v24;
    v27[1] = CFSTR("EventForward");
    -[objc_class entryEventForwardDefinitions](a3, "entryEventForwardDefinitions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "constructEntryDefinition:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v22;
    v27[2] = CFSTR("EventBackward");
    -[objc_class entryEventBackwardDefinitions](a3, "entryEventBackwardDefinitions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "constructEntryDefinition:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v13;
    v27[3] = CFSTR("EventInterval");
    -[objc_class entryEventIntervalDefinitions](a3, "entryEventIntervalDefinitions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "constructEntryDefinition:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v15;
    v27[4] = CFSTR("EventNone");
    -[objc_class entryEventNoneDefinitions](a3, "entryEventNoneDefinitions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "constructEntryDefinition:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v17;
    v27[5] = CFSTR("Aggregate");
    -[objc_class entryAggregateDefinitions](a3, "entryAggregateDefinitions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "constructEntryDefinition:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[5] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)entryDefinitionsForOperatorClass__entryDefinitions, "setObject:forKeyedSubscript:", v20, a3);

    objc_msgSend((id)entryDefinitionsForOperatorClass__entryDefinitions, "objectForKeyedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)entryDefinitionsForOperatorClass__entryDefinitionsSem);
  return v5;
}

+ (BOOL)cacheSQLPrepareStatementForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "configsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SQLPrepareStatementCaching"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (id)subEntryKeyKeyForEntryKey:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "subEntryKeyKeyForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)overridesEntryDateForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "configsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("OverridesEntryDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (id)subEntryKeyKeyForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "configsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SubEntryKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)configsForEntryDefinition:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKey:", CFSTR("Configs"));
}

+ (BOOL)cacheSQLPrepareStatementForEntryKey:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (+[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v4))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(a1, "definitionForEntryKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(a1, "cacheSQLPrepareStatementForEntryDefinition:", v6);

  }
  return v5;
}

+ (BOOL)hasDynamicKeysForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "configsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("DynamicDefinition"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (BOOL)hasArrayKeysForEntryDefinition:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "arrayKeysForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

+ (id)arrayKeysForEntryDefinition:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKey:", CFSTR("ArrayKeys"));
}

+ (BOOL)filterEntryLoggingForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "configsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FilterEntryLogging"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (BOOL)hasDMAKeysForEntryDefinition:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "DMAKeysForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

+ (id)DMAKeysForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "configsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DMACompliantKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)dynamicKeyConfigsForEntryKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (+[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v4))
  {
    +[PPSEntryKey dynamicMetricsForEntryKey:](PPSEntryKey, "dynamicMetricsForEntryKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "definitionForEntryKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dynamicKeyConfigsForEntryDefinition:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v6;
  }

  return v5;
}

+ (id)dynamicKeyConfigsForEntryDefinition:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKey:", CFSTR("DynamicKeys"));
}

+ (BOOL)isAggregateForEntryKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isAggregateForEntryDefinition:", v4);

  return (char)v3;
}

+ (id)arrayKeyConfigsForEntryKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (+[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v4))
  {
    +[PPSEntryKey arrayMetricsForEntryKey:](PPSEntryKey, "arrayMetricsForEntryKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "definitionForEntryKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dynamicKeyConfigsForEntryDefinition:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v6;
  }

  return v5;
}

+ (int)limitOfType:(id)a3 forEntryKey:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "definitionForEntryKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "limitOfType:forEntryDefinition:", v6, v7);

  return (int)a1;
}

+ (int)limitOfType:(id)a3 forEntryDefinition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;

  v6 = a3;
  objc_msgSend(a1, "configsForEntryDefinition:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

  }
  else
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("RateLimit")) & 1) != 0)
    {
      v11 = 50;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WarningLimit")) & 1) != 0)
    {
      v11 = 3;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("SafetyDropLimit")))
    {
      v11 = 3;
    }
    else
    {
      v11 = 0;
    }
    v10 = +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", v6, v11);
  }

  return v10;
}

+ (id)keyConfigsForEntryKey:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "keyConfigsForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __54__PLEntryDefinition_entryDefinitionsForOperatorClass___block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)entryDefinitionsForOperatorClass__entryDefinitionsSem;
  entryDefinitionsForOperatorClass__entryDefinitionsSem = (uint64_t)v0;

  v2 = objc_opt_new();
  v3 = (void *)entryDefinitionsForOperatorClass__entryDefinitions;
  entryDefinitionsForOperatorClass__entryDefinitions = v2;

}

BOOL __54__PLEntryDefinition_entryDefinitionsForOperatorClass___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  entryDefinitionsForOperatorClass__classDebugEnabled = result;
  return result;
}

+ (BOOL)isNonEmptyDictionary:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v3, "count");

  return v4;
}

+ (BOOL)hasTaskModeKeyInConfig:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = +[PLDefaults liteMode](PLDefaults, "liteMode")
    && (objc_msgSend(a1, "hasTaskModeKeyForEntryDefinition:", v4) & 1) != 0;

  return v5;
}

+ (id)constructEntryDefinition:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PLEntryDefinition_constructEntryDefinition___block_invoke;
  v8[3] = &unk_1E6A53108;
  v10 = a1;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __46__PLEntryDefinition_constructEntryDefinition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 40), "isNonEmptyDictionary:", v5)
    && (objc_msgSend(*(id *)(a1 + 40), "hasTaskModeKeyInConfig:", v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);
  }

}

+ (id)entryDefinitionsForOperator:(id)a3
{
  return (id)objc_msgSend(a1, "entryDefinitionsForOperatorClass:", objc_opt_class());
}

+ (id)configsForEntryKey:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configsForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)arrayKeysForEntryKey:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayKeysForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)aggregateBucketDefinitionsForEntryKey:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aggregateBucketDefinitionsForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)allKeysForEntryKey:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allKeysForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)allDynamicKeysForEntryKey:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allDynamicKeysForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)allAggregateKeysForEntryKey:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allAggregateKeysForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)allIndexKeysForEntryKey:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allIndexKeysForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)allAggregatePrimaryKeysForEntryKey:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allAggregatePrimaryKeysForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)hasDynamicKeysForEntryKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "hasDynamicKeysForEntryDefinition:", v4);

  return (char)v3;
}

+ (BOOL)hasArrayKeysForEntryKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "hasArrayKeysForEntryDefinition:", v4);

  return (char)v3;
}

+ (BOOL)hasDMAKeysForEntryKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "hasDMAKeysForEntryDefinition:", v4);

  return (char)v3;
}

+ (BOOL)isOnDemandQueryableForEntryKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isOnDemandQueryableForEntryDefinition:", v4);

  return (char)v3;
}

+ (BOOL)filterEntryLoggingForEntryKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "filterEntryLoggingForEntryDefinition:", v4);

  return (char)v3;
}

+ (BOOL)overridesEntryDateForEntryKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "overridesEntryDateForEntryDefinition:", v4);

  return (char)v3;
}

+ (double)schemaVersionForEntryKey:(id)a3
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "schemaVersionForEntryDefinition:", v4);
  v6 = v5;

  return v6;
}

+ (int)cacheCountForEntryKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "cacheCountForEntryDefition:", v4);

  return (int)v3;
}

+ (id)manualSortOrderForEntryKey:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "definitionForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "manualSortOrderForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)logSelectorStringForEnteryKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(a1, "isOnDemandQueryableForEntryKey:", v4))
  {
    objc_msgSend(a1, "definitionForEntryKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "logSelectorStringForEntryDefinition:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = v6;
    }
    else
    {
      +[PLEntryKey PLEntryKeyForEntryKey:](PLEntryKey, "PLEntryKeyForEntryKey:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "entryType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "entryName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("log%@%@"), v10, v11);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)allDynamicKeysForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "dynamicKeyConfigsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allIndexKeysForEntryDefinition:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("IndexKeys"));
}

+ (BOOL)hasTaskModeKeyForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "configsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TaskModeTable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (BOOL)hasAppIdentifierKeysForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "configsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("AppIdentifierKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");
  return (char)v3;
}

+ (BOOL)isOnDemandQueryableForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "configsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("OnDemandQuery"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

+ (double)schemaVersionForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Configs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SchemaVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

+ (int)cacheCountForEntryDefition:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Configs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EntryCaching"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "intValue");
  else
    v5 = 0;

  return v5;
}

+ (id)manualSortOrderForEntryDefinition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_msgSend(a1, "configsForEntryDefinition:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SortOrderManual"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(a1, "allKeysForEntryDefinition:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minusSet:", v10);

    if (objc_msgSend(v7, "count"))
    {
      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[PLEntryDefinition manualSortOrderForEntryDefinition:].cold.1((uint64_t)v7, v11);

      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "minusSet:", v7);
      objc_msgSend(v12, "allObjects");
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = v6;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)sortedKeysFromEntryDefinition:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  __int16 v16;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(a1, "allKeysForEntryDefinition:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "manualSortOrderForEntryDefinition:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Configs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("SortOrderAuto"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "addObjectsFromArray:", v8);
  objc_msgSend(v7, "removeObjectsInArray:", v8);
  if ((v11 & 0xFFFE) == 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__PLEntryDefinition_sortedKeysFromEntryDefinition___block_invoke;
    v15[3] = &__block_descriptor_34_e11_q24__0_8_16l;
    v16 = v11;
    v13 = (id)objc_msgSend(v7, "sortedArrayUsingComparator:", v15);
  }
  objc_msgSend(v12, "addObjectsFromArray:", v7);

  return v12;
}

uint64_t __51__PLEntryDefinition_sortedKeysFromEntryDefinition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_WORD *)(a1 + 32) == 1)
  {
    v8 = v5;
  }
  else
  {
    if (*(_WORD *)(a1 + 32))
    {
      v9 = 0;
      goto LABEL_7;
    }
    v6 = v5;
    v8 = v7;
  }
  v9 = objc_msgSend(v6, "compare:", v8);
LABEL_7:

  return v9;
}

+ (id)logSelectorStringForEntryDefinition:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "configsForEntryDefinition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("LogSelector"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)notificationNameForEntryKey:(id)a3 withFilterDefintion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id obj;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@.filtered"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v5;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v8;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(obj);
        v26 = v9;
        v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v9);
        objc_msgSend(v24, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compare_);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v28 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_msgSend(v11, "objectForKeyedSubscript:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendFormat:", CFSTR(".%@_%@_%@"), v10, v19, v20);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v16);
        }

        v9 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v25);
  }

  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_150);
  return (id)sharedInstance_sharedInstance_0;
}

void __35__PLEntryDefinition_sharedInstance__block_invoke()
{
  PLEntryDefinition *v0;
  void *v1;

  v0 = objc_alloc_init(PLEntryDefinition);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (id)commonTypeDict_BoolFormat
{
  if (commonTypeDict_BoolFormat_onceToken != -1)
    dispatch_once(&commonTypeDict_BoolFormat_onceToken, &__block_literal_global_152);
  return (id)commonTypeDict_BoolFormat__typedict_BOOL;
}

void __46__PLEntryDefinition_commonTypeDict_BoolFormat__block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("Type");
  v3[0] = &unk_1E6ABAAD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_BoolFormat__typedict_BOOL;
  commonTypeDict_BoolFormat__typedict_BOOL = v0;

}

- (id)commonTypeDict_IntegerFormat
{
  if (commonTypeDict_IntegerFormat_onceToken != -1)
    dispatch_once(&commonTypeDict_IntegerFormat_onceToken, &__block_literal_global_154);
  return (id)commonTypeDict_IntegerFormat__typedict_integer;
}

void __49__PLEntryDefinition_commonTypeDict_IntegerFormat__block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("Type");
  v3[0] = &unk_1E6ABAAF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_IntegerFormat__typedict_integer;
  commonTypeDict_IntegerFormat__typedict_integer = v0;

}

- (id)commonTypeDict_IntegerFormat_withUnit_s
{
  if (commonTypeDict_IntegerFormat_withUnit_s_onceToken != -1)
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_s_onceToken, &__block_literal_global_156);
  return (id)commonTypeDict_IntegerFormat_withUnit_s__typedict_integer;
}

void __60__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_s__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("Unit");
  v3[0] = &unk_1E6ABAAF0;
  v3[1] = CFSTR("s");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_s__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_s__typedict_integer = v0;

}

- (id)commonTypeDict_IntegerFormat_withUnit_ms
{
  if (commonTypeDict_IntegerFormat_withUnit_ms_onceToken != -1)
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_ms_onceToken, &__block_literal_global_159);
  return (id)commonTypeDict_IntegerFormat_withUnit_ms__typedict_integer;
}

void __61__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_ms__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("Unit");
  v3[0] = &unk_1E6ABAAF0;
  v3[1] = CFSTR("ms");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_ms__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_ms__typedict_integer = v0;

}

- (id)commonTypeDict_IntegerFormat_withUnit_us
{
  if (commonTypeDict_IntegerFormat_withUnit_us_onceToken != -1)
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_us_onceToken, &__block_literal_global_162);
  return (id)commonTypeDict_IntegerFormat_withUnit_us__typedict_integer;
}

void __61__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_us__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("Unit");
  v3[0] = &unk_1E6ABAAF0;
  v3[1] = CFSTR("us");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_us__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_us__typedict_integer = v0;

}

- (id)commonTypeDict_IntegerFormat_withUnit_mV
{
  if (commonTypeDict_IntegerFormat_withUnit_mV_onceToken != -1)
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_mV_onceToken, &__block_literal_global_165);
  return (id)commonTypeDict_IntegerFormat_withUnit_mV__typedict_integer;
}

void __61__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_mV__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("Unit");
  v3[0] = &unk_1E6ABAAF0;
  v3[1] = CFSTR("mV");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_mV__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_mV__typedict_integer = v0;

}

- (id)commonTypeDict_IntegerFormat_withUnit_mA
{
  if (commonTypeDict_IntegerFormat_withUnit_mA_onceToken != -1)
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_mA_onceToken, &__block_literal_global_168);
  return (id)commonTypeDict_IntegerFormat_withUnit_mA__typedict_integer;
}

void __61__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_mA__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("Unit");
  v3[0] = &unk_1E6ABAAF0;
  v3[1] = CFSTR("mA");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_mA__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_mA__typedict_integer = v0;

}

- (id)commonTypeDict_IntegerFormat_withUnit_mAh
{
  if (commonTypeDict_IntegerFormat_withUnit_mAh_onceToken != -1)
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_mAh_onceToken, &__block_literal_global_171);
  return (id)commonTypeDict_IntegerFormat_withUnit_mAh__typedict_integer;
}

void __62__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_mAh__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("Unit");
  v3[0] = &unk_1E6ABAAF0;
  v3[1] = CFSTR("mAh");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_mAh__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_mAh__typedict_integer = v0;

}

- (id)commonTypeDict_IntegerFormat_withUnit_mJ
{
  if (commonTypeDict_IntegerFormat_withUnit_mJ_onceToken != -1)
    dispatch_once(&commonTypeDict_IntegerFormat_withUnit_mJ_onceToken, &__block_literal_global_174);
  return (id)commonTypeDict_IntegerFormat_withUnit_mJ__typedict_integer;
}

void __61__PLEntryDefinition_commonTypeDict_IntegerFormat_withUnit_mJ__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("Unit");
  v3[0] = &unk_1E6ABAAF0;
  v3[1] = CFSTR("mJ");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_IntegerFormat_withUnit_mJ__typedict_integer;
  commonTypeDict_IntegerFormat_withUnit_mJ__typedict_integer = v0;

}

- (id)commonTypeDict_IntegerFormat_aggregateFunction_sum
{
  if (commonTypeDict_IntegerFormat_aggregateFunction_sum_onceToken != -1)
    dispatch_once(&commonTypeDict_IntegerFormat_aggregateFunction_sum_onceToken, &__block_literal_global_177);
  return (id)commonTypeDict_IntegerFormat_aggregateFunction_sum__typedict_integer;
}

void __71__PLEntryDefinition_commonTypeDict_IntegerFormat_aggregateFunction_sum__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("IsAggregateValue");
  v3[0] = &unk_1E6ABAAF0;
  v3[1] = MEMORY[0x1E0C9AAB0];
  v2[2] = CFSTR("AggregateFunction");
  v3[2] = &unk_1E6ABAB08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_IntegerFormat_aggregateFunction_sum__typedict_integer;
  commonTypeDict_IntegerFormat_aggregateFunction_sum__typedict_integer = v0;

}

- (id)commonTypeDict_RealFormat
{
  if (commonTypeDict_RealFormat_onceToken != -1)
    dispatch_once(&commonTypeDict_RealFormat_onceToken, &__block_literal_global_179);
  return (id)commonTypeDict_RealFormat__typedict_real;
}

void __46__PLEntryDefinition_commonTypeDict_RealFormat__block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("Type");
  v3[0] = &unk_1E6ABAB20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_RealFormat__typedict_real;
  commonTypeDict_RealFormat__typedict_real = v0;

}

- (id)commonTypeDict_RealFormat_withUnit_s
{
  if (commonTypeDict_RealFormat_withUnit_s_onceToken != -1)
    dispatch_once(&commonTypeDict_RealFormat_withUnit_s_onceToken, &__block_literal_global_181);
  return (id)commonTypeDict_RealFormat_withUnit_s__typedict_real;
}

void __57__PLEntryDefinition_commonTypeDict_RealFormat_withUnit_s__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("Unit");
  v3[0] = &unk_1E6ABAB20;
  v3[1] = CFSTR("s");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_RealFormat_withUnit_s__typedict_real;
  commonTypeDict_RealFormat_withUnit_s__typedict_real = v0;

}

- (id)commonTypeDict_RealFormat_withUnit_mJ
{
  if (commonTypeDict_RealFormat_withUnit_mJ_onceToken != -1)
    dispatch_once(&commonTypeDict_RealFormat_withUnit_mJ_onceToken, &__block_literal_global_182);
  return (id)commonTypeDict_RealFormat_withUnit_mJ__typedict_real;
}

void __58__PLEntryDefinition_commonTypeDict_RealFormat_withUnit_mJ__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("Unit");
  v3[0] = &unk_1E6ABAB20;
  v3[1] = CFSTR("mJ");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_RealFormat_withUnit_mJ__typedict_real;
  commonTypeDict_RealFormat_withUnit_mJ__typedict_real = v0;

}

- (id)commonTypeDict_RealFormat_withUnit_mW
{
  if (commonTypeDict_RealFormat_withUnit_mW_onceToken != -1)
    dispatch_once(&commonTypeDict_RealFormat_withUnit_mW_onceToken, &__block_literal_global_183);
  return (id)commonTypeDict_RealFormat_withUnit_mW__typedict_real;
}

void __58__PLEntryDefinition_commonTypeDict_RealFormat_withUnit_mW__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("Unit");
  v3[0] = &unk_1E6ABAB20;
  v3[1] = CFSTR("mW");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_RealFormat_withUnit_mW__typedict_real;
  commonTypeDict_RealFormat_withUnit_mW__typedict_real = v0;

}

- (id)commonTypeDict_RealFormat_withUnit_mWhr
{
  if (commonTypeDict_RealFormat_withUnit_mWhr_onceToken != -1)
    dispatch_once(&commonTypeDict_RealFormat_withUnit_mWhr_onceToken, &__block_literal_global_186);
  return (id)commonTypeDict_RealFormat_withUnit_mWhr__typedict_real;
}

void __60__PLEntryDefinition_commonTypeDict_RealFormat_withUnit_mWhr__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("Unit");
  v3[0] = &unk_1E6ABAB20;
  v3[1] = CFSTR("mWhr");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_RealFormat_withUnit_mWhr__typedict_real;
  commonTypeDict_RealFormat_withUnit_mWhr__typedict_real = v0;

}

- (id)commonTypeDict_RealFormat_aggregateFunction_sum
{
  if (commonTypeDict_RealFormat_aggregateFunction_sum_onceToken != -1)
    dispatch_once(&commonTypeDict_RealFormat_aggregateFunction_sum_onceToken, &__block_literal_global_189);
  return (id)commonTypeDict_RealFormat_aggregateFunction_sum__typedict_integer;
}

void __68__PLEntryDefinition_commonTypeDict_RealFormat_aggregateFunction_sum__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("IsAggregateValue");
  v3[0] = &unk_1E6ABAB20;
  v3[1] = MEMORY[0x1E0C9AAB0];
  v2[2] = CFSTR("AggregateFunction");
  v3[2] = &unk_1E6ABAB08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_RealFormat_aggregateFunction_sum__typedict_integer;
  commonTypeDict_RealFormat_aggregateFunction_sum__typedict_integer = v0;

}

- (id)commonTypeDict_StringFormat
{
  if (commonTypeDict_StringFormat_onceToken != -1)
    dispatch_once(&commonTypeDict_StringFormat_onceToken, &__block_literal_global_190);
  return (id)commonTypeDict_StringFormat__typedict_string;
}

void __48__PLEntryDefinition_commonTypeDict_StringFormat__block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("Type");
  v3[0] = &unk_1E6ABAB38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_StringFormat__typedict_string;
  commonTypeDict_StringFormat__typedict_string = v0;

}

- (id)commonTypeDict_StringFormat_withBundleID
{
  if (commonTypeDict_StringFormat_withBundleID_onceToken != -1)
    dispatch_once(&commonTypeDict_StringFormat_withBundleID_onceToken, &__block_literal_global_192);
  return (id)commonTypeDict_StringFormat_withBundleID__typedict_string;
}

void __61__PLEntryDefinition_commonTypeDict_StringFormat_withBundleID__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("BundleID");
  v3[0] = &unk_1E6ABAB38;
  v3[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_StringFormat_withBundleID__typedict_string;
  commonTypeDict_StringFormat_withBundleID__typedict_string = v0;

}

- (id)commonTypeDict_StringFormat_withAppName
{
  if (commonTypeDict_StringFormat_withAppName_onceToken != -1)
    dispatch_once(&commonTypeDict_StringFormat_withAppName_onceToken, &__block_literal_global_193);
  return (id)commonTypeDict_StringFormat_withAppName__typedict_string;
}

void __60__PLEntryDefinition_commonTypeDict_StringFormat_withAppName__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("AppName");
  v3[0] = &unk_1E6ABAB38;
  v3[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_StringFormat_withAppName__typedict_string;
  commonTypeDict_StringFormat_withAppName__typedict_string = v0;

}

- (id)commonTypeDict_StringFormat_withProcessName
{
  if (commonTypeDict_StringFormat_withProcessName_onceToken != -1)
    dispatch_once(&commonTypeDict_StringFormat_withProcessName_onceToken, &__block_literal_global_194);
  return (id)commonTypeDict_StringFormat_withProcessName__typedict_string;
}

void __64__PLEntryDefinition_commonTypeDict_StringFormat_withProcessName__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("ProcessName");
  v3[0] = &unk_1E6ABAB38;
  v3[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_StringFormat_withProcessName__typedict_string;
  commonTypeDict_StringFormat_withProcessName__typedict_string = v0;

}

- (id)commonTypeDict_DateFormat
{
  if (commonTypeDict_DateFormat_onceToken != -1)
    dispatch_once(&commonTypeDict_DateFormat_onceToken, &__block_literal_global_195);
  return (id)commonTypeDict_DateFormat__typedict_date;
}

void __46__PLEntryDefinition_commonTypeDict_DateFormat__block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("Type");
  v3[0] = &unk_1E6ABAB50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_DateFormat__typedict_date;
  commonTypeDict_DateFormat__typedict_date = v0;

}

- (id)commonTypeDict_DateFormat_isCFAbsoluteTime
{
  if (commonTypeDict_DateFormat_isCFAbsoluteTime_onceToken != -1)
    dispatch_once(&commonTypeDict_DateFormat_isCFAbsoluteTime_onceToken, &__block_literal_global_197);
  return (id)commonTypeDict_DateFormat_isCFAbsoluteTime__typedict_date;
}

void __63__PLEntryDefinition_commonTypeDict_DateFormat_isCFAbsoluteTime__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Type");
  v2[1] = CFSTR("isCFAbsoluteTime");
  v3[0] = &unk_1E6ABAB50;
  v3[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_DateFormat_isCFAbsoluteTime__typedict_date;
  commonTypeDict_DateFormat_isCFAbsoluteTime__typedict_date = v0;

}

- (id)commonTypeDict_RawDataFormat
{
  if (commonTypeDict_RawDataFormat_onceToken != -1)
    dispatch_once(&commonTypeDict_RawDataFormat_onceToken, &__block_literal_global_200);
  return (id)commonTypeDict_RawDataFormat__typedict_rawdata;
}

void __49__PLEntryDefinition_commonTypeDict_RawDataFormat__block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("Type");
  v3[0] = &unk_1E6ABAB68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonTypeDict_RawDataFormat__typedict_rawdata;
  commonTypeDict_RawDataFormat__typedict_rawdata = v0;

}

+ (void)manualSortOrderForEntryDefinition:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_ERROR, "[Error] Manual sort order keys not in table schema: %@", (uint8_t *)&v2, 0xCu);
}

@end
