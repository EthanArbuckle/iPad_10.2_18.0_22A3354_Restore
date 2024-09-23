@implementation PDCPrivacyAlertPresenter

+ (id)sharedPresenter
{
  if (sharedPresenter_onceToken != -1)
    dispatch_once(&sharedPresenter_onceToken, &__block_literal_global_0);
  return (id)sharedPresenter_presenter;
}

void __43__PDCPrivacyAlertPresenter_sharedPresenter__block_invoke()
{
  PDCPrivacyAlertPresenter *v0;
  void *v1;

  v0 = objc_alloc_init(PDCPrivacyAlertPresenter);
  v1 = (void *)sharedPresenter_presenter;
  sharedPresenter_presenter = (uint64_t)v0;

}

- (PDCPrivacyAlertPresenter)init
{
  PDCPrivacyAlertPresenter *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMapTable *requestToAlertMap;
  PDCPrivacyAlertPresenter *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PDCPrivacyAlertPresenter;
  v2 = -[PDCPrivacyAlertPresenter init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.PrivacyDisclosure.PrivacyAlertPresenter", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToWeakObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    requestToAlertMap = v2->_requestToAlertMap;
    v2->_requestToAlertMap = (NSMapTable *)v6;

    v8 = v2;
  }

  return v2;
}

- (void)_ensureAppIsLaunchableWithIdentity:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v17 = 0;
  objc_msgSend(a3, "findApplicationRecordWithError:", &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if ((objc_msgSend(v6, "applicationMissingRequiredSINF") & 1) != 0)
  {
    v8 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      objc_msgSend(v6, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_2449FF000, v9, OS_LOG_TYPE_INFO, "Request application repair for %@", buf, 0xCu);

    }
    v11 = objc_alloc(MEMORY[0x24BE045C8]);
    objc_msgSend(v6, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithBundleID:", v12);

    objc_msgSend(v13, "setExitReason:", 16);
    objc_msgSend(MEMORY[0x24BE045D0], "defaultService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __74__PDCPrivacyAlertPresenter__ensureAppIsLaunchableWithIdentity_completion___block_invoke;
    v15[3] = &unk_2515A2B60;
    v16 = v5;
    objc_msgSend(v14, "repairAppWithOptions:replyHandler:", v13, v15);

  }
  else
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
  }

}

void __74__PDCPrivacyAlertPresenter__ensureAppIsLaunchableWithIdentity_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  if (v5)
  {
    v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __74__PDCPrivacyAlertPresenter__ensureAppIsLaunchableWithIdentity_completion___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)activateRemoteAlertWithIdentity:(id)a3 requestHandle:(id)a4 forcePresent:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke;
  v16[3] = &unk_2515A2BD8;
  v16[4] = self;
  v17 = v10;
  v20 = a5;
  v18 = v11;
  v19 = v12;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  -[PDCPrivacyAlertPresenter _ensureAppIsLaunchableWithIdentity:completion:](self, "_ensureAppIsLaunchableWithIdentity:completion:", v14, v16);

}

