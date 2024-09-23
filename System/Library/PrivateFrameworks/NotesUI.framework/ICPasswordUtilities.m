@implementation ICPasswordUtilities

+ (ICPasswordUtilities)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_93);
  return (ICPasswordUtilities *)(id)sharedInstance_instance_0;
}

void __37__ICPasswordUtilities_sharedInstance__block_invoke()
{
  ICPasswordUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(ICPasswordUtilities);
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v0;

}

+ (id)imageForCurrentDecryptedStatusForNote:(id)a3
{
  const __CFString *v3;

  if (objc_msgSend(a3, "isAuthenticated"))
    v3 = CFSTR("lock.open.fill");
  else
    v3 = CFSTR("lock.fill");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)deviceHasPasscode
{
  id v2;
  char v3;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  v5 = 0;
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 2, &v5);

  return v3;
}

- (void)showChangePasswordDialogueFromDisplayWindow:(id)a3 account:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ICPasswordChangeViewController *v12;
  void *v13;
  ICPasswordChangeViewController *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  ICPasswordUtilities *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "hasPassphraseSet") & 1) != 0)
  {
    -[ICPasswordUtilities displayedSheet](self, "displayedSheet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = [ICPasswordChangeViewController alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[ICPasswordChangeViewController initWithNibName:bundle:](v12, "initWithNibName:bundle:", 0, v13);

      v15 = (id)-[ICPasswordChangeViewController view](v14, "view");
      -[ICPasswordChangeViewController setUpForChangePasswordWithAccount:didAuthenticateWithBiometrics:](v14, "setUpForChangePasswordWithAccount:didAuthenticateWithBiometrics:", v9, 0);
      -[UIViewController ic_embedInNavigationControllerForModalPresentation](v14, "ic_embedInNavigationControllerForModalPresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rootViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ic_topViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __93__ICPasswordUtilities_showChangePasswordDialogueFromDisplayWindow_account_completionHandler___block_invoke;
      v19[3] = &unk_1E5C1FE08;
      v22 = v10;
      v20 = v9;
      v21 = self;
      objc_msgSend(v18, "presentViewController:animated:completion:", v16, 1, v19);

    }
  }
  else
  {
    -[ICPasswordUtilities showPasswordSetUpSheetForAccount:displayWindow:completionHandler:](self, "showPasswordSetUpSheetForAccount:displayWindow:completionHandler:", v9, v8, v10);
  }

}

uint64_t __93__ICPasswordUtilities_showChangePasswordDialogueFromDisplayWindow_account_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isAuthenticated"))
      v3 = 2;
    else
      v3 = 1;
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  return objc_msgSend(*(id *)(a1 + 40), "setDisplayedSheet:", 0);
}

- (void)showPasswordSetUpSheetForAccount:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  ICPasswordChangeViewController *v13;
  id v14;
  ICPasswordChangeViewController *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  ICPasswordUtilities *v24;
  id v25;
  uint8_t buf[4];
  ICPasswordChangeViewController *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICPasswordUtilities displayedSheet](self, "displayedSheet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICPasswordUtilities showPasswordSetUpSheetForAccount:displayWindow:completionHandler:].cold.1(v8);

    v13 = [ICPasswordChangeViewController alloc];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __88__ICPasswordUtilities_showPasswordSetUpSheetForAccount_displayWindow_completionHandler___block_invoke;
    v22[3] = &unk_1E5C24280;
    v14 = v8;
    v23 = v14;
    v24 = self;
    v25 = v10;
    v15 = -[ICPasswordChangeViewController initWithCompletionHandler:](v13, "initWithCompletionHandler:", v22);
    v16 = (id)-[ICPasswordChangeViewController view](v15, "view");
    -[ICPasswordChangeViewController setUpForAddingPasswordWithAccount:](v15, "setUpForAddingPasswordWithAccount:", v14);
    -[UIViewController ic_embedInNavigationControllerForModalPresentation](v15, "ic_embedInNavigationControllerForModalPresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setModalPresentationCapturesStatusBarAppearance:", 1);
    v18 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v14, "shortLoggingDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v15;
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v17;
      _os_log_debug_impl(&dword_1AC7A1000, v18, OS_LOG_TYPE_DEBUG, "Presenting passwordSetupViewController %@ for account %@ through navigation controller %@", buf, 0x20u);

    }
    objc_msgSend(v9, "rootViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ic_topViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "presentViewController:animated:completion:", v17, 1, 0);

  }
}

void __88__ICPasswordUtilities_showPasswordSetUpSheetForAccount_displayWindow_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;

  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __88__ICPasswordUtilities_showPasswordSetUpSheetForAccount_displayWindow_completionHandler___block_invoke_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 40), "setDisplayedSheet:", 0);
  v3 = *(id *)(a1 + 48);
  dispatchMainAfterDelay();

}

