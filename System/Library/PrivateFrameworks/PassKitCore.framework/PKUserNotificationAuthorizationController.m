@implementation PKUserNotificationAuthorizationController

- (unint64_t)_contentTypeToDisplayWithPasses:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  char v7;
  BOOL v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v3)
  {
    v17 = 0;
    goto LABEL_36;
  }
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        v14 = v13;
        if ((v9 & 1) != 0 || objc_msgSend(v13, "cardType") == 1 || objc_msgSend(v14, "isEMoneyPass"))
        {
          v9 = 1;
          if ((v5 & 1) != 0)
            goto LABEL_11;
LABEL_18:
          v5 = objc_msgSend(v14, "isAppleCardPass");
          if ((v6 & 1) != 0)
            goto LABEL_19;
LABEL_12:
          v6 = objc_msgSend(v14, "isTransitPass");
          if ((v7 & 1) == 0)
            goto LABEL_13;
LABEL_20:
          v7 = 1;
        }
        else
        {
          v9 = 0;
          if ((v5 & 1) == 0)
            goto LABEL_18;
LABEL_11:
          v5 = 1;
          if ((v6 & 1) == 0)
            goto LABEL_12;
LABEL_19:
          v6 = 1;
          if ((v7 & 1) != 0)
            goto LABEL_20;
LABEL_13:
          v7 = objc_msgSend(v14, "isIdentityPass");
        }

        continue;
      }
      v8 = v8 || objc_msgSend(v12, "style") == 4;
    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v4);
  v15 = 2;
  if ((v6 & 1) == 0)
    v15 = 3;
  if ((v5 & 1) != 0)
    v15 = 1;
  v16 = 5;
  if (!v8)
    v16 = 0;
  if ((v9 & 1) != 0)
    v16 = 4;
  if ((((v5 | v6) | v7) & 1) != 0)
    v17 = v15;
  else
    v17 = v16;
LABEL_36:

  return v17;
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_3;
  v13[3] = &unk_1E2AC7198;
  v8 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 48);
  v16 = v7;
  v17 = v10;
  v14 = v9;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "_authorizationStatusRequiresPromptWithCompletion:", v13);

}

void __59__PKUserNotificationAuthorizationController_sharedInstance__block_invoke()
{
  PKUserNotificationAuthorizationController *v0;
  void *v1;

  v0 = objc_alloc_init(PKUserNotificationAuthorizationController);
  v1 = (void *)_MergedGlobals_209;
  _MergedGlobals_209 = (uint64_t)v0;

}

