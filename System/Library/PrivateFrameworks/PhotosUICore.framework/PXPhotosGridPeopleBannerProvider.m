@implementation PXPhotosGridPeopleBannerProvider

- (PXPhotosGridPeopleBannerProvider)initWithPerson:(id)a3
{
  return -[PXPhotosGridPeopleBannerProvider initWithPerson:namingSuggestionsOnly:](self, "initWithPerson:namingSuggestionsOnly:", a3, 0);
}

- (PXPhotosGridPeopleBannerProvider)initWithPerson:(id)a3 namingSuggestionsOnly:(BOOL)a4
{
  id v7;
  PXPhotosGridPeopleBannerProvider *v8;
  PXPhotosGridPeopleBannerProvider *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *workQueue;
  os_log_t v14;
  OS_os_log *log;
  NSMutableDictionary *v16;
  NSMutableDictionary *loadCompletionBlocks;
  void *v18;
  objc_super v20;

  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotosGridPeopleBannerProvider;
  v8 = -[PXPhotosGridPeopleBannerProvider init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_person, a3);
    v9->_namingSuggestionsOnly = a4;
    v9->_currentBannerType = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("PXPhotosGridPeopleBannerProvider-workQueue", v11);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v12;

    v14 = os_log_create((const char *)*MEMORY[0x1E0D71100], "PeopleBanners");
    log = v9->_log;
    v9->_log = (OS_os_log *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    loadCompletionBlocks = v9->_loadCompletionBlocks;
    v9->_loadCompletionBlocks = v16;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel__suggestionsDidFinish_, CFSTR("PXPeopleConfirmationDidFinish"), 0);

  }
  return v9;
}

- (void)setPerson:(id)a3
{
  PHPerson *v5;
  PHPerson *person;
  int IsNamed;
  int v8;
  NSObject *log;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  void *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (PHPerson *)a3;
  person = self->_person;
  if (person != v5)
  {
    IsNamed = _PersonIsNamed(person);
    objc_storeStrong((id *)&self->_person, a3);
    v8 = _PersonIsNamed(self->_person);
    -[PXPeopleCandidateBannerView setPerson:](self->_loadedSuggestionBannerView, "setPerson:", v5);
    if (IsNamed != v8)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v10 = log;
        -[PHPerson localIdentifier](v5, "localIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("NO");
        if (v8)
          v12 = CFSTR("YES");
        v13 = v12;
        v14 = 138543618;
        v15 = v11;
        v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Will dismiss suggestion banner (if any) because the person %{public}@ has become named: %@", (uint8_t *)&v14, 0x16u);

      }
      -[PXPhotosGridPeopleBannerProvider _dismissBanner](self, "_dismissBanner");
    }
  }

}

- (void)_setSuggestionBannerView:(id)a3 addNameBannerView:(id)a4
{
  PXPeopleCandidateBannerView *v6;
  PXPhotosGridUnnamedPersonBannerView *v7;
  PXPeopleCandidateBannerView *loadedSuggestionBannerView;
  PXPhotosGridUnnamedPersonBannerView *loadedAddNameBannerView;
  PXPeopleCandidateBannerView *v10;

  v6 = (PXPeopleCandidateBannerView *)a3;
  v7 = (PXPhotosGridUnnamedPersonBannerView *)a4;
  loadedSuggestionBannerView = self->_loadedSuggestionBannerView;
  self->_loadedSuggestionBannerView = v6;
  v10 = v6;

  loadedAddNameBannerView = self->_loadedAddNameBannerView;
  self->_loadedAddNameBannerView = v7;

}

- (PXPhotosBannerView)loadedBannerView
{
  void *loadedSuggestionBannerView;

  loadedSuggestionBannerView = self->_loadedSuggestionBannerView;
  if (!loadedSuggestionBannerView)
    loadedSuggestionBannerView = self->_loadedAddNameBannerView;
  return (PXPhotosBannerView *)loadedSuggestionBannerView;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PXPeopleConfirmationDidFinish"), 0);

  v4.receiver = self;
  v4.super_class = (Class)PXPhotosGridPeopleBannerProvider;
  -[PXPhotosGridPeopleBannerProvider dealloc](&v4, sel_dealloc);
}

- (void)loadBannerView:(id)a3
{
  void (**v5)(id, void *);
  int64_t loadState;
  unint64_t v7;
  void *loadGeneration;
  NSObject *log;
  BOOL dismissed;
  NSObject *workQueue;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15[2];
  BOOL v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridPeopleBannerProvider.m"), 179, CFSTR("%s must be called on the main thread"), "-[PXPhotosGridPeopleBannerProvider loadBannerView:]");

  }
  loadState = self->_loadState;
  switch(loadState)
  {
    case 2:
      -[PXPhotosGridPeopleBannerProvider loadedBannerView](self, "loadedBannerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v12);

      break;
    case 1:
      -[PXPhotosGridPeopleBannerProvider _addLoadCompletionBlock:](self, "_addLoadCompletionBlock:", v5);
      break;
    case 0:
      v7 = self->_loadGeneration + 1;
      self->_loadState = 1;
      self->_loadGeneration = v7;
      -[PXPhotosGridPeopleBannerProvider _addLoadCompletionBlock:](self, "_addLoadCompletionBlock:", v5);
      loadGeneration = (void *)self->_loadGeneration;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v18 = loadGeneration;
        _os_log_impl(&dword_1A6789000, log, OS_LOG_TYPE_DEFAULT, "Will begin banner view load generation %lu", buf, 0xCu);
      }
      dismissed = self->_dismissed;
      objc_initWeak((id *)buf, self);
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__PXPhotosGridPeopleBannerProvider_loadBannerView___block_invoke;
      block[3] = &unk_1E51383C0;
      block[4] = self;
      v16 = dismissed;
      objc_copyWeak(v15, (id *)buf);
      v15[1] = loadGeneration;
      dispatch_async(workQueue, block);
      objc_destroyWeak(v15);
      objc_destroyWeak((id *)buf);
      break;
  }

}

