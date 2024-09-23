@implementation WLMigrationDataCoordinator

- (WLMigrationDataCoordinator)init
{
  WLMigrationDataCoordinator *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WLMigrationDataCoordinator;
  v2 = -[WLMigrationDataCoordinator init](&v6, sel_init);
  if (v2)
  {
    NSHomeDirectory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("/Library/WelcomeKit/Downloads/"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLMigrationDataCoordinator setDownloadsPath:](v2, "setDownloadsPath:", v4);

  }
  return v2;
}

- (void)setStashDataLocally:(BOOL)a3
{
  self->_stashDataLocally = a3;
  if (a3)
    +[WLLocalDataSource deleteLocalData](WLLocalDataSource, "deleteLocalData");
}

- (void)fetchAccountsAndSummariesFromSource:(id)a3 forMigrator:(id)a4 statistics:(id)a5 accountsRequestDurationBlock:(id)a6 summariesRequestDurationBlock:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v15, "contentType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("fetch '%@' accounts and summaries"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __159__WLMigrationDataCoordinator_fetchAccountsAndSummariesFromSource_forMigrator_statistics_accountsRequestDurationBlock_summariesRequestDurationBlock_completion___block_invoke;
  v30[3] = &unk_24E3759F0;
  v30[4] = self;
  v31 = v14;
  v32 = v15;
  v33 = v16;
  v34 = v22;
  v35 = v17;
  v36 = v18;
  v37 = v19;
  v23 = v19;
  v24 = v18;
  v25 = v22;
  v26 = v16;
  v27 = v15;
  v28 = v14;
  v29 = v17;
  -[WLMigrationDataCoordinator _fetchAccountsFromSource:forMigrator:statistics:completion:](self, "_fetchAccountsFromSource:forMigrator:statistics:completion:", v28, v27, v26, v30);

}

void __159__WLMigrationDataCoordinator_fetchAccountsAndSummariesFromSource_forMigrator_statistics_accountsRequestDurationBlock_summariesRequestDurationBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4, double a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id obj;
  dispatch_semaphore_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  uint64_t *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v21 = a3;
  if (a4)
  {
    v10 = *(_QWORD *)(a1 + 72);
    if (v10)
      (*(void (**)(double))(v10 + 16))(a5);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  v41 = 0;
  v24 = dispatch_semaphore_create(0);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v33;
LABEL_6:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v12)
        objc_enumerationMutation(obj);
      v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v13);
      v15 = *(void **)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      v18 = *(_QWORD *)(a1 + 56);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __159__WLMigrationDataCoordinator_fetchAccountsAndSummariesFromSource_forMigrator_statistics_accountsRequestDurationBlock_summariesRequestDurationBlock_completion___block_invoke_5;
      v26[3] = &unk_24E3759C8;
      v26[4] = v15;
      v27 = *(id *)(a1 + 64);
      v31 = &v36;
      v30 = *(id *)(a1 + 80);
      v28 = v25;
      v19 = v24;
      v29 = v19;
      objc_msgSend(v15, "_fetchSummariesFromSource:forMigrator:account:statistics:completion:", v16, v17, v14, v18, v26);
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
      LOBYTE(v17) = v37[5] == 0;

      if ((v17 & 1) == 0)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
        if (v11)
          goto LABEL_6;
        break;
      }
    }
  }

  v20 = *(_QWORD *)(a1 + 88);
  if (v20)
    (*(void (**)(void))(v20 + 16))();

  _Block_object_dispose(&v36, 8);
}

void __159__WLMigrationDataCoordinator_fetchAccountsAndSummariesFromSource_forMigrator_statistics_accountsRequestDurationBlock_summariesRequestDurationBlock_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = v7;
    v10 = *(_QWORD *)(a1 + 32);
    _WLLog();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
  v9 = *(_QWORD *)(a1 + 64);
  if (v9)
    (*(void (**)(double))(v9 + 16))(a4);
  if (objc_msgSend(v13, "count", v10, v11, v12))
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v13);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

