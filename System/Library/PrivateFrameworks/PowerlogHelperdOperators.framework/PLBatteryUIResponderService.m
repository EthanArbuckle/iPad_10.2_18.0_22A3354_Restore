@implementation PLBatteryUIResponderService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBatteryUIResponderService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)initOperatorDependancies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponderService setRequestedObjects:](self, "setRequestedObjects:", v3);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponderService setResponseCache:](self, "setResponseCache:", v4);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponderService setSharedUtilityCache:](self, "setSharedUtilityCache:", v5);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponderService setResultDictionary:](self, "setResultDictionary:", v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponderService setOrderOfExecution:](self, "setOrderOfExecution:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  -[PLBatteryUIResponderService setOperationQueue:](self, "setOperationQueue:", v8);

  -[PLBatteryUIResponderService operationQueue](self, "operationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaxConcurrentOperationCount:", 1);

  v10 = objc_alloc(MEMORY[0x1E0D80098]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke;
  v12[3] = &unk_1EA16D1A8;
  v12[4] = self;
  v11 = (void *)objc_msgSend(v10, "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1DA088, v12);
  -[PLBatteryUIResponderService setQueryResponder:](self, "setQueryResponder:", v11);

}

id __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(*(id *)(a1 + 32), "demoMode"))
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke_cold_3();

    objc_msgSend(*(id *)(a1 + 32), "demoPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke_cold_1();

      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "pathExtension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR(".%@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "isEqualToString:", CFSTR(".plist")))
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
        goto LABEL_17;
      }
      v17 = objc_msgSend(v15, "isEqualToString:", CFSTR(".PLSQL"));

      if ((v17 & 1) == 0)
      {
        v16 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke_cold_2();

    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestingService"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRequestingService:", v18);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("plistCopyDestination"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlistCopyDestination:", v19);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("skipPlistWriteKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSkipPlistWrite:", objc_msgSend(v20, "BOOLValue"));

  PLLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "requestingService");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v22;
    _os_log_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_INFO, "requestingService=%@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "cleanup");
  objc_msgSend(*(id *)(a1 + 32), "configure:", v6);
  objc_msgSend(*(id *)(a1 + 32), "linkDependencies");
  objc_msgSend(*(id *)(a1 + 32), "run");
  objc_msgSend(*(id *)(a1 + 32), "coalesce");
  objc_msgSend(*(id *)(a1 + 32), "result");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v16;
}

- (void)cleanup
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_INFO, "Responder Service: Cleaning up...", v9, 2u);
  }

  -[PLBatteryUIResponderService resultDictionary](self, "resultDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[PLBatteryUIResponderService requestedObjects](self, "requestedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[PLBatteryUIResponderService orderOfExecution](self, "orderOfExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[PLBatteryUIResponderService responseCache](self, "responseCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[PLBatteryUIResponderService sharedUtilityCache](self, "sharedUtilityCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)configure:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1DA9D6000, v5, OS_LOG_TYPE_INFO, "Responder Service: Received configuration %@", buf, 0xCu);
  }

  -[PLBatteryUIResponderService setConfiguration:](self, "setConfiguration:", v4);
  -[PLBatteryUIResponderService configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__PLBatteryUIResponderService_configure___block_invoke;
  v7[3] = &unk_1EA170670;
  v7[4] = self;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __41__PLBatteryUIResponderService_configure___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enum"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enum"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (int)objc_msgSend(v8, "intValue");

      objc_msgSend(*(id *)(a1 + 32), "constructResponseObjectFromType:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "requestedObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "requestedObjects");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

        }
        objc_msgSend(*(id *)(a1 + 32), "requestedObjects");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, v5);

      }
      else
      {
        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __41__PLBatteryUIResponderService_configure___block_invoke_cold_1((uint64_t)v6, v9, v17);
      }

    }
  }

}

