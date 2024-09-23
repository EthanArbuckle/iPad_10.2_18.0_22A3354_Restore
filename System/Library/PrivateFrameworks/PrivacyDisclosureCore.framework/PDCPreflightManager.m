@implementation PDCPreflightManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consentStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)_requiresPreflightForApplication:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  id v10;

  v4 = a3;
  v10 = 0;
  objc_msgSend(v4, "findApplicationRecordWithError:", &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v6)
  {
    v7 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      PDCCurrentRegulatoryDisclosureVersionForApplicationIdentity_cold_1((uint64_t)v4, (uint64_t)v6, v7);
    v8 = 0;
  }
  else
  {
    v8 = -[PDCPreflightManager _requiresPreflightForApplicationRecord:](self, "_requiresPreflightForApplicationRecord:", v5);
  }

  return v8;
}

- (BOOL)_requiresPreflightForApplicationRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  if (+[PDCPreflightManager isPreflightFeatureEnabled](PDCPreflightManager, "isPreflightFeatureEnabled"))
  {
    objc_msgSend(v4, "regulatoryPrivacyDisclosureVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PDCPreflightManager consentStore](self, "consentStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userConsentedRegulatoryDisclosureVersionForBundleIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v5, "isEqual:", v8) ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (BOOL)isPreflightFeatureEnabled
{
  if (isPreflightFeatureEnabled_once != -1)
    dispatch_once(&isPreflightFeatureEnabled_once, &__block_literal_global_4);
  return isPreflightFeatureEnabled_result;
}

- (PDCPreflightManager)initWithTargetQueue:(id)a3
{
  id v4;
  void *v5;
  PDCPreflightManager *v6;

  v4 = a3;
  PDCGlobalConsentStoreInstance();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PDCPreflightManager initWithTargetQueue:consentStore:](self, "initWithTargetQueue:consentStore:", v4, v5);

  return v6;
}

- (PDCPreflightManager)initWithTargetQueue:(id)a3 consentStore:(id)a4
{
  NSObject *v6;
  id v7;
  PDCPreflightManager *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  PDCPreflightManager *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PDCPreflightManager;
  v8 = -[PDCPreflightManager init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PDCPreflightManager.0x%p"), v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create_with_target_V2(v10, v11, v6);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v8->_consentStore, a4);
    v14 = v8;

  }
  return v8;
}

- (id)_preflightLaunchForApplication:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  PDCPreflightRequestHandle *v8;
  void *v9;
  id *v10;
  PDCPreflightRequestHandle *v11;
  NSObject *queue;
  _QWORD v14[4];
  PDCPreflightRequestHandle *v15;
  _QWORD block[4];
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[PDCPreflightManager _requiresPreflightForApplication:](self, "_requiresPreflightForApplication:", v6))
  {
    v8 = -[PDCPreflightRequestHandle initWithQueue:completionHandler:]([PDCPreflightRequestHandle alloc], "initWithQueue:completionHandler:", self->_queue, v7);
    +[PDCPrivacyAlertPresenter sharedPresenter](PDCPrivacyAlertPresenter, "sharedPresenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __76__PDCPreflightManager__preflightLaunchForApplication_withCompletionHandler___block_invoke_2;
    v14[3] = &unk_2515A2D50;
    v10 = (id *)&v15;
    v11 = v8;
    v15 = v11;
    objc_msgSend(v9, "activateRemoteAlertWithIdentity:requestHandle:forcePresent:completionHandler:", v6, v11, 0, v14);

  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__PDCPreflightManager__preflightLaunchForApplication_withCompletionHandler___block_invoke;
    block[3] = &unk_2515A2D28;
    v10 = &v17;
    v17 = v7;
    dispatch_async(queue, block);
    +[PDCPreflightRequestHandle alreadyCompletedRequestHandle](PDCPreflightRequestHandle, "alreadyCompletedRequestHandle");
    v11 = (PDCPreflightRequestHandle *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

uint64_t __76__PDCPreflightManager__preflightLaunchForApplication_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PDCPreflightManager__preflightLaunchForApplication_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if ((unint64_t)(a2 - 1) > 2)
    v2 = 0;
  else
    v2 = qword_244A041E8[a2 - 1];
  return objc_msgSend(*(id *)(a1 + 32), "completeRequestWithResponse:", v2);
}

void __48__PDCPreflightManager_isPreflightFeatureEnabled__block_invoke()
{
  char v0;
  int v1;
  char v2;
  char v3;
  char v4;
  char v5;

  v0 = _os_feature_enabled_impl();
  if (isGreenTea_once != -1)
    dispatch_once(&isGreenTea_once, &__block_literal_global_40);
  v1 = isGreenTea_result;
  v2 = _os_feature_enabled_impl();
  v3 = ct_green_tea_logging_enabled();
  if (isRunningInDemoMode_once != -1)
    dispatch_once(&isRunningInDemoMode_once, &__block_literal_global_43);
  if (v1)
    v4 = 1;
  else
    v4 = v2;
  if (isRunningInDemoMode_result)
    v5 = 0;
  else
    v5 = v4;
  isPreflightFeatureEnabled_result = v5 & (v0 | v3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (PDCConsentStore)consentStore
{
  return self->_consentStore;
}

- (void)setConsentStore:(id)a3
{
  objc_storeStrong((id *)&self->_consentStore, a3);
}

@end
