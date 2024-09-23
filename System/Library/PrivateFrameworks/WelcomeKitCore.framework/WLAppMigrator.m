@implementation WLAppMigrator

- (WLAppMigrator)initWithDevice:(id)a3 sqlController:(id)a4
{
  id v6;
  id v7;
  WLAppMigrator *v8;
  WLAppMigrator *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WLAppMigrator;
  v8 = -[WLAppMigrator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[WLAppMigrator setDevice:](v8, "setDevice:", v6);
    -[WLAppMigrator setSqlController:](v9, "setSqlController:", v7);
  }

  return v9;
}

+ (id)dataType
{
  return CFSTR("applications");
}

+ (id)contentType
{
  return CFSTR("applications");
}

- (id)contentType
{
  return +[WLAppMigrator contentType](WLAppMigrator, "contentType");
}

- (id)dataType
{
  return +[WLAppMigrator dataType](WLAppMigrator, "dataType");
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "itemSize"))
    objc_msgSend(v4, "setItemSize:", 5242880);

}

- (void)importDataFromProvider:(id)a3 forSummaries:(id)a4 summaryStart:(id)a5 summaryCompletion:(id)a6
{
  id v10;
  id v11;
  uint64_t (**v12)(id, _QWORD);
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t (**v16)(id, _QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  dispatch_semaphore_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t (**v39)(id, _QWORD);
  void *v40;
  id obj;
  WLAppMigrator *v42;
  void (**v43)(id, _QWORD, id);
  _QWORD v44[4];
  id v45;
  NSObject *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (uint64_t (**)(id, _QWORD))a5;
  v43 = (void (**)(id, _QWORD, id))a6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = self;
  _WLLog();

  v13 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v14 = objc_msgSend(v11, "count", self, v36);
  v15 = v13;
  v16 = v12;
  v38 = (void *)objc_msgSend(v15, "initWithCapacity:", v14);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v11;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  v39 = v12;
  v40 = v10;
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v49 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        v22 = v16[2](v16, v21);
        v23 = (void *)MEMORY[0x2207BB344](v22);
        (*((void (**)(id, uint64_t))v10 + 2))(v10, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v47 = 0;
          objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v24, 0, &v47);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v47;
          if (v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            _WLLog();
          }
          else
          {
            v27 = (void *)objc_msgSend(v25, "mutableCopy");
            objc_msgSend(v27, "removeObjectForKey:", CFSTR("itemIcon"));
            _WLLog();
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("itemExternalID"), v42, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
              objc_msgSend(v38, "addObject:", v28);

            v16 = v39;
            v10 = v40;
          }

        }
        else
        {
          v26 = 0;
        }

        objc_autoreleasePoolPop(v23);
        v43[2](v43, v21, v26);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v38, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v31 = dispatch_semaphore_create(0);
  if (objc_msgSend(v38, "count", v42, v29, v37))
  {
    v32 = MEMORY[0x24BDAC760];
    do
    {
      if ((unint64_t)objc_msgSend(v38, "count") <= 0x32)
        v33 = objc_msgSend(v38, "count");
      else
        v33 = 50;
      objc_msgSend(v38, "subarrayWithRange:", 0, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "removeObjectsInRange:", 0, v33);
      v44[0] = v32;
      v44[1] = 3221225472;
      v44[2] = __84__WLAppMigrator_importDataFromProvider_forSummaries_summaryStart_summaryCompletion___block_invoke;
      v44[3] = &unk_24E376A98;
      v45 = v30;
      v35 = v31;
      v46 = v35;
      -[WLAppMigrator _lookupStoreItemsMatchingExternalIDs:attempt:completion:](v42, "_lookupStoreItemsMatchingExternalIDs:attempt:completion:", v34, 1, v44);
      dispatch_semaphore_wait(v35, 0xFFFFFFFFFFFFFFFFLL);

    }
    while (objc_msgSend(v38, "count"));
  }
  -[WLAppMigrator _insertMatchingApps:](v42, "_insertMatchingApps:", v30);

}

void __84__WLAppMigrator_importDataFromProvider_forSummaries_summaryStart_summaryCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  v5 = objc_msgSend(v6, "count");
  if (!a3 && v5)
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_lookupStoreItemsMatchingExternalIDs:(id)a3 attempt:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  WLAppSearchRequest *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;

  v8 = a3;
  v9 = a5;
  _WLLog();
  v10 = -[WLAppSearchRequest initWithAndroidIdentifiers:]([WLAppSearchRequest alloc], "initWithAndroidIdentifiers:", v8, self, v8);
  v11 = objc_msgSend(v8, "count");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__WLAppMigrator__lookupStoreItemsMatchingExternalIDs_attempt_completion___block_invoke;
  v14[3] = &unk_24E376AE8;
  v16 = v9;
  v17 = v11;
  v18 = a4;
  v14[4] = self;
  v15 = v8;
  v12 = v8;
  v13 = v9;
  -[WLAppSearchRequest search:](v10, "search:", v14);

}