- (void)shouldOfferAuthorizationPromptWithPasses:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKAsyncUnaryOperationComposer *v8;
  NSObject *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  char v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  PKUserNotificationAuthorizationController *v33;
  id v34;
  _QWORD *v35;
  uint64_t *v36;
  _QWORD *v37;
  unint64_t v38;
  char v39;
  _QWORD v40[4];
  NSObject *v41;
  _QWORD *v42;
  _QWORD *v43;
  char v44;
  _QWORD v45[4];
  NSObject *v46;
  PKUserNotificationAuthorizationController *v47;
  id v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t *v51;
  _QWORD v52[4];
  NSObject *v53;
  id v54;
  PKUserNotificationAuthorizationController *v55;
  _QWORD *v56;
  _QWORD *v57;
  char v58;
  _QWORD v59[4];
  NSObject *v60;
  id v61;
  _QWORD *v62;
  _QWORD v63[4];
  NSObject *v64;
  PKUserNotificationAuthorizationController *v65;
  _QWORD *v66;
  _QWORD v67[4];
  NSObject *v68;
  _QWORD *v69;
  uint8_t buf[8];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  unint64_t v74;
  _QWORD v75[3];
  char v76;
  _QWORD v77[5];
  id v78;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x3032000000;
    v77[3] = __Block_byref_object_copy__17;
    v77[4] = __Block_byref_object_dispose__17;
    v78 = 0;
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x2020000000;
    v76 = 0;
    v71 = 0;
    v72 = &v71;
    v73 = 0x2020000000;
    v74 = 0;
    v74 = -[PKUserNotificationAuthorizationController _contentTypeToDisplayWithPasses:](self, "_contentTypeToDisplayWithPasses:", v6);
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v11 = PKGetNotificationAuthorizationPromptCount();
    +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "notificationAuthorizationPromptPresentationCount");

    if (v11 >= v15)
      v16 = 1;
    else
      v16 = PKHasPromptedNotificationAuthorizationForContentType(v72[3]);
    v17 = PKBypassNotificationAuthorizationPromptCount();
    v18 = MEMORY[0x1E0C809B0];
    if (v17)
    {
      PKLogFacilityTypeGetObject(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: bypassing notification count & delay due to toggle", buf, 2u);
      }
      v16 = 0;
    }
    else
    {
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke;
      v67[3] = &unk_1E2AC7148;
      v20 = v9;
      v68 = v9;
      v69 = v77;
      -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v67);
      v19 = v68;
    }

    v63[0] = v18;
    v63[1] = 3221225472;
    v63[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_2;
    v63[3] = &unk_1E2AC71C0;
    v21 = v9;
    v64 = v9;
    v65 = self;
    v66 = v77;
    -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v63);
    v59[0] = v18;
    v59[1] = 3221225472;
    v59[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_5;
    v59[3] = &unk_1E2AC71C0;
    v22 = v9;
    v60 = v9;
    v23 = v6;
    v61 = v23;
    v62 = v77;
    -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v59);
    v52[0] = v18;
    v52[1] = 3221225472;
    v52[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_6;
    v52[3] = &unk_1E2AC7238;
    v24 = v9;
    v53 = v9;
    v25 = v23;
    v58 = v16;
    v54 = v25;
    v55 = self;
    v56 = v75;
    v57 = v77;
    -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v52);
    v45[0] = v18;
    v45[1] = 3221225472;
    v45[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_9;
    v45[3] = &unk_1E2AC72B0;
    v26 = v9;
    v46 = v9;
    v47 = self;
    v48 = v25;
    v49 = v75;
    v50 = v77;
    v51 = &v71;
    -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v45);
    v40[0] = v18;
    v40[1] = 3221225472;
    v40[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_12;
    v40[3] = &unk_1E2AC72D8;
    v27 = v9;
    v44 = v16;
    v41 = v9;
    v42 = v77;
    v43 = v75;
    -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v40);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v18;
    v31[1] = 3221225472;
    v31[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_13;
    v31[3] = &unk_1E2AC7300;
    v29 = v9;
    v32 = v9;
    v33 = self;
    v35 = v75;
    v36 = &v71;
    v39 = v16;
    v37 = v77;
    v38 = v11;
    v34 = v7;
    v30 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v8, "evaluateWithInput:completion:", v28, v31);

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(v75, 8);
    _Block_object_dispose(v77, 8);

  }
}

- (PKUserNotificationAuthorizationController)init
{
  PKUserNotificationAuthorizationController *v2;
  uint64_t v3;
  UNUserNotificationCenter *center;
  uint64_t v5;
  NSHashTable *delegates;
  PKPaymentService *v7;
  PKPaymentService *paymentService;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKUserNotificationAuthorizationController;
  v2 = -[PKUserNotificationAuthorizationController init](&v10, sel_init);
  if (v2)
  {
    if (PKRunningInPassbook())
    {
      objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.Passbook"));
    }
    center = v2->_center;
    v2->_center = (UNUserNotificationCenter *)v3;

    -[UNUserNotificationCenter setDelegate:](v2->_center, "setDelegate:", v2);
    v2->_delegatesLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v5 = objc_claimAutoreleasedReturnValue();
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v5;

    v7 = objc_alloc_init(PKPaymentService);
    paymentService = v2->_paymentService;
    v2->_paymentService = v7;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1ECF22360 != -1)
    dispatch_once(&qword_1ECF22360, &__block_literal_global_47);
  return (id)_MergedGlobals_209;
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (**v6)(id, id, uint64_t);
  void *v7;
  double v8;
  double v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  PKLastUserNotificationAuthorizationPromptDate();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceNow");
  v9 = fabs(v8);
  v10 = v9 >= 600.0 || v7 == 0;
  v11 = !v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not required as it was presented in the last seconds: %lu"), (unint64_t)v9);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  v6[2](v6, v15, v11);

}

