@implementation SMSafetyCacheStore

- (SMSafetyCacheStore)initWithPersistenceManager:(id)a3 timerManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SMSafetyCacheStore *v9;
  SMSafetyCacheStore *v10;
  uint64_t v11;
  NSMutableArray *locations;
  SMSafetyCacheStore *v13;
  NSObject *v14;
  const char *v15;
  objc_super v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v13 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: persistenceManager";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_12;
  }
  v17.receiver = self;
  v17.super_class = (Class)SMSafetyCacheStore;
  v9 = -[RTStore initWithPersistenceManager:](&v17, sel_initWithPersistenceManager_, v6);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timerManager, a4);
    v11 = objc_opt_new();
    locations = v10->_locations;
    v10->_locations = (NSMutableArray *)v11;

  }
  self = v10;
  v13 = self;
LABEL_10:

  return v13;
}

- (void)storeInitiatorContact:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__SMSafetyCacheStore_storeInitiatorContact_handler___block_invoke;
  v12[3] = &unk_1E9297590;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, v12);

}

void __52__SMSafetyCacheStore_storeInitiatorContact_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);

  }
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(v4, "storeWritableObjects:handler:", v5, *(_QWORD *)(a1 + 48));

}

- (void)updateInitiatorContact:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__SMSafetyCacheStore_updateInitiatorContact_handler___block_invoke;
  v12[3] = &unk_1E9297590;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, v12);

}

void __53__SMSafetyCacheStore_updateInitiatorContact_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);

  }
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(v4, "updateWritableObjects:handler:", v5, *(_QWORD *)(a1 + 48));

}

- (void)storeReceiverContact:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__SMSafetyCacheStore_storeReceiverContact_handler___block_invoke;
  v12[3] = &unk_1E9297590;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, v12);

}

void __51__SMSafetyCacheStore_storeReceiverContact_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);

  }
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(v4, "storeWritableObjects:handler:", v5, *(_QWORD *)(a1 + 48));

}

- (void)updateReceiverContact:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__SMSafetyCacheStore_updateReceiverContact_handler___block_invoke;
  v12[3] = &unk_1E9297590;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, v12);

}

void __52__SMSafetyCacheStore_updateReceiverContact_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);

  }
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(v4, "updateWritableObjects:handler:", v5, *(_QWORD *)(a1 + 48));

}

- (void)fetchInitiatorContactsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SMSafetyCacheStore_fetchInitiatorContactsWithHandler___block_invoke;
  block[3] = &unk_1E929E0F0;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __56__SMSafetyCacheStore_fetchInitiatorContactsWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);

  }
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SMSafetyCacheStore_fetchInitiatorContactsWithHandler___block_invoke_15;
  v9[3] = &unk_1E9299738;
  v10 = *(id *)(a1 + 40);
  v5 = (void *)MEMORY[0x1D8232094](v9);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __56__SMSafetyCacheStore_fetchInitiatorContactsWithHandler___block_invoke_19;
  v7[3] = &unk_1E9297568;
  v6 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v6, "_performBlock:contextType:errorHandler:", v5, 1, v7);

}