- (void)_addLoadCompletionBlock:(id)a3
{
  void *v4;
  NSMutableDictionary *loadCompletionBlocks;
  unint64_t loadGeneration;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  loadGeneration = self->_loadGeneration;
  loadCompletionBlocks = self->_loadCompletionBlocks;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", loadGeneration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](loadCompletionBlocks, "objectForKeyedSubscript:", v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v9 = (void *)objc_msgSend(v7, "copy");

    v10 = _Block_copy(v9);
    objc_msgSend(v14, "addObject:", v10);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C99DE8];
    v9 = _Block_copy(v7);

    objc_msgSend(v11, "arrayWithObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_loadCompletionBlocks;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_loadGeneration);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v10, v13);

  }
}

- (void)_finishLoadWithGeneration:(unint64_t)a3 bannerView:(id)a4
{
  id v7;
  NSMutableDictionary *loadCompletionBlocks;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  unint64_t loadGeneration;
  NSObject *log;
  _BOOL4 v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridPeopleBannerProvider.m"), 220, CFSTR("%s must be called on the main thread"), "-[PXPhotosGridPeopleBannerProvider _finishLoadWithGeneration:bannerView:]");

  }
  loadCompletionBlocks = self->_loadCompletionBlocks;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](loadCompletionBlocks, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = self->_loadCompletionBlocks;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

  loadGeneration = self->_loadGeneration;
  log = self->_log;
  v16 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (loadGeneration == a3)
  {
    if (v16)
    {
      *(_DWORD *)buf = 134217984;
      v30 = a3;
      _os_log_impl(&dword_1A6789000, log, OS_LOG_TYPE_DEFAULT, "Completed current banner view load generation %lu. Entering 'complete' state", buf, 0xCu);
    }
    if (-[NSMutableDictionary count](self->_loadCompletionBlocks, "count"))
    {
      PXAssertGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1A6789000, v17, OS_LOG_TYPE_FAULT, "There are abandoned banner view load completion blocks", buf, 2u);
      }

    }
    self->_loadState = 2;
  }
  else if (v16)
  {
    *(_DWORD *)buf = 134217984;
    v30 = a3;
    _os_log_impl(&dword_1A6789000, log, OS_LOG_TYPE_DEFAULT, "Completed non-final banner view load generation %lu", buf, 0xCu);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i) + 16))();
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v20);
  }

}

- (void)_invalidateLoad
{
  NSObject *log;
  unint64_t loadGeneration;
  void *v6;
  uint8_t buf[4];
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridPeopleBannerProvider.m"), 244, CFSTR("%s must be called on the main thread"), "-[PXPhotosGridPeopleBannerProvider _invalidateLoad]");

  }
  if (self->_loadState == 1)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      loadGeneration = self->_loadGeneration;
      *(_DWORD *)buf = 134217984;
      v8 = loadGeneration;
      _os_log_impl(&dword_1A6789000, log, OS_LOG_TYPE_DEFAULT, "Banner view load generation %lu invalidated while in progress", buf, 0xCu);
    }
    ++self->_loadGeneration;
  }
  self->_loadState = 0;
}

- (void)_dismissBannerAfterDelay
{
  NSObject *log;
  NSObject *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v4 = log;
    -[PXPhotosGridPeopleBannerProvider person](self, "person");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Waiting for person name/contact change for person %{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v7 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PXPhotosGridPeopleBannerProvider__dismissBannerAfterDelay__block_invoke;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)_handleDismissAfterDelay
{
  NSObject *log;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_dismissed)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v4 = log;
      -[PXPhotosGridPeopleBannerProvider person](self, "person");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Did not receive naming change in time for person %{public}@", (uint8_t *)&v7, 0xCu);

    }
    -[PXPhotosGridPeopleBannerProvider _dismissBanner](self, "_dismissBanner");
  }
}

- (void)_dismissBanner
{
  -[PXPhotosGridPeopleBannerProvider _dismissBannerNotifyDelegate:](self, "_dismissBannerNotifyDelegate:", 1);
}

- (void)_dismissBannerNotifyDelegate:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  self->_dismissed = 1;
  self->_currentBannerType = 0;
  -[PXPhotosGridPeopleBannerProvider _setSuggestionBannerView:addNameBannerView:](self, "_setSuggestionBannerView:addNameBannerView:", 0, 0);
  -[PXPhotosGridPeopleBannerProvider _invalidateLoad](self, "_invalidateLoad");
  if (v3)
  {
    -[PXPhotosGridPeopleBannerProvider invalidationDelegate](self, "invalidationDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photosBannerProviderInvalidateLoadedBanner:", self);

  }
}

