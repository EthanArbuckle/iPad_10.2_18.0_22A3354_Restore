@implementation PXUIFilterController

- (void)_setupNavigationBar
{
  void *v3;
  void *v4;
  id v5;

  PXLocalizedStringFromTable(CFSTR("PXFilterPopoverTitle"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIFilterController setTitle:](self, "setTitle:", v3);

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonPressed_);
  -[PXUIFilterController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v5);

}

- (void)_setupTableView
{
  PXPhotosGlobalFooterView *v3;
  PXFooterViewModel *v4;
  void *v5;
  PXPhotosGlobalFooterView *v6;

  v3 = [PXPhotosGlobalFooterView alloc];
  v6 = -[PXPhotosGlobalFooterView initWithFrame:needsWorkaroundFor53118165:](v3, "initWithFrame:needsWorkaroundFor53118165:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = objc_alloc_init(PXFooterViewModel);
  -[PXPhotosGlobalFooterView setViewModel:](v6, "setViewModel:", v4);

  -[PXUIFilterController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsMultipleSelection:", 1);
  objc_msgSend(v5, "setTableFooterView:", v6);

}

- (void)_updateTableView
{
  NSArray *contentFilterGroups;
  void *v4;

  contentFilterGroups = self->_contentFilterGroups;
  self->_contentFilterGroups = 0;

  -[PXUIFilterController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[PXUIFilterController _updateFooterStatus](self, "_updateFooterStatus");
}

- (id)_localizedCounts
{
  PXAssetsDataSourceCountsController *countsController;
  void *v4;
  void *v5;
  char v6;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v12 = 0uLL;
  v13 = 0;
  countsController = self->_countsController;
  if (countsController)
    -[PXAssetsDataSourceCountsController counts](countsController, "counts");
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "sharedWithYouOnlyFilterIncludesUnsaved"))
    {

    }
    else
    {
      -[PXUIFilterController contentFilterState](self, "contentFilterState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "showOnlySharedWithYou");

      if ((v6 & 1) != 0)
        return 0;
    }
  }
  if ((_QWORD)v12 != 0x7FFFFFFFFFFFFFFFLL
    && *((_QWORD *)&v12 + 1) != 0x7FFFFFFFFFFFFFFFLL
    && v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v12;
    v11 = v13;
    PXLocalizedDetailedCountsDescription(&v10);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)_localizedGuestCounts
{
  PXAssetsDataSourceCountsController *countsController;
  void *v4;
  int v5;
  void *v6;
  BOOL v8;
  int v9;
  void *v10;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v14 = 0uLL;
  v15 = 0;
  countsController = self->_countsController;
  if (countsController)
    -[PXAssetsDataSourceCountsController guestCounts](countsController, "guestCounts");
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "sharedWithYouOnlyFilterIncludesUnsaved") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[PXUIFilterController contentFilterState](self, "contentFilterState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "showOnlySharedWithYou");

    }
  }
  else
  {
    v5 = 0;
  }
  v8 = (_QWORD)v14 == 0x7FFFFFFFFFFFFFFFLL
    || *((_QWORD *)&v14 + 1) == 0x7FFFFFFFFFFFFFFFLL
    || v15 == 0x7FFFFFFFFFFFFFFFLL;
  if (v8 || (*((_QWORD *)&v14 + 1) + (_QWORD)v14 + v15 ? (v9 = 1) : (v9 = v5), v9 != 1))
  {
    v10 = 0;
  }
  else
  {
    v12 = v14;
    v13 = v15;
    PXLocalizedDetailedCountsDescription(&v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (void)_updateFooterLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  id v45;
  CGRect v46;
  CGRect v47;

  -[PXUIFilterController tableView](self, "tableView");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "tableFooterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v13 = v12;
  if (v12 != v11)
  {
    objc_msgSend(v3, "setFrame:", v5, v7, v9, v12);
    objc_msgSend(v45, "setTableFooterView:", v3);
  }
  -[PXUIFilterController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 != 1)
  {
    objc_msgSend(v45, "rectForSection:", objc_msgSend(v45, "numberOfSections") - 1);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(v45, "contentOffset");
    v25 = v24;
    objc_msgSend(v45, "frame");
    v26 = v25 + CGRectGetHeight(v46);
    v47.origin.x = v17;
    v47.origin.y = v19;
    v47.size.width = v21;
    v47.size.height = v23;
    v27 = v26 - CGRectGetMaxY(v47);
    if (v27 >= v13)
      v27 = v13;
    v28 = v13 + v25 - v27;
    objc_msgSend(v3, "frame");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "orientation");

    if (v36 == 1)
      v37 = 50.0;
    else
      v37 = 0.0;
    objc_msgSend(v45, "bounds");
    objc_msgSend(v3, "setFrame:", v30, v28 + v38 - v34 - v37, v32, v34);
  }
  -[PXUIFilterController tableView](self, "tableView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "contentSize");
  v41 = v40;
  v43 = v42;
  -[PXUIFilterController parentViewController](self, "parentViewController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setPreferredContentSize:", v41, v43);

  objc_msgSend(v3, "setHidden:", -[PXUIFilterController hidesFooter](self, "hidesFooter"));
}

- (void)_updateFooterStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  __CFString *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *, void *);
  void *v20;
  id v21;
  id v22;
  __CFString *v23;
  id v24;

  -[PXUIFilterController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableFooterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXUIFilterController _localizedCounts](self, "_localizedCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIFilterController _localizedGuestCounts](self, "_localizedGuestCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("shared.with.you");
  if (!v6)
    v7 = 0;
  v8 = v7;
  -[PXUIFilterController contentFilterState](self, "contentFilterState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isFiltering"))
    v10 = CFSTR("PXContentFilterFooterSubtitle_FilterResults");
  else
    v10 = CFSTR("PXContentFilterFooterSubtitle_NoFilters");
  PXLocalizedStringFromTable(v10, CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __43__PXUIFilterController__updateFooterStatus__block_invoke;
  v20 = &unk_1E5136240;
  v21 = v5;
  v22 = v6;
  v23 = v8;
  v24 = v11;
  v13 = v11;
  v14 = v8;
  v15 = v6;
  v16 = v5;
  objc_msgSend(v12, "performChanges:", &v17);

  -[PXUIFilterController _updateFooterLayout](self, "_updateFooterLayout", v17, v18, v19, v20);
}

- (void)_setVisibilityForSender:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "tag");
  v6 = objc_msgSend(v4, "isOn");

  -[PXUIFilterController _updateContentFilterStateWithFilterItemTag:shouldEnable:](self, "_updateContentFilterStateWithFilterItemTag:shouldEnable:", v5, v6);
}

