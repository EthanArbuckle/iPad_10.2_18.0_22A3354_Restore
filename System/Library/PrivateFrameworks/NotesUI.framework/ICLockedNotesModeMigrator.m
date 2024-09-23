@implementation ICLockedNotesModeMigrator

- (ICLockedNotesModeMigrator)initWithWorkerContext:(id)a3
{
  id v5;
  ICLockedNotesModeMigrator *v6;
  ICLockedNotesModeMigrator *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICLockedNotesModeMigrator;
  v6 = -[ICLockedNotesModeMigrator init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workerContext, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.notes.locked-notes-mode-migrator", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D636E0];
    objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel_authenticationStateDidAuthenticate_, v13, v14);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0D636E8];
    objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel_authenticationStateDidDeauthenticate_, v16, v17);

  }
  return v7;
}

+ (ICLockedNotesModeMigrator)sharedMigrator
{
  if (sharedMigrator_onceToken != -1)
    dispatch_once(&sharedMigrator_onceToken, &__block_literal_global_67);
  return (ICLockedNotesModeMigrator *)(id)sharedMigrator_sharedMigrator;
}

void __43__ICLockedNotesModeMigrator_sharedMigrator__block_invoke()
{
  void *v0;
  ICLockedNotesModeMigrator *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "workerManagedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = -[ICLockedNotesModeMigrator initWithWorkerContext:]([ICLockedNotesModeMigrator alloc], "initWithWorkerContext:", v3);
  v2 = (void *)sharedMigrator_sharedMigrator;
  sharedMigrator_sharedMigrator = (uint64_t)v1;

}

- (void)migrateLockedNotesInAccount:(id)a3 toMode:(signed __int16)a4 window:(id)a5 completionHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  ICLongRunningTaskController *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ICLockedNotesModeMigrator migrateLockedNotesInAccount:toMode:window:completionHandler:].cold.2(v10);

  if ((_DWORD)v8)
  {
    objc_msgSend(v10, "setResolvedLockedNotesMode:", v8);
    objc_msgSend(v10, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ic_saveWithLogDescription:", CFSTR("Saved after setting locked notes mode"));

    v15 = -[ICLongRunningTaskController initWithWindow:intervalBeforeOpeningProgressDialog:]([ICLongRunningTaskController alloc], "initWithWindow:intervalBeforeOpeningProgressDialog:", v11, 1.0);
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Changing Method…"), CFSTR("Changing Method…"), 0, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLongRunningTaskController setProgressString:](v15, "setProgressString:", v16);

    -[ICLongRunningTaskController setIndeterminate:](v15, "setIndeterminate:", 1);
    -[ICLongRunningTaskController setShouldShowCircularProgress:](v15, "setShouldShowCircularProgress:", 1);
    v17 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke;
    v21[3] = &unk_1E5C1DBB0;
    v21[4] = self;
    v22 = v10;
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke_4;
    v19[3] = &unk_1E5C1E808;
    v20 = v12;
    -[ICLongRunningTaskController startTask:completionBlock:](v15, "startTask:completionBlock:", v21, v19);

  }
  else
  {
    v18 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ICLockedNotesModeMigrator migrateLockedNotesInAccount:toMode:window:completionHandler:].cold.1(v10);

    v15 = (ICLongRunningTaskController *)objc_alloc_init(MEMORY[0x1E0CB38A8]);
    if (v12)
      (*((void (**)(id, ICLongRunningTaskController *))v12 + 2))(v12, v15);
  }

}

void __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke_2;
  block[3] = &unk_1E5C1D7C0;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = v3;
  v7 = v3;
  dispatch_sync(v4, block);

}

void __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "workerContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5C1D7C0;
  v4 = *(void **)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  objc_msgSend(v3, "performBlockAndWait:", v6);

}

void __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectWithID:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "lockedNotesInAccount:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "unsafelyMigrateNotes:progress:", v4, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_saveWithLogDescription:", CFSTR("Saved after migrating notes"));

}

uint64_t __89__ICLockedNotesModeMigrator_migrateLockedNotesInAccount_toMode_window_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)migrateNote:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  ICLockedNotesModeMigrator *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICLockedNotesModeMigrator migrateNote:completionHandler:].cold.1(v6);

  -[ICLockedNotesModeMigrator queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICLockedNotesModeMigrator_migrateNote_completionHandler___block_invoke;
  block[3] = &unk_1E5C20C00;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __59__ICLockedNotesModeMigrator_migrateNote_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "workerContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__ICLockedNotesModeMigrator_migrateNote_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5C20C00;
  v4 = *(void **)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  objc_msgSend(v3, "performBlockAndWait:", v6);

}

