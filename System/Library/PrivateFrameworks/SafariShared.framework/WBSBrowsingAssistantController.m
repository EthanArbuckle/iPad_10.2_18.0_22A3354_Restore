@implementation WBSBrowsingAssistantController

+ (BOOL)shouldShowConsentCard
{
  int v3;

  v3 = objc_msgSend(a1, "isAvailableInCurrentLocale");
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "userConsentState") == 0;
  return v3;
}

+ (BOOL)isAvailableInCurrentLocale
{
  return +[WBSBrowsingAssistantContentProvider assistantEnabledForCurrentDevice](WBSBrowsingAssistantContentProvider, "assistantEnabledForCurrentDevice");
}

+ (BOOL)hasUserConsent
{
  return objc_msgSend(a1, "userConsentState") == 1;
}

+ (int64_t)userConsentState
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("BrowsingAssistantConsentState"));

  return v3;
}

+ (void)setUserConsentState:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a1, "userConsentState") != a3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("BrowsingAssistantConsentState"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_notificationNameForUserDefaultsKey:", CFSTR("BrowsingAssistantConsentState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", v6, 0);

  }
  if (a3 == 2)
  {
    +[WBSBrowsingAssistantContentProvider unsubscribeFromAssistantAsset](WBSBrowsingAssistantContentProvider, "unsubscribeFromAssistantAsset");
  }
  else if (a3 == 1)
  {
    +[WBSBrowsingAssistantContentProvider subscribeToAssistantAssetAndDownloadNow:](WBSBrowsingAssistantContentProvider, "subscribeToAssistantAssetAndDownloadNow:", 1);
  }
}

+ (void)subscribeToAssistantAssetIfNeeded
{
  if (objc_msgSend(a1, "userConsentState") != 2)
    +[WBSBrowsingAssistantContentProvider subscribeToAssistantAssetAndDownloadNow:](WBSBrowsingAssistantContentProvider, "subscribeToAssistantAssetAndDownloadNow:", 0);
}

+ (void)didRecieveMemoryWarning
{
  +[WBSBrowsingAssistantContentProvider clearAssistantAssetCache](WBSBrowsingAssistantContentProvider, "clearAssistantAssetCache");
}

- (WBSBrowsingAssistantController)init
{
  WBSBrowsingAssistantController *v2;
  WBSBrowsingAssistantContentProvider *v3;
  WBSBrowsingAssistantContentProvider *contentProvider;
  WBSBrowsingAssistantController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSBrowsingAssistantController;
  v2 = -[WBSBrowsingAssistantController init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WBSBrowsingAssistantContentProvider);
    contentProvider = v2->_contentProvider;
    v2->_contentProvider = v3;

    v5 = v2;
  }

  return v2;
}

- (id)_currentResultForURL:(id)a3
{
  WBSBrowsingAssistantResult *v4;
  id v5;
  WBSBrowsingAssistantResult *v6;
  WBSBrowsingAssistantResult *v7;

  v4 = self->_result;
  if (!v4)
  {
    v5 = a3;
    v6 = -[WBSBrowsingAssistantResult initWithURL:contentOptions:]([WBSBrowsingAssistantResult alloc], "initWithURL:contentOptions:", v5, 0);

    v7 = self->_result;
    self->_result = v6;

    v4 = self->_result;
  }
  return v4;
}

- (void)_foundContentOptions:(unint64_t)a3 fromURL:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "browsingAssistantController:didUpdateContentOptionsForURL:", self, v6);

}

- (void)didFindLocalContentWithOptions:(unint64_t)a3 forURL:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a4;
  if (a3 >= 0x20)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WBSBrowsingAssistantController didFindLocalContentWithOptions:forURL:].cold.1((uint64_t)v6, a3, v7);
  }
  -[WBSBrowsingAssistantController _currentResultForURL:](self, "_currentResultForURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateForLocalContentWithOptions:", a3);

  if (-[WBSBrowsingAssistantResult remoteContentState](self->_result, "remoteContentState") > 1
    || (objc_msgSend((id)objc_opt_class(), "hasUserConsent") & 1) == 0)
  {
    -[WBSBrowsingAssistantController _foundContentOptions:fromURL:](self, "_foundContentOptions:fromURL:", a3, v6);
  }

}

- (void)clearAssistantResult
{
  WBSBrowsingAssistantResult *result;
  NSString *cachedReaderArticleTitle;
  id WeakRetained;

  result = self->_result;
  self->_result = 0;

  cachedReaderArticleTitle = self->_cachedReaderArticleTitle;
  self->_cachedReaderArticleTitle = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "browsingAssistantControllerDidReset:", self);

}

