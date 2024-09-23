@implementation WBSPrivacyReportData

- (NSArray)knownTrackers
{
  return self->_knownTrackers;
}

+ (void)clearCachedDataForProfilesWithIdentifiersNotInSet:(id)a3
{
  objc_msgSend(a1, "_clearCachedDataWithStrategy:profiles:", 1, a3);
}

- (WBSPrivacyReportData)initWithProfileIdentifiers:(id)a3 histories:(id)a4
{
  id v6;
  id v7;
  WBSPrivacyReportData *v8;
  uint64_t v9;
  NSSet *histories;
  uint64_t v11;
  NSSet *profileIdentifiers;
  uint64_t v13;
  WBSKnownTrackerFilter *knownTrackerFilter;
  dispatch_queue_t v15;
  OS_dispatch_queue *dataPrefetchQueue;
  uint64_t v17;
  NSMutableArray *prefetchCompletionHandlers;
  WBSPrivacyReportData *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WBSPrivacyReportData;
  v8 = -[WBSPrivacyReportData init](&v21, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    histories = v8->_histories;
    v8->_histories = (NSSet *)v9;

    v11 = objc_msgSend(v6, "copy");
    profileIdentifiers = v8->_profileIdentifiers;
    v8->_profileIdentifiers = (NSSet *)v11;

    v13 = objc_opt_new();
    knownTrackerFilter = v8->_knownTrackerFilter;
    v8->_knownTrackerFilter = (WBSKnownTrackerFilter *)v13;

    -[WBSPrivacyReportData _resetKnownTrackersSortDescriptors](v8, "_resetKnownTrackersSortDescriptors");
    -[WBSPrivacyReportData _resetTrackedFirstPartiesSortDescriptors](v8, "_resetTrackedFirstPartiesSortDescriptors");
    v15 = dispatch_queue_create("com.apple.SafariShared.WBSPrivacyReportData.DataPrefetchQueue", 0);
    dataPrefetchQueue = v8->_dataPrefetchQueue;
    v8->_dataPrefetchQueue = (OS_dispatch_queue *)v15;

    v8->_prefetchState = 2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    prefetchCompletionHandlers = v8->_prefetchCompletionHandlers;
    v8->_prefetchCompletionHandlers = (NSMutableArray *)v17;

    v19 = v8;
  }

  return v8;
}

- (void)_resetTrackedFirstPartiesSortDescriptors
{
  void *v3;
  NSArray *v4;
  NSArray *trackedFirstPartiesSortDescriptors;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("trackers.@count"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trackedFirstPartiesSortDescriptors = self->_trackedFirstPartiesSortDescriptors;
  self->_trackedFirstPartiesSortDescriptors = v4;

  -[WBSPrivacyReportData _sortTrackedFirstParties](self, "_sortTrackedFirstParties");
}

- (void)_resetKnownTrackersSortDescriptors
{
  void *v3;
  NSArray *v4;
  NSArray *knownTrackersSortDescriptors;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("firstParties.@count"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  knownTrackersSortDescriptors = self->_knownTrackersSortDescriptors;
  self->_knownTrackersSortDescriptors = v4;

  -[WBSPrivacyReportData _sortKnownTrackers](self, "_sortKnownTrackers");
}

uint64_t __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v35 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "getRecentFirstPartiesFromThirdParty:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v6, "thirdPartyDomain");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = *(void **)(a1 + 40);
        objc_msgSend(v6, "thirdPartyDomain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(void **)(a1 + 40);
          objc_msgSend(v6, "thirdPartyDomain");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

        }
        else
        {
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v12);
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v3);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "arrayByAddingObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v25, v22);

        }
        else
        {
          v38 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v24, v22);
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v19);
  }

  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_ingestPreventedThirdParties:blockedThirdParties:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_ingestPreventedThirdParties:(id)a3 blockedThirdParties:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  WBSKnownTrackerFilter *knownTrackerFilter;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v14, OS_LOG_TYPE_DEFAULT, "Loading known trackers", buf, 2u);
  }
  knownTrackerFilter = self->_knownTrackerFilter;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke;
  v20[3] = &unk_1E5445440;
  v20[4] = self;
  v21 = v13;
  v22 = v9;
  v23 = v8;
  v24 = v10;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v19 = v13;
  -[WBSKnownTrackerFilter getKnownTrackersFromHighLevelDomains:completionHandler:](knownTrackerFilter, "getKnownTrackersFromHighLevelDomains:completionHandler:", v19, v20);

}

