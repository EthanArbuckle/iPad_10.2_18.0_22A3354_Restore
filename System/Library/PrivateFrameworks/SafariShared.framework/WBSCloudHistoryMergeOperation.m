@implementation WBSCloudHistoryMergeOperation

- (WBSCloudHistoryMergeOperation)initWithDatabase:(id)a3 fetchResult:(id)a4 profileServerIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  WBSCloudHistoryMergeOperation *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  WBSCloudHistoryMergeOperation *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WBSCloudHistoryMergeOperation;
  v12 = -[WBSCloudHistoryMergeOperation init](&v17, sel_init);
  if (v12)
  {
    v13 = dispatch_queue_create("com.apple.SafariShared.WBSCloudHistoryMergeOperation", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_fetchResult, a4);
    objc_storeStrong((id *)&v12->_database, a3);
    objc_storeStrong((id *)&v12->_profileServerIdentifier, a5);
    v15 = v12;
  }

  return v12;
}

- (void)mergeWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_updateClientVersions");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke_2;
  v3[3] = &unk_1E4B2A708;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  objc_msgSend(v4, "_replayAndAddTombstones:", v3);

}

void __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_buildVisitsByVisitIdentifiersMap");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke_3;
  v3[3] = &unk_1E4B2A708;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  objc_msgSend(v4, "_loadTombstonesWithCompletion:", v3);

}

void __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_buildRedirectChains");
  objc_msgSend(*(id *)(a1 + 32), "_filterVisitsByTombstones");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke_4;
  v3[3] = &unk_1E4B2A708;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  objc_msgSend(v4, "_lookUpExistingItemsWithCompletion:", v3);

}

uint64_t __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeDuplicateVisits");
  return objc_msgSend(*(id *)(a1 + 32), "_mergeVisitsWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_updateClientVersions
{
  id v3;
  _QWORD v4[5];

  -[WBSCloudHistoryFetchResult clientVersions](self->_fetchResult, "clientVersions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__WBSCloudHistoryMergeOperation__updateClientVersions__block_invoke;
  v4[3] = &unk_1E4B2B740;
  v4[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __54__WBSCloudHistoryMergeOperation__updateClientVersions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = a3;
  objc_msgSend(v4, "setLastSeenDate:forCloudClientVersion:completionHandler:", v5, objc_msgSend(a2, "unsignedIntegerValue"), &__block_literal_global_15);

}

void __54__WBSCloudHistoryMergeOperation__updateClientVersions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __54__WBSCloudHistoryMergeOperation__updateClientVersions__block_invoke_2_cold_1(v3);
  }

}

- (void)_replayAndAddTombstones:(id)a3
{
  id v4;
  WBSHistoryServiceDatabaseProtocol *database;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  database = self->_database;
  -[WBSCloudHistoryFetchResult tombstonesForProfileWithServerIdentifier:](self->_fetchResult, "tombstonesForProfileWithServerIdentifier:", self->_profileServerIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__WBSCloudHistoryMergeOperation__replayAndAddTombstones___block_invoke;
  v8[3] = &unk_1E4B2B768;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[WBSHistoryServiceDatabaseProtocol replayAndAddTombstones:completionHandler:](database, "replayAndAddTombstones:completionHandler:", v6, v8);

}

void __57__WBSCloudHistoryMergeOperation__replayAndAddTombstones___block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8), *(dispatch_block_t *)(a1 + 40));
}

- (void)_buildVisitsByVisitIdentifiersMap
{
  NSMutableDictionary *v3;
  NSMutableDictionary *visitsByVisitIdentifiers;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  unint64_t v24;
  WBSCloudHistoryMergeOperation *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  visitsByVisitIdentifiers = self->_visitsByVisitIdentifiers;
  self->_visitsByVisitIdentifiers = v3;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = self;
  -[WBSCloudHistoryFetchResult visitsForProfileWithServerIdentifier:](self->_fetchResult, "visitsForProfileWithServerIdentifier:", self->_profileServerIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "visitIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "visitTime");
        objc_msgSend(v11, "numberWithUnsignedInteger:", (unint64_t)(v13 / 10.0));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v20, "visitIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "visitTime");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(v22 / 10.0));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v5, "countForObject:", v23);

        if (v24 <= 0x63)
          -[NSMutableDictionary setObject:forKeyedSubscript:](v25->_visitsByVisitIdentifiers, "setObject:forKeyedSubscript:", v20, v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v17);
  }

}

- (void)_loadTombstonesWithCompletion:(id)a3
{
  id v4;
  WBSHistoryServiceDatabaseProtocol *database;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  database = self->_database;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__WBSCloudHistoryMergeOperation__loadTombstonesWithCompletion___block_invoke;
  v7[3] = &unk_1E4B2B790;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[WBSHistoryServiceDatabaseProtocol fetchAllTombstonesWithCompletionHandler:](database, "fetchAllTombstonesWithCompletionHandler:", v7);

}

