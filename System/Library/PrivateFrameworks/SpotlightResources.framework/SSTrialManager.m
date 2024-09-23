@implementation SSTrialManager

- (void)loadWithUpdateHandler:(id)a3
{
  void (**v4)(id, NSString *, SSTrialManager *);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *experimentId;
  NSString *v11;
  NSString *treatmentId;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSDictionary *v31;
  NSDictionary *cachedValuesForFactor;
  void *v33;
  void *v34;
  NSString *v35;
  NSString *rolloutId;
  int v37;
  NSString *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  unint64_t v51;
  os_signpost_id_t v52;
  NSString *namespaceName;
  const __CFString *v54;
  const __CFString *v55;
  _BOOL4 hasOverride;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  NSString *v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  const __CFString *v75;
  __int16 v76;
  const __CFString *v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, NSString *, SSTrialManager *))a3;
  -[TRIClient refresh](self->_trialClient, "refresh");
  SRLogCategoryGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SSTrialManager loadWithUpdateHandler:].cold.2();

  SRLogCategoryGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SSTrialManager loadWithUpdateHandler:].cold.1((uint64_t)self, v6);

  -[TRIClient experimentIdentifiersWithNamespaceName:](self->_trialClient, "experimentIdentifiersWithNamespaceName:", self->_namespaceName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v7;
  if (v7)
  {
    v8 = v7;
    self->_hasActiveExperiment = 1;
    objc_msgSend(v7, "experimentId");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    experimentId = self->_experimentId;
    self->_experimentId = v9;

    objc_msgSend(v8, "treatmentId");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    treatmentId = self->_treatmentId;
    self->_treatmentId = v11;

    self->_experimentDeploymentId = objc_msgSend(v8, "deploymentId");
    if (!-[NSString isEqualToString:](self->_client, "isEqualToString:", CFSTR("Spotlight")))
      goto LABEL_16;
    os_unfair_lock_lock((os_unfair_lock_t)&sTrialLock);
    v13 = (void *)sCurrentActiveTrialManagers;
    if (!sCurrentActiveTrialManagers)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)sCurrentActiveTrialManagers;
      sCurrentActiveTrialManagers = v14;

      v13 = (void *)sCurrentActiveTrialManagers;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", self->_namespaceId);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      objc_msgSend((id)sCurrentActiveTrialManagers, "setObject:forKey:", self, self->_namespaceId);
  }
  else
  {
    self->_hasActiveExperiment = 0;
    v17 = self->_experimentId;
    self->_experimentId = 0;

    v18 = self->_treatmentId;
    self->_treatmentId = 0;

    self->_experimentDeploymentId = -1;
    if (!-[NSString isEqualToString:](self->_client, "isEqualToString:", CFSTR("Spotlight")))
      goto LABEL_16;
    os_unfair_lock_lock((os_unfair_lock_t)&sTrialLock);
    if (sCurrentActiveTrialManagers)
    {
      objc_msgSend((id)sCurrentActiveTrialManagers, "objectForKeyedSubscript:", self->_namespaceId);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        objc_msgSend((id)sCurrentActiveTrialManagers, "removeObjectForKey:", self->_namespaceId);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sTrialLock);
LABEL_16:
  -[TRIClient factorLevelsWithNamespaceName:](self->_trialClient, "factorLevelsWithNamespaceName:", self->_namespaceName);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v20, "count"));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v67 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v27, "factor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "level");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v30, v29);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    }
    while (v24);
  }

  pthread_rwlock_wrlock(&sTrialCacheLock);
  v31 = (NSDictionary *)objc_msgSend(v21, "copy");
  cachedValuesForFactor = self->_cachedValuesForFactor;
  self->_cachedValuesForFactor = v31;

  pthread_rwlock_unlock(&sTrialCacheLock);
  -[TRIClient rolloutIdentifiersWithNamespaceName:](self->_trialClient, "rolloutIdentifiersWithNamespaceName:", self->_namespaceName);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    self->_hasRollout = 1;
    objc_msgSend(v33, "rolloutId");
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    rolloutId = self->_rolloutId;
    self->_rolloutId = v35;

    v37 = objc_msgSend(v34, "deploymentId");
  }
  else
  {
    self->_hasRollout = 0;
    v38 = self->_rolloutId;
    self->_rolloutId = 0;

    v37 = -1;
  }
  self->_rolloutDeploymentId = v37;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  objc_msgSend(v39, "contentsOfDirectoryAtPath:error:", sTrialOverrideDirectoryPath, &v65);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v65;

  if (!v41)
  {
    v58 = v40;
    v59 = v34;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v42 = v40;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v62;
      while (2)
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v62 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("factor-%@.pb"), self->_namespaceName);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v47) = objc_msgSend(v47, "isEqualToString:", v48);

          if ((_DWORD)v47)
          {
            self->_hasOverride = 1;
            goto LABEL_37;
          }
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
        if (v44)
          continue;
        break;
      }
    }
