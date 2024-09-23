@implementation TBCoreDataSource

- (TBCoreDataSource)initWithStoreDescriptor:(id)a3
{
  TBCoreDataStoreDescriptor *v4;
  TBCoreDataSource *v5;
  TBCoreDataStoreDescriptor *descriptor;
  TBCoreDataStoreDescriptor *v7;
  id v8;
  void *v9;
  void *v10;
  TBPersistenceManager *v11;
  TBPersistenceManager *persistenceManager;
  TBPersistenceManager *v13;
  uint64_t v14;
  TBCoreDataSource *v15;
  void *v16;
  void *v17;
  NSManagedObjectContext *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSManagedObjectContext *context;
  NSManagedObjectContext *v24;
  TBCoreDataSource *v25;
  TBCoreDataSource *v26;
  TBCoreDataSource *v27;
  _QWORD v29[4];
  TBCoreDataSource *v30;
  _QWORD v31[4];
  TBCoreDataSource *v32;
  objc_super v33;

  v4 = (TBCoreDataStoreDescriptor *)a3;
  v33.receiver = self;
  v33.super_class = (Class)TBCoreDataSource;
  v5 = -[TBCoreDataSource init](&v33, sel_init);
  descriptor = v5->_descriptor;
  v5->_descriptor = v4;
  v7 = v4;

  v8 = objc_alloc(MEMORY[0x1E0C97B98]);
  -[TBCoreDataStoreDescriptor modelURL](v7, "modelURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithContentsOfURL:", v9);

  v11 = -[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]([TBPersistenceManager alloc], "initWithManagedObjectModel:storeDescriptor:", v10, v7);
  persistenceManager = v5->_persistenceManager;
  v5->_persistenceManager = v11;

  v13 = v5->_persistenceManager;
  v14 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __44__TBCoreDataSource_initWithStoreDescriptor___block_invoke;
  v31[3] = &unk_1E881D728;
  v15 = v5;
  v32 = v15;
  -[TBPersistenceManager addPersistentStorage:completionHandler:](v13, "addPersistentStorage:completionHandler:", v7, v31);
  -[TBCoreDataStoreDescriptor modelURL](v7, "modelURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s: object model at URL: %@"), "-[TBCoreDataSource initWithStoreDescriptor:]", v16);

  -[TBCoreDataStoreDescriptor storeURL](v7, "storeURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s: store URL: %@"), "-[TBCoreDataSource initWithStoreDescriptor:]", v17);

  v18 = (NSManagedObjectContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  objc_msgSend(MEMORY[0x1E0C97BA8], "mergeByPropertyObjectTrumpMergePolicy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObjectContext setMergePolicy:](v18, "setMergePolicy:", v19);

  -[TBPersistenceManager persistenceCoordinator](v5->_persistenceManager, "persistenceCoordinator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObjectContext setPersistentStoreCoordinator:](v18, "setPersistentStoreCoordinator:", v20);

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "processName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObjectContext setTransactionAuthor:](v18, "setTransactionAuthor:", v22);

  context = v15->_context;
  v15->_context = v18;
  v24 = v18;

  v29[0] = v14;
  v29[1] = 3221225472;
  v29[2] = __44__TBCoreDataSource_initWithStoreDescriptor___block_invoke_2;
  v29[3] = &unk_1E881D5A8;
  v25 = v15;
  v30 = v25;
  +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:](WCAFetchWiFiBehaviorParameters, "fetchWiFiBehaviorWithCompletion:", v29);
  v26 = v30;
  v27 = v25;

  return v27;
}

- (void)_executeFetchRequest:(id)a3
{
  id v4;
  TBError *v5;
  void *v6;
  TBError *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  _QWORD v23[8];
  _QWORD v24[9];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[TBCoreDataSource _canSupportRequest:](self, "_canSupportRequest:", v4))
  {
    if (-[TBCoreDataSource hasStorageError](self, "hasStorageError"))
    {
      v5 = [TBError alloc];
      v37 = *MEMORY[0x1E0CB2D50];
      v38 = CFSTR("Failed to add persistent store.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[TBError initWithType:userInfo:](v5, "initWithType:userInfo:", 104, v6);

      +[TBErrorFetchResponse responseWithError:](TBErrorFetchResponse, "responseWithError:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleResponse:", v8);

    }
    else
    {
      objc_msgSend(v4, "descriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localFetchDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fetchRequest");
      v7 = (TBError *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v13 = mach_absolute_time();
        v31 = 0;
        v32 = &v31;
        v33 = 0x2020000000;
        v34 = 0;
        v25 = 0;
        v26 = &v25;
        v27 = 0x3032000000;
        v28 = __Block_byref_object_copy__4;
        v29 = __Block_byref_object_dispose__4;
        v30 = 0;
        objc_msgSend(v4, "descriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "type") == 1;

        if (v15)
        {
          -[TBError setResultType:](v7, "setResultType:", 2);
          -[TBError setPropertiesToFetch:](v7, "setPropertiesToFetch:", &unk_1E8863F68);
          -[TBError setAllocationType:](v7, "setAllocationType:", 1);
          -[TBCoreDataSource context](self, "context");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __41__TBCoreDataSource__executeFetchRequest___block_invoke;
          v24[3] = &unk_1E881D750;
          v17 = v24;
          v24[4] = self;
          v24[5] = v7;
          v24[7] = &v25;
          v24[6] = v4;
          v24[8] = &v31;
          objc_msgSend(v16, "performBlockAndWait:", v24);
        }
        else
        {
          -[TBCoreDataSource context](self, "context");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __41__TBCoreDataSource__executeFetchRequest___block_invoke_2;
          v23[3] = &unk_1E881D778;
          v17 = v23;
          v23[4] = self;
          v23[5] = v7;
          v23[6] = v4;
          v23[7] = &v31;
          objc_msgSend(v16, "performBlockAndWait:", v23);
        }

        v21 = mach_absolute_time();
        v22 = MachTimeToSecs(v21 - v13);
        NSLog(CFSTR("%s: fetched %lu results in %gs"), "-[TBCoreDataSource _executeFetchRequest:]", v32[3], *(_QWORD *)&v22);
        -[TBDataSource submitAnalyticsEventForFetchRequest:duration:error:resultCount:](self, "submitAnalyticsEventForFetchRequest:duration:error:resultCount:", v4, v26[5], v32[3], v22);
        _Block_object_dispose(&v25, 8);

        _Block_object_dispose(&v31, 8);
      }
      else
      {
        v35 = *MEMORY[0x1E0CB2D50];
        v36 = CFSTR("localFetchDescriptor is nil");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[TBError fetchMissingParametersErrorWithUserInfo:](TBError, "fetchMissingParametersErrorWithUserInfo:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        +[TBErrorFetchResponse responseWithError:](TBErrorFetchResponse, "responseWithError:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleResponse:", v20);

      }
    }
  }
  else
  {
    v39 = *MEMORY[0x1E0CB2D50];
    v40[0] = CFSTR("unhandled fetch request type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBError fetchMissingParametersErrorWithUserInfo:](TBError, "fetchMissingParametersErrorWithUserInfo:", v9);
    v7 = (TBError *)objc_claimAutoreleasedReturnValue();

    +[TBErrorFetchResponse responseWithError:](TBErrorFetchResponse, "responseWithError:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleResponse:", v10);

  }
}

- (unint64_t)type
{
  return 0;
}

- (BOOL)hasStorageError
{
  return self->_hasStorageError;
}

- (BOOL)_canSupportRequest:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") == 1)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "type") == 2)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "descriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "type") == 3;

    }
  }

  return v5;
}