void __56__SMSafetyCacheStore_fetchInitiatorContactsWithHandler___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  _BYTE v30[14];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SMInitiatorContactMO fetchRequest](SMInitiatorContactMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v27;
  v7 = (void *)objc_opt_new();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v30 = v9;
    *(_WORD *)&v30[4] = 2112;
    *(_QWORD *)&v30[6] = v6;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,fetchInitiatorContactsWithHandler,Fetched contacts %d, error: %@", buf, 0x12u);
  }

  if (!v6 && objc_msgSend(v5, "count"))
  {
    v19 = v5;
    v20 = a1;
    v21 = v4;
    v22 = v3;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v15, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v30 = v17;
            _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,fetchInitiatorContactsWithHandler,contact %@", buf, 0xCu);

          }
          objc_msgSend(MEMORY[0x1E0D8B968], "createWithManagedObject:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v7, "addObject:", v18);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
    }

    v4 = v21;
    v3 = v22;
    v5 = v19;
    a1 = v20;
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __56__SMSafetyCacheStore_fetchInitiatorContactsWithHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchReceiverContactsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SMSafetyCacheStore_fetchReceiverContactsWithHandler___block_invoke;
  block[3] = &unk_1E929E0F0;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __55__SMSafetyCacheStore_fetchReceiverContactsWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);

  }
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SMSafetyCacheStore_fetchReceiverContactsWithHandler___block_invoke_21;
  v9[3] = &unk_1E9299738;
  v10 = *(id *)(a1 + 40);
  v5 = (void *)MEMORY[0x1D8232094](v9);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __55__SMSafetyCacheStore_fetchReceiverContactsWithHandler___block_invoke_24;
  v7[3] = &unk_1E9297568;
  v6 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v6, "_performBlock:contextType:errorHandler:", v5, 1, v7);

}

void __55__SMSafetyCacheStore_fetchReceiverContactsWithHandler___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  _BYTE v30[14];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SMReceiverContactMO fetchRequest](SMReceiverContactMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v27;
  v7 = (void *)objc_opt_new();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v30 = v9;
    *(_WORD *)&v30[4] = 2112;
    *(_QWORD *)&v30[6] = v6;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,fetchReceiverContactsWithHandler,Fetched receiverContacts %d, error: %@", buf, 0x12u);
  }

  if (!v6 && objc_msgSend(v5, "count"))
  {
    v19 = v5;
    v20 = a1;
    v21 = v4;
    v22 = v3;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v15, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v30 = v17;
            _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,fetchReceiverContactsWithHandler,fetched receiverContact: %@", buf, 0xCu);

          }
          objc_msgSend(MEMORY[0x1E0D8B9B8], "createWithManagedObject:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v7, "addObject:", v18);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
    }

    v4 = v21;
    v3 = v22;
    v5 = v19;
    a1 = v20;
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __55__SMSafetyCacheStore_fetchReceiverContactsWithHandler___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeInitiatorContact:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SMSafetyCacheStore *v14;
  id v15;
  SEL v16;

  v7 = a3;
  v8 = a4;
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__SMSafetyCacheStore_removeInitiatorContact_handler___block_invoke;
  v12[3] = &unk_1E92994E0;
  v15 = v8;
  v16 = a2;
  v13 = v7;
  v14 = self;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, v12);

}

void __53__SMSafetyCacheStore_removeInitiatorContact_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);

  }
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__SMSafetyCacheStore_removeInitiatorContact_handler___block_invoke_29;
    v14[3] = &unk_1E9297A30;
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    v15 = v5;
    v16 = v6;
    v17 = v7;
    v8 = (void *)MEMORY[0x1D8232094](v14);
    objc_msgSend(*(id *)(a1 + 40), "_performBlock:contextType:errorHandler:", v8, 0, *(_QWORD *)(a1 + 48));

    v9 = v15;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D18598];
    v18 = *MEMORY[0x1E0CB2D50];
    v19 = CFSTR("requires valid initiatorContact.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 0, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);

  }
}

void __53__SMSafetyCacheStore_removeInitiatorContact_handler___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SMInitiatorContactMO fetchRequest](SMInitiatorContactMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v4);
  objc_msgSend(v8, "setResultType:", 2);
  v9 = *(void **)(a1 + 40);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__SMSafetyCacheStore_removeInitiatorContact_handler___block_invoke_2;
  v11[3] = &unk_1E9297568;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v9, "executeDeleteRequests:context:handler:", v10, v3, v11);

}

void __53__SMSafetyCacheStore_removeInitiatorContact_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,removeInitiatorContact,completed, error, %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeReceiverContact:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SMSafetyCacheStore *v14;
  id v15;
  SEL v16;

  v7 = a3;
  v8 = a4;
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__SMSafetyCacheStore_removeReceiverContact_handler___block_invoke;
  v12[3] = &unk_1E92994E0;
  v15 = v8;
  v16 = a2;
  v13 = v7;
  v14 = self;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, v12);

}

