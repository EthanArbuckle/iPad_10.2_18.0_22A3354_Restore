@implementation SSFollowUpController

- (SSFollowUpController)init
{
  SSFollowUpController *v2;
  void *v3;
  objc_class *v4;
  uint64_t v5;
  FLFollowUpController *followUpController;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)SSFollowUpController;
  v2 = -[SSFollowUpController init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getFLFollowUpControllerClass_softClass;
    v13 = getFLFollowUpControllerClass_softClass;
    if (!getFLFollowUpControllerClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getFLFollowUpControllerClass_block_invoke;
      v9[3] = &unk_1E47B8A28;
      v9[4] = &v10;
      __getFLFollowUpControllerClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = objc_msgSend([v4 alloc], "initWithClientIdentifier:", CFSTR("com.apple.StoreServices.followup"));
    followUpController = v2->_followUpController;
    v2->_followUpController = (FLFollowUpController *)v5;

  }
  return v2;
}

+ (id)sharedController
{
  if (sharedController_ss_once_token___COUNTER__ != -1)
    dispatch_once(&sharedController_ss_once_token___COUNTER__, &__block_literal_global_18);
  return (id)sharedController_ss_once_object___COUNTER__;
}

void __40__SSFollowUpController_sharedController__block_invoke()
{
  SSFollowUpController *v0;
  void *v1;

  v0 = objc_alloc_init(SSFollowUpController);
  v1 = (void *)sharedController_ss_once_object___COUNTER__;
  sharedController_ss_once_object___COUNTER__ = (uint64_t)v0;

}

- (id)dismissFollowUpWithIdentifier:(id)a3
{
  return -[SSFollowUpController dismissFollowUpWithIdentifier:account:](self, "dismissFollowUpWithIdentifier:account:", a3, 0);
}