- (void)_fetchAccountsFromSource:(id)a3 forMigrator:(id)a4 statistics:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WLSourceDeviceAccount *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(v11, "accountBased") & 1) != 0)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "contentType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("fetch '%@' accounts"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    _WLLog();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __89__WLMigrationDataCoordinator__fetchAccountsFromSource_forMigrator_statistics_completion___block_invoke;
    v19[3] = &unk_24E375A18;
    v20 = v12;
    v21 = v13;
    objc_msgSend(v10, "accountsDataForMigrator:completion:", v11, v19, self, v16);

    v17 = v20;
LABEL_5:

    goto LABEL_6;
  }
  v18 = objc_alloc_init(WLSourceDeviceAccount);
  v16 = v18;
  if (v13)
  {
    v22[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD, double))v13 + 2))(v13, v17, 0, 0, 0.0);
    goto LABEL_5;
  }
LABEL_6:

}

void __89__WLMigrationDataCoordinator__fetchAccountsFromSource_forMigrator_statistics_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a4;
  v11 = *(void **)(a1 + 32);
  if (v9)
  {
    v24 = v10;
    objc_msgSend(v11, "addToFetchByteCount:", a3);
    objc_msgSend(*(id *)(a1 + 32), "incrementFetchRequestCount");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dataItemSummaries"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[WLSourceDeviceAccount accountInfoArrayContainsNonSyncableAccount:](WLSourceDeviceAccount, "accountInfoArrayContainsNonSyncableAccount:", v13);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19);
          if (!v14
            || !+[WLSourceDeviceAccount accountInfoRepresentsSyncableAccount:](WLSourceDeviceAccount, "accountInfoRepresentsSyncableAccount:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19)))
          {
            +[WLSourceDeviceAccount accountWithInfo:](WLSourceDeviceAccount, "accountWithInfo:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v21);

          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

    v22 = *(_QWORD *)(a1 + 40);
    if (v22)
      (*(void (**)(uint64_t, void *, _QWORD, uint64_t, double))(v22 + 16))(v22, v12, 0, 1, a5);

    v10 = v24;
  }
  else
  {
    objc_msgSend(v11, "incrementFetchFailedRequestCount");
    v23 = *(_QWORD *)(a1 + 40);
    if (v23)
      (*(void (**)(uint64_t, _QWORD, id, uint64_t, double))(v23 + 16))(v23, 0, v10, 1, a5);
  }

}

- (void)_fetchSummariesFromSource:(id)a3 forMigrator:(id)a4 account:(id)a5 statistics:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  WLMigrationDataCoordinator *v25;
  _QWORD v26[4];
  id v27;
  WLMigrationDataCoordinator *v28;
  id v29;
  id v30;
  id v31;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x24BDD17C8];
  v17 = a3;
  objc_msgSend(v12, "contentType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("fetch data summaries for '%@' account '%@'"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = self;
  _WLLog();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __98__WLMigrationDataCoordinator__fetchSummariesFromSource_forMigrator_account_statistics_completion___block_invoke;
  v26[3] = &unk_24E375A40;
  v27 = v14;
  v28 = self;
  v29 = v12;
  v30 = v13;
  v31 = v15;
  v21 = v15;
  v22 = v13;
  v23 = v12;
  v24 = v14;
  objc_msgSend(v17, "summariesDataForAccount:migrator:completion:", v22, v23, v26, v25, v20);

}

void __98__WLMigrationDataCoordinator__fetchSummariesFromSource_forMigrator_account_statistics_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a4;
  v11 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v11, "addToFetchByteCount:", a3);
    objc_msgSend(*(id *)(a1 + 32), "incrementFetchRequestCount");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dataItemSummaries"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "contentType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count", v13, v14, v15, v25));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v12;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(a1 + 40), "_recordSummaryForMigrator:withInfo:account:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v21), *(_QWORD *)(a1 + 56));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v16, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v19);
    }

    v23 = *(_QWORD *)(a1 + 64);
    if (v23)
      (*(void (**)(uint64_t, void *, _QWORD, double))(v23 + 16))(v23, v16, 0, a5);

  }
  else
  {
    objc_msgSend(v11, "incrementFetchFailedRequestCount");
    v24 = *(_QWORD *)(a1 + 64);
    if (v24)
      (*(void (**)(uint64_t, _QWORD, id, double))(v24 + 16))(v24, 0, v10, a5);
  }

}