void __63__WBSCloudHistoryMergeOperation__loadTombstonesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__WBSCloudHistoryMergeOperation__loadTombstonesWithCompletion___block_invoke_cold_1(v7);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(v8 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__WBSCloudHistoryMergeOperation__loadTombstonesWithCompletion___block_invoke_6;
  block[3] = &unk_1E4B2A0F0;
  block[4] = v8;
  v13 = v5;
  v14 = v9;
  v11 = v5;
  dispatch_async(v10, block);

}

uint64_t __63__WBSCloudHistoryMergeOperation__loadTombstonesWithCompletion___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_buildRedirectChains
{
  void *v3;
  NSMutableSet *v4;
  NSMutableSet *redirectChainEarliestVisits;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_visitsByVisitIdentifiers, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v3);
  v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  redirectChainEarliestVisits = self->_redirectChainEarliestVisits;
  self->_redirectChainEarliestVisits = v4;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "redirectSourceVisitIdentifier", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_visitsByVisitIdentifiers, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setRedirectSourceVisit:", v13);
          objc_msgSend(v13, "setRedirectDestinationVisit:", v11);
          if (v13)
            -[NSMutableSet removeObject:](self->_redirectChainEarliestVisits, "removeObject:", v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)_filterVisitsByTombstones
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSMutableDictionary *obj;
  WBSCloudHistoryMergeOperation *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
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
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v37 = self;
  v4 = self->_tombstones;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v9, "urlString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v10);
          }
          objc_msgSend(v11, "addObject:", v9);

        }
        else
        {
          objc_msgSend(v40, "addObject:", v9);
        }

      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v37->_visitsByVisitIdentifiers;
  v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v46 != v38)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        objc_msgSend(v14, "urlString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "arrayByAddingObjectsFromArray:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v42;
          while (2)
          {
            for (k = 0; k != v19; ++k)
            {
              if (*(_QWORD *)v42 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
              objc_msgSend(v14, "visitTime");
              v24 = v23;
              objc_msgSend(v14, "urlString");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v22) = objc_msgSend(v22, "matchesVisitTime:urlString:", v25, v24);

              if ((_DWORD)v22)
              {
                -[NSMutableDictionary objectForKeyedSubscript:](v37->_visitsByVisitIdentifiers, "objectForKeyedSubscript:", v14);
                v26 = (id)objc_claimAutoreleasedReturnValue();
                v27 = v26;
                if (v26)
                {
                  objc_msgSend(v26, "visitIdentifier");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "addObject:", v28);

                  objc_msgSend(v27, "redirectSourceVisit");
                  v29 = objc_claimAutoreleasedReturnValue();
                  v30 = v27;
                  if (v29)
                  {
                    v31 = v27;
                    do
                    {
                      v30 = (void *)v29;

                      objc_msgSend(v30, "visitIdentifier");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v12, "addObject:", v32);

                      objc_msgSend(v30, "redirectSourceVisit");
                      v29 = objc_claimAutoreleasedReturnValue();
                      v31 = v30;
                    }
                    while (v29);
                  }
                  -[NSMutableSet removeObject:](v37->_redirectChainEarliestVisits, "removeObject:", v30);

                }
                objc_msgSend(v27, "redirectDestinationVisit");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (v33)
                {
                  do
                  {
                    objc_msgSend(v33, "visitIdentifier");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "addObject:", v34);

                    objc_msgSend(v33, "redirectDestinationVisit");
                    v35 = objc_claimAutoreleasedReturnValue();

                    v33 = (void *)v35;
                  }
                  while (v35);
                }

                goto LABEL_35;
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
            if (v19)
              continue;
            break;
          }
        }
LABEL_35:

      }
      v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v39);
  }

  -[NSMutableDictionary removeObjectsForKeys:](v37->_visitsByVisitIdentifiers, "removeObjectsForKeys:", v12);
}

- (void)_lookUpExistingItemsWithCompletion:(id)a3
{
  id v4;
  WBSHistoryServiceDatabaseProtocol *database;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  database = self->_database;
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_visitsByVisitIdentifiers, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__WBSCloudHistoryMergeOperation__lookUpExistingItemsWithCompletion___block_invoke;
  v10[3] = &unk_1E4B2B790;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[WBSHistoryServiceDatabaseProtocol visitIdentifiersMatchingExistingVisits:desiredVisitTimePrecision:completionHandler:](database, "visitIdentifiersMatchingExistingVisits:desiredVisitTimePrecision:completionHandler:", v8, 0, v10);

}

void __68__WBSCloudHistoryMergeOperation__lookUpExistingItemsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__WBSCloudHistoryMergeOperation__lookUpExistingItemsWithCompletion___block_invoke_cold_1(v7);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(v8 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__WBSCloudHistoryMergeOperation__lookUpExistingItemsWithCompletion___block_invoke_11;
  block[3] = &unk_1E4B2A0F0;
  block[4] = v8;
  v13 = v5;
  v14 = v9;
  v11 = v5;
  dispatch_async(v10, block);

}

