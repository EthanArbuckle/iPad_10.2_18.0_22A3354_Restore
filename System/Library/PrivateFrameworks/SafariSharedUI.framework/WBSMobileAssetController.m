@implementation WBSMobileAssetController

- (WBSMobileAssetController)initWithMobileAssetType:(id)a3 updateDateDefaultsKey:(id)a4 updateInterval:(double)a5 minimumDelay:(double)a6
{
  id v11;
  id v12;
  WBSMobileAssetController *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *internalQueue;
  id v16;
  void *v17;
  uint64_t v18;
  WBSPeriodicActivityScheduler *scheduler;
  WBSMobileAssetController *v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSMobileAssetController;
  v13 = -[WBSMobileAssetController init](&v25, sel_init);
  if (v13)
  {
    objc_initWeak(&location, v13);
    objc_storeStrong((id *)&v13->_assetType, a3);
    objc_storeStrong((id *)&v13->_updateDateDefaultsKey, a4);
    v13->_updateInterval = a5;
    v14 = dispatch_queue_create("com.apple.SafariSharedUI.WBSMobileAssetController.internalQueue", 0);
    internalQueue = v13->_internalQueue;
    v13->_internalQueue = (OS_dispatch_queue *)v14;

    v16 = objc_alloc(MEMORY[0x1E0D8A178]);
    -[WBSMobileAssetController lastUpdateDate](v13, "lastUpdateDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __102__WBSMobileAssetController_initWithMobileAssetType_updateDateDefaultsKey_updateInterval_minimumDelay___block_invoke;
    v22[3] = &unk_1E5441F48;
    objc_copyWeak(&v23, &location);
    v18 = objc_msgSend(v16, "initWithInterval:minimumDelay:lastFireDate:block:", v17, v22, a5, a6);
    scheduler = v13->_scheduler;
    v13->_scheduler = (WBSPeriodicActivityScheduler *)v18;

    v20 = v13;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __102__WBSMobileAssetController_initWithMobileAssetType_updateDateDefaultsKey_updateInterval_minimumDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_update");

}

- (WBSMobileAssetController)initWithMobileAssetType:(id)a3 updateInterval:(double)a4 minimumDelay:(double)a5
{
  id v8;
  void *v9;
  WBSMobileAssetController *v10;

  v8 = a3;
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(".UpdateDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WBSMobileAssetController initWithMobileAssetType:updateDateDefaultsKey:updateInterval:minimumDelay:](self, "initWithMobileAssetType:updateDateDefaultsKey:updateInterval:minimumDelay:", v8, v9, a4, a5);

  return v10;
}

- (void)downloadMobileAssetBackgroundImage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__WBSMobileAssetController_downloadMobileAssetBackgroundImage_completionHandler___block_invoke;
  v8[3] = &unk_1E5444928;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[WBSMobileAssetController _queryBackgroundImageAsset:completionHandler:](self, "_queryBackgroundImageAsset:completionHandler:", a3, v8);

}

void __81__WBSMobileAssetController_downloadMobileAssetBackgroundImage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void (*v9)(void);
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(a2, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "state") != 2)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __81__WBSMobileAssetController_downloadMobileAssetBackgroundImage_completionHandler___block_invoke_2;
        v11[3] = &unk_1E5444900;
        v10 = *(void **)(a1 + 40);
        v11[4] = *(_QWORD *)(a1 + 32);
        v13 = v10;
        v12 = v8;
        objc_msgSend(v12, "startDownload:", v11);

        goto LABEL_9;
      }
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v9();
LABEL_9:

    goto LABEL_10;
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "mobileAssetController:didFailDownload:", *(_QWORD *)(a1 + 32), v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_10:

}

uint64_t __81__WBSMobileAssetController_downloadMobileAssetBackgroundImage_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2 > 0xE || ((1 << a2) & 0x4401) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to download catalog for %@: %zd"), *(_QWORD *)(v5 + 40), a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("MADownLoadResult"), a2, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "mobileAssetController:didFailDownload:", v5, v8);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_queryBackgroundImageAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)getMAAssetQueryClass()), "initWithType:", self->_assetType);
  objc_msgSend(v8, "addKeyValuePair:with:", CFSTR("FileName"), v7);

  objc_msgSend(v8, "addKeyValuePair:with:", CFSTR("IsThumbnail"), CFSTR("NO"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__WBSMobileAssetController__queryBackgroundImageAsset_completionHandler___block_invoke;
  v11[3] = &unk_1E5444990;
  v12 = v8;
  v13 = v6;
  v9 = v6;
  v10 = v8;
  objc_msgSend(v10, "queryMetaDataWithError:", v11);

}

void __73__WBSMobileAssetController__queryBackgroundImageAsset_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_25);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __73__WBSMobileAssetController__queryBackgroundImageAsset_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a2;
  objc_msgSend(a3, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getASAttributeContentVersion();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  getASAttributeContentVersion();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

- (WBSMobileAssetControllerDelegate)delegate
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__WBSMobileAssetController_delegate__block_invoke;
  v5[3] = &unk_1E5444748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WBSMobileAssetControllerDelegate *)v3;
}

void __36__WBSMobileAssetController_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__WBSMobileAssetController_setDelegate___block_invoke;
  v7[3] = &unk_1E5441848;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __40__WBSMobileAssetController_setDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(id *)(a1 + 40);

  if (WeakRetained != v3)
  {
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__WBSMobileAssetController_setDelegate___block_invoke_2;
    v7[3] = &unk_1E54449B8;
    v4 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    objc_msgSend(v4, "_queryMostRecentAsset:", v7);

  }
}