- (void)downloadFileFromSource:(id)a3 forMigrator:(id)a4 summary:(id)a5 account:(id)a6 segmentCompletion:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  WLMigrationDataCoordinator *v31;
  WLMigrationDataCoordinator *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  WLMigrationDataCoordinator *v45;
  _QWORD v46[4];
  id v47;
  WLMigrationDataCoordinator *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54[2];

  v35 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v37 = a7;
  v36 = a8;
  v17 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v15, "dataFilePath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fileURLWithPath:isDirectory:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = 0;
  v21 = objc_msgSend(v20, "removeItemAtURL:error:", v19, v54);
  v22 = v54[0];

  if ((v21 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v22, "domain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) == 0)
  {

LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = self;
    v33 = v19;
    _WLLog();

    goto LABEL_8;
  }
  v24 = v16;
  v25 = objc_msgSend(v22, "code");

  v26 = v25 == 4;
  v16 = v24;
  if (!v26)
    goto LABEL_7;
  v32 = self;
  v33 = v19;
  _WLLog();
LABEL_8:
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v14, "confirmItemSizeWithSourceBeforeDownloading", v32, v33))
  {
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __110__WLMigrationDataCoordinator_downloadFileFromSource_forMigrator_summary_account_segmentCompletion_completion___block_invoke;
    v46[3] = &unk_24E375A68;
    v47 = v15;
    v52 = v37;
    v53 = v36;
    v48 = self;
    v27 = v35;
    v49 = v35;
    v50 = v14;
    v51 = v16;
    objc_msgSend(v49, "itemSizeForSummary:migrator:completion:", v47, v50, v46);

    v28 = v47;
  }
  else
  {
    if (objc_msgSend(v15, "downloadSegmentCount", v32) != 1)
    {
      v30 = objc_msgSend(v15, "itemSize");
      v31 = self;
      v27 = v35;
      -[WLMigrationDataCoordinator _downloadFileInMultipleSegmentsFromSource:forMigrator:summary:account:itemSize:segmentCompletion:completion:](v31, "_downloadFileInMultipleSegmentsFromSource:forMigrator:summary:account:itemSize:segmentCompletion:completion:", v35, v14, v15, v16, v30, v37, v36);
      goto LABEL_15;
    }
    v29 = MEMORY[0x24BDAC760];
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __110__WLMigrationDataCoordinator_downloadFileFromSource_forMigrator_summary_account_segmentCompletion_completion___block_invoke_2;
    v43[3] = &unk_24E375A90;
    v44 = v19;
    v45 = self;
    v38[0] = v29;
    v38[1] = 3221225472;
    v38[2] = __110__WLMigrationDataCoordinator_downloadFileFromSource_forMigrator_summary_account_segmentCompletion_completion___block_invoke_3;
    v38[3] = &unk_24E375AB8;
    v38[4] = self;
    v39 = v15;
    v40 = v14;
    v41 = v37;
    v42 = v36;
    v27 = v35;
    objc_msgSend(v35, "fileForSummary:migrator:fileAccessor:completion:", v39, v40, v43, v38);

    v28 = v44;
  }

LABEL_15:
}