- (void)linkDependencies
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  id v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[6];
  id v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id location;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_INFO, "Responder Service: Linking dependencies...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[PLBatteryUIResponderService requestedObjects](self, "requestedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v45;
    obj = v4;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v45 != v29)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v33, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 == 0;

        if (v7)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v8, v5);

        }
        -[PLBatteryUIResponderService responseCache](self, "responseCache");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBatteryUIResponderService responseCache](self, "responseCache");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v5);

        }
        v42 = 0u;
        v43 = 0u;
        v41 = 0u;
        v40 = 0u;
        -[PLBatteryUIResponderService requestedObjects](self, "requestedObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v5);
        v32 = (id)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v41 != v16)
                objc_enumerationMutation(v32);
              v18 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
              -[PLBatteryUIResponderService requestedObjects](self, "requestedObjects");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", v5);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                v22 = (void *)MEMORY[0x1E0CB34C8];
                v36[0] = MEMORY[0x1E0C809B0];
                v36[1] = 3221225472;
                v36[2] = __47__PLBatteryUIResponderService_linkDependencies__block_invoke;
                v36[3] = &unk_1EA171098;
                objc_copyWeak(&v39, &location);
                v36[4] = v18;
                v36[5] = self;
                v37 = v21;
                v38 = v5;
                objc_msgSend(v22, "blockOperationWithBlock:", v36);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "objectForKeyedSubscript:", v5);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "addObject:", v23);

                objc_destroyWeak(&v39);
              }

            }
            v15 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
          }
          while (v15);
        }

      }
      v4 = obj;
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v30);
  }

  PLLogCommon();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v33;
    _os_log_impl(&dword_1DA9D6000, v25, OS_LOG_TYPE_INFO, "Responder Service: Constructed <Response Type, Execution Block(s)> map: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponderService setExecutionChain:](self, "setExecutionChain:", v26);

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __47__PLBatteryUIResponderService_linkDependencies__block_invoke_48;
  v34[3] = &unk_1EA1710C0;
  v34[4] = self;
  v27 = v33;
  v35 = v27;
  objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v34);

  objc_destroyWeak(&location);
}

void __47__PLBatteryUIResponderService_linkDependencies__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  NSObject *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "resultDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setObject:forKeyedSubscript:", v7, CFSTR("timestamp"));

  if (objc_msgSend(*(id *)(a1 + 40), "demoMode"))
  {
    objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("start"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("end"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    v14 = v13 - v10;
    if (v14 == 864000.0)
    {
      v15 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(*(id *)(a1 + 40), "resultDictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryTime"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      PLCalculateEndOfDayWithDate();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v14 != 86400.0 && v14 != 1209600.0)
        goto LABEL_8;
      v20 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(*(id *)(a1 + 40), "resultDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryTime"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      objc_msgSend(v20, "dateWithTimeIntervalSince1970:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      PLCalculateEndOfHourWithDate();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = v19;
    objc_msgSend(v19, "timeIntervalSince1970");
    v13 = v24;

LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13 - v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setObject:forKeyedSubscript:", v25, CFSTR("start"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setObject:forKeyedSubscript:", v26, CFSTR("end"));

  }
  PLBatteryUsageUIKeyFromConfiguration();
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v87 = v29;
    v88 = 2112;
    v89 = v30;
    _os_log_impl(&dword_1DA9D6000, v27, OS_LOG_TYPE_INFO, "Responder Service: Running '%@' for '%@'", buf, 0x16u);

  }
  objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("start"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "doubleValue");
  v33 = v32;

  objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("end"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "doubleValue");
  v36 = v35;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "convertFromSystemToMonotonic");
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v83, "dateByAddingTimeInterval:", -(v36 - v33));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v82, "timeIntervalSince1970");
  objc_msgSend(v38, "numberWithDouble:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setObject:forKeyedSubscript:", v39, CFSTR("start"));

  v40 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v83, "timeIntervalSince1970");
  objc_msgSend(v40, "numberWithDouble:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setObject:forKeyedSubscript:", v41, CFSTR("end"));

  objc_msgSend(*(id *)(a1 + 48), "configure:", v85);
  objc_msgSend(*(id *)(a1 + 48), "run");
  objc_msgSend(*(id *)(a1 + 48), "coalesce");
  v42 = objc_loadWeakRetained(v2);
  objc_msgSend(v42, "responseCache");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_enter(v43);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_loadWeakRetained(v2);
  objc_msgSend(v45, "responseCache");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v44, v84);

  v48 = objc_loadWeakRetained(v2);
  objc_msgSend(v48, "configuration");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_loadWeakRetained(v2);
  objc_msgSend(v51, "responseCache");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "objectForKeyedSubscript:", v84);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v50, CFSTR("configuration"));

  objc_msgSend(*(id *)(a1 + 48), "result");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_loadWeakRetained(v2);
  objc_msgSend(v56, "responseCache");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectForKeyedSubscript:", v84);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setObject:forKeyedSubscript:", v55, CFSTR("result"));

  PLLogCommon();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    v61 = *(void **)(a1 + 32);
    v62 = objc_loadWeakRetained(v2);
    objc_msgSend(v62, "responseCache");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "objectForKeyedSubscript:", v84);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("result"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v87 = v61;
    v88 = 2112;
    v89 = (uint64_t)v84;
    v90 = 2112;
    v91 = v66;
    _os_log_impl(&dword_1DA9D6000, v60, OS_LOG_TYPE_INFO, "Responder Service: Stored '%@' as %@: %@", buf, 0x20u);

  }
  objc_sync_exit(v43);

  v67 = objc_loadWeakRetained(v2);
  objc_msgSend(v67, "requestedObjects");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_enter(v68);
  v69 = objc_loadWeakRetained(v2);
  objc_msgSend(v69, "requestedObjects");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));

  PLLogCommon();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
  {
    v77 = *(void **)(a1 + 32);
    v78 = objc_loadWeakRetained(v2);
    objc_msgSend(v78, "requestedObjects");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "count");
    *(_DWORD *)buf = 138412546;
    v87 = v77;
    v88 = 2048;
    v89 = v81;
    _os_log_debug_impl(&dword_1DA9D6000, v72, OS_LOG_TYPE_DEBUG, "Responder Service: Completed %@ (%lu remaining)", buf, 0x16u);

  }
  objc_sync_exit(v68);

  v73 = objc_loadWeakRetained(v2);
  objc_msgSend(v73, "orderOfExecution");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_enter(v74);
  v75 = objc_loadWeakRetained(v2);
  objc_msgSend(v75, "orderOfExecution");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", *(_QWORD *)(a1 + 32));

  objc_sync_exit(v74);
}