void __59__ICLockedNotesModeMigrator_migrateNote_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectWithID:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsafelyMigrateNotes:progress:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_saveWithLogDescription:", CFSTR("Saved after migrating note"));

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

- (void)migrateNoteToV1NeoIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICLockedNotesModeMigrator migrateNoteToV1NeoIfNeeded:completionHandler:].cold.5(v6);

  if ((objc_msgSend(v6, "isPasswordProtected") & 1) == 0)
  {
    v16 = os_log_create("com.apple.notes", "Crypto");
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    objc_msgSend(v6, "shortLoggingDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412290;
    v31 = v17;
    v18 = "Not migrating note to v1 Neo because it's not password-protected {note: %@}";
LABEL_15:
    _os_log_impl(&dword_1AC7A1000, v16, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v30, 0xCu);

    goto LABEL_16;
  }
  objc_msgSend(v6, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "supportsV1Neo");

  if ((v11 & 1) == 0)
  {
    v16 = os_log_create("com.apple.notes", "Crypto");
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    objc_msgSend(v6, "shortLoggingDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412290;
    v31 = v17;
    v18 = "Not migrating note to v1 Neo because its account doesn't support it {note: %@}";
    goto LABEL_15;
  }
  objc_msgSend(v6, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cryptoStrategy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "v1NeoStrategy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAuthenticated");

  if ((v15 & 1) == 0)
  {
    v16 = os_log_create("com.apple.notes", "Crypto");
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    objc_msgSend(v6, "shortLoggingDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412290;
    v31 = v17;
    v18 = "Not migrating note to v1 Neo because its account isn't authenticated for v1 Neo {note: %@}";
    goto LABEL_15;
  }
  if (objc_msgSend(MEMORY[0x1E0D63AB8], "cipherVersionForObject:", v6))
  {
    v16 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[ICLockedNotesModeMigrator migrateNoteToV1NeoIfNeeded:completionHandler:].cold.4(v6);
  }
  else
  {
    objc_msgSend(v6, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cryptoStrategy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasSameKeyAsObject:", v6);

    if ((v21 & 1) != 0)
    {
      objc_msgSend(v6, "attachments");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "ic_containsObjectPassingTest:", &__block_literal_global_33_2);

      if (!v23)
      {
        -[ICLockedNotesModeMigrator authenticatedAt](self, "authenticatedAt");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "modificationDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "ic_isLaterThanDate:", v25);

        v27 = os_log_create("com.apple.notes", "Crypto");
        v28 = v27;
        if (v26)
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            -[ICLockedNotesModeMigrator migrateNoteToV1NeoIfNeeded:completionHandler:].cold.2(v6);

          if (v7)
            goto LABEL_17;
        }
        else
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v6, "shortLoggingDescription");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = 138412290;
            v31 = v29;
            _os_log_impl(&dword_1AC7A1000, v28, OS_LOG_TYPE_INFO, "Migrating note to v1 Neo… {note: %@}", (uint8_t *)&v30, 0xCu);

          }
          -[ICLockedNotesModeMigrator migrateNote:completionHandler:](self, "migrateNote:completionHandler:", v6, v7);
        }
        goto LABEL_18;
      }
      v16 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[ICLockedNotesModeMigrator migrateNoteToV1NeoIfNeeded:completionHandler:].cold.1(v6);
    }
    else
    {
      v16 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[ICLockedNotesModeMigrator migrateNoteToV1NeoIfNeeded:completionHandler:].cold.3(v6);
    }
  }
LABEL_16:

  if (v7)
LABEL_17:
    v7[2](v7, 0);
LABEL_18:

}

uint64_t __74__ICLockedNotesModeMigrator_migrateNoteToV1NeoIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAuthenticated") ^ 1;
}