void __110__WLMigrationDataCoordinator_downloadFileFromSource_forMigrator_summary_account_segmentCompletion_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  WLItemSizeConfirmationCompletionAdapter *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  if (!v5)
  {
    v15 = 0;
    v7 = -[WLItemSizeConfirmationCompletionAdapter initWithUnconfirmedItemSize:segmentSize:originalSegmentCompletion:originalCompletion:]([WLItemSizeConfirmationCompletionAdapter alloc], "initWithUnconfirmedItemSize:segmentSize:originalSegmentCompletion:originalCompletion:", objc_msgSend(*(id *)(a1 + 32), "itemSize"), +[WLMigrationDataCoordinator downloadSegmentSize](WLMigrationDataCoordinator, "downloadSegmentSize"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 64);
    -[WLItemSizeConfirmationCompletionAdapter segmentCompletion](v7, "segmentCompletion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLItemSizeConfirmationCompletionAdapter completion](v7, "completion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_downloadFileInMultipleSegmentsFromSource:forMigrator:summary:account:itemSize:segmentCompletion:completion:", v8, v9, v11, v12, a2, v13, v14);

    goto LABEL_5;
  }
  v6 = *(_QWORD *)(a1 + 80);
  if (v6)
  {
    v15 = v5;
    (*(void (**)(void))(v6 + 16))();
LABEL_5:
    v5 = v15;
  }

}

id __110__WLMigrationDataCoordinator_downloadFileFromSource_forMigrator_summary_account_segmentCompletion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URLByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v6 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v14);
  v7 = v14;

  if ((_DWORD)v6)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v13 = 0;
    v6 = objc_msgSend(v9, "copyItemAtURL:toURL:error:", v3, v10, &v13);
    v7 = v13;

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  return v7;
}

void __110__WLMigrationDataCoordinator_downloadFileFromSource_forMigrator_summary_account_segmentCompletion_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (!v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "stashDataLocally");
    v3 = 0;
    if (v4)
    {
      +[WLLocalDataSource stashFileForSummary:migrator:](WLLocalDataSource, "stashFileForSummary:migrator:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v3 = 0;
    }
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, objc_msgSend(*(id *)(a1 + 40), "itemSize"));
    v3 = v7;
  }
  v6 = *(_QWORD *)(a1 + 64);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    v3 = v7;
  }

}

+ (BOOL)_allowSegmentedDownloads
{
  return objc_msgSend(a1, "downloadSegmentSize") != 0;
}

+ (unint64_t)downloadSegmentSize
{
  if (downloadSegmentSize_onceToken != -1)
    dispatch_once(&downloadSegmentSize_onceToken, &__block_literal_global_2);
  return downloadSegmentSize_downloadSegmentSize;
}

void __49__WLMigrationDataCoordinator_downloadSegmentSize__block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)CFPreferencesCopyAppValue(CFSTR("DownloadSegmentSize"), CFSTR("com.apple.welcomekit"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    downloadSegmentSize_downloadSegmentSize = objc_msgSend(v1, "unsignedIntegerValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", downloadSegmentSize_downloadSegmentSize);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

  }
}

- (void)_downloadSegmentsFromSource:(id)a3 forMigrator:(id)a4 startingAtByteLocation:(unint64_t)a5 ofSummary:(id)a6 account:(id)a7 itemSize:(unint64_t)a8 toFileHandle:(id)a9 segmentCompletion:(id)a10 completion:(id)a11
{
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  unint64_t v36;
  id v37;
  id v38;
  id v39;
  id v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  WLMigrationDataCoordinator *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;

  v41 = a3;
  v16 = a4;
  v17 = a6;
  v35 = v17;
  v34 = a7;
  v39 = a9;
  v38 = a10;
  v37 = a11;
  v18 = +[WLMigrationDataCoordinator downloadSegmentSize](WLMigrationDataCoordinator, "downloadSegmentSize");
  v36 = a8;
  if (v18 + a5 <= a8)
    v19 = v18;
  else
    v19 = a8 - a5;
  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v19;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("fetch segment from byte start %@ len %@ into file '%@' record '%@' in account '%@'"), v21, v23, v24, v25, v26);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  _WLLog();
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __162__WLMigrationDataCoordinator__downloadSegmentsFromSource_forMigrator_startingAtByteLocation_ofSummary_account_itemSize_toFileHandle_segmentCompletion_completion___block_invoke;
  v43[3] = &unk_24E375B00;
  v52 = a5;
  v53 = v22;
  v54 = v36;
  v50 = v38;
  v51 = v37;
  v44 = v39;
  v45 = self;
  v46 = v41;
  v47 = v16;
  v48 = v17;
  v49 = v34;
  v27 = v34;
  v28 = v35;
  v29 = v16;
  v30 = v41;
  v31 = v37;
  v32 = v38;
  v33 = v39;
  objc_msgSend(v30, "dataSegmentForSummary:byteRange:migrator:completion:", v28, a5, v22, v29, v43, self, v42);

}

