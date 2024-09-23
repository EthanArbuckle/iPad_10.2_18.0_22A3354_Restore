@implementation PKAuthenticatorEvaluationContext

- (PKAuthenticatorEvaluationContext)init
{
  return -[PKAuthenticatorEvaluationContext initWithRequest:completionHandler:forAuthenticator:](self, "initWithRequest:completionHandler:forAuthenticator:", 0, 0, 0);
}

- (PKAuthenticatorEvaluationContext)initWithRequest:(id)a3 completionHandler:(id)a4 forAuthenticator:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKAuthenticatorEvaluationContext *v12;
  PKAuthenticatorEvaluationContext *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  id *p_request;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;
  uint64_t v23;
  id completionHandler;
  NSMutableArray *v25;
  NSMutableArray *accessHandlers;
  unint64_t *p_externalContextInvalidationPolicy;
  int v28;
  char v29;
  int IsAvailable;
  BOOL v31;
  int v32;
  _BOOL4 acquireUserIntent;
  BOOL v35;
  int v36;
  int v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  void *v41;
  int v42;
  int64_t policy;
  void *v44;
  id v45;
  id v46;
  id v47;
  _QWORD block[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id location;
  objc_super v56;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v56.receiver = self;
  v56.super_class = (Class)PKAuthenticatorEvaluationContext;
  v12 = -[PKAuthenticatorEvaluationContext init](&v56, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_57;
  objc_storeWeak((id *)&v12->_authenticator, v11);
  v14 = objc_msgSend(v9, "policy");
  v15 = _LAPolicyContainerForPKPolicy(v14);
  v17 = v16;
  p_request = (id *)&v13->_request;
  objc_storeStrong((id *)&v13->_request, a3);
  v19 = v17 & 0x100;
  if ((v17 & 0x10000) != 0)
  {
    v21 = 0;
  }
  else if ((v17 & 0x100) != 0)
  {
    v21 = 1;
  }
  else
  {
    v20 = objc_msgSend(v9, "accessControlRef");
    v19 = 0;
    v21 = v20 != 0;
  }
  v13->_supported = v21;
  if (v19)
    v22 = v21;
  else
    v22 = 0;
  v13->_policySupported = v22;
  v13->_forceApplePayCheck = v17 & 1;
  v13->_forceSkipUserIntent = HIBYTE(v17) & 1;
  v13->_policy = v15;
  v23 = objc_msgSend(v10, "copy");
  completionHandler = v13->_completionHandler;
  v13->_completionHandler = (id)v23;

  v13->_presentationFlags = 0;
  v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  accessHandlers = v13->_accessHandlers;
  v13->_accessHandlers = v25;

  v13->_externalContextInvalidationPolicy = 0;
  v13->_externalContextOptions = 0;
  p_externalContextInvalidationPolicy = &v13->_externalContextInvalidationPolicy;
  if (-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](v13->_request, "useLegacyAuthenticator"))
  {
    v28 = 0;
    v29 = 0;
  }
  else
  {
    v28 = objc_msgSend(v9, "hasInitialAuthenticatorState");
    v29 = objc_msgSend(v9, "initialAuthenticatorState");
  }
  IsAvailable = PKUserIntentIsAvailable();
  v31 = 0;
  if (v14 != 1 && IsAvailable)
    v31 = !v13->_forceSkipUserIntent;
  v13->_acquireUserIntent = v31;
  v32 = PKUserIntentIsAvailable();
  acquireUserIntent = v13->_acquireUserIntent;
  if (v32)
    v35 = v14 == 8 && acquireUserIntent;
  else
    v35 = 0;
  v13->_acquireSecondaryUserIntent = v35;
  if (acquireUserIntent)
  {
    v36 = objc_msgSend(*p_request, "assumeUserIntentAvailable");
    v37 = v36;
    if (v14 == 8 || (v36 & 1) != 0 || (PKPearlIsAvailable() & 1) != 0)
    {
      if (!v37)
        goto LABEL_30;
      goto LABEL_29;
    }
    if ((v29 & 6) != 0)
      v39 = 0;
    else
      v39 = v28;
    if ((v39 & 1) == 0)
LABEL_29:
      v13->_completedMechanisms |= 0x10uLL;
  }
LABEL_30:
  if (objc_msgSend(*p_request, "assumeBiometricOrPasscodeAvailable"))
    v13->_completedMechanisms |= 1uLL;
  v13->_coachingStatus = 1;
  if (-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](v13->_request, "useLegacyAuthenticator"))
    goto LABEL_47;
  v13->_coachingState = 0;
  if (v13->_acquireUserIntent)
  {
    v38 = 3;
    if ((v13->_completedMechanisms & 0x10) != 0)
      v38 = 0;
    if ((v28 & (v13->_completedMechanisms >> 4) & 1) == 0)
      goto LABEL_46;
  }
  else if (!v28)
  {
    v38 = 0;
    goto LABEL_46;
  }
  v38 = 4 * ((v29 & 6) == 0);
LABEL_46:
  v13->_evaluationState = v38;
LABEL_47:
  objc_msgSend(v9, "externalizedContext");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    *p_externalContextInvalidationPolicy = 2;
LABEL_56:
    objc_initWeak(&location, v13);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__PKAuthenticatorEvaluationContext_initWithRequest_completionHandler_forAuthenticator___block_invoke_3;
    block[3] = &unk_24D0A0F90;
    objc_copyWeak(&v51, &location);
    v50 = v41;
    v47 = v41;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);

    goto LABEL_57;
  }
  v42 = PKUserIntentIsAvailable();
  policy = v13->_policy;
  if (v42)
  {
    if (policy == 1004)
    {
      *p_externalContextInvalidationPolicy = 1;
      +[PKAuthenticatorSharedRootContext sharedInstance](PKAuthenticatorSharedRootContext, "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "externalizedContext");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_56;
    }
LABEL_55:
    v41 = 0;
    goto LABEL_56;
  }
  if (policy != 1004 || !PKRunningInViewService())
    goto LABEL_55;
  v13->_externalContextOptions |= 1uLL;
  objc_initWeak(&location, v13);
  v45 = objc_alloc_init(MEMORY[0x24BEB0A30]);
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __87__PKAuthenticatorEvaluationContext_initWithRequest_completionHandler_forAuthenticator___block_invoke;
  v52[3] = &unk_24D0A1028;
  objc_copyWeak(&v54, &location);
  v46 = v45;
  v53 = v46;
  objc_msgSend(v46, "fetchUnlockCredentialSetWithCompletion:", v52);

  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);
LABEL_57:

  return v13;
}

void __87__PKAuthenticatorEvaluationContext_initWithRequest_completionHandler_forAuthenticator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __87__PKAuthenticatorEvaluationContext_initWithRequest_completionHandler_forAuthenticator___block_invoke_2;
  v8 = &unk_24D0A0F90;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v4 = v3;
  v9 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], &v5);
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v5, v6, v7, v8);

  objc_destroyWeak(&v10);
}

void __87__PKAuthenticatorEvaluationContext_initWithRequest_completionHandler_forAuthenticator___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_createContextWithExternalizedContext:", *(_QWORD *)(a1 + 32));

}

void __87__PKAuthenticatorEvaluationContext_initWithRequest_completionHandler_forAuthenticator___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_createContextWithExternalizedContext:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;
  _QWORD block[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PKAuthenticatorEvaluationContext invalidate](self, "invalidate");
  v4 = -[PKAuthenticatorEvaluationContext hoistCompletionHandler](self, "hoistCompletionHandler");
  v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__PKAuthenticatorEvaluationContext_dealloc__block_invoke;
    block[3] = &unk_24D0A0B30;
    v8 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  v6.receiver = self;
  v6.super_class = (Class)PKAuthenticatorEvaluationContext;
  -[PKAuthenticatorEvaluationContext dealloc](&v6, sel_dealloc);
}

void __43__PKAuthenticatorEvaluationContext_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE6EA20], "responseWithResult:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)hoistCompletionHandler
{
  void *v3;
  id completionHandler;
  void *v5;

  v3 = (void *)MEMORY[0x2199BB0CC](self->_completionHandler, a2);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  v5 = (void *)MEMORY[0x2199BB0CC](v3);
  return v5;
}

- (void)invalidate
{
  -[PKAuthenticatorEvaluationContext invalidateWithIntent:](self, "invalidateWithIntent:", 0);
}

