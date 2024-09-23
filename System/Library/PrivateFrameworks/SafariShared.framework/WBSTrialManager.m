@implementation WBSTrialManager

- (void)fetchFactorsInNamespace:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD block[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[WBSTrialManager queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[WBSTrialManager trialClient](self, "trialClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "factorLevelsWithNamespaceName:", CFSTR("SAFARI_SEARCH_RANKING"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasFactor") && objc_msgSend(v12, "hasLevel"))
        {
          objc_msgSend(v12, "level");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "factor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v15);

          objc_msgSend(v12, "level");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSTrialManager getFactorValueAsString:](self, "getFactorValueAsString:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v12, "factor");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v17, v19);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v9);
  }

  -[WBSTrialManager trialClient](self, "trialClient");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "experimentIdentifiersWithNamespaceName:", CFSTR("SAFARI_SEARCH_RANKING"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    os_unfair_lock_lock(&self->_lock);
    -[WBSTrialManager setFactors:](self, "setFactors:", v5);
    objc_msgSend(v21, "experimentId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTrialManager setExperimentId:](self, "setExperimentId:", v22);

    objc_msgSend(v21, "treatmentId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTrialManager setTreatmentId:](self, "setTreatmentId:", v23);

    -[WBSTrialManager setReady:](self, "setReady:", 1);
    os_unfair_lock_unlock(&self->_lock);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__WBSTrialManager_fetchFactorsInNamespace___block_invoke;
    block[3] = &unk_1E4B2A078;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[WBSTrialManager experimentId](self, "experimentId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTrialManager treatmentId](self, "treatmentId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v29;
    -[WBSTrialManager prepareLogDictionary:withExperimentId:withTreatmentId:isCounterFactualSearch:withFactorData:](self, "prepareLogDictionary:withExperimentId:withTreatmentId:isCounterFactualSearch:withFactorData:", 1, v24, v25, -[WBSTrialManager isCFEnabled](self, "isCFEnabled"), v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTrialManager registerDiagnosticInfo:](self, "registerDiagnosticInfo:", v27);

  }
  else
  {
    -[WBSTrialManager prepareLogDictionary:withExperimentId:withTreatmentId:isCounterFactualSearch:withFactorData:](self, "prepareLogDictionary:withExperimentId:withTreatmentId:isCounterFactualSearch:withFactorData:", 0, 0, 0, 0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTrialManager registerDiagnosticInfo:](self, "registerDiagnosticInfo:", v28);

    v26 = v29;
  }

}

- (id)getFactorValueAsString:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = CFSTR("Unsupported value parsing");
  switch(objc_msgSend(v3, "levelOneOfCase"))
  {
    case 0xAu:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "BOOLeanValue"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 0xBu:
      objc_msgSend(v3, "stringValue");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xDu:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v3, "longValue"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 0xFu:
      v6 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "doubleValue");
      objc_msgSend(v6, "numberWithDouble:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v7 = v5;
      objc_msgSend(v5, "stringValue");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }

  return v4;
}

void __23__WBSTrialManager_init__block_invoke(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "trialClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 231);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTrialClient:", v5);

    }
    objc_msgSend(v3, "fetchFactorsInNamespace:", CFSTR("SAFARI_SEARCH_RANKING"));
    objc_msgSend(v3, "trialClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v3[5];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __23__WBSTrialManager_init__block_invoke_2;
    v9[3] = &unk_1E4B40450;
    objc_copyWeak(&v10, v1);
    v8 = (id)objc_msgSend(v6, "addUpdateHandlerForNamespaceName:queue:usingBlock:", CFSTR("SAFARI_SEARCH_RANKING"), v7, v9);

    objc_destroyWeak(&v10);
  }

}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (void)registerDiagnosticInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  WBSDiagnosticStateCollector *v7;
  WBSDiagnosticStateCollector *stateCollector;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D89BD8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__WBSTrialManager_registerDiagnosticInfo___block_invoke;
  v9[3] = &unk_1E4B29A28;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "registeredStateCollectorWithLogLabel:payloadProvider:", CFSTR("Trial experiment state"), v9);
  v7 = (WBSDiagnosticStateCollector *)objc_claimAutoreleasedReturnValue();
  stateCollector = self->_stateCollector;
  self->_stateCollector = v7;

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)prepareLogDictionary:(BOOL)a3 withExperimentId:(id)a4 withTreatmentId:(id)a5 isCounterFactualSearch:(BOOL)a6 withFactorData:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  _QWORD v22[4];
  _QWORD v23[5];

  v8 = a6;
  v10 = a3;
  v23[4] = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  v13 = a7;
  v14 = v13;
  if (v10)
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v15, 4);

    }
    else
    {
      v16 = CFSTR("No factor data available");
    }
    v18 = CFSTR("Unknown Experiment ID");
    if (v11)
      v18 = v11;
    v22[0] = CFSTR("Experiment ID");
    v22[1] = CFSTR("Treatment ID");
    v19 = CFSTR("Unknown Treatment ID");
    if (v12)
      v19 = v12;
    v23[0] = v18;
    v23[1] = v19;
    v20 = CFSTR("NO");
    if (v8)
      v20 = CFSTR("YES");
    v22[2] = CFSTR("Counterfactual experiment");
    v22[3] = CFSTR("Factors");
    v23[2] = v20;
    v23[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = &unk_1E4B87828;
  }

  return v17;
}