- (NSString)summary
{
  return -[WBSBrowsingAssistantResult summaryText](self->_result, "summaryText");
}

- (NSArray)tableOfContentsTitles
{
  return -[WBSBrowsingAssistantResult tableOfContentsTitles](self->_result, "tableOfContentsTitles");
}

- (NSArray)tableOfContentsPaths
{
  return -[WBSBrowsingAssistantResult tableOfContentsPaths](self->_result, "tableOfContentsPaths");
}

- (NSArray)tableOfContentsTrailingTexts
{
  return -[WBSBrowsingAssistantResult tableOfContentsTrailingText](self->_result, "tableOfContentsTrailingText");
}

- (BOOL)isSummaryAvailable
{
  void *v3;
  BOOL v4;

  if ((-[WBSBrowsingAssistantResult contentOptions](self->_result, "contentOptions") & 1) != 0)
    return 1;
  -[WBSBrowsingAssistantResult summaryResult](self->_result, "summaryResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_registerForUserDefaultObserverIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;
  WBSUserDefaultObservation *v6;
  WBSUserDefaultObservation *userDefaultObservation;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_userDefaultObservation)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__WBSBrowsingAssistantController__registerForUserDefaultObserverIfNeeded__block_invoke;
    v8[3] = &unk_1E4B2A4B0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", CFSTR("BrowsingAssistantConsentState"), v4, 0, v8);
    v6 = (WBSUserDefaultObservation *)objc_claimAutoreleasedReturnValue();
    userDefaultObservation = self->_userDefaultObservation;
    self->_userDefaultObservation = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __73__WBSBrowsingAssistantController__registerForUserDefaultObserverIfNeeded__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 4);
    objc_msgSend(v2, "browsingAssistantControllerDidUpdateUserConsentState:", v4);

    v3 = v4[2];
    v4[2] = 0;

    WeakRetained = v4;
  }

}

- (void)performPrefetchingOfAssistantPegasusContentAfterChangingConsentState
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "browsingAssistantControllerDidUpdateUserConsentState:", self);

}

- (BOOL)_checkAssistantAvailabilityForPageLocale:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  if (!objc_msgSend(MEMORY[0x1E0D89BE8], "isBrowsingAssistantEnabled"))
    goto LABEL_12;
  v5 = objc_msgSend((id)objc_opt_class(), "userConsentState");
  if (!v5)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Don't check URL for assistant content since user hasn't given consent yet.", v13, 2u);
    }
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didVisitWebpageSBAWithUserOptedIn:", 0);

    -[WBSBrowsingAssistantController _registerForUserDefaultObserverIfNeeded](self, "_registerForUserDefaultObserverIfNeeded");
    goto LABEL_12;
  }
  if (v5 == 2)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Don't check URL for assistant content since User has declined.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didVisitWebpageSBAWithUserOptedIn:", 0);

    goto LABEL_12;
  }
  if (!+[WBSBrowsingAssistantContentProvider assistantEnabledForLocale:](WBSBrowsingAssistantContentProvider, "assistantEnabledForLocale:", v4))
  {
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 1;
  objc_msgSend(v10, "didVisitWebpageSBAWithUserOptedIn:", 1);

LABEL_13:
  return v11;
}

