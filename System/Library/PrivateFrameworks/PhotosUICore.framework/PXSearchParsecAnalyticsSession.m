@implementation PXSearchParsecAnalyticsSession

- (void)reportPhotosAppLaunchedOrEnteredForegroundWithPreviousSearchText:(id)a3 previousSearchTokens:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0D8C6B8];
  v7 = a4;
  v8 = a3;
  v10 = (id)objc_msgSend([v6 alloc], "initWithEvent:", 7);
  +[PXSearchParsecAnalyticsUtilities legacyDescriptionForSearchString:searchTokens:](PXSearchParsecAnalyticsUtilities, "legacyDescriptionForSearchString:searchTokens:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPreexistingInput:", v9);
  -[PXSearchParsecAnalyticsSession _reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback:](self, "_reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback:", v10);

}

- (void)_reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v5);

  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__PXSearchParsecAnalyticsSession__reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback___block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  dispatch_async(v6, block);

  px_dispatch_on_main_queue_when_idle_after_delay();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (OS_dispatch_queue)reportingQueue
{
  return self->_reportingQueue;
}

+ (id)sharedSession
{
  if (sharedSession_onceToken != -1)
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_5948);
  return (id)sharedSession_sharedSession;
}

void __47__PXSearchParsecAnalyticsSession_sharedSession__block_invoke()
{
  PXSearchParsecAnalyticsSession *v0;
  void *v1;

  v0 = objc_alloc_init(PXSearchParsecAnalyticsSession);
  v1 = (void *)sharedSession_sharedSession;
  sharedSession_sharedSession = (uint64_t)v0;

}

- (PXSearchParsecAnalyticsSession)init
{
  PXSearchParsecAnalyticsSession *v2;
  PXSearchParsecAnalyticsSession *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *reportingQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXSearchParsecAnalyticsSession;
  v2 = -[PXSearchParsecAnalyticsSession init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentQueryId = 1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = dispatch_queue_create("com.apple.photos.search.parsec_reporting", v5);
    reportingQueue = v3->_reportingQueue;
    v3->_reportingQueue = (OS_dispatch_queue *)v6;

  }
  return v3;
}

- (PARSession)session
{
  PXSearchParsecAnalyticsSession *v3;
  PARSession *session;
  void *v5;
  uint64_t v6;
  PARSession *v7;
  PARSession *v8;

  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  v3 = self;
  objc_sync_enter(v3);
  session = v3->_session;
  if (!session)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D177E0]), "initWithId:userAgent:", CFSTR("com.apple.photos"), CFSTR("Photos/1"));
    objc_msgSend(MEMORY[0x1E0D177D8], "sharedPARSessionWithConfiguration:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v3->_session;
    v3->_session = (PARSession *)v6;

    session = v3->_session;
  }
  v8 = session;
  objc_sync_exit(v3);

  return v8;
}

- (void)reportPhotosAppLaunchedOrEnteredForegroundWithSpotlightSearchActivity
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6B8]), "initWithEvent:", 7);
  objc_msgSend(v3, "setOriginatingApp:", CFSTR("com.apple.searchd.searchthroughsuggestions"));
  -[PXSearchParsecAnalyticsSession _reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback:](self, "_reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback:", v3);

}