void __52__SMSafetyCacheStore_removeReceiverContact_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,%@", buf, 0xCu);

  }
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__SMSafetyCacheStore_removeReceiverContact_handler___block_invoke_38;
    v14[3] = &unk_1E9297A30;
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    v15 = v5;
    v16 = v6;
    v17 = v7;
    v8 = (void *)MEMORY[0x1D8232094](v14);
    objc_msgSend(*(id *)(a1 + 40), "_performBlock:contextType:errorHandler:", v8, 0, *(_QWORD *)(a1 + 48));

    v9 = v15;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D18598];
    v18 = *MEMORY[0x1E0CB2D50];
    v19 = CFSTR("requires valid receiverServiceState.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 0, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);

  }
}

void __52__SMSafetyCacheStore_removeReceiverContact_handler___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SMReceiverContactMO fetchRequest](SMReceiverContactMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v4);
  objc_msgSend(v8, "setResultType:", 2);
  v9 = *(void **)(a1 + 40);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__SMSafetyCacheStore_removeReceiverContact_handler___block_invoke_2;
  v11[3] = &unk_1E9297568;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v9, "executeDeleteRequests:context:handler:", v10, v3, v11);

}

void __52__SMSafetyCacheStore_removeReceiverContact_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,removeReceiverContact,completed, error, %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)logStoreWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SMSafetyCacheStore_logStoreWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __42__SMSafetyCacheStore_logStoreWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SMSafetyCacheStore_logStoreWithHandler___block_invoke_2;
  v6[3] = &unk_1E9299738;
  v3 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __42__SMSafetyCacheStore_logStoreWithHandler___block_invoke_39;
  v4[3] = &unk_1E9297568;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_performBlock:contextType:errorHandler:", v6, 1, v4);

}

void __42__SMSafetyCacheStore_logStoreWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id obj;
  id obja;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  id v71;
  uint8_t v72[128];
  uint8_t buf[4];
  int v74;
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SMInitiatorContactMO fetchRequest](SMInitiatorContactMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v71);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v71;
  +[SMReceiverContactMO fetchRequest](SMReceiverContactMO, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v7, &v70);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (unint64_t)v70;
  v10 = (void *)v9;
  if (v6 | v9)
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      _RTSafeArray();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);

    }
  }
  else
  {
    v50 = (id)v9;
    v51 = a1;
    v56 = v3;
    v57 = v8;
    v52 = v7;
    v53 = v6;
    v55 = v4;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 67109120;
      v74 = v15;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,numInitiatorContacts,%d", buf, 8u);
    }

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v54 = v5;
    obj = v5;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v60 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v67 != v60)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0D8B968], "createWithManagedObject:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v74 = v18 + i + 1;
            v75 = 2112;
            v76 = v22;
            _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,InitiatorContact,%d,%@", buf, 0x12u);
          }

          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v22, "phoneCache");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "outputToDictionary");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            v74 = v18 + i + 1;
            v75 = 2112;
            v76 = v26;
            _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,InitiatorContact,%d,phoneCache,%@", buf, 0x12u);

          }
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v22, "watchCache");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "outputToDictionary");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            v74 = v18 + i + 1;
            v75 = 2112;
            v76 = v29;
            _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,InitiatorContact,%d,watchCache,%@", buf, 0x12u);

          }
          objc_autoreleasePoolPop(v21);
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
        v18 += i;
      }
      while (v17);
    }

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = objc_msgSend(v57, "count");
      *(_DWORD *)buf = 67109120;
      v74 = v31;
      _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,numReceiverContacts,%d", buf, 8u);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obja = v57;
    v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v32)
    {
      v33 = v32;
      v34 = 0;
      v61 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v63 != v61)
            objc_enumerationMutation(obja);
          v36 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
          v37 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0D8B9B8], "createWithManagedObject:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v74 = v34 + j + 1;
            v75 = 2112;
            v76 = v38;
            _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,ReceiverContact,%d,%@", buf, 0x12u);
          }

          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v38, "sessionStatus");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "outputToDictionary");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            v74 = v34 + j + 1;
            v75 = 2112;
            v76 = v42;
            _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,ReceiverContact,%d,sessionStatus,%@", buf, 0x12u);

          }
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v38, "phoneCache");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "outputToDictionary");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            v74 = v34 + j + 1;
            v75 = 2112;
            v76 = v45;
            _os_log_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,ReceiverContact,%d,phoneCache,%@", buf, 0x12u);

          }
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v38, "watchCache");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "outputToDictionary");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            v74 = v34 + j + 1;
            v75 = 2112;
            v76 = v48;
            _os_log_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,_logStore,ReceiverContact,%d,watchCache,%@", buf, 0x12u);

          }
          objc_autoreleasePoolPop(v37);
        }
        v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        v34 += j;
      }
      while (v33);
    }

    v7 = v52;
    v49 = *(_QWORD *)(v51 + 32);
    v4 = v55;
    v3 = v56;
    v6 = v53;
    v5 = v54;
    v8 = v57;
    v10 = v50;
    if (v49)
      (*(void (**)(uint64_t, _QWORD))(v49 + 16))(v49, 0);
  }

}