- (void)checkForAssistantContentFromPegasusForURL:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  WBSBrowsingAssistantResult *result;
  void *v13;
  NSObject *v14;
  id WeakRetained;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  WBSBrowsingAssistantContentProvider *contentProvider;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend((id)objc_opt_class(), "isAvailableInCurrentLocale")
    || !-[WBSBrowsingAssistantController _checkAssistantAvailabilityForPageLocale:](self, "_checkAssistantAvailabilityForPageLocale:", v7))
  {
    -[WBSBrowsingAssistantController _currentResultForURL:](self, "_currentResultForURL:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRemoteContentState:", 4);
    -[WBSBrowsingAssistantController _foundContentOptions:fromURL:](self, "_foundContentOptions:fromURL:", 0, v6);

    goto LABEL_9;
  }
  if (!-[NSString isEqualToString:](self->_previousWebpageIdentifier, "isEqualToString:", self->_webpageIdentifier))
  {
    +[WBSBiomeDonationManager sharedManager](WBSBiomeDonationManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "donateBrowsingAssistantWebPageStartedEventWithWebPageID:", self->_webpageIdentifier);

    objc_storeStrong((id *)&self->_previousWebpageIdentifier, self->_webpageIdentifier);
  }
  -[WBSBrowsingAssistantResult pageURL](self->_result, "pageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v6);

  if (!v10)
    goto LABEL_13;
  v11 = -[WBSBrowsingAssistantResult remoteContentState](self->_result, "remoteContentState");
  result = self->_result;
  if (v11 >= 2)
  {
    -[WBSBrowsingAssistantController _foundContentOptions:fromURL:](self, "_foundContentOptions:fromURL:", -[WBSBrowsingAssistantResult contentOptions](result, "contentOptions"), v6);
    goto LABEL_9;
  }
  if (-[WBSBrowsingAssistantResult remoteContentState](result, "remoteContentState") == 1)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_INFO, "We already have a URL checking on fly, don't continue.", buf, 2u);
    }
  }
  else
  {
LABEL_13:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16 = objc_msgSend(WeakRetained, "browsingAssistantControllerShouldCheckRemoteContent:", self);

    if (v16)
    {
      -[WBSBrowsingAssistantResult setRemoteContentState:](self->_result, "setRemoteContentState:", 1);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[WBSBiomeDonationManager sharedManager](WBSBiomeDonationManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "donateBrowsingAssistantServerRequestStartedEventWithWebPageID:requestIdentifier:requestType:", self->_webpageIdentifier, v18, 1);

      contentProvider = self->_contentProvider;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __83__WBSBrowsingAssistantController_checkForAssistantContentFromPegasusForURL_locale___block_invoke;
      v22[3] = &unk_1E4B2A500;
      v22[4] = self;
      v23 = v6;
      v24 = v18;
      v21 = v18;
      -[WBSBrowsingAssistantContentProvider checkContentAvailabilityForURL:locale:completion:](contentProvider, "checkContentAvailabilityForURL:locale:completion:", v23, v7, v22);

    }
  }
LABEL_9:

}