void __41__TBCoreDataSource__executeFetchRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
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
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  id obj;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v6)
  {
    NSLog(CFSTR("%s: failed fetch for access points with error %@"), "-[TBCoreDataSource _executeFetchRequest:]_block_invoke", v6);
    v7 = *(void **)(a1 + 48);
    +[TBErrorFetchResponse responseWithError:](TBErrorFetchResponse, "responseWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleResponse:", v8);
  }
  else
  {
    +[TBNetworkMO fetchRequest](TBNetworkMO, "fetchRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "valueForKey:", CFSTR("network"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithFormat:", CFSTR("self IN %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v11);

    objc_msgSend(v8, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v37 = *(id *)(v13 + 40);
    objc_msgSend(v12, "executeFetchRequest:error:", v8, &v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v13 + 40), v37);

    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v14 || v15)
    {
      NSLog(CFSTR("%s: failed fetch for networks with error %@"), "-[TBCoreDataSource _executeFetchRequest:]_block_invoke", v15);
      v28 = *(void **)(a1 + 48);
      +[TBErrorFetchResponse responseWithError:](TBErrorFetchResponse, "responseWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleResponse:", v16);
    }
    else
    {
      v29 = v14;
      v30 = v8;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v31 = v5;
      v32 = v5;
      v17 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v34 != v19)
              objc_enumerationMutation(v32);
            v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v21, "objectForKey:", CFSTR("bssid"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKey:", CFSTR("network"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "context");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectWithID:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v25, v22);

          }
          v18 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v18);
      }

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v16, "count");
      v26 = *(void **)(a1 + 48);
      +[TBLocalFetchResponse responseWithResultsByBSSID:](TBLocalFetchResponse, "responseWithResultsByBSSID:", v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleResponse:", v27);

      v8 = v30;
      v5 = v31;
      v14 = v29;
    }

  }
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)executeFetchRequest:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "sourcePolicy") == 3)
    -[TBCoreDataSource _executePreferLocalFetchRequest:](self, "_executePreferLocalFetchRequest:", v4);
  else
    -[TBCoreDataSource _executeFetchRequest:](self, "_executeFetchRequest:", v4);

}