LABEL_37:

    v34 = v59;
    v41 = 0;
    v40 = v58;
  }
  SRLogCategorySignpost();
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = v49;
  v51 = loadWithUpdateHandler__updateCount;
  v52 = ++loadWithUpdateHandler__updateCount;
  if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    namespaceName = self->_namespaceName;
    v54 = CFSTR("YES");
    if (self->_hasActiveExperiment)
      v55 = CFSTR("YES");
    else
      v55 = CFSTR("NO");
    hasOverride = self->_hasOverride;
    if (self->_hasRollout)
      v57 = CFSTR("YES");
    else
      v57 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    if (!hasOverride)
      v54 = CFSTR("NO");
    v71 = namespaceName;
    v72 = 2112;
    v73 = v55;
    v74 = 2112;
    v75 = v57;
    v76 = 2112;
    v77 = v54;
    _os_signpost_emit_with_name_impl(&dword_24798C000, v50, OS_SIGNPOST_EVENT, v52, "SRResourcesTrialUpdate", "Namespace %@: hasActiveExperiment = %@, hasRollout = %@, hasOverride = %@", buf, 0x2Au);
  }

  if (v4)
    v4[2](v4, self->_namespaceId, self);

}

+ (BOOL)didAllNamespacesLoadForClient:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  v3 = a3;
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Spotlight")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("SpotlightKnowledge")))
    {
      if ((trialFlagsForProcess() & 2) == 0)
        goto LABEL_19;
      +[SSTrialManager sharedSpotlightKnowledgeTrialManager](SSTrialManager, "sharedSpotlightKnowledgeTrialManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Mail")) || (trialFlagsForProcess() & 4) == 0)
        goto LABEL_19;
      +[SSTrialManager sharedSpotlightMailTrialManager](SSTrialManager, "sharedSpotlightMailTrialManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v12;
    v11 = objc_msgSend(v12, "wasLoadedSinceLaunch");
LABEL_25:

    goto LABEL_26;
  }
  SRLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[SSTrialManager didAllNamespacesLoadForClient:].cold.4(v4);

  SRLogCategoryGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[SSTrialManager didAllNamespacesLoadForClient:].cold.3(v5);

  SRLogCategoryGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[SSTrialManager didAllNamespacesLoadForClient:].cold.2(v6);

  SRLogCategoryGeneral();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[SSTrialManager didAllNamespacesLoadForClient:].cold.1(v7);

  if ((trialFlagsForProcess() & 1) != 0)
  {
    +[SSTrialManager sharedSpotlightModelTrialManager](SSTrialManager, "sharedSpotlightModelTrialManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "wasLoadedSinceLaunch"))
    {
      +[SSTrialManager sharedSpotlightUITrialManager](SSTrialManager, "sharedSpotlightUITrialManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "wasLoadedSinceLaunch"))
      {
        +[SSTrialManager sharedSpotlightRankingTrialManager](SSTrialManager, "sharedSpotlightRankingTrialManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "wasLoadedSinceLaunch");

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
    goto LABEL_25;
  }
LABEL_19:
  v11 = 0;
LABEL_26:

  return v11;
}

- (BOOL)wasLoadedSinceLaunch
{
  return self->_wasLoadedSinceLaunch;
}

- (id)getLevelForFactor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("codepathIDs")))
  {
    SRLogCategoryGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SSTrialManager getLevelForFactor:].cold.1();

  }
  if (!self->_hasActiveExperiment && !self->_hasRollout && !self->_hasOverride)
    goto LABEL_12;
  pthread_rwlock_rdlock(&sTrialCacheLock);
  -[NSDictionary objectForKey:](self->_cachedValuesForFactor, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(&sTrialCacheLock);
  if (!v6)
  {
    SRLogCategoryGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_24798C000, v7, OS_LOG_TYPE_INFO, "Invalid factor name input: %@", (uint8_t *)&v9, 0xCu);
    }

LABEL_12:
    v6 = 0;
  }

  return v6;
}

