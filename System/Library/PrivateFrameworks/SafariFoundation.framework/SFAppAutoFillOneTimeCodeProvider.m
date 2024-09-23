@implementation SFAppAutoFillOneTimeCodeProvider

uint64_t __65__SFAppAutoFillOneTimeCodeProvider_removeObserverForOneTimeCode___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_stopGeneratorTimer");
  return result;
}

- (void)removeObserverForOneTimeCode:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__SFAppAutoFillOneTimeCodeProvider_removeObserverForOneTimeCode___block_invoke;
  v7[3] = &unk_24C935280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

- (void)_stopGeneratorTimer
{
  NSObject *v3;
  NSTimer *generatorTimer;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20E365000, v3, OS_LOG_TYPE_INFO, "Stopping generator observer timer.", v5, 2u);
  }
  -[NSTimer invalidate](self->_generatorTimer, "invalidate");
  generatorTimer = self->_generatorTimer;
  self->_generatorTimer = 0;

}

- (SFAppAutoFillOneTimeCodeProvider)init
{
  return -[SFAppAutoFillOneTimeCodeProvider initWithOptions:](self, "initWithOptions:", 0);
}

- (SFAppAutoFillOneTimeCodeProvider)initWithOptions:(unint64_t)a3
{
  char v3;
  SFAppAutoFillOneTimeCodeProvider *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  uint64_t v7;
  NSMutableDictionary *currentReceivedOneTimeCodesBySource;
  void *v9;
  objc_class *v10;
  id v11;
  uint64_t v12;
  IMOneTimeCodeAccelerator *messagesOneTimeCodeAccelerator;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  id v17;
  uint64_t v18;
  EMOneTimeCodeAccelerator *mailOneTimeCodeAccelerator;
  SFAppAutoFillOneTimeCodeProvider *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;
  uint64_t v28;
  uint64_t v29;
  Class (*v30)(uint64_t);
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v3 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SFAppAutoFillOneTimeCodeProvider;
  v4 = -[SFAppAutoFillOneTimeCodeProvider init](&v27, sel_init);
  if (v4)
  {
    objc_initWeak(&location, v4);
    v5 = dispatch_queue_create("com.apple.SafariFoundation.SFAppAutoFillOneTimeCodeProvider.internal", 0);
    internalQueue = v4->_internalQueue;
    v4->_internalQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    currentReceivedOneTimeCodesBySource = v4->_currentReceivedOneTimeCodesBySource;
    v4->_currentReceivedOneTimeCodesBySource = (NSMutableDictionary *)v7;

    if ((v3 & 1) == 0)
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x2050000000;
      v9 = (void *)getIMOneTimeCodeAcceleratorClass_softClass;
      v36 = getIMOneTimeCodeAcceleratorClass_softClass;
      if (!getIMOneTimeCodeAcceleratorClass_softClass)
      {
        v28 = MEMORY[0x24BDAC760];
        v29 = 3221225472;
        v30 = __getIMOneTimeCodeAcceleratorClass_block_invoke;
        v31 = &unk_24C9356D8;
        v32 = &v33;
        __getIMOneTimeCodeAcceleratorClass_block_invoke((uint64_t)&v28);
        v9 = (void *)v34[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v33, 8);
      v11 = [v10 alloc];
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke;
      v24[3] = &unk_24C9352A8;
      objc_copyWeak(&v25, &location);
      v12 = objc_msgSend(v11, "initWithBlockForUpdates:", v24);
      messagesOneTimeCodeAccelerator = v4->_messagesOneTimeCodeAccelerator;
      v4->_messagesOneTimeCodeAccelerator = (IMOneTimeCodeAccelerator *)v12;

      -[SFAppAutoFillOneTimeCodeProvider _fetchOneTimeCodeAutoDeletionPreference](v4, "_fetchOneTimeCodeAutoDeletionPreference");
      objc_destroyWeak(&v25);
    }
    if ((v3 & 2) == 0)
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x2050000000;
      v14 = (void *)getEMOneTimeCodeAcceleratorClass_softClass;
      v36 = getEMOneTimeCodeAcceleratorClass_softClass;
      v15 = MEMORY[0x24BDAC760];
      if (!getEMOneTimeCodeAcceleratorClass_softClass)
      {
        v28 = MEMORY[0x24BDAC760];
        v29 = 3221225472;
        v30 = __getEMOneTimeCodeAcceleratorClass_block_invoke;
        v31 = &unk_24C9356D8;
        v32 = &v33;
        __getEMOneTimeCodeAcceleratorClass_block_invoke((uint64_t)&v28);
        v14 = (void *)v34[3];
      }
      v16 = objc_retainAutorelease(v14);
      _Block_object_dispose(&v33, 8);
      v17 = [v16 alloc];
      v22[0] = v15;
      v22[1] = 3221225472;
      v22[2] = __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke_3;
      v22[3] = &unk_24C9352F8;
      objc_copyWeak(&v23, &location);
      v18 = objc_msgSend(v17, "initWithUpdateBlock:", v22);
      mailOneTimeCodeAccelerator = v4->_mailOneTimeCodeAccelerator;
      v4->_mailOneTimeCodeAccelerator = (EMOneTimeCodeAccelerator *)v18;

      objc_destroyWeak(&v23);
    }
    v20 = v4;
    objc_destroyWeak(&location);
  }

  return v4;
}

