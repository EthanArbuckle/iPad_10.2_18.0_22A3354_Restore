@implementation ICACAccountVerificationOperation

- (void)execute
{
  ICACAccountVerificationOperation *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  __CFString *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  ICStoreRequestContext *v32;
  ICStoreRequestContext *v33;
  double v34;
  NSObject *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  ICAMSBagAdapter *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  ICAMSBagAdapter *v47;
  ICStoreRequestContext *v48;
  __CFString *v49;
  void *v50;
  double v51;
  ICACAccountVerificationOperation *v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  _QWORD v58[5];
  uint64_t v59;
  const __CFString *v60;
  uint8_t buf[4];
  ICACAccountVerificationOperation *v62;
  __int16 v63;
  __CFString *v64;
  __int16 v65;
  double v66;
  uint64_t v67;

  v2 = self;
  v67 = *MEMORY[0x1E0C80C00];
  -[ICUserVerificationOperation verificationRequest](self, "verificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "verificationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ACAccount");
  v5 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "ACAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "interactionLevel");
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 5)
      v9 = CFSTR("unknown");
    else
      v9 = off_1E438B0D0[v7];
    v10 = v9;
    *(_DWORD *)buf = 138543874;
    v62 = v2;
    v63 = 2114;
    v64 = v10;
    v65 = 2114;
    v66 = v5;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing %{public}@ authentication for account %{public}@", buf, 0x20u);

  }
  if (v5 != 0.0 && v6)
  {
    if (v7 == 1)
    {
      v16 = 1;
    }
    else
    {
      if (v7 == 4)
      {
        objc_msgSend(*(id *)&v5, "username");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(*(id *)&v5, "ic_DSID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "longLongValue");

          if (v13)
          {
            -[ICACAccountVerificationOperation finishWithError:](v2, "finishWithError:", 0);
            goto LABEL_59;
          }
        }
        else
        {

        }
      }
      +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "shouldForceSilentAuthentications");

      if (v18)
      {
        v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v62 = v2;
          _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Overriding interaction level to be silent-only based on debug settings", buf, 0xCu);
        }

        v7 = 1;
        v16 = 1;
      }
      else if (v7 - 3 >= 2)
      {
        if (v7 == 5)
        {
          +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastAllowedInteractiveAuthenticationTime");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v23 = v22;
          objc_msgSend(v21, "timeIntervalSinceReferenceDate");
          v16 = v23 - v24 <= 86400.0;

          v7 = 5;
        }
        else
        {
          v16 = 0;
        }
      }
      else
      {
        v16 = 2;
      }
    }
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v6;
    v57 = v3;
    if (!objc_msgSend(v25, "isAudioAccessory") || v16)
    {
      if (v16 != 1)
        goto LABEL_32;
    }
    else
    {
      if ((objc_msgSend(*(id *)&v5, "isActive") & 1) != 0)
      {
        v16 = 0;
LABEL_32:
        +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setLastAllowedInteractiveAuthenticationTime:", v27);
        goto LABEL_46;
      }
      v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v2;
        _os_log_impl(&dword_1A03E3000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ Overriding interaction level to be silent-only for secondary account", buf, 0xCu);
      }

    }
    if (execute_sOnceToken != -1)
      dispatch_once(&execute_sOnceToken, &__block_literal_global_16590);
    objc_msgSend(*(id *)&v5, "ic_DSID");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    v31 = &unk_1E43E6700;
    if (v29)
      v31 = (void *)v29;
    v26 = v31;

    objc_msgSend((id)execute_sLastSilentReauthenticationAttemptPerDSID, "objectForKey:", v26);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v32 = (ICStoreRequestContext *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v27)
    {
      -[ICStoreRequestContext timeIntervalSinceDate:](v32, "timeIntervalSinceDate:", v27);
      if (v34 < 60.0)
      {
        v35 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          -[ICStoreRequestContext timeIntervalSinceReferenceDate](v33, "timeIntervalSinceReferenceDate");
          v37 = v36;
          -[__CFString timeIntervalSinceReferenceDate](v27, "timeIntervalSinceReferenceDate");
          *(_DWORD *)buf = 138543874;
          v62 = v2;
          v63 = 2114;
          v64 = v27;
          v65 = 2048;
          v66 = v37 - v38;
          _os_log_impl(&dword_1A03E3000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Skipping silent authentication attempt due to throttling. last attempt was at %{public}@ (%.2fs ago)", buf, 0x20u);
        }

        v39 = (void *)MEMORY[0x1E0CB35C8];
        v59 = *MEMORY[0x1E0CB2938];
        v60 = CFSTR("Not allowing silent authentication because one was recently attempted already");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
        v40 = (ICAMSBagAdapter *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7402, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICACAccountVerificationOperation finishWithError:](v2, "finishWithError:", v41);
        goto LABEL_58;
      }
    }
    objc_msgSend((id)execute_sLastSilentReauthenticationAttemptPerDSID, "setObject:forKey:", v33, v26);

    v16 = 1;
    v3 = v57;