void __25__WBSTrialManager_shared__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;

}

- (WBSTrialManager)init
{
  void *v3;
  char v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  WBSTrialManager *v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("WBSDisableTrial"));

  if ((v4 & 1) != 0
    || (v13.receiver = self,
        v13.super_class = (Class)WBSTrialManager,
        (self = -[WBSTrialManager init](&v13, sel_init)) == 0))
  {
    v8 = 0;
  }
  else
  {
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SafariShared.WBSTrial", 0);
    queue = self->_queue;
    self->_queue = v5;

    self->_lock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, self);
    v7 = self->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __23__WBSTrialManager_init__block_invoke;
    v10[3] = &unk_1E4B2BC78;
    objc_copyWeak(&v11, &location);
    dispatch_async(v7, v10);
    self = self;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    v8 = self;
  }

  return v8;
}

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__WBSTrialManager_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  return (id)shared_shared;
}

- (unint64_t)trialABGroupIdentifier
{
  void *v3;
  void *v4;
  int v5;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;

  -[WBSTrialManager numberFactorWithName:](self, "numberFactorWithName:", CFSTR("enableStreamlinedCompletionList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    -[WBSTrialManager numberFactorWithName:](self, "numberFactorWithName:", CFSTR("enableLabelPreviousSearchesInCompletionList"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (!v5)
      return 21;
  }
  else
  {

  }
  -[WBSTrialManager numberFactorWithName:](self, "numberFactorWithName:", CFSTR("enableStreamlinedCompletionList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "BOOLValue"))
  {

  }
  else
  {
    -[WBSTrialManager numberFactorWithName:](self, "numberFactorWithName:", CFSTR("enableLabelPreviousSearchesInCompletionList"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) != 0)
      return 22;
  }
  -[WBSTrialManager numberFactorWithName:](self, "numberFactorWithName:", CFSTR("enableStreamlinedCompletionList"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "BOOLValue") & 1) != 0)
  {
    -[WBSTrialManager numberFactorWithName:](self, "numberFactorWithName:", CFSTR("enableLabelPreviousSearchesInCompletionList"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if ((v12 & 1) != 0)
      return 23;
  }
  else
  {

  }
  return -[WBSTrialManager _weightedRandomIdentifier](self, "_weightedRandomIdentifier") + 20;
}

- (unint64_t)_weightedRandomIdentifier
{
  unint64_t result;

  result = (unint64_t)((double)random() * 2.32830644e-10 * 100.0);
  if (result && result - 4 >= 3)
  {
    if (result - 7 >= 5)
    {
      if (result - 12 < 5)
        return 8;
      else
        return 9;
    }
    else
    {
      return 7;
    }
  }
  return result;
}

void __23__WBSTrialManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "namespaceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "fetchFactorsInNamespace:", v4);

  }
}

- (BOOL)isReady
{
  return self->_customFactorsDictionary || -[WBSTrialManager ready](self, "ready");
}

- (BOOL)isCFEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[WBSTrialManager numberFactorWithName:](self, "numberFactorWithName:", CFSTR("CF_enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)runCFFlow
{
  WBSTrialManager *v2;
  void *v3;
  void *v4;
  NSMutableDictionary *customFactorsDictionary;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  WBSTrialManager *v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v2 = self;
  v29 = *MEMORY[0x1E0C80C00];
  if (!-[WBSTrialManager isCFEnabled](self, "isCFEnabled"))
    return 0;
  -[WBSTrialManager factors](v2, "factors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  customFactorsDictionary = v2->_customFactorsDictionary;
  if (customFactorsDictionary)
  {
    -[NSMutableDictionary allKeys](customFactorsDictionary, "allKeys");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    v11 = CFSTR("CFSearchTimeout");
    v12 = CFSTR("_cf");
    v23 = v7;
    v13 = 1;
LABEL_6:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v10)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
      if ((objc_msgSend(v15, "isEqualToString:", v11) & 1) == 0
        && (objc_msgSend(v15, "isEqualToString:", CFSTR("CF_enabled")) & 1) == 0
        && (objc_msgSend(v15, "hasSuffix:", v12) & 1) == 0)
      {
        -[WBSTrialManager numberFactorWithName:](v2, "numberFactorWithName:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSTrialManager getRetrievalFactorName:forCF:](v2, "getRetrievalFactorName:forCF:", v15, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSTrialManager numberFactorWithName:](v2, "numberFactorWithName:", v17);
        v18 = v12;
        v19 = v11;
        v20 = v2;
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v17) = objc_msgSend(v16, "isEqualToNumber:", v21);
        v2 = v20;
        v11 = v19;
        v12 = v18;

        v7 = v23;
        if (!(_DWORD)v17)
          break;
      }
      if (v9 == ++v14)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v9)
          goto LABEL_6;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    v13 = 0;
  }

  return v13;
}

- (double)CFSearchTimeoutForDefault:(double)a3
{
  void *v4;
  void *v5;
  float v6;

  -[WBSTrialManager numberFactorWithName:](self, "numberFactorWithName:", CFSTR("CFSearchTimeout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    a3 = v6;
  }

  return a3;
}

- (BOOL)inExperiment
{
  void *v3;
  BOOL v4;

  if (!-[WBSTrialManager isReady](self, "isReady"))
    return 0;
  -[WBSTrialManager treatmentId](self, "treatmentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

void __43__WBSTrialManager_fetchFactorsInNamespace___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x1E0D89FD0], *(_QWORD *)(a1 + 32));

}

- (id)factorWithName:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[WBSTrialManager factors](self, "factors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (WBSTrialIdentifiers)identifiers
{
  WBSTrialIdentifiers *v3;
  WBSTrialIdentifiers *v4;
  WBSTrialIdentifiers *v5;

  v3 = objc_alloc_init(WBSTrialIdentifiers);
  -[WBSTrialIdentifiers setNamespaceName:](v3, "setNamespaceName:", CFSTR("SAFARI_SEARCH_RANKING"));
  os_unfair_lock_lock(&self->_lock);
  if (self->_treatmentId)
  {
    -[WBSTrialIdentifiers setExperimentId:](v3, "setExperimentId:", self->_experimentId);
    -[WBSTrialIdentifiers setTreatmentId:](v3, "setTreatmentId:", self->_treatmentId);
  }
  os_unfair_lock_unlock(&self->_lock);
  if (self->_customFactorsDictionary)
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (void)setFactorWithName:(id)a3 value:(id)a4
{
  id v6;
  NSMutableDictionary *customFactorsDictionary;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  customFactorsDictionary = self->_customFactorsDictionary;
  if (!customFactorsDictionary)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_customFactorsDictionary;
    self->_customFactorsDictionary = v8;

    customFactorsDictionary = self->_customFactorsDictionary;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](customFactorsDictionary, "setObject:forKeyedSubscript:", v6, v10);

}

- (id)numberFactorWithName:(id)a3
{
  NSMutableDictionary *customFactorsDictionary;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  customFactorsDictionary = self->_customFactorsDictionary;
  if (!customFactorsDictionary)
  {
    -[WBSTrialManager factorWithName:](self, "factorWithName:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "levelOneOfCase");
      switch(v8)
      {
        case 15:
          v10 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "doubleValue");
          objc_msgSend(v10, "numberWithDouble:");
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        case 13:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v7, "longValue"));
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        case 10:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "BOOLeanValue"));
          v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
          v5 = (void *)v9;
          goto LABEL_12;
      }
    }
    v5 = 0;
LABEL_12:

    return v5;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](customFactorsDictionary, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)stringFactorWithName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[WBSTrialManager factorWithName:](self, "factorWithName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "levelOneOfCase") == 11)
  {
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getRetrievalFactorName:(id)a3 forCF:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("_cf"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (BOOL)getBoolFactor:(id)a3 forCF:(BOOL)a4 forDefault:(BOOL)a5
{
  void *v7;
  void *v8;

  -[WBSTrialManager getRetrievalFactorName:forCF:](self, "getRetrievalFactorName:forCF:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSTrialManager numberFactorWithName:](self, "numberFactorWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    a5 = objc_msgSend(v8, "BOOLValue");

  return a5;
}

- (int64_t)getIntFactor:(id)a3 forCF:(BOOL)a4 forDefault:(int64_t)a5
{
  void *v7;
  void *v8;

  -[WBSTrialManager getRetrievalFactorName:forCF:](self, "getRetrievalFactorName:forCF:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSTrialManager numberFactorWithName:](self, "numberFactorWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    a5 = objc_msgSend(v8, "integerValue");

  return a5;
}

- (double)getFloatFactor:(id)a3 forCF:(BOOL)a4 forDefault:(double)a5
{
  void *v7;
  void *v8;
  float v9;

  -[WBSTrialManager getRetrievalFactorName:forCF:](self, "getRetrievalFactorName:forCF:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSTrialManager numberFactorWithName:](self, "numberFactorWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "floatValue");
    a5 = v9;
  }

  return a5;
}

id __42__WBSTrialManager_registerDiagnosticInfo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSDictionary)factors
{
  return self->_factors;
}

- (void)setFactors:(id)a3
{
  objc_storeStrong((id *)&self->_factors, a3);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)ready
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_factors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_stateCollector, 0);
  objc_storeStrong((id *)&self->_customFactorsDictionary, 0);
}

@end