void __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[7];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke_2;
    v7[3] = &unk_24C935280;
    v8 = WeakRetained;
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

void __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_processOneTimeCodeFromMessages:", v2);

}

void __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  _QWORD *WeakRetained;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  _QWORD *v13;
  id v14;
  id v15;
  uint64_t v16;

  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    v11 = WeakRetained[7];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke_4;
    v12[3] = &unk_24C9352D0;
    v13 = WeakRetained;
    v14 = v7;
    v15 = v8;
    v16 = a4;
    dispatch_async(v11, v12);

  }
}

uint64_t __52__SFAppAutoFillOneTimeCodeProvider_initWithOptions___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processOneTimeCodeFromMail:withTimestamp:andMessageID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)didFocusOneTimeCodeField
{
  -[EMOneTimeCodeAccelerator didEnterOneTimeCodeField](self->_mailOneTimeCodeAccelerator, "didEnterOneTimeCodeField");
}

- (id)currentOneTimeCodesWithAuditToken:(id *)a3 website:(id)a4 usernameHint:(id)a5 fieldClassification:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  $115C4C562B26FF47E01F9F4EA65B5887 v23;

  v10 = a4;
  v11 = a5;
  v23 = *a3;
  WBSApplicationIdentifierFromAuditToken();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SFAppAutoFillOneTimeCodeProvider currentOneTimeCodesWithAuditToken:website:usernameHint:fieldClassification:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  -[SFAppAutoFillOneTimeCodeProvider currentOneTimeCodesWithAppIdentifier:website:usernameHint:fieldClassification:](self, "currentOneTimeCodesWithAppIdentifier:website:usernameHint:fieldClassification:", v12, v10, v11, a6, *(_OWORD *)v23.var0, *(_OWORD *)&v23.var0[4]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)currentOneTimeCodesWithAppIdentifier:(id)a3 website:(id)a4 usernameHint:(id)a5 fieldClassification:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *internalQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  SFAppAutoFillOneTimeCodeProvider *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke;
  v24 = &unk_24C935398;
  v25 = self;
  v26 = v10;
  v27 = v11;
  v28 = v13;
  v29 = v12;
  v30 = a6;
  v15 = v12;
  v16 = v13;
  v17 = v11;
  v18 = v10;
  dispatch_sync(internalQueue, &v21);
  v19 = (void *)objc_msgSend(v16, "copy", v21, v22, v23, v24, v25);

  return v19;
}

void __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_2;
  v6[3] = &unk_24C935398;
  v2 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v9 = v3;
  v11 = v4;
  v10 = v5;
  _os_activity_initiate(&dword_20E365000, "Retrieving Current One-Time Codes for App", OS_ACTIVITY_FLAG_DEFAULT, v6);

}

void __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_validateCurrentOneTimeCodes");
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 16);
  v37[2] = __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_3;
  v37[3] = &unk_24C935320;
  v5 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[4] = v2;
  v38 = v3;
  v39 = *(id *)(a1 + 48);
  v40 = &v42;
  v41 = &v46;
  objc_msgSend(v4, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v37);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24C93C8A8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 56);
    objc_msgSend(v7, "first");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24C93C8C0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *(void **)(a1 + 56);
    objc_msgSend(v11, "first");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
  if (!*((_BYTE *)v43 + 24) || !*((_BYTE *)v47 + 24))
  {
    if (objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      v14 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20E365000, v14, OS_LOG_TYPE_INFO, "Will return at least the currently available one-time code.", buf, 2u);
      }
    }
    +[SFAutoFillFeatureManager sharedFeatureManager](SFAutoFillFeatureManager, "sharedFeatureManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shouldAutoFillPasswordsFromKeychain");

    if (v16)
    {
      v17 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 67109120;
        LODWORD(v51) = v18;
        _os_log_impl(&dword_20E365000, v17, OS_LOG_TYPE_INFO, "Attempting to return a TOTP generated code. classification:%d", buf, 8u);
      }
      if (*(_QWORD *)(a1 + 72) == 2 && objc_msgSend(*(id *)(a1 + 40), "length"))
      {
        if (*(_QWORD *)(a1 + 48)
          && objc_msgSend(*(id *)(a1 + 32), "_appWithAppIdentifierIsWebBrowser:", *(_QWORD *)(a1 + 40)))
        {
          v19 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = *(_QWORD *)(a1 + 40);
            v21 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138412803;
            v51 = v20;
            v52 = 2160;
            v53 = 1752392040;
            v54 = 2117;
            v55 = v21;
            _os_log_impl(&dword_20E365000, v19, OS_LOG_TYPE_DEFAULT, "App %@ has web browser entitlement. Getting passwords for website URL %{sensitive, mask.hash}@.", buf, 0x20u);
          }
          objc_msgSend(*(id *)(a1 + 32), "_savedAccountsWithPasswordsForURL:inContext:", *(_QWORD *)(a1 + 48), 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 141558275;
            v51 = 1752392040;
            v52 = 2117;
            v53 = v24;
            _os_log_impl(&dword_20E365000, v23, OS_LOG_TYPE_DEFAULT, "Fetching passwords for associated domains for app %{sensitive, mask.hash}@.", buf, 0x16u);
          }
          objc_msgSend(*(id *)(a1 + 32), "_associatedDomainEntriesForAppWithIdentifier:", *(_QWORD *)(a1 + 40));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = v5;
          v35[1] = 3221225472;
          v35[2] = __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_45;
          v35[3] = &unk_24C935370;
          v35[4] = *(_QWORD *)(a1 + 32);
          v36 = *(id *)(a1 + 64);
          objc_msgSend(v25, "safari_mapAndFilterObjectsUsingBlock:", v35);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "safari_flattenedArray");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v27 = *(void **)(a1 + 56);
        v28 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BE82DC0], "defaultContext");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_sortedOneTimeCodesFromSavedAccounts:context:", v22, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObjectsFromArray:", v30);

        v31 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = objc_msgSend(*(id *)(a1 + 56), "count");
          v33 = objc_msgSend(*(id *)(a1 + 56), "count");
          v34 = "s";
          if (v33 == 1)
            v34 = "";
          *(_DWORD *)buf = 134218242;
          v51 = v32;
          v52 = 2080;
          v53 = (uint64_t)v34;
          _os_log_impl(&dword_20E365000, v31, OS_LOG_TYPE_DEFAULT, "Returning %ld available one-time code%s", buf, 0x16u);
        }

      }
    }
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

