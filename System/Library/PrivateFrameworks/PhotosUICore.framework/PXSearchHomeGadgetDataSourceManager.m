@implementation PXSearchHomeGadgetDataSourceManager

- (void)setZeroKeywordSectionsUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (PXSearchHomeGadgetDataSourceManager)init
{
  PXSearchHomeGadgetDataSourceManager *v2;
  PXSearchZeroKeywordDataSource *v3;
  PXSearchZeroKeywordDataSource *zeroKeywordDataSource;
  void *v5;
  _QWORD v7[4];
  PXSearchHomeGadgetDataSourceManager *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXSearchHomeGadgetDataSourceManager;
  v2 = -[PXGadgetDataSourceManager init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXSearchZeroKeywordDataSource);
    zeroKeywordDataSource = v2->_zeroKeywordDataSource;
    v2->_zeroKeywordDataSource = v3;

    -[PXSearchZeroKeywordDataSource setDelegate:](v2->_zeroKeywordDataSource, "setDelegate:", v2);
    +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__PXSearchHomeGadgetDataSourceManager_init__block_invoke;
    v7[3] = &unk_1E5149198;
    v8 = v2;
    objc_msgSend(v5, "scheduleDeferredTaskWithQoS:block:", 0, v7);

  }
  return v2;
}

- (id)gadgetProviders
{
  NSArray *gadgetProviders;
  NSArray *v4;
  id v5;
  id v6;
  void (**v7)(void *, _QWORD);
  void *v8;
  PXTapToRadarGadgetProvider *v9;
  NSArray *v10;
  NSArray *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  PXSearchHomeGadgetDataSourceManager *v17;
  id v18;

  gadgetProviders = self->_gadgetProviders;
  if (!gadgetProviders)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __54__PXSearchHomeGadgetDataSourceManager_gadgetProviders__block_invoke;
    v16 = &unk_1E5147A40;
    v17 = self;
    v6 = v5;
    v18 = v6;
    v7 = (void (**)(void *, _QWORD))_Block_copy(&v13);
    v7[2](v7, 0);
    v7[2](v7, 1);
    v7[2](v7, 2);
    v7[2](v7, 3);
    v7[2](v7, 4);
    objc_storeStrong((id *)&self->_zeroKeywordGadgetProviders, v5);
    -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", self->_zeroKeywordGadgetProviders, v13, v14, v15, v16, v17);
    v8 = (void *)objc_opt_new();
    -[NSArray addObject:](v4, "addObject:", v8);
    if (PFOSVariantHasInternalUI())
    {
      v9 = objc_alloc_init(PXTapToRadarGadgetProvider);
      -[PXSearchHomeGadgetDataSourceManager setTapToRadarProvider:](self, "setTapToRadarProvider:", v9);
      -[NSArray addObject:](v4, "addObject:", v9);

    }
    v10 = self->_gadgetProviders;
    self->_gadgetProviders = v4;
    v11 = v4;

    gadgetProviders = self->_gadgetProviders;
  }
  return gadgetProviders;
}

- (BOOL)_zeroKeywordDataSourceHasZeroKeywords
{
  void *v2;
  char v3;

  -[PXSearchHomeGadgetDataSourceManager zeroKeywordDataSource](self, "zeroKeywordDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasZeroKeywords");

  return v3;
}