- (void)reportPhotosAppEnteredBackground
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PXSearchParsecAnalyticsSession_reportPhotosAppEnteredBackground__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)reportPhotosAppQuit
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PXSearchParsecAnalyticsSession_reportPhotosAppQuit__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)reportSearchTabSelected
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PXSearchParsecAnalyticsSession_reportSearchTabSelected__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)reportSearchButtonTapped
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__PXSearchParsecAnalyticsSession_reportSearchButtonTapped__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)reportSearchTabDeselected
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PXSearchParsecAnalyticsSession_reportSearchTabDeselected__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)reportSearchFieldContentChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PXSearchParsecAnalyticsSession_reportSearchFieldContentChanged___block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)reportZeroKeywordLoadBegan
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PXSearchParsecAnalyticsSession_reportZeroKeywordLoadBegan__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)reportZeroKeywordLoadFinished
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PXSearchParsecAnalyticsSession_reportZeroKeywordLoadFinished__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)reportZeroKeywordSections:(id)a3 visibleIndexPaths:(id)a4 reportVisibleResultChangesOnly:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__PXSearchParsecAnalyticsSession_reportZeroKeywordSections_visibleIndexPaths_reportVisibleResultChangesOnly___block_invoke;
  block[3] = &unk_1E5135448;
  v17 = a5;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  objc_copyWeak(&v16, &location);
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)reportZeroKeywordSelected:(id)a3 searchToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = objc_initWeak(location, self);
    -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PXSearchParsecAnalyticsSession_reportZeroKeywordSelected_searchToken___block_invoke;
    block[3] = &unk_1E5147B18;
    v13 = v8;
    v14 = v6;
    objc_copyWeak(&v15, location);
    dispatch_async(v10, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    PLSearchUIParsecAnalyticsGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Encountered unexpected nil search token and/or zerokeyword when reporting zero keyword selection to parsec.", (uint8_t *)location, 2u);
    }

  }
}

- (void)reportSearchSuggestions:(id)a3 searchResultSections:(id)a4 visibleIndexPaths:(id)a5 reportVisibleResultChangesOnly:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __128__PXSearchParsecAnalyticsSession_reportSearchSuggestions_searchResultSections_visibleIndexPaths_reportVisibleResultChangesOnly___block_invoke;
  v17[3] = &unk_1E5144120;
  v22 = a6;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  objc_copyWeak(&v21, &location);
  dispatch_async(v13, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)reportSearchQueryExecutionCompleted
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__PXSearchParsecAnalyticsSession_reportSearchQueryExecutionCompleted__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)reportSearchFieldContentCleared
{
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7[2];
  id location;

  v3 = -[PXSearchParsecAnalyticsSession currentQueryId](self, "currentQueryId");
  v4 = objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PXSearchParsecAnalyticsSession_reportSearchFieldContentCleared__block_invoke;
  block[3] = &unk_1E51447A0;
  v7[1] = v3;
  objc_copyWeak(v7, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)reportSearchFieldBackButtonSelected
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PXSearchParsecAnalyticsSession_reportSearchFieldBackButtonSelected__block_invoke;
  v5[3] = &unk_1E5148D30;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)legacyReportSearchSuggestionSelected:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  PXSearchParsecAnalyticsSession *v10;
  id v11;
  id location[2];

  v4 = a3;
  if (v4)
  {
    v5 = objc_initWeak(location, self);
    -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PXSearchParsecAnalyticsSession_legacyReportSearchSuggestionSelected___block_invoke;
    block[3] = &unk_1E5147B18;
    v9 = v4;
    v10 = self;
    objc_copyWeak(&v11, location);
    dispatch_async(v6, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    PLSearchUIParsecAnalyticsGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Encountered unexpected nil search token when reporting token selection to parsec.", (uint8_t *)location, 2u);
    }

  }
}

- (void)reportSearchSuggestionSelected:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10[2];
  id location[2];

  v4 = a3;
  if (v4)
  {
    v5 = -[PXSearchParsecAnalyticsSession currentQueryId](self, "currentQueryId");
    objc_initWeak(location, self);
    -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__PXSearchParsecAnalyticsSession_reportSearchSuggestionSelected___block_invoke;
    block[3] = &unk_1E513FF48;
    v9 = v4;
    v10[1] = v5;
    objc_copyWeak(v10, location);
    dispatch_async(v6, block);

    objc_destroyWeak(v10);
    objc_destroyWeak(location);
  }
  else
  {
    PLSearchUIParsecAnalyticsGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Encountered unexpected nil search suggestion when reporting token selection to parsec.", (uint8_t *)location, 2u);
    }

  }
}