void __47__PLBatteryUIResponderService_linkDependencies__block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  objc_class *v37;
  void *v38;
  int v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id obj;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  int v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v52 = a1;
  objc_msgSend(*(id *)(a1 + 32), "requestedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v9 = v8;
  v43 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
  if (v43)
  {
    v10 = *(_QWORD *)v66;
    v41 = v9;
    v42 = v5;
    v48 = v6;
    v40 = *(_QWORD *)v66;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v66 != v10)
          objc_enumerationMutation(v9);
        v44 = v11;
        v12 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v11);
        objc_msgSend(*(id *)(v52 + 32), "requestedObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v12;
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "dependencies");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v46 = v15;
          objc_msgSend(v15, "dependencies");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
          if (v50)
          {
            v49 = *(_QWORD *)v62;
            while (2)
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v62 != v49)
                  objc_enumerationMutation(obj);
                v18 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v17);
                objc_msgSend(*(id *)(v52 + 40), "objectForKeyedSubscript:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                PLLogCommon();
                v20 = objc_claimAutoreleasedReturnValue();
                v21 = v20;
                if (!v19)
                {
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    v37 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v37);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v39 = objc_msgSend(v18, "intValue");
                    *(_DWORD *)buf = 138412802;
                    v72 = v38;
                    v73 = 2112;
                    v74 = v45;
                    v75 = 1024;
                    v76 = v39;
                    _os_log_error_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_ERROR, "Responder Service: '%@' (%@) is dependent upon type '%d' but this dependency is missing. Skipping response...", buf, 0x1Cu);

                  }
                  v9 = v41;
                  v5 = v42;
                  v36 = v41;
                  goto LABEL_38;
                }
                v51 = v17;
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  v22 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v18, "intValue");
                  *(_DWORD *)buf = 138412802;
                  v72 = v23;
                  v73 = 2112;
                  v74 = v45;
                  v75 = 1024;
                  v76 = v24;
                  _os_log_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_INFO, "Responder Service: '%@' (%@) is dependent upon type '%d'.  Linking dependency...", buf, 0x1Cu);

                }
                v59 = 0u;
                v60 = 0u;
                v57 = 0u;
                v58 = 0u;
                v25 = v6;
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
                if (v26)
                {
                  v27 = v26;
                  v28 = *(_QWORD *)v58;
                  do
                  {
                    for (i = 0; i != v27; ++i)
                    {
                      if (*(_QWORD *)v58 != v28)
                        objc_enumerationMutation(v25);
                      v30 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                      v53 = 0u;
                      v54 = 0u;
                      v55 = 0u;
                      v56 = 0u;
                      objc_msgSend(*(id *)(v52 + 40), "objectForKeyedSubscript:", v18);
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
                      if (v32)
                      {
                        v33 = v32;
                        v34 = *(_QWORD *)v54;
                        do
                        {
                          for (j = 0; j != v33; ++j)
                          {
                            if (*(_QWORD *)v54 != v34)
                              objc_enumerationMutation(v31);
                            objc_msgSend(v30, "addDependency:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j));
                          }
                          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
                        }
                        while (v33);
                      }

                    }
                    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
                  }
                  while (v27);
                }

                v17 = v51 + 1;
                v6 = v48;
              }
              while (v51 + 1 != v50);
              v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
              if (v50)
                continue;
              break;
            }
          }

          v9 = v41;
          v5 = v42;
          v10 = v40;
          v15 = v46;
        }

        v11 = v44 + 1;
      }
      while (v44 + 1 != v43);
      v43 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    }
    while (v43);
  }

  objc_msgSend(*(id *)(v52 + 32), "executionChain");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObjectsFromArray:", v6);