- (id)dismissFollowUpWithIdentifier:(id)a3 account:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSFollowUpController.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[SSFollowUpController pendingFollowUpWithIdentifier:](self, "pendingFollowUpWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__SSFollowUpController_dismissFollowUpWithIdentifier_account___block_invoke;
  v15[3] = &unk_1E47BD488;
  objc_copyWeak(&v18, &location);
  v10 = v8;
  v16 = v10;
  v17 = v7;
  objc_msgSend(v9, "thenWithBlock:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSBinaryPromise promiseWithPromise:](SSBinaryPromise, "promiseWithPromise:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

id __62__SSFollowUpController_dismissFollowUpWithIdentifier_account___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  id v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_4;
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getAAFollowUpUserInfoAccountIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "backingAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (v10)
  {

LABEL_4:
    objc_msgSend(WeakRetained, "_dismissFollowUpWithIdentifier:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "promiseAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  +[SSLogConfig sharedFollowUpConfig](SSLogConfig, "sharedFollowUpConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_msgSend(v12, "shouldLog");
  if (objc_msgSend(v12, "shouldLogToDisk"))
    v14 = v13 | 2;
  else
    v14 = v13;
  objc_msgSend(v12, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    v14 &= 2u;
  if (v14)
  {
    v16 = (void *)objc_opt_class();
    v32 = v5;
    v18 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v31 = v16;
    objc_msgSend(v18, "backingAccount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v33 = 138544130;
    v34 = v16;
    v35 = 2114;
    v36 = v17;
    v5 = v32;
    v37 = 2114;
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v39 = 2114;
    v40 = v7;
    LODWORD(v30) = 42;
    v20 = (void *)_os_log_send_and_compose_impl();

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v33, v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog(v12, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v21);

    }
  }
  else
  {

  }
  SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, (uint64_t)CFSTR("Refusing to dismiss a pending follow-up. The follow-up was not for the specified account."));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSPromise promiseWithError:](SSPromise, "promiseWithError:", v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v11;
}

- (id)pendingFollowUpWithIdentifier:(id)a3
{
  id v5;
  SSPromise *v6;
  void *v7;
  SSPromise *v8;
  SSPromise *v9;
  void *v11;
  _QWORD v12[4];
  SSPromise *v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSFollowUpController.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v6 = objc_alloc_init(SSPromise);
  -[SSFollowUpController followUpController](self, "followUpController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__SSFollowUpController_pendingFollowUpWithIdentifier___block_invoke;
  v12[3] = &unk_1E47BD4D8;
  v8 = v6;
  v13 = v8;
  v14 = v5;
  objc_msgSend(v7, "pendingFollowUpItemsWithCompletion:", v12);

  v9 = v8;
  return v9;
}

void __54__SSFollowUpController_pendingFollowUpWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (!a2 || a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__SSFollowUpController_pendingFollowUpWithIdentifier___block_invoke_2;
    v7[3] = &unk_1E47BD4B0;
    v7[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(a2, "_ss_firstObjectPassingTest:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "finishWithResult:", v4);
    }
    else
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, (uint64_t)CFSTR("Unable to find a pending follow-up."));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "finishWithError:", v6);

    }
  }
}

uint64_t __54__SSFollowUpController_pendingFollowUpWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)postFollowUpWithIdentifier:(id)a3 account:(id)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
    {
LABEL_3:
      v13 = (id)objc_msgSend(v12, "mutableCopy");
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSFollowUpController.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v12)
      goto LABEL_3;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
LABEL_6:
  v15 = v13;
  if (v10)
  {
    objc_msgSend(v10, "backingAccount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    getAAFollowUpUserInfoAccountIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v18);

    objc_msgSend(v10, "altDSID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {
      getAAFollowUpUserInfoAltDSID();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v20);

    }
  }
  -[SSFollowUpController _postFollowUpWithIdentifier:userInfo:](self, "_postFollowUpWithIdentifier:userInfo:", v9, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)postFollowUpWithIdentifier:(id)a3 userInfo:(id)a4
{
  return -[SSFollowUpController postFollowUpWithIdentifier:account:userInfo:](self, "postFollowUpWithIdentifier:account:userInfo:", a3, 0, a4);
}

- (id)_createFollowUpItemForIdentifier:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSFollowUpController.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.SSFollowUpIdentifier.RenewCredentials"))
    || (-[SSFollowUpController _createFollowUpItemForRenewCredentialsWithUserInfo:](self, "_createFollowUpItemForRenewCredentialsWithUserInfo:", v8), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[SSLogConfig sharedFollowUpConfig](SSLogConfig, "sharedFollowUpConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      *(_DWORD *)v25 = 138543618;
      *(_QWORD *)&v25[4] = objc_opt_class();
      *(_WORD *)&v25[12] = 2114;
      *(_QWORD *)&v25[14] = v7;
      v14 = *(id *)&v25[4];
      LODWORD(v24) = 22;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_16:

        v9 = 0;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, v25, v24, *(_OWORD *)v25, *(_QWORD *)&v25[16], v26);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v10, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_16;
  }
LABEL_17:

  return v9;
}