- (void)invalidateWithIntent:(int64_t)a3
{
  LAContext *v5;
  LAContext *LAContext;
  void *v7;
  uint64_t v8;
  char v9;
  unint64_t externalContextInvalidationPolicy;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  LAContext *v15;
  uint64_t v16;
  LAContext *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  LAContext *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  PKBannerHandle *banner;
  PKBannerHandle *v27;
  void *v28;
  void (**v29)(void);
  LAContext *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  LAContext *v34;
  void (**v35)(void);
  _QWORD block[4];
  LAContext *v37;
  void (**v38)(void);
  _QWORD v39[4];
  LAContext *v40;
  void *v41;
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  LAContext *v48;
  __int128 *v49;
  char v50;
  _QWORD v51[5];
  uint8_t v52[128];
  uint8_t buf[4];
  LAContext *v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if (!-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](self->_request, "useLegacyAuthenticator"))
    -[PKAuthenticatorEvaluationContext _clearFingerOnTimer](self, "_clearFingerOnTimer");
  -[PKAuthenticatorEvaluationContext _clearLiftFingerTimer](self, "_clearLiftFingerTimer");
  -[PKAuthenticatorEvaluationContext _dismissAuthenticatorViewOfType:](self, "_dismissAuthenticatorViewOfType:", 0);
  -[PKAuthenticatorEvaluationContext _dismissAuthenticatorViewOfType:](self, "_dismissAuthenticatorViewOfType:", 1);
  -[PKAuthenticatorEvaluationContext setDelegate:](self, "setDelegate:", 0);
  objc_storeWeak((id *)&self->_authenticator, 0);
  v5 = self->_LAContext;
  LAContext = self->_LAContext;
  self->_LAContext = 0;

  if (v5)
  {
    if (self->_usingExternalContext)
    {
      if (a3 == 1 && self->_externalContextInvalidationPolicy == 2)
        self->_externalContextInvalidationPolicy = 0;
      *(_QWORD *)&v55 = 0;
      *((_QWORD *)&v55 + 1) = &v55;
      v56 = 0x2020000000;
      v57 = 0;
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke;
      v51[3] = &unk_24D0A1050;
      v51[4] = &v55;
      v8 = objc_msgSend(v7, "beginBackgroundTaskWithExpirationHandler:", v51);

      *(_QWORD *)(*((_QWORD *)&v55 + 1) + 24) = v8;
      v9 = self->_externalContextOptions & 1;
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_2;
      v47[3] = &unk_24D0A1078;
      v50 = v9;
      v30 = v5;
      v48 = v30;
      v49 = &v55;
      v29 = (void (**)(void))MEMORY[0x2199BB0CC](v47);
      externalContextInvalidationPolicy = self->_externalContextInvalidationPolicy;
      if (externalContextInvalidationPolicy == 2)
      {
        PKLogFacilityTypeGetObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v54 = v30;
          _os_log_impl(&dword_213A36000, v24, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%p): Invalidating and not resetting external context.", buf, 0xCu);
        }

        v29[2]();
      }
      else
      {
        if (externalContextInvalidationPolicy == 1)
        {
          v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v11, "addObject:", &unk_24D0A9C98);
          objc_msgSend(v11, "addObject:", &unk_24D0A9CB0);
          if (PKPearlIsAvailable())
            v12 = &unk_24D0A9CC8;
          else
            v12 = &unk_24D0A9CE0;
          objc_msgSend(v11, "addObject:", v12, v29);
          PKLogFacilityTypeGetObject();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v54 = v30;
            _os_log_impl(&dword_213A36000, v13, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%p): Attempting to partially reset external context due to invalidation.", buf, 0xCu);
          }

          v14 = dispatch_group_create();
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v15 = (LAContext *)v11;
          v16 = -[LAContext countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          v17 = v15;
          if (v16)
          {
            v18 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v44 != v18)
                  objc_enumerationMutation(v17);
                v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                dispatch_group_enter(v14);
                v21 = objc_msgSend(v20, "integerValue");
                v39[0] = MEMORY[0x24BDAC760];
                v39[1] = 3221225472;
                v39[2] = __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_158;
                v39[3] = &unk_24D0A10A0;
                v22 = v30;
                v40 = v22;
                v41 = v20;
                v42 = v14;
                -[LAContext resetProcessedEvent:reply:](v22, "resetProcessedEvent:reply:", v21, v39);

              }
              v15 = v17;
              v16 = -[LAContext countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            }
            while (v16);
          }

          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_159;
          block[3] = &unk_24D0A0BD0;
          v37 = v30;
          v38 = v29;
          dispatch_group_notify(v14, MEMORY[0x24BDAC9B8], block);

        }
        else
        {
          PKLogFacilityTypeGetObject();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v54 = v30;
            _os_log_impl(&dword_213A36000, v25, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%p): Attempting to reset external context due to invalidation.", buf, 0xCu);
          }

          v33[0] = MEMORY[0x24BDAC760];
          v33[1] = 3221225472;
          v33[2] = __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_160;
          v33[3] = &unk_24D0A1000;
          v34 = v30;
          v35 = v29;
          -[LAContext resetWithReply:](v34, "resetWithReply:", v33);

          v17 = v34;
        }

      }
      _Block_object_dispose(&v55, 8);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v55) = 134349056;
        *(_QWORD *)((char *)&v55 + 4) = v5;
        _os_log_impl(&dword_213A36000, v23, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%{public}p): Invalidating context.", (uint8_t *)&v55, 0xCu);
      }

      -[LAContext invalidate](v5, "invalidate");
    }
  }
  self->_invalidated = 1;
  self->_usingExternalContext = 0;
  banner = self->_banner;
  if (banner)
  {
    -[PKBannerHandle invalidate](banner, "invalidate");
    v27 = self->_banner;
    self->_banner = 0;

  }
  v28 = (void *)-[NSMutableArray copy](self->_accessHandlers, "copy", v29);
  -[NSMutableArray removeAllObjects](self->_accessHandlers, "removeAllObjects");
  if (objc_msgSend(v28, "count"))
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_161;
    v31[3] = &unk_24D0A0BA8;
    v32 = v28;
    dispatch_async(MEMORY[0x24BDAC9B8], v31);

  }
}

void __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *MEMORY[0x24BDF7608];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x24BDF7608])
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 48))
    atomic_store(0, EvaluatingWithSingletonExternalContext);
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 134349056;
    v7 = v3;
    _os_log_impl(&dword_213A36000, v2, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%{public}p): Invalidating context.", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v4 = *MEMORY[0x24BDF7608];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != *MEMORY[0x24BDF7608])
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  }
}

void __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_158(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 134218498;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_213A36000, v6, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%p): Failed partial reset of external context for event %@ - %@.", (uint8_t *)&v9, 0x20u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_159(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_213A36000, v2, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%p): Finished attempting partial reset of external context.", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_160(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 || !a2)
  {
    if (v7)
    {
      v12 = *(_QWORD *)(a1 + 32);
      v16 = 134218242;
      v17 = v12;
      v18 = 2112;
      v19 = v5;
      v9 = "PKAuthenticator (%p): Could not reset external context - %@.";
      v10 = v6;
      v11 = 22;
      goto LABEL_7;
    }
  }
  else if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v16 = 134217984;
    v17 = v8;
    v9 = "PKAuthenticator (%p): reset external context.";
    v10 = v6;
    v11 = 12;
LABEL_7:
    _os_log_impl(&dword_213A36000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
  }

  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v13, v14, v15);
}

void __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_161(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)fallbackToPasscode
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __54__PKAuthenticatorEvaluationContext_fallbackToPasscode__block_invoke;
  v2[3] = &unk_24D0A10F0;
  v2[4] = self;
  -[PKAuthenticatorEvaluationContext accessLAContext:](self, "accessLAContext:", v2);
}

void __54__PKAuthenticatorEvaluationContext_fallbackToPasscode__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
  if ((objc_msgSend(*(id *)(a1 + 32), "_presentPasscodeIfNecessary") & 1) == 0)
  {
    if (PKPearlIsAvailable())
      v4 = 7;
    else
      v4 = 1;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __54__PKAuthenticatorEvaluationContext_fallbackToPasscode__block_invoke_2;
    v5[3] = &unk_24D0A10C8;
    v6 = v3;
    objc_msgSend(v6, "failProcessedEvent:failureError:reply:", v4, 0, v5);

  }
}

void __54__PKAuthenticatorEvaluationContext_fallbackToPasscode__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 134218242;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_213A36000, v6, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%p): Passcode Fallback Failed - %@.", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (BOOL)_presentPasscodeIfNecessary
{
  NSDictionary *passcodePresentationParameters;
  NSDictionary *v5;

  if (!self->_passcodePresentationParameters
    || (self->_activeMechanisms & 1) == 0
    || !-[PKAuthenticatorEvaluationRequest passcodeOnly](self->_request, "passcodeOnly")
    && !self->_passcodePresentationRequested
    && !self->_automaticallyPresentPasscodeOnce
    && (self->_activeMechanisms & 0xC) == 0)
  {
    return 0;
  }
  *(_WORD *)&self->_passcodePresentationRequested = 0;
  passcodePresentationParameters = self->_passcodePresentationParameters;
  self->_passcodePresentationParameters = 0;
  v5 = passcodePresentationParameters;

  -[PKAuthenticatorEvaluationContext _presentAuthenticatorViewOfType:withParams:](self, "_presentAuthenticatorViewOfType:withParams:", 0, v5);
  return 1;
}