LABEL_38:

}

- (void)run
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[PLBatteryUIResponderService demoMode](self, "demoMode"))
  {
    objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("BUI_DEMO_QUERY_TIME"), CFSTR("com.apple.powerlogd"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("BUI_DEMO_QUERY_TIME_OFFSET"), CFSTR("com.apple.powerlogd"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v3, "doubleValue");
      v6 = v5;
    }
    else
    {
      +[PLUtilities getLastBatteryTimestamp](PLUtilities, "getLastBatteryTimestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "convertFromMonotonicToSystem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSince1970");
      v6 = v13;

    }
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "doubleValue");
    objc_msgSend(v14, "numberWithDouble:", v6 + v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponderService resultDictionary](self, "resultDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("PLBatteryUIQueryTime"));

    PLLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1DA9D6000, v18, OS_LOG_TYPE_INFO, "Responder Service: Looking for Query Time...", (uint8_t *)&v28, 2u);
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponderService resultDictionary](self, "resultDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("PLBatteryUIQueryTime"));

  }
  PLLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    -[PLBatteryUIResponderService resultDictionary](self, "resultDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryTime"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v28 = 134217984;
    v29 = v22;
    _os_log_impl(&dword_1DA9D6000, v19, OS_LOG_TYPE_INFO, "Responder Service: Query Time = %f", (uint8_t *)&v28, 0xCu);

  }
  -[PLBatteryUIResponderService operationQueue](self, "operationQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponderService executionChain](self, "executionChain");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addOperations:waitUntilFinished:", v24, 1);

  PLLogCommon();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    -[PLBatteryUIResponderService orderOfExecution](self, "orderOfExecution");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "componentsJoinedByString:", CFSTR(" -> "));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412290;
    v29 = v27;
    _os_log_impl(&dword_1DA9D6000, v25, OS_LOG_TYPE_INFO, "Responder Service: Ran response objects in order: %@", (uint8_t *)&v28, 0xCu);

  }
}

- (void)coalesce
{
  void *v3;
  void *v4;
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
  _QWORD v15[5];

  -[PLBatteryUIResponderService configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__PLBatteryUIResponderService_coalesce__block_invoke;
  v15[3] = &unk_1EA170670;
  v15[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v15);

  v4 = (void *)MEMORY[0x1E0C99D68];
  -[PLBatteryUIResponderService resultDictionary](self, "resultDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponderService endOfDayWithNow:](self, "endOfDayWithNow:", v7);
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponderService resultDictionary](self, "resultDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("endOfDay"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponderService endOfHourWithNow:](self, "endOfHourWithNow:", v7);
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponderService resultDictionary](self, "resultDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("endOfHour"));

  -[PLBatteryUIResponderService resultDictionary](self, "resultDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA1DAE18, CFSTR("PLBatteryUIXPCVersionKey"));

}

void __39__PLBatteryUIResponderService_coalesce__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    PLBatteryUsageUIKeyFromConfiguration();
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("enum"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v5, "intValue");

    PLBatteryUsageUIStringForResponseType();
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "responseCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "resultDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v7);

      objc_msgSend(*(id *)(a1 + 32), "resultDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v36, CFSTR("configuration"));

      objc_msgSend(*(id *)(a1 + 32), "responseCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("result"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "resultDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)v7;
      objc_msgSend(v21, "objectForKeyedSubscript:", v7);
      v23 = (void *)v4;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v20, CFSTR("result"));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "resultDictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "resultDictionary");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, v7);

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "resultDictionary");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v29, v4);

      objc_msgSend(*(id *)(a1 + 32), "resultDictionary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v7);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", v4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, CFSTR("configuration"));

      objc_msgSend(*(id *)(a1 + 32), "responseCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("result"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "resultDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)v7;
      objc_msgSend(v21, "objectForKeyedSubscript:", v7);
      v23 = (void *)v4;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v23);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v20, CFSTR("result"));

    }
  }

}

