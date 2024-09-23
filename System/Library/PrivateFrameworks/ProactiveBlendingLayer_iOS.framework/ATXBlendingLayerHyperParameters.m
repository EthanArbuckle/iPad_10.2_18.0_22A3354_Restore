@implementation ATXBlendingLayerHyperParameters

- (id)clientModelsToConsiderForConsumerSubType:(unsigned __int8)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BE042A8], "stringForConsumerSubtype:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[ATXBlendingLayerHyperParameters sharedInstance](ATXBlendingLayerHyperParameters, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientModelsToConsiderForConsumerSubType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = v7;
    else
      v8 = (id)objc_opt_new();
    v10 = v8;

  }
  else
  {
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXBlendingLayerHyperParameters clientModelsToConsiderForConsumerSubType:].cold.1(a3, v9);

    v10 = (void *)objc_opt_new();
  }

  return v10;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global);
  return (id)sharedInstance__pasExprOnceResult;
}

- (id)clientModelsToConsiderForConsumerSubType
{
  NSDictionary *clientModelsToConsiderForConsumerSubType;
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  _QWORD v10[4];
  NSDictionary *v11;

  clientModelsToConsiderForConsumerSubType = self->_clientModelsToConsiderForConsumerSubType;
  if (!clientModelsToConsiderForConsumerSubType)
  {
    -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("ClientModelsToConsiderForConsumerSubType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __75__ATXBlendingLayerHyperParameters_clientModelsToConsiderForConsumerSubType__block_invoke;
    v10[3] = &unk_24D47FCE8;
    v6 = v5;
    v11 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = self->_clientModelsToConsiderForConsumerSubType;
    self->_clientModelsToConsiderForConsumerSubType = v6;
    v8 = v6;

    clientModelsToConsiderForConsumerSubType = self->_clientModelsToConsiderForConsumerSubType;
  }
  return clientModelsToConsiderForConsumerSubType;
}

- (ATXBlendingLayerHyperParameters)init
{
  ATXBlendingLayerHyperParameters *v2;
  uint64_t v3;
  NSDictionary *parameters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXBlendingLayerHyperParameters;
  v2 = -[ATXBlendingLayerHyperParameters init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE04108], "dictionaryWithLegacyPathForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v3;

  }
  return v2;
}

+ (id)abHelperWithTrialAssets
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE04108], "dictionaryForClass:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04110]), "initWithAssetContents:", v2);

  return v3;
}

+ (id)abHelperWithMobileAssets
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BE04108];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawDictionaryUsingMobileAssetsForResource:ofType:", v4, CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04110]), "initWithAssetContents:", v5);
  return v6;
}

- (id)initForTestingWithTrialAssetsOnly
{
  ATXBlendingLayerHyperParameters *v2;
  uint64_t v3;
  NSDictionary *parameters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXBlendingLayerHyperParameters;
  v2 = -[ATXBlendingLayerHyperParameters init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE04108], "dictionaryWithLegacyPathForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v3;

  }
  return v2;
}

- (id)initForTestingWithMobileAssetAssetsOnly
{
  ATXBlendingLayerHyperParameters *v2;
  uint64_t v3;
  NSDictionary *parameters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXBlendingLayerHyperParameters;
  v2 = -[ATXBlendingLayerHyperParameters init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE04108], "dictionaryWithLegacyPathForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v3;

  }
  return v2;
}

void __49__ATXBlendingLayerHyperParameters_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2199F1618]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)abGroup
{
  return -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("abGroup"));
}

- (double)sessionLogSamplingRate
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("SessionLogSamplingRate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)maxAgeOfStackSuggestionToConsiderStaleInSeconds
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("MaxAgeOfStackSuggestionToConsiderStaleInSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (unint64_t)lohStacksToConsiderAboveAndBelowForDeduplication
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("LOHStacksToConsiderAboveAndBelowForDeduplication"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (BOOL)isSuggestionEligibleForSuggestionsWidget:(id)a3
{
  return -[ATXBlendingLayerHyperParameters uiSupportsSuggestion:consumerSubType:](self, "uiSupportsSuggestion:consumerSubType:", a3, 36);
}

- (BOOL)isSuggestionEligibleForAppPredictionPanel:(id)a3
{
  return -[ATXBlendingLayerHyperParameters uiSupportsSuggestion:consumerSubType:](self, "uiSupportsSuggestion:consumerSubType:", a3, 37);
}

- (id)clientModelPriorityOrder
{
  return -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("ClientModelPriorityOrder"));
}

void __75__ATXBlendingLayerHyperParameters_clientModelsToConsiderForConsumerSubType__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BDBCF20];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithArray:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);
}

