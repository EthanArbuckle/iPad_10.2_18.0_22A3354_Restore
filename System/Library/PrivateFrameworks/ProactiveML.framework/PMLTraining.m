@implementation PMLTraining

+ (id)sharedSingletonWithDirectory:(id)a3
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  PMLTrainingStore *v7;
  void *v8;
  PMLTrainingStore *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PMLTraining *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v4 = pthread_mutex_lock(&sharedSingletonWithDirectory__sharedInstanceInitLock);
  if (sharedSingletonWithDirectory__sharedInstance)
    goto LABEL_6;
  v5 = (void *)MEMORY[0x2199EA600](v4);
  PML_LogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_2159BB000, v6, OS_LOG_TYPE_INFO, "Instantiating PMLTraining singleton.", (uint8_t *)&v21, 2u);
  }

  v7 = [PMLTrainingStore alloc];
  -[__CFString stringByAppendingPathComponent:](v3, "stringByAppendingPathComponent:", CFSTR("training.db"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PMLTrainingStore initWithPath:](v7, "initWithPath:", v8);

  v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE2D158]), "initWithBundleIdentifier:", CFSTR("com.apple.proactive.PMLDESPlugin"));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (void *)objc_opt_new();
    v13 = -[PMLTraining initWithStore:fidesStore:availableSessionsTracker:]([PMLTraining alloc], "initWithStore:fidesStore:availableSessionsTracker:", v9, v11, v12);
    v14 = (void *)sharedSingletonWithDirectory__sharedInstance;
    sharedSingletonWithDirectory__sharedInstance = (uint64_t)v13;

    v15 = -[__CFString copy](v3, "copy");
    v16 = (void *)sharedSingletonWithDirectory__sharedInstanceDirectory;
    sharedSingletonWithDirectory__sharedInstanceDirectory = v15;

    objc_autoreleasePoolPop(v5);
LABEL_6:
    if (sharedSingletonWithDirectory__sharedInstanceDirectory
      && (-[__CFString isEqualToString:](v3, "isEqualToString:") & 1) == 0)
    {
      PML_LogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412546;
        v22 = v3;
        v23 = 2112;
        v24 = sharedSingletonWithDirectory__sharedInstanceDirectory;
        _os_log_impl(&dword_2159BB000, v17, OS_LOG_TYPE_DEFAULT, "Can't instantiate PMLTraining in %@, becacuse there is already an instance in %@.", (uint8_t *)&v21, 0x16u);
      }

    }
    pthread_mutex_unlock(&sharedSingletonWithDirectory__sharedInstanceInitLock);
    v18 = (id)sharedSingletonWithDirectory__sharedInstance;
    goto LABEL_12;
  }
  PML_LogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    v21 = 138412290;
    v22 = CFSTR("com.apple.proactive.PMLDESPlugin");
    _os_log_fault_impl(&dword_2159BB000, v20, OS_LOG_TYPE_FAULT, "PMLTraining failed to get a DESRecordStore for %@", (uint8_t *)&v21, 0xCu);
  }

  pthread_mutex_unlock(&sharedSingletonWithDirectory__sharedInstanceInitLock);
  objc_autoreleasePoolPop(v5);
  v18 = 0;
LABEL_12:

  return v18;
}

- (void)deleteSessionsWithIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        -[PMLTrainingStore deleteSessionsWithBundleId:itemId:](self->_store, "deleteSessionsWithBundleId:itemId:", v7, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)deleteSessionsWithBundleID:(id)a3
{
  -[PMLTrainingStore deleteSessionsWithBundleId:](self->_store, "deleteSessionsWithBundleId:", a3);
}

- (void)deleteSessionsWithDomainIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        -[PMLTrainingStore deleteSessionsWithBundleId:domainId:](self->_store, "deleteSessionsWithBundleId:domainId:", v7, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (PMLTraining)initWithStore:(id)a3 fidesStore:(id)a4 availableSessionsTracker:(id)a5
{
  id v9;
  id v10;
  id v11;
  PMLTraining *v12;
  PMLTraining *v13;
  NSDictionary *isMultiLabel;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PMLTraining;
  v12 = -[PMLTraining init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_fidesStore, a4);
    objc_storeStrong((id *)&v13->_availableSessionsTracker, a5);
    -[PMLAWDAvailableSessionsTracker setAWDMetricQueryDelegate:](v13->_availableSessionsTracker, "setAWDMetricQueryDelegate:", v13);
    isMultiLabel = v13->_isMultiLabel;
    v13->_isMultiLabel = (NSDictionary *)&unk_24D3EB428;

  }
  return v13;
}

- (void)addSessionWithCovariates:(id)a3 label:(int64_t)a4 sessionDescriptor:(id)a5 spotlightReference:(id)a6 isInternal:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  PMLTrainingStore *store;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  PML_LogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v22 = v13;
    v23 = 2048;
    v24 = a4;
    v25 = 2048;
    v26 = objc_msgSend(v12, "length");
    _os_log_debug_impl(&dword_2159BB000, v15, OS_LOG_TYPE_DEBUG, "Adding session for %@ (label: %tu, length: %tu)", buf, 0x20u);
  }

  store = self->_store;
  objc_msgSend(v14, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "domainIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v20) = a7;
  -[PMLTrainingStore storeSession:label:model:bundleId:domainId:itemIds:isAppleInternal:](store, "storeSession:label:model:bundleId:domainId:itemIds:isAppleInternal:", v12, a4, v13, v17, v18, v19, v20);

}

- (BOOL)isMultiLabelModel:(id)a3
{
  id v4;
  NSDictionary *isMultiLabel;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  isMultiLabel = self->_isMultiLabel;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](isMultiLabel, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "BOOLValue");
  }
  else
  {
    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_fault_impl(&dword_2159BB000, v9, OS_LOG_TYPE_FAULT, "No isMultiLabel information for %@", (uint8_t *)&v12, 0xCu);

    }
    v8 = 0;
  }

  return v8;
}

- (void)sendSessionStatsToFides
{
  void *v3;
  _QWORD v4[5];

  if (-[PMLTrainingStore isDbOpen](self->_store, "isDbOpen"))
  {
    -[PMLTraining _deleteAllSavedRecordsFromFidesStoreSync](self, "_deleteAllSavedRecordsFromFidesStoreSync");
    -[PMLTrainingStore sessionStats](self->_store, "sessionStats");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __38__PMLTraining_sendSessionStatsToFides__block_invoke;
    v4[3] = &unk_24D3DBC50;
    v4[4] = self;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

  }
}

