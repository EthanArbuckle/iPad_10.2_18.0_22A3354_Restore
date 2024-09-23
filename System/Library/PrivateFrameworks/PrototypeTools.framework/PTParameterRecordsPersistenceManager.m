@implementation PTParameterRecordsPersistenceManager

- (PTParameterRecordsPersistenceManager)init
{
  PTParameterRecordsPersistenceManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *parameterRecordsArchiveQueue;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTParameterRecordsPersistenceManager;
  v2 = -[PTParameterRecordsPersistenceManager init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.PrototypeTools.PTParameterRecordsPersistenceManager", 0);
    parameterRecordsArchiveQueue = v2->_parameterRecordsArchiveQueue;
    v2->_parameterRecordsArchiveQueue = (OS_dispatch_queue *)v3;

    _ParameterRecordsPath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTParameterRecordsPersistenceManager setPath:](v2, "setPath:", v5);

  }
  return v2;
}

- (id)createParameterRecordsFromArchiveDictionary
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  PTParameterRecords *v13;
  id v15;
  id v16;
  _QWORD v17[4];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99D50];
  -[PTParameterRecordsPersistenceManager path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v2, "dataWithContentsOfFile:options:error:", v3, 0, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;

  if (v5)
  {
    PTLogObjectForTopic(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_1B966F000, v6, OS_LOG_TYPE_DEFAULT, "Unexpected error: %@", buf, 0xCu);
    }

  }
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  v15 = v5;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v9, v4, &v15);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (!v10)
  {
    PTLogObjectForTopic(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1B966F000, v12, OS_LOG_TYPE_DEFAULT, "Error unarchiving persisted proxy definition: %@", buf, 0xCu);
    }

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  v13 = -[PTParameterRecords initWithDictionary:]([PTParameterRecords alloc], "initWithDictionary:", v10);

  return v13;
}

- (void)_writeToDiskWithParameterRecords:(id)a3
{
  id v4;
  NSObject *parameterRecordsArchiveQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  PTParameterRecordsPersistenceManager *v9;

  v4 = a3;
  parameterRecordsArchiveQueue = self->_parameterRecordsArchiveQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PTParameterRecordsPersistenceManager__writeToDiskWithParameterRecords___block_invoke;
  v7[3] = &unk_1E7058150;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(parameterRecordsArchiveQueue, v7);

}

void __73__PTParameterRecordsPersistenceManager__writeToDiskWithParameterRecords___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(*(id *)(a1 + 32), "recordDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v2, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;

  if (!v4)
    goto LABEL_3;
  objc_msgSend(*(id *)(a1 + 40), "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  v7 = objc_msgSend(v4, "writeToFile:options:error:", v6, 1, &v14);
  v8 = v14;

  v5 = v8;
  if ((v7 & 1) == 0)
  {
LABEL_3:
    PTLogObjectForTopic(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1B966F000, v9, OS_LOG_TYPE_DEFAULT, "Unable to write test recipe dictionary to file %@: %@", buf, 0x16u);

    }
  }
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = 0;

}

- (void)writeToDisk:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PTParameterRecordsPersistenceManager_writeToDisk___block_invoke;
  v6[3] = &unk_1E7058150;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __52__PTParameterRecordsPersistenceManager_writeToDisk___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (v3)
  {
    objc_msgSend(v3, "invalidate");
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_initWeak(&location, v2);
  v4 = (void *)MEMORY[0x1E0C99E88];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PTParameterRecordsPersistenceManager_writeToDisk___block_invoke_2;
  v8[3] = &unk_1E7058550;
  objc_copyWeak(&v10, &location);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 0.25);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v5;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __52__PTParameterRecordsPersistenceManager_writeToDisk___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_writeToDiskWithParameterRecords:", *(_QWORD *)(a1 + 32));

}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_parameterRecordsArchiveQueue, 0);
  objc_storeStrong((id *)&self->_writeTimer, 0);
}

@end