- (void)reportRecentSearchSelectedWithSearchText:(id)a3 searchTokens:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__PXSearchParsecAnalyticsSession_reportRecentSearchSelectedWithSearchText_searchTokens___block_invoke;
  v12[3] = &unk_1E5147B18;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_copyWeak(&v15, &location);
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)reportShowMoreResultsSelected:(BOOL)a3 searchResultsSection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;
  id location;

  v6 = a4;
  v7 = objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PXSearchParsecAnalyticsSession_reportShowMoreResultsSelected_searchResultsSection___block_invoke;
  v10[3] = &unk_1E5144F48;
  v11 = v6;
  v9 = v6;
  objc_copyWeak(&v12, &location);
  v13 = a3;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)reportSearchAssetResultSelected:(id)a3 isTopResult:(BOOL)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;
  id location;

  v6 = a3;
  v7 = objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__PXSearchParsecAnalyticsSession_reportSearchAssetResultSelected_isTopResult___block_invoke;
  v10[3] = &unk_1E5144F48;
  v11 = v6;
  v13 = a4;
  v9 = v6;
  objc_copyWeak(&v12, &location);
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)legacyReportSearchResultSelected:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  PXSearchParsecAnalyticsSession *v10;
  id v11;
  id location[2];

  v4 = a3;
  if (v4)
  {
    v5 = objc_initWeak(location, self);
    -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PXSearchParsecAnalyticsSession_legacyReportSearchResultSelected___block_invoke;
    block[3] = &unk_1E5147B18;
    v9 = v4;
    v10 = self;
    objc_copyWeak(&v11, location);
    dispatch_async(v6, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    PLSearchUIParsecAnalyticsGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Encountered unexpected nil search result when reporting result selection to parsec.", (uint8_t *)location, 2u);
    }

  }
}

- (void)reportSearchCollectionResultSelected:(id)a3 type:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  PXSearchParsecAnalyticsSession *v12;
  id v13[2];
  id location;

  v6 = a3;
  v7 = objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PXSearchParsecAnalyticsSession_reportSearchCollectionResultSelected_type___block_invoke;
  block[3] = &unk_1E513A518;
  v13[1] = (id)a4;
  v11 = v6;
  v12 = self;
  v9 = v6;
  objc_copyWeak(v13, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)reportTopResultsShown:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXSearchParsecAnalyticsSession_reportTopResultsShown___block_invoke;
  block[3] = &unk_1E5147280;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)reportAllResultsShown:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 >= 0x64)
    v6 = 100;
  else
    v6 = v5;
  objc_msgSend(v4, "subarrayWithRange:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXSearchParsecAnalyticsSession_reportAllResultsShown___block_invoke;
  block[3] = &unk_1E5147280;
  v11 = v7;
  v9 = v7;
  objc_copyWeak(&v12, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)reportTopCollectionsShown:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PXSearchParsecAnalyticsSession reportingQueue](self, "reportingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PXSearchParsecAnalyticsSession_reportTopCollectionsShown___block_invoke;
  block[3] = &unk_1E5147280;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_reportFeedback:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXSearchParsecAnalyticsSession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportFeedback:queryId:", v4, -[PXSearchParsecAnalyticsSession currentQueryId](self, "currentQueryId"));

  PLSearchUIParsecAnalyticsGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = -[PXSearchParsecAnalyticsSession currentQueryId](self, "currentQueryId");
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Reporting queryID: %lld feedback: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (int64_t)currentQueryId
{
  return self->_currentQueryId;
}

- (void)setCurrentQueryId:(int64_t)a3
{
  self->_currentQueryId = a3;
}

- (SFStartLocalSearchFeedback)currentStartSearchFeedback
{
  return self->_currentStartSearchFeedback;
}

- (void)setCurrentStartSearchFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_currentStartSearchFeedback, a3);
}

- (SFStartLocalSearchFeedback)currentStartZeroKeywordLoadFeedback
{
  return self->_currentStartZeroKeywordLoadFeedback;
}

- (void)setCurrentStartZeroKeywordLoadFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_currentStartZeroKeywordLoadFeedback, a3);
}