void __162__WLMigrationDataCoordinator__downloadSegmentsFromSource_forMigrator_startingAtByteLocation_ofSummary_account_itemSize_toFileHandle_segmentCompletion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = MEMORY[0x2207BB344]();
  v7 = v12;
  v8 = (void *)v6;
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "writeData:", v12);
    objc_msgSend(*(id *)(a1 + 32), "synchronizeFile");
    v7 = v12;
  }
  if (v5)
    goto LABEL_7;
  v9 = *(_QWORD *)(a1 + 80);
  if (v9)
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, objc_msgSend(v7, "length"));
  v10 = *(_QWORD *)(a1 + 104) + *(_QWORD *)(a1 + 96);
  if (v10 == *(_QWORD *)(a1 + 112))
  {
LABEL_7:
    v11 = *(_QWORD *)(a1 + 88);
    if (v11)
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_downloadSegmentsFromSource:forMigrator:startingAtByteLocation:ofSummary:account:itemSize:toFileHandle:segmentCompletion:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v10, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  }
  objc_autoreleasePoolPop(v8);

}

- (void)_downloadFileInMultipleSegmentsFromSource:(id)a3 forMigrator:(id)a4 summary:(id)a5 account:(id)a6 itemSize:(unint64_t)a7 segmentCompletion:(id)a8 completion:(id)a9
{
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  WLMigrationDataCoordinator *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v48[4];
  id v49;
  WLMigrationDataCoordinator *v50;
  id v51;
  id v52;
  id v53;
  id v54;

  v44 = a4;
  v14 = a5;
  v15 = a9;
  v16 = (void *)MEMORY[0x24BDD1580];
  v46 = a8;
  v45 = a6;
  v17 = a3;
  objc_msgSend(v16, "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataFilePath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "createFileAtPath:contents:attributes:", v19, 0, 0);

  objc_msgSend(v14, "dataFilePath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByDeletingLastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _WLLog();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", self, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a8) = objc_msgSend(v22, "fileExistsAtPath:", v21);

  if ((a8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v24 = objc_msgSend(v23, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v54);
    v25 = v54;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v24);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v25;
    v37 = self;
    v38 = v21;
    _WLLog();

  }
  objc_msgSend(v14, "dataFilePath", v37, v38, v41, v43);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", self, v39);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataFilePath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "createFileAtPath:contents:attributes:", v27, 0, 0);

  objc_msgSend(v14, "dataFilePath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v28);
  v40 = v29;
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v30 = (void *)MEMORY[0x24BDD1578];
  objc_msgSend(v14, "dataFilePath", self, v40, v42);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "fileHandleForWritingAtPath:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  _WLLog();
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __138__WLMigrationDataCoordinator__downloadFileInMultipleSegmentsFromSource_forMigrator_summary_account_itemSize_segmentCompletion_completion___block_invoke;
  v48[3] = &unk_24E375B28;
  v49 = v32;
  v50 = self;
  v51 = v14;
  v52 = v44;
  v53 = v15;
  v33 = v15;
  v34 = v44;
  v35 = v14;
  v36 = v32;
  -[WLMigrationDataCoordinator _downloadSegmentsFromSource:forMigrator:startingAtByteLocation:ofSummary:account:itemSize:toFileHandle:segmentCompletion:completion:](self, "_downloadSegmentsFromSource:forMigrator:startingAtByteLocation:ofSummary:account:itemSize:toFileHandle:segmentCompletion:completion:", v17, v34, 0, v35, v45, a7, v36, v46, v48);

}

void __138__WLMigrationDataCoordinator__downloadFileInMultipleSegmentsFromSource_forMigrator_summary_account_itemSize_segmentCompletion_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "closeFile");
  v3 = v6;
  if (!v6)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "stashDataLocally");
    v3 = 0;
    if (v4)
    {
      +[WLLocalDataSource stashFileForSummary:migrator:](WLLocalDataSource, "stashFileForSummary:migrator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v3 = 0;
    }
  }
  v5 = *(_QWORD *)(a1 + 64);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)downloadDataFromSource:(id)a3 forMigrator:(id)a4 summary:(id)a5 account:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  WLMigrationDataCoordinator *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = a6;
  v17 = a3;
  objc_msgSend(v12, "contentType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringWithFormat:", CFSTR("fetch '%@' record '%@' in account '%@'"), v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = self;
  _WLLog();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __92__WLMigrationDataCoordinator_downloadDataFromSource_forMigrator_summary_account_completion___block_invoke;
  v27[3] = &unk_24E375B50;
  v27[4] = self;
  v28 = v21;
  v29 = v13;
  v30 = v12;
  v31 = v14;
  v22 = v14;
  v23 = v12;
  v24 = v13;
  v25 = v21;
  objc_msgSend(v17, "dataForSummary:migrator:completion:", v24, v23, v27, v26, v21);

}

