@implementation ICNoteLockManager

- (ICNoteLockManager)initWithNote:(id)a3
{
  id v5;
  ICNoteLockManager *v6;
  uint64_t v7;
  ICAccount *account;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteLockManager;
  v6 = -[ICNoteLockManager init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "account");
    v7 = objc_claimAutoreleasedReturnValue();
    account = v6->_account;
    v6->_account = (ICAccount *)v7;

    objc_storeStrong((id *)&v6->_note, a3);
    -[ICNoteLockManager account](v6, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.account) != nil)", "-[ICNoteLockManager initWithNote:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.account");
  }

  return v6;
}

- (void)toggleLockWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICNoteLockManager toggleLockWithCompletionHandler:].cold.1(self, v5);

  -[ICNoteLockManager note](self, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPasswordProtected");

  if (v7)
    -[ICNoteLockManager removeLockWithCompletionHandler:](self, "removeLockWithCompletionHandler:", v4);
  else
    -[ICNoteLockManager addLockWithCompletionHandler:](self, "addLockWithCompletionHandler:", v4);

}

- (void)addLockWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  void (**v27)(id, _QWORD);
  id v28;
  id location;
  _QWORD v30[4];
  void (**v31)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICNoteLockManager addLockWithCompletionHandler:].cold.3(self, v5);

  -[ICNoteLockManager window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.window) != nil)", "-[ICNoteLockManager addLockWithCompletionHandler:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.window");
  -[ICNoteLockManager note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPasswordProtected");

  if (v8)
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ICNoteLockManager addLockWithCompletionHandler:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    -[ICNoteLockManager note](self, "note");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "preventLockReason");

    if (v18)
    {
      v19 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[ICNoteLockManager addLockWithCompletionHandler:].cold.2(self);

      -[ICNoteLockManager note](self, "note");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICAuthenticationAlert cannotLockInfoAlertWithReason:](ICAuthenticationAlert, "cannotLockInfoAlertWithReason:", objc_msgSend(v20, "preventLockReason"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICNoteLockManager window](self, "window");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke;
      v30[3] = &unk_1E5C1DB38;
      v31 = v4;
      objc_msgSend(v21, "presentInWindow:completionHandler:", v22, v30);

    }
    else
    {
      objc_initWeak(&location, self);
      +[ICLockedNotesModeMigrator sharedMigrator](ICLockedNotesModeMigrator, "sharedMigrator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteLockManager account](self, "account");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteLockManager window](self, "window");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_2;
      v26[3] = &unk_1E5C23A00;
      objc_copyWeak(&v28, &location);
      v27 = v4;
      objc_msgSend(v23, "presentLockedNotesMigrationPromptIfNeededForAccount:window:completionHandler:", v24, v25, v26);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
  }

}

uint64_t __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  __int16 v22;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if ((_DWORD)a2 && WeakRetained)
  {
    v6 = objc_loadWeakRetained(v4);
    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "resolvedLockedNotesMode");
    v9 = objc_loadWeakRetained(v4);
    v10 = v9;
    if (v8 == (_DWORD)a2)
    {
      objc_msgSend(v9, "note");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICAuthenticationPrompt promptForIntent:object:](ICAuthenticationPrompt, "promptForIntent:object:", 2, v11);
    }
    else
    {
      objc_msgSend(v9, "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICAuthenticationPrompt promptForChangingMode:account:](ICAuthenticationPrompt, "promptForChangingMode:account:", a2, v11);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[ICAuthentication shared](ICAuthentication, "shared");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained(v4);
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_3;
    v18[3] = &unk_1E5C239D8;
    objc_copyWeak(&v21, v4);
    v17 = v13;
    v19 = v17;
    v22 = a2;
    v20 = *(id *)(a1 + 32);
    objc_msgSend(v14, "authenticateWithPrompt:displayWindow:completionHandler:", v17, v16, v18);

    objc_destroyWeak(&v21);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
  }
}