void __73__WLAppMigrator__lookupStoreItemsMatchingExternalIDs_attempt_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void (*v17)(void);
  uint64_t v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint64_t v23;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (!v6)
  {
    v13 = objc_msgSend(v5, "count", v7, v19, 0);
    v14 = *(_QWORD *)(a1 + 56) - v13;
    objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didLookupAppsWithMatchedApps:mismatchedApps:", v13, v14);

    v16 = *(_QWORD *)(a1 + 48);
    if (!v16)
      goto LABEL_9;
    v17 = *(void (**)(void))(v16 + 16);
LABEL_8:
    v17();
    goto LABEL_9;
  }
  if (!objc_msgSend(v6, "wk_representsTransientConnectivityIssueForAttempt:", *(_QWORD *)(a1 + 64), v7, v19, v6))
  {
    v18 = *(_QWORD *)(a1 + 48);
    if (!v18)
      goto LABEL_9;
    v17 = *(void (**)(void))(v18 + 16);
    goto LABEL_8;
  }
  _WLLog();
  v8 = dispatch_time(0, 3000000000);
  dispatch_get_global_queue(25, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__WLAppMigrator__lookupStoreItemsMatchingExternalIDs_attempt_completion___block_invoke_2;
  block[3] = &unk_24E376AC0;
  v10 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 64);
  v21 = v11;
  v23 = v12;
  v22 = *(id *)(a1 + 48);
  dispatch_after(v8, v9, block);

LABEL_9:
}

uint64_t __73__WLAppMigrator__lookupStoreItemsMatchingExternalIDs_attempt_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lookupStoreItemsMatchingExternalIDs:attempt:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

- (void)_insertMatchingApps:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16, self, v18);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v25[0] = CFSTR("bundleIdentifier");
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v10;
        v25[1] = CFSTR("ITunesStoreIdentifier");
        objc_msgSend(v9, "appStoreIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v11;
        v25[2] = CFSTR("isFree");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "isFree"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26[2] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appStoreIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("isFree"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _WLLog();

        -[WLAppMigrator sqlController](self, "sqlController", self, v14, v15, v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLAppMigrator device](self, "device");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "insertMigratableApp:forDevice:", v13, v17);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v6);
  }

}

+ (void)installMigratableApps:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__WLAppMigrator_installMigratableApps_completion___block_invoke;
  v10[3] = &unk_24E376B38;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __50__WLAppMigrator_installMigratableApps_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __50__WLAppMigrator_installMigratableApps_completion___block_invoke_2;
  v2[3] = &unk_24E376B10;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  +[WLAppMigrator _sendStoreDownloadRequestForFreeMigratableApps:completion:](WLAppMigrator, "_sendStoreDownloadRequestForFreeMigratableApps:completion:", v1, v2);

}

void __50__WLAppMigrator_installMigratableApps_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);

}

+ (void)_sendStoreDownloadRequestForFreeMigratableApps:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id obj;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v35 = a4;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v50 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isFree"), v33);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        if (v13)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ITunesStoreIdentifier"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_ssItemForiTunesStoreIdentifier:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v36, "addObject:", v15);
            objc_msgSend(v14, "stringValue");
            v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v17 = objc_msgSend(v16, "UTF8String");

            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
            v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v19 = v6;
            v20 = objc_msgSend(v18, "UTF8String");

            v21 = SBSSpringBoardServerPort();
            v22 = v20;
            v6 = v19;
            MEMORY[0x2207BAEC4](v21, v17, v22);
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            _WLLog();

          }
        }
        else
        {
          objc_msgSend(v6, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v8);
  }

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v36, "count"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v24 = v36;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v46 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F78]), "initWithItem:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
        objc_msgSend(v23, "addObject:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v26);
  }

  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F88]), "initWithPurchases:", v23, v34);
    v31 = MEMORY[0x24BDAC760];
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __75__WLAppMigrator__sendStoreDownloadRequestForFreeMigratableApps_completion___block_invoke;
    v42[3] = &unk_24E376B60;
    v43 = v30;
    v44 = v35;
    v39[0] = v31;
    v39[1] = 3221225472;
    v39[2] = __75__WLAppMigrator__sendStoreDownloadRequestForFreeMigratableApps_completion___block_invoke_2;
    v39[3] = &unk_24E376B88;
    v41 = v44;
    v40 = v6;
    v32 = v30;
    objc_msgSend(v32, "startWithPurchaseResponseBlock:completionBlock:", v42, v39);

  }
  else if (v35)
  {
    (*((void (**)(id, void *, _QWORD))v35 + 2))(v35, v6, 0);
  }

}

void __75__WLAppMigrator__sendStoreDownloadRequestForFreeMigratableApps_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  objc_msgSend(v9, "error", v9, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB24A0]) & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v9, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");

  if (v6 == 16)
  {
    _WLLog();
    objc_msgSend(*(id *)(a1 + 32), "cancel");
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      objc_msgSend(v9, "error");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v3);
LABEL_6:

    }
  }

}

void __75__WLAppMigrator__sendStoreDownloadRequestForFreeMigratableApps_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  _WLLog();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    if (v5)
      v4 = 0;
    else
      v4 = *(_QWORD *)(a1 + 32);
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
  }

}

+ (id)_ssItemForiTunesStoreIdentifier:(id)a3
{
  id v3;
  id v4;
  dispatch_semaphore_t v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BEB1E68]);
  objc_msgSend(v4, "setValue:forParameter:", v3, *MEMORY[0x24BEB2700]);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__WLAppMigrator__ssItemForiTunesStoreIdentifier___block_invoke;
  v10[3] = &unk_24E376BB0;
  v6 = v3;
  v11 = v6;
  v13 = &v14;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v4, "startWithItemLookupBlock:", v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __49__WLAppMigrator__ssItemForiTunesStoreIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v5)
    _WLLog();
  if (v9 && objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (WLFeaturePayload)featurePayload
{
  return (WLFeaturePayload *)objc_loadWeakRetained((id *)&self->_featurePayload);
}

- (void)setFeaturePayload:(id)a3
{
  objc_storeWeak((id *)&self->_featurePayload, a3);
}

- (WLSourceDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (WLSQLController)sqlController
{
  return self->_sqlController;
}

- (void)setSqlController:(id)a3
{
  objc_storeStrong((id *)&self->_sqlController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlController, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_featurePayload);
}

@end