- (void)_createContextWithExternalizedContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  LAContext *v7;
  LAContext *v8;
  LAContext *v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  LAContext *v14;
  LAContext *LAContext;
  BOOL v16;
  NSObject *v17;
  void (**v18)(id, id);
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  LAContext *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self->_invalidated)
  {
    if (v4 && (self->_externalContextOptions & 1) != 0)
    {
      while (!__ldaxr(EvaluatingWithSingletonExternalContext))
      {
        v6 = 1;
        if (!__stlxr(1u, EvaluatingWithSingletonExternalContext))
          goto LABEL_5;
      }
      __clrex();
      PKLogFacilityTypeGetObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213A36000, v20, OS_LOG_TYPE_DEFAULT, "PKAuthenticator: ignoring external context because singleton context is outstanding.", buf, 2u);
      }

      v6 = 0;
      v5 = 0;
    }
    else
    {
      v6 = 0;
    }
LABEL_5:
    if (self->_supported)
    {
      if (!v5)
      {
        v14 = (LAContext *)objc_alloc_init(MEMORY[0x24BDDA938]);
        LAContext = self->_LAContext;
        self->_LAContext = v14;

        v9 = self->_LAContext;
        if (v9)
          goto LABEL_17;
        goto LABEL_20;
      }
      v7 = (LAContext *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA938]), "initWithExternalizedContext:", v5);
      v8 = self->_LAContext;
      self->_LAContext = v7;

    }
    v9 = self->_LAContext;
    if (v9)
    {
      if (v5)
      {
        PKLogFacilityTypeGetObject();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (v6)
        {
          if (v11)
          {
            *(_DWORD *)buf = 134349056;
            v32 = v9;
            v12 = "PKAuthenticator (%{public}p): creating evaluation with external context and singleton semantics.";
LABEL_31:
            _os_log_impl(&dword_213A36000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
          }
        }
        else if (v11)
        {
          *(_DWORD *)buf = 134349056;
          v32 = v9;
          v12 = "PKAuthenticator (%{public}p): creating evaluation with external context.";
          goto LABEL_31;
        }
        v16 = 1;
LABEL_33:

        if (!-[PKAuthenticatorEvaluationRequest useStockAuthInterface](self->_request, "useStockAuthInterface"))
          -[LAContext setUiDelegate:](self->_LAContext, "setUiDelegate:", self);
        self->_usingExternalContext = v16;
        v21 = (void *)-[NSMutableArray copy](self->_accessHandlers, "copy");
        -[NSMutableArray removeAllObjects](self->_accessHandlers, "removeAllObjects");
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v19 = v21;
        v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v27 != v24)
                objc_enumerationMutation(v19);
              (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
            }
            v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v23);
        }
        v18 = (void (**)(id, id))v19;
        goto LABEL_43;
      }
LABEL_17:
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        v32 = v9;
        _os_log_impl(&dword_213A36000, v10, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%{public}p): creating evaluation.", buf, 0xCu);
      }
      v16 = 0;
      goto LABEL_33;
    }
LABEL_20:
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A36000, v17, OS_LOG_TYPE_DEFAULT, "PKAuthenticator: failed to create LAContext.", buf, 2u);
    }

    if (v6)
      atomic_store(0, EvaluatingWithSingletonExternalContext);
    -[PKAuthenticatorEvaluationContext invalidate](self, "invalidate");
    v18 = -[PKAuthenticatorEvaluationContext hoistCompletionHandler](self, "hoistCompletionHandler");
    if (!v18)
      goto LABEL_44;
    objc_msgSend(MEMORY[0x24BE6EA20], "responseWithResult:", 5);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v19);
LABEL_43:

LABEL_44:
  }

}

- (void)accessLAContext:(id)a3
{
  id v4;
  LAContext *LAContext;
  NSMutableArray *accessHandlers;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    if (self->_invalidated)
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
    else
    {
      LAContext = self->_LAContext;
      if (LAContext)
      {
        (*((void (**)(id, LAContext *))v4 + 2))(v4, LAContext);
      }
      else
      {
        accessHandlers = self->_accessHandlers;
        v7 = (void *)objc_msgSend(v4, "copy");
        v8 = (void *)MEMORY[0x2199BB0CC]();
        -[NSMutableArray addObject:](accessHandlers, "addObject:", v8);

      }
    }
    v4 = v9;
  }

}

- (void)evaluateWithOptions:(id)a3 completion:(id)a4
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
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke;
  v10[3] = &unk_24D0A1190;
  objc_copyWeak(&v13, &location);
  v8 = v7;
  v12 = v8;
  v9 = v6;
  v11 = v9;
  -[PKAuthenticatorEvaluationContext accessLAContext:](self, "accessLAContext:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char *WeakRetained;
  char *v5;
  void *v6;
  unsigned __int8 *v7;
  _QWORD block[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_2;
    v11[3] = &unk_24D0A1168;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    v12 = *(id *)(a1 + 40);
    v6 = (void *)MEMORY[0x2199BB0CC](v11);
    v7 = (unsigned __int8 *)(v5 + 66);
    do
    {
      if (__ldaxr(v7))
      {
        __clrex();
        __break(1u);
        return;
      }
    }
    while (__stlxr(1u, v7));
    if (objc_msgSend(*((id *)v5 + 22), "accessControlRef"))
      objc_msgSend(v3, "evaluateAccessControl:operation:options:reply:", objc_msgSend(*((id *)v5 + 22), "accessControlRef"), 3, *(_QWORD *)(a1 + 32), v6);
    else
      objc_msgSend(v3, "evaluatePolicy:options:reply:", *((_QWORD *)v5 + 23), *(_QWORD *)(a1 + 32), v6);

    objc_destroyWeak(&v13);
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_5;
    block[3] = &unk_24D0A0B30;
    v10 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_3;
  v10[3] = &unk_24D0A1140;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v11 = v6;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

  objc_destroyWeak(&v14);
}

void __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_3(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_4;
    v5[3] = &unk_24D0A1118;
    objc_copyWeak(&v9, v2);
    v8 = a1[6];
    v6 = a1[4];
    v7 = a1[5];
    objc_msgSend(WeakRetained, "accessLAContext:", v5);

    objc_destroyWeak(&v9);
  }
  else
  {
    v4 = a1[6];
    if (v4)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0, 0);
  }

}

void __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_4(uint64_t a1, void *a2)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  int v14;
  id v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained + 66;
    do
    {
      v6 = __ldaxr(v5);
      if (v6 != 1)
      {
        __clrex();
        __break(1u);
        return;
      }
    }
    while (__stlxr(0, v5));
    v7 = (void *)*((_QWORD *)WeakRetained + 12);
    if (v7)
    {
      objc_msgSend(v7, "invalidate");
      v8 = (void *)*((_QWORD *)v4 + 12);
      *((_QWORD *)v4 + 12) = 0;

    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      v10 = v4[168] != 0;
      goto LABEL_11;
    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      v10 = 1;
LABEL_11:
      v11 = 0;
      if (v17)
        v12 = *(_QWORD *)(a1 + 32) == 0;
      else
        v12 = 0;
      v13 = v12;
      v14 = v13 & !v10;
      if (v14)
        v15 = v17;
      else
        v15 = 0;
      if (v14)
        v11 = *(_QWORD *)(a1 + 40);
      if (v10)
        v16 = 0;
      else
        v16 = *(_QWORD *)(a1 + 32);
      (*(void (**)(uint64_t, _QWORD, id, uint64_t, uint64_t))(v9 + 16))(v9, v14 & 1, v15, v11, v16);
    }
  }

}

uint64_t __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_dismissAuthenticatorViewOfType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t presentationFlags;
  id WeakRetained;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;

  v3 = 4 * (a3 == 1);
  if (!a3)
    v3 = 2;
  v4 = 16 * (a3 == 1);
  if (!a3)
    v4 = 8;
  v5 = (unint64_t)(a3 == 1) << 6;
  if (!a3)
    v5 = 32;
  presentationFlags = self->_presentationFlags;
  if ((presentationFlags & v3) != 0)
  {
    self->_presentationFlags = presentationFlags | v5;
    if ((presentationFlags & v4) == 0)
    {
      self->_presentationFlags = presentationFlags & ~(v3 | v4 | v5);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (a3 == 1)
      {
        v12 = WeakRetained;
        v11 = -[PKAuthenticatorEvaluationContext _delegateSupportsPassphraseDismissal](self, "_delegateSupportsPassphraseDismissal");
        WeakRetained = v12;
        if (!v11)
        {
LABEL_17:

          return;
        }
        objc_msgSend(v12, "dismissPassphraseViewController");
      }
      else
      {
        if (a3)
          goto LABEL_17;
        v12 = WeakRetained;
        v10 = -[PKAuthenticatorEvaluationContext _delegateSupportsPasscodeDismissal](self, "_delegateSupportsPasscodeDismissal");
        WeakRetained = v12;
        if (!v10)
          goto LABEL_17;
        objc_msgSend(v12, "dismissPasscodeViewController");
      }
      WeakRetained = v12;
      goto LABEL_17;
    }
  }
}