- (void)addDelegate:(id)a3
{
  os_unfair_lock_s *p_delegatesLock;
  id v5;

  if (a3)
  {
    p_delegatesLock = &self->_delegatesLock;
    v5 = a3;
    os_unfair_lock_lock(p_delegatesLock);
    -[NSHashTable addObject:](self->_delegates, "addObject:", v5);

    os_unfair_lock_unlock(p_delegatesLock);
  }
}

- (void)authorizationStatusWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  UNUserNotificationCenter *center;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    PKLogFacilityTypeGetObject(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: getting notification settings", buf, 2u);
    }

    center = self->_center;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__PKUserNotificationAuthorizationController_authorizationStatusWithCompletion___block_invoke;
    v7[3] = &unk_1E2AC74F8;
    v8 = v4;
    -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:](center, "getNotificationSettingsWithCompletionHandler:", v7);

  }
}

void __79__PKUserNotificationAuthorizationController_authorizationStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: notification settings: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(_QWORD, uint64_t, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v3, "authorizationStatus"), v3 != 0);
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_12(uint64_t a1, uint64_t a2, void *a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  if (*(_BYTE *)(a1 + 56))
  {
    ((void (**)(_QWORD, void *, _QWORD))a4)[2](a4, a3, 0);
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = CFSTR("new content type");
    v8 = a4;
    v9 = a3;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    (*((void (**)(id, id, uint64_t))v8 + 2))(v8, v9, 1);
  }

}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_3(uint64_t a1, char a2)
{
  NSObject *v3;
  id v4;
  __int128 v5;
  _QWORD block[4];
  id v7;
  __int128 v8;
  char v9;

  v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_4;
  block[3] = &unk_1E2AC7170;
  v9 = a2;
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v8 = v5;
  v7 = *(id *)(a1 + 40);
  dispatch_async(v3, block);

}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_13(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  unint64_t v15;
  const __CFString *v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }
  else if (*(_BYTE *)(a1 + 88))
  {
    *(_BYTE *)(v8 + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not required as the presentation count limit has been reached presented: %lu times"), *(_QWORD *)(a1 + 80));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  PKLogFacilityTypeGetObject(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("YES");
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v13 = CFSTR("NO");
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) - 1;
    if (v15 > 5)
      v16 = CFSTR("generic");
    else
      v16 = off_1E2AC7518[v15];
    *(_DWORD *)buf = 138543874;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    v21 = 2114;
    v22 = v16;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: shouldOfferAuthorizationPromptWithDataProvider %{public}@ reason: %@, contentType %{public}@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_4(uint64_t a1)
{
  uint64_t (*v2)(void);
  uint64_t v3;
  void *v4;

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = CFSTR("Authorization status");

    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v2();
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (**v6)(id, id, BOOL);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (!v7)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = CFSTR("0 passes");

  }
  v6[2](v6, v10, v7 == 0);

}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  void (**v15)(id, id, _QWORD);
  __int128 v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secureElementPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(*(id *)(a1 + 40), "count") != 1 || v9 == 0;
  if (v10 || !objc_msgSend(v9, "hasAssociatedPeerPaymentAccount") || *(_BYTE *)(a1 + 72))
  {
    v7[2](v7, v6, 0);
  }
  else
  {
    v11 = *(void **)(a1 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_7;
    v12[3] = &unk_1E2AC7210;
    v13 = *(id *)(a1 + 32);
    v16 = *(_OWORD *)(a1 + 56);
    v15 = v7;
    v14 = v6;
    objc_msgSend(v11, "_shouldOfferAuthorizationPromptForPeerPaymentReasonWithPeerPaymentPass:completion:", v9, v12);

  }
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_8;
  block[3] = &unk_1E2AC71E8;
  v15 = a2;
  v14 = *(_QWORD *)(a1 + 64);
  v11 = v5;
  v9 = *(_OWORD *)(a1 + 48);
  v7 = (id)v9;
  v13 = v9;
  v12 = *(id *)(a1 + 40);
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_8(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(a1 + 72);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  __int128 v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v9 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_10;
  v13[3] = &unk_1E2AC7288;
  v10 = *(id *)(a1 + 32);
  v17 = *(_OWORD *)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 72);
  v15 = v6;
  v16 = v7;
  v14 = v10;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "_shouldOfferAuthorizationPromptForPayLaterReasonWithPasses:completion:", v8, v13);

}