void __92__WLMigrationDataCoordinator_downloadDataFromSource_forMigrator_summary_account_completion___block_invoke(uint64_t *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = a1[4];
  v7 = a1[5];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (v10 && !v5 && objc_msgSend((id)a1[4], "stashDataLocally", v6, v7, v9, 0))
    +[WLLocalDataSource stashData:forSummary:migrator:](WLLocalDataSource, "stashData:forSummary:migrator:", v10, a1[6], a1[7]);
  v8 = a1[8];
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v10, v5);

}

- (void)importDataForMigrator:(id)a3 fromProvider:(id)a4 forSummaries:(id)a5 summaryStart:(id)a6 summaryCompletion:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  void (**v15)(id, uint64_t, _QWORD);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  WLMigrationDataCoordinator *v31;
  id v32;
  WLMigrationDataCoordinator *v33;
  id obj;
  dispatch_semaphore_t v35;
  void *v36;
  void (**v37)(id, void *);
  _QWORD v38[5];
  NSObject *v39;
  void (**v40)(id, uint64_t, _QWORD);
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v37 = (void (**)(id, void *))a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD))a6;
  v15 = (void (**)(id, uint64_t, _QWORD))a7;
  v33 = self;
  if (-[WLMigrationDataCoordinator stashDataLocally](self, "stashDataLocally"))
  {
    v47 = 0u;
    v48 = 0u;
    v46 = 0u;
    v45 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          if (v14)
            v14[2](v14, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
          if (v15)
            v15[2](v15, v21, 0);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v18);
    }

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "importDataFromProvider:forSummaries:summaryStart:summaryCompletion:", v37, v13, v14, v15);
  }
  else
  {
    v36 = v12;
    v35 = dispatch_semaphore_create(0);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v32 = v13;
    obj = v13;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v42;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v42 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v25);
          v27 = (void *)MEMORY[0x2207BB344](v22);
          if (v14)
            ((void (**)(id, void *))v14)[2](v14, v26);
          v37[2](v37, v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28 || objc_msgSend(v26, "storeDataAsFile"))
          {
            objc_msgSend(v26, "account", v31);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v38[0] = MEMORY[0x24BDAC760];
            v38[1] = 3221225472;
            v38[2] = __109__WLMigrationDataCoordinator_importDataForMigrator_fromProvider_forSummaries_summaryStart_summaryCompletion___block_invoke;
            v38[3] = &unk_24E375B78;
            v40 = v15;
            v38[4] = v26;
            v30 = v35;
            v39 = v30;
            objc_msgSend(v36, "importRecordData:summary:account:completion:", v28, v26, v29, v38);

            dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
          }
          else
          {
            v31 = v33;
            _WLLog();
            if (v15)
              v15[2](v15, (uint64_t)v26, 0);
          }

          objc_autoreleasePoolPop(v27);
          ++v25;
        }
        while (v23 != v25);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        v23 = v22;
      }
      while (v22);
    }

    v12 = v36;
    v13 = v32;
  }

}