void __41__TBCoreDataSource__executeFetchRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;

  if (v5)
  {
    NSLog(CFSTR("%s: error %@"), "-[TBCoreDataSource _executeFetchRequest:]_block_invoke_2", v5);
    v6 = *(void **)(a1 + 48);
    +[TBErrorFetchResponse responseWithError:](TBErrorFetchResponse, "responseWithError:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleResponse:", v7);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "count");
    v8 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "entity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBLocalFetchResponse responseWithResults:entityDescription:](TBLocalFetchResponse, "responseWithResults:entityDescription:", v4, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleResponse:", v9);

    v5 = (id)v9;
  }

}

- (void)_executePreferLocalFetchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferLocalFetchDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TBCoreDataSource context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__TBCoreDataSource__executePreferLocalFetchRequest___block_invoke;
  v11[3] = &unk_1E881CF98;
  v11[4] = self;
  v12 = v7;
  v13 = v4;
  v9 = v4;
  v10 = v7;
  objc_msgSend(v8, "performBlock:", v11);

}

void __44__TBCoreDataSource_initWithStoreDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "jtrnDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "valueForKey:", CFSTR("kWiFiCoreDataSourceExpirationDays"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = (int)objc_msgSend(v4, "intValue");

    v3 = v5;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __44__TBCoreDataSource_initWithStoreDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSLog(CFSTR("%s: add the persistent storage error %@"), "-[TBCoreDataSource initWithStoreDescriptor:]_block_invoke", a2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  }
}

void __52__TBCoreDataSource__executePreferLocalFetchRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  TBError *v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  int v9;
  TBError *v10;
  void *v11;
  TBError *v12;
  uint64_t v13;
  TBError *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v17 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;

  if (v5)
  {
    NSLog(CFSTR("%s: error %@"), "-[TBCoreDataSource _executePreferLocalFetchRequest:]_block_invoke", v5);
    v6 = *(void **)(a1 + 48);
    +[TBErrorFetchResponse responseWithError:](TBErrorFetchResponse, "responseWithError:", v5);
    v7 = (TBError *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleResponse:", v7);
LABEL_11:

    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "count"))
  {
    v10 = [TBError alloc];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("pref local cache doesn't satisfy request (0 results)");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = 103;
LABEL_10:
    v7 = -[TBError initWithType:userInfo:](v12, "initWithType:userInfo:", v13, v11);

    v15 = *(void **)(a1 + 48);
    +[TBErrorFetchResponse responseWithError:](TBErrorFetchResponse, "responseWithError:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleResponse:", v16);

    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 48), "handlePreferLocalResponse:", v4);
  objc_msgSend(*(id *)(a1 + 48), "preferLocalHandler");
  v8 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9 = ((uint64_t (**)(_QWORD, void *))v8)[2](v8, v4);

  if (!v9)
  {
    v14 = [TBError alloc];
    v18 = *MEMORY[0x1E0CB2D50];
    v19 = CFSTR("pref local cache doesn't satisfy request (1 or more missing results)");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    v13 = 102;
    goto LABEL_10;
  }
  NSLog(CFSTR("%s: local results satisfy request (count %lu)"), "-[TBCoreDataSource _executePreferLocalFetchRequest:]_block_invoke", objc_msgSend(v4, "count"));
  objc_msgSend(*(id *)(a1 + 32), "_executeFetchRequest:", *(_QWORD *)(a1 + 48));