void __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_10(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  char v15;

  v5 = a3;
  block[1] = 3221225472;
  v9 = *(_OWORD *)(a1 + 48);
  v14 = *(_OWORD *)(a1 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  v6 = *(NSObject **)(a1 + 32);
  block[2] = __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_11;
  block[3] = &unk_1E2AC7260;
  v15 = a2;
  v11 = v5;
  v7 = (id)v9;
  v13 = v9;
  v12 = *(id *)(a1 + 40);
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __97__PKUserNotificationAuthorizationController_shouldOfferAuthorizationPromptWithPasses_completion___block_invoke_11(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(a1 + 80);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 6;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_shouldOfferAuthorizationPromptForPeerPaymentReasonWithPeerPaymentPass:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD, _QWORD, _QWORD);

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (v6)
  {
    if (v5)
    {
      objc_msgSend(v5, "devicePrimaryPaymentApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __127__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPeerPaymentReasonWithPeerPaymentPass_completion___block_invoke;
        v10[3] = &unk_1E2AC7328;
        v11 = v7;
        objc_msgSend(v9, "accountWithCompletion:", v10);

      }
      else
      {
        ((void (**)(_QWORD, _QWORD, const __CFString *))v7)[2](v7, 0, CFSTR("Apple Cash is ghost pass"));
      }
    }
    else
    {
      (*((void (**)(id, _QWORD, const __CFString *))v6 + 2))(v6, 0, CFSTR("no apple cash pass"));
    }
  }

}

void __127__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPeerPaymentReasonWithPeerPaymentPass_completion___block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "stage") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (objc_msgSend(v5, "state"))
    {
      v3 = CFSTR("Apple Cash setup");
      v4 = 1;
    }
    else
    {
      v3 = CFSTR("Apple Cash has invalid account state");
      v4 = 0;
    }
    (*(void (**)(_QWORD, uint64_t, const __CFString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v4, v3);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_shouldOfferAuthorizationPromptForPayLaterReasonWithPasses:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, const __CFString *);
  PKAsyncUnaryOperationComposer *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  void (**v15)(id, _QWORD, const __CFString *);
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[5];
  id v33;

  v5 = a3;
  v6 = (void (**)(id, _QWORD, const __CFString *))a4;
  if (v6)
  {
    if ((objc_msgSend(v5, "pk_containsObjectPassingTest:", &__block_literal_global_68) & 1) != 0)
    {
      if (PKHasPromptedNotificationAuthorizationForContentType(6))
      {
        v6[2](v6, 0, CFSTR("has already prompted for delinquent pay later financing plan"));
      }
      else
      {
        v7 = objc_alloc_init(PKAsyncUnaryOperationComposer);
        +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = 0;
        v32[1] = v32;
        v32[2] = 0x3032000000;
        v32[3] = __Block_byref_object_copy__17;
        v32[4] = __Block_byref_object_dispose__17;
        v33 = 0;
        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x2020000000;
        v31 = 0;
        v28[0] = 0;
        v28[1] = v28;
        v28[2] = 0x3032000000;
        v28[3] = __Block_byref_object_copy__17;
        v28[4] = __Block_byref_object_dispose__17;
        v29 = 0;
        v9 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_2;
        v23[3] = &unk_1E2AC7408;
        v10 = v8;
        v24 = v10;
        v26 = v28;
        v27 = v32;
        v25 = v5;
        -[PKAsyncUnaryOperationComposer addOperation:](v7, "addOperation:", v23);
        v18[0] = v9;
        v18[1] = 3221225472;
        v18[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_6;
        v18[3] = &unk_1E2AC7480;
        v20 = v32;
        v11 = v10;
        v19 = v11;
        v21 = v30;
        v22 = v28;
        -[PKAsyncUnaryOperationComposer addOperation:](v7, "addOperation:", v18);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_3_86;
        v14[3] = &unk_1E2AC74A8;
        v15 = v6;
        v16 = v30;
        v17 = v28;
        v13 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v7, "evaluateWithInput:completion:", v12, v14);

        _Block_object_dispose(v28, 8);
        _Block_object_dispose(v30, 8);
        _Block_object_dispose(v32, 8);

      }
    }
    else
    {
      v6[2](v6, 0, CFSTR("no passes with an account"));
    }
  }

}