- (id)result
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
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
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  id v37;
  uint8_t v38[16];
  uint8_t buf[16];

  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_INFO, "Responder Service: Converting response to legacy format...", buf, 2u);
  }

  -[PLBatteryUIResponderService resultDictionary](self, "resultDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponderService convertResponseToLegacyFormat:](self, "convertResponseToLegacyFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[PLBatteryUIResponderService setResultDictionary:](self, "setResultDictionary:", v6);

  if (-[PLBatteryUIResponderService skipPlistWrite](self, "skipPlistWrite"))
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_INFO, "Skipping write to plist", v38, 2u);
    }

    -[PLBatteryUIResponderService resultDictionary](self, "resultDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Debug/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:](PLUtilities, "createAndChownDirectoryIfDirectoryDoesNotExist:", v11);

    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Debug/"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBatteryUIResponderService requestingService](self, "requestingService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      -[PLBatteryUIResponderService requestingService](self, "requestingService");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("BatteryUI%@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLByAppendingPathComponent:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "URLByAppendingPathExtension:", CFSTR("plist"));
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C99E98];
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Debug/BatteryUI.plist"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fileURLWithPath:", v18);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponderService result].cold.5();

    -[PLBatteryUIResponderService resultDictionary](self, "resultDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v23 = objc_msgSend(v22, "writeToURL:error:", v20, &v37);
    v24 = v37;

    if (v23)
    {
      objc_msgSend(v20, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities setMobileOwnerForFile:](PLUtilities, "setMobileOwnerForFile:", v25);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponderService result].cold.3();
    }
    else
    {
      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[PLBatteryUIResponderService result].cold.4();
    }

    -[PLBatteryUIResponderService plistCopyDestination](self, "plistCopyDestination");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = v8;
      -[PLBatteryUIResponderService plistCopyDestination](self, "plistCopyDestination");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = +[PLUtilities PLCopyItemsFromPath:toPath:](PLUtilities, "PLCopyItemsFromPath:toPath:", v28, v29);

      if (v30)
      {
        objc_msgSend(v20, "lastPathComponent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByAppendingPathComponent:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", v32, 32);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[PLBatteryUIResponderService result].cold.1(self, v33);

      }
      else
      {
        PLLogCommon();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[PLBatteryUIResponderService result].cold.2(self, v34);

        -[PLBatteryUIResponderService setResultDictionary:](self, "setResultDictionary:", 0);
      }

    }
    -[PLBatteryUIResponderService resultDictionary](self, "resultDictionary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v35, "copy");

  }
  return v9;
}

- (double)endOfDayWithNow:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  long double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 60, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (double)(unint64_t)objc_msgSend(v6, "valueForComponent:", 32);
  objc_msgSend(v6, "setValue:forComponent:", (unint64_t)(v7 - fmod(v7, 3.0) + 3.0), 32);
  objc_msgSend(v5, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", -86400.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  objc_msgSend(v10, "timeIntervalSince1970");
  v13 = v12;
  objc_msgSend(v11, "timeIntervalSince1970");
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v13 + v15 - v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertFromMonotonicToSystem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSince1970");
  v19 = v18;

  return v19;
}

- (double)endOfHourWithNow:(id)a3
{
  void *v3;
  double v4;
  double v5;

  PLCalculateEndOfHourWithDate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  return v5;
}