- (void)_workQueue_loadBannerIfNeededHasDismissedSuggestion:(BOOL)a3 completion:(id)a4
{
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  NSObject *log;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  PXPeopleSuggestionDataSource *v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  __CFString *v42;
  PXPeopleSuggestionDataSource *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  id *v55;
  NSObject *v56;
  _QWORD *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  _QWORD v64[5];
  id v65;
  _QWORD block[5];
  id v67;
  _QWORD v68[5];
  __CFString *v69;
  id v70;
  id v71;
  _QWORD v72[5];
  id v73;
  id v74;
  _QWORD v75[5];
  PXPeopleSuggestionDataSource *v76;
  id v77;
  uint64_t aBlock;
  uint64_t v79;
  void (*v80)(uint64_t, void *, uint64_t);
  void *v81;
  PXPhotosGridPeopleBannerProvider *v82;
  id v83;
  uint64_t v84;
  uint8_t buf[4];
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v62 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[PXPhotosGridPeopleBannerProvider person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXPhotosGridPeopleBannerProvider namingSuggestionsOnly](self, "namingSuggestionsOnly");
  v8 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "alwaysShowBanner");

  v63 = v6;
  if (v10 && !a3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, log, OS_LOG_TYPE_DEFAULT, "Will show suggestion banner from test setting", buf, 2u);
    }
    +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "debugBannerStyle");

    switch(v13)
    {
      case 0:
        v14 = 1;
        v15 = -[PXPeopleSuggestionDataSource initWithFlowType:]([PXPeopleSuggestionDataSource alloc], "initWithFlowType:", 1);
        v16 = -[PXPeopleSuggestionDataSource fetchAndCacheMergeCandidatesForPerson:](v15, "fetchAndCacheMergeCandidatesForPerson:", v63);
        v17 = 0;
        v18 = 0;
        break;
      case 1:
        +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "debugContactIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = 0;
        v15 = 0;
        v14 = 2;
        break;
      case 2:
        v18 = 0;
        v15 = 0;
        v14 = 3;
        v17 = CFSTR("Johnny Appleseed");
        break;
      case 3:
        v17 = 0;
        v18 = 0;
        v15 = 0;
        if (v8)
          v14 = 4;
        else
          v14 = 0;
        break;
      default:
        v14 = 0;
        v17 = 0;
        v18 = 0;
        v15 = 0;
        break;
    }
    +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v25, "debugBannerAttribution");
    switch(v31)
    {
      case 1:
      case 2:
      case 3:
      case 4:
        break;
      default:
        v31 = 0;
        break;
    }
    v24 = 0;
LABEL_57:

    v54 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v79 = 3221225472;
    v80 = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke;
    v81 = &unk_1E51383E8;
    v82 = self;
    v84 = v31;
    v22 = v62;
    v83 = v62;
    v23 = _Block_copy(&aBlock);
    switch(v14)
    {
      case 0:
        goto LABEL_58;
      case 1:
        v75[0] = v54;
        v75[1] = 3221225472;
        v75[2] = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_2;
        v75[3] = &unk_1E5145688;
        v75[4] = self;
        v55 = (id *)&v76;
        v15 = v15;
        v76 = v15;
        v23 = v23;
        v77 = v23;
        dispatch_async(MEMORY[0x1E0C80D38], v75);
        v58 = v77;
        goto LABEL_64;
      case 2:
        v72[0] = v54;
        v72[1] = 3221225472;
        v72[2] = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_3;
        v72[3] = &unk_1E5138410;
        v72[4] = self;
        v55 = &v73;
        v24 = v24;
        v73 = v24;
        v23 = v23;
        v74 = v23;
        -[PXPhotosGridPeopleBannerProvider _workQueue_loadContactSuggestionBannerForContactIdentifier:suggestion:withCompletion:](self, "_workQueue_loadContactSuggestionBannerForContactIdentifier:suggestion:withCompletion:", v18, v24, v72);
        v58 = v74;
        goto LABEL_64;
      case 3:
        v68[0] = v54;
        v68[1] = 3221225472;
        v68[2] = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_4;
        v68[3] = &unk_1E5148370;
        v68[4] = self;
        v55 = (id *)&v69;
        v17 = v17;
        v69 = v17;
        v24 = v24;
        v70 = v24;
        v23 = v23;
        v71 = v23;
        dispatch_async(MEMORY[0x1E0C80D38], v68);

        v58 = v70;
LABEL_64:

        goto LABEL_65;
      case 4:
        goto LABEL_59;
      default:
        goto LABEL_66;
    }
  }
  if (!a3)
  {
    -[PXPhotosGridPeopleBannerProvider _fetchAutonamingSuggestion](self, "_fetchAutonamingSuggestion");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contactIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "nameComponents");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "nameString");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_localizedName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length");
    v29 = v28 != 0;

    if (v25)
    {
      v30 = v25;
      v31 = _AttributionForSuggestion(v24);
      v32 = self->_log;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        objc_msgSend(v6, "localIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v86 = v34;
        _os_log_impl(&dword_1A6789000, v33, OS_LOG_TYPE_DEFAULT, "Will show contact suggestion for person %{public}@", buf, 0xCu);

      }
      v17 = 0;
      v15 = 0;
      v14 = 2;
LABEL_56:

      v18 = v25;
      goto LABEL_57;
    }
    if (v26)
    {
      if (v28)
        goto LABEL_30;
      objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v26, 2, 0);
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v61, "length") || v28)
      {
LABEL_30:
        if (v7)
        {
          v39 = self->_log;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = v39;
            objc_msgSend(v6, "localIdentifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v86 = v41;
            _os_log_impl(&dword_1A6789000, v40, OS_LOG_TYPE_DEFAULT, "Review photos prompt is suppressed for person %{public}@", buf, 0xCu);

          }
          v14 = 0;
          v31 = 0;
          v17 = 0;
          v15 = 0;
        }
        else
        {
          if (+[PXPeopleUtilities shouldShowBootstrapForPerson:](PXPeopleUtilities, "shouldShowBootstrapForPerson:", v6))
          {
            v43 = -[PXPeopleSuggestionDataSource initWithFlowType:]([PXPeopleSuggestionDataSource alloc], "initWithFlowType:", 1);
            -[PXPeopleSuggestionDataSource fetchAndCacheMergeCandidatesForPerson:](v43, "fetchAndCacheMergeCandidatesForPerson:", v6);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(MEMORY[0x1E0CD16F8], "shouldDisplayMergeCandidates:forPerson:", v44, v6))
            {
              v60 = v44;
              v15 = v43;
              v45 = self->_log;
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                v46 = v45;
                objc_msgSend(v6, "localIdentifier");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v86 = v47;
                _os_log_impl(&dword_1A6789000, v46, OS_LOG_TYPE_DEFAULT, "Will show review photos prompt for person %{public}@", buf, 0xCu);

                v14 = 1;
                v29 = 1;
              }
              else
              {
                v29 = 1;
                v14 = 1;
              }
              v44 = v60;
            }
            else
            {
              v14 = 0;
              v15 = 0;
            }

          }
          else
          {
            v14 = 0;
            v15 = 0;
          }
          v31 = 0;
          if (v29 || !v8)
          {
            v17 = 0;
          }
          else
          {
            v51 = self->_log;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              v52 = v51;
              objc_msgSend(v63, "localIdentifier");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v86 = v53;
              _os_log_impl(&dword_1A6789000, v52, OS_LOG_TYPE_DEFAULT, "Will show add name banner for person %{public}@", buf, 0xCu);

            }
            v31 = 0;
            v17 = 0;
            v14 = 4;
          }
        }
        goto LABEL_56;
      }
      v42 = v61;
    }
    v17 = v42;
    v31 = _AttributionForSuggestion(v24);
    v48 = self->_log;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = v48;
      objc_msgSend(v6, "localIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v86 = v50;
      _os_log_impl(&dword_1A6789000, v49, OS_LOG_TYPE_DEFAULT, "Will show name suggestion for person %{public}@", buf, 0xCu);

    }
    v15 = 0;
    v14 = 3;
    goto LABEL_56;
  }
  objc_msgSend(v6, "px_localizedName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  v21 = !v8;
  if (v20)
    v21 = 1;
  if ((v21 | v7) == 1)
  {
    aBlock = MEMORY[0x1E0C809B0];
    v79 = 3221225472;
    v80 = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke;
    v81 = &unk_1E51383E8;
    v82 = self;
    v84 = 0;
    v22 = v62;
    v83 = v62;
    v23 = _Block_copy(&aBlock);
    v15 = 0;
    v18 = 0;
    v17 = 0;
    v24 = 0;
LABEL_58:
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_6;
    v64[3] = &unk_1E5148CE0;
    v64[4] = self;
    v55 = &v65;
    v23 = v23;
    v65 = v23;
    v56 = MEMORY[0x1E0C80D38];
    v57 = v64;
  }
  else
  {
    v35 = self->_log;
    v22 = v62;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      objc_msgSend(v6, "localIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v86 = v37;
      _os_log_impl(&dword_1A6789000, v36, OS_LOG_TYPE_DEFAULT, "Will show add name banner for person %{public}@", buf, 0xCu);

    }
    aBlock = MEMORY[0x1E0C809B0];
    v79 = 3221225472;
    v80 = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke;
    v81 = &unk_1E51383E8;
    v82 = self;
    v84 = 0;
    v83 = v62;
    v23 = _Block_copy(&aBlock);
    v15 = 0;
    v18 = 0;
    v17 = 0;
    v24 = 0;
LABEL_59:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_5;
    block[3] = &unk_1E5148CE0;
    block[4] = self;
    v55 = &v67;
    v23 = v23;
    v67 = v23;
    v56 = MEMORY[0x1E0C80D38];
    v57 = block;
  }
  dispatch_async(v56, v57);
LABEL_65:

LABEL_66:
  if (v24)
  {
    -[PXPhotosGridPeopleBannerProvider _analyticsBannerEventPayloadForSuggestion:eventType:](self, "_analyticsBannerEventPayloadForSuggestion:eventType:", v24, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.people.autonaming"), v59);

  }
}

- (BOOL)_isAllowedSuggestion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *log;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  uint8_t v12[16];

  v4 = a3;
  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreAttributionFiltering");

  if (v6)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A6789000, log, OS_LOG_TYPE_DEFAULT, "Skipping attribution filtering", v12, 2u);
    }
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "suggestionSource") != 1)
  {
LABEL_11:
    v10 = 1;
    goto LABEL_12;
  }
  v8 = objc_msgSend(v4, "attribution");
  if (v8)
    v9 = v8 == 3;
  else
    v9 = 1;
  v10 = !v9;