- (id)_contentFilterGroups
{
  NSArray *contentFilterGroups;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;

  contentFilterGroups = self->_contentFilterGroups;
  if (!contentFilterGroups)
  {
    v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    -[PXUIFilterController filterControllerDelegate](self, "filterControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentFilterHiddenTypesForFilterController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "containsObject:", &unk_1E53EE8C8) & 1) == 0)
    {
      +[PXFilterGroup groupWithName:filterIdentifiers:](PXFilterGroup, "groupWithName:filterIdentifiers:", &stru_1E5149688, &unk_1E53EA2C0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v4, "addObject:", v7);

    }
    +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "showUnsavedSyndicatedContentInPhotosGrids");

    v10 = !+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
    v11 = v10 & v9;
    if ((v10 & 1) == 0 && v9)
    {
      +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "contentSyndicationIsAvailable"))
      {
        +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "includeSharedWithYou");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v14, "BOOLValue");

      }
      else
      {
        v11 = 0;
      }

    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    if (v11)
    {
      if ((objc_msgSend(v6, "containsObject:", &unk_1E53EE8E0) & 1) == 0)
        objc_msgSend(v15, "addObject:", &unk_1E53EE8E0);
      if ((objc_msgSend(v6, "containsObject:", &unk_1E53EE8F8) & 1) == 0)
        objc_msgSend(v15, "addObject:", &unk_1E53EE8F8);
    }
    if ((objc_msgSend(v6, "containsObject:", &unk_1E53EE910) & 1) == 0)
      objc_msgSend(v15, "addObject:", &unk_1E53EE910);
    if ((objc_msgSend(v6, "containsObject:", &unk_1E53EE928) & 1) == 0)
      objc_msgSend(v15, "addObject:", &unk_1E53EE928);
    if ((objc_msgSend(v6, "containsObject:", &unk_1E53EE940) & 1) == 0)
      objc_msgSend(v15, "addObject:", &unk_1E53EE940);
    if ((objc_msgSend(v6, "containsObject:", &unk_1E53EE958) & 1) == 0)
      objc_msgSend(v15, "addObject:", &unk_1E53EE958);
    if ((objc_msgSend(v6, "containsObject:", &unk_1E53EE970) & 1) == 0)
      objc_msgSend(v15, "addObject:", &unk_1E53EE970);
    if ((objc_msgSend(v6, "containsObject:", &unk_1E53EE988) & 1) == 0)
      objc_msgSend(v15, "addObject:", &unk_1E53EE988);
    -[PXUIFilterController contentFilterState](self, "contentFilterState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "includeScreenshots");

    if (v17 && (objc_msgSend(v6, "containsObject:", &unk_1E53EE9A0) & 1) == 0)
      objc_msgSend(v15, "addObject:", &unk_1E53EE9A0);
    if (v11 && (objc_msgSend(v6, "containsObject:", &unk_1E53EE9B8) & 1) == 0)
      objc_msgSend(v15, "addObject:", &unk_1E53EE9B8);
    if (objc_msgSend(v15, "count"))
    {
      PXLocalizedStringFromTable(CFSTR("PXContentFilterGroupTitleOnlyShow"), CFSTR("PhotosUICore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXFilterGroup groupWithName:filterIdentifiers:](PXFilterGroup, "groupWithName:filterIdentifiers:", v18, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray addObject:](v4, "addObject:", v19);
    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    if (v11 && (objc_msgSend(v6, "containsObject:", &unk_1E53EE9D0) & 1) == 0)
      objc_msgSend(v20, "addObject:", &unk_1E53EE9D0);
    if (objc_msgSend(v20, "count"))
    {
      PXLocalizedStringFromTable(CFSTR("PXContentFilterGroupTitleInclude"), CFSTR("PhotosUICore"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXFilterGroup groupWithName:filterIdentifiers:](PXFilterGroup, "groupWithName:filterIdentifiers:", v21, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray addObject:](v4, "addObject:", v22);
    }
    v23 = self->_contentFilterGroups;
    self->_contentFilterGroups = v4;

    contentFilterGroups = self->_contentFilterGroups;
  }
  return contentFilterGroups;
}

- (int64_t)_contentFilterGroupsCount
{
  void *v2;
  int64_t v3;

  -[PXUIFilterController _contentFilterGroups](self, "_contentFilterGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)_tappedRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[PXUIFilterController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v8, "isSelected");
  v7 = objc_msgSend(v8, "tag");
  if (!+[PXUIFilterController _isContentFilterItemTagHandledBySwitch:](PXUIFilterController, "_isContentFilterItemTagHandledBySwitch:", v7))-[PXUIFilterController _updateContentFilterStateWithFilterItemTag:shouldEnable:](self, "_updateContentFilterStateWithFilterItemTag:shouldEnable:", v7, v6);

}

- (void)_updateContentFilterStateWithFilterItemTag:(int64_t)a3 shouldEnable:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;

  v4 = a4;
  -[PXUIFilterController contentFilterState](self, "contentFilterState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXContentFilterGetUpdatedState(v7, a3, v4, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PXUIFilterController setContentFilterState:](self, "setContentFilterState:", v13);
  if (a3 == 3)
  {
    if (v13)
      v8 = objc_msgSend(v13, "includeSharedWithYou");
    else
      v8 = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIncludeSharedWithYou:", v9);

  }
  if (v4)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PXContentFilterSendAnalyticsForItemSelected(a3, v12);

  }
}

- (void)_filterControllerDidClose
{
  id v3;

  -[PXUIFilterController filterControllerDelegate](self, "filterControllerDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "filterControllerDidClose:", self);

}

- (void)_doneButtonPressed:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PXUIFilterController__doneButtonPressed___block_invoke;
  v5[3] = &unk_1E5148D30;
  objc_copyWeak(&v6, &location);
  -[PXUIFilterController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (PXUIFilterController)initWithDelegate:(id)a3 libraryFilterState:(id)a4 initialContentFilterState:(id)a5 sharedLibraryStatusProvider:(id)a6 filterControllerOptions:(unint64_t)a7
{
  char v7;
  id v13;
  id v14;
  id v15;
  id v16;
  PXUIFilterController *v17;
  PXUIFilterController *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v7 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIFilterController.m"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentFilterState"));

    if (v16)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIFilterController.m"), 320, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryFilterState"));

  if (!v15)
    goto LABEL_8;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIFilterController.m"), 322, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedLibraryStatusProvider"));

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)PXUIFilterController;
  v17 = -[PXUIFilterController initWithStyle:](&v24, sel_initWithStyle_, 2);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sharedLibraryStatusProvider, a6);
    objc_storeStrong((id *)&v18->_libraryFilterState, a4);
    objc_storeStrong((id *)&v18->_contentFilterState, a5);
    objc_storeWeak((id *)&v18->_filterControllerDelegate, v13);
    v18->_hidesFooter = (v7 & 8) != 0;
    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v18->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v18, PXSharedLibraryStatusProviderObservationContext_206381);
    -[PXLibraryFilterState registerChangeObserver:context:](v18->_libraryFilterState, "registerChangeObserver:context:", v18, PXLibraryFilterStateObservationContext_206382);
    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addKeyObserver:", v18);

  }
  return v18;
}