- (void)setReportingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reportingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingQueue, 0);
  objc_storeStrong((id *)&self->_currentStartZeroKeywordLoadFeedback, 0);
  objc_storeStrong((id *)&self->_currentStartSearchFeedback, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __95__PXSearchParsecAnalyticsSession__reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_reportFeedback:", *(_QWORD *)(a1 + 32));

  PLSearchUIParsecAnalyticsGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "Reporting Photos app launched", v4, 2u);
  }

}

void __95__PXSearchParsecAnalyticsSession__reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback___block_invoke_28(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "reportingQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v1);

}

void __60__PXSearchParsecAnalyticsSession_reportTopCollectionsShown___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = a1;
  obj = *(id *)(a1 + 32);
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v28;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(obj);
        v21 = v3;
        v4 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v3);
        v5 = objc_msgSend(v4, "unsignedIntValue");
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(*(id *)(v19 + 32), "objectForKeyedSubscript:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v24 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              WeakRetained = objc_loadWeakRetained((id *)(v19 + 40));
              +[PXSearchParsecAnalyticsUtilities SFSearchResultFromCollectionIdentifier:type:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromCollectionIdentifier:type:queryId:", v11, v5, objc_msgSend(WeakRetained, "currentQueryId"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v2, "addObject:", v13);
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v8);
        }

        v3 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v20);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C828]), "initWithResults:triggerEvent:", v2, 1);
  v15 = objc_loadWeakRetained((id *)(v19 + 40));
  objc_msgSend(v15, "_reportFeedback:", v14);

  PLSearchUIParsecAnalyticsGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "Reporting currently shown top collection results", buf, 2u);
  }

}

void __56__PXSearchParsecAnalyticsSession_reportAllResultsShown___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v14 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        WeakRetained = objc_loadWeakRetained((id *)(v14 + 40));
        +[PXSearchParsecAnalyticsUtilities SFSearchResultFromAssetUUID:isTopResult:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromAssetUUID:isTopResult:queryId:", v8, 0, objc_msgSend(WeakRetained, "currentQueryId"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "addObject:", v10);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C828]), "initWithResults:triggerEvent:", v2, 1);
  v12 = objc_loadWeakRetained((id *)(v14 + 40));
  objc_msgSend(v12, "_reportFeedback:", v11);

  PLSearchUIParsecAnalyticsGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Reporting currently shown All Results", buf, 2u);
  }

}

void __56__PXSearchParsecAnalyticsSession_reportTopResultsShown___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v14 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        WeakRetained = objc_loadWeakRetained((id *)(v14 + 40));
        +[PXSearchParsecAnalyticsUtilities SFSearchResultFromAssetUUID:isTopResult:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromAssetUUID:isTopResult:queryId:", v8, 1, objc_msgSend(WeakRetained, "currentQueryId"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "addObject:", v10);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C828]), "initWithResults:triggerEvent:", v2, 1);
  v12 = objc_loadWeakRetained((id *)(v14 + 40));
  objc_msgSend(v12, "_reportFeedback:", v11);

  PLSearchUIParsecAnalyticsGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Reporting currently shown Top Results", buf, 2u);
  }

}

void __76__PXSearchParsecAnalyticsSession_reportSearchCollectionResultSelected_type___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id WeakRetained;
  NSObject *v8;
  uint8_t v9[16];

  +[PXSearchParsecAnalyticsUtilities SFSearchResultFromCollectionIdentifier:type:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromCollectionIdentifier:type:queryId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "currentQueryId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D8C298]);
  v4 = objc_alloc_init(MEMORY[0x1E0D8C218]);
  v5 = objc_alloc_init(MEMORY[0x1E0D8C1E0]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C2A8]), "initWithCommand:cardSection:result:button:", v3, v4, v2, v5);
  objc_msgSend(v6, "setTriggerEvent:", 2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_reportFeedback:", v6);

  PLSearchUIParsecAnalyticsGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Reporting search collection result was selected", v9, 2u);
  }

}