- (BOOL)uiSupportsSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[ATXBlendingLayerHyperParameters uiConfidenceLevelMetBySuggestion:](self, "uiConfidenceLevelMetBySuggestion:", v6)&& -[ATXBlendingLayerHyperParameters uiSupportsClientModelIdForSuggestion:consumerSubType:](self, "uiSupportsClientModelIdForSuggestion:consumerSubType:", v6, v4)&& -[ATXBlendingLayerHyperParameters uiSupportsExecutableTypeForSuggestion:consumerSubType:](self, "uiSupportsExecutableTypeForSuggestion:consumerSubType:", v6, v4)&& -[ATXBlendingLayerHyperParameters uiIsEnabledForSuggestion:consumerSubType:](self, "uiIsEnabledForSuggestion:consumerSubType:", v6, v4))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v6, "uiSpecification", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredLayoutConfigs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          if (-[ATXBlendingLayerHyperParameters uiSupportsLayoutType:consumerSubType:](self, "uiSupportsLayoutType:consumerSubType:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "applicableLayoutType"), v4))
          {
            v13 = 1;
            goto LABEL_17;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_17:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)uiConfidenceLevelMetBySuggestion:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "scoreSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "suggestedConfidenceCategory");
  LOBYTE(self) = v5 >= -[ATXBlendingLayerHyperParameters minConfidenceCategoryToConsider](self, "minConfidenceCategoryToConsider");

  return (char)self;
}

- (BOOL)uiSupportsClientModelIdForSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a4;
  v6 = a3;
  -[ATXBlendingLayerHyperParameters clientModelsToConsiderForConsumerSubType:](self, "clientModelsToConsiderForConsumerSubType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientModelSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "clientModelId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "containsObject:", v9);

  return v10;
}

- (BOOL)uiSupportsLayoutType:(int64_t)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[ATXBlendingLayerHyperParameters layoutsToConsiderForConsumerSubType:](self, "layoutsToConsiderForConsumerSubType:", a4);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v20 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BE79B58], "minSuggestionLayoutTypesForUILayoutType:", objc_msgSend(v8, "integerValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "integerValue");

        if (v12 > 0)
          goto LABEL_11;
        objc_msgSend(MEMORY[0x24BE79B58], "maxSuggestionLayoutTypesForUILayoutType:", objc_msgSend(v8, "integerValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");

        if (v16 > 0)
        {
LABEL_11:
          v17 = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v17 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_13:

  return v17;
}

- (BOOL)uiSupportsExecutableTypeForSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  -[ATXBlendingLayerHyperParameters executableTypesToConsiderForConsumerSubType:](self, "executableTypesToConsiderForConsumerSubType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "executableSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "executableType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v7, "containsObject:", v10);

  return (char)v6;
}

- (BOOL)uiIsEnabledForSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4
{
  int v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  char v9;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  v7 = 1;
  if (v4 > 33)
  {
    if (v4 == 37 || v4 == 36 || v4 == 34)
    {
      objc_msgSend(v5, "uiSpecification");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "allowedOnHomeScreen");
      goto LABEL_11;
    }
  }
  else
  {
    if (v4 == 9 || v4 == 21)
    {
      objc_msgSend(v5, "uiSpecification");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "allowedOnSpotlight");
      goto LABEL_11;
    }
    if (v4 == 22)
    {
      objc_msgSend(v5, "uiSpecification");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "allowedOnLockscreen");
LABEL_11:
      v7 = v9;

    }
  }

  return v7;
}