uint64_t __42__SMSafetyCacheStore_logStoreWithHandler___block_invoke_39(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint8_t buf[8];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

LABEL_8:
    v21 = 0;
    goto LABEL_13;
  }
  if (v8)
  {
    v10 = objc_opt_class();
    if (v10 == objc_opt_class())
    {
      -[SMSafetyCacheStore fetchRequestFromStoredLocationOptions:](self, "fetchRequestFromStoredLocationOptions:", v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFetchOffset:", a4);
      goto LABEL_13;
    }
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("error of type, %@, is not supported"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_retainAutorelease(v18);
    *a5 = v19;

    goto LABEL_8;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
  }

  _RTErrorInvalidParameterCreate((uint64_t)CFSTR("options"));
  v21 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v21;
}

- (void)_startFlushTimer
{
  RTTimerManager *timerManager;
  void *v5;
  RTTimer *v6;
  RTTimer *flushTimer;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  SMSafetyCacheStore *v12;
  id v13[2];
  id location;

  if (!self->_flushTimer)
  {
    objc_initWeak(&location, self);
    timerManager = self->_timerManager;
    -[RTNotifier queue](self, "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __38__SMSafetyCacheStore__startFlushTimer__block_invoke;
    v11 = &unk_1E92A58B0;
    v12 = self;
    v13[1] = (id)a2;
    objc_copyWeak(v13, &location);
    -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", CFSTR("com.apple.routined.SafetyCache.flushTimer"), v5, &v8);
    v6 = (RTTimer *)objc_claimAutoreleasedReturnValue();
    flushTimer = self->_flushTimer;
    self->_flushTimer = v6;

    -[RTTimer fireAfterDelay:interval:leeway:](self->_flushTimer, "fireAfterDelay:interval:leeway:", 75.0, 75.0, 15.0, v8, v9, v10, v11, v12);
    -[RTTimer resume](self->_flushTimer, "resume");
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __38__SMSafetyCacheStore__startFlushTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "%@, %@, flushTimer timer expiry", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SMSafetyCacheStore__startFlushTimer__block_invoke_46;
  v8[3] = &unk_1E9297628;
  v4 = *(_QWORD *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = v4;
  objc_msgSend(WeakRetained, "_flushCachedLocationsWithHandler:", v8);

}

void __38__SMSafetyCacheStore__startFlushTimer__block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%@, %@, flushed cached locations, error, %@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)_invalidateFlushTimer
{
  RTTimer *flushTimer;

  -[RTTimer invalidate](self->_flushTimer, "invalidate");
  flushTimer = self->_flushTimer;
  self->_flushTimer = 0;

}

- (void)_flushCachedLocations
{
  -[SMSafetyCacheStore _flushCachedLocationsWithHandler:](self, "_flushCachedLocationsWithHandler:", &__block_literal_global_122);
}

void __43__SMSafetyCacheStore__flushCachedLocations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "failed to flush cached location, error: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)_flushCachedLocationsWithHandler:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[NSMutableArray count](self->_locations, "count"))
  {
    v6 = (void *)-[NSMutableArray copy](self->_locations, "copy");
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "count");
      objc_msgSend(v6, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastObject");
      v21 = a2;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v31 = v9;
      v32 = 2112;
      v33 = v10;
      v34 = 2048;
      v35 = v11;
      v36 = 2112;
      v37 = v12;
      v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, flushing %lu locations to cache, first, %@, last, %@", buf, 0x34u);

      a2 = v21;
    }

    -[NSMutableArray removeAllObjects](self->_locations, "removeAllObjects");
    -[SMSafetyCacheStore _invalidateFlushTimer](self, "_invalidateFlushTimer");
    v14 = (void *)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B970]), "initWithCLLocation:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19));
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __55__SMSafetyCacheStore__flushCachedLocationsWithHandler___block_invoke;
    v22[3] = &unk_1E9298100;
    v22[4] = self;
    v24 = a2;
    v23 = v5;
    -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v14, v22);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

