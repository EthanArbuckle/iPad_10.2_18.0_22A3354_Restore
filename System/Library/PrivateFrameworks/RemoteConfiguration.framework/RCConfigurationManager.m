@implementation RCConfigurationManager

- (void)fetchMultiConfigurationWithSettings:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  -[RCConfigurationManager fetchMultiConfigurationWithSettings:networkActivityBlock:completionQueue:completion:](self, "fetchMultiConfigurationWithSettings:networkActivityBlock:completionQueue:completion:", a3, 0, a4, a5);
}

- (BOOL)_isAllowedToReachEndpointWithSettings:(id)a3 configurationResource:(id)a4 endpointURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  _BYTE v28[14];
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
    goto LABEL_7;
  objc_msgSend(v7, "debugOverrides");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "configurationSource");

  if (v11 == 1)
  {
    __98__RCConfigurationManager__isAllowedToReachEndpointWithSettings_configurationResource_endpointURL___block_invoke_2();
LABEL_4:
    v12 = 1;
    goto LABEL_8;
  }
  objc_msgSend(v7, "debugOverrides");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "configurationSource");

  if (v14 == 2)
  {
    __98__RCConfigurationManager__isAllowedToReachEndpointWithSettings_configurationResource_endpointURL___block_invoke_98();
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "requestMode") == 2)
  {
    RCSharedLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1A1FB5000, v16, OS_LOG_TYPE_DEFAULT, "allowed to reach endpoint because request mode is: EndpointOnly", (uint8_t *)&v27, 2u);
    }

    goto LABEL_4;
  }
  objc_msgSend(v7, "userID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v8 && v18)
  {
    objc_msgSend(v7, "userID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userSegmentationConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "modThreshold");

    objc_msgSend(v8, "userSegmentationConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "modMax");

    v24 = objc_msgSend(v19, "hash") % v23;
    v12 = v24 < v21;
    RCSharedLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v27 = 138412290;
      *(_QWORD *)v28 = v19;
      _os_log_impl(&dword_1A1FB5000, v25, OS_LOG_TYPE_DEBUG, "checking if client is allowed to reach endpoint with userID: %@", (uint8_t *)&v27, 0xCu);
    }

    RCSharedLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 67109888;
      *(_DWORD *)v28 = v24 < v21;
      *(_WORD *)&v28[4] = 2048;
      *(_QWORD *)&v28[6] = v24;
      v29 = 2048;
      v30 = v23;
      v31 = 2048;
      v32 = v21;
      _os_log_impl(&dword_1A1FB5000, v26, OS_LOG_TYPE_DEFAULT, "client allowedToReachEndpoint: %d with moddedHash: %lu modMax: %lu modThreshold: %lu", (uint8_t *)&v27, 0x26u);
    }

  }
  else
  {
    v12 = (unint64_t)(objc_msgSend(v7, "requestMode") - 1) < 2;
  }
LABEL_8:

  return v12;
}

- (void)_loadConfigurationResourcesFromStore
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationManager setConfigResourceByRequestKey:](self, "setConfigResourceByRequestKey:", v3);

  -[RCConfigurationManager localStore](self, "localStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v10 = objc_opt_class();
        objc_msgSend(v4, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        RCDynamicCast(v10, (uint64_t)v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[RCConfigurationManager _decodeConfigurationResource:](self, "_decodeConfigurationResource:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[RCConfigurationManager configResourceByRequestKey](self, "configResourceByRequestKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "requestKey");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

          RCSharedLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v13;
            _os_log_impl(&dword_1A1FB5000, v16, OS_LOG_TYPE_DEBUG, "loaded configuration resource: %@", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v6);
  }

}

- (NSMutableDictionary)configResourceByRequestKey
{
  return self->_configResourceByRequestKey;
}

- (id)_decodeConfigurationResource:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, 0);

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (RCKeyValueStore)localStore
{
  return self->_localStore;
}

- (void)setConfigResourceByRequestKey:(id)a3
{
  objc_storeStrong((id *)&self->_configResourceByRequestKey, a3);
}

- (BOOL)_areAllConfigurationResourcesInvalid:(id)a3 allowedToReachEndpoint:(BOOL)a4 configurationSettings:(id)a5 requestKeys:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  RCConfigurationManager *v17;
  BOOL v18;

  v10 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __120__RCConfigurationManager__areAllConfigurationResourcesInvalid_allowedToReachEndpoint_configurationSettings_requestKeys___block_invoke;
  v15[3] = &unk_1E470E4D0;
  v16 = v10;
  v17 = self;
  v18 = a4;
  v11 = v10;
  v12 = a6;
  objc_msgSend(a3, "keysOfEntriesPassingTest:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v13, "isEqualToSet:", v12);

  return (char)self;
}

- (BOOL)_areAllConfigurationResourcesAvailable:(id)a3 requestKeys:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a4;
  objc_msgSend(a3, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "isEqualToSet:", v6);
  return (char)v7;
}