- (id)constructResponseObjectFromType:(int64_t)a3
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  objc_class *v17;
  id v18;
  id v19;
  id v21;
  _QWORD v22[21];
  _QWORD v23[22];

  v23[21] = *MEMORY[0x1E0C80C00];
  v22[0] = &unk_1EA1C17D8;
  v23[0] = objc_opt_class();
  v22[1] = &unk_1EA1C17F0;
  v23[1] = objc_opt_class();
  v22[2] = &unk_1EA1C1808;
  v23[2] = objc_opt_class();
  v22[3] = &unk_1EA1C1820;
  v23[3] = objc_opt_class();
  v22[4] = &unk_1EA1C1838;
  v23[4] = objc_opt_class();
  v22[5] = &unk_1EA1C1850;
  v23[5] = objc_opt_class();
  v22[6] = &unk_1EA1C1868;
  v23[6] = objc_opt_class();
  v22[7] = &unk_1EA1C1880;
  v23[7] = objc_opt_class();
  v22[8] = &unk_1EA1C1898;
  v23[8] = objc_opt_class();
  v22[9] = &unk_1EA1C18B0;
  v23[9] = objc_opt_class();
  v22[10] = &unk_1EA1C18C8;
  v23[10] = objc_opt_class();
  v22[11] = &unk_1EA1C18E0;
  v23[11] = objc_opt_class();
  v22[12] = &unk_1EA1C18F8;
  v23[12] = objc_opt_class();
  v22[13] = &unk_1EA1C1910;
  v23[13] = objc_opt_class();
  v22[14] = &unk_1EA1C1928;
  v23[14] = objc_opt_class();
  v22[15] = &unk_1EA1C1940;
  v23[15] = objc_opt_class();
  v22[16] = &unk_1EA1C1958;
  v23[16] = objc_opt_class();
  v22[17] = &unk_1EA1C1970;
  v23[17] = objc_opt_class();
  v22[18] = &unk_1EA1C1988;
  v23[18] = objc_opt_class();
  v22[19] = &unk_1EA1C19A0;
  v23[19] = objc_opt_class();
  v22[20] = &unk_1EA1C19B8;
  v23[20] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 21);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = _os_feature_enabled_impl();
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      -[PLBatteryUIResponderService constructResponseObjectFromType:].cold.3();

    v9 = -[NSObject mutableCopy](v5, "mutableCopy");
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", objc_opt_class(), &unk_1EA1C19D0);
    v7 = v5;
  }
  else
  {
    if (v8)
      -[PLBatteryUIResponderService constructResponseObjectFromType:].cold.4();
    v9 = v5;
  }

  v10 = _os_feature_enabled_impl();
  PLLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
      -[PLBatteryUIResponderService constructResponseObjectFromType:].cold.1();
  }
  else if (v12)
  {
    -[PLBatteryUIResponderService constructResponseObjectFromType:].cold.2();
  }

  -[NSObject allKeys](v9, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)(id)-[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v16);

    v18 = objc_alloc_init(v17);
    v19 = objc_initWeak(&v21, self);
    objc_msgSend(v18, "setResponderService:", self);

    objc_destroyWeak(&v21);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)convertResponseToLegacyFormat:(id)a3
{
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v31[4];
  id v32;
  id v33;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endOfHour"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("endOfHour"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endOfDay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("endOfDay"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIXPCVersionKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("PLBatteryUIXPCVersionKey"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("PLBatteryUIQueryTime"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("Breakdown"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Breakdown"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("PLBatteryUISuggestionArrayKey"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("Graph"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Graph"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("PLBatteryUIGraph24hrs"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Graph"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("PLBatteryUIGraphDays"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Breakdown"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1EA1C19E8, CFSTR("PLBatteryUIDataDurationKey"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Breakdown"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("PLBatteryUIUrsaIssuesKey"));

  v21 = 10;
  do
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Graph"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraphDays"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v24);

    --v21;
  }
  while (v21);
  -[PLBatteryUIResponderService configuration](self, "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke;
  v31[3] = &unk_1EA171138;
  v32 = v4;
  v26 = v5;
  v33 = v26;
  v27 = v4;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v31);

  v28 = v33;
  v29 = v26;

  return v29;
}