BOOL __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "paymentPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "associatedAccountServiceAccountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

void __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_3;
  v11[3] = &unk_1E2AC73E0;
  v14 = v7;
  v12 = v6;
  v15 = *(_OWORD *)(a1 + 48);
  v8 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "defaultAccountForFeature:completion:", 3, v11);

}

void __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_4;
  block[3] = &unk_1E2AC73B8;
  v10 = v3;
  v8 = *(_OWORD *)(a1 + 48);
  v4 = (id)v8;
  v13 = v8;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 64);
  v11 = v5;
  v14 = v6;
  v12 = *(id *)(a1 + 40);
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 32));
    v2 = *(void **)(a1 + 48);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_5;
    v8[3] = &unk_1E2AC7390;
    v9 = v7;
    if ((objc_msgSend(v2, "pk_containsObjectPassingTest:", v8) & 1) == 0)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = CFSTR("no pay later pass");

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = CFSTR("no pay later account");

    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
  }

}

uint64_t __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a2, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associatedAccountServiceAccountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
      v9 = objc_msgSend(v6, "isEqualToString:", v7);
  }

  return v9;
}

void __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  PKAccountServicePayLaterFinancingPlanQuery *v8;
  void *v9;
  PKAccountServicePayLaterFinancingPlanQuery *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;

  v6 = a3;
  v7 = a4;
  v8 = [PKAccountServicePayLaterFinancingPlanQuery alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKAccountServicePayLaterFinancingPlanQuery initWithAccountIdentifier:queryItems:](v8, "initWithAccountIdentifier:queryItems:", v9, 64);

  -[PKAccountServicePayLaterFinancingPlanQuery setCountFinancingPlanStates:](v10, "setCountFinancingPlanStates:", &unk_1E2C3DE10);
  v11 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_81;
  v14[3] = &unk_1E2AC7458;
  v15 = v6;
  v16 = v7;
  v17 = *(_OWORD *)(a1 + 48);
  v12 = v6;
  v13 = v7;
  objc_msgSend(v11, "financingPlansWithQuery:completion:", v10, v14);

}

void __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  __int128 v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_2_82;
  block[3] = &unk_1E2AC7430;
  v6 = v3;
  v8 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 48);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_2_82(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "financingPlanCount"))
  {
    PKSetHasPromptedNotificationAuthorizationForContentType(6, 1);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = CFSTR("has delinquent pay later loan");

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __115__PKUserNotificationAuthorizationController__shouldOfferAuthorizationPromptForPayLaterReasonWithPasses_completion___block_invoke_3_86(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_authorizationStatusRequiresPromptWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    PKLogFacilityTypeGetObject(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: _authorizationStatusRequiresPromptWithCompletion", buf, 2u);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __94__PKUserNotificationAuthorizationController__authorizationStatusRequiresPromptWithCompletion___block_invoke;
    v6[3] = &unk_1E2AC74D0;
    v7 = v4;
    -[PKUserNotificationAuthorizationController authorizationStatusWithCompletion:](self, "authorizationStatusWithCompletion:", v6);

  }
}

uint64_t __94__PKUserNotificationAuthorizationController__authorizationStatusRequiresPromptWithCompletion___block_invoke(uint64_t a1, unint64_t a2, int a3)
{
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (0x19u >> a2) & 1;
  if (!a3)
    v4 = 0;
  if (a2 <= 4)
    v5 = v4;
  else
    v5 = 0;
  PKLogFacilityTypeGetObject(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: _authorizationStatusRequiresPromptWithCompletion requiresPrompt: %@", (uint8_t *)&v9, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestNotificationAuthorizationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  PKPaymentService *paymentService;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: requesting authoirzation", buf, 2u);
  }

  paymentService = self->_paymentService;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__PKUserNotificationAuthorizationController_requestNotificationAuthorizationWithCompletion___block_invoke;
  v8[3] = &unk_1E2ABE148;
  v9 = v4;
  v7 = v4;
  -[PKPaymentService requestNotificationAuthorizationWithCompletion:](paymentService, "requestNotificationAuthorizationWithCompletion:", v8);

}