uint64_t __120__RCConfigurationManager__areAllConfigurationResourcesInvalid_allowedToReachEndpoint_configurationSettings_requestKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend(v7, "requestInfoForRequestCacheKey:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "cachePolicy");
  else
    +[RCCachePolicy defaultCachePolicy](RCCachePolicy, "defaultCachePolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(unsigned __int8 *)(a1 + 48);
  v13 = *(void **)(a1 + 40);
  v14 = objc_msgSend(*(id *)(a1 + 32), "useBackgroundRefreshRate");
  objc_msgSend(*(id *)(a1 + 32), "userID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storefrontID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v13, "_isValidConfigurationResource:allowedToReachEndpoint:useBackgroundRefreshRate:userID:storefrontID:cachePolicy:", v8, v12, v14, v15, v16, v11);

  *a4 = v12;
  return v12 ^ 1;
}

- (RCAsyncSerialQueue)configRequestSerialQueue
{
  return self->_configRequestSerialQueue;
}

- (void)setNetworkEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)runningOperations
{
  return self->_runningOperations;
}

- (id)networkEventHandler
{
  return self->_networkEventHandler;
}

- (void)_processConfigurationCompletionWithResources:(id)a3 configurationSettings:(id)a4 processedConfigurationDataByRequestKey:(id *)a5 processedTreatmentIDs:(id *)a6 processedSegmentSetIDs:(id *)a7 error:(id *)a8
{
  id v9;
  id v10;
  void *v11;
  __int128 v12;
  id v13;
  id v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id obj;
  void *v55;
  uint64_t v56;
  uint64_t v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v43 = v10;
  objc_msgSend(v10, "requestInfos");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  v13 = 0;
  v14 = 0;
  if (v60)
  {
    v56 = *(_QWORD *)v63;
    *(_QWORD *)&v12 = 138413058;
    v42 = v12;
    v52 = v9;
    v55 = v11;
    do
    {
      for (i = 0; i != v60; ++i)
      {
        if (*(_QWORD *)v63 != v56)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v16, "requestCacheKey", v42);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[RCConfigurationManager configResourceByRequestKey](self, "configResourceByRequestKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "requestCacheKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          RCSharedLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "requestKey");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v67 = v37;
            _os_log_impl(&dword_1A1FB5000, v22, OS_LOG_TYPE_DEFAULT, "cached configuration not available for requestKey: %@, skip updating last fetch date, treatmentIDs and segmentSetIDs", buf, 0xCu);

          }
          goto LABEL_21;
        }
        objc_msgSend(v21, "contentHash");
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "contentHash");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSObject isEqualToString:](v22, "isEqualToString:", v23) & 1) == 0)
        {

LABEL_20:
          v11 = v55;
LABEL_21:

          goto LABEL_22;
        }
        objc_msgSend(v21, "userID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "userID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v24, "isEqualToString:", v25))
        {

LABEL_19:
          v9 = v52;
          goto LABEL_20;
        }
        v50 = v24;
        objc_msgSend(v21, "storefrontID");
        v26 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "storefrontID");
        v27 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)v26;
        v28 = (void *)v26;
        v29 = (void *)v27;
        if (!objc_msgSend(v28, "isEqualToString:", v27))
        {

          goto LABEL_19;
        }
        objc_msgSend(v43, "debugOverrides");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v44, "ignoreCache");

        v9 = v52;
        v11 = v55;
        if ((v46 & 1) == 0)
        {
          RCSharedLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "requestKey");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "treatmentIDs");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "rc_description");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "segmentSetIDs");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "rc_description");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "contentHash");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v42;
            v67 = v51;
            v68 = 2112;
            v69 = v47;
            v70 = 2112;
            v71 = v31;
            v72 = 2112;
            v73 = v32;
            _os_log_impl(&dword_1A1FB5000, v30, OS_LOG_TYPE_DEFAULT, "matched contentHash, returning cached configuration for requestKey: %@ treatmentIDs: %@ segmentSetIDs: %@ contentHash: %@ ", buf, 0x2Au);

            v11 = v55;
            v9 = v52;

          }
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setLastFetchedDate:", v33);

          objc_msgSend(v18, "treatmentIDs");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setTreatmentIDs:", v34);

          objc_msgSend(v18, "segmentSetIDs");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setSegmentSetIDs:", v35);

          v36 = v21;
          v18 = v36;
LABEL_23:
          -[RCConfigurationManager _saveConfigurationResource:](self, "_saveConfigurationResource:", v18);
          objc_msgSend(v18, "configurationData");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "requestCacheKey");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v38, v39);

          objc_msgSend(v18, "treatmentIDs");
          v40 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "segmentSetIDs");
          v41 = objc_claimAutoreleasedReturnValue();

          v13 = (id)v41;
          v14 = (id)v40;
          goto LABEL_25;
        }
LABEL_22:
        if (v18)
          goto LABEL_23;
        objc_msgSend(MEMORY[0x1E0CB35C8], "rc_notAvailableError");
        *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
        *a5 = (id)objc_msgSend(v11, "copy");
        v14 = objc_retainAutorelease(v14);
        *a6 = v14;
        v13 = objc_retainAutorelease(v13);
        *a7 = v13;

      }
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    }
    while (v60);
  }

}

- (void)_saveConfigurationResource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[RCConfigurationManager configResourceByRequestKey](self, "configResourceByRequestKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v5);

  -[RCConfigurationManager _encodeConfigurationResource:](self, "_encodeConfigurationResource:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[RCConfigurationManager localStore](self, "localStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

  }
}

- (id)_encodeConfigurationResource:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
}

- (RCUnfairLock)runningOperationsLock
{
  return self->_runningOperationsLock;
}

- (RCConfigurationManager)initWithContentDirectoryURL:(id)a3
{
  id v5;
  RCConfigurationManager *v6;
  RCConfigurationManager *v7;
  RCAsyncSerialQueue *v8;
  RCAsyncSerialQueue *configRequestSerialQueue;
  RCKeyValueStore *v10;
  void *v11;
  uint64_t v12;
  RCKeyValueStore *localStore;
  uint64_t v14;
  NSMutableArray *runningOperations;
  RCUnfairLock *v16;
  RCUnfairLock *runningOperationsLock;
  uint64_t v18;
  NSMutableDictionary *backgroundURLSessionHandlers;
  RCUnfairLock *v20;
  RCUnfairLock *backgroundURLSessionHandlersLock;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RCConfigurationManager;
  v6 = -[RCConfigurationManager init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentDirectoryURL, a3);
    v8 = -[RCAsyncSerialQueue initWithQualityOfService:]([RCAsyncSerialQueue alloc], "initWithQualityOfService:", 25);
    configRequestSerialQueue = v7->_configRequestSerialQueue;
    v7->_configRequestSerialQueue = v8;

    v10 = [RCKeyValueStore alloc];
    objc_msgSend(v5, "relativePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[RCKeyValueStore initWithName:directory:version:options:](v10, "initWithName:directory:version:options:", CFSTR("remote-configuration"), v11, 3, 0);
    localStore = v7->_localStore;
    v7->_localStore = (RCKeyValueStore *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    runningOperations = v7->_runningOperations;
    v7->_runningOperations = (NSMutableArray *)v14;

    v16 = objc_alloc_init(RCUnfairLock);
    runningOperationsLock = v7->_runningOperationsLock;
    v7->_runningOperationsLock = v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    backgroundURLSessionHandlers = v7->_backgroundURLSessionHandlers;
    v7->_backgroundURLSessionHandlers = (NSMutableDictionary *)v18;

    v20 = objc_alloc_init(RCUnfairLock);
    backgroundURLSessionHandlersLock = v7->_backgroundURLSessionHandlersLock;
    v7->_backgroundURLSessionHandlersLock = v20;

    -[RCConfigurationManager _loadConfigurationResourcesFromStore](v7, "_loadConfigurationResourcesFromStore");
  }

  return v7;
}

- (void)fetchSingleConfigurationWithSettings:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  -[RCConfigurationManager fetchSingleConfigurationWithSettings:networkActivityBlock:completionQueue:completion:](self, "fetchSingleConfigurationWithSettings:networkActivityBlock:completionQueue:completion:", a3, 0, a4, a5);
}