- (void)_computeStatistics
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  WBSTrackedFirstParty *v39;
  uint64_t v40;
  NSArray *trackedFirstParties;
  double v42;
  double v43;
  void *v44;
  WBSPrivacyReportData *v45;
  id obj;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  -[NSArray firstObject](self->_knownTrackers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v45 = self;
  v4 = self->_knownTrackers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v56 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v3, "firstParties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");
        objc_msgSend(v9, "firstParties");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v11 < v13)
        {
          v14 = v9;

          v3 = v14;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v6);
  }

  v44 = v3;
  objc_storeStrong((id *)&v45->_mostSeenKnownTracker, v3);
  mapTrackersByFirstPartyDomain(v45->_blockedKnownTrackers);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  mapTrackersByFirstPartyDomain(v45->_preventedKnownTrackers);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99E60];
  v49 = v15;
  objc_msgSend(v15, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v16;
  objc_msgSend(v16, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v21;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v22)
  {
    v23 = v22;
    v47 = *(_QWORD *)v52;
    v24 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v52 != v47)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("domain"), 1, sel_localizedCaseInsensitiveCompare_);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "objectForKeyedSubscript:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sortedArrayUsingDescriptors:", v28);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v30;
        if (v30)
          v32 = (void *)v30;
        else
          v32 = v24;
        v33 = v32;

        objc_msgSend(v49, "objectForKeyedSubscript:", v26);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "sortedArrayUsingDescriptors:", v28);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v35;
        if (v35)
          v37 = (void *)v35;
        else
          v37 = v24;
        v38 = v37;

        v39 = -[WBSTrackedFirstParty initWithDomain:blockedTrackers:preventedTrackers:]([WBSTrackedFirstParty alloc], "initWithDomain:blockedTrackers:preventedTrackers:", v26, v38, v33);
        objc_msgSend(v50, "addObject:", v39);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    }
    while (v23);
  }

  v40 = objc_msgSend(v50, "copy");
  trackedFirstParties = v45->_trackedFirstParties;
  v45->_trackedFirstParties = (NSArray *)v40;

  -[WBSPrivacyReportData _sortTrackedFirstParties](v45, "_sortTrackedFirstParties");
  if (-[NSSet count](v45->_firstPartiesFromHistory, "count"))
  {
    v42 = (double)-[NSArray count](v45->_trackedFirstParties, "count");
    v43 = v42 / (double)-[NSSet count](v45->_firstPartiesFromHistory, "count");
  }
  else
  {
    v43 = 0.0;
  }
  v45->_ratioOfTrackedFirstPartiesToAllVisited = v43;

}

- (void)_sortTrackedFirstParties
{
  NSArray *v3;
  NSArray *trackedFirstParties;

  -[NSArray sortedArrayUsingDescriptors:](self->_trackedFirstParties, "sortedArrayUsingDescriptors:", self->_trackedFirstPartiesSortDescriptors);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trackedFirstParties = self->_trackedFirstParties;
  self->_trackedFirstParties = v3;

}

- (void)_sortKnownTrackers
{
  NSArray *v3;
  NSArray *knownTrackers;
  NSArray *v5;
  NSArray *preventedKnownTrackers;
  NSArray *v7;
  NSArray *blockedKnownTrackers;

  -[NSArray sortedArrayUsingDescriptors:](self->_knownTrackers, "sortedArrayUsingDescriptors:", self->_knownTrackersSortDescriptors);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  knownTrackers = self->_knownTrackers;
  self->_knownTrackers = v3;

  -[NSArray sortedArrayUsingDescriptors:](self->_preventedKnownTrackers, "sortedArrayUsingDescriptors:", self->_knownTrackersSortDescriptors);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  preventedKnownTrackers = self->_preventedKnownTrackers;
  self->_preventedKnownTrackers = v5;

  -[NSArray sortedArrayUsingDescriptors:](self->_blockedKnownTrackers, "sortedArrayUsingDescriptors:", self->_knownTrackersSortDescriptors);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  blockedKnownTrackers = self->_blockedKnownTrackers;
  self->_blockedKnownTrackers = v7;

}

uint64_t __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Finished loading data from history %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "unionSet:", *(_QWORD *)(a1 + 48));
}