void __83__WBSBrowsingAssistantController_checkForAssistantContentFromPegasusForURL_locale___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  void *v6;
  _QWORD block[5];
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __83__WBSBrowsingAssistantController_checkForAssistantContentFromPegasusForURL_locale___block_invoke_2;
  block[3] = &unk_1E4B2A4D8;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  block[1] = 3221225472;
  v8 = v6;
  v10 = a2;
  v9 = *(id *)(a1 + 48);
  v11 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __83__WBSBrowsingAssistantController_checkForAssistantContentFromPegasusForURL_locale___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_currentResultForURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateForRemoteContentWithOptions:", *(_QWORD *)(a1 + 56));

  if (*(_QWORD *)(a1 + 56))
  {
    +[WBSBiomeDonationManager sharedManager](WBSBiomeDonationManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "donateBrowsingAssistantServerRequestEndedEventWithWebPageID:requestIdentifier:summary:tableOfContentsTexts:", v4, v5, 0, v6);

    +[WBSBiomeDonationManager sharedManager](WBSBiomeDonationManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "donateBrowsingAssistantEligibleEventWithWebPageID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "updateWithSearchResults:", 0);
    +[WBSBiomeDonationManager sharedManager](WBSBiomeDonationManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "donateBrowsingAssistantServerRequestFailedEventWithWebPageID:requestIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(a1 + 48));
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setTableOfContentsAvailable:", *(unsigned __int8 *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_foundContentOptions:fromURL:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)fetchAssistantContentFromPegasusForURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  int64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WBSBrowsingAssistantContentProvider *contentProvider;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void (**v22)(id, _QWORD);
  id v23;
  id location;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (!-[WBSBrowsingAssistantController _shouldContinueFetchingRemoteContent:](self, "_shouldContinueFetchingRemoteContent:", v6))
  {
    v7[2](v7, 0);
    goto LABEL_9;
  }
  v8 = -[WBSBrowsingAssistantResult remoteContentState](self->_result, "remoteContentState");
  -[WBSBrowsingAssistantController result](self, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "tableOfContentsAvailable") & 1) == 0)
  {

LABEL_8:
    -[WBSBrowsingAssistantResult setRemoteContentState:](self->_result, "setRemoteContentState:", 3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[WBSBiomeDonationManager sharedManager](WBSBiomeDonationManager, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "donateBrowsingAssistantWebpageURLSentWithWebPageID:urlSent:", self->_webpageIdentifier, v6);

    +[WBSBiomeDonationManager sharedManager](WBSBiomeDonationManager, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "donateBrowsingAssistantServerRequestStartedEventWithWebPageID:requestIdentifier:requestType:", self->_webpageIdentifier, v14, 2);

    objc_initWeak(&location, self);
    contentProvider = self->_contentProvider;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __95__WBSBrowsingAssistantController_fetchAssistantContentFromPegasusForURL_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E4B2A550;
    objc_copyWeak(&v23, &location);
    v20 = v6;
    v18 = v14;
    v21 = v18;
    v22 = v7;
    -[WBSBrowsingAssistantContentProvider fetchContentForURL:completion:](contentProvider, "fetchContentForURL:completion:", v20, v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

    goto LABEL_9;
  }
  -[WBSBrowsingAssistantController tableOfContentsTitles](self, "tableOfContentsTitles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v8 != 4 || !v11)
    goto LABEL_8;
  -[WBSBrowsingAssistantResult allResults](self->_result, "allResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v7)[2](v7, v12);

LABEL_9:
}

void __95__WBSBrowsingAssistantController_fetchAssistantContentFromPegasusForURL_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__WBSBrowsingAssistantController_fetchAssistantContentFromPegasusForURL_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4B2A528;
  block[4] = WeakRetained;
  v7 = a1[4];
  v8 = v3;
  v9 = a1[5];
  v10 = a1[6];
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __95__WBSBrowsingAssistantController_fetchAssistantContentFromPegasusForURL_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "_currentResultForURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithSearchResults:", *(_QWORD *)(a1 + 48));

  v3 = *(_QWORD *)(a1 + 48);
  +[WBSBiomeDonationManager sharedManager](WBSBiomeDonationManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[6];
  v7 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    objc_msgSend(v5, "summary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tableOfContentsTitles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "donateBrowsingAssistantServerRequestEndedEventWithWebPageID:requestIdentifier:summary:tableOfContentsTexts:", v6, v7, v8, v9);

  }
  else
  {
    objc_msgSend(v4, "donateBrowsingAssistantServerRequestFailedEventWithWebPageID:requestIdentifier:", v6, *(_QWORD *)(a1 + 56));
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (BOOL)_shouldContinueFetchingRemoteContent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  NSObject *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "userConsentState") == 1)
  {
    -[WBSBrowsingAssistantResult pageURL](self->_result, "pageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", v4);

    if ((v6 & 1) != 0)
    {
      if (-[WBSBrowsingAssistantResult remoteContentAvailableForFetching](self->_result, "remoteContentAvailableForFetching")|| (-[WBSBrowsingAssistantController result](self, "result"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "tableOfContentsAvailable"), v7, (v8 & 1) != 0))
      {
        if (-[WBSBrowsingAssistantResult remoteContentState](self->_result, "remoteContentState") != 3)
        {
          v23 = 1;
          goto LABEL_11;
        }
        v9 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[WBSBrowsingAssistantController _shouldContinueFetchingRemoteContent:].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
      }
      else
      {
        v25 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = 138739971;
          v27 = v4;
          _os_log_impl(&dword_1A3D90000, v25, OS_LOG_TYPE_INFO, "Don't fetch assistant content since first hop check says there is no remote content for %{sensitive}@.", (uint8_t *)&v26, 0xCu);
        }
      }
    }
    else
    {
      v16 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[WBSBrowsingAssistantController _shouldContinueFetchingRemoteContent:].cold.2((uint64_t)v4, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  v23 = 0;
LABEL_11:

  return v23;
}

- (void)updateAssistantContentForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__WBSBrowsingAssistantController_updateAssistantContentForURL_completionHandler___block_invoke;
  v8[3] = &unk_1E4B2A578;
  v9 = v6;
  v7 = v6;
  -[WBSBrowsingAssistantController fetchAssistantContentFromPegasusForURL:withCompletionHandler:](self, "fetchAssistantContentFromPegasusForURL:withCompletionHandler:", a3, v8);

}

uint64_t __81__WBSBrowsingAssistantController_updateAssistantContentForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "count") != 0);
}

- (WBSBrowsingAssistantControllerDelegate)delegate
{
  return (WBSBrowsingAssistantControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WBSBrowsingAssistantResult)result
{
  return self->_result;
}

- (NSString)webpageIdentifier
{
  return self->_webpageIdentifier;
}

- (void)setWebpageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)cachedReaderArticleTitle
{
  return self->_cachedReaderArticleTitle;
}

- (void)setCachedReaderArticleTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedReaderArticleTitle, 0);
  objc_storeStrong((id *)&self->_webpageIdentifier, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previousWebpageIdentifier, 0);
  objc_storeStrong((id *)&self->_userDefaultObservation, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
}

- (void)didFindLocalContentWithOptions:(os_log_t)log forURL:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138740227;
  v4 = a1;
  v5 = 2050;
  v6 = a2;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Received invalid local content for URL %{sensitive}@, content: %{public}ld", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_shouldContinueFetchingRemoteContent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "We already have a Pegasus request on fly for %{sensitive}@, bail out.", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)_shouldContinueFetchingRemoteContent:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "We don't have first hop check result for %{sensitive}@, bail out.", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_2();
}

@end