LABEL_12:

}

- (void)cacheFetchResponse:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t j;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id obj;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void (**v71)(id, void *);
  uint64_t v72;
  void *context;
  void *contexta;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  _QWORD v82[4];
  id v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[4];
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  id v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[4];
  id v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[4];
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v71 = (void (**)(id, void *))a4;
  v66 = v5;
  NSLog(CFSTR("%s: caching response %@"), "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v5);
  v65 = (void *)os_transaction_create();
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: error %@"), "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v7);

    if (v71)
    {
      objc_msgSend(v5, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v71[2](v71, v8);

    }
  }
  else
  {
    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
    -[TBCoreDataSource persistenceManager](self, "persistenceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistenceCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setPersistentStoreCoordinator:", v10);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingDays:", --[TBCoreDataSource cacheExpirationInDays](self, "cacheExpirationInDays"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v66, "tiles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(created < %@)"), v63);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      +[TBTileMO removeTilesUsingPredicate:moc:](TBTileMO, "removeTilesUsingPredicate:moc:", v62, v64);
      v14 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v66, "tiles");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "count"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      objc_msgSend(v66, "tiles");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v120, v127, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v121;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v121 != v18)
              objc_enumerationMutation(v16);
            v20 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * i), "tile");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "numberWithLongLong:", objc_msgSend(v21, "key"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "addObject:", v22);

          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v120, v127, 16);
        }
        while (v17);
      }

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(key IN %@)"), v70);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      +[TBTileMO removeTilesUsingPredicate:moc:](TBTileMO, "removeTilesUsingPredicate:moc:", v61, v64);
      v118[0] = MEMORY[0x1E0C809B0];
      v118[1] = 3221225472;
      v118[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke;
      v118[3] = &unk_1E881C8E8;
      v23 = v64;
      v119 = v23;
      objc_msgSend(v23, "performBlockAndWait:", v118);
      objc_msgSend(v66, "tiles");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v24, "count");

      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      objc_msgSend(v66, "tiles");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v126, 16);
      if (v69)
      {
        v78 = 0;
        v68 = *(_QWORD *)v115;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v115 != v68)
            {
              v26 = v25;
              objc_enumerationMutation(obj);
              v25 = v26;
            }
            v72 = v25;
            v27 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v25);
            context = (void *)MEMORY[0x1D17AC818]();
            objc_msgSend(v27, "tile");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            +[TBTileMO generateNewTileObjectFromMOC:](TBTileMO, "generateNewTileObjectFromMOC:", v23);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setKey:", objc_msgSend(v28, "key"));
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setCreated:", v30);

            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v28, "etag");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setEtag:", v31);

            }
            else
            {
              NSLog(CFSTR("%s: tile (%@) doesn't respond to etag"), "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v28);
            }
            objc_msgSend(v27, "networks");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "count");
            NSLog(CFSTR("%s: %ld results for tile[%ld] (key: %ld) available"), "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v33, v78++, objc_msgSend(v28, "key"));
            v108 = 0;
            v109 = &v108;
            v110 = 0x3032000000;
            v111 = __Block_byref_object_copy__4;
            v112 = __Block_byref_object_dispose__4;
            v113 = 0;
            if (v33)
            {
              if (v33 >= 1)
              {
                v34 = 0;
                v35 = 1;
                do
                {
                  objc_msgSend(v32, "objectAtIndexedSubscript:", v34);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TBCoreDataSource _createNewNetwork:tile:withMOC:](self, "_createNewNetwork:tile:withMOC:", v36, v29, v23);
                  v37 = v34 + 1;
                  if (100 * (v35 / 0x64) - 1 == v34 || v33 - 1 == v34)
                  {
                    NSLog(CFSTR("%s: Saving entries %ld of %ld"), "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v34 + 1, v33);
                    v98[0] = MEMORY[0x1E0C809B0];
                    v98[1] = 3221225472;
                    v98[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_3;
                    v98[3] = &unk_1E881D7A0;
                    v99 = v23;
                    v100 = &v108;
                    v101 = v78;
                    v102 = v75;
                    objc_msgSend(v99, "performBlockAndWait:", v98);

                  }
                  ++v35;
                  ++v34;
                }
                while (v33 != v37);
              }
            }
            else
            {
              NSLog(CFSTR("%s: saving empty tile (key: %ld)"), "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", objc_msgSend(v28, "key"));
              v103[0] = MEMORY[0x1E0C809B0];
              v103[1] = 3221225472;
              v103[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_2;
              v103[3] = &unk_1E881D7A0;
              v104 = v23;
              v105 = &v108;
              v106 = v78;
              v107 = v75;
              objc_msgSend(v104, "performBlockAndWait:", v103);

            }
            if (v71 && v78 == v75)
              v71[2](v71, (void *)v109[5]);
            _Block_object_dispose(&v108, 8);

            objc_autoreleasePoolPop(context);
            v25 = v72 + 1;
          }
          while (v72 + 1 != v69);
          v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v126, 16);
        }
        while (v69);
      }

    }
    else
    {
      objc_msgSend(v66, "results");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");

      if (v40)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        objc_msgSend(v66, "results");
        contexta = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(contexta, "countByEnumeratingWithState:objects:count:", &v94, v125, 16);
        if (v79)
        {
          v76 = *(_QWORD *)v95;
          do
          {
            for (j = 0; j != v79; ++j)
            {
              if (*(_QWORD *)v95 != v76)
                objc_enumerationMutation(contexta);
              v43 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
              v90 = 0u;
              v91 = 0u;
              v92 = 0u;
              v93 = 0u;
              objc_msgSend(v43, "accessPoints");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v90, v124, 16);
              if (v45)
              {
                v46 = *(_QWORD *)v91;
                do
                {
                  for (k = 0; k != v45; ++k)
                  {
                    if (*(_QWORD *)v91 != v46)
                      objc_enumerationMutation(v44);
                    v48 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * k);
                    objc_msgSend(v48, "BSSID");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v49)
                    {
                      objc_msgSend(v48, "BSSID");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "addObject:", v50);

                    }
                    else
                    {
                      NSLog(CFSTR("%s: null BSSID for network %@"), "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v43);
                    }
                  }
                  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v90, v124, 16);
                }
                while (v45);
              }

            }
            v79 = objc_msgSend(contexta, "countByEnumeratingWithState:objects:count:", &v94, v125, 16);
          }
          while (v79);
        }

        +[TBAccessPointMO fetchRequest](TBAccessPointMO, "fetchRequest");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "bssidPredicate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "setPredicate:", v51);

        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v80);
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_4;
        v87[3] = &unk_1E881C8C0;
        v53 = v64;
        v88 = v53;
        v77 = v52;
        v89 = v77;
        objc_msgSend(v53, "performBlockAndWait:", v87);
        objc_msgSend(v66, "results");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "count");
        NSLog(CFSTR("%s: %ld results available"), "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v55);
        v56 = v55 - 1;
        if (v55 >= 1)
        {
          v57 = 0;
          v58 = 1;
          do
          {
            objc_msgSend(v54, "objectAtIndexedSubscript:", v57);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[TBCoreDataSource _createNewNetwork:tile:withMOC:](self, "_createNewNetwork:tile:withMOC:", v59, 0, v53);
            v60 = v57 + 1;
            if (v56 == v57 || 100 * (v58 / 0x64) - 1 == v57)
            {
              NSLog(CFSTR("%s: Saving entries %ld of %ld"), "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v57 + 1, v55);
              v108 = 0;
              v109 = &v108;
              v110 = 0x3032000000;
              v111 = __Block_byref_object_copy__4;
              v112 = __Block_byref_object_dispose__4;
              v113 = 0;
              v82[0] = MEMORY[0x1E0C809B0];
              v82[1] = 3221225472;
              v82[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_5;
              v82[3] = &unk_1E881D7A0;
              v83 = v53;
              v84 = &v108;
              v85 = v57 + 1;
              v86 = v55;
              objc_msgSend(v83, "performBlockAndWait:", v82);
              if (v71 && v56 == v57)
                v71[2](v71, (void *)v109[5]);

              _Block_object_dispose(&v108, 8);
            }

            ++v58;
            ++v57;
          }
          while (v55 != v60);
        }

      }
      else
      {
        NSLog(CFSTR("%s: empty results in response %@"), "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v66);
        if (v71)
          v71[2](v71, 0);
      }
    }

  }
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = 0;
  objc_msgSend(v2, "save:", &v5);
  v3 = v5;
  v4 = v3;
  if (v3)
    NSLog(CFSTR("save error %@"), v3);
  objc_msgSend(*(id *)(a1 + 32), "reset");

}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "save:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    NSLog(CFSTR("save error %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (*(_QWORD *)(a1 + 48) == *(_QWORD *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "save:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    NSLog(CFSTR("save error %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (*(_QWORD *)(a1 + 48) == *(_QWORD *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v6 = 0;
  v3 = (id)objc_msgSend(v2, "executeRequest:error:", v1, &v6);
  v4 = v6;
  v5 = v4;
  if (v4)
    NSLog(CFSTR("%s: ap delete error %@"), "-[TBCoreDataSource cacheFetchResponse:completionHandler:]_block_invoke_4", v4);

}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "save:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    NSLog(CFSTR("save error %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (*(_QWORD *)(a1 + 48) == *(_QWORD *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (void)removeAllWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  -[TBCoreDataSource persistenceManager](self, "persistenceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistenceCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPersistentStoreCoordinator:", v8);

  NSLog(CFSTR("%s: removing all"), "-[TBCoreDataSource removeAllWithCompletionHandler:]");
  +[TBNetworkMO removeAllNetworksInMOC:](TBNetworkMO, "removeAllNetworksInMOC:", v6);
  +[TBTileMO removeAllTilesInMOC:](TBTileMO, "removeAllTilesInMOC:", v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__TBCoreDataSource_removeAllWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E881CED0;
  v12 = v6;
  v13 = v4;
  v9 = v4;
  v10 = v6;
  objc_msgSend(v10, "performBlockAndWait:", v11);

}

void __51__TBCoreDataSource_removeAllWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  objc_msgSend(v2, "save:", &v6);
  v3 = v6;
  v4 = v3;
  if (v3)
    NSLog(CFSTR("save error %@"), v3);
  objc_msgSend(*(id *)(a1 + 32), "reset");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

}

- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  unint64_t v14;
  id v15;

  v6 = a4;
  -[TBCoreDataStoreDescriptor storeURL](self->_descriptor, "storeURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v9, "attributesOfItemAtPath:error:", v8, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (v10)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (v12)
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "longLongValue");
    if (v14 > a3)
    {
      NSLog(CFSTR("Local store size %llu bytes exceeds imposed limit of %lu bytes, purging entire store"), v14, a3);
      -[TBCoreDataSource removeAllWithCompletionHandler:](self, "removeAllWithCompletionHandler:", v6);
    }

  }
  else
  {
    NSLog(CFSTR("Failed to get attributes for storeURL with error %@"), v11);
  }

}

- (void)removeWithFetchRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localFetchDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    NSLog(CFSTR("%s: removing all matching fetch request %@"), "-[TBCoreDataSource removeWithFetchRequest:completionHandler:]", v8);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v8);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
    -[TBCoreDataSource persistenceManager](self, "persistenceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistenceCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPersistentStoreCoordinator:", v12);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __61__TBCoreDataSource_removeWithFetchRequest_completionHandler___block_invoke;
    v18[3] = &unk_1E881CF98;
    v19 = v10;
    v20 = v9;
    v21 = v8;
    v13 = v9;
    v14 = v10;
    objc_msgSend(v14, "performBlockAndWait:", v18);

  }
  else
  {
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("localFetchDescriptor is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBError fetchMissingParametersErrorWithUserInfo:](TBError, "fetchMissingParametersErrorWithUserInfo:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[TBErrorFetchResponse responseWithError:](TBErrorFetchResponse, "responseWithError:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleResponse:", v17);

  }
}