LABEL_12:

  return v10;
}

- (id)_fetchAutonamingSuggestion
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *log;
  NSObject *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[PXPhotosGridPeopleBannerProvider person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personUri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v7 = log;
      objc_msgSend(v3, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v8;
      v9 = "Person (%{public}@) already has associated contact, will not request suggestions";
LABEL_28:
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);

      goto LABEL_29;
    }
    goto LABEL_29;
  }
  objc_msgSend(v3, "contactMatchingDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    objc_msgSend(v3, "px_localizedName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      v15 = self->_log;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v15;
        objc_msgSend(v3, "localIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v8;
        v9 = "Person (%{public}@) already has a non-empty name, will not request suggestions";
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    if (!+[PXPeopleUtilities canShowSuggestionForPerson:](PXPeopleUtilities, "canShowSuggestionForPerson:", v3))
    {
      v39 = self->_log;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v39;
        objc_msgSend(v3, "localIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v8;
        v9 = "User has ignored a suggestion for person (%{public}@) too recently. Will not request suggestions";
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    objc_msgSend(v3, "fetchPropertySetsIfNeeded");
    objc_msgSend(v3, "userFeedbackProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "autonamingUserFeedbacks");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v19, "ignoreNegativeSuggestionFeedback");

    if ((v17 & 1) == 0)
    {
      if (v18)
      {
        if (objc_msgSend(v18, "type") == 3)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lastModifiedDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timeIntervalSinceDate:", v21);
          v23 = v22;

          +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "negativeFeedbackWaitPeriodMinutes");

          if (v23 < (double)v25 * 60.0)
          {
            v44 = self->_log;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              v45 = v44;
              objc_msgSend(v3, "localIdentifier");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v49 = v46;
              _os_log_impl(&dword_1A6789000, v45, OS_LOG_TYPE_DEFAULT, "Skipping autonaming suggestions for person (%{public}@) because a suggestion was rejected too recently", buf, 0xCu);

            }
            v33 = 0;
            goto LABEL_42;
          }
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLForKey:", CFSTR("PXPeopleMePrompted"));

    v28 = self->_log;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      objc_msgSend(v3, "localIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("NO");
      if (v27)
        v31 = CFSTR("YES");
      v32 = v31;
      *(_DWORD *)buf = 138543618;
      v49 = v30;
      v50 = 2112;
      v51 = v32;
      _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_DEFAULT, "Will fetch autonaming suggestions for person %{public}@. hasPromptedForMe: %@", buf, 0x16u);

    }
    v47 = 0;
    objc_msgSend(MEMORY[0x1E0D77EC0], "fetchAutonamingSuggestionForPerson:checkIsMe:withError:", v3, v27 ^ 1u, &v47);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v34 = (__CFString *)v47;
    if (v33)
    {
      v35 = self->_log;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = v35;
        objc_msgSend(v3, "localIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v37;
        v50 = 2112;
        v51 = v33;
        _os_log_impl(&dword_1A6789000, v36, OS_LOG_TYPE_DEFAULT, "Successfully fetched autonaming suggestion for person %{public}@: %@", buf, 0x16u);

      }
      if (-[PXPhotosGridPeopleBannerProvider _isAllowedSuggestion:](self, "_isAllowedSuggestion:", v33))
        goto LABEL_41;
      v38 = self->_log;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v38, OS_LOG_TYPE_DEFAULT, "Allow-list filtered autonaming suggestion based on attribution", buf, 2u);
      }

LABEL_40:
      v33 = 0;
LABEL_41:

LABEL_42:
      goto LABEL_30;
    }
    v41 = self->_log;
    if (v34)
    {
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      v42 = v41;
      objc_msgSend(v3, "localIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v43;
      v50 = 2112;
      v51 = v34;
      _os_log_error_impl(&dword_1A6789000, v42, OS_LOG_TYPE_ERROR, "Failed to get autonaming suggestions for person %{public}@ with error %@", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        goto LABEL_40;
      v42 = v41;
      objc_msgSend(v3, "localIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v43;
      _os_log_impl(&dword_1A6789000, v42, OS_LOG_TYPE_DEFAULT, "No autonaming suggestions for person %{public}@", buf, 0xCu);
    }

    goto LABEL_40;
  }
  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v12;
    objc_msgSend(v3, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v49 = v8;
    v9 = "Person (%{public}@) has a non-empty contact matching dictionary, will not request suggestions";
    goto LABEL_28;
  }
LABEL_29:
  v33 = 0;
LABEL_30:

  return v33;
}

- (void)_persistNegativeUserFeedback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  -[PXPhotosGridPeopleBannerProvider person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchPropertySetsIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "userFeedbackProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "autonamingUserFeedbacks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v9);

  }
  objc_msgSend(v5, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__PXPhotosGridPeopleBannerProvider__persistNegativeUserFeedback___block_invoke;
  v16[3] = &unk_1E5148D08;
  v17 = v5;
  v18 = v6;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __65__PXPhotosGridPeopleBannerProvider__persistNegativeUserFeedback___block_invoke_2;
  v14[3] = &unk_1E5147B40;
  v14[4] = self;
  v15 = v17;
  v12 = v17;
  v13 = v6;
  objc_msgSend(v10, "performChanges:completionHandler:", v16, v14);

}

- (id)_loadReviewFacesBannerForDataSource:(id)a3
{
  id v5;
  PXPeopleCandidateBannerView *v6;
  void *v7;

  v5 = a3;
  objc_storeStrong((id *)&self->_reviewFacesDataSource, a3);
  if (v5)
  {
    v6 = -[PXPeopleCandidateBannerView initWithStyle:]([PXPeopleCandidateBannerView alloc], "initWithStyle:", 0);
    -[PXPhotosGridPeopleBannerProvider person](self, "person");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCandidateBannerView setPerson:](v6, "setPerson:", v7);

    -[PXPeopleCandidateBannerView setDelegate:](v6, "setDelegate:", self);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_suggestionsDidFinish:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

- (void)_runReviewFacesFlow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *log;
  uint8_t buf[16];

  -[PXPhotosGridPeopleBannerProvider person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v3, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPrefetchedDataSource:", self->_reviewFacesDataSource);
  objc_msgSend(v4, "setWantsNaming:", 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/GridZero/SectionHeaders/KeyAssetSectionHeader/PXPhotosGridPeopleBannerProvider.m"), "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v7, v8, "-[PXPhotosGridPeopleBannerProvider _runReviewFacesFlow]", 597);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallerInfo:", v9);

  +[PXPeopleUtilities bootstrapViewControllerForContext:delegate:](PXPeopleUtilities, "bootstrapViewControllerForContext:delegate:", v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PXPhotosGridPeopleBannerProvider presentationDelegate](self, "presentationDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentationEnvironmentForPhotosBannerProvider:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "presentViewController:animated:completionHandler:", v10, 1, 0);
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, log, OS_LOG_TYPE_ERROR, "Unable to present bootstrap for review faces flow. Missing presentation environment", buf, 2u);
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.bootstrap.inlineControl.review"), MEMORY[0x1E0C9AA70]);

}

- (id)_loadAddNameBannerView
{
  void *v2;
  uint64_t v3;

  -[PXPhotosGridPeopleBannerProvider person](self, "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "px_isHuman") ^ 1;

  return -[PXPhotosGridUnnamedPersonBannerView initWithType:]([PXPhotosGridUnnamedPersonBannerView alloc], "initWithType:", v3);
}

- (void)_workQueue_loadContactSuggestionBannerForContactIdentifier:(id)a3 suggestion:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  char v26;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0C96890];
    v33[0] = v11;
    v33[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v13);
    v15 = (void *)MEMORY[0x1E0C97200];
    v32 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateForContactsWithIdentifiers:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v17);

    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__221984;
    v28[4] = __Block_byref_object_dispose__221985;
    v29 = 0;
    +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __121__PXPhotosGridPeopleBannerProvider__workQueue_loadContactSuggestionBannerForContactIdentifier_suggestion_withCompletion___block_invoke_205;
    v27[3] = &unk_1E5138440;
    v27[4] = v28;
    objc_msgSend(v18, "enumerateContactsWithFetchRequest:error:usingBlock:", v14, 0, v27);
    if (v9)
    {
      v20 = objc_msgSend(v9, "suggestionSource");
      if (!v20)
      {
        v21 = objc_msgSend(v9, "isMe");
        goto LABEL_9;
      }
      if (v20 != 1)
      {
        v21 = 0;
        goto LABEL_9;
      }
    }
    v21 = -[PXPhotosGridPeopleBannerProvider _workQueue_isMeContactWithIdentifier:](self, "_workQueue_isMeContactWithIdentifier:", v8);
LABEL_9:
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __121__PXPhotosGridPeopleBannerProvider__workQueue_loadContactSuggestionBannerForContactIdentifier_suggestion_withCompletion___block_invoke_2;
    v23[3] = &unk_1E5138468;
    v24 = v10;
    v25 = v28;
    v26 = v21;
    v23[4] = self;
    v22 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v23);

    _Block_object_dispose(v28, 8);
    goto LABEL_10;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__PXPhotosGridPeopleBannerProvider__workQueue_loadContactSuggestionBannerForContactIdentifier_suggestion_withCompletion___block_invoke;
  block[3] = &unk_1E5148A40;
  v31 = v10;
  v13 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v14 = v31;
LABEL_10:

}