id __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  id v10;
  void *v11;
  unsigned __int8 v13;

  v4 = a3;
  v13 = 0;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_domainBindingForRecievedOneTimeCode:forAppWithIdentifier:websiteURL:hasDomainBinding:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v13);
  v6 = (void *)v5;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)
                                                                                               + 8)
                                                                                   + 24) | v13) != 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (v5)
    v8 = 0;
  else
    v8 = *(_BYTE *)(v7 + 24) == 0;
  v9 = !v8;
  *(_BYTE *)(v7 + 24) = v9;
  if (v5)
  {
    v10 = objc_alloc(MEMORY[0x24BE82D08]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v10, "initWithFirst:second:", v4, v11);

  }
  return v6;
}

id __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_45(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_secureURLWithDomain:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_savedAccountsWithPasswordsForURL:inContext:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_2_46;
  v9[3] = &unk_24C935348;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __114__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesWithAppIdentifier_website_usernameHint_fieldClassification___block_invoke_2_46(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(v3, "user");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:(id)a3 fieldClassification:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BE82DC0];
  v7 = a3;
  objc_msgSend(v6, "defaultContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppAutoFillOneTimeCodeProvider currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:fieldClassification:inContext:](self, "currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:fieldClassification:inContext:", v7, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:(id)a3 fieldClassification:(int64_t)a4 inContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __119__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs_fieldClassification_inContext___block_invoke;
  block[3] = &unk_24C9353E8;
  block[4] = self;
  v18 = v8;
  v20 = v9;
  v21 = a4;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_sync(internalQueue, block);
  v15 = (void *)objc_msgSend(v13, "copy");

  return v15;
}

void __119__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs_fieldClassification_inContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD activity_block[5];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __119__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs_fieldClassification_inContext___block_invoke_2;
  activity_block[3] = &unk_24C9353E8;
  v2 = *(void **)(a1 + 40);
  activity_block[4] = *(_QWORD *)(a1 + 32);
  v7 = v2;
  v3 = *(id *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v8 = v3;
  v10 = v4;
  v9 = v5;
  _os_activity_initiate(&dword_20E365000, "Retrieving Current One-Time Codes for Web Browser App", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __119__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs_fieldClassification_inContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "_validateCurrentOneTimeCodes");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __119__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs_fieldClassification_inContext___block_invoke_3;
  v20[3] = &unk_24C9353C0;
  v21 = v2;
  objc_msgSend(v3, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24C93C8A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v5, "first");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_24C93C8C0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(void **)(a1 + 48);
    objc_msgSend(v9, "first");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  +[SFAutoFillFeatureManager sharedFeatureManager](SFAutoFillFeatureManager, "sharedFeatureManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "shouldAutoFillPasswordsFromKeychain");

  if (v13)
  {
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 40), "lastObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        v16 = *(void **)(a1 + 32);
        v17 = *(void **)(a1 + 48);
        objc_msgSend(v16, "_savedAccountsWithPasswordsForURL:inContext:", v14, *(_QWORD *)(a1 + 56));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_sortedOneTimeCodesFromSavedAccounts:context:", v18, *(_QWORD *)(a1 + 56));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObjectsFromArray:", v19);

      }
    }
  }

}

