@implementation PXInboxGadgetProvider

- (PXInboxGadgetProvider)initWithDataSourceManager:(id)a3
{
  id v5;
  PXInboxGadgetProvider *v6;
  PXInboxGadgetProvider *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXInboxGadgetProvider;
  v6 = -[PXGadgetProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](v7->_dataSourceManager, "registerChangeObserver:context:", v7, PXDataSourceManagerObservationContext_233423);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__lastExitedForYouDateDidChange_, CFSTR("PXForYouLastExitedDateChangeNotification"), 0);

  }
  return v7;
}

- (unint64_t)estimatedNumberOfGadgets
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  double v8;
  unint64_t v9;

  -[PXInboxGadgetProvider dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  v8 = 3.0;
  if (IsAccessibilityCategory)
    v8 = 1.0;
  v9 = vcvtpd_u64_f64((double)v4 / v8);
  if (v9 >= 7)
    return 7;
  else
    return v9;
}

- (void)loadDataForGadgets
{
  +[PXInboxViewController preloadResources](PXInboxViewController, "preloadResources");
}

- (void)_updateGadgets
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  PXInboxViewController *v14;
  void *v15;
  PXInboxViewController *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  void *v22;

  -[PXGadgetProvider gadgets](self, "gadgets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = -[PXInboxGadgetProvider estimatedNumberOfGadgets](self, "estimatedNumberOfGadgets");
  v6 = v5 - v4;
  if ((uint64_t)(v5 - v4) < 0)
  {
    objc_msgSend(v3, "subarrayWithRange:", v5, (unint64_t)fabs((double)v6));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __39__PXInboxGadgetProvider__updateGadgets__block_invoke;
    v21[3] = &unk_1E5145360;
    v22 = v18;
    v11 = v18;
    -[PXGadgetProvider performChanges:](self, "performChanges:", v21);
    v17 = v22;
LABEL_10:

    goto LABEL_11;
  }
  if (v5 != v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

    if (IsAccessibilityCategory)
      v10 = 1;
    else
      v10 = 3;
    PXForYouLastExitedDate();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0;
    do
    {
      v14 = [PXInboxViewController alloc];
      -[PXInboxGadgetProvider dataSourceManager](self, "dataSourceManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PXInboxViewController initWithDataSourceManager:](v14, "initWithDataSourceManager:", v15);

      -[PXInboxViewController setDataSourceIndexRange:](v16, "setDataSourceIndexRange:", v13, v10);
      -[PXInboxViewController setLastSeenDate:](v16, "setLastSeenDate:", v11);
      objc_msgSend(v12, "addObject:", v16);

      v13 += v10;
      --v6;
    }
    while (v6);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __39__PXInboxGadgetProvider__updateGadgets__block_invoke_2;
    v19[3] = &unk_1E5145360;
    v20 = v12;
    v17 = v12;
    -[PXGadgetProvider performChanges:](self, "performChanges:", v19);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  -[PXInboxGadgetProvider _updateGadgets](self, "_updateGadgets", a3);
  -[PXInboxGadgetProvider _updateDataSourceRangesOfCurrentGadgets](self, "_updateDataSourceRangesOfCurrentGadgets");
}

- (void)_lastExitedForYouDateDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PXForYouLastExitedDateKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[PXInboxGadgetProvider _updateLastSeenDateOfCurrentGadgets](self, "_updateLastSeenDateOfCurrentGadgets");

}

- (void)_updateDataSourceRangesOfCurrentGadgets
{
  void *v2;
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;

  -[PXGadgetProvider gadgets](self, "gadgets");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory)
    v5 = 1;
  else
    v5 = 3;
  if (objc_msgSend(v9, "count"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDataSourceIndexRange:", v6, v5);

      ++v7;
      v6 += v5;
    }
    while (v7 < objc_msgSend(v9, "count"));
  }

}

- (void)_updateLastSeenDateOfCurrentGadgets
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PXGadgetProvider gadgets](self, "gadgets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXForYouLastExitedDate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setLastSeenDate:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if ((v6 & 1) == 0 || (void *)PXDataSourceManagerObservationContext_233423 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXInboxGadgetProvider.m"), 145, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXInboxGadgetProvider _updateGadgets](self, "_updateGadgets");
  -[PXInboxGadgetProvider _updateDataSourceRangesOfCurrentGadgets](self, "_updateDataSourceRangesOfCurrentGadgets");
  -[PXInboxGadgetProvider _updateLastSeenDateOfCurrentGadgets](self, "_updateLastSeenDateOfCurrentGadgets");

}

- (PXInboxAggregateDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

uint64_t __39__PXInboxGadgetProvider__updateGadgets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeGadgets:", *(_QWORD *)(a1 + 32));
}

uint64_t __39__PXInboxGadgetProvider__updateGadgets__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addGadgets:", *(_QWORD *)(a1 + 32));
}

@end