- (void)_presentAuthenticatorViewOfType:(int64_t)a3 withParams:(id)a4
{
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  PKBannerHandle *banner;
  PKBannerHandle *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  _QWORD v16[9];

  v6 = a4;
  if (a3 == 1)
  {
    v7 = -[PKAuthenticatorEvaluationContext _delegateSupportsPassphrasePresentation](self, "_delegateSupportsPassphrasePresentation");
  }
  else if (a3)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[PKAuthenticatorEvaluationContext _delegateSupportsPasscodePresentation](self, "_delegateSupportsPasscodePresentation");
  }
  if (a3)
    v8 = 4 * (a3 == 1);
  else
    v8 = 2;
  if (a3)
    v9 = 16 * (a3 == 1);
  else
    v9 = 8;
  if (a3)
    v10 = (unint64_t)(a3 == 1) << 6;
  else
    v10 = 32;
  if (v7)
  {
    self->_presentationFlags |= v9 | v8;
    banner = self->_banner;
    if (banner)
    {
      -[PKBannerHandle invalidate](banner, "invalidate");
      v12 = self->_banner;
      self->_banner = 0;

    }
    objc_msgSend(v6, "objectForKey:", &unk_24D0A9CF8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", &unk_24D0A9D10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke;
    v16[3] = &unk_24D0A1268;
    v16[4] = self;
    v16[5] = a3;
    v16[6] = v9;
    v16[7] = v8;
    v16[8] = v10;
    -[PKAuthenticatorEvaluationContext _requestRemoteAuthenticatorViewControllerOfType:withClassName:bundleIdentifier:completion:](self, "_requestRemoteAuthenticatorViewControllerOfType:withClassName:bundleIdentifier:completion:", a3, v13, v14, v16);

  }
  else
  {
    v15 = (unint64_t)(a3 == 1) << 10;
    if (!a3)
      v15 = 256;
    self->_presentationFlags |= v15;
  }

}

void __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  _QWORD v28[5];
  __int128 v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v5 = (unint64_t)(v4 == 1) << 9;
  else
    v5 = 128;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  v7 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_2;
  v28[3] = &unk_24D0A11B8;
  v8 = *(_QWORD *)(a1 + 40);
  v28[4] = *(_QWORD *)(a1 + 32);
  v29 = *(_OWORD *)(a1 + 48);
  v30 = *(_QWORD *)(a1 + 64);
  v31 = v5;
  v32 = v8;
  v9 = MEMORY[0x2199BB0CC](v28);
  v10 = (void *)v9;
  v11 = *(_QWORD *)(a1 + 32);
  if ((*(_QWORD *)(a1 + 64) & *(_QWORD *)(v11 + 208)) != 0 || !v3)
  {
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  }
  else
  {
    objc_initWeak(&location, *(id *)(v11 + 144));
    v12 = *(_QWORD *)(a1 + 40);
    if (v12 == 1)
    {
      v23[0] = v7;
      v23[1] = 3221225472;
      v23[2] = __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_170;
      v23[3] = &unk_24D0A1220;
      objc_copyWeak(&v24, &location);
      objc_msgSend(WeakRetained, "presentPassphraseViewController:completionHandler:reply:", v3, v10, v23);
      objc_destroyWeak(&v24);
    }
    else if (!v12)
    {
      v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v13, "clientAnalyticsParameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F038], *MEMORY[0x24BE6F018]);
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE6F700]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE6F108]);

      v17 = (void *)MEMORY[0x24BE6E9C8];
      v18 = v14;
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BE6F708]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v21 = (void *)*MEMORY[0x24BE6F160];
      if ((isKindOfClass & 1) != 0)
        v21 = v19;
      v22 = v21;

      objc_msgSend(v17, "subject:sendEvent:", v22, v15);
      v25[0] = v7;
      v25[1] = 3221225472;
      v25[2] = __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_3;
      v25[3] = &unk_24D0A1220;
      objc_copyWeak(&v26, &location);
      objc_msgSend(WeakRetained, "presentPasscodeViewController:completionHandler:reply:", v3, v10, v25);
      objc_destroyWeak(&v26);

    }
    objc_destroyWeak(&location);
  }

}

uint64_t __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_2(uint64_t result, char a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 208) &= ~*(_QWORD *)(result + 40);
  if ((a2 & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(result + 32) + 208) |= *(_QWORD *)(result + 64);
    if ((*(_QWORD *)(result + 56) & *(_QWORD *)(*(_QWORD *)(result + 32) + 208)) != 0)
      return objc_msgSend(*(id *)(result + 32), "_dismissAuthenticatorViewOfType:", *(_QWORD *)(result + 72));
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(result + 32) + 208) &= ~(*(_QWORD *)(result + 56) | *(_QWORD *)(result + 48));
  }
  return result;
}

void __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setCredential:forProcessedEvent:credentialType:reply:", v3, 2, -1, &__block_literal_global_169);

}

void __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_213A36000, v5, OS_LOG_TYPE_DEFAULT, "Failed to set credential for passcode event: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_170(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setCredential:forProcessedEvent:credentialType:reply:", v3, 3, -2, &__block_literal_global_172);

}

void __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_2_171(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_213A36000, v5, OS_LOG_TYPE_DEFAULT, "Failed to set credential for passphrase event: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)_requestRemoteAuthenticatorViewControllerOfType:(int64_t)a3 withClassName:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  id WeakRetained;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  void (**v20)(id, uint64_t);
  int64_t v21;
  uint8_t buf[4];
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, uint64_t))a6;
  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (a3 == 1)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_10;
      objc_msgSend(WeakRetained, "passphraseViewController");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 || (objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_10;
      objc_msgSend(WeakRetained, "passcodeViewController");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
    if (v14)
    {
      v12[2](v12, v14);

LABEL_16:
      goto LABEL_17;
    }
LABEL_10:
    if (v10 && v11)
    {
      v16 = (void *)MEMORY[0x24BDF7130];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __126__PKAuthenticatorEvaluationContext__requestRemoteAuthenticatorViewControllerOfType_withClassName_bundleIdentifier_completion___block_invoke;
      v19[3] = &unk_24D0A1290;
      v21 = a3;
      v20 = v12;
      v17 = (id)objc_msgSend(v16, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v10, v11, v19);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v23 = a3;
        _os_log_impl(&dword_213A36000, v18, OS_LOG_TYPE_DEFAULT, "Failed to Remote Authenticator VC of Type:%ld", buf, 0xCu);
      }

      v12[2](v12, 0);
    }
    goto LABEL_16;
  }
LABEL_17:

}

void __126__PKAuthenticatorEvaluationContext__requestRemoteAuthenticatorViewControllerOfType_withClassName_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 134218242;
      v11 = v9;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_213A36000, v8, OS_LOG_TYPE_DEFAULT, "Failed to present Remote Authenticator VC of Type:%ld withError: %@", (uint8_t *)&v10, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)handlePasscodeEventWithParameters:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", &unk_24D0A9D28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "BOOLValue");
    v5 = v7;
    if (v6)
    {
      self->_completedMechanisms |= 1uLL;
      if (self->_acquireSecondaryUserIntent)
      {
        -[PKAuthenticatorEvaluationContext _dismissAuthenticatorViewOfType:](self, "_dismissAuthenticatorViewOfType:", 0);
        -[PKAuthenticatorEvaluationContext _updateEvaluationState](self, "_updateEvaluationState");
        v5 = v7;
      }
    }
  }

}