void __67__PXSearchParsecAnalyticsSession_legacyReportSearchResultSelected___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id WeakRetained;
  NSObject *v8;
  uint8_t v9[16];

  +[PXSearchParsecAnalyticsUtilities SFSearchResultFromSearchResultObject:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromSearchResultObject:queryId:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "currentQueryId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D8C298]);
  v4 = objc_alloc_init(MEMORY[0x1E0D8C218]);
  v5 = objc_alloc_init(MEMORY[0x1E0D8C1E0]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C2A8]), "initWithCommand:cardSection:result:button:", v3, v4, v2, v5);
  objc_msgSend(v6, "setTriggerEvent:", 2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_reportFeedback:", v6);

  PLSearchUIParsecAnalyticsGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Reporting search result was selected", v9, 2u);
  }

}

void __78__PXSearchParsecAnalyticsSession_reportSearchAssetResultSelected_isTopResult___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[PXSearchParsecAnalyticsUtilities SFSearchResultFromAssetUUID:isTopResult:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromAssetUUID:isTopResult:queryId:", v1, v2, objc_msgSend(WeakRetained, "currentQueryId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0D8C298]);
  v7 = objc_alloc_init(MEMORY[0x1E0D8C218]);
  v8 = objc_alloc_init(MEMORY[0x1E0D8C1E0]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C2A8]), "initWithCommand:cardSection:result:button:", v6, v7, v5, v8);
  objc_msgSend(v9, "setTriggerEvent:", 2);
  v10 = objc_loadWeakRetained(v3);
  objc_msgSend(v10, "_reportFeedback:", v9);

  PLSearchUIParsecAnalyticsGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Reporting search result was selected", v12, 2u);
  }

}

void __85__PXSearchParsecAnalyticsSession_reportShowMoreResultsSelected_searchResultsSection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id WeakRetained;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const __CFString *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a1;
  objc_msgSend(*(id *)(a1 + 32), "visibleResultIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v7);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v3;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          WeakRetained = objc_loadWeakRetained((id *)(v34 + 40));
          +[PXSearchParsecAnalyticsUtilities SFSearchResultFromSearchResultObject:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromSearchResultObject:queryId:", v17, objc_msgSend(WeakRetained, "currentQueryId"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            objc_msgSend(v35, "addObject:", v19);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v14);
  }

  v20 = objc_alloc(MEMORY[0x1E0D8C828]);
  if (*(_BYTE *)(v34 + 48))
    v21 = 3;
  else
    v21 = 6;
  v22 = (void *)objc_msgSend(v20, "initWithResults:triggerEvent:", v35, v21);
  v23 = objc_loadWeakRetained((id *)(v34 + 40));
  objc_msgSend(v23, "_reportFeedback:", v22);

  v24 = objc_alloc(MEMORY[0x1E0D8C2A8]);
  v25 = objc_alloc_init(MEMORY[0x1E0D8C298]);
  v26 = objc_alloc_init(MEMORY[0x1E0D8C218]);
  v27 = (void *)objc_msgSend(v24, "initWithCommand:cardSection:", v25, v26);

  v28 = *(_QWORD *)(v34 + 32);
  v29 = objc_loadWeakRetained((id *)(v34 + 40));
  +[PXSearchParsecAnalyticsUtilities resultSectionForSearchSection:sectionIsVisible:queryId:](PXSearchParsecAnalyticsUtilities, "resultSectionForSearchSection:sectionIsVisible:queryId:", v28, 1, objc_msgSend(v29, "currentQueryId"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setResultSection:", v30);
  objc_msgSend(v27, "setTriggerEvent:", 2);
  v31 = objc_loadWeakRetained((id *)(v34 + 40));
  objc_msgSend(v31, "_reportFeedback:", v27);

  PLSearchUIParsecAnalyticsGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(v34 + 48))
      v33 = CFSTR("more");
    else
      v33 = CFSTR("less");
    *(_DWORD *)buf = 138412290;
    v45 = v33;
    _os_log_impl(&dword_1A6789000, v32, OS_LOG_TYPE_DEFAULT, "Reporting show %@ selected", buf, 0xCu);
  }

}