- (void)fetchSingleConfigurationWithSettings:(id)a3 networkActivityBlock:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a3;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __111__RCConfigurationManager_fetchSingleConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke;
  v14[3] = &unk_1E470E1C0;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[RCConfigurationManager fetchMultiConfigurationWithSettings:networkActivityBlock:completionQueue:completion:](self, "fetchMultiConfigurationWithSettings:networkActivityBlock:completionQueue:completion:", v13, a4, a5, v14);

}

void __111__RCConfigurationManager_fetchSingleConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *(void **)(a1 + 32);
  v12 = a2;
  objc_msgSend(v11, "requestInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "requestCacheKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, void *, id, id, id))(v17 + 16))(v17, v16, v18, v9, v10);

}

- (void)fetchConfigurationWithSettings:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__RCConfigurationManager_fetchConfigurationWithSettings_completionQueue_completion___block_invoke;
  v12[3] = &unk_1E470E1C0;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[RCConfigurationManager fetchMultiConfigurationWithSettings:completionQueue:completion:](self, "fetchMultiConfigurationWithSettings:completionQueue:completion:", v11, a4, v12);

}

void __84__RCConfigurationManager_fetchConfigurationWithSettings_completionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a5;
  v9 = *(void **)(a1 + 32);
  v10 = a4;
  v11 = a3;
  v12 = a2;
  objc_msgSend(v9, "requestInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "requestCacheKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "rc_arrayByTransformingWithBlock:", &__block_literal_global_0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "rc_arrayByTransformingWithBlock:", &__block_literal_global_57);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *(_QWORD *)(a1 + 40);
  if (v19)
    (*(void (**)(uint64_t, void *, void *, void *, id))(v19 + 16))(v19, v16, v17, v18, v20);

}

uint64_t __84__RCConfigurationManager_fetchConfigurationWithSettings_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

uint64_t __84__RCConfigurationManager_fetchConfigurationWithSettings_completionQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

- (void)fetchMultiConfigurationWithSettings:(id)a3 networkActivityBlock:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __CFString **v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __CFString *v36;
  RCConfigurationManager *v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  char v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[6];
  id v75;
  id v76;
  uint8_t buf[16];
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  id v84;
  _QWORD v85[6];

  v10 = a3;
  v11 = a4;
  v60 = a5;
  v62 = a6;
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke;
  v85[3] = &unk_1E470E278;
  v85[4] = self;
  v12 = (void *)MEMORY[0x1A85815B4](v85);
  objc_msgSend(v10, "requestInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rc_arrayByTransformingWithBlock:", &__block_literal_global_64);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[RCConfigurationManager configResourceByRequestKey](self, "configResourceByRequestKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rc_subdictionaryForKeys:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "rc_dictionaryByTransformingValuesWithKeyAndValueBlock:", &__block_literal_global_66);
  v61 = objc_claimAutoreleasedReturnValue();
  v68 = v14;
  objc_msgSend(v14, "firstObject");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestInfos");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v19, "rc_containsObjectPassingTest:", &__block_literal_global_68);

  objc_msgSend(v10, "requestInfos");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "rc_containsObjectPassingTest:", &__block_literal_global_69);

  v63 = v11;
  if ((_DWORD)v14)
  {
    -[RCConfigurationManager configResourceByRequestKey](self, "configResourceByRequestKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("appConfigRequest"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "userSegmentationConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "widgetEndpointURLString");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString length](v25, "length")
      || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25), (v26 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v10, "debugOverrides");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "debugEnvironment");
      v29 = RCRequestWidgetConfigurationKey;
LABEL_14:
      v36 = *v29;
      v37 = self;
LABEL_15:
      -[RCConfigurationManager _endpointURLForEnvironment:requestKey:](v37, "_endpointURLForEnvironment:requestKey:", v28, v36);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    goto LABEL_8;
  }
  if (v21)
  {
    -[RCConfigurationManager configResourceByRequestKey](self, "configResourceByRequestKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("appConfigRequest"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "userSegmentationConfiguration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "todayEndpointURLString");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString length](v25, "length")
      || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25), (v26 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v10, "debugOverrides");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "debugEnvironment");
      v29 = RCRequestTodayConfigurationKey;
      goto LABEL_14;
    }
LABEL_8:
    v32 = (void *)v26;
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v10, "endpointConfig");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationManager _endpointURLForEndpointConfig:](self, "_endpointURLForEndpointConfig:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
    goto LABEL_18;
  objc_msgSend(v18, "userSegmentationConfiguration");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "endpointURLString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v23, "length")
    || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v23), (v35 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v10, "requestInfos");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "firstObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "requestKey");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "debugOverrides");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "debugEnvironment");
    v37 = self;
    v36 = v25;
    goto LABEL_15;
  }
  v32 = (void *)v35;
LABEL_17:

LABEL_18:
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "treatmentIDs");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = (void *)v17;
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "segmentSetIDs");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = v18;
  v40 = -[RCConfigurationManager _isAllowedToReachEndpointWithSettings:configurationResource:endpointURL:](self, "_isAllowedToReachEndpointWithSettings:configurationResource:endpointURL:", v10, v18, v32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v68);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40)
  {
    objc_msgSend(v10, "requestInfos");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "rc_arrayByTransformingWithBlock:", &__block_literal_global_72);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v43);
    v44 = objc_claimAutoreleasedReturnValue();

    v41 = (void *)v44;
  }
  objc_msgSend(v10, "debugOverrides");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v45, "ignoreCache") & 1) != 0
    || !-[RCConfigurationManager _areAllConfigurationResourcesAvailable:requestKeys:](self, "_areAllConfigurationResourcesAvailable:requestKeys:", v16, v41))
  {

  }
  else
  {
    v46 = -[RCConfigurationManager _areAllConfigurationResourcesInvalid:allowedToReachEndpoint:configurationSettings:requestKeys:](self, "_areAllConfigurationResourcesInvalid:allowedToReachEndpoint:configurationSettings:requestKeys:", v16, v40, v10, v41);

    if (!v46)
    {
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_7;
      v78[3] = &unk_1E470E3C8;
      v79 = v16;
      v80 = v67;
      v81 = v66;
      v47 = v12;
      v48 = v62;
      v49 = v62;
      v50 = v60;
      v51 = (void *)v61;
      v82 = v60;
      v83 = v61;
      v84 = v49;
      __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_7((uint64_t)v78);

      v52 = v79;
LABEL_31:
      v57 = v63;
      goto LABEL_34;
    }
  }
  RCSharedLog();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1FB5000, v53, OS_LOG_TYPE_DEFAULT, "configuration request(s) not available in the cache or expired, starting fetch", buf, 2u);
  }

  if (!v40)
  {
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_74;
    v74[3] = &unk_1E470E3F0;
    v75 = v12;
    v56 = v10;
    v50 = v60;
    v74[4] = v56;
    v74[5] = v60;
    v47 = v12;
    v48 = v62;
    v76 = v62;
    __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_74((uint64_t)v74);

    v52 = v75;
    v51 = (void *)v61;
    goto LABEL_31;
  }
  objc_msgSend(v10, "debugOverrides");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "ignoreCache");

  v47 = v12;
  if ((v55 & 1) != 0)
  {
    v52 = 0;
  }
  else
  {
    objc_msgSend(v16, "rc_dictionaryByTransformingValuesWithKeyAndValueBlock:", &__block_literal_global_77);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v50 = v60;
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2_79;
  v69[3] = &unk_1E470E480;
  v48 = v62;
  v72 = v62;
  v70 = v60;
  v71 = v10;
  v73 = v47;
  v57 = v63;
  -[RCConfigurationManager _fetchMultiConfigurationFromEndpointURL:settings:networkActivityBlock:changeTagsByRequestKey:completion:](self, "_fetchMultiConfigurationFromEndpointURL:settings:networkActivityBlock:changeTagsByRequestKey:completion:", v32, v71, v63, v52, v69);

  v51 = (void *)v61;
LABEL_34:

}

void __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2;
  v12[3] = &unk_1E470E250;
  v13 = v7;
  v14 = v8;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "_fetchConfigurationFromFallbackURLWithSettings:completion:", a2, v12);

}

void __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    RCSharedLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1A1FB5000, v7, OS_LOG_TYPE_ERROR, "fallback operation failed with error: %@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_58;
    block[3] = &unk_1E470E228;
    v13 = v8;
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_58(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2_62(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requestCacheKey");
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "configurationData");
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "requestKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("widgetConfigRequest"));

  return v3;
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "requestKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("todayConfigRequest"));

  return v3;
}

id __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "fallbackURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "requestCacheKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  RCSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rc_description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "rc_description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "rc_description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1A1FB5000, v2, OS_LOG_TYPE_DEFAULT, "returning the cached configuration for requestKeys: %@ treatmentIDs: %@ segmentSetIDs: %@", buf, 0x20u);

  }
  v7 = *(void **)(a1 + 72);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_73;
    v9[3] = &unk_1E470E3A0;
    v13 = v7;
    v10 = *(id *)(a1 + 64);
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    dispatch_async(v8, v9);

  }
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_73(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_74(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  RCSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A1FB5000, v2, OS_LOG_TYPE_DEFAULT, "not allowed to reach the endpoint at this time, using the fallbackURL", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

RCChangeTag *__110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_75(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  void *v5;
  RCChangeTag *v6;
  void *v7;
  RCChangeTag *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "configurationID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  v5 = (void *)v4;
  objc_msgSend(v3, "contentHash");
  v6 = (RCChangeTag *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "lastModifiedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [RCChangeTag alloc];
      objc_msgSend(v3, "configurationID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "contentHash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastModifiedString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[RCChangeTag initWithIdentifier:contentHash:lastModifiedString:](v8, "initWithIdentifier:contentHash:lastModifiedString:", v5, v9, v10);

      goto LABEL_5;
    }
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
LABEL_5:

LABEL_7:
  return v6;
}

void __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2_79(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    RCSharedLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v12;
      _os_log_impl(&dword_1A1FB5000, v13, OS_LOG_TYPE_ERROR, "endpoint operation failed with error: %@", buf, 0xCu);
    }

  }
  if (v9)
  {
    v14 = *(void **)(a1 + 48);
    if (v14)
    {
      v15 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_80;
      block[3] = &unk_1E470E458;
      v31 = v14;
      v27 = v9;
      v28 = v10;
      v29 = v11;
      v30 = v12;
      dispatch_async(v15, block);

      v16 = v31;
LABEL_11:

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "debugOverrides");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "configurationSource");

    if (v18 != 1)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_13;
    }
    v19 = *(void **)(a1 + 48);
    if (v19)
    {
      v20 = *(NSObject **)(a1 + 32);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2_81;
      v21[3] = &unk_1E470E3A0;
      v25 = v19;
      v22 = v10;
      v23 = v11;
      v24 = v12;
      dispatch_async(v20, v21);

      v16 = v25;
      goto LABEL_11;
    }
  }