void __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (a2 == 2 && WeakRetained)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "intent");

    if (v7 == 7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0D63B50]);
      v9 = objc_loadWeakRetained(v4);
      objc_msgSend(v9, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accountData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLockedNotesMode:", objc_msgSend(v11, "lockedNotesMode"));

      v12 = (void *)MEMORY[0x1E0D63BB8];
      v13 = objc_loadWeakRetained(v4);
      objc_msgSend(v13, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "countOfVisiblePasswordProtectedNotesInAccount:", v14))
        v15 = 4;
      else
        v15 = 3;
      objc_msgSend(v8, "setContextPath:", v15);

      v16 = (void *)MEMORY[0x1E0D63B48];
      v17 = objc_loadWeakRetained(v4);
      objc_msgSend(v17, "account");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addRecentPasswordMode:forAccount:", v8, v18);

      +[ICLockedNotesModeMigrator sharedMigrator](ICLockedNotesModeMigrator, "sharedMigrator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_loadWeakRetained(v4);
      objc_msgSend(v20, "account");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(__int16 *)(a1 + 56);
      v23 = objc_loadWeakRetained(v4);
      objc_msgSend(v23, "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_4;
      v28[3] = &unk_1E5C239B0;
      objc_copyWeak(&v30, v4);
      v29 = *(id *)(a1 + 40);
      objc_msgSend(v19, "migrateLockedNotesInAccount:toMode:window:completionHandler:", v21, v22, v24, v28);

      objc_destroyWeak(&v30);
      return;
    }
  }
  else
  {

  }
  v25 = objc_loadWeakRetained(v4);

  if (a2 == 2 && v25)
  {
    v27 = objc_loadWeakRetained(v4);
    objc_msgSend(v27, "unsafelyToggleLockWithCompletionHandler:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v26 = *(_QWORD *)(a1 + 40);
    if (v26)
      (*(void (**)(uint64_t, uint64_t))(v26 + 16))(v26, a2);
  }
}

void __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isCancelled") & 1) != 0 || !objc_msgSend(v3, "completedUnitCount"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "unsafelyToggleLockWithCompletionHandler:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAuthenticationAlert switchedModeInfoAlertWithAccount:](ICAuthenticationAlert, "switchedModeInfoAlertWithAccount:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_5;
    v11[3] = &unk_1E5C22AA0;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    v12 = *(id *)(a1 + 32);
    +[ICAuthenticationAlert presentAlertsIfNeeded:window:completionHandler:](ICAuthenticationAlert, "presentAlertsIfNeeded:window:completionHandler:", v7, v9, v11);

    objc_destroyWeak(&v13);
  }

}

void __50__ICNoteLockManager_addLockWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "unsafelyToggleLockWithCompletionHandler:", *(_QWORD *)(a1 + 32));

}

