@implementation WCRAutoAssetClient

- (WCRAutoAssetClient)initWithError:(id *)a3
{
  WCRAutoAssetClient *v4;
  WCRAutoAssetClient *v5;
  BOOL v6;
  id v7;
  void *v8;
  WCRAutoAssetClient *v9;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WCRAutoAssetClient;
  v4 = -[WCRAutoAssetClient init](&v12, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  v11 = 0;
  v6 = -[WCRAutoAssetClient _createInterestInAssetType:withAssetSpecifier:withError:](v4, "_createInterestInAssetType:withAssetSpecifier:withError:", CFSTR("com.apple.MobileAsset.WebContentRestrictions"), CFSTR("WebContentRestrictionsFilterAssets"), &v11);
  v7 = v11;
  v8 = v7;
  if (v6)
  {

LABEL_4:
    v9 = v5;
    goto LABEL_8;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  v9 = 0;
LABEL_8:

  return v9;
}

- (void)_handleAssetChangedNotification
{
  void *v3;
  void (**v4)(void);

  -[WCRAutoAssetClient assetDidChangeHandler](self, "assetDidChangeHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WCRAutoAssetClient assetDidChangeHandler](self, "assetDidChangeHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)_registerForNotificationsForAssetType:(id)a3 andAssetSpecifier:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  _QWORD v15[5];
  int out_token;

  v6 = a4;
  v7 = a3;
  v8 = (const char *)objc_msgSend(CFSTR("com.apple.WebContentRestrictions.notifyQueue"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create(v8, v9);
  -[WCRAutoAssetClient setNotifyQueue:](self, "setNotifyQueue:", v10);

  objc_msgSend(MEMORY[0x24BE66BC0], "notifyRegistrationName:forAssetType:forAssetSpecifier:", CFSTR("ASSET_VERSION_DOWNLOADED"), v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  out_token = -1;
  v12 = objc_retainAutorelease(v11);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  -[WCRAutoAssetClient notifyQueue](self, "notifyQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__WCRAutoAssetClient__registerForNotificationsForAssetType_andAssetSpecifier___block_invoke;
  v15[3] = &unk_251BCC0E0;
  v15[4] = self;
  notify_register_dispatch(v13, &out_token, v14, v15);

}

uint64_t __78__WCRAutoAssetClient__registerForNotificationsForAssetType_andAssetSpecifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAssetChangedNotification");
}

- (void)registerForAssetChangedNotificationsWithBlock:(id)a3
{
  if (a3)
    -[WCRAutoAssetClient setAssetDidChangeHandler:](self, "setAssetDidChangeHandler:");
  -[WCRAutoAssetClient _registerForNotificationsForAssetType:andAssetSpecifier:](self, "_registerForNotificationsForAssetType:andAssetSpecifier:", CFSTR("com.apple.MobileAsset.WebContentRestrictions"), CFSTR("WebContentRestrictionsFilterAssets"));
}

- (BOOL)_createInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4 withError:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;

  v8 = (objc_class *)MEMORY[0x24BE66BD0];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initForAssetType:withAssetSpecifier:", v10, v9);

  -[WCRAutoAssetClient setCurrentAssetSelector:](self, "setCurrentAssetSelector:", v11);
  v12 = objc_alloc(MEMORY[0x24BE66BB8]);
  -[WCRAutoAssetClient currentAssetSelector](self, "currentAssetSelector");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v14 = (void *)objc_msgSend(v12, "initForClientName:selectingAsset:error:", CFSTR("WebContentRestrictions.framework"), v13, &v25);
  v15 = v25;

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to create auto-asset instance: %@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v16, 1);

    v17 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v15);
  }
  else
  {
    objc_msgSend(v14, "interestInContentSync:", CFSTR("Needed for web content restrictions"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v17 = v18 == 0;
    v20 = (void *)MEMORY[0x24BDD17C8];
    if (v18)
    {
      objc_msgSend(v18, "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Failed to set interest in content: %@"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[WCRLogging log:withType:](WCRLogging, "log:withType:", v22, 1);

      if (a5)
        *a5 = objc_retainAutorelease(v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Successfully set interest in MobileAsset content"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[WCRLogging log:withType:](WCRLogging, "log:withType:", v23, 0);

    }
  }

  return v17;
}

- (void)_removeInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4 withError:(id *)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = (void *)MEMORY[0x24BE66BB8];
  -[WCRAutoAssetClient currentAssetSelector](self, "currentAssetSelector", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eliminateAllForSelectorSync:", v6);
  v9 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to eliminate asset: %@"), v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v8, 1);

    v7 = (void *)v9;
  }

}

- (id)_lockLocalAsset
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  id v21;
  id v22;

  v3 = objc_alloc(MEMORY[0x24BE66BB8]);
  -[WCRAutoAssetClient currentAssetSelector](self, "currentAssetSelector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v5 = (void *)objc_msgSend(v3, "initForClientName:selectingAsset:error:", CFSTR("WebContentRestrictions.framework"), v4, &v22);
  v6 = v22;

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Unable to create auto-asset instance: %@"), v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v9, 1);
    v10 = 0;
  }
  else
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setUserInitiated:", 1);
    v20 = 0;
    v21 = 0;
    v19 = 0;
    objc_msgSend(v5, "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:", CFSTR("Needed for web content restrictions"), v8, 0, &v21, &v20, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;
    v12 = v20;
    v13 = v19;
    v14 = v13;
    if (v13)
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v13, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Unable to lock any version of auto-asset content: %@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[WCRLogging log:withType:](WCRLogging, "log:withType:", v17, 1);

      v10 = 0;
    }
    else
    {
      if (v9)
        -[WCRAutoAssetClient setCurrentAssetSelector:](self, "setCurrentAssetSelector:", v9);
      objc_msgSend(v11, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

- (void)_endLocalAssetLocks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = (void *)MEMORY[0x24BE66BB8];
  -[WCRAutoAssetClient currentAssetSelector](self, "currentAssetSelector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endAllPreviousLocksOfSelectorSync:forClientName:", v3, CFSTR("WebContentRestrictions.framework"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to end asset locks: %@"), v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Ended local asset locks"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 0;
  }
  +[WCRLogging log:withType:](WCRLogging, "log:withType:", v5, v6);

}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notifyQueue, a3);
}

- (id)assetDidChangeHandler
{
  return self->_assetDidChangeHandler;
}

- (void)setAssetDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MAAutoAssetSelector)currentAssetSelector
{
  return self->_currentAssetSelector;
}

- (void)setCurrentAssetSelector:(id)a3
{
  objc_storeStrong((id *)&self->_currentAssetSelector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssetSelector, 0);
  objc_storeStrong(&self->_assetDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

@end