LABEL_13:

}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_80(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2_81(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], 0, a1[4], a1[5], a1[6]);
}

- (void)reestablishBackgroundSessionWithSettings:(id)a3 sessionCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RCBackgroundURLSessionHandler *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "backgroundFetchConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationManager reestablishBackgroundSessionWithSettings:sessionCompletionHandler:].cold.1();
  objc_msgSend(v6, "backgroundFetchConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sessionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[RCConfigurationManager backgroundURLSessionHandlersLock](self, "backgroundURLSessionHandlersLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lock");

  -[RCConfigurationManager backgroundURLSessionHandlers](self, "backgroundURLSessionHandlers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v13 = (RCBackgroundURLSessionHandler *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v13 = objc_alloc_init(RCBackgroundURLSessionHandler);
    -[RCConfigurationManager backgroundURLSessionHandlers](self, "backgroundURLSessionHandlers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v10);

  }
  -[RCConfigurationManager backgroundURLSessionHandlersLock](self, "backgroundURLSessionHandlersLock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unlock");

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__RCConfigurationManager_reestablishBackgroundSessionWithSettings_sessionCompletionHandler___block_invoke;
  v19[3] = &unk_1E470E4A8;
  v19[4] = self;
  v20 = v6;
  v21 = v10;
  v22 = v7;
  v16 = v10;
  v17 = v7;
  v18 = v6;
  -[RCBackgroundURLSessionHandler reestablishBackgroundSessionWithConfigurationSettings:sessionCompletionHandler:](v13, "reestablishBackgroundSessionWithConfigurationSettings:sessionCompletionHandler:", v18, v19);

}

void __92__RCConfigurationManager_reestablishBackgroundSessionWithSettings_sessionCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  RCConfigurationFetchResult *v17;
  void *v18;
  RCConfigurationFetchResult *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = v5;
    v26 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        v8 = v4;
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v9, "configurationResourcesByRequestKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 40);
        v29 = 0;
        v30 = 0;
        v27 = 0;
        v28 = 0;
        objc_msgSend(v10, "_processConfigurationCompletionWithResources:configurationSettings:processedConfigurationDataByRequestKey:processedTreatmentIDs:processedSegmentSetIDs:error:", v11, v12, &v30, &v29, &v28, &v27);
        v13 = v30;
        v14 = v29;
        v15 = v28;
        v16 = v27;

        v17 = [RCConfigurationFetchResult alloc];
        objc_msgSend(v9, "taskIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[RCConfigurationFetchResult initWithTaskIdentifier:configurationDataByRequestKey:treatmentIDs:segmentSetIDs:error:](v17, "initWithTaskIdentifier:configurationDataByRequestKey:treatmentIDs:segmentSetIDs:error:", v18, v13, v14, v15, v16);

        v4 = v8;
        objc_msgSend(v8, "addObject:", v19);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v6);
  }

  v20 = *(_QWORD *)(a1 + 56);
  if (v20)
  {
    v21 = (void *)objc_msgSend(v4, "copy");
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);

  }
  objc_msgSend(*(id *)(a1 + 32), "backgroundURLSessionHandlersLock");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lock");

  objc_msgSend(*(id *)(a1 + 32), "backgroundURLSessionHandlers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "backgroundURLSessionHandlersLock");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "unlock");

}

- (void)cancelAllTasksOnBackgroundSessionWithSettings:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "backgroundFetchConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationManager cancelAllTasksOnBackgroundSessionWithSettings:completion:].cold.1();
  objc_msgSend(v5, "backgroundFetchConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCURLSession cancelAllTasksOnBackgroundSessionWithFetchConfig:completion:](RCURLSession, "cancelAllTasksOnBackgroundSessionWithFetchConfig:completion:", v8, v6);

}

- (BOOL)_isValidConfigurationResource:(id)a3 allowedToReachEndpoint:(BOOL)a4 useBackgroundRefreshRate:(BOOL)a5 userID:(id)a6 storefrontID:(id)a7 cachePolicy:(id)a8
{
  _BOOL4 v11;
  _BOOL8 v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  int v23;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  id v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v11 = a5;
  v12 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  if (v13)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "userID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v17, "rc_string:isEqualToString:", v18, v14);

    if ((v17 & 1) != 0)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "storefrontID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v19) = objc_msgSend(v19, "rc_string:isEqualToString:", v20, v15);

      if ((v19 & 1) != 0)
      {
        if (objc_msgSend(v16, "requestCachePolicy") != 1)
        {
          objc_msgSend(v13, "userSegmentationConfiguration");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v11)
          {
            v27 = objc_msgSend(v25, "backgroundRefreshRate");
            v28 = &RCUserSegmentationConfigurationDefaultBackgroundRefreshRate;
          }
          else
          {
            v27 = objc_msgSend(v25, "foregroundRefreshRate");
            v28 = &RCUserSegmentationConfigurationDefaultForegroundRefreshRate;
          }
          v29 = *v28;
          if (v27)
            v30 = v27;
          else
            v30 = v29;

          v23 = objc_msgSend(v13, "isExpiredWithMaxTTL:allowedToReachEndpoint:", v12, (double)v30) ^ 1;
          RCSharedLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v31 = 138413058;
            v32 = v13;
            v33 = 2048;
            v34 = v30;
            v35 = 1024;
            v36 = v23;
            v37 = 1024;
            v38 = v11;
            _os_log_impl(&dword_1A1FB5000, v21, OS_LOG_TYPE_DEFAULT, "checking if configuration is valid with resource: %@ maxTTL: %lu isValid: %d useBackgroundRefreshRate: %d", (uint8_t *)&v31, 0x22u);
          }
          goto LABEL_14;
        }
        RCSharedLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 138412290;
          v32 = v13;
          v22 = "configuration resource not valid due to ignore cache policy: %@";