- (void)setWasLoadedSinceLaunch:(BOOL)a3
{
  self->_wasLoadedSinceLaunch = a3;
}

+ (id)sharedSpotlightModelTrialManager
{
  if (sharedSpotlightModelTrialManager_onceToken != -1)
    dispatch_once(&sharedSpotlightModelTrialManager_onceToken, &__block_literal_global_33);
  return (id)sharedSpotlightModelTrialManager_trialModelManager;
}

+ (id)sharedSpotlightUITrialManager
{
  if (sharedSpotlightUITrialManager_onceToken != -1)
    dispatch_once(&sharedSpotlightUITrialManager_onceToken, &__block_literal_global_34);
  return (id)sharedSpotlightUITrialManager_trialUIManager;
}

+ (id)sharedSpotlightRankingTrialManager
{
  if (sharedSpotlightRankingTrialManager_onceToken != -1)
    dispatch_once(&sharedSpotlightRankingTrialManager_onceToken, &__block_literal_global_35);
  return (id)sharedSpotlightRankingTrialManager_trialRankingManager;
}

void __49__SSTrialManager_sharedSpotlightMailTrialManager__block_invoke()
{
  SSTrialManager *v0;
  void *v1;

  if ((trialFlagsForProcess() & 4) != 0)
  {
    v0 = -[SSTrialManager initWithNameSpace:forClient:]([SSTrialManager alloc], "initWithNameSpace:forClient:", 337, CFSTR("Mail"));
    v1 = (void *)sharedSpotlightMailTrialManager_trialMailManager;
    sharedSpotlightMailTrialManager_trialMailManager = (uint64_t)v0;

  }
}

void __50__SSTrialManager_sharedSpotlightModelTrialManager__block_invoke()
{
  SSTrialManager *v0;
  void *v1;

  if ((trialFlagsForProcess() & 1) != 0)
  {
    v0 = -[SSTrialManager initWithNameSpace:forClient:]([SSTrialManager alloc], "initWithNameSpace:forClient:", 332, CFSTR("Spotlight"));
    v1 = (void *)sharedSpotlightModelTrialManager_trialModelManager;
    sharedSpotlightModelTrialManager_trialModelManager = (uint64_t)v0;

  }
}

void __47__SSTrialManager_sharedSpotlightUITrialManager__block_invoke()
{
  SSTrialManager *v0;
  void *v1;

  if ((trialFlagsForProcess() & 1) != 0)
  {
    v0 = -[SSTrialManager initWithNameSpace:forClient:]([SSTrialManager alloc], "initWithNameSpace:forClient:", 333, CFSTR("Spotlight"));
    v1 = (void *)sharedSpotlightUITrialManager_trialUIManager;
    sharedSpotlightUITrialManager_trialUIManager = (uint64_t)v0;

  }
}