void __88__PXSearchParsecAnalyticsSession_reportRecentSearchSelectedWithSearchText_searchTokens___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[PXSearchParsecAnalyticsUtilities SFSearchResultFromRecentSearchText:recentSearchSuggestions:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromRecentSearchText:recentSearchSuggestions:queryId:", v1, v2, objc_msgSend(WeakRetained, "currentQueryId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXSearchParsecAnalyticsUtilities commandFeedbackFromSFSearchResult:](PXSearchParsecAnalyticsUtilities, "commandFeedbackFromSFSearchResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "_reportFeedback:", v6);

  PLSearchUIParsecAnalyticsGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Reporting recent search selected", v9, 2u);
  }

}

void __65__PXSearchParsecAnalyticsSession_reportSearchSuggestionSelected___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  NSObject *v5;
  uint8_t v6[16];

  +[PXSearchParsecAnalyticsUtilities SFSearchResultFromSearchSuggestion:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromSearchSuggestion:queryId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchParsecAnalyticsUtilities commandFeedbackFromSFSearchResult:](PXSearchParsecAnalyticsUtilities, "commandFeedbackFromSFSearchResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_reportFeedback:", v3);

  PLSearchUIParsecAnalyticsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Reporting search suggestion selected", v6, 2u);
  }

}

void __71__PXSearchParsecAnalyticsSession_legacyReportSearchSuggestionSelected___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  NSObject *v5;
  uint8_t v6[16];

  +[PXSearchParsecAnalyticsUtilities SFSearchResultFromUISearchToken:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromUISearchToken:queryId:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "currentQueryId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchParsecAnalyticsUtilities commandFeedbackFromSFSearchResult:](PXSearchParsecAnalyticsUtilities, "commandFeedbackFromSFSearchResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_reportFeedback:", v3);

  PLSearchUIParsecAnalyticsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Reporting search suggestion selected", v6, 2u);
  }

}

void __69__PXSearchParsecAnalyticsSession_reportSearchFieldBackButtonSelected__block_invoke(id *a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C240]), "initWithEvent:", 0);
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "_reportFeedback:", v2);

  v4 = objc_loadWeakRetained(a1);
  objc_msgSend(v4, "setCurrentStartSearchFeedback:", 0);

  PLSearchUIParsecAnalyticsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Reporting search field cancel button selected", v6, 2u);
  }

}

void __65__PXSearchParsecAnalyticsSession_reportSearchFieldContentCleared__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C240]), "initWithEvent:", 0);
  objc_msgSend(v2, "setQueryId:", *(_QWORD *)(a1 + 40));
  a1 += 32;
  WeakRetained = objc_loadWeakRetained((id *)a1);
  objc_msgSend(WeakRetained, "_reportFeedback:", v2);

  v4 = objc_loadWeakRetained((id *)a1);
  objc_msgSend(v4, "setCurrentStartSearchFeedback:", 0);

  PLSearchUIParsecAnalyticsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Reporting search field content cleared", v6, 2u);
  }

}

void __69__PXSearchParsecAnalyticsSession_reportSearchQueryExecutionCompleted__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentStartSearchFeedback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8C368]);
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "currentStartSearchFeedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "initWithStartSearch:", v6);

    v8 = objc_loadWeakRetained(v1);
    objc_msgSend(v8, "_reportFeedback:", v7);

    v9 = objc_loadWeakRetained(v1);
    objc_msgSend(v9, "setCurrentStartSearchFeedback:", 0);

    PLSearchUIParsecAnalyticsGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Reporting search query execution completed", v11, 2u);
    }

  }
  else
  {
    PLSearchUIParsecAnalyticsGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Unexpectedly tracked query end without tracking query begin", buf, 2u);
    }
  }

}