- (void)loadDataFromStartDate:(id)a3 toEndDate:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_storeStrong((id *)&self->_dataWindowEndDate, a4);
  v11 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_1A840B000, v11, OS_LOG_TYPE_DEFAULT, "Loading data from %{public}@ to %{public}@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E54423F8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

void __91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[16];

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_DEFAULT, "Loading history", buf, 2u);
  }
  v6 = *(_QWORD **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v7 = v6[6];
  v8 = v6[7];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke_64;
  v10[3] = &unk_1E5445418;
  v10[4] = v6;
  v11 = v5;
  v12 = v3;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v9 = v3;
  objc_msgSend(v6, "_getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate:beforeDate:completionHandler:", v7, v8, v10);

}

void __62__WBSPrivacyReportData__getResourceLoadStatisticsDataSummary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  id obj;
  _QWORD block[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  void *v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v24 = a1;
  v41 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_group_create();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v35;
    v9 = __62__WBSPrivacyReportData__getResourceLoadStatisticsDataSummary___block_invoke_86;
    v10 = &unk_1E5443D08;
    v25 = v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v13 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          objc_msgSend(v12, "identifier", v24);
          v15 = v7;
          v16 = v8;
          v17 = v3;
          v18 = v10;
          v19 = v9;
          v20 = v6;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v39 = v21;
          _os_log_impl(&dword_1A840B000, v14, OS_LOG_TYPE_DEFAULT, "Loading resource load statistics summary from %{public}@", buf, 0xCu);

          v6 = v20;
          v9 = v19;
          v10 = v18;
          v3 = v17;
          v8 = v16;
          v7 = v15;
          v4 = v25;
        }
        dispatch_group_enter(v4);
        v30[0] = v6;
        v30[1] = 3221225472;
        v30[2] = v9;
        v30[3] = v10;
        v31 = v3;
        v32 = v12;
        v33 = v4;
        objc_msgSend(v12, "_getResourceLoadStatisticsDataSummary:", v30);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v7);
  }

  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __62__WBSPrivacyReportData__getResourceLoadStatisticsDataSummary___block_invoke_87;
  block[3] = &unk_1E5443450;
  v22 = *(id *)(v24 + 32);
  v28 = v3;
  v29 = v22;
  v23 = v3;
  dispatch_group_notify(v4, MEMORY[0x1E0C80D38], block);

}

void __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  uint8_t buf[16];

  v2 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Loading resource load statistics summary", buf, 2u);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_57;
  v4[3] = &unk_1E5442420;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v5, "_getResourceLoadStatisticsDataSummary:", v4);

}

- (void)_getResourceLoadStatisticsDataSummary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSSet *profileIdentifiers;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_DEFAULT, "Loading all resource load statistics summaries", buf, 2u);
  }
  v6 = (void *)MEMORY[0x1E0CEF650];
  profileIdentifiers = self->_profileIdentifiers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__WBSPrivacyReportData__getResourceLoadStatisticsDataSummary___block_invoke;
  v9[3] = &unk_1E5443B08;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "safari_fetchExistingDataStoresForProfilesWithIdentifiers:completionHandler:", profileIdentifiers, v9);

}

- (void)_getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  NSObject *v8;
  NSSet *histories;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v24 = a4;
  v23 = a5;
  v8 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    histories = self->_histories;
    v10 = v8;
    *(_DWORD *)buf = 134217984;
    v39 = -[NSSet count](histories, "count");
    _os_log_impl(&dword_1A840B000, v10, OS_LOG_TYPE_DEFAULT, "Loading data from %zu histories", buf, 0xCu);

  }
  v11 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = self->_histories;
  v14 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v19 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v39 = (uint64_t)v18;
          _os_log_impl(&dword_1A840B000, v19, OS_LOG_TYPE_DEFAULT, "Loading data from history %{public}@", buf, 0xCu);
        }
        dispatch_group_enter(v11);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke;
        v29[3] = &unk_1E5445518;
        v30 = v11;
        v31 = v18;
        v32 = v12;
        objc_msgSend(v18, "getHighLevelHTTPFamilyDomainsVisitedAfterDate:beforeDate:onlyFromThisDevice:completionHandler:", v25, v24, 1, v29);

      }
      v15 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v15);
  }

  fetchingQueue();
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke_85;
  block[3] = &unk_1E5443450;
  v27 = v12;
  v28 = v23;
  v21 = v12;
  v22 = v23;
  dispatch_group_notify(v11, v20, block);

}