- (BOOL)_workQueue_isMeContactWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  NSObject *log;
  id v13;
  uint8_t buf[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = *MEMORY[0x1E0C966E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (v7)
  {
    objc_msgSend(v7, "identifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v4)
      v10 = 1;
    else
      v10 = objc_msgSend(v4, "isEqualToString:", v9);

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_error_impl(&dword_1A6789000, log, OS_LOG_TYPE_ERROR, "Unable to fetch 'me' contact with error %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (id)_loadContactSuggestionBannerForContact:(id)a3 isMe:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  PXPeopleCandidateBannerView *v8;
  NSObject *log;
  uint8_t v11[16];

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    if (v4)
      v7 = 3;
    else
      v7 = 1;
    v8 = -[PXPeopleCandidateBannerView initWithStyle:]([PXPeopleCandidateBannerView alloc], "initWithStyle:", v7);
    -[PXPeopleCandidateBannerView setContactSuggestion:](v8, "setContactSuggestion:", v6);
    -[PXPeopleCandidateBannerView setDelegate:](v8, "setDelegate:", self);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1A6789000, log, OS_LOG_TYPE_ERROR, "Unable to fetch contact for expected contact suggestion banner", v11, 2u);
    }
    v8 = 0;
  }

  return v8;
}

- (void)_applySuggestedContactForBanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PNPersonSuggestion *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *log;
  _QWORD v12[5];
  uint8_t buf[16];

  v4 = a3;
  -[PXPhotosGridPeopleBannerProvider person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_currentSuggestion;
  -[PXPhotosGridPeopleBannerProvider _dismissBannerAfterDelay](self, "_dismissBannerAfterDelay");
  if (v5 && v6)
  {
    objc_msgSend(v5, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__PXPhotosGridPeopleBannerProvider__applySuggestedContactForBanner___block_invoke;
    v12[3] = &unk_1E5148B78;
    v12[4] = self;
    +[PXPeopleBootstrap nameAndVerifyPerson:toContact:photoLibrary:completionHandler:](PXPeopleBootstrap, "nameAndVerifyPerson:toContact:photoLibrary:completionHandler:", v5, v6, v8, v12);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D77EC0], "logUserFeedback:forSuggestion:", 0, v7);
      if (!-[PNPersonSuggestion suggestionSource](v7, "suggestionSource") && objc_msgSend(v4, "style") == 3)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBool:forKey:", 1, CFSTR("PXPeopleMePrompted"));

        objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.me.confirmed"), MEMORY[0x1E0C9AA70]);
      }
      -[PXPhotosGridPeopleBannerProvider _analyticsBannerEventPayloadForSuggestion:eventType:](self, "_analyticsBannerEventPayloadForSuggestion:eventType:", v7, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.people.autonaming"), v10);

    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, log, OS_LOG_TYPE_ERROR, "Attempted to apply a contact suggestion to a person when one is missing", buf, 2u);
    }
  }

}