void __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  NSObject *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  const __CFString *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  uint8_t buf[4];
  double v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enum"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v5, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bucket"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    PLBatteryUsageUIStringForResponseType();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PLBatteryUsageUIKeyFromConfiguration();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("result"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("result"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", v17);
      v23 = a1;
      v24 = v16;
      v25 = v17;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("result"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v25;
      v16 = v24;
      a1 = v23;
    }

    if (v22)
    {
      v27 = v12 - v15;
      switch(v6)
      {
        case 0:
          if (v27 == 86400.0)
          {
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Graph"));
            v28 = objc_claimAutoreleasedReturnValue();
            -[NSObject objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraph24hrs"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v52;
            v53 = CFSTR("PLBatteryUIChargingIntervalsKey");
            goto LABEL_54;
          }
          break;
        case 1:
        case 2:
        case 3:
        case 4:
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIDataDurationKey"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (double)(int)objc_msgSend(v30, "intValue");

          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Breakdown"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("PLBatteryUIDataDurationKey"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          v35 = v34;

          if (v35 < v31)
          {
            PLLogCommon();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v98 = v31;
              _os_log_impl(&dword_1DA9D6000, v36, OS_LOG_TYPE_INFO, "Maximum Data Duration = %f", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Breakdown"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("PLBatteryUIDataDurationKey"));

          }
          if (v27 == 86400.0 && v9 == 86400.0)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIBreakdownKey"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "firstObject");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Breakdown"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, CFSTR("PLBatteryUIQueryRangeDayKey"));

          }
          if (v27 == 86400.0 && v9 == 3600.0)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIBreakdownKey"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Breakdown"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, CFSTR("PLBatteryUIQueryRangeDayTapKey"));

          }
          if (v27 == 864000.0 && v9 == 864000.0)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIBreakdownKey"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "firstObject");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Breakdown"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, CFSTR("PLBatteryUIQueryRangeWeekKey"));

          }
          if (v27 == 864000.0 && v9 == 86400.0)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIBreakdownKey"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Breakdown"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, CFSTR("PLBatteryUIQueryRangeWeekTapKey"));

          }
          if (v27 == 10800.0 && v9 == 10800.0)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIBreakdownKey"));
            v49 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "firstObject");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Breakdown"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setObject:forKeyedSubscript:", v50, CFSTR("PLBatteryUIQueryRangeDayKey"));

            goto LABEL_28;
          }
          break;
        case 5:
          v54 = *(void **)(a1 + 40);
          v55 = CFSTR("PLBatteryUILastChargeKey");
          goto LABEL_49;
        case 6:
          if (v27 == 864000.0 && v9 == 86400.0)
          {
            v49 = v22;
            PLLogCommon();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_cold_2(v49, v56);

            v91[0] = MEMORY[0x1E0C809B0];
            v91[1] = 3221225472;
            v91[2] = __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_151;
            v91[3] = &unk_1EA1710E8;
            v92 = *(id *)(a1 + 40);
            objc_msgSend(v49, "enumerateObjectsUsingBlock:", v91);

LABEL_28:
          }
          break;
        case 7:
          if (v27 != 86400.0 || v9 != 900.0)
            break;
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Graph"));
          v28 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraph24hrs"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v52;
          v53 = CFSTR("PLBatteryUIBatteryLevelsKey");
          goto LABEL_54;
        case 8:
          if (v27 == 86400.0 && v9 == 3600.0)
          {
            v95[0] = CFSTR("PLBatteryUIGraphHourly");
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIScreenOnTimeKey"));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraphByBucket"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v96[0] = v82;
            v95[1] = CFSTR("PLBatteryUIGraphTotal");
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIScreenOnTimeKey"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraphTotal"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v96[1] = v58;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Graph"));
            v86 = v17;
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraph24hrs"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setObject:forKeyedSubscript:", v59, CFSTR("PLBatteryUIScreenOnTimeKey"));

            v93[0] = CFSTR("PLBatteryUIGraphHourly");
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIScreenOffTimeKey"));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraphByBucket"));
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v93[1] = CFSTR("PLBatteryUIGraphTotal");
            v94[0] = v83;
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIScreenOffTimeKey"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraphTotal"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v94[1] = v63;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Graph"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraph24hrs"));
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v64, CFSTR("PLBatteryUIScreenOffTimeKey"));

            v17 = v86;
          }
          if (v27 == 864000.0 && v9 == 86400.0)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIScreenOnTimeKey"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraphByBucket"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIScreenOffTimeKey"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraphByBucket"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            v71 = MEMORY[0x1E0C809B0];
            v89[0] = MEMORY[0x1E0C809B0];
            v89[1] = 3221225472;
            v89[2] = __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_175;
            v89[3] = &unk_1EA171110;
            v90 = *(id *)(a1 + 40);
            objc_msgSend(v68, "enumerateObjectsUsingBlock:", v89);
            v87[0] = v71;
            v87[1] = 3221225472;
            v87[2] = __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_2;
            v87[3] = &unk_1EA171110;
            v88 = *(id *)(a1 + 40);
            objc_msgSend(v70, "enumerateObjectsUsingBlock:", v87);

          }
          v72 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIDidAdjustTimesKey"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "numberWithBool:", objc_msgSend(v73, "BOOLValue"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Graph"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setObject:forKeyedSubscript:", v74, CFSTR("PLBatteryUIDidAdjustTimesKey"));

          break;
        case 9:
          if (_os_feature_enabled_impl())
          {
            v54 = *(void **)(a1 + 40);
            v55 = CFSTR("PLBatteryUIPausedChargingKey");
LABEL_49:
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v22, v55);
          }
          else
          {
            PLLogCommon();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_cold_1();
LABEL_59:

          }
          break;
        case 10:
          if (v27 != 86400.0)
            break;
          PLLogCommon();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v98 = *(double *)&v22;
            _os_log_impl(&dword_1DA9D6000, v76, OS_LOG_TYPE_INFO, "response=%@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Graph"));
          v28 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraph24hrs"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v52;
          v53 = CFSTR("PLBatteryUIChargingStateIntervalsDictKey");
LABEL_54:
          objc_msgSend(v52, "setObject:forKeyedSubscript:", v22, v53);
          goto LABEL_58;
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 21:
          if (!objc_msgSend(v22, "count"))
            break;
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Breakdown"));
          v28 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", CFSTR("PLBatteryUISuggestionArrayKey"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v22);
          goto LABEL_58;
        case 18:
          v77 = CFSTR("hasNoteworthyInformation");
          goto LABEL_61;
        case 19:
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("UrsaDefinition"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v78, "count");

          if (!v79)
            break;
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Breakdown"));
          v28 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", CFSTR("PLBatteryUIUrsaIssuesKey"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("UrsaDefinition"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObjectsFromArray:", v80);