void __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(a1 + 32);
    fetchingQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke_2;
    block[3] = &unk_1E5441870;
    v6 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v9 = v6;
    v10 = v3;
    dispatch_group_async(v4, v5, block);

  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke_cold_1(a1, v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)_dataWindowStartWithBlockedThirdParties:(id)a3 boundBy:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  double v24;
  double v25;
  double v26;
  id v27;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v5, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    v29 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v31;
          while (2)
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v31 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
              objc_msgSend(v23, "lastSeen");
              if (v24 < v8)
              {
                v27 = v6;

                goto LABEL_20;
              }
              objc_msgSend(v23, "lastSeen");
              if (v25 < v11)
              {
                objc_msgSend(v23, "lastSeen");
                v11 = v26;
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v20)
              continue;
            break;
          }
        }

        v15 = v29;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v11);
  v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v27;
}

- (id)_dataWindowStartWithLoadedThirdParties:(id)a3 boundBy:(id)a4 earliestFirstParty:(id *)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  double v26;
  double v27;
  double v28;
  id v29;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = v12;

  if (a5)
    *a5 = 0;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v37;
    v31 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v19, "underFirstParties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v33;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v33 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
              objc_msgSend(v25, "timeLastUpdated");
              if (v26 < v10)
              {
                v29 = v8;

                goto LABEL_23;
              }
              objc_msgSend(v25, "timeLastUpdated");
              if (v27 < v13)
              {
                objc_msgSend(v25, "timeLastUpdated");
                v13 = v28;
                if (a5)
                  *a5 = objc_retainAutorelease(v25);
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (v22)
              continue;
            break;
          }
        }

        v17 = v31;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v13);
  v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v29;
}

+ (id)cachedNumberOfTrackersOnStartPageForProfileWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D8A538]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D8A2D8]))
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;
    }
    else
    {
      objc_msgSend(v5, "objectForKey:", v3);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)_clearCachedDataWithStrategy:(int64_t)a3 profiles:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D8A538];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D8A538]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v7;
    v20 = v8;
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    v18 = *MEMORY[0x1E0D8A530];
    objc_msgSend(v6, "dictionaryForKey:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v9, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v5, "containsObject:", v17) ^ 1) == a3)
          {
            objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v17);
            objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v17);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    objc_msgSend(v6, "setObject:forKey:", v9, v19);
    objc_msgSend(v6, "setObject:forKey:", v11, v18);

    v8 = v20;
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", v7);
  }

}

+ (void)setCachedNumberOfTrackersOnStartPage:(id)a3 forProfileWithIdentifier:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99EA0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "safari_browserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D8A538];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D8A538]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v10, "mutableCopy");
LABEL_6:
    v13 = (void *)v11;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v14 = *MEMORY[0x1E0D8A2D8];
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

LABEL_7:
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, v6);

  objc_msgSend(v8, "setObject:forKey:", v13, v9);
}

+ (id)cachedPrivacyReportDataOnStartPageForProfileWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WBSPrivacyReportMetrics *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", *MEMORY[0x1E0D8A530]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WBSPrivacyReportMetrics initWithDictionaryRepresentation:]([WBSPrivacyReportMetrics alloc], "initWithDictionaryRepresentation:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)setCachedPrivacyReportDataOnStartPage:(id)a3 forProfileWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  if (v5)
  {
    v13 = v5;
    v6 = (void *)MEMORY[0x1E0C99EA0];
    v7 = a4;
    objc_msgSend(v6, "safari_browserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D8A530];
    objc_msgSend(v8, "dictionaryForKey:", *MEMORY[0x1E0D8A530]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v7);

    objc_msgSend(v8, "setObject:forKey:", v11, v9);
    v5 = v13;
  }

}

+ (void)clearCachedDataForProfilesWithIdentifiers:(id)a3
{
  objc_msgSend(a1, "_clearCachedDataWithStrategy:profiles:", 0, a3);
}