- (id)_loadNameSuggestionBannerForName:(id)a3
{
  id v4;
  PXPeopleCandidateBannerView *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = -[PXPeopleCandidateBannerView initWithStyle:]([PXPeopleCandidateBannerView alloc], "initWithStyle:", 2);
    -[PXPeopleCandidateBannerView setNameSuggestion:](v5, "setNameSuggestion:", v4);
    -[PXPeopleCandidateBannerView setDelegate:](v5, "setDelegate:", self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_applySuggestedNameForBanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PNPersonSuggestion *v7;
  void *v8;
  void *v9;
  NSObject *log;
  _QWORD v11[5];
  uint8_t buf[16];

  v4 = a3;
  -[PXPhotosGridPeopleBannerProvider person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nameSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_currentSuggestion;
  -[PXPhotosGridPeopleBannerProvider _dismissBannerAfterDelay](self, "_dismissBannerAfterDelay");
  if (v5 && v6)
  {
    objc_msgSend(v5, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__PXPhotosGridPeopleBannerProvider__applySuggestedNameForBanner___block_invoke;
    v11[3] = &unk_1E5148B78;
    v11[4] = self;
    +[PXPeopleBootstrap nameAndVerifyPerson:toName:photoLibrary:completionHandler:](PXPeopleBootstrap, "nameAndVerifyPerson:toName:photoLibrary:completionHandler:", v5, v6, v8, v11);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D77EC0], "logUserFeedback:forSuggestion:", 0, v7);
      -[PXPhotosGridPeopleBannerProvider _analyticsBannerEventPayloadForSuggestion:eventType:](self, "_analyticsBannerEventPayloadForSuggestion:eventType:", v7, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.people.autonaming"), v9);

    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, log, OS_LOG_TYPE_ERROR, "Attempted to apply a name suggestion to a person when one is missing", buf, 2u);
    }
  }

}