- (void)_sendStatsToFidesForModel:(id)a3 sessionCount:(unint64_t)a4 positivesCount:(unint64_t)a5 negativesCount:(unint64_t)a6 support:(float)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  DESRecordStore *fidesStore;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[7];
  _QWORD v28[8];

  v28[7] = *MEMORY[0x24BDAC8D0];
  v27[0] = CFSTR("modelName");
  v12 = a3;
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  v27[1] = CFSTR("modelVersion");
  objc_msgSend(v12, "version");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v14;
  v27[2] = CFSTR("modelLocale");
  objc_msgSend(v12, "locale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v15;
  v27[3] = CFSTR("sessionsCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v16;
  v27[4] = CFSTR("positivesCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v17;
  v27[5] = CFSTR("negativesCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v18;
  v27[6] = CFSTR("support");
  *(float *)&v19 = a7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  fidesStore = self->_fidesStore;
  v23 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __92__PMLTraining__sendStatsToFidesForModel_sessionCount_positivesCount_negativesCount_support___block_invoke;
  v25[3] = &unk_24D3DBC78;
  v26 = v21;
  v24 = v21;
  -[DESRecordStore saveRecordWithData:recordInfo:completion:](fidesStore, "saveRecordWithData:recordInfo:completion:", v23, v24, v25);

}

- (void)_sendStatsToFidesForMultiLabelModel:(id)a3 sessionCount:(unint64_t)a4 labeledStats:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  DESRecordStore *fidesStore;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x24BDAC8D0];
  v20[0] = CFSTR("modelName");
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v20[1] = CFSTR("modelVersion");
  objc_msgSend(v9, "version");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v11;
  v20[2] = CFSTR("modelLocale");
  objc_msgSend(v9, "locale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[2] = v12;
  v20[3] = CFSTR("sessionsCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = CFSTR("labeledStats");
  v21[3] = v13;
  v21[4] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  fidesStore = self->_fidesStore;
  v16 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __77__PMLTraining__sendStatsToFidesForMultiLabelModel_sessionCount_labeledStats___block_invoke;
  v18[3] = &unk_24D3DBC78;
  v19 = v14;
  v17 = v14;
  -[DESRecordStore saveRecordWithData:recordInfo:completion:](fidesStore, "saveRecordWithData:recordInfo:completion:", v16, v17, v18);

}

- (void)_deleteAllSavedRecordsFromFidesStoreSync
{
  dispatch_semaphore_t v3;
  DESRecordStore *fidesStore;
  NSObject *v5;
  _QWORD v6[4];
  dispatch_semaphore_t v7;

  v3 = dispatch_semaphore_create(0);
  fidesStore = self->_fidesStore;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__PMLTraining__deleteAllSavedRecordsFromFidesStoreSync__block_invoke;
  v6[3] = &unk_24D3DBCA0;
  v7 = v3;
  v5 = v3;
  -[DESRecordStore deleteAllSavedRecordsWithCompletion:](fidesStore, "deleteAllSavedRecordsWithCompletion:", v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

- (id)lastTrainingFeaturizationForModelName:(id)a3 andLocale:(id)a4
{
  return -[PMLTrainingStore lastTrainingFeaturizationForModelName:andLocale:](self->_store, "lastTrainingFeaturizationForModelName:andLocale:", a3, a4);
}

- (void)updateLastTrainingFeaturizationForModel:(id)a3 andData:(id)a4
{
  -[PMLTrainingStore updateLastTrainingFeaturizationForModel:andData:](self->_store, "updateLastTrainingFeaturizationForModel:andData:", a3, a4);
}

- (void)trimDbWithDeferralBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  PMLTrainingStore *store;
  uint64_t (**v11)(_QWORD);
  NSObject *v12;
  const char *v13;
  _QWORD v14[5];
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;

  v4 = (uint64_t (**)(_QWORD))a3;
  v5 = -[PMLTrainingStore isDbOpen](self->_store, "isDbOpen");
  PML_LogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      v13 = "Won't trim training db because the db is not open.";
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2159BB000, v6, OS_LOG_TYPE_DEFAULT, "Trimming training db.", buf, 2u);
  }

  -[PMLTrainingStore limitSessionsByLastUsedTTL:](self->_store, "limitSessionsByLastUsedTTL:", 15552000.0);
  PML_LogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2159BB000, v8, OS_LOG_TYPE_DEFAULT, "DONE limitSessionsByLastUsedTTL", buf, 2u);
  }

  if ((v4[2](v4) & 1) != 0)
    goto LABEL_14;
  -[PMLTrainingStore limitSessionsByMaxTimesAccessed](self->_store, "limitSessionsByMaxTimesAccessed");
  PML_LogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2159BB000, v9, OS_LOG_TYPE_DEFAULT, "DONE limitSessionsByMaxTimesAccessed", buf, 2u);
  }

  if ((v4[2](v4) & 1) != 0)
    goto LABEL_14;
  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x2020000000;
  v20 = 0;
  store = self->_store;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __39__PMLTraining_trimDbWithDeferralBlock___block_invoke;
  v14[3] = &unk_24D3DBCC8;
  v14[4] = self;
  v11 = v4;
  v15 = v11;
  v16 = buf;
  -[PMLTrainingStore enumerateSessionDescriptorsUsingBlock:](store, "enumerateSessionDescriptorsUsingBlock:", v14);
  LODWORD(store) = v18[24];

  _Block_object_dispose(buf, 8);
  if ((_DWORD)store)
    goto LABEL_14;
  PML_LogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2159BB000, v12, OS_LOG_TYPE_DEFAULT, "Vacuuming training db.", buf, 2u);
  }

  -[PMLTrainingStore vacuumDbWithDeferralBlock:](self->_store, "vacuumDbWithDeferralBlock:", v11);
  if (v4[2](v11))
  {
LABEL_14:
    PML_LogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "We've been asked to defer. Skipping remaining work.";
LABEL_18:
      _os_log_impl(&dword_2159BB000, v6, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
LABEL_20:

}

- (id)_trainWithRecipe:(id)a3 chunkData:(id)a4 args:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  _BOOL4 v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  _QWORD v37[4];

  v37[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[PMLPlanSerialization planFromData:withArgs:](PMLPlanSerialization, "planFromData:withArgs:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (-[PMLTrainingStore isDbOpen](self->_store, "isDbOpen"))
    {
      PML_LogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 138412290;
        v31 = v13;
        _os_log_impl(&dword_2159BB000, v14, OS_LOG_TYPE_DEFAULT, "Running %@ synchronously", (uint8_t *)&v30, 0xCu);
      }

      objc_msgSend(v13, "runWithError:", a6);
      a6 = (id *)objc_claimAutoreleasedReturnValue();
      PML_LogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "planId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412546;
        v31 = v16;
        v32 = 1024;
        v33 = a6 != 0;
        _os_log_impl(&dword_2159BB000, v15, OS_LOG_TYPE_DEFAULT, "Plan %@ completed run. Result present? %d.", (uint8_t *)&v30, 0x12u);

      }
    }
    else
    {
      -[PMLTrainingStore logDbNotOpenEvent](self->_store, "logDbNotOpenEvent");
      PML_LogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 138412290;
        v31 = v13;
        _os_log_impl(&dword_2159BB000, v23, OS_LOG_TYPE_DEFAULT, "Ignoring synchronous plan %@ because the db is not open.", (uint8_t *)&v30, 0xCu);
      }

      if (a6)
      {
        v24 = (void *)MEMORY[0x24BDD1540];
        v34 = CFSTR("isEspressoTraining");
        objc_msgSend(v10, "objectForKeyedSubscript:");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = MEMORY[0x24BDBD1C0];
        if (v25)
          v27 = v25;
        v35 = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 5, v28);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        a6 = 0;
      }
    }
  }
  else
  {
    PML_LogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v30) = 0;
      _os_log_fault_impl(&dword_2159BB000, v17, OS_LOG_TYPE_FAULT, "Training plan deserialized without exception but is nil", (uint8_t *)&v30, 2u);
    }

    if (a6)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v36 = CFSTR("isEspressoTraining");
      objc_msgSend(v10, "objectForKeyedSubscript:");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = MEMORY[0x24BDBD1C0];
      if (v19)
        v21 = v19;
      v37[0] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 4, v22);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      a6 = 0;
    }
    v13 = 0;
  }

  return a6;
}