uint64_t __68__WBSCloudHistoryMergeOperation__lookUpExistingItemsWithCompletion___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_removeDuplicateVisits
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  NSSet *existingVisits;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  NSSet *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (void *)-[NSMutableSet copy](self->_redirectChainEarliestVisits, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        v9 = v8;
        if (v8)
        {
          v10 = v8;
          while (1)
          {
            existingVisits = self->_existingVisits;
            objc_msgSend(v10, "visitIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[NSSet containsObject:](existingVisits, "containsObject:", v12);

            objc_msgSend(v10, "redirectDestinationVisit");
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = (void *)v14;
            if (!v13)
              break;

            v10 = v15;
            if (!v15)
              goto LABEL_10;
          }
          if (v14)
          {
            while (1)
            {
              v16 = self->_existingVisits;
              objc_msgSend(v15, "visitIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v16) = -[NSSet containsObject:](v16, "containsObject:", v17);

              if ((v16 & 1) != 0)
                break;
              objc_msgSend(v15, "redirectDestinationVisit");
              v18 = objc_claimAutoreleasedReturnValue();

              v15 = (void *)v18;
              if (!v18)
                goto LABEL_14;
            }
            -[NSMutableSet removeObject:](self->_redirectChainEarliestVisits, "removeObject:", v9);

          }
          else
          {
LABEL_14:
            if (v10 != v9)
            {
              -[NSMutableSet removeObject:](self->_redirectChainEarliestVisits, "removeObject:", v9);
              -[NSMutableSet addObject:](self->_redirectChainEarliestVisits, "addObject:", v10);
            }
          }

        }
        else
        {
LABEL_10:
          -[NSMutableSet removeObject:](self->_redirectChainEarliestVisits, "removeObject:", v9);
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

}

- (void)_mergeVisitsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  WBSHistoryServiceDatabaseProtocol *database;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  dispatch_block_t block;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  block = a3;
  -[NSMutableSet allObjects](self->_redirectChainEarliestVisits, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = dispatch_group_create();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(obj);
        v20 = v7;
        v8 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v7);
        if (v8)
        {
          do
          {
            objc_msgSend(v8, "visitIdentifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            dispatch_group_enter(v6);
            database = self->_database;
            objc_msgSend(v8, "redirectSourceVisitIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "title");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v8, "wasHTTPNonGet");
            v14 = objc_msgSend(v8, "loadWasSuccessful");
            v21[0] = MEMORY[0x1E0C809B0];
            v21[1] = 3221225472;
            v21[2] = __60__WBSCloudHistoryMergeOperation__mergeVisitsWithCompletion___block_invoke_2;
            v21[3] = &unk_1E4B2B7F8;
            v22 = v6;
            -[WBSHistoryServiceDatabaseProtocol recordVisitWithIdentifier:sourceVisit:title:wasHTTPNonGet:loadSuccessful:origin:attributes:statusCode:completionHandler:](database, "recordVisitWithIdentifier:sourceVisit:title:wasHTTPNonGet:loadSuccessful:origin:attributes:statusCode:completionHandler:", v9, v11, v12, v13, v14, 1, 0, 0, v21);

            objc_msgSend(v8, "redirectDestinationVisit");
            v15 = objc_claimAutoreleasedReturnValue();

            v8 = (id)v15;
          }
          while (v15);
        }
        v7 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v19);
  }

  dispatch_group_notify(v6, (dispatch_queue_t)self->_queue, block);
}

uint64_t __60__WBSCloudHistoryMergeOperation__mergeVisitsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "visitIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visitTime");
  v7 = v6;

  objc_msgSend(v4, "visitIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "visitTime");
  v10 = v9;

  v11 = -1;
  if (v7 >= v10)
    v11 = 1;
  if (v7 == v10)
    return 0;
  else
    return v11;
}

void __60__WBSCloudHistoryMergeOperation__mergeVisitsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__WBSCloudHistoryMergeOperation__mergeVisitsWithCompletion___block_invoke_2_cold_1(v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingVisits, 0);
  objc_storeStrong((id *)&self->_tombstonesByURLString, 0);
  objc_storeStrong((id *)&self->_tombstones, 0);
  objc_storeStrong((id *)&self->_redirectChainEarliestVisits, 0);
  objc_storeStrong((id *)&self->_visitsByVisitIdentifiers, 0);
  objc_storeStrong((id *)&self->_profileServerIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__WBSCloudHistoryMergeOperation__updateClientVersions__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Failed to update cloud client version table: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __63__WBSCloudHistoryMergeOperation__loadTombstonesWithCompletion___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Failed to fetch all tombstones: %{private}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __68__WBSCloudHistoryMergeOperation__lookUpExistingItemsWithCompletion___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Failed to find matching existing visits: %{private}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __60__WBSCloudHistoryMergeOperation__mergeVisitsWithCompletion___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Failed to record visit: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