- (id)_createFollowUpItemForRenewCredentialsWithUserInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  objc_class *v21;
  id v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  objc_class *v36;
  id v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  __int128 v50;
  uint64_t v51;
  void *v52;
  uint64_t *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  getAAFollowUpUserInfoAltDSID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    +[SSLogConfig sharedFollowUpConfig](SSLogConfig, "sharedFollowUpConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v9 &= 2u;
    if (v9)
    {
      LODWORD(v50) = 138543362;
      *(_QWORD *)((char *)&v50 + 4) = objc_opt_class();
      v11 = *(id *)((char *)&v50 + 4);
      LODWORD(v44) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v50, v44);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        free(v12);
        SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v13);

      }
    }
    else
    {

    }
  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v20 = (void *)getFLFollowUpActionClass_softClass;
  v48 = getFLFollowUpActionClass_softClass;
  if (!getFLFollowUpActionClass_softClass)
  {
    *(_QWORD *)&v50 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v50 + 1) = 3221225472;
    v51 = (uint64_t)__getFLFollowUpActionClass_block_invoke;
    v52 = &unk_1E47B8A28;
    v53 = &v45;
    __getFLFollowUpActionClass_block_invoke((uint64_t)&v50);
    v20 = (void *)v46[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v45, 8);
  v22 = objc_alloc_init(v21);
  *(_QWORD *)&v50 = 0;
  *((_QWORD *)&v50 + 1) = &v50;
  v51 = 0x2020000000;
  v23 = (_QWORD *)getAAFollowUpActionPrimarySymbolLoc_ptr;
  v52 = (void *)getAAFollowUpActionPrimarySymbolLoc_ptr;
  if (!getAAFollowUpActionPrimarySymbolLoc_ptr)
  {
    v24 = (void *)AppleAccountLibrary();
    v23 = dlsym(v24, "AAFollowUpActionPrimary");
    *(_QWORD *)(*((_QWORD *)&v50 + 1) + 24) = v23;
    getAAFollowUpActionPrimarySymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(&v50, 8);
  if (!v23)
    -[SSFollowUpController _createFollowUpItemForRenewCredentialsWithUserInfo:].cold.1();
  objc_msgSend(v22, "setIdentifier:", *v23);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RENEW_CREDENTIALS_PRIMARY"), &stru_1E47D72B0, CFSTR("Localizable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLabel:", v26);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RENEW_CREDENTIALS_MESSAGE"), &stru_1E47D72B0, CFSTR("Localizable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[SSDevice deviceIsInternalBuild](SSDevice, "deviceIsInternalBuild"))
  {
    *(_QWORD *)&v50 = 0;
    *((_QWORD *)&v50 + 1) = &v50;
    v51 = 0x2020000000;
    v29 = (_QWORD *)getAAFollowUpUserInfoClientNameSymbolLoc_ptr;
    v52 = (void *)getAAFollowUpUserInfoClientNameSymbolLoc_ptr;
    if (!getAAFollowUpUserInfoClientNameSymbolLoc_ptr)
    {
      v30 = (void *)AppleAccountLibrary();
      v29 = dlsym(v30, "AAFollowUpUserInfoClientName");
      *(_QWORD *)(*((_QWORD *)&v50 + 1) + 24) = v29;
      getAAFollowUpUserInfoClientNameSymbolLoc_ptr = (uint64_t)v29;
    }
    _Block_object_dispose(&v50, 8);
    if (!v29)
      -[SSFollowUpController _createFollowUpItemForRenewCredentialsWithUserInfo:].cold.2();
    objc_msgSend(v3, "objectForKeyedSubscript:", *v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RENEW_CREDENTIALS_MESSAGE_BLAME"), &stru_1E47D72B0, CFSTR("Localizable"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByAppendingFormat:", v33, v31);
      v34 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)v34;
    }

  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v35 = (void *)getFLFollowUpItemClass_softClass;
  v48 = getFLFollowUpItemClass_softClass;
  if (!getFLFollowUpItemClass_softClass)
  {
    *(_QWORD *)&v50 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v50 + 1) = 3221225472;
    v51 = (uint64_t)__getFLFollowUpItemClass_block_invoke;
    v52 = &unk_1E47B8A28;
    v53 = &v45;
    __getFLFollowUpItemClass_block_invoke((uint64_t)&v50);
    v35 = (void *)v46[3];
  }
  v36 = objc_retainAutorelease(v35);
  _Block_object_dispose(&v45, 8);
  v37 = objc_alloc_init(v36);
  v49 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActions:", v38);

  objc_msgSend(v37, "setDisplayStyle:", 0);
  *(_QWORD *)&v50 = 0;
  *((_QWORD *)&v50 + 1) = &v50;
  v51 = 0x2020000000;
  v39 = (_QWORD *)getFLGroupIdentifierAccountSymbolLoc_ptr;
  v52 = (void *)getFLGroupIdentifierAccountSymbolLoc_ptr;
  if (!getFLGroupIdentifierAccountSymbolLoc_ptr)
  {
    v40 = (void *)CoreFollowUpLibrary();
    v39 = dlsym(v40, "FLGroupIdentifierAccount");
    *(_QWORD *)(*((_QWORD *)&v50 + 1) + 24) = v39;
    getFLGroupIdentifierAccountSymbolLoc_ptr = (uint64_t)v39;
  }
  _Block_object_dispose(&v50, 8);
  if (!v39)
    -[SSFollowUpController _createFollowUpItemForRenewCredentialsWithUserInfo:].cold.3();
  objc_msgSend(v37, "setGroupIdentifier:", *v39);
  objc_msgSend(v37, "setInformativeText:", v28);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_RENEW_CREDENTIALS_TITLE"), &stru_1E47D72B0, CFSTR("Localizable"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTitle:", v42);

  objc_msgSend(v37, "setUniqueIdentifier:", CFSTR("com.apple.SSFollowUpIdentifier.RenewCredentials"));
  objc_msgSend(v37, "setUserInfo:", v3);

  return v37;
}