void __52__SSTrialManager_sharedSpotlightRankingTrialManager__block_invoke()
{
  SSTrialManager *v0;
  void *v1;

  if ((trialFlagsForProcess() & 1) != 0)
  {
    v0 = -[SSTrialManager initWithNameSpace:forClient:]([SSTrialManager alloc], "initWithNameSpace:forClient:", 334, CFSTR("Spotlight"));
    v1 = (void *)sharedSpotlightRankingTrialManager_trialRankingManager;
    sharedSpotlightRankingTrialManager_trialRankingManager = (uint64_t)v0;

  }
}

- (SSTrialManager)initWithNameSpace:(unsigned int)a3 forClient:(id)a4
{
  uint64_t v5;
  id v7;
  int v8;
  char v9;
  int v10;
  SSTrialManager *v11;
  TRIClient *v13;
  TRIClient *trialClient;
  NSString *v15;
  NSString *namespaceId;
  NSString *v17;
  NSString *namespaceName;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  NSString *experimentId;
  NSString *v29;
  NSString *treatmentId;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSString *v35;
  NSString *v36;
  void *v37;
  void *v38;
  NSString *v39;
  NSString *rolloutId;
  int v41;
  NSString *v42;
  TRIClient *v43;
  NSString *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id location;
  objc_super v49;

  v5 = *(_QWORD *)&a3;
  v7 = a4;
  if (+[SSTrialManager isValidNamespace:forClient:](SSTrialManager, "isValidNamespace:forClient:", v5, v7))
  {
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Spotlight"));
    v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("SpotlightKnowledge"));
    v10 = objc_msgSend(v7, "isEqualToString:", CFSTR("Mail"));
    if ((v8 & 1) != 0 || (v9 & 1) != 0 || v10)
    {
      v49.receiver = self;
      v49.super_class = (Class)SSTrialManager;
      self = -[SSTrialManager init](&v49, sel_init);
      if (self)
      {
        if ((v9 & 1) != 0)
          +[SSTrialManager sharedSpotlightKnowledgeTrialClient](SSTrialManager, "sharedSpotlightKnowledgeTrialClient");
        else
          +[SSTrialManager sharedSpotlightTrialClient](SSTrialManager, "sharedSpotlightTrialClient");
        v13 = (TRIClient *)objc_claimAutoreleasedReturnValue();
        trialClient = self->_trialClient;
        self->_trialClient = v13;

        if (!self->_trialClient)
        {
          SRLogCategoryGeneral();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            -[SSTrialManager initWithNameSpace:forClient:].cold.1((uint64_t)v7, v34);

          goto LABEL_5;
        }
        objc_storeStrong((id *)&self->_client, a4);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v5);
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        namespaceId = self->_namespaceId;
        self->_namespaceId = v15;

        objc_msgSend(MEMORY[0x24BEBA990], "namespaceNameFromId:", v5);
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        namespaceName = self->_namespaceName;
        self->_namespaceName = v17;

        self->_wasLoadedSinceLaunch = 0;
        os_unfair_lock_lock((os_unfair_lock_t)&sTrialLock);
        v19 = (void *)sTrialManagerInstances;
        if (!sTrialManagerInstances)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)sTrialManagerInstances;
          sTrialManagerInstances = v20;

          v19 = (void *)sTrialManagerInstances;
        }
        objc_msgSend(v19, "objectForKeyedSubscript:", v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)sTrialManagerInstances, "setObject:forKeyedSubscript:", v23, v7);

        }
        objc_msgSend((id)sTrialManagerInstances, "objectForKeyedSubscript:", v7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", self);

        os_unfair_lock_unlock((os_unfair_lock_t)&sTrialLock);
        -[TRIClient experimentIdentifiersWithNamespaceName:](self->_trialClient, "experimentIdentifiersWithNamespaceName:", self->_namespaceName);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          self->_hasActiveExperiment = 1;
          objc_msgSend(v25, "experimentId");
          v27 = (NSString *)objc_claimAutoreleasedReturnValue();
          experimentId = self->_experimentId;
          self->_experimentId = v27;

          objc_msgSend(v26, "treatmentId");
          v29 = (NSString *)objc_claimAutoreleasedReturnValue();
          treatmentId = self->_treatmentId;
          self->_treatmentId = v29;

          self->_experimentDeploymentId = objc_msgSend(v26, "deploymentId");
          if (v8)
          {
            os_unfair_lock_lock((os_unfair_lock_t)&sTrialLock);
            v31 = (void *)sCurrentActiveTrialManagers;
            if (!sCurrentActiveTrialManagers)
            {
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = (void *)sCurrentActiveTrialManagers;
              sCurrentActiveTrialManagers = v32;

              v31 = (void *)sCurrentActiveTrialManagers;
            }
            objc_msgSend(v31, "setObject:forKey:", self, self->_namespaceId);
            os_unfair_lock_unlock((os_unfair_lock_t)&sTrialLock);
          }
        }
        else
        {
          self->_hasActiveExperiment = 0;
          v35 = self->_experimentId;
          self->_experimentId = 0;

          v36 = self->_treatmentId;
          self->_treatmentId = 0;

          self->_experimentDeploymentId = -1;
        }
        -[TRIClient rolloutIdentifiersWithNamespaceName:](self->_trialClient, "rolloutIdentifiersWithNamespaceName:", self->_namespaceName);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v37)
        {
          self->_hasRollout = 1;
          objc_msgSend(v37, "rolloutId");
          v39 = (NSString *)objc_claimAutoreleasedReturnValue();
          rolloutId = self->_rolloutId;
          self->_rolloutId = v39;

          v41 = objc_msgSend(v38, "deploymentId");
        }
        else
        {
          self->_hasRollout = 0;
          v42 = self->_rolloutId;
          self->_rolloutId = 0;

          v41 = -1;
        }
        self->_rolloutDeploymentId = v41;
        location = 0;
        objc_initWeak(&location, self);
        v43 = self->_trialClient;
        v44 = self->_namespaceName;
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __46__SSTrialManager_initWithNameSpace_forClient___block_invoke;
        v46[3] = &unk_251908600;
        objc_copyWeak(&v47, &location);
        v45 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v43, "addUpdateHandlerForNamespaceName:usingBlock:", v44, v46);
        objc_destroyWeak(&v47);
        objc_destroyWeak(&location);

      }
      self = self;
      v11 = self;
      goto LABEL_6;
    }
  }