- (id)unsafelyMigrateNotes:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC4730];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", v10, &__block_literal_global_34_1);

  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginBlockingDeauthentication");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTotalUnitCount:", objc_msgSend(v6, "count"));
  v12 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v13;
    _os_log_impl(&dword_1AC7A1000, v12, OS_LOG_TYPE_INFO, "Migrating locked notes… {#notes: %@}", buf, 0xCu);

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v37;
    obj = v14;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[ICLockedNotesModeMigrator unsafelyMigrateNote:](self, "unsafelyMigrateNote:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + 1);
        if (v20)
        {
          objc_msgSend(v35, "addObject:", v20);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "postNotificationName:object:", CFSTR("ICLockedNotesModeMigratorDidMigrateNote"), self);

          objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "crossProcessChangeCoordinator");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "postCrossProcessNotificationName:", CFSTR("ICLockedNotesModeMigratorDidMigrateNote"));

        }
        v24 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v19, "shortLoggingDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "shortLoggingDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v41 = v25;
          v42 = 2112;
          v43 = v26;
          v44 = 2112;
          v45 = v7;
          _os_log_impl(&dword_1AC7A1000, v24, OS_LOG_TYPE_INFO, "Migrated note {note: %@, newNote: %@, progress: %@}", buf, 0x20u);

        }
      }
      v14 = obj;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "endBlockingDeauthentication");

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", v33);
  v28 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v41 = v29;
    v42 = 2112;
    v43 = v30;
    _os_log_impl(&dword_1AC7A1000, v28, OS_LOG_TYPE_INFO, "Migrated locked notes {#notes: %@, #migratedNotes: %@}", buf, 0x16u);

  }
  v31 = (void *)objc_msgSend(v35, "copy");

  return v31;
}

void __59__ICLockedNotesModeMigrator_unsafelyMigrateNotes_progress___block_invoke()
{
  NSObject *v0;
  void *v1;

  v0 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __59__ICLockedNotesModeMigrator_unsafelyMigrateNotes_progress___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endBlockingDeauthentication");

}

- (id)unsafelyMigrateNote:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ICLockedNotesModeMigrator unsafelyMigrateNote:].cold.2(v3);

  v5 = objc_msgSend(MEMORY[0x1E0D63AB8], "cipherVersionForObject:", v3);
  v6 = objc_msgSend(MEMORY[0x1E0D63AB8], "userSelectedCipherVersionForObject:", v3);
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v8;
      v9 = "Cannot migrate note because it's not password-protected — skipping {note: %@}";
      goto LABEL_17;
    }
LABEL_18:

    v14 = 0;
    goto LABEL_19;
  }
  if (v6 == v5)
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v8;
      v9 = "Note doesn't require migration — skipping {note: %@}";