LABEL_12:
          _os_log_impl(&dword_1A1FB5000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v31, 0xCu);
        }
      }
      else
      {
        RCSharedLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 138412290;
          v32 = v13;
          v22 = "configuration resource no longer valid because the storefrontID changed: %@";
          goto LABEL_12;
        }
      }
    }
    else
    {
      RCSharedLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 138412290;
        v32 = v13;
        v22 = "configuration resource no longer valid because the userID changed: %@";
        goto LABEL_12;
      }
    }
    LOBYTE(v23) = 0;
LABEL_14:

    goto LABEL_15;
  }
  LOBYTE(v23) = 0;
LABEL_15:

  return v23;
}

uint64_t __98__RCConfigurationManager__isAllowedToReachEndpointWithSettings_configurationResource_endpointURL___block_invoke_2()
{
  NSObject *v0;
  uint8_t v2[16];

  RCSharedLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A1FB5000, v0, OS_LOG_TYPE_DEFAULT, "configuration source override enabled: Endpoint", v2, 2u);
  }

  return 1;
}

uint64_t __98__RCConfigurationManager__isAllowedToReachEndpointWithSettings_configurationResource_endpointURL___block_invoke_98()
{
  NSObject *v0;
  uint8_t v2[16];

  RCSharedLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A1FB5000, v0, OS_LOG_TYPE_DEFAULT, "configuration source override enabled: CloudKit", v2, 2u);
  }

  return 0;
}

- (void)_fetchMultiConfigurationFromEndpointURL:(id)a3 settings:(id)a4 networkActivityBlock:(id)a5 changeTagsByRequestKey:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  RCConfigurationManager *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  RCSharedLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v13;
    _os_log_impl(&dword_1A1FB5000, v17, OS_LOG_TYPE_DEFAULT, "enqueuing configuration fetch from endpoint with settings: %@", buf, 0xCu);
  }

  -[RCConfigurationManager configRequestSerialQueue](self, "configRequestSerialQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke;
  v24[3] = &unk_1E470E570;
  v25 = v13;
  v26 = v15;
  v27 = v12;
  v28 = self;
  v29 = v14;
  v30 = v16;
  v19 = v16;
  v20 = v14;
  v21 = v12;
  v22 = v15;
  v23 = v13;
  objc_msgSend(v18, "enqueueBlock:", v24);

}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  RCEndpointOperation *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  RCEndpointOperation *v13;
  _QWORD v14[5];
  RCEndpointOperation *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  RCSharedLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v24 = v5;
    _os_log_impl(&dword_1A1FB5000, v4, OS_LOG_TYPE_DEFAULT, "fetching configuration from endpoint with settings: %@", buf, 0xCu);
  }

  v6 = objc_alloc_init(RCEndpointOperation);
  -[RCOperation setQualityOfService:](v6, "setQualityOfService:", 25);
  -[RCOperation setRelativePriority:](v6, "setRelativePriority:", 1);
  -[RCEndpointOperation setConfigurationSettings:](v6, "setConfigurationSettings:", *(_QWORD *)(a1 + 32));
  -[RCEndpointOperation setChangeTagsByRequestKey:](v6, "setChangeTagsByRequestKey:", *(_QWORD *)(a1 + 40));
  -[RCEndpointOperation setEndpointURL:](v6, "setEndpointURL:", *(_QWORD *)(a1 + 48));
  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
  {
    (*(void (**)(void))(v7 + 16))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCEndpointOperation setNetworkActivity:](v6, "setNetworkActivity:", v8);

  }
  objc_initWeak((id *)buf, v6);
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_102;
  v21[3] = &unk_1E470E4F8;
  v21[4] = *(_QWORD *)(a1 + 56);
  v22 = *(id *)(a1 + 32);
  -[RCEndpointOperation setNetworkEventHandler:](v6, "setNetworkEventHandler:", v21);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_2;
  v16[3] = &unk_1E470E548;
  objc_copyWeak(&v20, (id *)buf);
  v18 = *(id *)(a1 + 72);
  v10 = v3;
  v11 = *(_QWORD *)(a1 + 56);
  v19 = v10;
  v16[4] = v11;
  v17 = *(id *)(a1 + 32);
  -[RCEndpointOperation setConfigurationCompletionHandler:](v6, "setConfigurationCompletionHandler:", v16);
  objc_msgSend(*(id *)(a1 + 56), "runningOperationsLock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_6;
  v14[3] = &unk_1E470DE50;
  v14[4] = *(_QWORD *)(a1 + 56);
  v13 = v6;
  v15 = v13;
  objc_msgSend(v12, "performWithLockSync:", v14);

  -[RCOperation start](v13, "start");
  objc_destroyWeak(&v20);

  objc_destroyWeak((id *)buf);
}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_102(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "networkEventHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "networkEventHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD, _QWORD))v4)[2](v4, v5, *(_QWORD *)(a1 + 40), 0);

  }
}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[7];
  id v25;
  void *v26;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = WeakRetained;
  if (v6)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_3;
    v24[3] = &unk_1E470E520;
    v9 = *(void **)(a1 + 56);
    v25 = *(id *)(a1 + 48);
    v26 = v9;
    v24[4] = v6;
    v24[5] = WeakRetained;
    v24[6] = *(_QWORD *)(a1 + 32);
    v10 = WeakRetained;
    v11 = v9;
    v12 = v6;
    v13 = v25;
    __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_3((uint64_t)v24);
  }
  else
  {
    v14 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v22 = 0;
    v23 = 0;
    v20 = 0;
    v21 = 0;
    objc_msgSend(v14, "_processConfigurationCompletionWithResources:configurationSettings:processedConfigurationDataByRequestKey:processedTreatmentIDs:processedSegmentSetIDs:error:", v5, v15, &v23, &v22, &v21, &v20);
    v12 = v23;
    v11 = v22;
    v10 = v21;
    v13 = v20;
    v16 = *(_QWORD *)(a1 + 48);
    if (v16)
      (*(void (**)(uint64_t, id, id, id, id))(v16 + 16))(v16, v12, v11, v10, v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "runningOperationsLock");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_5;
      v18[3] = &unk_1E470DE50;
      v18[4] = *(_QWORD *)(a1 + 32);
      v19 = v8;
      objc_msgSend(v17, "performWithLockSync:", v18);

    }
  }

}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, 0, 0, 0, *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "runningOperationsLock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_4;
    v6[3] = &unk_1E470DE50;
    v5 = *(int8x16_t *)(a1 + 40);
    v4 = (id)v5.i64[0];
    v7 = vextq_s8(v5, v5, 8uLL);
    objc_msgSend(v3, "performWithLockSync:", v6);

  }
}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "runningOperations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "runningOperations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "runningOperations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (id)_endpointURLForEnvironment:(unint64_t)a3 requestKey:(id)a4
{
  id v5;
  const __CFString **v6;
  const __CFString *v7;
  __CFString **v8;
  void *v9;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("appConfigRequest")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("magazinesConfigRequest")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("audioConfigRequest"))
    || objc_msgSend(v5, "isEqualToString:", CFSTR("widgetConfigRequest")))
  {
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("todayConfigRequest")))
  {
    if (a3 >= 5)
      goto LABEL_22;
    v8 = off_1E470E628;
LABEL_18:
    v6 = (const __CFString **)&v8[a3];
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("stocksConfigRequest")))
  {
    if (a3 >= 5)
      goto LABEL_22;
    v8 = off_1E470E650;
    goto LABEL_18;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("weatherConfigRequest")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("weather2ConfigRequest")))
  {
    if (a3 >= 5)
      goto LABEL_22;
    v8 = off_1E470E678;
    goto LABEL_18;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("booksConfigRequest")))
  {
    if (a3 >= 5)
      goto LABEL_22;
    v8 = off_1E470E6A0;
    goto LABEL_18;
  }
  RCSharedLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = 138543362;
    v13 = v5;
    _os_log_impl(&dword_1A1FB5000, v11, OS_LOG_TYPE_ERROR, "No endpoint URL available for requestKey: %{public}@ falling back to news-edge", (uint8_t *)&v12, 0xCu);
  }