LABEL_5:
  v11 = 0;
LABEL_6:

  return v11;
}

+ (id)sharedSpotlightTrialClient
{
  if (sharedSpotlightTrialClient_onceToken != -1)
    dispatch_once(&sharedSpotlightTrialClient_onceToken, &__block_literal_global_17);
  return (id)sharedSpotlightTrialClient_trialClient;
}

+ (BOOL)isValidNamespace:(unsigned int)a3 forClient:(id)a4
{
  id v5;
  BOOL v6;
  BOOL v7;
  char v8;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Spotlight")))
  {
    v6 = (a3 & 0xFFFFFFFC) == 332;
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("SpotlightKnowledge")))
  {
    v6 = a3 == 336;
LABEL_5:
    v7 = v6;
    goto LABEL_11;
  }
  v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("Mail"));
  if (a3 == 337)
    v7 = v8;
  else
    v7 = 0;
LABEL_11:

  return v7;
}

+ (id)sharedSpotlightMailTrialManager
{
  if (sharedSpotlightMailTrialManager_onceToken != -1)
    dispatch_once(&sharedSpotlightMailTrialManager_onceToken, &__block_literal_global_38);
  return (id)sharedSpotlightMailTrialManager_trialMailManager;
}

void __44__SSTrialManager_sharedSpotlightTrialClient__block_invoke()
{
  uint64_t v0;
  void *v1;

  if ((trialFlagsForProcess() & 5) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", 232);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)sharedSpotlightTrialClient_trialClient;
    sharedSpotlightTrialClient_trialClient = v0;

  }
}

