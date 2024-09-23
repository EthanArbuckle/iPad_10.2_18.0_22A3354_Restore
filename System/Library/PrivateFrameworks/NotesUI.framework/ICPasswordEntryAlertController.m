@implementation ICPasswordEntryAlertController

- (ICPasswordEntryAlertController)initWithDisplayWindow:(id)a3
{
  id v5;
  ICPasswordEntryAlertController *v6;
  ICPasswordEntryAlertController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPasswordEntryAlertController;
  v6 = -[ICPasswordEntryAlertController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_displayWindow, a3);

  return v7;
}

- (void)authenticateWithPrompt:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD);
  _QWORD v18[4];
  id v19;
  ICPasswordEntryAlertController *v20;
  void (**v21)(id, _QWORD);
  _QWORD v22[5];
  id v23;
  void (**v24)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[ICPasswordEntryAlertController isAuthenticating](self, "isAuthenticating"))
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICPasswordEntryAlertController authenticateWithPrompt:completionHandler:]", 1, 0, CFSTR("This is a one-shot object — you can only call the authentication method once"));
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    -[ICPasswordEntryAlertController setAuthenticating:](self, "setAuthenticating:", 1);
    v8 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke;
    v22[3] = &unk_1E5C1E790;
    v22[4] = self;
    v23 = v6;
    v24 = v7;
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_2;
    v18[3] = &unk_1E5C1E7E0;
    v19 = v23;
    v20 = self;
    v21 = v24;
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_5;
    v16[3] = &unk_1E5C1DB38;
    v17 = v21;
    -[ICPasswordEntryAlertController passwordAlertControllerWithPrompt:passwordHandler:forgotHandler:cancelHandler:](self, "passwordAlertControllerWithPrompt:passwordHandler:forgotHandler:cancelHandler:", v19, v22, v18, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPasswordEntryAlertController displayWindow](self, "displayWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[ICPasswordEntryAlertController displayWindow](self, "displayWindow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rootViewController");
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v14, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

uint64_t __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didAuthenticateWithPassword:prompt:completionHandler:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_2(id *a1)
{
  void (**v2)(id, uint64_t);
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  if (objc_msgSend(a1[4], "intent") == 4)
  {
    v2 = (void (**)(id, uint64_t))a1[6];
    if (v2)
      v2[2](v2, 1);
  }
  else if (objc_msgSend(a1[4], "intent") == 7)
  {
    +[ICAuthenticationAlert forgotCustomPasswordSwitchAnywayConfirmationAlert](ICAuthenticationAlert, "forgotCustomPasswordSwitchAnywayConfirmationAlert");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_3;
    v11[3] = &unk_1E5C1E7B8;
    v12 = a1[6];
    objc_msgSend(v3, "setActionHandler:", v11);
    v6 = v4;
    v7 = 3221225472;
    v8 = __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_4;
    v9 = &unk_1E5C1E7B8;
    v10 = a1[6];
    objc_msgSend(v3, "setDismissHandler:", &v6);
    objc_msgSend(a1[5], "displayWindow", v6, v7, v8, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentInWindow:completionHandler:", v5, 0);

  }
}

uint64_t __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

uint64_t __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __75__ICPasswordEntryAlertController_authenticateWithPrompt_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)didAuthenticateWithPassword:(id)a3 prompt:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ICLongRunningTaskController *v23;
  void *v24;
  ICLongRunningTaskController *v25;
  uint64_t v26;
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
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  int v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isPassphraseCorrect:", v8);

  objc_msgSend(v9, "authenticationObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isPassphraseCorrect:", v8);

  v15 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICPasswordEntryAlertController numberOfFailedAttempts](self, "numberOfFailedAttempts"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICPasswordEntryAlertController isPasswordDiverged](self, "isPasswordDiverged"));
    *(_DWORD *)buf = 138413570;
    v71 = v56;
    v72 = 2112;
    v73 = v54;
    v74 = 2112;
    v75 = v52;
    v76 = 2112;
    v78 = 2080;
    v77 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)v77;
    v79 = "-[ICPasswordEntryAlertController didAuthenticateWithPassword:prompt:completionHandler:]";
    v80 = 1024;
    v81 = 88;
    _os_log_debug_impl(&dword_1AC7A1000, v15, OS_LOG_TYPE_DEBUG, "Authenticated with custom password {isCorrectForAccount: %@, isCorrectForObject: %@, #failedAttempts: %@, isPasswordDiverged: %@}%s:%d", buf, 0x3Au);

  }
  if ((_DWORD)v14
    && (objc_msgSend(MEMORY[0x1E0D63A58], "sharedState"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "authenticationObject"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v16, "authenticateObject:withPassphrase:", v17, v8),
        v17,
        v16,
        v18))
  {
    if (-[ICPasswordEntryAlertController isPasswordDiverged](self, "isPasswordDiverged"))
    {
      +[ICPasswordUtilities sharedInstance](ICPasswordUtilities, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICPasswordEntryAlertController divergedAccountPassword](self, "divergedAccountPassword");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "account");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICPasswordEntryAlertController displayWindow](self, "displayWindow");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "showUpdateDivergedPasswordForAccountPassword:oldPassword:account:displayWindow:", v20, v8, v21, v22);

    }
    if (objc_msgSend(v9, "intent") == 7)
    {
      v23 = [ICLongRunningTaskController alloc];
      -[ICPasswordEntryAlertController displayWindow](self, "displayWindow");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[ICLongRunningTaskController initWithWindow:intervalBeforeOpeningProgressDialog:](v23, "initWithWindow:intervalBeforeOpeningProgressDialog:", v24, 1.0);

      -[ICLongRunningTaskController setIndeterminate:](v25, "setIndeterminate:", 1);
      -[ICLongRunningTaskController setShouldShowCircularProgress:](v25, "setShouldShowCircularProgress:", 1);
      v26 = MEMORY[0x1E0C809B0];
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke;
      v67[3] = &unk_1E5C1DBB0;
      v68 = v9;
      v69 = v8;
      v65[0] = v26;
      v65[1] = 3221225472;
      v65[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_3;
      v65[3] = &unk_1E5C1E808;
      v66 = v10;
      -[ICLongRunningTaskController startTask:completionBlock:](v25, "startTask:completionBlock:", v67, v65);

    }
    else if (objc_msgSend(v9, "intent") == 1
           && (objc_msgSend(v9, "note"), v47 = (void *)objc_claimAutoreleasedReturnValue(), v47, v47))
    {
      +[ICAuthenticationAlert updateDivergedCustomPasswordAttachmentsActionAlert](ICAuthenticationAlert, "updateDivergedCustomPasswordAttachmentsActionAlert");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_4;
      v61[3] = &unk_1E5C1E858;
      v62 = v9;
      v63 = v8;
      v50 = v10;
      v64 = v50;
      objc_msgSend(v48, "setActionHandler:", v61);
      v59[0] = v49;
      v59[1] = 3221225472;
      v59[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_6;
      v59[3] = &unk_1E5C1E7B8;
      v60 = v50;
      objc_msgSend(v48, "setDismissHandler:", v59);
      -[ICPasswordEntryAlertController displayWindow](self, "displayWindow");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "presentInWindow:completionHandler:", v51, 0);

    }
    else if (v10)
    {
      (*((void (**)(id, uint64_t))v10 + 2))(v10, 2);
    }
  }
  else
  {
    -[ICPasswordEntryAlertController setNumberOfFailedAttempts:](self, "setNumberOfFailedAttempts:", -[ICPasswordEntryAlertController numberOfFailedAttempts](self, "numberOfFailedAttempts") + 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "postNotificationName:object:", CFSTR("ICPasswordEntryAlertControllerAttemptDidFailNotification"), self);

    if (!objc_msgSend(v9, "intent"))
    {
      if ((_DWORD)v12)
        -[ICPasswordEntryAlertController setDivergedAccountPassword:](self, "setDivergedAccountPassword:", v8);
      -[ICPasswordEntryAlertController setPasswordDiverged:](self, "setPasswordDiverged:", v12 | -[ICPasswordEntryAlertController isPasswordDiverged](self, "isPasswordDiverged"));
      v28 = (void *)MEMORY[0x1E0D639C8];
      objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "managedObjectContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "allActiveAccountsInContext:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v31, "count") < 2)
        LOBYTE(v12) = 1;

      if ((v12 & 1) == 0)
      {
        objc_msgSend(v9, "account");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "accountName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "ic_trimmedString");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = (void *)MEMORY[0x1E0D639C8];
        objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "managedObjectContext");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "allActiveAccountsInContext:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_7;
        v57[3] = &unk_1E5C1E880;
        v58 = v8;
        objc_msgSend(v37, "ic_objectPassingTest:", v57);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "accountName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "ic_trimmedString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "account");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "cryptoStrategy");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "object");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "hasSameKeyAsObject:", v43);

        if (!v38 || !v44 || !objc_msgSend(v55, "length") || (v45 = objc_msgSend(v40, "length"), v46 = v40, !v45))
          v46 = 0;
        -[ICPasswordEntryAlertController setWrongAccountName:](self, "setWrongAccountName:", v46);

      }
    }
    -[ICPasswordEntryAlertController setAuthenticating:](self, "setAuthenticating:", 0);
    -[ICPasswordEntryAlertController authenticateWithPrompt:completionHandler:](self, "authenticateWithPrompt:completionHandler:", v9, v10);
  }

}