LABEL_5:
  if (a3 - 1 >= 4)
  {
LABEL_22:
    v7 = CFSTR("https://news-edge.apple.com/v1/configs");
    goto LABEL_23;
  }
  v6 = (const __CFString **)&off_1E470E6C8[a3 - 1];
LABEL_7:
  v7 = *v6;
LABEL_23:
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_endpointURLForEndpointConfig:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    switch(objc_msgSend(v3, "environment"))
    {
      case 0:
        objc_msgSend(v4, "productionURL");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 1:
        objc_msgSend(v4, "stagingURL");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 2:
        objc_msgSend(v4, "qaURL");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 3:
        objc_msgSend(v4, "develURL");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 4:
        objc_msgSend(v4, "testURL");
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v7 = (void *)v5;
        if (!v5)
          goto LABEL_13;
        RCSharedLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "environmentDescription");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138543618;
          v12 = v7;
          v13 = 2114;
          v14 = v8;
          _os_log_impl(&dword_1A1FB5000, v6, OS_LOG_TYPE_ERROR, "Found endpoint URL: %{public}@ for enviroment: %{public}@", (uint8_t *)&v11, 0x16u);

        }
        goto LABEL_16;
      default:
LABEL_13:
        RCSharedLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "environmentDescription");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138543362;
          v12 = v9;
          _os_log_impl(&dword_1A1FB5000, v6, OS_LOG_TYPE_ERROR, "No endpoint URL found in the endpointConfig for enviroment: %{public}@", (uint8_t *)&v11, 0xCu);

        }
        goto LABEL_15;
    }
  }
  RCSharedLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1A1FB5000, v6, OS_LOG_TYPE_DEFAULT, "EndpointConfig not available, falling back to the config to look for the endpointURL", (uint8_t *)&v11, 2u);
  }
LABEL_15:
  v7 = 0;
LABEL_16:

  return v7;
}