LABEL_17:
      _os_log_impl(&dword_1AC7A1000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v18, 0xCu);

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if ((objc_msgSend(v3, "isAuthenticated") & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v8;
      v9 = "Cannot migrate note because it's not authenticated — skipping {note: %@}";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  objc_msgSend(v3, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAuthenticated");

  if ((v11 & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v8;
      v9 = "Cannot migrate note because its account is not authenticated — skipping {note: %@}";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v12 = (void *)MEMORY[0x1AF445E78]();
  objc_msgSend(MEMORY[0x1E0D63BB8], "duplicateNote:isPasswordProtected:removeOriginalNote:", v3, 1, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    v17 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ICLockedNotesModeMigrator unsafelyMigrateNote:].cold.1(v3);

  }
  objc_autoreleasePoolPop(v12);
LABEL_19:

  return v14;
}

- (BOOL)account:(id)a3 supportsMode:(signed __int16)a4
{
  unsigned int v4;
  id v5;
  void *v6;
  char v7;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4 >= 2)
  {
    if (v4 != 2)
      goto LABEL_9;
    if (!objc_msgSend(v5, "canPasswordProtectNotes"))
    {
      LOBYTE(v4) = 0;
      goto LABEL_9;
    }
    if (objc_msgSend(v6, "accountType") == 3)
    {
      LOBYTE(v4) = 1;
      goto LABEL_9;
    }
    v7 = objc_msgSend(v6, "isPrimaryiCloudAccount");
  }
  else
  {
    v7 = objc_msgSend(v5, "canPasswordProtectNotes");
  }
  LOBYTE(v4) = v7;
LABEL_9:

  return v4 & 1;
}

- (BOOL)account:(id)a3 hasNotesLockedWithMode:(signed __int16)a4
{
  void *v5;
  _QWORD v7[4];
  signed __int16 v8;

  -[ICLockedNotesModeMigrator lockedNotesInAccount:](self, "lockedNotesInAccount:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__ICLockedNotesModeMigrator_account_hasNotesLockedWithMode___block_invoke;
  v7[3] = &__block_descriptor_34_e23_B32__0__ICNote_8Q16_B24l;
  v8 = a4;
  LOBYTE(a4) = objc_msgSend(v5, "ic_containsObjectPassingTest:", v7);

  return a4;
}

BOOL __60__ICLockedNotesModeMigrator_account_hasNotesLockedWithMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0D63AB8], "shouldAuthenticateWithCustomPasswordForObject:", v3)
    && *(_WORD *)(a1 + 32) == 1)
  {
    v4 = 1;
  }
  else if (objc_msgSend(MEMORY[0x1E0D63AB8], "shouldAuthenticateWithDevicePasswordForObject:", v3))
  {
    v4 = *(unsigned __int16 *)(a1 + 32) == 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)lockedNotesInAccount:(id)a3
{
  void *v3;
  void *v4;
  id v5;
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
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  v4 = (void *)MEMORY[0x1E0D63A90];
  v5 = a3;
  objc_msgSend(v4, "predicateForVisibleObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63A90], "predicateForPasswordProtectedObjects", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v8 = (void *)MEMORY[0x1E0D63BB8];
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateForNotesInAccountWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D63BB8];
  objc_msgSend(v5, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "notesMatchingPredicate:context:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)presentBackwardsCompatibilityAlertIfNeededForAccount:(id)a3 mode:(signed __int16)a4 window:(id)a5 confirmHandler:(id)a6 cancelHandler:(id)a7
{
  int v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ICLockedNotesModeMigrator presentBackwardsCompatibilityAlertIfNeededForAccount:mode:window:confirmHandler:cancelHandler:].cold.3(v11);

  if (v10 == 2)
  {
    objc_msgSend(MEMORY[0x1E0D63A98], "sharedController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke;
    v19[3] = &unk_1E5C22CF8;
    v20 = v11;
    v22 = v13;
    v23 = v14;
    v21 = v12;
    objc_msgSend(v17, "messageForAccount:minimumNotesVersion:completionHandler:", v20, 9, v19);

  }
  else if (v10 == 1)
  {
    v16 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[ICLockedNotesModeMigrator presentBackwardsCompatibilityAlertIfNeededForAccount:mode:window:confirmHandler:cancelHandler:].cold.2();

    if (v13)
      (*((void (**)(id, id))v13 + 2))(v13, v12);
  }
  else
  {
    v18 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ICLockedNotesModeMigrator presentBackwardsCompatibilityAlertIfNeededForAccount:mode:window:confirmHandler:cancelHandler:].cold.1();

    if (v14)
      (*((void (**)(id, id))v14 + 2))(v14, v12);
  }

}

void __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5 = a1[4];
  v7 = a1[6];
  v8 = a1[7];
  v6 = a1[5];
  v4 = v3;
  performBlockOnMainThread();

}

void __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;

  v2 = a1[4];
  v3 = os_log_create("com.apple.notes", "Crypto");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
      __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke_2_cold_2();

    +[ICAuthenticationAlert devicePasswordIncompatibleConfirmationAlertWithAccount:incompatibilityMessage:](ICAuthenticationAlert, "devicePasswordIncompatibleConfirmationAlertWithAccount:incompatibilityMessage:", a1[5], a1[4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActionHandler:", a1[7]);
    objc_msgSend(v5, "setDismissHandler:", a1[8]);
    objc_msgSend(v5, "presentInWindow:completionHandler:", a1[6], 0);

  }
  else
  {
    if (v4)
      __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke_2_cold_1();

    v6 = a1[7];
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, a1[6]);
  }
}

- (void)presentDivergedModeAlertForNote:(id)a3 mode:(signed __int16)a4 window:(id)a5 completionHandler:(id)a6
{
  int v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void (**v22)(_QWORD);

  v8 = a4;
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD))a6;
  v12 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ICLockedNotesModeMigrator presentDivergedModeAlertForNote:mode:window:completionHandler:].cold.3(v9);

  if (v8 == 2)
  {
    objc_msgSend(MEMORY[0x1E0D63A98], "sharedController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "account");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __91__ICLockedNotesModeMigrator_presentDivergedModeAlertForNote_mode_window_completionHandler___block_invoke;
    v19[3] = &unk_1E5C1E790;
    v20 = v9;
    v21 = v10;
    v22 = v11;
    objc_msgSend(v16, "messageForAccount:minimumNotesVersion:completionHandler:", v17, 9, v19);

  }
  else if (v8 == 1)
  {
    v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ICLockedNotesModeMigrator presentDivergedModeAlertForNote:mode:window:completionHandler:].cold.2();

    objc_msgSend(v9, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAuthenticationAlert updateDivergedDevicePasswordModeActionAlertWithAccount:](ICAuthenticationAlert, "updateDivergedDevicePasswordModeActionAlertWithAccount:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "presentInWindow:completionHandler:", v10, v11);
  }
  else
  {
    v18 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ICLockedNotesModeMigrator presentDivergedModeAlertForNote:mode:window:completionHandler:].cold.1();

    if (v11)
      v11[2](v11);
  }

}