- (id)planReceivedWithPayload:(id)a3 error:(id *)a4
{
  PMLTrainingStore *store;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  store = self->_store;
  v12 = CFSTR("TRAINING_STORE");
  v13[0] = store;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLTraining _trainWithRecipe:chunkData:args:error:](self, "_trainWithRecipe:chunkData:args:error:", MEMORY[0x24BDBD1B8], v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)planReceivedWithRecipe:(id)a3 attachments:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  PMLTrainingStore *store;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v33;
  uint64_t v34;
  PMLTraining *v35;
  id *v36;
  void *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[3];
  _QWORD v45[3];
  const __CFString *v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isEspressoTraining"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || (objc_msgSend(v10, "BOOLValue") & 1) == 0)
  {
    PML_LogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_2159BB000, v27, OS_LOG_TYPE_FAULT, "Unable to train with Espresso because recipe flag IS_ESPRESSO_TRAINING is not set", buf, 2u);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 4, 0);
      v26 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    goto LABEL_36;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = v9;
  v12 = (void *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (!v12)
  {

    v14 = 0;
    goto LABEL_28;
  }
  v35 = self;
  v36 = a5;
  v37 = v10;
  v38 = v9;
  v39 = v8;
  v13 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v41;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(_QWORD *)v41 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v17, "pathExtension");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("chunk")) & 1) != 0)
      {
        v19 = v13;
        v13 = v17;
        v20 = v14;
      }
      else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("bin")) & 1) != 0)
      {
        v19 = v14;
        v20 = v17;
      }
      else
      {
        v19 = v14;
        v20 = v17;
        if (!objc_msgSend(v18, "isEqualToString:", CFSTR("net")))
          goto LABEL_15;
      }
      v21 = v17;

      v14 = v20;