- (id)_dismissFollowUpWithIdentifier:(id)a3
{
  id v5;
  SSBinaryPromise *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSFollowUpController.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v6 = objc_alloc_init(SSBinaryPromise);
  -[SSFollowUpController followUpController](self, "followUpController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBinaryPromise completionHandlerAdapter](v6, "completionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", v8, v9);

  return v6;
}

- (id)_postFollowUpWithIdentifier:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SSBinaryPromise *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSFollowUpController.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[SSFollowUpController _createFollowUpItemForIdentifier:userInfo:](self, "_createFollowUpItemForIdentifier:userInfo:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(SSBinaryPromise);
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__SSFollowUpController__postFollowUpWithIdentifier_userInfo___block_invoke;
    v17[3] = &unk_1E47B8790;
    v17[4] = v7;
    -[SSBinaryPromise addSuccessBlock:](v10, "addSuccessBlock:", v17);
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __61__SSFollowUpController__postFollowUpWithIdentifier_userInfo___block_invoke_42;
    v16[3] = &unk_1E47B9F78;
    v16[4] = v7;
    -[SSBinaryPromise addErrorBlock:](v10, "addErrorBlock:", v16);
    -[SSFollowUpController followUpController](self, "followUpController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSBinaryPromise completionHandlerAdapter](v10, "completionHandlerAdapter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postFollowUpItem:completion:", v9, v13);

  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, (uint64_t)CFSTR("Unable to create a FLFollowUpItem."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSBinaryPromise promiseWithError:](SSBinaryPromise, "promiseWithError:", v12);
    v10 = (SSBinaryPromise *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __61__SSFollowUpController__postFollowUpWithIdentifier_userInfo___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedFollowUpConfig](SSLogConfig, "sharedFollowUpConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    v6 = v4;
  else
    v6 = v4 & 2;
  if (!v6)
    goto LABEL_12;
  v7 = *(_QWORD *)(a1 + 32);
  v16 = 138543362;
  v17 = v7;
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v2, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v5);
LABEL_12:

  }
}

void __61__SSFollowUpController__postFollowUpWithIdentifier_userInfo___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedFollowUpConfig](SSLogConfig, "sharedFollowUpConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (!v8)
    goto LABEL_12;
  v9 = *(_QWORD *)(a1 + 32);
  v18 = 138543618;
  v19 = v9;
  v20 = 2114;
  v21 = v3;
  LODWORD(v17) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v18, v17);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog(v4, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v7);
LABEL_12:

  }
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
  objc_storeStrong((id *)&self->_followUpController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpController, 0);
}

- (void)_createFollowUpItemForRenewCredentialsWithUserInfo:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAAFollowUpActionPrimary(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SSFollowUpController.m"), 34, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_createFollowUpItemForRenewCredentialsWithUserInfo:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAAFollowUpUserInfoClientName(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SSFollowUpController.m"), 37, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_createFollowUpItemForRenewCredentialsWithUserInfo:.cold.3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getFLGroupIdentifierAccount(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SSFollowUpController.m"), 38, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

@end