id __119__SFAppAutoFillOneTimeCodeProvider_currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs_fieldClassification_inContext___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "matchBoundDomainsWithFrameURLs:", *(_QWORD *)(a1 + 32));
  v6 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = &stru_24C9367F0;
    v8 = *(_QWORD *)(a1 + 32);
    if (!v5)
      v7 = CFSTR("NOT ");
    v12 = 138412547;
    v13 = v7;
    v14 = 2113;
    v15 = v8;
    _os_log_impl(&dword_20E365000, v6, OS_LOG_TYPE_DEFAULT, "Domain-bound verification code is %@valid for frame URLs from web browser: %{private}@", (uint8_t *)&v12, 0x16u);
  }
  if (v5)
  {
    v9 = objc_alloc(MEMORY[0x24BE82D08]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v9, "initWithFirst:second:", v4, v10);

  }
  return v5;
}

- (int64_t)_domainBindingForRecievedOneTimeCode:(id)a3 forAppWithIdentifier:(id)a4 websiteURL:(id)a5 hasDomainBinding:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  id (*v35)(uint64_t, void *, void *);
  void *v36;
  SFAppAutoFillOneTimeCodeProvider *v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v12, "domain");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "machineReadableCode");
  v14 = objc_claimAutoreleasedReturnValue();

  if (v13 | v14)
  {
    if (a6)
      *a6 = 1;
    v15 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558275;
      v40 = 1752392040;
      v41 = 2117;
      v42 = v13;
      _os_log_impl(&dword_20E365000, v15, OS_LOG_TYPE_DEFAULT, "Current verification code is domain-bound to %{sensitive, mask.hash}@.", buf, 0x16u);
    }
    if (objc_msgSend(v10, "length"))
    {
      -[SFAppAutoFillOneTimeCodeProvider _secureURLWithDomain:](self, "_secureURLWithDomain:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        && -[SFAppAutoFillOneTimeCodeProvider _appWithAppIdentifierIsWebBrowser:](self, "_appWithAppIdentifierIsWebBrowser:", v10))
      {
        v17 = WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412803;
          v40 = (uint64_t)v10;
          v41 = 2160;
          v42 = 1752392040;
          v43 = 2117;
          v44 = v11;
          _os_log_impl(&dword_20E365000, v17, OS_LOG_TYPE_INFO, "App %@ has web browser entitlement. Checking domain against website URL %{sensitive, mask.hash}@.", buf, 0x20u);
        }
        v18 = -[SFAppAutoFillOneTimeCodeProvider _url:matchesURLFromOriginBoundCode:](self, "_url:matchesURLFromOriginBoundCode:", v11, v16);
      }
      else
      {
        v19 = WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v40 = (uint64_t)v10;
          _os_log_impl(&dword_20E365000, v19, OS_LOG_TYPE_INFO, "Checking domain against associated domains for app %@.", buf, 0xCu);
        }
        -[SFAppAutoFillOneTimeCodeProvider _associatedDomainEntriesForAppWithIdentifier:](self, "_associatedDomainEntriesForAppWithIdentifier:", v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = MEMORY[0x24BDAC760];
        v34 = 3221225472;
        v35 = __122__SFAppAutoFillOneTimeCodeProvider__domainBindingForRecievedOneTimeCode_forAppWithIdentifier_websiteURL_hasDomainBinding___block_invoke;
        v36 = &unk_24C935410;
        v37 = self;
        v38 = v16;
        objc_msgSend(v20, "safari_reduceObjectsWithInitialValue:usingBlock:", &unk_24C93C8A8, &v33);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v21, "integerValue", v33, v34, v35, v36, v37);

      }
      v22 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = &stru_24C9367F0;
        if (!v18)
          v23 = CFSTR("NOT ");
        *(_DWORD *)buf = 138412546;
        v40 = (uint64_t)v23;
        v41 = 2112;
        v42 = (uint64_t)v10;
        _os_log_impl(&dword_20E365000, v22, OS_LOG_TYPE_DEFAULT, "Domain-bound verification code is %@valid for app %@.", buf, 0x16u);
      }

    }
    else
    {
      v24 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[SFAppAutoFillOneTimeCodeProvider _domainBindingForRecievedOneTimeCode:forAppWithIdentifier:websiteURL:hasDomainBinding:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
      v18 = 0;
    }
  }
  else
  {
    if (a6)
      *a6 = 0;
    v18 = 2;
  }

  return v18;
}

id __122__SFAppAutoFillOneTimeCodeProvider__domainBindingForRecievedOneTimeCode_forAppWithIdentifier_websiteURL_hasDomainBinding___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(a2, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_secureURLWithDomain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "_url:matchesURLFromOriginBoundCode:", v8, *(_QWORD *)(a1 + 40));

  if (v9 <= objc_msgSend(v5, "integerValue"))
  {
    v10 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (void)consumeCurrentOneTimeCode
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SFAppAutoFillOneTimeCodeProvider_consumeCurrentOneTimeCode__block_invoke;
  block[3] = &unk_24C935460;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __61__SFAppAutoFillOneTimeCodeProvider_consumeCurrentOneTimeCode__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__SFAppAutoFillOneTimeCodeProvider_consumeCurrentOneTimeCode__block_invoke_2;
  v4[3] = &unk_24C935438;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

uint64_t __61__SFAppAutoFillOneTimeCodeProvider_consumeCurrentOneTimeCode__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_consumeOneTimeCode:");
}