void __128__PXSearchParsecAnalyticsSession_reportSearchSuggestions_searchResultSections_visibleIndexPaths_reportVisibleResultChangesOnly___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  if (!*(_BYTE *)(a1 + 64))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    +[PXSearchParsecAnalyticsUtilities sectionRankingFeedbackWithSearchSuggestions:searchResultSections:visibleIndexPaths:queryId:](PXSearchParsecAnalyticsUtilities, "sectionRankingFeedbackWithSearchSuggestions:searchResultSections:visibleIndexPaths:queryId:", v2, v3, v4, objc_msgSend(WeakRetained, "currentQueryId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C600]), "initWithSections:blendingDuration:", v6, 0.0);
    v8 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v8, "_reportFeedback:", v7);

    PLSearchUIParsecAnalyticsGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Reporting all search suggestions and results returned from query", buf, 2u);
    }

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = (id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = objc_loadWeakRetained(v12);
  +[PXSearchParsecAnalyticsUtilities visibleSFSearchResultsFromSearchSuggestions:searchResultSections:visibleIndexPaths:queryId:](PXSearchParsecAnalyticsUtilities, "visibleSFSearchResultsFromSearchSuggestions:searchResultSections:visibleIndexPaths:queryId:", v10, v11, v13, objc_msgSend(v14, "currentQueryId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C828]), "initWithResults:triggerEvent:", v15, 1);
  v17 = objc_loadWeakRetained(v12);
  objc_msgSend(v17, "_reportFeedback:", v16);

  PLSearchUIParsecAnalyticsGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "Reporting currently visible search suggestions and results returned from query", v19, 2u);
  }

}

void __72__PXSearchParsecAnalyticsSession_reportZeroKeywordSelected_searchToken___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[PXSearchParsecAnalyticsUtilities SFSearchResultFromSearchSuggestion:zeroKeyword:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromSearchSuggestion:zeroKeyword:queryId:", v1, v2, objc_msgSend(WeakRetained, "currentQueryId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXSearchParsecAnalyticsUtilities commandFeedbackFromSFSearchResult:](PXSearchParsecAnalyticsUtilities, "commandFeedbackFromSFSearchResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "_reportFeedback:", v6);

  PLSearchUIParsecAnalyticsGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Reporting zero keyword selected", v9, 2u);
  }

}

void __109__PXSearchParsecAnalyticsSession_reportZeroKeywordSections_visibleIndexPaths_reportVisibleResultChangesOnly___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  if (!*(_BYTE *)(a1 + 56))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    +[PXSearchParsecAnalyticsUtilities sectionRankingFeedbackWithSearchZeroKeywordSections:visibleIndexPaths:queryId:](PXSearchParsecAnalyticsUtilities, "sectionRankingFeedbackWithSearchZeroKeywordSections:visibleIndexPaths:queryId:", v2, v3, objc_msgSend(WeakRetained, "currentQueryId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C600]), "initWithSections:blendingDuration:", v5, 0.0);
    v7 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v7, "_reportFeedback:", v6);

    PLSearchUIParsecAnalyticsGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Reporting all search zero keywords in search home", buf, 2u);
    }

  }
  v9 = (id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v12 = objc_loadWeakRetained(v9);
  +[PXSearchParsecAnalyticsUtilities visibleSFSearchResultsFromZeroKeywordSections:visibleIndexPaths:queryId:](PXSearchParsecAnalyticsUtilities, "visibleSFSearchResultsFromZeroKeywordSections:visibleIndexPaths:queryId:", v11, v10, objc_msgSend(v12, "currentQueryId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C828]), "initWithResults:triggerEvent:", v13, 1);
  v15 = objc_loadWeakRetained(v9);
  objc_msgSend(v15, "_reportFeedback:", v14);

  PLSearchUIParsecAnalyticsGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "Reporting currently visible search zero keywords", v17, 2u);
  }

}

void __63__PXSearchParsecAnalyticsSession_reportZeroKeywordLoadFinished__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentStartZeroKeywordLoadFeedback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8C368]);
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "currentStartZeroKeywordLoadFeedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "initWithStartSearch:", v6);

    v8 = objc_loadWeakRetained(v1);
    objc_msgSend(v8, "_reportFeedback:", v7);

    v9 = objc_loadWeakRetained(v1);
    objc_msgSend(v9, "setCurrentStartZeroKeywordLoadFeedback:", 0);

    PLSearchUIParsecAnalyticsGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Reporting search ZKW loading completed.", v11, 2u);
    }

  }
  else
  {
    PLSearchUIParsecAnalyticsGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Unexpectedly tracked ZKW end without tracking ZKW begin.", buf, 2u);
    }
  }

}