void __91__ICLockedNotesModeMigrator_presentDivergedModeAlertForNote_mode_window_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = a2;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v4 = v3;
  performBlockOnMainThread();

}

void __91__ICLockedNotesModeMigrator_presentDivergedModeAlertForNote_mode_window_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __91__ICLockedNotesModeMigrator_presentDivergedModeAlertForNote_mode_window_completionHandler___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAuthenticationAlert updateDivergedCustomPasswordModeActionAlertWithAccount:incompatibilityMessage:](ICAuthenticationAlert, "updateDivergedCustomPasswordModeActionAlertWithAccount:incompatibilityMessage:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "presentInWindow:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  NSObject *v12;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ICLockedNotesModeMigrator presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:window:completionHandler:].cold.2(v8);

  if (-[ICLockedNotesModeMigrator account:supportsMode:](self, "account:supportsMode:", v8, 2))
  {
    -[objc_class presentForAccount:skipsAlerts:window:completion:](NSClassFromString(CFSTR("ICLockedNotesWelcomeViewController")), "presentForAccount:skipsAlerts:window:completion:", v8, 1, v9, v10);
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICLockedNotesModeMigrator presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:window:completionHandler:].cold.1();

    if (v10)
      v10[2](v10, objc_msgSend(v8, "resolvedLockedNotesMode"));
  }

}

- (void)presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  NSObject *v12;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ICLockedNotesModeMigrator presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:window:completionHandler:].cold.2(v8);

  if (-[ICLockedNotesModeMigrator account:supportsMode:](self, "account:supportsMode:", v8, 2))
  {
    -[objc_class presentForAccount:skipsAlerts:window:completion:](NSClassFromString(CFSTR("ICLockedNotesSwitchViewController")), "presentForAccount:skipsAlerts:window:completion:", v8, 1, v9, v10);
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICLockedNotesModeMigrator presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:window:completionHandler:].cold.1();

    if (v10)
      v10[2](v10, objc_msgSend(v8, "resolvedLockedNotesMode"));
  }

}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  Class v16;
  void *v17;
  NSObject *v18;
  Class v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:].cold.6(v8);

  if (!-[ICLockedNotesModeMigrator account:supportsMode:](self, "account:supportsMode:", v8, 2))
  {
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:].cold.5();
    goto LABEL_9;
  }
  objc_msgSend(v8, "accountData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "lockedNotesMode");

  if (!v13)
  {
    if (objc_msgSend(MEMORY[0x1E0D63BB8], "countOfVisiblePasswordProtectedNotesInAccount:", v8)
      || objc_msgSend(v8, "hasPassphraseSet"))
    {
      if (!+[ICAuthenticationAlert shouldPresentSwitchToDevicePasswordPromptForAccount:](ICAuthenticationAlert, "shouldPresentSwitchToDevicePasswordPromptForAccount:", v8))
      {
        v14 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:].cold.2();
        goto LABEL_9;
      }
      +[ICAuthenticationAlert markSwitchToDevicePasswordPromptPresentedForAccount:](ICAuthenticationAlert, "markSwitchToDevicePasswordPromptPresentedForAccount:", v8);
      v15 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:].cold.1();

      v16 = NSClassFromString(CFSTR("ICLockedNotesSwitchViewController"));
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __106__ICLockedNotesModeMigrator_presentLockedNotesMigrationPromptIfNeededForAccount_window_completionHandler___block_invoke;
      v22[3] = &unk_1E5C22D20;
      v23 = v10;
      -[objc_class presentForAccount:skipsAlerts:window:completion:](v16, "presentForAccount:skipsAlerts:window:completion:", v8, 0, v9, v22);
      v17 = v23;
    }
    else
    {
      v18 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:].cold.3();

      v19 = NSClassFromString(CFSTR("ICLockedNotesWelcomeViewController"));
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __106__ICLockedNotesModeMigrator_presentLockedNotesMigrationPromptIfNeededForAccount_window_completionHandler___block_invoke_49;
      v20[3] = &unk_1E5C22D20;
      v21 = v10;
      -[objc_class presentForAccount:skipsAlerts:window:completion:](v19, "presentForAccount:skipsAlerts:window:completion:", v8, 0, v9, v20);
      v17 = v21;
    }

    goto LABEL_11;
  }
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:].cold.4();
LABEL_9:

  if (v10)
    (*((void (**)(id, uint64_t))v10 + 2))(v10, objc_msgSend(v8, "resolvedLockedNotesMode"));