LABEL_15:

    }
    v12 = (void *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  }
  while (v12);

  v12 = v13;
  if (v13)
  {
    v9 = v38;
    v8 = v39;
    a5 = v36;
    v10 = v37;
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE2D140], "pluginShouldAddNoiseAndEncryptResult:", v39));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        store = v35->_store;
        v44[0] = CFSTR("TRAINING_STORE");
        v44[1] = CFSTR("PML_ESPRESSO_TRAINING_NETWORK_PATH");
        v45[0] = store;
        v45[1] = v14;
        v44[2] = CFSTR("PLUGIN_SHOULD_ADD_NOISE_AND_ENCRYPT_RESULT");
        v45[2] = v23;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PMLTraining _trainWithRecipe:chunkData:args:error:](v35, "_trainWithRecipe:chunkData:args:error:", v39, v22, v25, v36);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_33;
      }
      PML_LogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_2159BB000, v33, OS_LOG_TYPE_FAULT, "Unable to train because chunk file contents were empty", buf, 2u);
      }

      if (v36)
      {
        v30 = (void *)MEMORY[0x24BDD1540];
        v31 = 0;
LABEL_32:
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 4, v31);
        v26 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
LABEL_33:

      goto LABEL_35;
    }
  }
  else
  {
    v9 = v38;
    v8 = v39;
    a5 = v36;
    v10 = v37;
  }
LABEL_28:
  PML_LogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    v34 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 138412802;
    v49 = v12;
    v50 = 2112;
    v51 = v14;
    v52 = 2048;
    v53 = v34;
    _os_log_fault_impl(&dword_2159BB000, v28, OS_LOG_TYPE_FAULT, "Unable to train because chunk path %@ or training network path %@ not found in %lu attachments", buf, 0x20u);
  }

  if (a5)
  {
    v29 = (void *)MEMORY[0x24BDD1540];
    v46 = CFSTR("attachments");
    v47 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = v22;
    goto LABEL_32;
  }
  v26 = 0;
LABEL_35:

LABEL_36:
  return v26;
}

- (PMLTrainingStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_isMultiLabel, 0);
  objc_storeStrong((id *)&self->_availableSessionsTracker, 0);
  objc_storeStrong((id *)&self->_fidesStore, 0);
}