+ (id)currentTrialManagerForClient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Spotlight")))
  {
    +[SSTrialManager resolveMultipleSpotlightExperiments](SSTrialManager, "resolveMultipleSpotlightExperiments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Mail")))
  {
    +[SSTrialManager sharedSpotlightMailTrialManager](SSTrialManager, "sharedSpotlightMailTrialManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("SpotlightKnowledge")))
    {
      SRLogCategoryGeneral();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[SSTrialManager currentTrialManagerForClient:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

      v5 = 0;
      goto LABEL_14;
    }
    +[SSTrialManager sharedSpotlightKnowledgeTrialManager](SSTrialManager, "sharedSpotlightKnowledgeTrialManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (!v4)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "hasActiveExperiment"))
    v6 = v5;
  else
    v6 = 0;
LABEL_15:
  v15 = v6;

  return v15;
}

+ (id)resolveMultipleSpotlightExperiments
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[8];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)&sTrialLock);
  if (sCurrentActiveTrialManagers)
  {
    if ((unint64_t)objc_msgSend((id)sCurrentActiveTrialManagers, "count") >= 2)
    {
      SRLogCategoryGeneral();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        +[SSTrialManager resolveMultipleSpotlightExperiments].cold.2(v2, v3, v4, v5, v6, v7, v8, v9);

    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = objc_msgSend(&unk_25190CD18, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(&unk_25190CD18);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend((id)sCurrentActiveTrialManagers, "objectForKeyedSubscript:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            SRLogCategoryGeneral();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              +[SSTrialManager resolveMultipleSpotlightExperiments].cold.1(v14, v17, v18);

            goto LABEL_18;
          }
        }
        v11 = objc_msgSend(&unk_25190CD18, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v11)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_18:
    os_unfair_lock_unlock((os_unfair_lock_t)&sTrialLock);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&sTrialLock);
    SRLogCategoryGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24798C000, v19, OS_LOG_TYPE_INFO, "No active Spotlight experiment on device", buf, 2u);
    }

    v16 = 0;
  }
  return v16;
}

void __38__SSTrialManager_setTrialOverridePath__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("com.apple.triald.namespacedescriptor.path"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v1 = (void *)MEMORY[0x24BDD17C8];
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/devOverride/"), v6);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)sTrialOverrideDirectoryPath;
    sTrialOverrideDirectoryPath = v2;
  }
  else
  {
    NSHomeDirectory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("%@/Library/Trial/NamespaceDescriptors/devOverride/"), v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)sTrialOverrideDirectoryPath;
    sTrialOverrideDirectoryPath = v4;

  }
}

+ (void)setTrialUpdateHandler:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x2495862C0](a3, a2);
  v4 = (void *)sTrialUpdateHandler_0;
  sTrialUpdateHandler_0 = v3;

}

+ (void)setTrialOverridePath
{
  if (setTrialOverridePath_onceToken != -1)
    dispatch_once(&setTrialOverridePath_onceToken, &__block_literal_global_1);
}

+ (id)sharedSpotlightKnowledgeTrialClient
{
  if (sharedSpotlightKnowledgeTrialClient_onceToken != -1)
    dispatch_once(&sharedSpotlightKnowledgeTrialClient_onceToken, &__block_literal_global_19);
  return (id)sharedSpotlightKnowledgeTrialClient_trialClient;
}