- (void)removeLockWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICNoteLockManager removeLockWithCompletionHandler:].cold.2(self, v5);

  -[ICNoteLockManager window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.window) != nil)", "-[ICNoteLockManager removeLockWithCompletionHandler:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.window");
  -[ICNoteLockManager note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPasswordProtected");

  if ((v8 & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[ICNoteLockManager note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAuthenticationPrompt promptForIntent:object:](ICAuthenticationPrompt, "promptForIntent:object:", 3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[ICAuthentication shared](ICAuthentication, "shared");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteLockManager window](self, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __53__ICNoteLockManager_removeLockWithCompletionHandler___block_invoke;
    v21[3] = &unk_1E5C23A28;
    objc_copyWeak(&v23, &location);
    v22 = v4;
    objc_msgSend(v11, "authenticateWithPrompt:displayWindow:completionHandler:", v10, v12, v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ICNoteLockManager removeLockWithCompletionHandler:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __53__ICNoteLockManager_removeLockWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;

  if (a2 == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "unsafelyToggleLockWithCompletionHandler:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }
}

- (void)unsafelyToggleLockWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  ICLongRunningTaskController *v12;
  void *v13;
  ICLongRunningTaskController *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ICNoteLockManagerWillToggleLock"), self);

  -[ICNoteLockManager note](self, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistPendingChangesRecursively");

  -[ICNoteLockManager note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_saveWithLogDescription:", CFSTR("Saving before toggling lock"));

  -[ICNoteLockManager note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isPasswordProtected") & 1) != 0)
    v10 = CFSTR("Removing Lock…");
  else
    v10 = CFSTR("Adding Lock…");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v10, v10, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__71;
  v23[4] = __Block_byref_object_dispose__71;
  v24 = 0;
  v12 = [ICLongRunningTaskController alloc];
  -[ICNoteLockManager window](self, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ICLongRunningTaskController initWithWindow:intervalBeforeOpeningProgressDialog:](v12, "initWithWindow:intervalBeforeOpeningProgressDialog:", v13, 1.0);

  -[ICLongRunningTaskController setIndeterminate:](v14, "setIndeterminate:", 1);
  -[ICLongRunningTaskController setProgressString:](v14, "setProgressString:", v11);
  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E5C23A78;
  objc_copyWeak(&v22, &location);
  v21[4] = v23;
  v17[0] = v15;
  v17[1] = 3221225472;
  v17[2] = __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke_3;
  v17[3] = &unk_1E5C23AA0;
  objc_copyWeak(&v20, &location);
  v19 = v23;
  v16 = v4;
  v18 = v16;
  -[ICLongRunningTaskController startTask:completionBlock:](v14, "startTask:completionBlock:", v21, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  _Block_object_dispose(v23, 8);
  objc_destroyWeak(&location);

}

void __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workerManagedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5C23A50;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v6, "performBlockAndWait:", v8);

  objc_destroyWeak(&v11);
}

void __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_opt_class();
    v2 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "note");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectWithID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D63BB8], "duplicateNote:isPasswordProtected:removeOriginalNote:", v6, objc_msgSend(v6, "isPasswordProtected") ^ 1, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectID");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_opt_class();
      objc_msgSend(WeakRetained, "note");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "managedObjectContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectWithID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setUpdatedNote:", v6);

    }
    else
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke_3_cold_1(WeakRetained, v7);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("ICNoteLockManagerDidToggleLock"), WeakRetained);

    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      objc_msgSend(WeakRetained, "updatedNote");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v11 = 2;
      else
        v11 = 1;
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v11);

    }
  }

}

- (void)updateDivergedAttachmentsWithPassphrase:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICNoteLockManager updateDivergedAttachmentsWithPassphrase:completion:].cold.2(self, v8);

  -[ICNoteLockManager window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.window) != nil)", "-[ICNoteLockManager updateDivergedAttachmentsWithPassphrase:completion:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.window");
  -[ICNoteLockManager note](self, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAuthenticated");

  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D635C0];
    -[ICNoteLockManager account](self, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", v13, v14);

    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "crossProcessChangeCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postCrossProcessNotificationName:", v13);

    v17 = objc_alloc_init(MEMORY[0x1E0D63AB0]);
    objc_msgSend(v17, "setDivergedPassphrase:", v6);
    objc_msgSend(v17, "setUserInitiated:", 1);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__ICNoteLockManager_updateDivergedAttachmentsWithPassphrase_completion___block_invoke;
    v19[3] = &unk_1E5C21CC8;
    v19[4] = self;
    v20 = v7;
    -[ICNoteLockManager updateDivergedAttachmentsWithConfiguration:completion:](self, "updateDivergedAttachmentsWithConfiguration:completion:", v17, v19);

  }
  else
  {
    v18 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[ICNoteLockManager updateDivergedAttachmentsWithPassphrase:completion:].cold.1(self);

    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __72__ICNoteLockManager_updateDivergedAttachmentsWithPassphrase_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D635A0];
  objc_msgSend(*(id *)(a1 + 32), "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", v5, v6);

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "crossProcessChangeCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postCrossProcessNotificationName:", v5);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)updateDivergedAttachmentsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  ICLongRunningTaskController *v12;
  void *v13;
  ICLongRunningTaskController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;

  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC4730];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", v10, &__block_literal_global_82);

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v12 = [ICLongRunningTaskController alloc];
  -[ICNoteLockManager window](self, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ICLongRunningTaskController initWithWindow:intervalBeforeOpeningProgressDialog:](v12, "initWithWindow:intervalBeforeOpeningProgressDialog:", v13, 1.0);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Changing Password…"), CFSTR("Changing Password…"), 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLongRunningTaskController setProgressString:](v14, "setProgressString:", v15);

  -[ICLongRunningTaskController setIndeterminate:](v14, "setIndeterminate:", 1);
  -[ICLongRunningTaskController setShouldShowCircularProgress:](v14, "setShouldShowCircularProgress:", 1);
  -[ICNoteLockManager window](self, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rootViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_topViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLongRunningTaskController setViewControllerToPresentFrom:](v14, "setViewControllerToPresentFrom:", v18);

  v19 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke_45;
  v26[3] = &unk_1E5C23228;
  v28 = v29;
  v26[4] = self;
  v20 = v6;
  v27 = v20;
  v22[0] = v19;
  v22[1] = 3221225472;
  v22[2] = __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke_2;
  v22[3] = &unk_1E5C23250;
  v25 = v11;
  v21 = v7;
  v23 = v21;
  v24 = v29;
  -[ICLongRunningTaskController startTask:completionBlock:](v14, "startTask:completionBlock:", v26, v22);

  _Block_object_dispose(v29, 8);
}