- (void)consumeMessagesOneTimeCodeWithGUID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__SFAppAutoFillOneTimeCodeProvider_consumeMessagesOneTimeCodeWithGUID___block_invoke;
  v7[3] = &unk_24C935280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __71__SFAppAutoFillOneTimeCodeProvider_consumeMessagesOneTimeCodeWithGUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", &unk_24C93C8A8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    objc_msgSend(v2, "GUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

    v2 = v5;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_consumeOneTimeCode:", v5);
      v2 = v5;
    }
  }

}

- (void)consumeOneTimeCode:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SFAppAutoFillOneTimeCodeProvider_consumeOneTimeCode___block_invoke;
  v7[3] = &unk_24C935280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __55__SFAppAutoFillOneTimeCodeProvider_consumeOneTimeCode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_consumeOneTimeCode:", *(_QWORD *)(a1 + 40));
}

- (void)_consumeOneTimeCode:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  IMOneTimeCodeAccelerator *messagesOneTimeCodeAccelerator;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[NSMutableDictionary allValues](self->_currentReceivedOneTimeCodesBySource, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v12);

  v6 = v12;
  if (v5)
  {
    v7 = objc_msgSend(v12, "source");
    if (v7 == 1)
    {
      -[EMOneTimeCodeAccelerator didFillOneTimeCode:](self->_mailOneTimeCodeAccelerator, "didFillOneTimeCode:", objc_msgSend(v12, "messageID"));
      v10 = &unk_24C93C8C0;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_currentReceivedOneTimeCodesBySource, "objectForKeyedSubscript:", &unk_24C93C8C0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isEqual:", v11))
        goto LABEL_6;
      goto LABEL_5;
    }
    v6 = v12;
    if (!v7)
    {
      messagesOneTimeCodeAccelerator = self->_messagesOneTimeCodeAccelerator;
      objc_msgSend(v12, "GUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMOneTimeCodeAccelerator consumeCodeWithGuid:](messagesOneTimeCodeAccelerator, "consumeCodeWithGuid:", v9);

      v10 = &unk_24C93C8A8;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_currentReceivedOneTimeCodesBySource, "objectForKeyedSubscript:", &unk_24C93C8A8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqual:", v11) & 1) == 0)
      {
LABEL_6:

        v6 = v12;
        goto LABEL_7;
      }
LABEL_5:
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentReceivedOneTimeCodesBySource, "setObject:forKeyedSubscript:", 0, v10);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (id)_mostRecentlyReceivedOneTimeCode
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allValues](self->_currentReceivedOneTimeCodesBySource, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_reduceObjectsUsingBlock:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __68__SFAppAutoFillOneTimeCodeProvider__mostRecentlyReceivedOneTimeCode__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a2;
  v5 = v4;
  if (a3)
  {
    v6 = a3;
    objc_msgSend(v5, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "safari_isLaterThanDate:", v8))
      v9 = v5;
    else
      v9 = v6;
    v10 = v9;

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SFAppAutoFillOneTimeCodeProvider_addObserver___block_invoke;
  v7[3] = &unk_24C935280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __48__SFAppAutoFillOneTimeCodeProvider_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)addObserver:(id)a3 forOneTimeCode:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v7, "source") == 2)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__SFAppAutoFillOneTimeCodeProvider_addObserver_forOneTimeCode___block_invoke;
    block[3] = &unk_24C9354C8;
    block[4] = self;
    v10 = v7;
    v11 = v6;
    dispatch_async(internalQueue, block);

  }
}

void __63__SFAppAutoFillOneTimeCodeProvider_addObserver_forOneTimeCode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TOTPGeneratorSnapshot *v8;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v2;

  }
  v8 = objc_alloc_init(TOTPGeneratorSnapshot);
  -[TOTPGeneratorSnapshot setOneTimeCode:](v8, "setOneTimeCode:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "totpGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDateOfIntervalContainingDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TOTPGeneratorSnapshot setStartDateOfInterval:](v8, "setStartDateOfInterval:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v8, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_startGeneratorTimer");

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SFAppAutoFillOneTimeCodeProvider_removeObserver___block_invoke;
  v7[3] = &unk_24C935280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __51__SFAppAutoFillOneTimeCodeProvider_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isOneTimeCodeAutoDeletionEnabled
{
  NSObject *internalQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__SFAppAutoFillOneTimeCodeProvider_isOneTimeCodeAutoDeletionEnabled__block_invoke;
  v5[3] = &unk_24C9354F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __68__SFAppAutoFillOneTimeCodeProvider_isOneTimeCodeAutoDeletionEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void)setIsOneTimeCodeAutoDeletionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *internalQueue;
  _QWORD v6[5];
  BOOL v7;

  v3 = a3;
  internalQueue = self->_internalQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__SFAppAutoFillOneTimeCodeProvider_setIsOneTimeCodeAutoDeletionEnabled___block_invoke;
  v6[3] = &unk_24C935518;
  v6[4] = self;
  v7 = a3;
  dispatch_async(internalQueue, v6);
  -[IMOneTimeCodeAccelerator setAutoDeletionPreference:](self->_messagesOneTimeCodeAccelerator, "setAutoDeletionPreference:", v3);
}