- (void)handlePearlEventWithParameters:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  int64_t coachingStatus;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  PKBannerHandle *banner;
  void *v28;
  unint64_t v29;
  PKAuthenticatorEvaluationContext *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  char isKindOfClass;
  void *v39;
  id v40;
  void *v41;
  unint64_t evaluationFlags;
  __SecAccessControl *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  uint8_t buf[8];
  _QWORD v48[3];
  _QWORD v49[4];

  v49[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_loadWeakRetained((id *)&self->_authenticator);
  v7 = v6;
  if (WeakRetained && v6)
  {
    coachingStatus = self->_coachingStatus;
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24D0A9D40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      self->_coachingStatus = objc_msgSend(v9, "integerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24D0A9D58);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "integerValue");
      switch(v13)
      {
        case 0:
          self->_evaluationFlags |= 2uLL;
          -[PKAuthenticatorEvaluationContext _updateEvaluationState](self, "_updateEvaluationState");
          v31 = objc_loadWeakRetained((id *)&self->_authenticator);
          objc_msgSend(v31, "clientAnalyticsParameters");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v33, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F088], *MEMORY[0x24BE6F018]);
          objc_msgSend(v33, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6EFB8], *MEMORY[0x24BE6F0E8]);
          objc_msgSend(v33, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F030], *MEMORY[0x24BE6F0C8]);
          v46 = v32;
          objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x24BE6F700]);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BE6F108]);

          v35 = (void *)MEMORY[0x24BE6E9C8];
          v36 = *MEMORY[0x24BE6F178];
          v49[0] = *MEMORY[0x24BE6F158];
          v49[1] = v36;
          objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x24BE6F708]);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v39 = (void *)*MEMORY[0x24BE6F160];
          if ((isKindOfClass & 1) != 0)
            v39 = v37;
          v40 = v39;

          v49[2] = v40;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 3);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "subjects:sendEvent:", v41, v33);

          break;
        case 1:
          v29 = self->_evaluationFlags & 0xFFFFFFFFFFFFFFFDLL;
          goto LABEL_25;
        case 2:
          self->_completedMechanisms |= 4uLL;
          banner = self->_banner;
          if (banner)
          {
            v28 = (void *)objc_msgSend(MEMORY[0x24BE6EB08], "createForGlyphState:", 3);
            -[PKBannerHandle setState:](banner, "setState:", v28);

          }
          goto LABEL_27;
        case 3:
        case 13:
          PKLogFacilityTypeGetObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_213A36000, v14, OS_LOG_TYPE_DEFAULT, "Biometric Match Miss Event Encountered", buf, 2u);
          }

          self->_evaluationFlags |= 8uLL;
          if (v13 == 13)
          {
            v15 = objc_loadWeakRetained((id *)&self->_authenticator);
            objc_msgSend(v15, "clientAnalyticsParameters");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            objc_msgSend(v17, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F088], *MEMORY[0x24BE6F018]);
            objc_msgSend(v17, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6EFB8], *MEMORY[0x24BE6F0E8]);
            objc_msgSend(v17, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6EFF8], *MEMORY[0x24BE6F000]);
            v45 = v16;
            objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE6F700]);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE6F108]);

            v19 = (void *)MEMORY[0x24BE6E9C8];
            v20 = *MEMORY[0x24BE6F178];
            v48[0] = *MEMORY[0x24BE6F158];
            v48[1] = v20;
            objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE6F708]);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v22 = objc_opt_isKindOfClass();
            v23 = (void *)*MEMORY[0x24BE6F160];
            if ((v22 & 1) != 0)
              v23 = v21;
            v24 = v23;

            v48[2] = v24;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 3);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "subjects:sendEvent:", v25, v17);

            v26 = 2;
          }
          else
          {
            v26 = 1;
          }
          v30 = self;
          goto LABEL_31;
        case 4:
          self->_completedMechanisms &= ~4uLL;
          goto LABEL_27;
        case 10:
          v29 = self->_evaluationFlags | 1;
LABEL_25:
          self->_evaluationFlags = v29;
LABEL_27:
          -[PKAuthenticatorEvaluationContext _updateEvaluationState](self, "_updateEvaluationState");
          break;
        case 11:
          self->_evaluationFlags &= ~1uLL;
          -[PKAuthenticatorEvaluationContext _updateEvaluationState](self, "_updateEvaluationState");
          self->_coachingStatus = 1;
          break;
        case 12:
          evaluationFlags = self->_evaluationFlags;
          v43 = -[PKAuthenticatorEvaluationRequest accessControlRef](self->_request, "accessControlRef");
          v44 = self->_evaluationFlags;
          self->_evaluationFlags = v44 | 0x80;
          if (!v43 && evaluationFlags & 0x80 | v44 & 0x20)
          {
            -[PKAuthenticatorEvaluationContext fallbackToPasscode](self, "fallbackToPasscode");
          }
          else
          {
            self->_evaluationFlags = v44 | 0x88;
            v30 = self;
            v26 = 3;
LABEL_31:
            -[PKAuthenticatorEvaluationContext _setEvaluationStateWithEvent:](v30, "_setEvaluationStateWithEvent:", 0, v26);
          }
          break;
        default:
          break;
      }
    }
    else if (coachingStatus == self->_coachingStatus)
    {
      goto LABEL_33;
    }
    -[PKAuthenticatorEvaluationContext _updateCoachingState](self, "_updateCoachingState");
LABEL_33:

  }
}

- (void)handleTouchIDEventWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  char isKindOfClass;
  void *v32;
  void *v33;
  uint8_t v34[8];
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24D0A9D70);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLValue"))
    self->_touchIDBeginTime = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24D0A9D88);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_loadWeakRetained((id *)&self->_authenticator);
  if (v6)
  {
    v9 = objc_msgSend(v6, "integerValue");
    switch(v9)
    {
      case 0:
        PKLogFacilityTypeGetObject();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        PKTimeProfileBegin();

        self->_evaluationFlags |= 2uLL;
        if (!-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](self->_request, "useLegacyAuthenticator"))
          -[PKAuthenticatorEvaluationContext _setFingerOnTimer](self, "_setFingerOnTimer");
        if (-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](self->_request, "useLegacyAuthenticator"))
        {
          if (WeakRetained && v8 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(WeakRetained, "authenticatorDidEncounterFingerOn:", v8);
        }
        else
        {
          -[PKAuthenticatorEvaluationContext _updateEvaluationState](self, "_updateEvaluationState");
        }
        v27 = objc_loadWeakRetained((id *)&self->_authenticator);
        objc_msgSend(v27, "clientAnalyticsParameters");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v17, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F088], *MEMORY[0x24BE6F018]);
        objc_msgSend(v17, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6EFB8], *MEMORY[0x24BE6F0E8]);
        objc_msgSend(v17, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F048], *MEMORY[0x24BE6F0C8]);
        objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE6F700]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BE6F108]);

        v19 = (void *)MEMORY[0x24BE6E9C8];
        v29 = *MEMORY[0x24BE6F178];
        v36[0] = *MEMORY[0x24BE6F158];
        v36[1] = v29;
        objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE6F708]);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v32 = (void *)*MEMORY[0x24BE6F160];
        if ((isKindOfClass & 1) != 0)
          v32 = v30;
        v24 = v32;

        v36[2] = v24;
        v25 = (void *)MEMORY[0x24BDBCE30];
        v26 = v36;
        goto LABEL_45;
      case 1:
        self->_evaluationFlags &= ~2uLL;
        if (!-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](self->_request, "useLegacyAuthenticator"))
          -[PKAuthenticatorEvaluationContext _clearFingerOnTimer](self, "_clearFingerOnTimer");
        -[PKAuthenticatorEvaluationContext _clearLiftFingerTimer](self, "_clearLiftFingerTimer");
        if (!-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](self->_request, "useLegacyAuthenticator"))
          goto LABEL_30;
        if (WeakRetained && v8 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "authenticatorDidEncounterFingerOff:", v8);
        break;
      case 2:
        self->_completedMechanisms |= 8uLL;
        PKLogFacilityTypeGetObject();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)PKTimeProfileEnd();

        -[PKAuthenticatorEvaluationContext _clearLiftFingerTimer](self, "_clearLiftFingerTimer");
        if (!-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](self->_request, "useLegacyAuthenticator"))
LABEL_30:
          -[PKAuthenticatorEvaluationContext _updateEvaluationState](self, "_updateEvaluationState");
        break;
      case 3:
      case 10:
        PKLogFacilityTypeGetObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v34 = 0;
          _os_log_impl(&dword_213A36000, v10, OS_LOG_TYPE_DEFAULT, "Biometric Match Miss Event Encountered", v34, 2u);
        }

        if (!-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](self->_request, "useLegacyAuthenticator"))
          -[PKAuthenticatorEvaluationContext _clearFingerOnTimer](self, "_clearFingerOnTimer");
        -[PKAuthenticatorEvaluationContext _clearLiftFingerTimer](self, "_clearLiftFingerTimer");
        if (-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](self->_request, "useLegacyAuthenticator"))
        {
          if (v9 != 10 && WeakRetained && v8)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(WeakRetained, "authenticatorDidEncounterMatchMiss:", v8);
            break;
          }
        }
        else
        {
          self->_evaluationFlags |= 8uLL;
          if (v9 == 10)
            v14 = 2;
          else
            v14 = 1;
          -[PKAuthenticatorEvaluationContext _setEvaluationStateWithEvent:](self, "_setEvaluationStateWithEvent:", 0, v14);
        }
        if (v9 == 10)
        {
          v15 = objc_loadWeakRetained((id *)&self->_authenticator);
          objc_msgSend(v15, "clientAnalyticsParameters");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v17, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F088], *MEMORY[0x24BE6F018]);
          objc_msgSend(v17, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6EFB8], *MEMORY[0x24BE6F0E8]);
          objc_msgSend(v17, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F008], *MEMORY[0x24BE6F000]);
          objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE6F700]);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE6F108]);

          v19 = (void *)MEMORY[0x24BE6E9C8];
          v20 = *MEMORY[0x24BE6F178];
          v35[0] = *MEMORY[0x24BE6F158];
          v35[1] = v20;
          objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE6F708]);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v22 = objc_opt_isKindOfClass();
          v23 = (void *)*MEMORY[0x24BE6F160];
          if ((v22 & 1) != 0)
            v23 = v21;
          v24 = v23;

          v35[2] = v24;
          v25 = (void *)MEMORY[0x24BDBCE30];
          v26 = v35;