void __40__WBSMobileAssetController_setDelegate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  if (a3)
  {
    objc_msgSend(v6, "mobileAssetController:didFailRetrieve:", v7, a3);
  }
  else
  {
    objc_msgSend(v5, "getLocalFileUrl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mobileAssetController:didBecomeAvailable:withAttributes:", v7, v8, v9);

  }
}

- (NSDate)lastUpdateDate
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dateForKey:", self->_updateDateDefaultsKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (void)setLastUpdateDate:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  objc_msgSend(v4, "standardUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_setDate:forKey:", v5, self->_updateDateDefaultsKey);

}

- (void)_update
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WBSMobileAssetController__update__block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __35__WBSMobileAssetController__update__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(WeakRetained, "mobileAssetControllerShouldPerformScheduledUpdate:", *(_QWORD *)(a1 + 32)))
  {
    v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __35__WBSMobileAssetController__update__block_invoke_2;
    v4[3] = &unk_1E5441CB8;
    v4[4] = v3;
    objc_msgSend(v3, "_updateCatalog:", v4);
  }

}

uint64_t __35__WBSMobileAssetController__update__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__WBSMobileAssetController__update__block_invoke_3;
  v3[3] = &unk_1E54449E0;
  v3[4] = v1;
  return objc_msgSend(v1, "_downloadIfNecessary:", v3);
}

void __35__WBSMobileAssetController__update__block_invoke_3(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v9 = WeakRetained;
  if (v7)
  {
    objc_msgSend(WeakRetained, "mobileAssetController:didFailDownload:", *(_QWORD *)(a1 + 32), v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastUpdateDate:", v10);

    if (a3)
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v14, "getLocalFileUrl");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "attributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mobileAssetController:didDownload:withAttributes:", v11, v12, v13);

    }
  }

}

- (void)_updateCatalog:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSString *assetType;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)getMAAssetClass_softClass;
  v16 = getMAAssetClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getMAAssetClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getMAAssetClass_block_invoke;
    v12[3] = &unk_1E54424C0;
    v12[4] = &v13;
    __getMAAssetClass_block_invoke((uint64_t)v12);
    v5 = (void *)v14[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  assetType = self->_assetType;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __43__WBSMobileAssetController__updateCatalog___block_invoke;
  v10[3] = &unk_1E5444A08;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v7, "startCatalogDownload:then:", assetType, v10);

}

uint64_t __43__WBSMobileAssetController__updateCatalog___block_invoke(uint64_t a1, unint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2 > 0xE || ((1 << a2) & 0x4401) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to download catalog for %@: %i"), *(_QWORD *)(v5 + 40), a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("MADownLoadResult"), a2, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "mobileAssetController:didFailCatalogDownload:", v5, v8);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_queryAssets:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)getMAAssetQueryClass()), "initWithType:", self->_assetType);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "mobileAssetController:willPerformQuery:", self, v5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__WBSMobileAssetController__queryAssets___block_invoke;
  v9[3] = &unk_1E5444A08;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v8, "queryMetaData:", v9);

}

void __41__WBSMobileAssetController__queryAssets___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_205);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __41__WBSMobileAssetController__queryAssets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a2;
  objc_msgSend(a3, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getASAttributeContentVersion();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  getASAttributeContentVersion();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

- (void)queryURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__WBSMobileAssetController_queryURL___block_invoke;
  v6[3] = &unk_1E5444A50;
  v7 = v4;
  v5 = v4;
  -[WBSMobileAssetController _queryMostRecentAsset:](self, "_queryMostRecentAsset:", v6);

}

void __37__WBSMobileAssetController_queryURL___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(a2, "getLocalFileUrl");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

- (void)_queryMostRecentAsset:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__WBSMobileAssetController__queryMostRecentAsset___block_invoke;
  v6[3] = &unk_1E5444928;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSMobileAssetController _queryAssets:](self, "_queryAssets:", v6);

}

void __50__WBSMobileAssetController__queryMostRecentAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "mobileAssetController:didFailDownload:", *(_QWORD *)(a1 + 32), v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "state") == 2)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }

    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find matching asset for %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("MADownLoadResult"), 18, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v16);

  }
LABEL_13:

}

- (void)_downloadIfNecessary:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__WBSMobileAssetController__downloadIfNecessary___block_invoke;
  v6[3] = &unk_1E5444928;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSMobileAssetController _queryAssets:](self, "_queryAssets:", v6);

}

void __49__WBSMobileAssetController__downloadIfNecessary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v5 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "mobileAssetController:didFailDownload:", *(_QWORD *)(a1 + 32), v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "state") == 2)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __49__WBSMobileAssetController__downloadIfNecessary___block_invoke_2;
      v9[3] = &unk_1E5444900;
      v8 = *(void **)(a1 + 40);
      v9[4] = *(_QWORD *)(a1 + 32);
      v11 = v8;
      v10 = v7;
      objc_msgSend(v10, "startDownload:", v9);

    }
  }

}

uint64_t __49__WBSMobileAssetController__downloadIfNecessary___block_invoke_2(uint64_t a1, unint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2 > 0xE || ((1 << a2) & 0x4401) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to download catalog for %@: %i"), *(_QWORD *)(v5 + 40), a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("MADownLoadResult"), a2, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "mobileAssetController:didFailDownload:", v5, v8);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)updateDateDefaultsKey
{
  return self->_updateDateDefaultsKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDateDefaultsKey, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