void __60__PXSearchParsecAnalyticsSession_reportZeroKeywordLoadBegan__block_invoke(id *a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C738]), "initWithInput:triggerEvent:indexType:", 0, 9, 0);
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "setCurrentStartZeroKeywordLoadFeedback:", v2);

  v4 = objc_loadWeakRetained(a1);
  objc_msgSend(v4, "_reportFeedback:", v2);

  PLSearchUIParsecAnalyticsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Reporting search ZKW loading begin.", v6, 2u);
  }

}

void __66__PXSearchParsecAnalyticsSession_reportSearchFieldContentChanged___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCurrentQueryId:", objc_msgSend(WeakRetained, "currentQueryId") + 1);

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(v5, "length");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__PXSearchParsecAnalyticsSession_reportSearchFieldContentChanged___block_invoke_2;
  v16[3] = &unk_1E5117250;
  v7 = v4;
  v17 = v7;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v16);
  objc_msgSend(*(id *)(a1 + 32), "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchParsecAnalyticsUtilities descriptionForSearchString:searchTokens:](PXSearchParsecAnalyticsUtilities, "descriptionForSearchString:searchTokens:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0D8C738]);
  v11 = objc_loadWeakRetained(v2);
  v12 = (void *)objc_msgSend(v10, "initWithInput:triggerEvent:indexType:queryId:", v9, 9, 0, objc_msgSend(v11, "currentQueryId"));

  v13 = objc_loadWeakRetained(v2);
  objc_msgSend(v13, "setCurrentStartSearchFeedback:", v12);

  v14 = objc_loadWeakRetained(v2);
  objc_msgSend(v14, "_reportFeedback:", v12);

  PLSearchUIParsecAnalyticsGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "Reporting search field contents changed with input description: %@", buf, 0xCu);
  }

}

void __66__PXSearchParsecAnalyticsSession_reportSearchFieldContentChanged___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = *MEMORY[0x1E0CD1DD0];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1DD0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "suggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

    v5 = v8;
  }

}

void __59__PXSearchParsecAnalyticsSession_reportSearchTabDeselected__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  NSObject *v4;
  uint8_t v5[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6C0]), "initWithEvent:", 25);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportFeedback:", v2);

  PLSearchUIParsecAnalyticsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Reporting search home disappeared", v5, 2u);
  }

}

void __58__PXSearchParsecAnalyticsSession_reportSearchButtonTapped__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6B8]), "initWithEvent:", 11);
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportFeedback:", v2);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C738]), "initWithInput:triggerEvent:indexType:", 0, 9, 0);
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "_reportFeedback:", v5);

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "setCurrentStartSearchFeedback:", v5);

  PLSearchUIParsecAnalyticsGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Reporting search button tapped and search home appeared", v9, 2u);
  }

}

void __57__PXSearchParsecAnalyticsSession_reportSearchTabSelected__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  NSObject *v4;
  uint8_t v5[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6B8]), "initWithEvent:", 11);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportFeedback:", v2);

  PLSearchUIParsecAnalyticsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Reporting search home appeared", v5, 2u);
  }

}

void __53__PXSearchParsecAnalyticsSession_reportPhotosAppQuit__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  NSObject *v4;
  uint8_t v5[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6C0]), "initWithEvent:", 11);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportFeedback:", v2);

  PLSearchUIParsecAnalyticsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Reporting Photos app quit", v5, 2u);
  }

}

void __66__PXSearchParsecAnalyticsSession_reportPhotosAppEnteredBackground__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  NSObject *v4;
  uint8_t v5[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6C0]), "initWithEvent:", 23);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportFeedback:", v2);

  PLSearchUIParsecAnalyticsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Reporting Photos app was backgrounded", v5, 2u);
  }

}

@end