void __53__SSTrialManager_sharedSpotlightKnowledgeTrialClient__block_invoke()
{
  uint64_t v0;
  void *v1;

  if ((trialFlagsForProcess() & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", 268);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)sharedSpotlightKnowledgeTrialClient_trialClient;
    sharedSpotlightKnowledgeTrialClient_trialClient = v0;

  }
}

void __46__SSTrialManager_initWithNameSpace_forClient___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!sTrialUpdateHandler_0)
  {
    SRLogCategoryGeneral();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __46__SSTrialManager_initWithNameSpace_forClient___block_invoke_cold_1(WeakRetained, v2);

  }
  objc_msgSend(WeakRetained, "loadWithUpdateHandler:");

}

+ (id)sharedSpotlightPolicyTrialManager
{
  if (sharedSpotlightPolicyTrialManager_onceToken != -1)
    dispatch_once(&sharedSpotlightPolicyTrialManager_onceToken, &__block_literal_global_36);
  return (id)sharedSpotlightPolicyTrialManager_trialPolicyManager;
}

void __51__SSTrialManager_sharedSpotlightPolicyTrialManager__block_invoke()
{
  SSTrialManager *v0;
  void *v1;

  if ((trialFlagsForProcess() & 1) != 0)
  {
    v0 = -[SSTrialManager initWithNameSpace:forClient:]([SSTrialManager alloc], "initWithNameSpace:forClient:", 335, CFSTR("Spotlight"));
    v1 = (void *)sharedSpotlightPolicyTrialManager_trialPolicyManager;
    sharedSpotlightPolicyTrialManager_trialPolicyManager = (uint64_t)v0;

  }
}

+ (id)sharedSpotlightKnowledgeTrialManager
{
  if (sharedSpotlightKnowledgeTrialManager_onceToken != -1)
    dispatch_once(&sharedSpotlightKnowledgeTrialManager_onceToken, &__block_literal_global_37);
  return (id)sharedSpotlightKnowledgeTrialManager_trialKnowledgeManager;
}

void __54__SSTrialManager_sharedSpotlightKnowledgeTrialManager__block_invoke()
{
  SSTrialManager *v0;
  void *v1;

  if ((trialFlagsForProcess() & 2) != 0)
  {
    v0 = -[SSTrialManager initWithNameSpace:forClient:]([SSTrialManager alloc], "initWithNameSpace:forClient:", 336, CFSTR("SpotlightKnowledge"));
    v1 = (void *)sharedSpotlightKnowledgeTrialManager_trialKnowledgeManager;
    sharedSpotlightKnowledgeTrialManager_trialKnowledgeManager = (uint64_t)v0;

  }
}

- (void)refreshTrackingId
{
  -[TRIClient refresh](self->_trialClient, "refresh");
}

- (BOOL)hasActiveExperiment
{
  return self->_hasActiveExperiment;
}

- (BOOL)hasActiveRollout
{
  return self->_hasRollout;
}

- (BOOL)hasOverride
{
  return self->_hasOverride;
}

- (id)getFactorDictionary
{
  void *v3;

  pthread_rwlock_wrlock(&sTrialCacheLock);
  v3 = (void *)-[NSDictionary copy](self->_cachedValuesForFactor, "copy");
  pthread_rwlock_unlock(&sTrialCacheLock);
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("client=%@"), self->_client);
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("namespace=%@"), self->_namespaceId);
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("experiment id=%@"), self->_experimentId);
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("treatment id=%@"), self->_treatmentId);
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("rollout id=%@"), self->_rolloutId);
  objc_msgSend(v3, "addObject:", v8);

  v9 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SSTrialManager getFactorDictionary](self, "getFactorDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("factor dictionary=%@"), v10);
  objc_msgSend(v3, "addObject:", v11);

  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  v13 = objc_opt_class();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("<%@:%p; %@>"), v13, self, v14);

  return v15;
}

+ (id)getTTRLogsForClient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&sTrialLock);
  if (sTrialManagerInstances)
  {
    objc_msgSend((id)sTrialManagerInstances, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend((id)sTrialManagerInstances, "objectForKeyedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v5, "copy");

    }
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sTrialLock);
  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("\nTrial A/B info:\n"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "description");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("%@\n"), v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)client
{
  return self->_client;
}