uint64_t __72__SFAppAutoFillOneTimeCodeProvider_setIsOneTimeCodeAutoDeletionEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_fetchOneTimeCodeAutoDeletionPreference
{
  IMOneTimeCodeAccelerator *messagesOneTimeCodeAccelerator;
  _QWORD v3[5];

  messagesOneTimeCodeAccelerator = self->_messagesOneTimeCodeAccelerator;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __75__SFAppAutoFillOneTimeCodeProvider__fetchOneTimeCodeAutoDeletionPreference__block_invoke;
  v3[3] = &unk_24C935540;
  v3[4] = self;
  -[IMOneTimeCodeAccelerator fetchAutoDeletionPreferenceWithCompletionHandler:](messagesOneTimeCodeAccelerator, "fetchAutoDeletionPreferenceWithCompletionHandler:", v3);
}

void __75__SFAppAutoFillOneTimeCodeProvider__fetchOneTimeCodeAutoDeletionPreference__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 56);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __75__SFAppAutoFillOneTimeCodeProvider__fetchOneTimeCodeAutoDeletionPreference__block_invoke_2;
  v4[3] = &unk_24C935518;
  v4[4] = v2;
  v5 = a2;
  dispatch_async(v3, v4);
}

uint64_t __75__SFAppAutoFillOneTimeCodeProvider__fetchOneTimeCodeAutoDeletionPreference__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_notifyOneTimeCodeObserver
{
  void *v3;
  id WeakRetained;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  SFAppAutoFillOneTimeCodeProvider *v9;
  id v10;

  v3 = (void *)-[NSHashTable copy](self->_observers, "copy");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SFAppAutoFillOneTimeCodeProvider__notifyOneTimeCodeObserver__block_invoke;
  block[3] = &unk_24C9354C8;
  v8 = v3;
  v9 = self;
  v10 = WeakRetained;
  v5 = WeakRetained;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __62__SFAppAutoFillOneTimeCodeProvider__notifyOneTimeCodeObserver__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v13;
    *(_QWORD *)&v4 = 138412290;
    v11 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v11;
            v17 = v8;
            _os_log_impl(&dword_20E365000, v9, OS_LOG_TYPE_INFO, "Notifying observer %@ of new one-time code", buf, 0xCu);
          }
          objc_msgSend(v8, "oneTimeCodeProviderReceivedCode:", *(_QWORD *)(a1 + 40), v11, (_QWORD)v12);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

  return objc_msgSend(*(id *)(a1 + 48), "appAutoFillOneTimeCodeProviderReceivedOneTimeCode:", *(_QWORD *)(a1 + 40));
}

- (void)_processOneTimeCodeFromMessages:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  SFAutoFillOneTimeCode *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a3;
    v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      objc_msgSend(0, "code");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 141558275;
      v10 = 1752392040;
      v11 = 2117;
      v12 = v7;
      _os_log_impl(&dword_20E365000, v6, OS_LOG_TYPE_DEFAULT, "Received verification code from Messages: %{sensitive, mask.hash}@", (uint8_t *)&v9, 0x16u);

    }
    v8 = -[SFAutoFillOneTimeCode initWithIMCoreDictionary:]([SFAutoFillOneTimeCode alloc], "initWithIMCoreDictionary:", v4);

  }
  else
  {
    v8 = 0;
  }
  -[SFAppAutoFillOneTimeCodeProvider _processReceivedOneTimeCode:fromSource:](self, "_processReceivedOneTimeCode:fromSource:", v8, 0);

}

- (void)_processOneTimeCodeFromMail:(id)a3 withTimestamp:(id)a4 andMessageID:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  SFAutoFillOneTimeCode *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v8 = a4;
    v9 = a3;
    v10 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(0, "code");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 141558531;
      v15 = 1752392040;
      v16 = 2117;
      v17 = v12;
      v18 = 2048;
      v19 = objc_msgSend(0, "messageID");
      _os_log_impl(&dword_20E365000, v11, OS_LOG_TYPE_DEFAULT, "Received verification code from Mail: %{sensitive, mask.hash}@ and MessageID: %ld", (uint8_t *)&v14, 0x20u);

    }
    v13 = -[SFAutoFillOneTimeCode initWithMailOneTimeCode:timestamp:messageID:]([SFAutoFillOneTimeCode alloc], "initWithMailOneTimeCode:timestamp:messageID:", v9, v8, a5);

  }
  else
  {
    v13 = 0;
  }
  -[SFAppAutoFillOneTimeCodeProvider _processReceivedOneTimeCode:fromSource:](self, "_processReceivedOneTimeCode:fromSource:", v13, 1);

}

- (void)_processReceivedOneTimeCode:(id)a3 fromSource:(int64_t)a4
{
  NSMutableDictionary *currentReceivedOneTimeCodesBySource;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSMutableDictionary *v12;
  void *v13;

  currentReceivedOneTimeCodesBySource = self->_currentReceivedOneTimeCodesBySource;
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a3;
  objc_msgSend(v7, "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](currentReceivedOneTimeCodesBySource, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = WBSIsEqual();

  v12 = self->_currentReceivedOneTimeCodesBySource;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v8, v13);

  if ((v11 & 1) == 0)
    -[SFAppAutoFillOneTimeCodeProvider _notifyOneTimeCodeObserver](self, "_notifyOneTimeCodeObserver");
}