LABEL_45:
          objc_msgSend(v25, "arrayWithObjects:count:", v26, 3);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "subjects:sendEvent:", v33, v17);

        }
        break;
      case 4:
        if ((self->_evaluationFlags & 2) != 0)
          -[PKAuthenticatorEvaluationContext _setLiftFingerTimer](self, "_setLiftFingerTimer");
        break;
      default:
        break;
    }
  }

}

- (void)handlePushButtonEventWithParameters:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  unsigned int v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  id v17;
  void *v18;
  unint64_t evaluationFlags;
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[PKAuthenticatorEvaluationContext updateCompletedMechanismsForPushButtonEventParams:](self, "updateCompletedMechanismsForPushButtonEventParams:", v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24D0A9DA0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "BOOLValue");
    if (v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_authenticator);
      objc_msgSend(WeakRetained, "clientAnalyticsParameters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F068], *MEMORY[0x24BE6F018]);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6EFD0], *MEMORY[0x24BE6EFD0]);
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE6F6F8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE6F0E8]);

      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE6F700]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE6F108]);

      v13 = (void *)MEMORY[0x24BE6E9C8];
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE6F708], *MEMORY[0x24BE6F158], *MEMORY[0x24BE6F178]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v16 = (void *)*MEMORY[0x24BE6F160];
      if ((isKindOfClass & 1) != 0)
        v16 = v14;
      v17 = v16;

      v21[2] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "subjects:sendEvent:", v18, v10);

      self->_completedMechanisms |= 0x10uLL;
      evaluationFlags = self->_evaluationFlags;
      self->_evaluationFlags = evaluationFlags | 0x40;
      if ((evaluationFlags & 0x20) != 0)
      {
        self->_automaticallyPresentPasscodeOnce = 1;
        -[PKAuthenticatorEvaluationContext _presentPasscodeIfNecessary](self, "_presentPasscodeIfNecessary");
      }

    }
    else
    {
      self->_completedMechanisms &= ~0x10uLL;
      if (self->_acquireUserIntent)
        self->_evaluationFlags |= 0x20uLL;
    }
    if (self->_usingExternalContext && self->_externalContextInvalidationPolicy)
    {
      +[PKAuthenticatorSharedRootContext sharedInstance](PKAuthenticatorSharedRootContext, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setUserIntentAvailabilityState:", v7);

    }
  }
  else if (!v5)
  {
    goto LABEL_16;
  }
  -[PKAuthenticatorEvaluationContext _updateEvaluationState](self, "_updateEvaluationState");
LABEL_16:

}

- (BOOL)updateCompletedMechanismsForPushButtonEventParams:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  unint64_t completedMechanisms;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v13;
  __int16 v14;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24D0A9D70);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24D0A9DB8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    completedMechanisms = self->_completedMechanisms;
    if (v7)
    {
      if ((completedMechanisms & 0xF) == 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      self->_completedMechanisms = completedMechanisms & 0xFFFFFFFFFFFFFFF0;
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 0;
        v10 = "PKAuthenticator: Removing completed authentication mechanisms because push button is parent";
        v11 = (uint8_t *)&v14;
LABEL_8:
        _os_log_impl(&dword_213A36000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else
    {
      self->_completedMechanisms = completedMechanisms | 1;
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 0;
        v10 = "PKAuthenticator: Adding completed authentication mechanism because push button is parent of nothing";
        v11 = (uint8_t *)&v13;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

- (void)handlePushButtonSecondaryEventWithParameters:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  void *v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", &unk_24D0A9DA0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    v6 = objc_msgSend(v4, "BOOLValue");
    v7 = 32;
    if (!v6)
      v7 = 0;
    self->_completedMechanisms = self->_completedMechanisms & 0xFFFFFFFFFFFFFFDFLL | v7;
    v8 = -[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](self->_request, "useLegacyAuthenticator");
    v5 = v9;
    if (!v8)
    {
      -[PKAuthenticatorEvaluationContext _updateEvaluationState](self, "_updateEvaluationState");
      v5 = v9;
    }
  }

}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  int64_t v13;

  v8 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__PKAuthenticatorEvaluationContext_event_params_reply___block_invoke;
  block[3] = &unk_24D0A12B8;
  v12 = v8;
  v13 = a3;
  block[4] = self;
  v9 = v8;
  v10 = a5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0);

}

void __55__PKAuthenticatorEvaluationContext_event_params_reply___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  switch(*(_QWORD *)(a1 + 48))
  {
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "handleTouchIDEventWithParameters:", *(_QWORD *)(a1 + 40));
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "handlePasscodeEventWithParameters:", *(_QWORD *)(a1 + 40));
      break;
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "handlePushButtonEventWithParameters:", *(_QWORD *)(a1 + 40));
      break;
    case 7:
      objc_msgSend(*(id *)(a1 + 32), "handlePearlEventWithParameters:", *(_QWORD *)(a1 + 40));
      break;
    case 9:
      objc_msgSend(*(id *)(a1 + 32), "handlePushButtonSecondaryEventWithParameters:", *(_QWORD *)(a1 + 40));
      break;
    default:
      break;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", &unk_24D0A9D70);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_updateActiveState:forEvent:withParameters:", objc_msgSend(v2, "BOOLValue"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v2 = v3;
  }

}

- (void)_updateActiveState:(BOOL)a3 forEvent:(int64_t)a4 withParameters:(id)a5
{
  _BOOL4 v6;
  uint64_t v8;
  unint64_t activeMechanisms;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id WeakRetained;
  id v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *passcodePresentationParameters;
  unint64_t v18;
  uint64_t v19;
  PKAuthenticatorEvaluationContext *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSDictionary *v26;
  void *v27;
  id v29;

  v6 = a3;
  v29 = a5;
  v8 = 16;
  switch(a4)
  {
    case 1:
      activeMechanisms = self->_activeMechanisms;
      v10 = activeMechanisms & 0xFFFFFFFFFFFFFFF7;
      v11 = 8;
      if (!v6)
        v11 = 0;
      LOBYTE(v12) = v10 | v11;
      self->_activeMechanisms = v10 | v11;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v14 = objc_loadWeakRetained((id *)&self->_authenticator);
      v15 = v14;
      if (WeakRetained && v14)
      {
        if (v6)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(WeakRetained, "authenticatorDidActivateTouchID:", v15);
        }
        else
        {
          objc_msgSend(v29, "objectForKeyedSubscript:", &unk_24D0A9DD0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(WeakRetained, "authenticatorDidDeactivateTouchID:status:", v15, v27 != 0);

        }
      }

      goto LABEL_29;
    case 2:
      activeMechanisms = self->_activeMechanisms;
      v12 = activeMechanisms & 0xFFFFFFFFFFFFFFFELL | v6;
      self->_activeMechanisms = v12;
      if (v6)
      {
        v16 = (NSDictionary *)objc_msgSend(v29, "copy");
        passcodePresentationParameters = self->_passcodePresentationParameters;
        self->_passcodePresentationParameters = v16;

        -[PKAuthenticatorEvaluationContext _presentPasscodeIfNecessary](self, "_presentPasscodeIfNecessary");
      }
      else
      {
        v26 = self->_passcodePresentationParameters;
        self->_passcodePresentationParameters = 0;

        v20 = self;
        v21 = 0;
LABEL_24:
        -[PKAuthenticatorEvaluationContext _dismissAuthenticatorViewOfType:](v20, "_dismissAuthenticatorViewOfType:", v21);
      }
      goto LABEL_29;
    case 3:
      activeMechanisms = self->_activeMechanisms;
      v18 = activeMechanisms & 0xFFFFFFFFFFFFFFFDLL;
      v19 = 2;
      if (!v6)
        v19 = 0;
      LOBYTE(v12) = v18 | v19;
      self->_activeMechanisms = v18 | v19;
      v20 = self;
      v21 = 1;
      if (!v6)
        goto LABEL_24;
      -[PKAuthenticatorEvaluationContext _presentAuthenticatorViewOfType:withParams:](self, "_presentAuthenticatorViewOfType:withParams:", 1, v29);
      goto LABEL_29;
    case 5:
      goto LABEL_16;
    case 7:
      activeMechanisms = self->_activeMechanisms;
      v24 = activeMechanisms & 0xFFFFFFFFFFFFFFFBLL;
      v25 = 4;
      if (!v6)
        v25 = 0;
      LOBYTE(v12) = v24 | v25;
      self->_activeMechanisms = v24 | v25;
      self->_coachingStatus = 1;
      -[PKAuthenticatorEvaluationContext _updateCoachingState](self, "_updateCoachingState");
      goto LABEL_29;
    case 9:
      v8 = 32;
LABEL_16:
      activeMechanisms = self->_activeMechanisms;
      v22 = activeMechanisms & ~v8;
      v23 = activeMechanisms | v8;
      if (v6)
        v12 = v23;
      else
        v12 = v22;
      self->_activeMechanisms = v12;
LABEL_29:
      if ((activeMechanisms & 0xC) != 0 && (v12 & 0xC) == 0)
      {
        self->_automaticallyPresentPasscodeOnce = 1;
        -[PKAuthenticatorEvaluationContext _presentPasscodeIfNecessary](self, "_presentPasscodeIfNecessary");
      }
      if (!-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](self->_request, "useLegacyAuthenticator"))
        -[PKAuthenticatorEvaluationContext _updateEvaluationState](self, "_updateEvaluationState");
      break;
    default:
      break;
  }

}