- (id)_analyticsBannerEventPayloadForSuggestion:(id)a3 eventType:(int64_t)a4
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = CFSTR("contact");
  }
  else
  {
    objc_msgSend(v5, "nameComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v7 = CFSTR("nameComponents");
    }
    else
    {
      objc_msgSend(v5, "nameString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = CFSTR("nameString");
      if (!v9)
        v7 = CFSTR("unknown");
    }
  }
  v20[0] = CFSTR("eventType");
  if ((unint64_t)a4 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_AnalyticsNameForEventType(PXPhotosGridPeopleBannerEventType)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = v16;
    v19 = 768;
    goto LABEL_17;
  }
  v21[0] = off_1E5138488[a4];
  v21[1] = v7;
  v20[1] = CFSTR("suggestionType");
  v20[2] = CFSTR("source");
  v10 = objc_msgSend(v5, "suggestionSource");
  if (v10)
  {
    if (v10 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_AnalyticsNameForSuggestionSource(PNPersonSuggestionSource)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15;
      v18 = v16;
      v19 = 778;
LABEL_17:
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXPhotosGridPeopleBannerProvider.m"), v19, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v11 = CFSTR("intelligencePlatform");
  }
  else
  {
    v11 = CFSTR("photosIntelligence");
  }
  v21[2] = v11;
  v20[3] = CFSTR("attribution");
  v12 = objc_msgSend(v5, "attribution");
  if (v12 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_AnalyticsNameForSuggestionAttribution(PNPersonSuggestionAttribution)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = v16;
    v19 = 794;
    goto LABEL_17;
  }
  v21[3] = off_1E51384A0[v12];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)bannerViewDidSelectPrimaryAction:(id)a3
{
  id v4;
  NSObject *log;
  int64_t currentBannerType;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int64_t v11;
  int v12;
  int64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    currentBannerType = self->_currentBannerType;
    v7 = log;
    -[PXPhotosGridPeopleBannerProvider person](self, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218242;
    v13 = currentBannerType;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "User accepted suggestion of type %lu for person %{public}@", (uint8_t *)&v12, 0x16u);

  }
  switch(self->_currentBannerType)
  {
    case 0:
    case 4:
      PXAssertGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = self->_currentBannerType;
        v12 = 134217984;
        v13 = v11;
        _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Unexpected type for banner suggestion acceptance %lu", (uint8_t *)&v12, 0xCu);
      }

      break;
    case 1:
      -[PXPhotosGridPeopleBannerProvider _runReviewFacesFlow](self, "_runReviewFacesFlow");
      break;
    case 2:
      -[PXPhotosGridPeopleBannerProvider _applySuggestedContactForBanner:](self, "_applySuggestedContactForBanner:", v4);
      break;
    case 3:
      -[PXPhotosGridPeopleBannerProvider _applySuggestedNameForBanner:](self, "_applySuggestedNameForBanner:", v4);
      break;
    default:
      break;
  }

}

- (void)bannerViewDidSelectNotNow:(id)a3
{
  id v4;
  NSObject *log;
  int64_t currentBannerType;
  NSObject *v7;
  void *v8;
  void *v9;
  PNPersonSuggestion *v10;
  int64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    currentBannerType = self->_currentBannerType;
    v7 = log;
    -[PXPhotosGridPeopleBannerProvider person](self, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 134218242;
    v29 = currentBannerType;
    v30 = 2114;
    v31 = v9;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "User rejected suggestion of type %lu for person %{public}@", (uint8_t *)&v28, 0x16u);

  }
  v10 = self->_currentSuggestion;
  v11 = self->_currentBannerType;
  -[PXPhotosGridPeopleBannerProvider _dismissBanner](self, "_dismissBanner");
  switch(v11)
  {
    case 0:
    case 4:
      PXAssertGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v28 = 134217984;
        v29 = v11;
        _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Reject button pressed for unexpected banner type %lu", (uint8_t *)&v28, 0xCu);
      }

      break;
    case 1:
      -[PXPhotosGridPeopleBannerProvider person](self, "person");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPeopleUtilities temporarilySuppressBootstrapOrSuggestionForPerson:](PXPeopleUtilities, "temporarilySuppressBootstrapOrSuggestionForPerson:", v13);

      objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.bootstrap.inlineControl.dismiss"), MEMORY[0x1E0C9AA70]);
      break;
    case 2:
      v14 = (void *)MEMORY[0x1E0CD17F0];
      -[PXPhotosGridPeopleBannerProvider person](self, "person");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contactSuggestion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "negativeAutonamingUserFeedbackForPerson:rejectedContactIdentifier:", v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXPhotosGridPeopleBannerProvider _persistNegativeUserFeedback:](self, "_persistNegativeUserFeedback:", v18);
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0D77EC0], "logUserFeedback:forSuggestion:", 1, v10);
        if (!-[PNPersonSuggestion suggestionSource](v10, "suggestionSource") && objc_msgSend(v4, "style") == 3)
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setBool:forKey:", 1, CFSTR("PXPeopleMePrompted"));

          objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.me.confirmed"), MEMORY[0x1E0C9AA70]);
        }
        -[PXPhotosGridPeopleBannerProvider _analyticsBannerEventPayloadForSuggestion:eventType:](self, "_analyticsBannerEventPayloadForSuggestion:eventType:", v10, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.people.autonaming"), v20);

      }
      goto LABEL_19;
    case 3:
      -[PNPersonSuggestion autonamingFeedbackStandardNameRepresentation](v10, "autonamingFeedbackStandardNameRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        objc_msgSend(v4, "nameSuggestion");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v18 = v23;

      v24 = (void *)MEMORY[0x1E0CD17F0];
      -[PXPhotosGridPeopleBannerProvider person](self, "person");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "negativeAutonamingUserFeedbackForPerson:rejectedName:", v25, v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXPhotosGridPeopleBannerProvider _persistNegativeUserFeedback:](self, "_persistNegativeUserFeedback:", v26);
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0D77EC0], "logUserFeedback:forSuggestion:", 1, v10);
        -[PXPhotosGridPeopleBannerProvider _analyticsBannerEventPayloadForSuggestion:eventType:](self, "_analyticsBannerEventPayloadForSuggestion:eventType:", v10, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.people.autonaming"), v27);

      }