- (void)_fetchConfigurationFromFallbackURLWithSettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  RCConfigurationManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[RCConfigurationManager configRequestSerialQueue](self, "configRequestSerialQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke;
  v11[3] = &unk_1E470E608;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enqueueBlock:", v11);

}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  RCFallbackOperation *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  RCFallbackOperation *v30;
  int8x16_t v31;
  _QWORD v32[5];
  RCFallbackOperation *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  int8x16_t v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  RCSharedLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 138412290;
    v50 = v5;
    _os_log_impl(&dword_1A1FB5000, v4, OS_LOG_TYPE_DEFAULT, "fetching configuration from fallback with settings: %@", buf, 0xCu);
  }

  objc_msgSend(a1[4], "requestInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rc_firstObjectPassingTest:", &__block_literal_global_106);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(a1[4], "requestInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v45;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v11);
        if (v12 != v7)
        {
          v13 = a1[5];
          objc_msgSend(v12, "requestKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_removeConfigurationResourceForRequestKey:", v14);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v9);
  }

  if (v7)
  {
    v15 = objc_alloc_init(RCFallbackOperation);
    -[RCOperation setQualityOfService:](v15, "setQualityOfService:", 25);
    -[RCOperation setRelativePriority:](v15, "setRelativePriority:", 1);
    objc_msgSend(v7, "fallbackURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCFallbackOperation setFallbackURL:](v15, "setFallbackURL:", v16);

    objc_msgSend(v7, "requestCacheKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCFallbackOperation setRequestKey:](v15, "setRequestKey:", v17);

    objc_msgSend(a1[4], "debugOverrides");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCFallbackOperation setEnableExtraLogs:](v15, "setEnableExtraLogs:", objc_msgSend(v18, "enableExtraLogs"));

    objc_msgSend(a1[4], "debugOverrides");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCFallbackOperation setEnvironment:](v15, "setEnvironment:", objc_msgSend(v19, "debugEnvironment"));

    objc_msgSend(a1[5], "configResourceByRequestKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestCacheKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCFallbackOperation setCachedConfigurationResource:](v15, "setCachedConfigurationResource:", v22);

    objc_msgSend(a1[4], "fallbackTimeoutDuration");
    -[RCFallbackOperation setFallbackTimeoutDuration:](v15, "setFallbackTimeoutDuration:");
    objc_msgSend(a1[4], "userID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCFallbackOperation setUserID:](v15, "setUserID:", v23);

    objc_msgSend(a1[4], "storefrontID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCFallbackOperation setStorefrontID:](v15, "setStorefrontID:", v24);

    objc_initWeak((id *)buf, v15);
    v25 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_108;
    v39[3] = &unk_1E470E4F8;
    v31 = *((int8x16_t *)a1 + 2);
    v26 = (id)v31.i64[0];
    v40 = vextq_s8(v31, v31, 8uLL);
    -[RCFallbackOperation setNetworkEventHandler:](v15, "setNetworkEventHandler:", v39);
    v34[0] = v25;
    v34[1] = 3221225472;
    v34[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_2_109;
    v34[3] = &unk_1E470E5E0;
    objc_copyWeak(&v38, (id *)buf);
    v36 = a1[6];
    v27 = v3;
    v28 = a1[5];
    v37 = v27;
    v34[4] = v28;
    v35 = v7;
    -[RCFallbackOperation setConfigurationCompletionHandler:](v15, "setConfigurationCompletionHandler:", v34);
    objc_msgSend(a1[5], "runningOperationsLock");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v25;
    v32[1] = 3221225472;
    v32[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_6;
    v32[3] = &unk_1E470DE50;
    v32[4] = a1[5];
    v30 = v15;
    v33 = v30;
    objc_msgSend(v29, "performWithLockSync:", v32);

    -[RCOperation start](v30, "start");
    objc_destroyWeak(&v38);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_2;
    v41[3] = &unk_1E470E5B8;
    v42 = a1[6];
    v43 = v3;
    v30 = (RCFallbackOperation *)v42;
    __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_2((uint64_t)v41);
  }

}

BOOL __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_105(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "fallbackURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v5[16];

  RCSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A1FB5000, v2, OS_LOG_TYPE_DEFAULT, "fallback operation failed, missing fallbackURL", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_108(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "networkEventHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "networkEventHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD, uint64_t))v4)[2](v4, v5, *(_QWORD *)(a1 + 40), 1);

  }
}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_2_109(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[7];
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = WeakRetained;
  if (!v5 || v6)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_3;
    v20[3] = &unk_1E470E520;
    v14 = *(void **)(a1 + 56);
    v21 = *(id *)(a1 + 48);
    v22 = v14;
    v20[4] = v6;
    v20[5] = WeakRetained;
    v20[6] = *(_QWORD *)(a1 + 32);
    v15 = WeakRetained;
    v16 = v14;
    v17 = v6;
    v11 = v21;
    __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_3((uint64_t)v20);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_saveConfigurationResource:", v5);
    objc_msgSend(*(id *)(a1 + 40), "requestKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v9;
    objc_msgSend(v5, "configurationData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, id, _QWORD))(v12 + 16))(v12, v11, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "runningOperationsLock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_5;
      v18[3] = &unk_1E470DE50;
      v18[4] = *(_QWORD *)(a1 + 32);
      v19 = v8;
      objc_msgSend(v13, "performWithLockSync:", v18);

    }
  }

}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "runningOperationsLock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_4;
    v6[3] = &unk_1E470DE50;
    v5 = *(int8x16_t *)(a1 + 40);
    v4 = (id)v5.i64[0];
    v7 = vextq_s8(v5, v5, 8uLL);
    objc_msgSend(v3, "performWithLockSync:", v6);

  }
}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "runningOperations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "runningOperations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "runningOperations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)_removeConfigurationResourceForRequestKey:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RCConfigurationManager configResourceByRequestKey](self, "configResourceByRequestKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  -[RCConfigurationManager localStore](self, "localStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v4);

}

- (RCConfigurationSettings)configurationSettings
{
  return self->_configurationSettings;
}

- (void)setConfigurationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_configurationSettings, a3);
}

- (RCDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (NSURL)contentDirectoryURL
{
  return self->_contentDirectoryURL;
}

- (void)setContentDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_contentDirectoryURL, a3);
}

- (void)setConfigRequestSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_configRequestSerialQueue, a3);
}

- (void)setLocalStore:(id)a3
{
  objc_storeStrong((id *)&self->_localStore, a3);
}

- (void)setRunningOperations:(id)a3
{
  objc_storeStrong((id *)&self->_runningOperations, a3);
}

- (void)setRunningOperationsLock:(id)a3
{
  objc_storeStrong((id *)&self->_runningOperationsLock, a3);
}

- (NSMutableDictionary)backgroundURLSessionHandlers
{
  return self->_backgroundURLSessionHandlers;
}

- (void)setBackgroundURLSessionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundURLSessionHandlers, a3);
}

- (RCUnfairLock)backgroundURLSessionHandlersLock
{
  return self->_backgroundURLSessionHandlersLock;
}

- (void)setBackgroundURLSessionHandlersLock:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundURLSessionHandlersLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundURLSessionHandlersLock, 0);
  objc_storeStrong((id *)&self->_backgroundURLSessionHandlers, 0);
  objc_storeStrong((id *)&self->_runningOperationsLock, 0);
  objc_storeStrong((id *)&self->_runningOperations, 0);
  objc_storeStrong((id *)&self->_configResourceByRequestKey, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_configRequestSerialQueue, 0);
  objc_storeStrong((id *)&self->_contentDirectoryURL, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_configurationSettings, 0);
  objc_storeStrong(&self->_networkEventHandler, 0);
}

- (void)reestablishBackgroundSessionWithSettings:sessionCompletionHandler:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"configurationSettings.backgroundFetchConfiguration", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)cancelAllTasksOnBackgroundSessionWithSettings:completion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"configurationSettings.backgroundFetchConfiguration", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