void __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workerManagedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5C1D7C0;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

void __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_opt_class();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authenticateAllNotesInAccount:withPassphrase:", v7, *(_QWORD *)(a1 + 48));

}

uint64_t __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

void __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  ICNoteLockManager *v4;
  void *v5;
  ICNoteLockManager *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = [ICNoteLockManager alloc];
  objc_msgSend(*(id *)(a1 + 32), "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICNoteLockManager initWithNote:](v4, "initWithNote:", v5);

  -[ICNoteLockManager setWindow:](v6, "setWindow:", v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_5;
  v8[3] = &unk_1E5C1E830;
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  -[ICNoteLockManager updateDivergedAttachmentsWithPassphrase:completion:](v6, "updateDivergedAttachmentsWithPassphrase:completion:", v7, v8);

}

uint64_t __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_5(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2)
      v3 = 2;
    else
      v3 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

uint64_t __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __87__ICPasswordEntryAlertController_didAuthenticateWithPassword_prompt_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPassphraseCorrect:", *(_QWORD *)(a1 + 32));
}

- (id)passwordAlertControllerWithPrompt:(id)a3 passwordHandler:(id)a4 forgotHandler:(id)a5 cancelHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id location[2];

  v10 = a3;
  v48 = a4;
  v49 = a5;
  v11 = a6;
  objc_msgSend(v10, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ic_trimmedString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "title");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "intent") == 7)
    v15 = 1;
  else
    v15 = 2;
  if (!objc_msgSend(v10, "intent"))
  {
    -[ICPasswordEntryAlertController wrongAccountName](self, "wrongAccountName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "length"))
    {
      v42 = objc_msgSend(v50, "length");

      if (v42)
      {
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Wrong Password"), CFSTR("Wrong Password"), 0, 1);
        v43 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You’ve entered your “%@” password. Enter your “%@” password."), CFSTR("You’ve entered your “%@” password. Enter your “%@” password."), 0, 1);
        v44 = v11;
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)MEMORY[0x1E0CB3940];
        -[ICPasswordEntryAlertController wrongAccountName](self, "wrongAccountName");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringWithFormat:", v45, v47, v50);
        v18 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v45;
        v11 = v44;
        v51 = (void *)v43;
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  if (-[ICPasswordEntryAlertController isPasswordDiverged](self, "isPasswordDiverged"))
  {
    v16 = (void *)MEMORY[0x1E0D64218];
    v17 = CFSTR("That’s not the correct password for this note. Try a different password.");
LABEL_9:
    objc_msgSend(v16, "localizedFrameworkStringForKey:value:table:allowSiri:", v17, v17, 0, 1);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_10:

    v14 = (void *)v18;
    goto LABEL_11;
  }
  if (-[ICPasswordEntryAlertController numberOfFailedAttempts](self, "numberOfFailedAttempts"))
  {
    v16 = (void *)MEMORY[0x1E0D64218];
    v17 = CFSTR("That’s not the correct password. Please try again.");
    goto LABEL_9;
  }
LABEL_11:
  if (-[ICPasswordEntryAlertController isPasswordDiverged](self, "isPasswordDiverged")
    || -[ICPasswordEntryAlertController numberOfFailedAttempts](self, "numberOfFailedAttempts") >= v15)
  {
    objc_msgSend(v10, "authenticationObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "passwordHint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Hint: %@"), CFSTR("Hint: %@"), 0, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v21, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("\n\n%@"), v22);
      v23 = v11;
      v24 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v24;
      v11 = v23;
    }

  }
  +[ICAlertController alertControllerWithTitle:message:preferredStyle:](ICAlertController, "alertControllerWithTitle:message:preferredStyle:", v51, v14, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCanAppearAbovePasswordEntryView:", 1);
  objc_msgSend(v25, "setDismissWithoutActionBlock:", v11);
  objc_initWeak(location, v25);
  objc_msgSend(v25, "addTextFieldWithConfigurationHandler:", &__block_literal_global_14);
  v26 = -[ICPasswordEntryAlertController numberOfFailedAttempts](self, "numberOfFailedAttempts");
  v27 = MEMORY[0x1E0C809B0];
  if (v26 >= v15 && objc_msgSend(v10, "intent") == 7)
  {
    v28 = v11;
    v29 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Forgot Password"), CFSTR("Forgot Password"), 0, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v27;
    v58[1] = 3221225472;
    v58[2] = __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke_2;
    v58[3] = &unk_1E5C1E8E8;
    objc_copyWeak(&v60, location);
    v59 = v49;
    objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 0, v58);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "addAction:", v31);
    objc_destroyWeak(&v60);
    v11 = v28;
  }
  v32 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Cancel"), CFSTR("Cancel"), 0, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v27;
  v55[1] = 3221225472;
  v55[2] = __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke_3;
  v55[3] = &unk_1E5C1E8E8;
  objc_copyWeak(&v57, location);
  v34 = v11;
  v56 = v34;
  objc_msgSend(v32, "actionWithTitle:style:handler:", v33, 1, v55);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "addAction:", v35);
  v36 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke_4;
  v52[3] = &unk_1E5C1E8E8;
  objc_copyWeak(&v54, location);
  v38 = v48;
  v53 = v38;
  objc_msgSend(v36, "actionWithTitle:style:handler:", v37, 0, v52);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "addAction:", v39);
  objc_destroyWeak(&v54);

  objc_destroyWeak(&v57);
  objc_destroyWeak(location);

  return v25;
}