void __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke()
{
  NSObject *v0;

  v0 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke_cold_1(v0);

}

void __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke_45(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D63AA8], "sharedController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "convergeAttachmentsInNoteWithID:configuration:", v3, *(_QWORD *)(a1 + 40));

}

uint64_t __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", a1[6]);
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24));
  return result;
}

- (ICAccount)account
{
  return self->_account;
}

- (ICNote)note
{
  return self->_note;
}

- (ICNote)updatedNote
{
  return self->_updatedNote;
}

- (void)setUpdatedNote:(id)a3
{
  objc_storeStrong((id *)&self->_updatedNote, a3);
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_updatedNote, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)toggleLockWithCompletionHandler:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0();
  v7 = 59;
  OUTLINED_FUNCTION_2_5(&dword_1AC7A1000, a2, v5, "Toggling lock for note… {note: %@}%s:%d", v6);

  OUTLINED_FUNCTION_12();
}

- (void)addLockWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Cannot add lock because note already has a lock — canceling", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)addLockWithCompletionHandler:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "note");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromNotePreventLockReason(objc_msgSend(v1, "preventLockReason"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v3, v4, "Cannot add lock — failing {reason: %@}", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)addLockWithCompletionHandler:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0();
  v7 = 71;
  OUTLINED_FUNCTION_2_5(&dword_1AC7A1000, a2, v5, "Adding lock to note… {note: %@}%s:%d", v6);

  OUTLINED_FUNCTION_12();
}

- (void)removeLockWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Cannot remove lock because note doesn't have one — canceling", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)removeLockWithCompletionHandler:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0();
  v7 = 139;
  OUTLINED_FUNCTION_2_5(&dword_1AC7A1000, a2, v5, "Removing lock from note… {note: %@}%s:%d", v6);

  OUTLINED_FUNCTION_12();
}

void __61__ICNoteLockManager_unsafelyToggleLockWithCompletionHandler___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Cannot change lock for note {note: %@}", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_4();
}

- (void)updateDivergedAttachmentsWithPassphrase:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "note");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v3, v4, "Not updating passphrase for diverged attachments because note is not authenticated {note: %@}", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)updateDivergedAttachmentsWithPassphrase:(void *)a1 completion:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0();
  v7 = 217;
  OUTLINED_FUNCTION_2_5(&dword_1AC7A1000, a2, v5, "Updating passphrase for diverged attachments in note… {note: %@}%s:%d", v6);

  OUTLINED_FUNCTION_12();
}

void __75__ICNoteLockManager_updateDivergedAttachmentsWithConfiguration_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Background task for attachments convergence expired", v1, 2u);
  OUTLINED_FUNCTION_6();
}

@end