- (void)setKnownTrackersSortDescriptors:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *knownTrackersSortDescriptors;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    if (!-[NSArray isEqualToArray:](self->_knownTrackersSortDescriptors, "isEqualToArray:", v4))
    {
      v5 = (NSArray *)objc_msgSend(v7, "copy");
      knownTrackersSortDescriptors = self->_knownTrackersSortDescriptors;
      self->_knownTrackersSortDescriptors = v5;

      -[WBSPrivacyReportData _sortKnownTrackers](self, "_sortKnownTrackers");
    }
  }
  else
  {
    -[WBSPrivacyReportData _resetKnownTrackersSortDescriptors](self, "_resetKnownTrackersSortDescriptors");
  }

}

- (void)setTrackedFirstPartiesSortDescriptors:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *trackedFirstPartiesSortDescriptors;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    if (!-[NSArray isEqualToArray:](self->_trackedFirstPartiesSortDescriptors, "isEqualToArray:", v4))
    {
      v5 = (NSArray *)objc_msgSend(v7, "copy");
      trackedFirstPartiesSortDescriptors = self->_trackedFirstPartiesSortDescriptors;
      self->_trackedFirstPartiesSortDescriptors = v5;

      -[WBSPrivacyReportData _sortTrackedFirstParties](self, "_sortTrackedFirstParties");
    }
  }
  else
  {
    -[WBSPrivacyReportData _resetTrackedFirstPartiesSortDescriptors](self, "_resetTrackedFirstPartiesSortDescriptors");
  }

}

- (void)prefetchData
{
  NSObject *dataPrefetchQueue;
  _QWORD block[5];

  dataPrefetchQueue = self->_dataPrefetchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__WBSPrivacyReportData_prefetchData__block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_async(dataPrefetchQueue, block);
}

uint64_t __36__WBSPrivacyReportData_prefetchData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prefetchData");
}

- (void)_prefetchData
{
  uint64_t v2;
  _QWORD v3[5];

  v2 = MEMORY[0x1E0C809B0];
  self->_prefetchState = 1;
  v3[0] = v2;
  v3[1] = 3221225472;
  v3[2] = __37__WBSPrivacyReportData__prefetchData__block_invoke;
  v3[3] = &unk_1E5441CB8;
  v3[4] = self;
  -[WBSPrivacyReportData _loadDataWithCompletionHandler:](self, "_loadDataWithCompletionHandler:", v3);
}

void __37__WBSPrivacyReportData__prefetchData__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__WBSPrivacyReportData__prefetchData__block_invoke_2;
  block[3] = &unk_1E5441CB8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __37__WBSPrivacyReportData__prefetchData__block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 16) == 1)
  {
    *(_QWORD *)(v1 + 16) = 0;
    return objc_msgSend(*(id *)(result + 32), "_executePrefetchCompletionHandlers");
  }
  return result;
}

- (void)_executePrefetchCompletionHandlers
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_prefetchCompletionHandlers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_addPrefetchCompletionHandler:(id)a3
{
  NSMutableArray *prefetchCompletionHandlers;
  id v4;

  prefetchCompletionHandlers = self->_prefetchCompletionHandlers;
  v4 = (id)MEMORY[0x1A85D45E4](a3, a2);
  -[NSMutableArray addObject:](prefetchCompletionHandlers, "addObject:", v4);

}

- (void)discardPrefetchedData
{
  NSObject *dataPrefetchQueue;
  _QWORD block[5];

  dataPrefetchQueue = self->_dataPrefetchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__WBSPrivacyReportData_discardPrefetchedData__block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_async(dataPrefetchQueue, block);
}

uint64_t __45__WBSPrivacyReportData_discardPrefetchedData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discardPrefetchedData");
}

- (void)_discardPrefetchedData
{
  self->_prefetchState = 2;
  -[NSMutableArray removeAllObjects](self->_prefetchCompletionHandlers, "removeAllObjects");
}

void __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[8];
  _QWORD v15[5];
  id v16;
  id v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v17 = 0;
  objc_msgSend(v4, "_dataWindowStartWithLoadedThirdParties:boundBy:earliestFirstParty:", v3, v5, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__16;
  v15[4] = __Block_byref_object_dispose__16;
  v8 = v3;
  v16 = v8;
  v9 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v9, OS_LOG_TYPE_DEFAULT, "Loading content blocker statistics", buf, 2u);
  }
  v10 = *(id *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 56);
  WBSContentBlockerStatisticsStoreFetchAllBlockedThirdParties();

  _Block_object_dispose(v15, 8);
}