LABEL_58:
          goto LABEL_59;
        case 20:
          v77 = CFSTR("buiMappings");
LABEL_61:
          objc_msgSend(v22, "objectForKeyedSubscript:", v77);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v81, v77);

          break;
        default:
          break;
      }
    }

  }
}

void __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_151(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Graph"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraphDays"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIEnergyKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("PLBatteryUIEnergyKey"));
}

void __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_175(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Graph"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraphDays"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("PLBatteryUIGraphTotal"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("PLBatteryUIScreenOnTimeKey"));
}

void __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Graph"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLBatteryUIGraphDays"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("PLBatteryUIGraphTotal"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("PLBatteryUIScreenOffTimeKey"));
}

- (BOOL)demoMode
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0D80020], "internalBuild");
  if (v2)
  {
    if (demoMode_onceToken_0 != -1)
      dispatch_once(&demoMode_onceToken_0, &__block_literal_global_30);
    LOBYTE(v2) = demoMode_demoMode != 0;
  }
  return v2;
}

void __39__PLBatteryUIResponderService_demoMode__block_invoke()
{
  id v0;

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v0 = (id)_CFPreferencesCopyAppValueWithContainer();
  demoMode_demoMode = objc_msgSend(v0, "BOOLValue");

}

- (id)demoPath
{
  if (demoPath_onceToken != -1)
    dispatch_once(&demoPath_onceToken, &__block_literal_global_190);
  return (id)demoPath_demoPath;
}

void __39__PLBatteryUIResponderService_demoPath__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v0 = _CFPreferencesCopyAppValueWithContainer();
  if (v0)
  {
    v1 = (void *)demoPath_demoPath;
    demoPath_demoPath = v0;

  }
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResponderService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableArray)dependencies
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDependencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)responseCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setResponseCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)sharedUtilityCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSharedUtilityCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)requestingService
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRequestingService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)plistCopyDestination
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPlistCopyDestination:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)skipPlistWrite
{
  return self->_skipPlistWrite;
}

- (void)setSkipPlistWrite:(BOOL)a3
{
  self->_skipPlistWrite = a3;
}

- (NSMutableDictionary)resultDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setResultDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLXPCResponderOperatorComposition)queryResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setQueryResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDictionary)configuration
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableDictionary)requestedObjects
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRequestedObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSMutableArray)executionChain
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setExecutionChain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 144, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSMutableArray)orderOfExecution
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOrderOfExecution:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderOfExecution, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_executionChain, 0);
  objc_storeStrong((id *)&self->_requestedObjects, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queryResponder, 0);
  objc_storeStrong((id *)&self->_resultDictionary, 0);
  objc_storeStrong((id *)&self->_plistCopyDestination, 0);
  objc_storeStrong((id *)&self->_requestingService, 0);
  objc_storeStrong((id *)&self->_sharedUtilityCache, 0);
  objc_storeStrong((id *)&self->_responseCache, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

void __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, v0, v1, "Responder Service: Loading '%@'...", v2);
  OUTLINED_FUNCTION_1();
}

void __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, v0, v1, "Responder Service: '%@' does not exist.", v2);
  OUTLINED_FUNCTION_1();
}

void __55__PLBatteryUIResponderService_initOperatorDependancies__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Responder Service: Demo Mode is enabled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __41__PLBatteryUIResponderService_configure___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_10(&dword_1DA9D6000, a2, a3, "Responder Service: Failed to initialize type %ld with configuration %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)result
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, v0, v1, "Attempting to create file %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)constructResponseObjectFromType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "\"bui_last_charge_watchOS\" feature flag is enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)constructResponseObjectFromType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "\"bui_last_charge_watchOS\" feature flag is disabled. Not adding Paused Charging as a possible request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)constructResponseObjectFromType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "\"bui_last_charge_iOS\" feature flag is enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)constructResponseObjectFromType:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "\"bui_last_charge_iOS\" feature flag is disabled. Not adding Paused Charging as a possible request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "\"bui_last_charge_iOS\" feature flag is disabled. Not adding response to Paused Charging.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __61__PLBatteryUIResponderService_convertResponseToLegacyFormat___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v3, "Got %lu 10d UISoC", v4);
  OUTLINED_FUNCTION_8_0();
}

@end