void __55__SMSafetyCacheStore__flushCachedLocationsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = 0;

  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@, error, %@", (uint8_t *)&v9, 0x16u);

    }
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)storeLocations:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SMSafetyCacheStore_storeLocations_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __45__SMSafetyCacheStore_storeLocations_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeLocations:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)enumerateStoredLocationsWithContext:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD block[5];
  NSObject *v45;
  SEL v46;
  char v47;
  _BYTE buf[12];
  __int16 v49;
  NSObject *v50;
  uint64_t v51;
  const __CFString *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v47 = 0;
    if (v7)
    {
      v9 = dispatch_semaphore_create(0);
      -[RTNotifier queue](self, "queue");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__SMSafetyCacheStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke;
      block[3] = &unk_1E9297BC8;
      block[4] = self;
      v46 = a2;
      v12 = v9;
      v45 = v12;
      dispatch_async(v10, block);

      v13 = v12;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v13, v15))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v14;
        objc_msgSend(v40, "timeIntervalSinceDate:", v14);
        v17 = v16;
        v18 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_195);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = v18;
        objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0D18598];
        v53[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        v26 = 1;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v53, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 15, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = objc_retainAutorelease(v28);

          v26 = 0;
        }
        else
        {
          v29 = 0;
        }
        v11 = MEMORY[0x1E0C809B0];
        v14 = v41;
      }
      else
      {
        v29 = 0;
        v26 = 1;
      }

      v34 = v29;
      if ((v26 & 1) != 0)
      {
        objc_msgSend(v7, "options");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSafetyCacheStore fetchRequestFromStoredLocationOptions:](self, "fetchRequestFromStoredLocationOptions:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v42[0] = v11;
        v42[1] = 3221225472;
        v42[2] = __69__SMSafetyCacheStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_50;
        v42[3] = &unk_1E929F360;
        v43 = v8;
        v37 = (void *)MEMORY[0x1D8232094](v42);
        -[RTStore enumerateType:fetchRequest:enumerationBlock:](self, "enumerateType:fetchRequest:enumerationBlock:", objc_opt_class(), v36, v37);

      }
      else
      {
        (*((void (**)(id, _QWORD, id, char *))v8 + 2))(v8, MEMORY[0x1E0C9AA60], v34, &v47);
      }

    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0D18598];
      v51 = *MEMORY[0x1E0CB2D50];
      v52 = CFSTR("requires non-nil options.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 7, v32);
      v13 = objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v38;
        v49 = 2112;
        v50 = v13;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      (*((void (**)(id, _QWORD, NSObject *, char *))v8 + 2))(v8, MEMORY[0x1E0C9AA60], v13, &v47);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", buf, 2u);
    }
  }

}