LABEL_11:

}

uint64_t __106__ICLockedNotesModeMigrator_presentLockedNotesMigrationPromptIfNeededForAccount_window_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __106__ICLockedNotesModeMigrator_presentLockedNotesMigrationPromptIfNeededForAccount_window_completionHandler___block_invoke_49(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)showMigrationPromptAndMigrateIfNeededForAccount:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__ICLockedNotesModeMigrator_showMigrationPromptAndMigrateIfNeededForAccount_window___block_invoke;
  v10[3] = &unk_1E5C22D70;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[ICLockedNotesModeMigrator presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:](self, "presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:", v8, v9, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __84__ICLockedNotesModeMigrator_showMigrationPromptAndMigrateIfNeededForAccount_window___block_invoke(id *a1, int a2)
{
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  __int16 v14;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (a2 == 2 && WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(a1[4], "accountData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "lockedNotesMode");

    if (!v6)
    {
      +[ICAuthenticationPrompt promptForChangingMode:account:](ICAuthenticationPrompt, "promptForChangingMode:account:", 2, a1[4]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICAuthentication shared](ICAuthentication, "shared");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __84__ICLockedNotesModeMigrator_showMigrationPromptAndMigrateIfNeededForAccount_window___block_invoke_2;
      v11[3] = &unk_1E5C22D48;
      v9 = a1[5];
      v12 = a1[4];
      v14 = 2;
      v13 = a1[5];
      objc_msgSend(v8, "authenticateWithPrompt:displayWindow:completionHandler:", v7, v9, v11);

    }
  }
  else
  {

  }
}

void __84__ICLockedNotesModeMigrator_showMigrationPromptAndMigrateIfNeededForAccount_window___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  if (a2 == 2)
  {
    v12 = v2;
    v13 = v3;
    +[ICLockedNotesModeMigrator sharedMigrator](ICLockedNotesModeMigrator, "sharedMigrator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(__int16 *)(a1 + 48);
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__ICLockedNotesModeMigrator_showMigrationPromptAndMigrateIfNeededForAccount_window___block_invoke_3;
    v9[3] = &unk_1E5C1DBB0;
    v10 = v7;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v5, "migrateLockedNotesInAccount:toMode:window:completionHandler:", v10, v6, v8, v9);

  }
}

void __84__ICLockedNotesModeMigrator_showMigrationPromptAndMigrateIfNeededForAccount_window___block_invoke_3(uint64_t a1)
{
  id v2;

  +[ICAuthenticationAlert switchedModeInfoAlertWithAccount:](ICAuthenticationAlert, "switchedModeInfoAlertWithAccount:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentInWindow:completionHandler:", *(_QWORD *)(a1 + 40), 0);

}

- (void)presentLockedNotesLearnMoreViewForAccount:(id)a3 window:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a4;
  v6 = a3;
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ICLockedNotesModeMigrator presentLockedNotesLearnMoreViewForAccount:window:].cold.1();

  -[objc_class presentForAccount:window:](NSClassFromString(CFSTR("ICLockedNotesLearnMoreViewController")), "presentForAccount:window:", v6, v5);
}

- (void)authenticationStateDidAuthenticate:(id)a3
{
  void *v4;
  id v5;

  -[ICLockedNotesModeMigrator authenticatedAt](self, "authenticatedAt", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[ICLockedNotesModeMigrator setAuthenticatedAt:](self, "setAuthenticatedAt:", v5);

  }
}

- (void)authenticationStateDidDeauthenticate:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAuthenticated");

  if ((v5 & 1) == 0)
    -[ICLockedNotesModeMigrator setAuthenticatedAt:](self, "setAuthenticatedAt:", 0);
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDate)authenticatedAt
{
  return self->_authenticatedAt;
}