void __39__PMLTraining_trimDbWithDeferralBlock___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  PML_LogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_debug_impl(&dword_2159BB000, v6, OS_LOG_TYPE_DEBUG, "Removing training samples for %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("QuickResponsesClassification"));

  v9 = *(void **)(a1[4] + 32);
  if (v8)
  {
    objc_msgSend(v9, "limitSessionsWithSessionDescriptor:withLabel:limit:", v5, 0, 1000);
    PML_LogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v12 = 138412290;
    v13 = v5;
    v11 = "DONE limitSessionsWithSessionDescriptor:(%@) withLabel:nil";
  }
  else
  {
    objc_msgSend(v9, "limitSessionsForEachLabelWithSessionDescriptor:totalSessionLimit:", v5, 1000);
    PML_LogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v12 = 138412290;
    v13 = v5;
    v11 = "DONE limitSessionsForEachLabelWithSessionDescriptor:(%@)";
  }
  _os_log_impl(&dword_2159BB000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0xCu);
LABEL_9:

  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }

}

void __55__PMLTraining__deleteAllSavedRecordsFromFidesStoreSync__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    PML_LogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_error_impl(&dword_2159BB000, v4, OS_LOG_TYPE_ERROR, "Failed to delete existing records in DESRecordStore. Error: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __77__PMLTraining__sendStatsToFidesForMultiLabelModel_sessionCount_labeledStats___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PML_LogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v4;
      _os_log_error_impl(&dword_2159BB000, v6, OS_LOG_TYPE_ERROR, "Failed to send session stats %@ to Fides. Error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_debug_impl(&dword_2159BB000, v6, OS_LOG_TYPE_DEBUG, "Successfully sent stats %@ to Fides.", (uint8_t *)&v9, 0xCu);
  }

}

void __92__PMLTraining__sendStatsToFidesForModel_sessionCount_positivesCount_negativesCount_support___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PML_LogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v4;
      _os_log_error_impl(&dword_2159BB000, v6, OS_LOG_TYPE_ERROR, "Failed to send session stats %@ to Fides. Error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_debug_impl(&dword_2159BB000, v6, OS_LOG_TYPE_DEBUG, "Successfully sent stats %@ to Fides.", (uint8_t *)&v9, 0xCu);
  }

}

void __38__PMLTraining_sendSessionStatsToFides__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  id v43;
  uint64_t v44;
  void *v45;
  id obj;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "second");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 += objc_msgSend(v12, "unsignedIntegerValue");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v44 = a1;
  v45 = v6;
  if (objc_msgSend(*(id *)(a1 + 32), "isMultiLabelModel:", v5))
  {
    v43 = v5;
    v47 = (void *)objc_opt_new();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v6;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v49 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          objc_msgSend(v17, "first");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "unsignedIntegerValue");

          if (v19)
          {
            objc_msgSend(v17, "second");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "floatValue");
            v22 = v21 / (float)v9;

            objc_msgSend(v17, "second");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "unsignedIntegerValue");

            v56[0] = CFSTR("positivesCount");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v56[1] = CFSTR("support");
            v57[0] = v25;
            *(float *)&v26 = v22;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v57[1] = v27;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_alloc(MEMORY[0x24BDD17C8]);
            objc_msgSend(v17, "first");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("label%tu"), objc_msgSend(v30, "unsignedLongValue"));
            objc_msgSend(v47, "setObject:forKey:", v28, v31);

          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      }
      while (v14);
    }

    v5 = v43;
    objc_msgSend(*(id *)(v44 + 32), "_sendStatsToFidesForMultiLabelModel:sessionCount:labeledStats:", v43, v9, v47);

  }
  else
  {
    v32 = v6;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v33)
    {
      v34 = v33;
      v35 = 0;
      v36 = *(_QWORD *)v53;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v53 != v36)
            objc_enumerationMutation(v32);
          v38 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
          objc_msgSend(v38, "first");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "integerValue");

          if (v40 >= 1)
          {
            objc_msgSend(v38, "second");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v35 += objc_msgSend(v41, "unsignedIntegerValue");

          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v34);
    }
    else
    {
      v35 = 0;
    }

    *(float *)&v42 = (float)v35 / (float)v9;
    objc_msgSend(*(id *)(v44 + 32), "_sendStatsToFidesForModel:sessionCount:positivesCount:negativesCount:support:", v5, v9, v35, v9 - v35, v42);
  }

}

@end