- (id)executableTypesToConsiderForConsumerSubType:(unsigned __int8)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  switch(a3)
  {
    case 0x15u:
      v3 = (void *)MEMORY[0x2199F1618](self, a2);
      v4 = objc_alloc(MEMORY[0x24BDBCF20]);
      v14 = &unk_24D480C08;
      v15 = 0;
      v12 = &unk_24D480BC0;
      v13 = &unk_24D480BF0;
      goto LABEL_7;
    case 0x16u:
    case 0x29u:
    case 0x2Cu:
    case 0x2Eu:
      v3 = (void *)MEMORY[0x2199F1618](self, a2);
      v4 = objc_alloc(MEMORY[0x24BDBCF20]);
      v12 = 0;
LABEL_7:
      v6 = &unk_24D480B78;
      goto LABEL_16;
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x20u:
    case 0x21u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
      goto LABEL_5;
    case 0x1Fu:
    case 0x23u:
    case 0x25u:
      goto LABEL_4;
    case 0x22u:
      v3 = (void *)MEMORY[0x2199F1618](self, a2);
      v4 = objc_alloc(MEMORY[0x24BDBCF20]);
      v16 = &unk_24D480BD8;
      v17 = 0;
      v7 = &unk_24D480BC0;
      v8 = &unk_24D480BA8;
      goto LABEL_13;
    case 0x24u:
      v3 = (void *)MEMORY[0x2199F1618](self, a2);
      v4 = objc_alloc(MEMORY[0x24BDBCF20]);
      v14 = &unk_24D480BD8;
      v15 = 0;
      v9 = &unk_24D480BC0;
      goto LABEL_14;
    case 0x2Au:
      v3 = (void *)MEMORY[0x2199F1618](self, a2);
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", &unk_24D480C20, 0, v13, v14, v15, v16, v17);
      goto LABEL_17;
    case 0x2Bu:
      v3 = (void *)MEMORY[0x2199F1618](self, a2);
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", &unk_24D480C38, 0, v13, v14, v15, v16, v17);
      goto LABEL_17;
    case 0x2Du:
      v3 = (void *)MEMORY[0x2199F1618](self, a2);
      v4 = objc_alloc(MEMORY[0x24BDBCF20]);
      v16 = 0;
      v7 = &unk_24D480BD8;
      v8 = &unk_24D480C20;
LABEL_13:
      v14 = v8;
      v15 = v7;
      v9 = &unk_24D480B90;
LABEL_14:
      v12 = &unk_24D480B78;
      v13 = v9;
      goto LABEL_15;
    case 0x2Fu:
      v3 = (void *)MEMORY[0x2199F1618](self, a2);
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", &unk_24D480B90, 0, v13, v14, v15, v16, v17);
      goto LABEL_17;
    default:
      if (a3 == 9)
      {
LABEL_4:
        v3 = (void *)MEMORY[0x2199F1618](self, a2);
        v4 = objc_alloc(MEMORY[0x24BDBCF20]);
        v12 = 0;
LABEL_15:
        v6 = &unk_24D480B60;
LABEL_16:
        v10 = objc_msgSend(v4, "initWithObjects:", v6, v12, v13, v14, v15, v16, v17);
LABEL_17:
        v5 = (void *)v10;
        objc_autoreleasePoolPop(v3);
      }
      else
      {
LABEL_5:
        v5 = (void *)objc_opt_new();
      }
      return v5;
  }
}

- (id)consumerSubTypesToConsiderForClientModelIds:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    +[ATXBlendingLayerHyperParameters sharedInstance](ATXBlendingLayerHyperParameters, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientModelsToConsiderForConsumerSubType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_opt_new();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __79__ATXBlendingLayerHyperParameters_consumerSubTypesToConsiderForClientModelIds___block_invoke;
    v11[3] = &unk_24D47FD10;
    v12 = v3;
    v7 = v6;
    v13 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);
    v8 = v13;
    v9 = v7;

  }
  else
  {
    v9 = (id)objc_opt_new();
  }

  return v9;
}

void __79__ATXBlendingLayerHyperParameters_consumerSubTypesToConsiderForClientModelIds___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i)))
        {
          v14 = 0;
          v11 = objc_msgSend(MEMORY[0x24BE042A8], "consumerSubtypeForString:found:", v5, &v14);
          if (v14)
          {
            v12 = *(void **)(a1 + 40);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v13);

          }
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

}

- (id)layoutsToConsiderForConsumerSubType:(unsigned __int8)a3
{
  id result;

  result = &unk_24D480D50;
  switch(a3)
  {
    case 0x15u:
    case 0x16u:
    case 0x29u:
    case 0x2Bu:
    case 0x2Cu:
      result = &unk_24D480DB0;
      break;
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x20u:
    case 0x21u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
      goto LABEL_6;
    case 0x1Fu:
    case 0x23u:
      result = &unk_24D480DE0;
      break;
    case 0x22u:
      return result;
    case 0x24u:
      result = &unk_24D480D80;
      break;
    case 0x25u:
      result = &unk_24D480D68;
      break;
    case 0x2Au:
      result = &unk_24D480DC8;
      break;
    case 0x2Du:
      result = &unk_24D480DF8;
      break;
    case 0x2Eu:
      result = &unk_24D480E10;
      break;
    case 0x2Fu:
      result = &unk_24D480E28;
      break;
    default:
      if (a3 == 9)
        result = &unk_24D480D98;
      else
LABEL_6:
        result = (id)MEMORY[0x24BDBD1A8];
      break;
  }
  return result;
}

- (int64_t)minConfidenceCategoryToConsider
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelsToConsiderForConsumerSubType, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)clientModelsToConsiderForConsumerSubType:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_215D87000, a2, OS_LOG_TYPE_FAULT, "Asked for allowed client model ids for unsupported consumer sub type %hhu", (uint8_t *)v2, 8u);
}

@end