- (id)hiddenGadgetProviders
{
  dispatch_time_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!-[PXSearchHomeGadgetDataSourceManager filteringState](self, "filteringState"))
  {
    if (-[PXSearchHomeGadgetDataSourceManager _zeroKeywordDataSourceHasZeroKeywords](self, "_zeroKeywordDataSourceHasZeroKeywords"))
    {
      -[PXSearchHomeGadgetDataSourceManager setFilteringState:](self, "setFilteringState:", 1);
      objc_initWeak(&location, self);
      v3 = dispatch_time(0, 5000000000);
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __60__PXSearchHomeGadgetDataSourceManager_hiddenGadgetProviders__block_invoke;
      v15 = &unk_1E5148D30;
      objc_copyWeak(&v16, &location);
      dispatch_after(v3, MEMORY[0x1E0C80D38], &v12);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PXSearchHomeGadgetDataSourceManager setFilteringState:](self, "setFilteringState:", 2);
    }
  }
  if (-[PXSearchHomeGadgetDataSourceManager filteringState](self, "filteringState", v12, v13, v14, v15) == 1)
  {
    -[PXSearchHomeGadgetDataSourceManager zeroKeywordDataSource](self, "zeroKeywordDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfSections");

    if (v5)
      -[PXSearchHomeGadgetDataSourceManager setFilteringState:](self, "setFilteringState:", 2);
  }
  v6 = -[PXSearchHomeGadgetDataSourceManager filteringState](self, "filteringState");
  if (v6 >= 2)
  {
    if (v6 == 2)
    {
      -[PXSearchHomeGadgetDataSourceManager tapToRadarProvider](self, "tapToRadarProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "canShowInternalUI");

      v11 = (void *)MEMORY[0x1E0C9AA60];
      if ((v10 & 1) == 0 && v8)
      {
        v18[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

      return v11;
    }
    else
    {
      return MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    -[PXSearchHomeGadgetDataSourceManager gadgetProviders](self, "gadgetProviders");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_waitForFirstDisplayTimedOut
{
  if (-[PXSearchHomeGadgetDataSourceManager filteringState](self, "filteringState") == 1)
  {
    -[PXSearchHomeGadgetDataSourceManager setFilteringState:](self, "setFilteringState:", 2);
    -[PXGadgetDataSourceManager invalidateGadgets](self, "invalidateGadgets");
  }
}

- (void)refreshData
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportZeroKeywordLoadBegan");

  -[PXSearchHomeGadgetDataSourceManager zeroKeywordDataSource](self, "zeroKeywordDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PXSearchHomeGadgetDataSourceManager_refreshData__block_invoke;
  block[3] = &unk_1E5149198;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (id)zeroKeywordSections
{
  void *v2;
  void *v3;

  -[PXSearchHomeGadgetDataSourceManager zeroKeywordDataSource](self, "zeroKeywordDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didUpdateSections:(id)a3
{
  id v5;
  PXSearchHomeGadgetDataSourceManager *v6;
  void *v7;
  NSArray *zeroKeywordGadgetProviders;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(void);
  _QWORD v13[6];
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportZeroKeywordLoadFinished");

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  zeroKeywordGadgetProviders = v6->_zeroKeywordGadgetProviders;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__PXSearchHomeGadgetDataSourceManager_didUpdateSections___block_invoke;
  v15[3] = &unk_1E5147920;
  v15[4] = &v16;
  -[NSArray enumerateObjectsUsingBlock:](zeroKeywordGadgetProviders, "enumerateObjectsUsingBlock:", v15);
  v10 = v17[3];
  if (v10 == objc_msgSend(v5, "count"))
  {
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __57__PXSearchHomeGadgetDataSourceManager_didUpdateSections___block_invoke_5;
    v13[3] = &unk_1E51479F0;
    v13[4] = v6;
    v13[5] = a2;
    objc_msgSend(v5, "enumerateIndexesUsingBlock:", v13);
  }
  else
  {
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __57__PXSearchHomeGadgetDataSourceManager_didUpdateSections___block_invoke_2;
    v14[3] = &unk_1E51479C8;
    v14[4] = v6;
    -[PXSearchHomeGadgetDataSourceManager performChanges:](v6, "performChanges:", v14);
  }
  -[PXSearchHomeGadgetDataSourceManager zeroKeywordSectionsUpdateHandler](v6, "zeroKeywordSectionsUpdateHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PXSearchHomeGadgetDataSourceManager zeroKeywordSectionsUpdateHandler](v6, "zeroKeywordSectionsUpdateHandler");
    v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();

  }
  _Block_object_dispose(&v16, 8);
  objc_sync_exit(v6);

}

- (void)ppt_prepareZeroKeywordRequest:(id)a3
{
  -[PXSearchZeroKeywordDataSource ppt_prepareZeroKeywordRequest:](self->_zeroKeywordDataSource, "ppt_prepareZeroKeywordRequest:", a3);
}

- (PXSearchZeroKeywordDataSource)zeroKeywordDataSource
{
  return self->_zeroKeywordDataSource;
}

- (NSArray)zeroKeywordGadgetProviders
{
  return self->_zeroKeywordGadgetProviders;
}

- (void)setZeroKeywordGadgetProviders:(id)a3
{
  objc_storeStrong((id *)&self->_zeroKeywordGadgetProviders, a3);
}

- (PXTapToRadarGadgetProvider)tapToRadarProvider
{
  return self->_tapToRadarProvider;
}

- (void)setTapToRadarProvider:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarProvider, a3);
}

- (int64_t)filteringState
{
  return self->_filteringState;
}

- (void)setFilteringState:(int64_t)a3
{
  self->_filteringState = a3;
}

- (id)zeroKeywordSectionsUpdateHandler
{
  return self->_zeroKeywordSectionsUpdateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_zeroKeywordSectionsUpdateHandler, 0);
  objc_storeStrong((id *)&self->_tapToRadarProvider, 0);
  objc_storeStrong((id *)&self->_zeroKeywordGadgetProviders, 0);
  objc_storeStrong((id *)&self->_zeroKeywordDataSource, 0);
  objc_storeStrong((id *)&self->_gadgetProviders, 0);
}

void __57__PXSearchHomeGadgetDataSourceManager_didUpdateSections___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "gadgets");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "count");

}

uint64_t __57__PXSearchHomeGadgetDataSourceManager_didUpdateSections___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "enumerateObjectsUsingBlock:", &__block_literal_global_295771);
}

void __57__PXSearchHomeGadgetDataSourceManager_didUpdateSections___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "objectAtIndexedSubscript:", a2);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "gadgets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        objc_msgSend(v4, "reloadData");

        goto LABEL_5;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("PXSearchHomeGadgetDataSourceManager.m"), 191, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("gadgets.firstObject"), v9, v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXSearchHomeGadgetDataSourceManager.m"), 191, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("gadgets.firstObject"), v9);
    }

    goto LABEL_4;
  }
LABEL_5:

}

uint64_t __57__PXSearchHomeGadgetDataSourceManager_didUpdateSections___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performChanges:", &__block_literal_global_12_295773);
}

void __57__PXSearchHomeGadgetDataSourceManager_didUpdateSections___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "removeAllGadgets");
  objc_msgSend(v2, "generateGadgets");

}

uint64_t __50__PXSearchHomeGadgetDataSourceManager_refreshData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchItems");
}

void __60__PXSearchHomeGadgetDataSourceManager_hiddenGadgetProviders__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_waitForFirstDisplayTimedOut");

}

void __54__PXSearchHomeGadgetDataSourceManager_gadgetProviders__block_invoke(uint64_t a1, uint64_t a2)
{
  PXSearchZeroKeywordGadgetProvider *v3;

  v3 = -[PXSearchZeroKeywordGadgetProvider initWithZeroKeywordDataSource:sectionType:]([PXSearchZeroKeywordGadgetProvider alloc], "initWithZeroKeywordDataSource:sectionType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

uint64_t __43__PXSearchHomeGadgetDataSourceManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshData");
}

@end