void __69__SMSafetyCacheStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__SMSafetyCacheStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_2;
  v4[3] = &unk_1E9297628;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "_flushCachedLocationsWithHandler:", v4);

}

void __69__SMSafetyCacheStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, error, %@", (uint8_t *)&v6, 0x16u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __69__SMSafetyCacheStore_enumerateStoredLocationsWithContext_usingBlock___block_invoke_50(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        v16 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        v17 = (void *)objc_msgSend(v16, "initWithSMInitiatorLocation:", v15, (_QWORD)v18);
        objc_msgSend(v9, "addObject:", v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v8 || !objc_msgSend(v10, "count"))
    *a4 = 1;

}

- (void)fetchLastLocationWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SMSafetyCacheStore_fetchLastLocationWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __51__SMSafetyCacheStore_fetchLastLocationWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLastLocationWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchLastLocationWithHandler:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  char *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  SEL v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke;
    v21[3] = &unk_1E929DC08;
    v23 = a2;
    v8 = v5;
    v22 = v8;
    v9 = (void *)MEMORY[0x1D8232094](v21);
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke_59;
    v18[3] = &unk_1E929F338;
    v18[4] = self;
    v19 = v8;
    v20 = v9;
    v10 = v9;
    -[SMSafetyCacheStore _flushCachedLocationsWithHandler:](self, "_flushCachedLocationsWithHandler:", v18);

    v11 = v22;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[SMSafetyCacheStore _fetchLastLocationWithHandler:]";
      v26 = 1024;
      LODWORD(v27) = 476;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v30 = *MEMORY[0x1E0CB2D50];
    v31[0] = CFSTR("A handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      v28 = 2112;
      v29 = v13;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, %@, A handler is a required parameter, %@", buf, 0x20u);

    }
  }

}

void __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SMInitiatorLocationMO fetchRequest](SMInitiatorLocationMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setFetchLimit:", 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 0);
  v25[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  v16 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v16;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 138413058;
    v18 = v14;
    v19 = 2112;
    v20 = v4;
    v21 = 2048;
    v22 = v15;
    v23 = 2112;
    v24 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(MEMORY[0x1E0D8B970], "createWithManagedObject:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v12, "initWithSMInitiatorLocation:", v13);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke_59(id *a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id v6;

  if (a2)
  {
    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    objc_msgSend(a1[4], "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke_2;
    block[3] = &unk_1E929B4A8;
    block[4] = a1[4];
    v5 = a1[6];
    v6 = a1[5];
    dispatch_async(v3, block);

  }
}

void __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke_3;
  v3[3] = &unk_1E9297568;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performBlock:contextType:errorHandler:", v2, 1, v3);

}

uint64_t __52__SMSafetyCacheStore__fetchLastLocationWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SMSafetyCacheStore_fetchStoredLocationsWithContext_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __62__SMSafetyCacheStore_fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStoredLocationsWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  char *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SMSafetyCacheStore *v22;
  id v23;
  SEL v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke;
    v20[3] = &unk_1E92979A0;
    v21 = v7;
    v22 = self;
    v24 = a2;
    v10 = v8;
    v23 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v20);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke_61;
    v17[3] = &unk_1E929F338;
    v17[4] = self;
    v18 = v10;
    v19 = v11;
    v12 = v11;
    -[SMSafetyCacheStore _flushCachedLocationsWithHandler:](self, "_flushCachedLocationsWithHandler:", v17);

    v13 = v21;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SMSafetyCacheStore _fetchStoredLocationsWithContext:handler:]";
      v29 = 1024;
      v30 = 543;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("A handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v13);
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "A handler is a required parameter, %@", buf, 0xCu);
    }

  }
}