intptr_t __109__WLMigrationDataCoordinator_importDataForMigrator_fromProvider_forSummaries_summaryStart_summaryCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)updateSource:(id)a3 withProgress:(double)a4 remainingTime:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  double v18;

  v10 = a3;
  v11 = a6;
  v12 = v11;
  if (self->_doneSent)
  {
    if (v11)
      (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
  }
  else
  {
    v13 = vcvtmd_s64_f64(a4 * 100.0) | 0x4059000000000000;
    if (a4 >= 1.0)
      v14 = CFSTR("update progress to status=done (percentProgress=%d, remainingTime=%f)");
    else
      v14 = CFSTR("update progress to status=active (percentProgress=%d, remainingTime=%f)");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v14, v13, *(_QWORD *)&a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __81__WLMigrationDataCoordinator_updateSource_withProgress_remainingTime_completion___block_invoke;
    v16[3] = &unk_24E375BA0;
    v18 = a4;
    v16[4] = self;
    v17 = v12;
    objc_msgSend(v10, "updateUIWithProgress:remainingTime:logString:completion:", v15, v16, a4, a5);

  }
}

void __81__WLMigrationDataCoordinator_updateSource_withProgress_remainingTime_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  if (!v3 && *(double *)(a1 + 48) >= 1.0)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 == 0);
    v3 = v5;
  }

}

- (id)_recordSummaryForMigrator:(id)a3 withInfo:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v25;

  v8 = a3;
  v9 = a5;
  +[WLSourceDeviceRecordSummary summaryWithInfo:account:](WLSourceDeviceRecordSummary, "summaryWithInfo:account:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "storeRecordDataInDatabase");
  if ((v11 & 1) == 0)
  {
    objc_msgSend(v10, "setStoreDataAsFile:", 1);
    -[WLMigrationDataCoordinator downloadsPath](self, "downloadsPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lowercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v15, "stringByAppendingPathExtension:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v20;
    }
    objc_msgSend(v25, "stringByAppendingPathComponent:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingPathComponent:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDataFilePath:", v22);

  }
  if (((v11 | !+[WLMigrationDataCoordinator _allowSegmentedDownloads](WLMigrationDataCoordinator, "_allowSegmentedDownloads")) & 1) == 0&& objc_msgSend(v10, "itemSize")&& objc_msgSend(v8, "wantsSegmentedDownloads"))
  {
    v23 = +[WLMigrationDataCoordinator segmentCountForItemSize:segmentSize:](WLMigrationDataCoordinator, "segmentCountForItemSize:segmentSize:", objc_msgSend(v10, "itemSize"), +[WLMigrationDataCoordinator downloadSegmentSize](WLMigrationDataCoordinator, "downloadSegmentSize"));
  }
  else
  {
    v23 = 1;
  }
  objc_msgSend(v10, "setDownloadSegmentCount:", v23);
  if (!objc_msgSend(v10, "itemSize") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "estimateItemSizeForSummary:account:", v10, v9);

  return v10;
}

+ (unint64_t)segmentCountForItemSize:(unint64_t)a3 segmentSize:(unint64_t)a4
{
  if (a3 / a4 * a4 >= a3)
    return a3 / a4;
  else
    return a3 / a4 + 1;
}

- (BOOL)stashDataLocally
{
  return self->_stashDataLocally;
}

- (NSString)downloadsPath
{
  return self->_downloadsPath;
}

- (void)setDownloadsPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadsPath, 0);
}

@end