- (void)_setLiftFingerTimer
{
  NSObject *liftFingerTimeout;
  OS_dispatch_source *v4;
  double v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id location;

  self->_evaluationFlags |= 0x10uLL;
  liftFingerTimeout = self->_liftFingerTimeout;
  if (liftFingerTimeout)
  {
    dispatch_source_cancel(liftFingerTimeout);
    v4 = self->_liftFingerTimeout;
    self->_liftFingerTimeout = 0;

  }
  v5 = fmax(self->_touchIDBeginTime - CFAbsoluteTimeGetCurrent() + 1.0, 0.0);
  if (v5 <= 0.0)
  {
    -[PKAuthenticatorEvaluationContext _handleLiftFinger](self, "_handleLiftFinger");
  }
  else if (!self->_liftFingerTimeout)
  {
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    v7 = self->_liftFingerTimeout;
    self->_liftFingerTimeout = v6;

    v8 = self->_liftFingerTimeout;
    v9 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(&location, self);
    v10 = self->_liftFingerTimeout;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __55__PKAuthenticatorEvaluationContext__setLiftFingerTimer__block_invoke;
    v11[3] = &unk_24D0A12E0;
    objc_copyWeak(&v12, &location);
    dispatch_source_set_event_handler(v10, v11);
    dispatch_resume((dispatch_object_t)self->_liftFingerTimeout);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __55__PKAuthenticatorEvaluationContext__setLiftFingerTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleLiftFinger");

}

- (void)_handleLiftFinger
{
  unint64_t evaluationFlags;
  NSObject *v4;
  id WeakRetained;
  id v6;
  NSObject *liftFingerTimeout;
  OS_dispatch_source *v8;
  uint8_t v9[16];

  evaluationFlags = self->_evaluationFlags;
  if ((evaluationFlags & 0x10) != 0)
  {
    self->_evaluationFlags = evaluationFlags & 0xFFFFFFFFFFFFFFEFLL;
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213A36000, v4, OS_LOG_TYPE_DEFAULT, "Biometric Match requests lift finger.", v9, 2u);
    }

    if (-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](self->_request, "useLegacyAuthenticator"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = objc_loadWeakRetained((id *)&self->_authenticator);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "authenticator:didRequestUserAction:", v6, 0);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "authenticatorDidEncounterMatchMiss:", v6);
      }

    }
    else
    {
      -[PKAuthenticatorEvaluationContext _clearFingerOnTimer](self, "_clearFingerOnTimer");
      self->_evaluationFlags |= 8uLL;
      -[PKAuthenticatorEvaluationContext _setEvaluationStateWithEvent:](self, "_setEvaluationStateWithEvent:", 0, 1);
    }
  }
  liftFingerTimeout = self->_liftFingerTimeout;
  if (liftFingerTimeout)
  {
    dispatch_source_cancel(liftFingerTimeout);
    v8 = self->_liftFingerTimeout;
    self->_liftFingerTimeout = 0;

  }
}

- (void)_clearLiftFingerTimer
{
  NSObject *liftFingerTimeout;
  OS_dispatch_source *v4;

  self->_evaluationFlags &= ~0x10uLL;
  liftFingerTimeout = self->_liftFingerTimeout;
  if (liftFingerTimeout)
  {
    dispatch_source_cancel(liftFingerTimeout);
    v4 = self->_liftFingerTimeout;
    self->_liftFingerTimeout = 0;

  }
}

- (void)_setFingerOnTimer
{
  NSObject *matchingDelayTimeout;
  OS_dispatch_source *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id location;

  self->_evaluationFlags |= 4uLL;
  matchingDelayTimeout = self->_matchingDelayTimeout;
  if (matchingDelayTimeout)
  {
    dispatch_source_cancel(matchingDelayTimeout);
    v4 = self->_matchingDelayTimeout;
    self->_matchingDelayTimeout = 0;

  }
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  v6 = self->_matchingDelayTimeout;
  self->_matchingDelayTimeout = v5;

  v7 = self->_matchingDelayTimeout;
  v8 = dispatch_time(0, 100000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  v9 = self->_matchingDelayTimeout;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__PKAuthenticatorEvaluationContext__setFingerOnTimer__block_invoke;
  v10[3] = &unk_24D0A12E0;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler(v9, v10);
  dispatch_resume((dispatch_object_t)self->_matchingDelayTimeout);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __53__PKAuthenticatorEvaluationContext__setFingerOnTimer__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[9];
    if ((v2 & 4) != 0)
    {
      WeakRetained[9] = v2 & 0xFFFFFFFFFFFFFFFBLL;
      v3 = WeakRetained;
      objc_msgSend(WeakRetained, "_updateEvaluationState");
      WeakRetained = v3;
    }
  }

}

- (void)_clearFingerOnTimer
{
  NSObject *matchingDelayTimeout;
  OS_dispatch_source *v4;

  self->_evaluationFlags &= ~4uLL;
  matchingDelayTimeout = self->_matchingDelayTimeout;
  if (matchingDelayTimeout)
  {
    dispatch_source_cancel(matchingDelayTimeout);
    v4 = self->_matchingDelayTimeout;
    self->_matchingDelayTimeout = 0;

  }
}

- (void)setDelegate:(id)a3
{
  -[PKAuthenticatorEvaluationContext setDelegate:resetPriorDelegate:](self, "setDelegate:resetPriorDelegate:", a3, 1);
}

- (void)setDelegate:(id)a3 resetPriorDelegate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id WeakRetained;
  char delegateResponderCache;
  char v9;
  char v10;
  char v11;
  id v12;
  id v13;
  char v14;
  id obj;

  v4 = a4;
  v6 = a3;
  if (!self->_invalidated)
  {
    obj = v6;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained != obj)
    {
      if (WeakRetained)
      {
        -[PKAuthenticatorEvaluationContext _dismissAuthenticatorViewOfType:](self, "_dismissAuthenticatorViewOfType:", 0);
        -[PKAuthenticatorEvaluationContext _dismissAuthenticatorViewOfType:](self, "_dismissAuthenticatorViewOfType:", 1);
      }
      objc_storeWeak((id *)&self->_delegate, obj);
      if (!-[PKAuthenticatorEvaluationRequest useLegacyAuthenticator](self->_request, "useLegacyAuthenticator"))
      {
        delegateResponderCache = (char)self->_delegateResponderCache;
        if (obj)
        {
          v9 = objc_opt_respondsToSelector();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v10 = 2;
          else
            v10 = 0;
          v11 = v10 & 0xFE | v9 & 1;
        }
        else
        {
          v11 = 0;
        }
        *(_BYTE *)&self->_delegateResponderCache = v11;
        v12 = objc_loadWeakRetained((id *)&self->_authenticator);
        v13 = obj;
        if (WeakRetained && v4)
        {
          if (self->_evaluationState && (delegateResponderCache & 1) != 0)
          {
            objc_msgSend(WeakRetained, "authenticator:didTransitionToEvaluationStateWithEvent:", v12, 0, 0);
            v13 = obj;
          }
          if (self->_coachingState && (delegateResponderCache & 2) != 0)
          {
            objc_msgSend(WeakRetained, "authenticator:didTransitionToCoachingState:", v12, 0);
            v13 = obj;
          }
        }
        if (v13)
        {
          v14 = (char)self->_delegateResponderCache;
          if ((v14 & 1) != 0)
          {
            objc_msgSend(obj, "authenticator:didTransitionToEvaluationStateWithEvent:", v12, self->_evaluationState, self->_lastAnnotation);
            v14 = (char)self->_delegateResponderCache;
          }
          if ((v14 & 2) != 0)
            objc_msgSend(obj, "authenticator:didTransitionToCoachingState:", v12, self->_coachingState);
        }

      }
    }

    v6 = obj;
  }

}