void __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
    v5 = v4;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v5, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestFromStoredLocationOptions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchOffset:", objc_msgSend(*(id *)(a1 + 32), "offset"));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v37 = objc_msgSend(v9, "fetchLimit");
    v38 = 2048;
    v39 = objc_msgSend(v9, "fetchOffset");
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "using options fetch limit, %lu, fetch offset, %lu", buf, 0x16u);
  }

  v34 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v9, &v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v34;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 138413058;
    v37 = (uint64_t)v24;
    v38 = 2112;
    v39 = (uint64_t)v9;
    v40 = 2048;
    v41 = v25;
    v42 = 2112;
    v43 = v12;
    _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "fetchLimit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v26 = v11;
    v27 = v9;
    v28 = v3;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v11;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1D8231EA8]();
          v21 = objc_alloc(MEMORY[0x1E0C9E3B8]);
          objc_msgSend(MEMORY[0x1E0D8B970], "createWithManagedObject:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v21, "initWithSMInitiatorLocation:", v22);

          if (v23)
            objc_msgSend(v14, "addObject:", v23);

          objc_autoreleasePoolPop(v20);
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v16);
    }

    v3 = v28;
    v9 = v27;
    v12 = 0;
    v11 = v26;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke_61(id *a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id v6;

  if (a2)
  {
    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    objc_msgSend(a1[4], "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke_2;
    block[3] = &unk_1E929B4A8;
    block[4] = a1[4];
    v5 = a1[6];
    v6 = a1[5];
    dispatch_async(v3, block);

  }
}

void __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke_3;
  v3[3] = &unk_1E9297568;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performBlock:contextType:errorHandler:", v2, 1, v3);

}

uint64_t __63__SMSafetyCacheStore__fetchStoredLocationsWithContext_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SMSafetyCacheStore_fetchStoredLocationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __62__SMSafetyCacheStore_fetchStoredLocationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStoredLocationsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[SMSafetyCacheStore _fetchStoredLocationsWithOptions:handler:]";
      v12 = 1024;
      v13 = 617;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184E8]), "initWithEnumerationOptions:", v6);
  -[SMSafetyCacheStore _fetchStoredLocationsWithContext:handler:](self, "_fetchStoredLocationsWithContext:handler:", v9, v7);

}

- (void)removeLocationsPredating:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *);
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3880];
    v8 = a4;
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("timestamp"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray filterUsingPredicate:](self->_locations, "filterUsingPredicate:", v9);
    v17 = CFSTR("date");
    v16 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTStore purgePredating:predicateMappings:handler:](self, "purgePredating:predicateMappings:handler:", v6, v11, v8);
  }
  else
  {
    v12 = (void (**)(id, void *))a4;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SMSafetyCacheStore removeLocationsPredating:handler:]";
      v23 = 1024;
      v24 = 628;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D18598];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("requires a valid date.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v11);
  }

}

- (void)fetchMetricsWithOptions:(id)a3 handler:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0D18598];
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("fetchMetricsWithOptions:handler: not supported");
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a4;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a4 + 2))(v8, 0, v10);

}

- (void)fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 handler:(id)a7
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0D18598];
  v14 = *MEMORY[0x1E0CB2D50];
  v15[0] = CFSTR("fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler: not supported");
  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = a7;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a7 + 2))(v11, 0, v13);

}

- (void)_storeLocations:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  OS_os_transaction *v15;
  OS_os_transaction *flushTransaction;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  if (-[RTService isShuttingDown](self, "isShuttingDown"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v34 = objc_msgSend(v7, "count");
      _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "Ignoring %lu locations for storage, shutdown in progress", buf, 0xCu);
    }