- (NSString)namespaceId
{
  return self->_namespaceId;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (int)experimentDeploymentId
{
  return self->_experimentDeploymentId;
}

- (int)rolloutDeploymentId
{
  return self->_rolloutDeploymentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_namespaceId, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_cachedValuesForFactor, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

- (void)initWithNameSpace:(uint64_t)a1 forClient:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_24798C000, a2, OS_LOG_TYPE_ERROR, "Process not on whitelist for client %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __46__SSTrialManager_initWithNameSpace_forClient___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "namespaceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_24798C000, a2, OS_LOG_TYPE_ERROR, "Trial update handler is not set when initializing Trial manager for namespace %@ and client %@", (uint8_t *)&v6, 0x16u);

}

+ (void)currentTrialManagerForClient:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_24798C000, a1, a3, "Invalid client name for currentTrialManagerForClient", a5, a6, a7, a8, 0);
}

- (void)getLevelForFactor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_24798C000, v0, v1, "Fetching codepathIDs from namespace %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)loadWithUpdateHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = CFSTR("YES");
  if (*(_BYTE *)(a1 + 32))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = *(unsigned __int8 *)(a1 + 34);
  if (*(_BYTE *)(a1 + 33))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = 138413058;
  if (!v5)
    v3 = CFSTR("NO");
  v8 = v2;
  v9 = 2112;
  v10 = v4;
  v11 = 2112;
  v12 = v6;
  v13 = 2112;
  v14 = v3;
  _os_log_debug_impl(&dword_24798C000, a2, OS_LOG_TYPE_DEBUG, "Before loading namespace %@: _hasActiveExperiment = %@, _hasRollout = %@, _hasOverride = %@", (uint8_t *)&v7, 0x2Au);
}

- (void)loadWithUpdateHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_24798C000, v0, v1, "Loading Trial namespace %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)resolveMultipleSpotlightExperiments
{
  OUTLINED_FUNCTION_5(&dword_24798C000, a1, a3, "More than one active Spotlight experiment on device, resolving", a5, a6, a7, a8, 0);
}

+ (void)didAllNamespacesLoadForClient:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v1;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[SSTrialManager sharedSpotlightPolicyTrialManager](SSTrialManager, "sharedSpotlightPolicyTrialManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(v3, v4);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_24798C000, a1, v5, "SPOLIGHT_RANKING_POLICY = %@", v6);

  OUTLINED_FUNCTION_7();
}

+ (void)didAllNamespacesLoadForClient:(NSObject *)a1 .cold.2(NSObject *a1)
{
  void *v1;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[SSTrialManager sharedSpotlightRankingTrialManager](SSTrialManager, "sharedSpotlightRankingTrialManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(v3, v4);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_24798C000, a1, v5, "SPOLIGHT_RANKING_RULES = %@", v6);

  OUTLINED_FUNCTION_7();
}

+ (void)didAllNamespacesLoadForClient:(NSObject *)a1 .cold.3(NSObject *a1)
{
  void *v1;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[SSTrialManager sharedSpotlightUITrialManager](SSTrialManager, "sharedSpotlightUITrialManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(v3, v4);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_24798C000, a1, v5, "SPOLIGHT_UI = %@", v6);

  OUTLINED_FUNCTION_7();
}

+ (void)didAllNamespacesLoadForClient:(NSObject *)a1 .cold.4(NSObject *a1)
{
  void *v1;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[SSTrialManager sharedSpotlightModelTrialManager](SSTrialManager, "sharedSpotlightModelTrialManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(v3, v4);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_24798C000, a1, v5, "SPOLIGHT_BLENDING_MODEL = %@", v6);

  OUTLINED_FUNCTION_7();
}

@end