void __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D64218];
  v4 = a2;
  objc_msgSend(v2, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Password"), CFSTR("Password"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v3);

  objc_msgSend(v4, "setTextContentType:", *MEMORY[0x1E0DC5468]);
  objc_msgSend(v4, "setSecureTextEntry:", 1);

}

uint64_t __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDidPerformAction:", 1);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDidPerformAction:", 1);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __112__ICPasswordEntryAlertController_passwordAlertControllerWithPrompt_passwordHandler_forgotHandler_cancelHandler___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDidPerformAction:", 1);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "textFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

}

- (UIWindow)displayWindow
{
  return self->_displayWindow;
}

- (BOOL)isAuthenticating
{
  return self->_authenticating;
}

- (void)setAuthenticating:(BOOL)a3
{
  self->_authenticating = a3;
}

- (unint64_t)numberOfFailedAttempts
{
  return self->_numberOfFailedAttempts;
}

- (void)setNumberOfFailedAttempts:(unint64_t)a3
{
  self->_numberOfFailedAttempts = a3;
}

- (BOOL)isPasswordDiverged
{
  return self->_passwordDiverged;
}

- (void)setPasswordDiverged:(BOOL)a3
{
  self->_passwordDiverged = a3;
}

- (NSString)wrongAccountName
{
  return self->_wrongAccountName;
}

- (void)setWrongAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)divergedAccountPassword
{
  return self->_divergedAccountPassword;
}

- (void)setDivergedAccountPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divergedAccountPassword, 0);
  objc_storeStrong((id *)&self->_wrongAccountName, 0);
  objc_storeStrong((id *)&self->_displayWindow, 0);
}

@end
