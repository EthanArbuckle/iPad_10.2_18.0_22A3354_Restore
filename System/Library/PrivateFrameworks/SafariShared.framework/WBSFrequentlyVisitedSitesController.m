@implementation WBSFrequentlyVisitedSitesController

- (void)_recomputeFrequentlyVisitedSitesNow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  WBSHistory *history;
  _QWORD v8[5];

  -[WBSFrequentlyVisitedSitesController _canonicalizedFavoritesURLStringSet](self, "_canonicalizedFavoritesURLStringSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFrequentlyVisitedSitesBannedURLStore urlStrings](self->_bannedURLStore, "urlStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSFrequentlyVisitedSitesController _frequentlyVisitedSitesURLStringSet](self, "_frequentlyVisitedSitesURLStringSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  history = self->_history;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke;
  v8[3] = &unk_1E4B3AA10;
  v8[4] = self;
  -[WBSHistory computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:](history, "computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:", 12, 0, v5, v6, 2, v8);

}

- (void)_postFrequentlyVisitedSitesDidChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("FrequentlyVisitedSitesDidChange"), self);

}

uint64_t __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke_4(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v2;
  return objc_msgSend(*(id *)(a1 + 32), "_postFrequentlyVisitedSitesDidChangeNotification");
}

- (BOOL)recomputeFrequentlyVisitedSitesIfNecessary
{
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3 - self->_timeOfLastFrequentlyVisitedSitesComputation;
  if (v4 >= 300.0)
    -[WBSFrequentlyVisitedSitesController _recomputeFrequentlyVisitedSitesNow](self, "_recomputeFrequentlyVisitedSitesNow");
  return v4 >= 300.0;
}

void __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_60);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke_3;
    v9[3] = &unk_1E4B39148;
    v9[4] = v8;
    objc_msgSend(v8, "_saveFrequentlyVisitedSites:completionHandler:", v7, v9);

  }
}

void __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke_3(uint64_t a1, int a2)
{
  _QWORD block[5];

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke_4;
    block[3] = &unk_1E4B2A2C8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (WBSFrequentlyVisitedSitesController)initWithHistory:(id)a3 bannedURLStore:(id)a4 profileIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  WBSFrequentlyVisitedSitesController *v12;
  WBSFrequentlyVisitedSitesController *v13;
  WBSFrequentlyVisitedSitesController *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WBSFrequentlyVisitedSitesController;
  v12 = -[WBSFrequentlyVisitedSitesController init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_history, a3);
    objc_storeStrong((id *)&v13->_bannedURLStore, a4);
    objc_storeStrong((id *)&v13->_profileIdentifier, a5);
    v14 = v13;
  }

  return v13;
}

- (NSArray)frequentlyVisitedSites
{
  return 0;
}

- (void)clearFrequentlyVisitedSites
{
  self->_timeOfLastFrequentlyVisitedSitesComputation = 0.0;
}

+ (id)newRadarProblemURLForHistoryItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  WBSInternalFeedbackRadar *v15;
  void *v16;
  uint64_t block;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "isInternalInstall") & 1) == 0)
    +[WBSFrequentlyVisitedSitesController newRadarProblemURLForHistoryItem:].cold.1();
  objc_msgSend(v3, "urlString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Frequently Visited Sites: Issue with %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSInternalFeedbackRadarComponent safariStartPageIOS](WBSInternalFeedbackRadarComponent, "safariStartPageIOS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__15;
  v36 = __Block_byref_object_dispose__15;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__15;
  v30 = __Block_byref_object_dispose__15;
  v31 = 0;
  v7 = WBSHistoryItemSynchronizationQueue;
  block = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __72__WBSFrequentlyVisitedSitesController_newRadarProblemURLForHistoryItem___block_invoke_39;
  v21 = &unk_1E4B3A9A8;
  v23 = &__block_literal_global_53;
  v24 = &v32;
  v8 = v3;
  v22 = v8;
  v25 = &v26;
  dispatch_sync(v7, &block);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("* SUMMARY\nProvide a detailed explanation of the issue, with steps to reproduce if possible.\n\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", CFSTR("* DIAGNOSTIC INFORMATION\n"));
  objc_msgSend(v9, "appendFormat:", CFSTR("URL: %@\n"), v4);
  objc_msgSend(v9, "appendFormat:", CFSTR("Daily visit count scores: %@\n"), v33[5]);
  objc_msgSend(v9, "appendFormat:", CFSTR("Weekly visit count scores: %@\n"), v27[5]);
  objc_msgSend(v8, "lastVisitedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastVisitedTimeInterval");
  objc_msgSend(v9, "appendFormat:", CFSTR("Last visited: %@ (time interval: %f)\n"), v10, v11, block, v19, v20, v21);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "appendFormat:", CFSTR("Score time interval: %f\n"), v12);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "operatingSystemVersionString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("Operating system: %@"), v14);

  v15 = -[WBSInternalFeedbackRadar initWithComponent:title:descriptionTemplate:]([WBSInternalFeedbackRadar alloc], "initWithComponent:title:descriptionTemplate:", v6, v5, v9);
  -[WBSInternalFeedbackRadar continueInTapToRadarURL](v15, "continueInTapToRadarURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v16;
}

id __72__WBSFrequentlyVisitedSitesController_newRadarProblemURLForHistoryItem___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  void *i;
  unsigned int v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
  {
    v6 = *a2++;
    objc_msgSend(i, "appendFormat:", CFSTR("%d"), v6);
    if (a3 != 1)
      objc_msgSend(i, "appendString:", CFSTR(" "));
  }
  return i;
}

void __72__WBSFrequentlyVisitedSitesController_newRadarProblemURLForHistoryItem___block_invoke_39(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "dailyVisitCountScoresPtrOnSynchronizationQueue"), objc_msgSend(*(id *)(a1 + 32), "dailyVisitCountScoresCountOnSynchronizationQueue"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "weeklyVisitCountScoresPtrOnSynchronizationQueue"), objc_msgSend(*(id *)(a1 + 32), "weeklyVisitCountScoresCountOnSynchronizationQueue"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

WBSFrequentlyVisitedSiteCandidate *__74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WBSFrequentlyVisitedSiteCandidate *v3;
  void *v4;
  void *v5;
  WBSFrequentlyVisitedSiteCandidate *v6;

  v2 = a2;
  v3 = [WBSFrequentlyVisitedSiteCandidate alloc];
  objc_msgSend(v2, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topSitesScore");
  v6 = -[WBSFrequentlyVisitedSiteCandidate initWithURLString:title:score:](v3, "initWithURLString:title:score:", v4, v5);

  return v6;
}

- (id)_canonicalizedFavoritesURLStringSet
{
  return 0;
}

- (id)_frequentlyVisitedSitesURLStringSet
{
  return 0;
}

- (void)_saveFrequentlyVisitedSites:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_bannedURLStore, 0);
}

+ (void)newRadarProblemURLForHistoryItem:.cold.1()
{
  __break(0xC471u);
}

@end
