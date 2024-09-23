@implementation FedStatsDataCohort

- (FedStatsDataCohort)init
{
  FedStatsDataCohort *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSDictionary *namespaceMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FedStatsDataCohort;
  v2 = -[FedStatsDataCohort init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("FedStatsCohortAllowList"), CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    namespaceMap = v2->_namespaceMap;
    v2->_namespaceMap = (NSDictionary *)v5;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__FedStatsDataCohort_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_154 != -1)
    dispatch_once(&sharedInstance_onceToken_154, block);
  return (id)sharedInstance_sharedDataCohortInstance;
}

void __36__FedStatsDataCohort_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedDataCohortInstance;
  sharedInstance_sharedDataCohortInstance = (uint64_t)v1;

}

+ (BOOL)checkCohortField:(id)a3 forNamespaceID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  v6 = a4;
  +[FedStatsDataCohort sharedInstance](FedStatsDataCohort, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "namespaceMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "containsObject:", v5);
  else
    v10 = 0;

  return v10;
}

+ (id)keysForCohorts:(id)a3 namespaceID:(id)a4 parameters:(id)a5 possibleError:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void **v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  void *v35;
  id v36;
  id *v37;
  id v38;
  id obj;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v40 = a5;
  +[FedStatsDataCohort sharedInstance](FedStatsDataCohort, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "namespaceMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v37 = a6;
    v38 = v10;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v9;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v43;
      v35 = v11;
      v36 = v9;
LABEL_4:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v18);
        if ((objc_msgSend(v13, "containsObject:", v19) & 1) == 0)
          break;
        +[FedStatsCohortFactory cohortQueryFieldByName:](FedStatsCohortFactory, "cohortQueryFieldByName:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v9 = v36;
          v29 = v37;
          v10 = v38;
          if (v37)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\" cohort is not implemented."), v19, v34);
LABEL_25:
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, v30);
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = *v29;
            *v29 = (void *)v31;

          }
          goto LABEL_26;
        }
        v21 = v20;
        v41 = 0;
        objc_msgSend(v20, "cohortKeyForParameters:possibleError:", v40, &v41);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PFLLog framework](_PFLLog, "framework");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v47 = v19;
          v48 = 2112;
          v49 = v22;
          v50 = 2112;
          v51 = v38;
          _os_log_debug_impl(&dword_213C25000, v23, OS_LOG_TYPE_DEBUG, "cohortName:cohortKey => %@=%@ for namespace %@", buf, 0x20u);
        }

        if (v41)
        {
          +[_PFLLog framework](_PFLLog, "framework");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v47 = v19;
            v48 = 2112;
            v49 = v41;
            _os_log_debug_impl(&dword_213C25000, v24, OS_LOG_TYPE_DEBUG, "\"%@\" cohort error while creating the key: %@", buf, 0x16u);
          }

        }
        objc_msgSend(v14, "addObject:", v22);

        if (v16 == ++v18)
        {
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          v11 = v35;
          v9 = v36;
          if (v16)
            goto LABEL_4;
          goto LABEL_17;
        }
      }
      v9 = v36;
      v29 = v37;
      v10 = v38;
      if (v37)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\" cohort is not approved for \"%@\" namespace."), v19, v38);
        goto LABEL_25;
      }
LABEL_26:

      v25 = 0;
      v11 = v35;
      goto LABEL_27;
    }
LABEL_17:

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v38;
LABEL_27:

  }
  else
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\" namespace is invalid."), v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *a6;
      *a6 = v27;

    }
    v25 = 0;
  }

  return v25;
}

- (NSDictionary)namespaceMap
{
  return self->_namespaceMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceMap, 0);
}

@end