LABEL_15:
    if (v8)
      v8[2](v8, 0);
    goto LABEL_17;
  }
  if (objc_msgSend(v7, "count"))
  {
    -[NSMutableArray addObjectsFromArray:](self->_locations, "addObjectsFromArray:", v7);
    if (-[NSMutableArray count](self->_locations, "count") && !self->_flushTransaction)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v12, v13);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v14, "UTF8String");
      v15 = (OS_os_transaction *)os_transaction_create();
      flushTransaction = self->_flushTransaction;
      self->_flushTransaction = v15;

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = (uint64_t)v31;
        v35 = 2112;
        v36 = v32;
        _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

      }
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v7, "count");
      objc_msgSend(v7, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[NSMutableArray count](self->_locations, "count");
      *(_DWORD *)buf = 138413570;
      v34 = (uint64_t)v24;
      v35 = 2112;
      v36 = v25;
      v37 = 2048;
      v38 = v26;
      v39 = 2112;
      v40 = v27;
      v41 = 2112;
      v42 = v28;
      v43 = 2048;
      v44 = v29;
      _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "%@, %@, added %lu locations to cache, first, %@, last, %@, total, %lu", buf, 0x3Eu);

    }
    -[SMSafetyCacheStore _startFlushTimer](self, "_startFlushTimer");
    if ((unint64_t)-[NSMutableArray count](self->_locations, "count") >= 0x97)
      -[SMSafetyCacheStore _flushCachedLocations](self, "_flushCachedLocations");
    goto LABEL_15;
  }
  if (v8)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0D18598];
    v45 = *MEMORY[0x1E0CB2D50];
    v46[0] = CFSTR("requires valid locations.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 7, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v8)[2](v8, v22);

  }
LABEL_17:

}

- (id)fetchRequestFromStoredLocationOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  void *v58;
  uint8_t buf[16];
  _QWORD v60[4];
  _QWORD v61[3];
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    +[SMInitiatorLocationMO fetchRequest](SMInitiatorLocationMO, "fetchRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), objc_msgSend(v3, "ascending"));
    v62[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSortDescriptors:", v6);

    objc_msgSend(v3, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;

    objc_msgSend(v3, "dateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    objc_msgSend(v3, "horizontalAccuracy");
    if (v18 == 0.0)
    {
      v20 = 1.79769313e308;
    }
    else
    {
      objc_msgSend(v3, "horizontalAccuracy");
      v20 = v19;
    }
    if (objc_msgSend(v3, "batchSize"))
    {
      v21 = objc_msgSend(v3, "batchSize");
      v22 = 3600;
      if (v21 < 0xE10)
        v22 = v21;
    }
    else
    {
      v22 = 3600;
    }
    v55 = v22;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v57 = v12;
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ <= %K"), v12, CFSTR("date"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v24;
    v56 = v17;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("date"), v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v25;
    v26 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("hunc"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "andPredicateWithSubpredicates:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v58;
    objc_msgSend(v58, "addObject:", v30);
    objc_msgSend(v3, "boundingBoxLocation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      *(_QWORD *)buf = 0;
      objc_msgSend(v3, "boundingBoxLocation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "coordinate");
      objc_msgSend(v3, "boundingBoxLocation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "coordinate");
      objc_msgSend(v3, "boundingBoxLocation");
      v53 = v30;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "horizontalAccuracy");
      RTCommonCalculateBoundingBox();

      v50 = (void *)MEMORY[0x1E0CB3528];
      v36 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "predicateWithFormat:", CFSTR("%@ <= %K"), v52, CFSTR("longitude"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v51;
      v37 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("longitude"), v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v60[1] = v39;
      v54 = v4;
      v40 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "predicateWithFormat:", CFSTR("%@ <= %K"), v41, CFSTR("latitude"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v60[2] = v42;
      v43 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("latitude"), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v60[3] = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 4);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "andPredicateWithSubpredicates:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v53;
      v4 = v54;

      v31 = v58;
      objc_msgSend(v58, "addObject:", v47);

    }
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v31);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v48);

    objc_msgSend(v4, "setFetchBatchSize:", 50);
    objc_msgSend(v4, "setFetchLimit:", v55);

    v11 = v57;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (RTTimer)flushTimer
{
  return self->_flushTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_flushTransaction, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
}

@end