- (void)_validateCurrentOneTimeCodes
{
  void *v3;
  void *v4;
  NSMutableDictionary *currentReceivedOneTimeCodesBySource;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -180.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  currentReceivedOneTimeCodesBySource = self->_currentReceivedOneTimeCodesBySource;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__SFAppAutoFillOneTimeCodeProvider__validateCurrentOneTimeCodes__block_invoke;
  v10[3] = &unk_24C935568;
  v11 = v4;
  v9 = v4;
  -[NSMutableDictionary safari_mapAndFilterKeysAndObjectsUsingBlock:](currentReceivedOneTimeCodesBySource, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
  v8 = self->_currentReceivedOneTimeCodesBySource;
  self->_currentReceivedOneTimeCodesBySource = v7;

}

id __64__SFAppAutoFillOneTimeCodeProvider__validateCurrentOneTimeCodes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v5, "safari_isEarlierThanDate:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_20E365000, v6, OS_LOG_TYPE_INFO, "%@ is expired; removing from cache", (uint8_t *)&v9, 0xCu);
    }
    v7 = 0;
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (int64_t)_url:(id)a3 matchesURLFromOriginBoundCode:(id)a4
{
  id v5;
  id v6;
  int64_t v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "safari_hasSameOriginAsURL:", v6) & 1) != 0)
    v7 = 2;
  else
    v7 = objc_msgSend(v5, "safari_hasSameSiteAsURL:", v6);

  return v7;
}

- (BOOL)_appWithAppIdentifierIsWebBrowser:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  id v11;

  v3 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithApplicationIdentifier:error:", v3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v4)
  {
    objc_msgSend(v4, "entitlements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:ofClass:", CFSTR("com.apple.developer.web-browser"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SFAppAutoFillOneTimeCodeProvider _appWithAppIdentifierIsWebBrowser:].cold.1((uint64_t)v3, v9);
    v8 = 0;
  }

  return v8;
}

- (id)_secureURLWithDomain:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDD1808];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v5, "setScheme:", CFSTR("https"));
    objc_msgSend(v5, "setHost:", v4);

    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_savedAccountsWithPasswordsForURL:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82DD0]), "initWithURL:options:partialUsername:associatedDomainsManager:webFrameIdentifier:", v6, 19, &stru_24C9367F0, self->_associatedDomainsManager, 0);
  objc_msgSend(v8, "setContext:", v7);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__SFAppAutoFillOneTimeCodeProvider__savedAccountsWithPasswordsForURL_inContext___block_invoke;
  v13[3] = &unk_24C935590;
  v13[4] = &v14;
  objc_msgSend(v9, "getSavedAccountsMatchingCriteria:withSynchronousCompletionHandler:", v8, v13);

  objc_msgSend((id)v15[5], "matchesForPasswordAutoFill");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_mapObjectsUsingBlock:", &__block_literal_global_80);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __80__SFAppAutoFillOneTimeCodeProvider__savedAccountsWithPasswordsForURL_inContext___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __80__SFAppAutoFillOneTimeCodeProvider__savedAccountsWithPasswordsForURL_inContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "savedAccount");
}

- (id)_sortedOneTimeCodesFromSavedAccounts:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDBCEF0];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__SFAppAutoFillOneTimeCodeProvider__sortedOneTimeCodesFromSavedAccounts_context___block_invoke;
  v14[3] = &unk_24C935620;
  v15 = v5;
  v9 = v5;
  objc_msgSend(v7, "safari_reduceObjectsWithInitialValue:usingBlock:", v8, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_86);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __81__SFAppAutoFillOneTimeCodeProvider__sortedOneTimeCodesFromSavedAccounts_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  SFAutoFillOneTimeCode *(*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v5, "totpGenerators");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastUsedDateForContext:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __81__SFAppAutoFillOneTimeCodeProvider__sortedOneTimeCodesFromSavedAccounts_context___block_invoke_2;
  v19 = &unk_24C9355F8;
  v20 = v5;
  v21 = v10;
  v12 = v10;
  v13 = v5;
  objc_msgSend(v11, "safari_mapObjectsUsingBlock:", &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v14, v16, v17, v18, v19);

  return v6;
}

SFAutoFillOneTimeCode *__81__SFAppAutoFillOneTimeCodeProvider__sortedOneTimeCodesFromSavedAccounts_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SFAutoFillOneTimeCode *v4;
  void *v5;
  void *v6;
  SFAutoFillOneTimeCode *v7;

  v3 = a2;
  v4 = [SFAutoFillOneTimeCode alloc];
  objc_msgSend(*(id *)(a1 + 32), "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userVisibleDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFAutoFillOneTimeCode initWithTOTPGenerator:user:highLevelDomain:lastUsedDateOfAssociatedSavedAccount:](v4, "initWithTOTPGenerator:user:highLevelDomain:lastUsedDateOfAssociatedSavedAccount:", v3, v5, v6, *(_QWORD *)(a1 + 40));

  return v7;
}