- (void)setDataSourceManager:(id)a3
{
  PXAssetsDataSourceCountsController *v5;
  PXAssetsDataSourceCountsController *countsController;
  PXAssetsDataSourceManager *v7;

  v7 = (PXAssetsDataSourceManager *)a3;
  if (self->_dataSourceManager != v7)
  {
    objc_storeStrong((id *)&self->_dataSourceManager, a3);
    -[PXAssetsDataSourceCountsController unregisterChangeObserver:context:](self->_countsController, "unregisterChangeObserver:context:", self, PXCountsControllerObserverContext);
    v5 = (PXAssetsDataSourceCountsController *)objc_msgSend(objc_alloc((Class)off_1E50B16E8), "initWithAssetsDataSourceManager:", v7);
    countsController = self->_countsController;
    self->_countsController = v5;

    -[PXAssetsDataSourceCountsController registerChangeObserver:context:](self->_countsController, "registerChangeObserver:context:", self, PXCountsControllerObserverContext);
    -[PXAssetsDataSourceCountsController prepareCountsIfNeeded](self->_countsController, "prepareCountsIfNeeded");
    -[PXUIFilterController _updateFooterStatus](self, "_updateFooterStatus");
  }

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXUIFilterController;
  -[PXUIFilterController viewDidLoad](&v4, sel_viewDidLoad);
  -[PXUIFilterController _setupNavigationBar](self, "_setupNavigationBar");
  -[PXUIFilterController _setupTableView](self, "_setupTableView");
  +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerChangeObserver:context:", self, PXContentSyndicationConfigurationObservationContext_206380);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXUIFilterController;
  -[PXUIFilterController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PXUIFilterController _updateFooterLayout](self, "_updateFooterLayout");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[PXUIFilterController _contentFilterGroups](self, "_contentFilterGroups", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void (**v34)(void *, uint64_t);
  void *v35;
  void *v36;
  id v37;
  id v39;
  void *v40;
  _QWORD aBlock[5];
  id v42;
  char v43;

  v6 = a3;
  v7 = a4;
  v40 = v6;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PXFilterControllerCellIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PXFilterControllerCellIdentifier"));
    objc_msgSend(v8, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(v8, "setSelectionStyle:", 0);
    objc_msgSend(v8, "setInsetsLayoutMarginsFromSafeArea:", 0);
    objc_msgSend(v8, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v9, "setNumberOfLines:", 2);
    objc_msgSend(v9, "setLineBreakMode:", 0);
    objc_msgSend(v9, "setMinimumScaleFactor:", 0.600000024);
    objc_msgSend(v8, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v10, "setMinimumScaleFactor:", 0.400000006);

  }
  objc_msgSend(v8, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", 0);

  objc_msgSend(v8, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", 0);

  objc_msgSend(v8, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", 0);

  objc_msgSend(v8, "setAccessoryType:", 0);
  objc_msgSend(v8, "setAccessoryView:", 0);
  v14 = objc_msgSend(v7, "section");
  -[PXUIFilterController _contentFilterGroups](self, "_contentFilterGroups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filterIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v7;
  objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (int)objc_msgSend(v18, "intValue");

  -[PXUIFilterController contentFilterState](self, "contentFilterState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isContentFilterActive:", v19);

  PXContentFilterImageForItemTag(v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setImage:", v22);

  PXContentFilterTitleForItemTag(v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setText:", v24);

  -[PXUIFilterController libraryFilterState](self, "libraryFilterState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "viewMode");

  -[PXUIFilterController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  PXContentFilterSubtitleForItemTag(v19, v28, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "detailTextLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setText:", v29);

  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "detailTextLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTextColor:", v31);

  objc_msgSend(v8, "setTag:", v19);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PXUIFilterController_tableView_cellForRowAtIndexPath___block_invoke;
  aBlock[3] = &unk_1E5136268;
  aBlock[4] = self;
  v43 = v21;
  v33 = v8;
  v42 = v33;
  v34 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (+[PXUIFilterController _isContentFilterItemTagHandledBySwitch:](PXUIFilterController, "_isContentFilterItemTagHandledBySwitch:", v19))
  {
    v34[2](v34, v19);
    v36 = v39;
    v35 = v40;
  }
  else
  {
    v36 = v39;
    v35 = v40;
    if (v21)
    {
      objc_msgSend(v33, "setAccessoryType:", 3);
      objc_msgSend(v40, "selectRowAtIndexPath:animated:scrollPosition:", v39, 0, 0);
    }
  }
  v37 = v33;

  return v37;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[PXUIFilterController _tappedRowAtIndexPath:](self, "_tappedRowAtIndexPath:", a4);
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  -[PXUIFilterController _tappedRowAtIndexPath:](self, "_tappedRowAtIndexPath:", a4);
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)_sectionHeaderTitleTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 2, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  -[PXUIFilterController _contentFilterGroups](self, "_contentFilterGroups", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39A8], "headerConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[PXUIFilterController _sectionHeaderTitleTextAttributes](self, "_sectionHeaderTitleTextAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v8, v11);
  objc_msgSend(v9, "setAttributedText:", v12);

  v13 = objc_alloc_init(MEMORY[0x1E0DC3D78]);
  objc_msgSend(v13, "setContentConfiguration:", v9);
  objc_msgSend(v13, "setAutomaticallyUpdatesContentConfiguration:", 1);

  return v13;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "modalPresentationStyle");

  if (a4 == -1 && v8 == 7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (id)v9;
  -[PXUIFilterController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

}

- (void)setContentFilterState:(id)a3
{
  PXContentFilterState *v4;
  void *v5;
  PXContentFilterState *v6;
  BOOL v7;
  PXContentFilterState *v8;
  void *v9;
  void *v10;
  PXContentFilterState *v11;
  void *contentFilterState;
  PXContentFilterState *v13;
  PXContentFilterState *v14;
  PXContentFilterState *v15;

  v15 = (PXContentFilterState *)a3;
  v4 = self->_contentFilterState;
  v5 = v15;
  if (v4 == v15)
  {
LABEL_7:

    v8 = v15;
    goto LABEL_8;
  }
  v6 = v4;
  v7 = -[PXContentFilterState isEqual:](v4, "isEqual:", v15);

  v8 = v15;
  if (!v7)
  {
    v9 = (void *)-[PXContentFilterState copy](v15, "copy");
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      contentFilterState = self->_contentFilterState;
      self->_contentFilterState = v11;
    }
    else
    {
      -[PXContentFilterState photoLibrary](self->_contentFilterState, "photoLibrary");
      contentFilterState = (void *)objc_claimAutoreleasedReturnValue();
      +[PXContentFilterState defaultFilterStateForPhotoLibrary:](PXContentFilterState, "defaultFilterStateForPhotoLibrary:", contentFilterState);
      v13 = (PXContentFilterState *)objc_claimAutoreleasedReturnValue();
      v14 = self->_contentFilterState;
      self->_contentFilterState = v13;

    }
    -[PXUIFilterController _updateTableView](self, "_updateTableView");
    -[PXUIFilterController filterControllerDelegate](self, "filterControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filterController:contentFilterStateChanged:", self, self->_contentFilterState);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v8 = a3;
  if ((void *)PXContentSyndicationConfigurationObservationContext_206380 == a5)
  {
    if ((v6 & 5) == 0)
      goto LABEL_16;
    v10 = v8;
    -[PXUIFilterController contentFilterState](self, "contentFilterState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_14;
    -[PXUIFilterController setContentFilterState:](self, "setContentFilterState:", 0);
LABEL_15:
    v8 = v10;
    goto LABEL_16;
  }
  if ((void *)PXCountsControllerObserverContext == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_16;
    v10 = v8;
    -[PXUIFilterController _updateFooterStatus](self, "_updateFooterStatus");
    goto LABEL_15;
  }
  if ((void *)PXSharedLibraryStatusProviderObservationContext_206381 == a5)
  {
    if ((v6 & 3) == 0)
      goto LABEL_16;
    goto LABEL_13;
  }
  if ((v6 & 1) != 0 && (void *)PXLibraryFilterStateObservationContext_206382 == a5)
  {
LABEL_13:
    v10 = v8;
LABEL_14:
    -[PXUIFilterController _updateTableView](self, "_updateTableView");
    goto LABEL_15;
  }
LABEL_16:

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a4;
  NSStringFromSelector(sel_showLivePhotoFilter);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", v5))
  {

LABEL_4:
    -[PXUIFilterController _updateTableView](self, "_updateTableView");
    goto LABEL_5;
  }
  NSStringFromSelector(sel_showPortraitFilter);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v7)
    goto LABEL_4;
LABEL_5:

}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXContentFilterState)contentFilterState
{
  return self->_contentFilterState;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXFilterControllerDelegate)filterControllerDelegate
{
  return (PXFilterControllerDelegate *)objc_loadWeakRetained((id *)&self->_filterControllerDelegate);
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (BOOL)hidesFooter
{
  return self->_hidesFooter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_destroyWeak((id *)&self->_filterControllerDelegate);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_contentFilterState, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_countsController, 0);
  objc_storeStrong((id *)&self->_contentFilterGroups, 0);
}

void __56__PXUIFilterController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__setVisibilityForSender_, 4096);
  objc_msgSend(v4, "setTag:", a2);
  objc_msgSend(v4, "setOn:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setAccessoryView:", v4);

}

void __43__PXUIFilterController__doneButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_filterControllerDidClose");

}

void __43__PXUIFilterController__updateFooterStatus__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setExtendedTitle:", a1[5]);
  objc_msgSend(v4, "setExtendedSystemImageName:", a1[6]);
  objc_msgSend(v4, "setSubtitle1:", a1[7]);

}

+ (BOOL)_isContentFilterItemTagHandledBySwitch:(int64_t)a3
{
  return a3 == 3;
}

@end