void __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_58(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *obj;
  id obja[2];
  id v29;
  _QWORD block[5];
  id v31;
  id v32;
  __int128 v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_dataWindowStartWithBlockedThirdParties:boundBy:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v3;
  if (objc_msgSend(*(id *)(a1 + 48), "compare:", v3) == -1)
    v3 = *(void **)(a1 + 48);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v3);
  v4 = *(void **)(a1 + 56);
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "firstPartyDomain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_lastHistoryVisitForHighLevelDomain:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v7, "visitTime");
      objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "earlierDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "laterDate:", *(_QWORD *)(a1 + 40));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 48);
      *(_QWORD *)(v12 + 48) = v11;

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v29, "allKeys");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v29, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_2;
        v34[3] = &unk_1E5445330;
        v34[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v20, "safari_mapAndFilterObjectsUsingBlock:", v34);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, v19);
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v16);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5445358;
  block[4] = *(_QWORD *)(a1 + 32);
  v31 = v25;
  v32 = v14;
  *(_OWORD *)obja = *(_OWORD *)(a1 + 64);
  v22 = obja[0];
  v33 = *(_OWORD *)obja;
  v23 = v14;
  v24 = v25;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

id __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "lastSeen");
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "timeIntervalSince1970");
  if (v5 >= v6
    && (objc_msgSend(v3, "lastSeen"),
        v8 = v7,
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "timeIntervalSince1970"),
        v8 <= v9))
  {
    objc_msgSend(v3, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dataPrefetchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dataPrefetchQueue = self->_dataPrefetchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__WBSPrivacyReportData_loadDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5443108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dataPrefetchQueue, v7);

}

uint64_t __54__WBSPrivacyReportData_loadDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v1 == 1)
    return objc_msgSend(*(id *)(a1 + 32), "_addPrefetchCompletionHandler:", *(_QWORD *)(a1 + 40));
  if (v1)
    return objc_msgSend(*(id *)(a1 + 32), "_loadDataWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_loadDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -30, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__WBSPrivacyReportData__loadDataWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E54423F8;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = v4;
  v9 = v4;
  v10 = v8;
  v11 = v7;
  -[WBSPrivacyReportData _loadDataForWebViewWithCompletionHandler:](self, "_loadDataForWebViewWithCompletionHandler:", v12);

}

uint64_t __55__WBSPrivacyReportData__loadDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadDataFromStartDate:toEndDate:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_loadDataForWebViewWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  id WeakRetained;
  void *v6;
  _QWORD block[4];
  id v8;
  WBSPrivacyReportData *v9;
  void (**v10)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__WBSPrivacyReportData__loadDataForWebViewWithCompletionHandler___block_invoke;
    block[3] = &unk_1E54432C0;
    v8 = WeakRetained;
    v9 = self;
    v10 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v4[2](v4);
  }

}

void __65__WBSPrivacyReportData__loadDataForWebViewWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CEF650], "safari_defaultDataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__WBSPrivacyReportData__loadDataForWebViewWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E54453A8;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_loadedSubresourceDomainsFor:completionHandler:", v3, v5);

}