uint64_t __81__SFAppAutoFillOneTimeCodeProvider__sortedOneTimeCodesFromSavedAccounts_context___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "lastUseDateOfAssociatedSavedAccount");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastUseDateOfAssociatedSavedAccount");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = objc_msgSend((id)v6, "compare:", v7);
    v10 = 1;
    if (v9 != -1)
      v10 = -1;
    if (v9)
      v11 = v10;
    else
      v11 = -1;
  }
  else
  {
    if (v6)
      v11 = -1;
    else
      v11 = 1;
    if (!(v6 | v7))
    {
      objc_msgSend(v4, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = compareStringToString(v12, v13);

      if (!v11)
      {
        objc_msgSend(v4, "user");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "user");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = compareStringToString(v14, v15);

        if (!v11)
        {
          objc_msgSend(v4, "displayCode");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "displayCode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = compareStringToString(v16, v17);

        }
      }
    }
  }

  return v11;
}

- (id)_associatedDomainEntriesForAppWithIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__SFAppAutoFillOneTimeCodeProvider__associatedDomainEntriesForAppWithIdentifier___block_invoke;
  v17[3] = &unk_24C935688;
  v19 = &v20;
  v5 = v4;
  v18 = v5;
  +[SFSafariCredentialStore getApprovedSharedWebCredentialsEntriesForAppWithAppID:completionHandler:](SFSafariCredentialStore, "getApprovedSharedWebCredentialsEntriesForAppWithAppID:completionHandler:", v3, v17);
  v6 = dispatch_time(0, 5);
  if (dispatch_group_wait(v5, v6))
  {
    v7 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SFAppAutoFillOneTimeCodeProvider _associatedDomainEntriesForAppWithIdentifier:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = 0;
  }
  else
  {
    v15 = (id)v21[5];
  }

  _Block_object_dispose(&v20, 8);
  return v15;
}

void __81__SFAppAutoFillOneTimeCodeProvider__associatedDomainEntriesForAppWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)_startGeneratorTimer
{
  NSTimer *v3;
  NSTimer *generatorTimer;
  void *v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (!self->_generatorTimer)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __56__SFAppAutoFillOneTimeCodeProvider__startGeneratorTimer__block_invoke;
    v6[3] = &unk_24C9356B0;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:repeats:block:", 1, v6, 1.0);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    generatorTimer = self->_generatorTimer;
    self->_generatorTimer = v3;

    -[NSTimer setTolerance:](self->_generatorTimer, "setTolerance:", 0.25);
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTimer:forMode:", self->_generatorTimer, *MEMORY[0x24BDBCA90]);

  }
}

void __56__SFAppAutoFillOneTimeCodeProvider__startGeneratorTimer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SFAppAutoFillOneTimeCodeProvider__startGeneratorTimer__block_invoke_2;
  block[3] = &unk_24C935460;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __56__SFAppAutoFillOneTimeCodeProvider__startGeneratorTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v17;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v17 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v4);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "oneTimeCode");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "totpGenerator");
          v8 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v8, "startDateOfIntervalContainingDate:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "startDateOfInterval");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v8) = objc_msgSend(v10, "isEqualToDate:", v11);

          if ((v8 & 1) == 0)
          {
            objc_msgSend(v6, "setStartDateOfInterval:", v10);
            v12 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v6, "oneTimeCode");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "oneTimeCodeProvider:didUpdateOneTimeCode:", v12, v13);

          }
        }
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v2);
  }

}

- (SFAppAutoFillOneTimeCodeProviderDelegate)delegate
{
  return (SFAppAutoFillOneTimeCodeProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WBSAutoFillAssociatedDomainsManager)associatedDomainsManager
{
  return self->_associatedDomainsManager;
}

- (void)setAssociatedDomainsManager:(id)a3
{
  objc_storeStrong((id *)&self->_associatedDomainsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDomainsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_generatorTimer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_generatorObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_mailOneTimeCodeAccelerator, 0);
  objc_storeStrong((id *)&self->_currentReceivedOneTimeCodesBySource, 0);
  objc_storeStrong((id *)&self->_messagesOneTimeCodeAccelerator, 0);
}

- (void)currentOneTimeCodesWithAuditToken:(uint64_t)a3 website:(uint64_t)a4 usernameHint:(uint64_t)a5 fieldClassification:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20E365000, a1, a3, "Couldn't get an app identifier for the given audit token", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_domainBindingForRecievedOneTimeCode:(uint64_t)a3 forAppWithIdentifier:(uint64_t)a4 websiteURL:(uint64_t)a5 hasDomainBinding:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20E365000, a1, a3, "Missing app identifier. Domain validation is not possible.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_appWithAppIdentifierIsWebBrowser:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_20E365000, a2, OS_LOG_TYPE_ERROR, "Could not fetch application record for application identifier: %{private}@.", (uint8_t *)&v2, 0xCu);
}

- (void)_associatedDomainEntriesForAppWithIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20E365000, a1, a3, "Timed out waiting for web credentials for app.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