void __61__TBCoreDataSource_removeWithFetchRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (void *)MEMORY[0x1D17AC818]();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  v5 = (id)objc_msgSend(v3, "executeRequest:error:", v4, &v10);
  v6 = v10;
  v7 = v6;
  if (v6)
  {
    NSLog(CFSTR("%s: error %@"), "-[TBCoreDataSource removeWithFetchRequest:completionHandler:]_block_invoke", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Removed items (%@) that match supplied predicate <%@>"), "-[TBCoreDataSource removeWithFetchRequest:completionHandler:]_block_invoke", v8, v9);

  }
  objc_autoreleasePoolPop(v2);
}

- (void)_createNewNetwork:(id)a3 tile:(id)a4 withMOC:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TBCentroidCalculator *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  double v35;
  double v36;
  void *context;
  id v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v38 = a4;
  v8 = a5;
  context = (void *)MEMORY[0x1D17AC818]();
  v40 = v8;
  +[TBNetworkMO generateNewNetworkObjectFromMOC:](TBNetworkMO, "generateNewNetworkObjectFromMOC:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAuthMask:", objc_msgSend(v7, "authMask"));
  objc_msgSend(v7, "remoteIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentifier:", v10);

  objc_msgSend(v7, "SSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", v11);

  objc_msgSend(v7, "popularityScore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPopularityScoreValue:", objc_msgSend(v12, "score"));

  objc_msgSend(v7, "qualityScore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setQualityScoreValue:", objc_msgSend(v13, "score"));

  objc_msgSend(v9, "setMoving:", objc_msgSend(v7, "isMoving"));
  objc_msgSend(v9, "setSuspicious:", objc_msgSend(v7, "isSuspicious"));
  objc_msgSend(v9, "setCaptive:", objc_msgSend(v7, "isCaptive"));
  objc_msgSend(v9, "setPublic:", objc_msgSend(v7, "isPublic"));
  objc_msgSend(v9, "setLowQuality:", objc_msgSend(v7, "isLowQuality"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCreated:", v14);

  objc_msgSend(v7, "ownerIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOwnerIdentifiers:", v15);

  objc_msgSend(v9, "setType:", objc_msgSend(v7, "type"));
  objc_msgSend(v9, "setVenueGroup:", objc_msgSend(v7, "venueGroup"));
  objc_msgSend(v9, "setVenueType:", objc_msgSend(v7, "venueType"));
  v16 = objc_alloc_init(TBCentroidCalculator);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v39 = v7;
  objc_msgSend(v7, "accessPoints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v42 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v23 = (void *)MEMORY[0x1D17AC818]();
        objc_msgSend(v22, "BSSID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          +[TBAccessPointMO generateNewAccessPointObjectFromMOC:](TBAccessPointMO, "generateNewAccessPointObjectFromMOC:", v40);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "BSSID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setBssid:", v26);

          objc_msgSend(v22, "latitude");
          objc_msgSend(v25, "setLat:");
          objc_msgSend(v22, "longitude");
          objc_msgSend(v25, "setLng:");
          objc_msgSend(v22, "latitude");
          v28 = v27;
          objc_msgSend(v22, "longitude");
          -[TBCentroidCalculator addLatitude:longitude:](v16, "addLatitude:longitude:", v28, v29);
          objc_msgSend(v22, "popularityScore");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setPopularityScoreValue:", objc_msgSend(v30, "score"));

          objc_msgSend(v22, "qualityScore");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setQualityScoreValue:", objc_msgSend(v31, "score"));

          objc_msgSend(v25, "setEdge:", objc_msgSend(v22, "isEdge"));
          objc_msgSend(v25, "setTcpGood:", objc_msgSend(v22, "isTCPGood"));
          objc_msgSend(v25, "setNetwork:", v9);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setCreated:", v32);

          objc_msgSend(v9, "accessPoints");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (id)objc_msgSend(v33, "setByAddingObject:", v25);

        }
        objc_autoreleasePoolPop(v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v19);
  }

  -[TBCentroidCalculator centroid](v16, "centroid");
  v36 = v35;
  objc_msgSend(v9, "setCentroidLat:");
  objc_msgSend(v9, "setCentroidLng:", v36);
  if (v38)
    objc_msgSend(v38, "addNetworksObject:", v9);

  objc_autoreleasePoolPop(context);
}

- (void)importObjectsWithArray:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  TBError *v10;
  TBError *v11;
  _QWORD v12[4];
  id v13;
  TBCoreDataSource *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[TBCoreDataSource context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__TBCoreDataSource_importObjectsWithArray_completionHandler___block_invoke;
    v12[3] = &unk_1E881D7C8;
    v13 = v6;
    v14 = self;
    v15 = v7;
    objc_msgSend(v8, "performBlock:", v12);

    v9 = v13;
  }
  else
  {
    v10 = [TBError alloc];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("nil or empty objects to import");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TBError initWithType:userInfo:](v10, "initWithType:userInfo:", 0, v9);
    (*((void (**)(id, TBError *))v7 + 2))(v7, v11);

  }
}