uint64_t __88__ICPasswordUtilities_showPasswordSetUpSheetForAccount_displayWindow_completionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)showUpdateDivergedPasswordForAccountPassword:(id)a3 oldPassword:(id)a4 account:(id)a5 displayWindow:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!-[ICPasswordUtilities isShowingDivergedDialogue](self, "isShowingDivergedDialogue"))
  {
    objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "authenticateObject:withPassphrase:", v12, v10);

    if (v15)
    {
      objc_initWeak(&location, self);
      +[ICAuthenticationAlert updateDivergedCustomPasswordNotesActionAlert](ICAuthenticationAlert, "updateDivergedCustomPasswordNotesActionAlert");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __102__ICPasswordUtilities_showUpdateDivergedPasswordForAccountPassword_oldPassword_account_displayWindow___block_invoke;
      v23[3] = &unk_1E5C242A8;
      v24 = v12;
      v25 = v11;
      v26 = v10;
      objc_copyWeak(&v27, &location);
      objc_msgSend(v16, "setActionHandler:", v23);
      v18 = v17;
      v19 = 3221225472;
      v20 = __102__ICPasswordUtilities_showUpdateDivergedPasswordForAccountPassword_oldPassword_account_displayWindow___block_invoke_3;
      v21 = &unk_1E5C242D0;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v16, "setDismissHandler:", &v18);
      objc_msgSend(v16, "presentInWindow:completionHandler:", v13, 0, v18, v19, v20, v21);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&v27);

      objc_destroyWeak(&location);
    }
  }

}

void __102__ICPasswordUtilities_showUpdateDivergedPasswordForAccountPassword_oldPassword_account_displayWindow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ICAccountPassphraseManager *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = -[ICAccountPassphraseManager initWithAccount:]([ICAccountPassphraseManager alloc], "initWithAccount:", *(_QWORD *)(a1 + 32));
  -[ICAccountPassphraseManager setWindow:](v4, "setWindow:", v3);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__ICPasswordUtilities_showUpdateDivergedPasswordForAccountPassword_oldPassword_account_displayWindow___block_invoke_2;
  v7[3] = &unk_1E5C23B48;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  -[ICAccountPassphraseManager updateDivergedNotesFromPassphrase:toAccountPassphrase:completion:](v4, "updateDivergedNotesFromPassphrase:toAccountPassphrase:completion:", v5, v6, v7);
  objc_destroyWeak(&v8);

}

void __102__ICPasswordUtilities_showUpdateDivergedPasswordForAccountPassword_oldPassword_account_displayWindow___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsShowingDivergedDialogue:", 0);

}

void __102__ICPasswordUtilities_showUpdateDivergedPasswordForAccountPassword_oldPassword_account_displayWindow___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsShowingDivergedDialogue:", 0);

}

- (void)accessibilityAnnounceAuthSuccessForIntent:(unint64_t)a3 withNote:(id)a4
{
  id v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes Unlocked"), CFSTR("Notes Unlocked"), 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v6, "length"))
  {
    v7 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__ICPasswordUtilities_accessibilityAnnounceAuthSuccessForIntent_withNote___block_invoke;
    block[3] = &unk_1E5C1D540;
    v9 = v6;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);

  }
}

void __74__ICPasswordUtilities_accessibilityAnnounceAuthSuccessForIntent_withNote___block_invoke(uint64_t a1)
{
  ICAccessibilityPostAnnouncementNotification(0, *(void **)(a1 + 32));
}

- (id)displayedSheet
{
  return self->_displayedSheet;
}

- (void)setDisplayedSheet:(id)a3
{
  objc_storeStrong(&self->_displayedSheet, a3);
}

- (BOOL)isShowingDivergedDialogue
{
  return self->_isShowingDivergedDialogue;
}

- (void)setIsShowingDivergedDialogue:(BOOL)a3
{
  self->_isShowingDivergedDialogue = a3;
}

- (NSString)divergedAccountPassword
{
  return self->_divergedAccountPassword;
}

- (void)setDivergedAccountPassword:(id)a3
{
  objc_storeStrong((id *)&self->_divergedAccountPassword, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divergedAccountPassword, 0);
  objc_storeStrong(&self->_displayedSheet, 0);
}

- (void)showPasswordSetUpSheetForAccount:(void *)a1 displayWindow:completionHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Sheet hasn't displayed, displaying it for account %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_3();
}

void __88__ICPasswordUtilities_showPasswordSetUpSheetForAccount_displayWindow_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Completion handler for passwordSetupViewController is triggered for account %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_3();
}

@end