void __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  char v12;

  if ((a2 & 1) != 0)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke_2;
    block[3] = &unk_2515A2BB0;
    v5 = v3;
    v12 = *(_BYTE *)(a1 + 64);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    v11 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 48);
    dispatch_async(v4, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 buf;
  void (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v2 = (void *)getBSMutableSettingsClass_softClass;
  v19 = getBSMutableSettingsClass_softClass;
  v3 = MEMORY[0x24BDAC760];
  if (!getBSMutableSettingsClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v21 = __getBSMutableSettingsClass_block_invoke;
    v22 = &unk_2515A2C50;
    v23 = &v16;
    __getBSMutableSettingsClass_block_invoke((uint64_t)&buf);
    v2 = (void *)v17[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v16, 8);
  v5 = objc_alloc_init(v4);
  objc_msgSend(*(id *)(a1 + 32), "identityString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v7, 1);

  v8 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    v10 = v8;
    objc_msgSend(v9, "identityString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_2449FF000, v10, OS_LOG_TYPE_DEFAULT, "Request privacy remote alert for bundle: [%@]", (uint8_t *)&buf, 0xCu);

  }
  v12 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke_10;
  v14[3] = &unk_2515A2B88;
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v12, "_activateAlertHandleForIdentity:settings:repsonseHandler:", v13, v5, v14);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(_QWORD *)(a1 + 48));

}

void __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_2449FF000, v6, OS_LOG_TYPE_DEFAULT, "Succeed to get user response from remote alert: [%@]", (uint8_t *)&v14, 0xCu);
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v5, "integerValue"));

  }
  else
  {
    v7 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke_10_cold_1((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_activateAlertHandleForIdentity:(id)a3 settings:(id)a4 repsonseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  SBSRemoteAlertHandle *v25;
  SBSRemoteAlertHandle *alertHandle;
  void *v27;
  objc_class *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint8_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v11 = (void *)getSBSRemoteAlertDefinitionClass_softClass;
  v50 = getSBSRemoteAlertDefinitionClass_softClass;
  if (!getSBSRemoteAlertDefinitionClass_softClass)
  {
    v42 = MEMORY[0x24BDAC760];
    v43 = 3221225472;
    v44 = __getSBSRemoteAlertDefinitionClass_block_invoke;
    v45 = &unk_2515A2C50;
    v46 = &v47;
    __getSBSRemoteAlertDefinitionClass_block_invoke((uint64_t)&v42);
    v11 = (void *)v48[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v47, 8);
  v13 = (void *)objc_msgSend([v12 alloc], "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.PDUIApp"), CFSTR("PDURemoteViewController"));
  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v14 = (void *)getSBSRemoteAlertConfigurationContextClass_softClass;
  v50 = getSBSRemoteAlertConfigurationContextClass_softClass;
  if (!getSBSRemoteAlertConfigurationContextClass_softClass)
  {
    v42 = MEMORY[0x24BDAC760];
    v43 = 3221225472;
    v44 = __getSBSRemoteAlertConfigurationContextClass_block_invoke;
    v45 = &unk_2515A2C50;
    v46 = &v47;
    __getSBSRemoteAlertConfigurationContextClass_block_invoke((uint64_t)&v42);
    v14 = (void *)v48[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v47, 8);
  v16 = objc_alloc_init(v15);
  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v17 = (void *)getBSActionClass_softClass;
  v50 = getBSActionClass_softClass;
  if (!getBSActionClass_softClass)
  {
    v42 = MEMORY[0x24BDAC760];
    v43 = 3221225472;
    v44 = __getBSActionClass_block_invoke;
    v45 = &unk_2515A2C50;
    v46 = &v47;
    __getBSActionClass_block_invoke((uint64_t)&v42);
    v17 = (void *)v48[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v47, 8);
  v19 = [v18 alloc];
  objc_msgSend(MEMORY[0x24BE0BD88], "responderWithHandler:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithInfo:responder:", v9, v20);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActions:", v22);

  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v23 = (void *)getSBSRemoteAlertHandleClass_softClass;
  v50 = getSBSRemoteAlertHandleClass_softClass;
  if (!getSBSRemoteAlertHandleClass_softClass)
  {
    v42 = MEMORY[0x24BDAC760];
    v43 = 3221225472;
    v44 = __getSBSRemoteAlertHandleClass_block_invoke;
    v45 = &unk_2515A2C50;
    v46 = &v47;
    __getSBSRemoteAlertHandleClass_block_invoke((uint64_t)&v42);
    v23 = (void *)v48[3];
  }
  v24 = objc_retainAutorelease(v23);
  _Block_object_dispose(&v47, 8);
  v25 = (SBSRemoteAlertHandle *)objc_msgSend(v24, "newHandleWithDefinition:configurationContext:", v13, v16);
  alertHandle = self->_alertHandle;
  self->_alertHandle = v25;

  -[SBSRemoteAlertHandle registerObserver:](self->_alertHandle, "registerObserver:", self);
  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v27 = (void *)getSBSRemoteAlertActivationContextClass_softClass;
  v50 = getSBSRemoteAlertActivationContextClass_softClass;
  if (!getSBSRemoteAlertActivationContextClass_softClass)
  {
    v42 = MEMORY[0x24BDAC760];
    v43 = 3221225472;
    v44 = __getSBSRemoteAlertActivationContextClass_block_invoke;
    v45 = &unk_2515A2C50;
    v46 = &v47;
    __getSBSRemoteAlertActivationContextClass_block_invoke((uint64_t)&v42);
    v27 = (void *)v48[3];
  }
  v28 = objc_retainAutorelease(v27);
  _Block_object_dispose(&v47, 8);
  v29 = objc_alloc_init(v28);
  getSBSRemoteAlertPresentationTargetClass();
  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_initWithTargetPredicate_))
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x2050000000;
    v37 = (void *)getSBSRemoteAlertPresentationTargetPredicateClass_softClass;
    v50 = getSBSRemoteAlertPresentationTargetPredicateClass_softClass;
    if (!getSBSRemoteAlertPresentationTargetPredicateClass_softClass)
    {
      v42 = MEMORY[0x24BDAC760];
      v43 = 3221225472;
      v44 = __getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke;
      v45 = &unk_2515A2C50;
      v46 = &v47;
      __getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke((uint64_t)&v42, v30, v31, v32, v33, v34, v35, v36, v41);
      v37 = (void *)v48[3];
    }
    v38 = objc_retainAutorelease(v37);
    _Block_object_dispose(&v47, 8);
    objc_msgSend(v38, "predicateForLaunchingApplicationIdentity:", v8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(objc_alloc((Class)getSBSRemoteAlertPresentationTargetClass()), "initWithTargetPredicate:", v39);
    objc_msgSend(v40, "setShouldDismissInSwitcher:", 0);
    objc_msgSend(v29, "setPresentationTarget:", v40);

  }
  -[SBSRemoteAlertHandle activateWithContext:](self->_alertHandle, "activateWithContext:", v29);

}

- (void)didCancelRequestHandle:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__PDCPrivacyAlertPresenter_didCancelRequestHandle___block_invoke;
  v7[3] = &unk_2515A2C00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __51__PDCPrivacyAlertPresenter_didCancelRequestHandle___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_2449FF000, v4, OS_LOG_TYPE_INFO, "Did active remote alert, handle : [%p]", (uint8_t *)&v5, 0xCu);
  }

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  PDCPrivacyAlertPresenter *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v12 = v4;
    _os_log_impl(&dword_2449FF000, v5, OS_LOG_TYPE_INFO, "Did deactive remote alert, handle : [%p]", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__PDCPrivacyAlertPresenter_remoteAlertHandleDidDeactivate___block_invoke;
  v8[3] = &unk_2515A2C00;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(queue, v8);

}

void __59__PDCPrivacyAlertPresenter_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v1 == *(void **)(v2 + 8))
  {
    *(_QWORD *)(v2 + 8) = 0;

  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__PDCPrivacyAlertPresenter_remoteAlertHandle_didInvalidateWithError___block_invoke;
  block[3] = &unk_2515A2C28;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __69__PDCPrivacyAlertPresenter_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __69__PDCPrivacyAlertPresenter_remoteAlertHandle_didInvalidateWithError___block_invoke_cold_1(a1, v2);
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    if (v3 == *(void **)(v4 + 8))
    {
      *(_QWORD *)(v4 + 8) = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToAlertMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
}

void __74__PDCPrivacyAlertPresenter__ensureAppIsLaunchableWithIdentity_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2449FF000, a2, a3, "Application repair failed with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke_10_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2449FF000, a2, a3, "Error to receive user response from remote alert: [%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __69__PDCPrivacyAlertPresenter_remoteAlertHandle_didInvalidateWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 134218242;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_2449FF000, a2, OS_LOG_TYPE_ERROR, "Invalidate remote alert, handle : [%p], error: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