void __65__WBSPrivacyReportData__loadDataForWebViewWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), a2);
  v9 = a2;
  objc_msgSend(*(id *)(a1 + 40), "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_highLevelDomainFromHost");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 64);
  *(_QWORD *)(v7 + 64) = v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  WBSKnownTrackingThirdParty *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id obj;
  void *v59;
  uint8_t buf[16];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v52 = v3;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    objc_msgSend(v3, "setByAddingObject:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_msgSend(v3, "copy");
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = *(id *)(a1 + 40);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v69;
    v53 = *(_QWORD *)v69;
    v54 = a1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v69 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = 56;
          if (!v13)
            v14 = 64;
          objc_msgSend(*(id *)(a1 + v14), "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke_2;
          v65[3] = &unk_1E54453D0;
          v17 = v16;
          v18 = *(_QWORD *)(a1 + 32);
          v66 = v17;
          v67 = v18;
          objc_msgSend(v15, "safari_mapAndFilterObjectsUsingBlock:", v65);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "count"))
          {
            objc_msgSend(v19, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "safari_mapObjectsUsingBlock:", &__block_literal_global_33);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[WBSTrackingCapableThirdParty initWithDomain:firstParties:]([WBSKnownTrackingThirdParty alloc], "initWithDomain:firstParties:", v11, v20);
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("OwnerName"));
            v22 = v15;
            v23 = v8;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSKnownTrackingThirdParty setOwnerName:](v21, "setOwnerName:", v24);

            -[WBSKnownTrackingThirdParty ownerName](v21, "ownerName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "addObject:", v25);

            v8 = v23;
            v15 = v22;
            if (v13)
              v26 = v56;
            else
              v26 = v57;
            objc_msgSend(v26, "addObject:", v21);

            a1 = v54;
            v9 = v53;
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    }
    while (v8);
  }

  v27 = objc_msgSend(v57, "copy");
  v28 = *(_QWORD *)(a1 + 32);
  v29 = *(void **)(v28 + 88);
  *(_QWORD *)(v28 + 88) = v27;

  v30 = objc_msgSend(v56, "copy");
  v31 = *(_QWORD *)(a1 + 32);
  v32 = *(void **)(v31 + 96);
  *(_QWORD *)(v31 + 96) = v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(v57, "arrayByAddingObjectsFromArray:", v56);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v62 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
        objc_msgSend(v39, "domain");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "thirdPartyCoalescedWithThirdParty:", v39);
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)v42;
        if (v42)
          v44 = (void *)v42;
        else
          v44 = v39;
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v44, v40);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    }
    while (v36);
  }

  objc_msgSend(v33, "allValues");
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = *(_QWORD *)(a1 + 32);
  v47 = *(void **)(v46 + 80);
  *(_QWORD *)(v46 + 80) = v45;

  objc_msgSend(*(id *)(a1 + 32), "_sortKnownTrackers");
  v48 = objc_msgSend(v55, "copy");
  v49 = *(_QWORD *)(a1 + 32);
  v50 = *(void **)(v49 + 136);
  *(_QWORD *)(v49 + 136) = v48;

  objc_msgSend(*(id *)(a1 + 32), "_computeStatistics");
  v51 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v51, OS_LOG_TYPE_DEFAULT, "Finished loading data", buf, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

id __91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "containsObject:", v3) & 1) == 0)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_1E5479D68, v3);
  v5 = v3;
LABEL_6:

  return v5;
}

WBSTrackingCapableFirstParty *__91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke_70(uint64_t a1, void *a2)
{
  id v2;
  WBSTrackingCapableFirstParty *v3;

  v2 = a2;
  v3 = -[WBSTrackingCapableFirstParty initWithDomain:]([WBSTrackingCapableFirstParty alloc], "initWithDomain:", v2);

  return v3;
}

- (id)getRecentFirstPartiesFromThirdParty:(id)a3
{
  NSDate *dataWindowStartDate;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];

  dataWindowStartDate = self->_dataWindowStartDate;
  v5 = a3;
  -[NSDate timeIntervalSince1970](dataWindowStartDate, "timeIntervalSince1970");
  v7 = v6;
  -[NSDate timeIntervalSince1970](self->_dataWindowEndDate, "timeIntervalSince1970");
  v9 = v8;
  objc_msgSend(v5, "underFirstParties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__WBSPrivacyReportData_getRecentFirstPartiesFromThirdParty___block_invoke;
  v14[3] = &__block_descriptor_48_e45_B16__0___WKResourceLoadStatisticsFirstParty_8l;
  v14[4] = v7;
  v14[5] = v9;
  objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "safari_mapObjectsUsingBlock:", &__block_literal_global_83);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

BOOL __60__WBSPrivacyReportData_getRecentFirstPartiesFromThirdParty___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  _BOOL8 v5;
  double v6;

  v3 = a2;
  objc_msgSend(v3, "timeLastUpdated");
  if (v4 >= *(double *)(a1 + 32))
  {
    objc_msgSend(v3, "timeLastUpdated");
    v5 = v6 <= *(double *)(a1 + 40);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __60__WBSPrivacyReportData_getRecentFirstPartiesFromThirdParty___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "firstPartyDomain");
}

- (BOOL)hasData
{
  return -[NSArray count](self->_knownTrackers, "count") != 0;
}

+ (void)getKnownTrackingDomainsForWebView:(id)a3 after:(id)a4 before:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_highLevelDomainFromHost");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEF650], "safari_defaultDataStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke;
  v21[3] = &unk_1E5442420;
  v22 = v9;
  v23 = v10;
  v24 = v15;
  v25 = v11;
  v17 = v11;
  v18 = v15;
  v19 = v10;
  v20 = v9;
  objc_msgSend(v16, "_loadedSubresourceDomainsFor:completionHandler:", v12, v21);

}

