@implementation RCPersistentContainer

- (id)newBackgroundModel
{
  RCSavedRecordingsModel *v3;
  id v4;
  RCSavedRecordingsModel *v5;

  v3 = [RCSavedRecordingsModel alloc];
  v4 = -[RCPersistentContainer newContextWithConcurrencyType:](self, "newContextWithConcurrencyType:", 1);
  v5 = -[RCSavedRecordingsModel initWithContext:](v3, "initWithContext:", v4);

  return v5;
}

- (id)newContextWithConcurrencyType:(unint64_t)a3
{
  NSPersistentContainer *persistentContainer;
  NSManagedObjectContext *v5;

  persistentContainer = self->_persistentContainer;
  if (a3 == 2)
  {
    -[NSPersistentContainer viewContext](persistentContainer, "viewContext");
    v5 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue();
    if (!self->_viewContextIsConfigured)
    {
      -[RCPersistentContainer _configureContext:isViewContext:](self, "_configureContext:isViewContext:", v5, 1);
      self->_viewContextIsConfigured = 1;
    }
  }
  else
  {
    v5 = -[NSPersistentContainer newBackgroundContext](persistentContainer, "newBackgroundContext");
    -[RCPersistentContainer _configureContext:isViewContext:](self, "_configureContext:isViewContext:", v5, 0);
  }
  return v5;
}

- (void)_configureContext:(id)a3 isViewContext:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RCPersistentContainer *v10;
  BOOL v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__RCPersistentContainer__configureContext_isViewContext___block_invoke;
  v8[3] = &unk_1E769C2A0;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v8);

}

- (RCPersistentContainer)initWithURL:(id)a3
{
  id v4;
  RCPersistentContainer *v5;
  void *v6;
  uint64_t v7;
  NSPersistentContainer *persistentContainer;
  uint64_t v9;
  id v10;
  NSPersistentStore *store;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  RCPersistentContainer *v18;
  void *v19;
  uint64_t v20;
  NSString *transactionAuthor;
  id v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RCPersistentContainer;
  v5 = -[RCPersistentContainer init](&v24, sel_init);
  if (!v5)
  {
LABEL_10:
    v18 = v5;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C97B98], "rc_newObjectModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97BC8]), "initWithName:managedObjectModel:", CFSTR("VoiceMemos"), v6);
  persistentContainer = v5->_persistentContainer;
  v5->_persistentContainer = (NSPersistentContainer *)v7;

  v23 = 0;
  -[RCPersistentContainer loadStore:error:](v5, "loadStore:error:", v4, &v23);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v23;
  store = v5->_store;
  v5->_store = (NSPersistentStore *)v9;

  if (v5->_store)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v12, "processName");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v16;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%d"), v19, objc_msgSend(v12, "processIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    transactionAuthor = v5->_transactionAuthor;
    v5->_transactionAuthor = (NSString *)v20;

    goto LABEL_10;
  }
  OSLogForCategory(CFSTR("Default"));
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[RCPersistentContainer initWithURL:].cold.1((uint64_t)v10, v17);

  v18 = 0;
LABEL_11:

  return v18;
}

- (id)loadStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[RCPersistentContainer storeDescriptionWithURL:](self, "storeDescriptionWithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPersistentContainer persistentContainer](self, "persistentContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPersistentStoreDescriptions:", v8);

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  -[RCPersistentContainer persistentContainer](self, "persistentContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __41__RCPersistentContainer_loadStore_error___block_invoke;
  v16[3] = &unk_1E769CCB0;
  v16[4] = &v17;
  objc_msgSend(v10, "loadPersistentStoresWithCompletionHandler:", v16);

  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  -[RCPersistentContainer persistentContainer](self, "persistentContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "persistentStoreCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "persistentStoreForURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v17, 8);
  return v14;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (id)storeDescriptionWithURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "storeDescriptionForURL:isXPCClient:configuration:", v3, 1, CFSTR("Cloud"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)storeDescriptionForURL:(id)a3 isXPCClient:(BOOL)a4 configuration:(id)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;

  v5 = a4;
  v7 = (void *)MEMORY[0x1E0C97C08];
  v8 = a5;
  objc_msgSend(v7, "persistentStoreDescriptionWithURL:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v9, "setOption:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C978D0]);
  objc_msgSend(v9, "setOption:forKey:", v10, *MEMORY[0x1E0C97868]);
  objc_msgSend(v9, "setOption:forKey:", *MEMORY[0x1E0CB2AC0], *MEMORY[0x1E0C97940]);
  objc_msgSend(v9, "setOption:forKey:", v10, *MEMORY[0x1E0C97900]);
  objc_msgSend(v9, "setOption:forKey:", v10, *MEMORY[0x1E0C97970]);
  objc_msgSend(v9, "setOption:forKey:", v10, *MEMORY[0x1E0C97A50]);
  objc_msgSend(v9, "setConfiguration:", v8);

  if (v5)
  {
    objc_msgSend(v9, "setOption:forKey:", CFSTR("com.apple.voicememod.datastore.Cloud"), *MEMORY[0x1E0C97A60]);
    objc_msgSend(v9, "setOption:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97A40]);
    v11 = (_QWORD *)MEMORY[0x1E0C97A70];
  }
  else
  {
    v11 = (_QWORD *)MEMORY[0x1E0C979E8];
  }
  objc_msgSend(v9, "setType:", *v11);
  return v9;
}

uint64_t __57__RCPersistentContainer__configureContext_isViewContext___block_invoke(uint64_t a1)
{
  const __CFString *v2;

  objc_msgSend(*(id *)(a1 + 32), "setTransactionAuthor:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(*(id *)(a1 + 32), "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  if (*(_BYTE *)(a1 + 48))
    v2 = CFSTR("view");
  else
    v2 = CFSTR("background");
  return objc_msgSend(*(id *)(a1 + 32), "setName:", v2);
}

- (NSString)transactionAuthor
{
  return self->_transactionAuthor;
}

void __41__RCPersistentContainer_loadStore_error___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (NSPersistentStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_transactionAuthor, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)initWithURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[RCPersistentContainer initWithURL:]";
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_1BD830000, a2, OS_LOG_TYPE_FAULT, "%s -- Failed to load persistent store, error = %@", (uint8_t *)&v2, 0x16u);
}

@end