- (BOOL)_delegateSupportsPasscodePresentation
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_delegateSupportsPasscodeDismissal
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_delegateSupportsPassphrasePresentation
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_delegateSupportsPassphraseDismissal
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)_updateEvaluationState
{
  BOOL v3;
  BOOL v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t evaluationFlags;
  unint64_t activeMechanisms;

  v3 = self->_acquireUserIntent && (self->_completedMechanisms & 0x10) == 0;
  if (v3 || (self->_acquireSecondaryUserIntent ? (v4 = (self->_completedMechanisms & 0x21) == 1) : (v4 = 0), v4))
  {
    v6 = 3;
  }
  else
  {
    v5 = self->_completedMechanisms & 0xC;
    if (-[PKAuthenticatorEvaluationRequest assumeBiometricOrPasscodeAvailable](self->_request, "assumeBiometricOrPasscodeAvailable"))
    {
      if (v5 || (self->_completedMechanisms & 3) != 0)
      {
        v6 = 5;
        goto LABEL_14;
      }
      evaluationFlags = self->_evaluationFlags;
      if ((evaluationFlags & 0xE) != 2)
      {
LABEL_22:
        if ((evaluationFlags & 9) == 1)
        {
          if (self->_evaluationState == 2)
            v6 = 2;
          else
            v6 = 1;
        }
        else
        {
          activeMechanisms = self->_activeMechanisms;
          if ((activeMechanisms & 0xC) != 0)
          {
            v6 = 0;
          }
          else if ((self->_presentationFlags & 2) != 0
                 || self->_passcodePresentationRequested
                 || !activeMechanisms
                 || self->_automaticallyPresentPasscodeOnce)
          {
            v6 = 4 * (self->_evaluationState != 0);
          }
          else
          {
            v6 = 4;
          }
        }
        goto LABEL_14;
      }
    }
    else
    {
      evaluationFlags = self->_evaluationFlags;
      if ((evaluationFlags & 0xE) != 2 && (!v5 || (evaluationFlags & 4) != 0))
        goto LABEL_22;
    }
    v6 = 2;
  }
LABEL_14:
  if ((self->_evaluationFlags & 0xB) == 8)
    self->_evaluationFlags &= ~8uLL;
  -[PKAuthenticatorEvaluationContext _setEvaluationStateWithEvent:](self, "_setEvaluationStateWithEvent:", v6, 0);
}

- (void)_setEvaluationStateWithEvent:(id)a3
{
  int64_t var1;
  int64_t var0;
  int64_t evaluationState;
  unint64_t v7;
  BOOL v8;
  unsigned __int8 v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  PKBannerHandle *v17;
  void *v18;
  void *v19;
  PKBannerHandle *v20;
  PKBannerHandle *v21;
  PKBannerHandle *banner;
  PKBannerHandle *v23;
  id v24;
  id WeakRetained;

  var1 = a3.var1;
  var0 = a3.var0;
  evaluationState = self->_evaluationState;
  if (a3.var0)
  {
    if (evaluationState == a3.var0)
      return;
  }
  else
  {
    v7 = a3.var1 - 1;
    if (evaluationState)
      v8 = 0;
    else
      v8 = v7 >= 2;
    if (v8 && (self->_lastAnnotation || v7 >= 3))
      return;
  }
  self->_evaluationState = a3.var0;
  self->_lastAnnotation = a3.var1;
  if (!self->_invalidated)
  {
    v10 = atomic_load((unsigned __int8 *)&self->_evaluating);
    if ((v10 & 1) != 0)
    {
      if (PKSystemApertureIsAvailable())
      {
        v11 = self->_evaluationState;
        if (v11 == 2)
        {
          v13 = (void *)MEMORY[0x24BE6EB08];
          v14 = 2;
        }
        else
        {
          if (v11 != 1)
          {
            if (v11)
            {
              v15 = 0;
              goto LABEL_35;
            }
            if (self->_lastAnnotation)
              v12 = 4;
            else
              v12 = 0;
            v15 = (void *)objc_msgSend(MEMORY[0x24BE6EB08], "createForGlyphState:", v12);
            v16 = 1;
            if (!v15)
            {
LABEL_35:
              banner = self->_banner;
              if (banner)
              {
                -[PKBannerHandle invalidate](banner, "invalidate");
                v23 = self->_banner;
                self->_banner = 0;

              }
              goto LABEL_37;
            }
LABEL_30:
            v17 = self->_banner;
            if (v17 && !-[PKBannerHandle isInvalidated](v17, "isInvalidated"))
            {
              -[PKBannerHandle setState:](self->_banner, "setState:", v15);
            }
            else
            {
              v18 = (void *)MEMORY[0x24BE6EA40];
              v19 = (void *)objc_msgSend(MEMORY[0x24BE6EB00], "create");
              v20 = (PKBannerHandle *)objc_msgSend(v18, "createHandleForRequest:queue:", v19, MEMORY[0x24BDAC9B8]);
              v21 = self->_banner;
              self->_banner = v20;

              -[PKBannerHandle setState:](self->_banner, "setState:", v15);
              -[PKBannerHandle displayWithCompletion:](self->_banner, "displayWithCompletion:", 0);
            }
            if (!v16)
            {
LABEL_37:

              goto LABEL_38;
            }
            goto LABEL_35;
          }
          v13 = (void *)MEMORY[0x24BE6EB08];
          v14 = 1;
        }
        v15 = (void *)objc_msgSend(v13, "createForGlyphState:", v14);
        v16 = 0;
        if (!v15)
          goto LABEL_35;
        goto LABEL_30;
      }
    }
  }
LABEL_38:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if ((*(_BYTE *)&self->_delegateResponderCache & 1) != 0)
    {
      v24 = objc_loadWeakRetained((id *)&self->_authenticator);
      objc_msgSend(WeakRetained, "authenticator:didTransitionToEvaluationStateWithEvent:", v24, var0, var1);

    }
  }
  -[PKAuthenticatorEvaluationContext _updateCoachingState](self, "_updateCoachingState");

}

- (void)_updateCoachingState
{
  uint64_t v3;

  if ((self->_completedMechanisms & 4) != 0 || (unint64_t)(self->_evaluationState - 1) > 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = 0;
    switch(self->_coachingStatus)
    {
      case 3:
        v3 = 1;
        break;
      case 4:
        v3 = 2;
        break;
      case 8:
        if (PKIsPad())
          v3 = 4;
        else
          v3 = 0;
        break;
      case 0xBLL:
        v3 = 3;
        break;
      default:
        break;
    }
  }
  -[PKAuthenticatorEvaluationContext _setCoachingState:](self, "_setCoachingState:", v3);
}

- (void)_setCoachingState:(int64_t)a3
{
  int64_t coachingState;
  LAContext *LAContext;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  id v9;
  id v10;

  coachingState = self->_coachingState;
  if (coachingState == a3)
    return;
  self->_coachingState = a3;
  if (!a3 || coachingState)
  {
    if (a3 || !coachingState)
      goto LABEL_9;
    LAContext = self->_LAContext;
    v6 = &__block_literal_global_221;
    v7 = 0;
  }
  else
  {
    LAContext = self->_LAContext;
    v6 = &__block_literal_global_220;
    v7 = 1;
  }
  -[LAContext setShowingCoachingHint:event:reply:](LAContext, "setShowingCoachingHint:event:reply:", v7, 7, v6);
LABEL_9:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if ((*(_BYTE *)&self->_delegateResponderCache & 2) != 0)
    {
      v10 = WeakRetained;
      v9 = objc_loadWeakRetained((id *)&self->_authenticator);
      objc_msgSend(v10, "authenticator:didTransitionToCoachingState:", v9, self->_coachingState);

      WeakRetained = v10;
    }
  }

}

- (BOOL)fingerPresent
{
  _BOOL4 v3;

  if ((PKPearlIsAvailable() & 1) != 0)
    LOBYTE(v3) = 0;
  else
    return (LOBYTE(self->_evaluationFlags) >> 1) & 1;
  return v3;
}

- (BOOL)biometricMatch
{
  return (self->_completedMechanisms & 0xC) != 0;
}

- (BOOL)passcodeActive
{
  return self->_activeMechanisms & 1;
}

- (BOOL)passphraseActive
{
  return (LOBYTE(self->_activeMechanisms) >> 1) & 1;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (PKAuthenticatorEvaluationRequest)request
{
  return self->_request;
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (BOOL)isPolicySupported
{
  return self->_policySupported;
}

- (BOOL)forceApplePayCheck
{
  return self->_forceApplePayCheck;
}

- (BOOL)forceSkipUserIntent
{
  return self->_forceSkipUserIntent;
}

- (int64_t)policy
{
  return self->_policy;
}

- (int64_t)evaluationState
{
  return self->_evaluationState;
}

- (int64_t)coachingState
{
  return self->_coachingState;
}

- (unint64_t)presentationFlags
{
  return self->_presentationFlags;
}

- (PKAuthenticatorDelegate)delegate
{
  return (PKAuthenticatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong((id *)&self->_accessHandlers, 0);
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_passcodePresentationParameters, 0);
  objc_storeStrong((id *)&self->_liftFingerTimeout, 0);
  objc_storeStrong((id *)&self->_matchingDelayTimeout, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_authenticator);
}

@end