void __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 56);
  v4 = v3;
  WBSContentBlockerStatisticsStoreFetchAllBlockedThirdParties();

}

void __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_3;
  v9[3] = &unk_1E54454C8;
  v10 = *(id *)(a1 + 32);
  v11 = v3;
  v12 = *(id *)(a1 + 40);
  v8 = v3;
  objc_msgSend(v7, "getKnownTrackersFromHighLevelDomains:completionHandler:", v6, v9);

}

void __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_4;
  v13[3] = &unk_1E54438A0;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v4, "safari_filterObjectsUsingBlock:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_5;
  v11[3] = &unk_1E54438A0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "safari_filterObjectsUsingBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

BOOL __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke_85(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  v2 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Finished loading history", v5, 2u);
  }
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (id)_lastHistoryVisitForHighLevelDomain:(id)a3
{
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_histories;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "lastVisitForHighLevelDomain:", v4, (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          if (!v8 || (objc_msgSend(v11, "visitTime"), v14 = v13, objc_msgSend(v8, "visitTime"), v14 > v15))
          {
            v16 = v12;

            v8 = v16;
          }
        }

      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __62__WBSPrivacyReportData__getResourceLoadStatisticsDataSummary___block_invoke_86(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  v3 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 40);
    v5 = v3;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_DEFAULT, "Finished loading resource load statistics summary from %{public}@", (uint8_t *)&v7, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __62__WBSPrivacyReportData__getResourceLoadStatisticsDataSummary___block_invoke_87(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Finished loading resource load statistics summaries", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSArray)preventedKnownTrackers
{
  return self->_preventedKnownTrackers;
}

- (NSArray)blockedKnownTrackers
{
  return self->_blockedKnownTrackers;
}

- (NSArray)knownTrackersSortDescriptors
{
  return self->_knownTrackersSortDescriptors;
}

- (NSArray)trackedFirstParties
{
  return self->_trackedFirstParties;
}

- (NSArray)trackedFirstPartiesSortDescriptors
{
  return self->_trackedFirstPartiesSortDescriptors;
}

- (WBSKnownTrackingThirdParty)mostSeenKnownTracker
{
  return self->_mostSeenKnownTracker;
}

- (NSSet)trackerOwnerNames
{
  return self->_trackerOwnerNames;
}

- (double)ratioOfTrackedFirstPartiesToAllVisited
{
  return self->_ratioOfTrackedFirstPartiesToAllVisited;
}

- (NSSet)histories
{
  return self->_histories;
}

- (NSSet)profileIdentifiers
{
  return self->_profileIdentifiers;
}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (void)setWebView:(id)a3
{
  objc_storeWeak((id *)&self->_webView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_profileIdentifiers, 0);
  objc_storeStrong((id *)&self->_histories, 0);
  objc_storeStrong((id *)&self->_trackerOwnerNames, 0);
  objc_storeStrong((id *)&self->_mostSeenKnownTracker, 0);
  objc_storeStrong((id *)&self->_trackedFirstPartiesSortDescriptors, 0);
  objc_storeStrong((id *)&self->_trackedFirstParties, 0);
  objc_storeStrong((id *)&self->_knownTrackersSortDescriptors, 0);
  objc_storeStrong((id *)&self->_blockedKnownTrackers, 0);
  objc_storeStrong((id *)&self->_preventedKnownTrackers, 0);
  objc_storeStrong((id *)&self->_knownTrackers, 0);
  objc_storeStrong((id *)&self->_webViewLoadedThirdParties, 0);
  objc_storeStrong((id *)&self->_webViewFirstPartyHighLevelDomainFromHost, 0);
  objc_storeStrong((id *)&self->_dataWindowEndDate, 0);
  objc_storeStrong((id *)&self->_dataWindowStartDate, 0);
  objc_storeStrong((id *)&self->_firstPartiesFromHistory, 0);
  objc_storeStrong((id *)&self->_knownTrackerFilter, 0);
  objc_storeStrong((id *)&self->_prefetchCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_dataPrefetchQueue, 0);
}

void __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1A840B000, a2, OS_LOG_TYPE_ERROR, "Could not load data from history %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