LABEL_46:

    v26 = objc_alloc_init(MEMORY[0x1E0CFD9C8]);
    objc_msgSend(v26, "setAllowServerDialogs:", v7 != 1);
    objc_msgSend(v26, "setAuthenticationType:", v16);
    objc_msgSend(v26, "setEnableAccountCreation:", v7 == 4);
    objc_msgSend(v26, "setCanMakeAccountActive:", v7 == 4);
    objc_msgSend(v26, "setIgnoreAccountConversion:", v7 == 1);
    objc_msgSend(v4, "debugReason");
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString length](v27, "length"))
    {

      v27 = CFSTR("This action requires authentication to proceed");
    }
    objc_msgSend(v26, "setDebugReason:", v27);
    objc_msgSend(v3, "storeRequestContext");
    v33 = (ICStoreRequestContext *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      objc_msgSend(*(id *)&v5, "ic_DSID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v42, "longLongValue"))
      {
        objc_msgSend(*(id *)&v5, "ic_DSID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v33 = -[ICStoreRequestContext initWithIdentity:]([ICStoreRequestContext alloc], "initWithIdentity:", v44);
    }
    v40 = -[ICAMSBagAdapter initWithRequestContext:]([ICAMSBagAdapter alloc], "initWithRequestContext:", v33);
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFD9D8]), "initWithAccount:options:bag:", *(_QWORD *)&v5, v26, v40);
    v41 = v45;
    if (v7 != 1)
      objc_msgSend(v45, "setDelegate:", v2);
    objc_msgSend(v41, "performAuthentication");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)&v5, "isActive") & 1) == 0)
    {
      objc_msgSend(v46, "promiseWithTimeout:", 3.0);
      v55 = v26;
      v47 = v40;
      v48 = v33;
      v49 = v27;
      v50 = v4;
      v51 = v5;
      v52 = v2;
      v53 = v25;
      v54 = objc_claimAutoreleasedReturnValue();

      v46 = (void *)v54;
      v25 = v53;
      v2 = v52;
      v5 = v51;
      v4 = v50;
      v27 = v49;
      v33 = v48;
      v40 = v47;
      v26 = v55;
    }
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __43__ICACAccountVerificationOperation_execute__block_invoke_15;
    v58[3] = &unk_1E438C998;
    v58[4] = v2;
    objc_msgSend(v46, "addFinishBlock:", v58);

LABEL_58:
    v6 = v56;
    v3 = v57;
    goto LABEL_59;
  }
  v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v62 = v2;
    _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "%{public}@ No account provided - skipping verification", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICACAccountVerificationOperation finishWithError:](v2, "finishWithError:", v15);

LABEL_59:
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  -[ICUserVerificationOperation verificationRequest](self, "verificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "verificationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v4)
  {
    objc_msgSend(v6, "identityStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_reloadForExternalChange");

  }
  -[ICUserVerificationOperation responseHandler](self, "responseHandler");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, BOOL, id))(v9 + 16))(v9, v4 == 0, v4);
  v11.receiver = self;
  v11.super_class = (Class)ICACAccountVerificationOperation;
  -[ICAsyncOperation finishWithError:](&v11, sel_finishWithError_, v4);

}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  ICACAccountVerificationOperation *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling dialog request %{public}@", buf, 0x16u);
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC48]), "initWithRequest:", v7);
  objc_msgSend(v10, "present");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v11, "resultWithError:", &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;

  if (!v12)
  {
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to present dialog. err=%{public}@", buf, 0x16u);
    }

  }
  v8[2](v8, v12, v13);

}

void __43__ICACAccountVerificationOperation_execute__block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v4, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Authentication task complete error=%{public}@", buf, 0x16u);

    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB3388];
    v13 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7403, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Authentication task complete", buf, 0xCu);
    }
    v10 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v10);
}

void __43__ICACAccountVerificationOperation_execute__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)execute_sLastSilentReauthenticationAttemptPerDSID;
  execute_sLastSilentReauthenticationAttemptPerDSID = v0;

}

@end