void __92__PKUserNotificationAuthorizationController_requestNotificationAuthorizationWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: requestAuthorizationWithOptions success: %@ error: %@", buf, 0x16u);
  }

  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__PKUserNotificationAuthorizationController_requestNotificationAuthorizationWithCompletion___block_invoke_90;
    block[3] = &unk_1E2ABDAB8;
    v11 = v8;
    v12 = a2;
    v10 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __92__PKUserNotificationAuthorizationController_requestNotificationAuthorizationWithCompletion___block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)setPresentedNotificationAuthorizationPromptShown
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: presentation count incremented", v5, 2u);
  }

  PKIncrementNotificationAuthorizationPromptCount();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKSetLastUserNotificationAuthorizationPromptDate(v4);

  PKSetHasPromptedNotificationAuthorizationForContentType(self->_previouslyCheckedContentType, 1);
}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_delegatesLock;
  id v5;

  if (a3)
  {
    p_delegatesLock = &self->_delegatesLock;
    v5 = a3;
    os_unfair_lock_lock(p_delegatesLock);
    -[NSHashTable removeObject:](self->_delegates, "removeObject:", v5);

    os_unfair_lock_unlock(p_delegatesLock);
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_unfair_lock_s *p_delegatesLock;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v8 = a4;
  v9 = a5;
  PKLogFacilityTypeGetObject(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v8;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: willPresentNotification: %@", buf, 0xCu);
  }

  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_delegatesLock);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    v17 = MEMORY[0x1E0C809B0];
    v18 = MEMORY[0x1E0C80D38];
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19);
        block[0] = v17;
        block[1] = 3221225472;
        block[2] = __114__PKUserNotificationAuthorizationController_userNotificationCenter_willPresentNotification_withCompletionHandler___block_invoke;
        block[3] = &unk_1E2ABE030;
        block[4] = v20;
        v23 = v8;
        v24 = v9;
        dispatch_async(v18, block);

        ++v19;
      }
      while (v15 != v19);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16, v21);
    }
    while (v15);
  }

}

uint64_t __114__PKUserNotificationAuthorizationController_userNotificationCenter_willPresentNotification_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "willPresentNotification:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_unfair_lock_s *p_delegatesLock;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: openSettingsForNotification : %@", buf, 0xCu);
  }

  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_delegatesLock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    v15 = MEMORY[0x1E0C809B0];
    v16 = MEMORY[0x1E0C80D38];
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17);
        v19[0] = v15;
        v19[1] = 3221225472;
        v19[2] = __96__PKUserNotificationAuthorizationController_userNotificationCenter_openSettingsForNotification___block_invoke;
        v19[3] = &unk_1E2ABE0D0;
        v19[4] = v18;
        v20 = v7;
        dispatch_async(v16, v19);

        ++v17;
      }
      while (v13 != v17);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

}

uint64_t __96__PKUserNotificationAuthorizationController_userNotificationCenter_openSettingsForNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "openSettingsForNotification:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  PKPaymentService *paymentService;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  PKLogFacilityTypeGetObject(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v9;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKUserNotificationAuthorizationController: didReceiveNotificationResponse: %@", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(v9, "actionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = PKUserNotificationActionFromUNNotificationActionIdentifier(v12);

  paymentService = self->_paymentService;
  objc_msgSend(v9, "notification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentService userNotificationActionPerformed:applicationMessageContentIdentifier:completion:](paymentService, "userNotificationActionPerformed:applicationMessageContentIdentifier:completion:", v13, v17, 0);

  if (v10)
    v10[2](v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_center, 0);
}

@end