LABEL_19:

      break;
    default:
      break;
  }

}

- (void)didTapUnnamedPersonBanner:(id)a3
{
  void *v4;
  NSObject *log;
  NSObject *v6;
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
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PXPhotosGridPeopleBannerProvider person](self, "person", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = log;
    -[PXPhotosGridPeopleBannerProvider person](self, "person");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v8;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Presenting name bootstrap for person %{public}@", buf, 0xCu);

  }
  +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/GridZero/SectionHeaders/KeyAssetSectionHeader/PXPhotosGridPeopleBannerProvider.m"), "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v12, v13, "-[PXPhotosGridPeopleBannerProvider didTapUnnamedPersonBanner:]", 886);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCallerInfo:", v14);

  +[PXPeopleUtilities bootstrapViewControllerForContext:delegate:](PXPeopleUtilities, "bootstrapViewControllerForContext:delegate:", v9, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridPeopleBannerProvider presentationDelegate](self, "presentationDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentationEnvironmentForPhotosBannerProvider:", self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "presentViewController:animated:completionHandler:", v15, 1, 0);
}

- (PXPhotosBannerInvalidationDelegate)invalidationDelegate
{
  return (PXPhotosBannerInvalidationDelegate *)objc_loadWeakRetained((id *)&self->_invalidationDelegate);
}

- (void)setInvalidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_invalidationDelegate, a3);
}

- (PXPhotosBannerPresentationDelegate)presentationDelegate
{
  return (PXPhotosBannerPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (PHPerson)person
{
  return self->_person;
}

- (BOOL)namingSuggestionsOnly
{
  return self->_namingSuggestionsOnly;
}

- (BOOL)isDismissed
{
  return self->_dismissed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_destroyWeak((id *)&self->_invalidationDelegate);
  objc_storeStrong((id *)&self->_loadCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_reviewFacesDataSource, 0);
  objc_storeStrong((id *)&self->_loadedAddNameBannerView, 0);
  objc_storeStrong((id *)&self->_loadedSuggestionBannerView, 0);
}

void __65__PXPhotosGridPeopleBannerProvider__applySuggestedNameForBanner___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed to assign name to person with error %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

void __68__PXPhotosGridPeopleBannerProvider__applySuggestedContactForBanner___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed to assign contact to person with error %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

uint64_t __121__PXPhotosGridPeopleBannerProvider__workQueue_loadContactSuggestionBannerForContactIdentifier_suggestion_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __121__PXPhotosGridPeopleBannerProvider__workQueue_loadContactSuggestionBannerForContactIdentifier_suggestion_withCompletion___block_invoke_205(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __121__PXPhotosGridPeopleBannerProvider__workQueue_loadContactSuggestionBannerForContactIdentifier_suggestion_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadContactSuggestionBannerForContact:isMe:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __58__PXPhotosGridPeopleBannerProvider__suggestionsDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  id v19;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "object");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 32);
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "px_descriptionForAssertionMessage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v15, v16, CFSTR("PXPhotosGridPeopleBannerProvider.m"), 582, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("notification.object"), v14, v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("PXPhotosGridPeopleBannerProvider.m"), 582, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("notification.object"), v14);
    }

LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "person");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sourcePerson");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "targetPerson");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {

    }
    else
    {
      objc_msgSend(v4, "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if (!v9)
      {
LABEL_9:

        return;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_dismissBanner");
    goto LABEL_9;
  }
}

void __65__PXPhotosGridPeopleBannerProvider__persistNegativeUserFeedback___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAutonamingUserFeedbacks:", *(_QWORD *)(a1 + 40));

}

void __65__PXPhotosGridPeopleBannerProvider__persistNegativeUserFeedback___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  if (!a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v10 = *(void **)(a1 + 40);
    v8 = v6;
    objc_msgSend(v10, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Failed to persist negative autonaming feedback for person %{public}@ with error %@", (uint8_t *)&v11, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 40);
    v8 = v6;
    objc_msgSend(v7, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Persisted negative autonaming feedback for person %{public}@", (uint8_t *)&v11, 0xCu);
LABEL_4:

  }
LABEL_6:

}

void __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_setSuggestionBannerView:addNameBannerView:", v6, a3);
  objc_msgSend(v6, "setAttribution:", *(_QWORD *)(a1 + 48));

  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "loadedBannerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

}

void __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadReviewFacesBannerForDataSource:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v4 != 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 2 * (a2 != 0);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v5;
  v7 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_loadNameSuggestionBannerForName:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = 3;
  if (!v3)
    v2 = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 4;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_loadAddNameBannerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60__PXPhotosGridPeopleBannerProvider__dismissBannerAfterDelay__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDismissAfterDelay");

}

void __51__PXPhotosGridPeopleBannerProvider_loadBannerView___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5[2];

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PXPhotosGridPeopleBannerProvider_loadBannerView___block_invoke_2;
  v4[3] = &unk_1E5140EA8;
  objc_copyWeak(v5, (id *)(a1 + 40));
  v5[1] = *(id *)(a1 + 48);
  objc_msgSend(v2, "_workQueue_loadBannerIfNeededHasDismissedSuggestion:completion:", v3, v4);
  objc_destroyWeak(v5);
}

void __51__PXPhotosGridPeopleBannerProvider_loadBannerView___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_finishLoadWithGeneration:bannerView:", *(_QWORD *)(a1 + 40), v4);

}

@end