- (void)setAuthenticatedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatedAt, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
}

- (void)migrateLockedNotesInAccount:(void *)a1 toMode:window:completionHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1AC7A1000, v2, v3, "Cannot migrate locked notes to unknown mode {account: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)migrateLockedNotesInAccount:(void *)a1 toMode:window:completionHandler:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAccountDataLockedNotesMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_1AC7A1000, v3, v4, "Migrating locked notes… {account: %@, mode: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_12();
}

- (void)migrateNote:(void *)a1 completionHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3(&dword_1AC7A1000, v2, v3, "Migrating locked note if needed… {note: %@}%s:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6_2();
}

- (void)migrateNoteToV1NeoIfNeeded:(void *)a1 completionHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Not migrating note to v1 Neo because it has an unauthenticated attachment {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)migrateNoteToV1NeoIfNeeded:(void *)a1 completionHandler:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Not migrating note to v1 Neo because it wasn't modified during the current authentication session {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)migrateNoteToV1NeoIfNeeded:(void *)a1 completionHandler:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Not migrating note to v1 Neo because its password is different from the account {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)migrateNoteToV1NeoIfNeeded:(void *)a1 completionHandler:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Not migrating note to v1 Neo because it's not a v1 note {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)migrateNoteToV1NeoIfNeeded:(void *)a1 completionHandler:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3(&dword_1AC7A1000, v2, v3, "Migrating locked note to v1 Neo if needed… {note: %@}%s:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6_2();
}

void __59__ICLockedNotesModeMigrator_unsafelyMigrateNotes_progress___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "Background task for locked notes migration expired", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)unsafelyMigrateNote:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1AC7A1000, v2, v3, "Failed to migrate note — skipping {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)unsafelyMigrateNote:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3(&dword_1AC7A1000, v2, v3, "Migrating note… {note: %@}%s:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6_2();
}

- (void)presentBackwardsCompatibilityAlertIfNeededForAccount:mode:window:confirmHandler:cancelHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "Not showing backwards compatibility alert for unknown password mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentBackwardsCompatibilityAlertIfNeededForAccount:mode:window:confirmHandler:cancelHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Not showing backwards compatibility for custom password mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentBackwardsCompatibilityAlertIfNeededForAccount:(void *)a1 mode:window:confirmHandler:cancelHandler:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAccountDataLockedNotesMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_1AC7A1000, v3, v4, "Presenting locked notes account backwards compatibility alert if needed… {account: %@, mode: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_12();
}

void __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Not showing backwards compatibility alert for device password mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __123__ICLockedNotesModeMigrator_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Showing backwards compatibility alert for device password mode…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentDivergedModeAlertForNote:mode:window:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "Not showing diverged mode alert for unknown password mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentDivergedModeAlertForNote:mode:window:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Showing diverged mode alert for custom password mode…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentDivergedModeAlertForNote:(void *)a1 mode:window:completionHandler:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAccountDataLockedNotesMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_1AC7A1000, v3, v4, "Presenting locked notes note diverged mode alert… {note: %@, mode: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_12();
}

void __91__ICLockedNotesModeMigrator_presentDivergedModeAlertForNote_mode_window_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Showing diverged mode alert for device password mode…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:window:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Not presenting locked notes welcome migration prompt because account is unsupported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:(void *)a1 window:completionHandler:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3(&dword_1AC7A1000, v2, v3, "Presenting locked notes welcome migration prompt… {account: %@}%s:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6_2();
}

- (void)presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:window:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Not presenting locked notes switch migration prompt because account is unsupported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:(void *)a1 window:completionHandler:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3(&dword_1AC7A1000, v2, v3, "Presenting locked notes switch migration prompt… {account: %@}%s:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6_2();
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Presenting locked notes switch migration prompt…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Not presenting locked notes migration prompt because it has been presented the maximum number of times", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Presenting locked notes welcome migration prompt…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Not presenting locked notes migration prompt because account has a locked notes mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Not presenting locked notes migration prompt because account is unsupported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)presentLockedNotesMigrationPromptIfNeededForAccount:(void *)a1 window:completionHandler:.cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3(&dword_1AC7A1000, v2, v3, "Presenting locked notes migration prompt if needed… {account: %@}%s:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6_2();
}

- (void)presentLockedNotesLearnMoreViewForAccount:window:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Presenting locked notes learn more view…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