void __61__TBCoreDataSource_importObjectsWithArray_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v8, "context");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_createNewNetworkFromDictionary:withMOC:", v7, v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertedObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Inserted %lu objects to local store"), objc_msgSend(v11, "count"));

  objc_msgSend(*(id *)(a1 + 40), "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v12, "save:", &v14);
  v13 = v14;

  if (v13)
    NSLog(CFSTR("%s: failed to save with error %@"), "-[TBCoreDataSource importObjectsWithArray:completionHandler:]_block_invoke", v13);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_createNewNetworkFromDictionary:(id)a3 withMOC:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
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
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id obj;
  uint64_t v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v60 = a4;
  +[TBNetworkMO generateNewNetworkObjectFromMOC:](TBNetworkMO, "generateNewNetworkObjectFromMOC:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "setTimestamp:", (uint64_t)v8);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCreated:", v9);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authMask"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authMask"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAuthMask:", objc_msgSend(v11, "integerValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIdentifier:", v13);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SSID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SSID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v15);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("popularityScoreValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("popularityScoreValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPopularityScoreValue:", objc_msgSend(v17, "intValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("qualityScoreValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("qualityScoreValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQualityScoreValue:", objc_msgSend(v19, "intValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("moving"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("moving"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMoving:", objc_msgSend(v21, "BOOLValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suspicious"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suspicious"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSuspicious:", objc_msgSend(v23, "BOOLValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("captive"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("captive"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCaptive:", objc_msgSend(v25, "BOOLValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("public"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("public"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPublic:", objc_msgSend(v27, "BOOLValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("public"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lowQuality"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLowQuality:", objc_msgSend(v29, "BOOLValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ownerIdentifiers"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ownerIdentifiers"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOwnerIdentifiers:", v31);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setType:", objc_msgSend(v33, "integerValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("venueGroup"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("venueGroup"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVenueGroup:", objc_msgSend(v35, "integerValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("venueType"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("venueType"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVenueType:", objc_msgSend(v37, "intValue"));

  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accessPoints"), v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v38)
  {
    v39 = v38;
    v59 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v62 != v59)
          objc_enumerationMutation(obj);
        v41 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        +[TBAccessPointMO generateNewAccessPointObjectFromMOC:](TBAccessPointMO, "generateNewAccessPointObjectFromMOC:", v60);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("bssid"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setBssid:", v43);

        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("latitude"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "doubleValue");
        objc_msgSend(v42, "setLat:");

        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("longitude"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "doubleValue");
        objc_msgSend(v42, "setLng:");

        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("popularityScoreValue"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("popularityScoreValue"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setPopularityScoreValue:", objc_msgSend(v47, "intValue"));

        }
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("qualityScoreValue"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("qualityScoreValue"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setQualityScoreValue:", objc_msgSend(v49, "intValue"));

        }
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("edge"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("edge"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setEdge:", objc_msgSend(v51, "BOOLValue"));

        }
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("tcpGood"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("tcpGood"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setTcpGood:", objc_msgSend(v53, "BOOLValue"));

        }
        objc_msgSend(v42, "setNetwork:", v6);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setCreated:", v54);

        objc_msgSend(v6, "accessPoints");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (id)objc_msgSend(v55, "setByAddingObject:", v42);

      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v39);
  }

}

- (unint64_t)cacheExpirationInDays
{
  return self->_cacheExpirationInDays;
}

- (void)setCacheExpirationInDays:(unint64_t)a3
{
  self->_cacheExpirationInDays = a3;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (TBPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (TBCoreDataStoreDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (void)setHasStorageError:(BOOL)a3
{
  self->_hasStorageError = a3;
}

@end
