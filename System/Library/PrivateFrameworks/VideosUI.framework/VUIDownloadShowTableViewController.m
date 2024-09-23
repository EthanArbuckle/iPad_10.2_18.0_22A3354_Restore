@implementation VUIDownloadShowTableViewController

- (VUIDownloadShowTableViewController)initWithDataSource:(id)a3 seasonsDataSource:(id)a4
{
  id v7;
  id v8;
  VUIDownloadShowTableViewController *v9;
  VUIDownloadShowTableViewController *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VUIDownloadShowTableViewController;
  v9 = -[VUIDownloadShowTableViewController init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_downloadDataSource, a3);
    objc_storeStrong((id *)&v10->_seasonsDataSource, a4);
    -[VUIDownloadShowTableViewController navigationItem](v10, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setSupportsTwoLineLargeTitles:", 1);
    objc_initWeak(&location, v10);
    v19[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__VUIDownloadShowTableViewController_initWithDataSource_seasonsDataSource___block_invoke;
    v15[3] = &unk_1E9F99F98;
    objc_copyWeak(&v16, &location);
    v13 = (id)-[VUIDownloadShowTableViewController registerForTraitChanges:withHandler:](v10, "registerForTraitChanges:withHandler:", v12, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  return v10;
}

void __75__VUIDownloadShowTableViewController_initWithDataSource_seasonsDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSizingHeader:", 0);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  UIBarButtonItem *v22;
  UIBarButtonItem *rightBarButtonItem;
  void *v24;
  void *v25;
  UIBarButtonItem *v26;
  UIBarButtonItem *backBarButtonItem;
  UIBarButtonItem *v28;
  UIBarButtonItem *leftBarButtonItem;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)VUIDownloadShowTableViewController;
  -[VUIDownloadShowTableViewController loadView](&v31, sel_loadView);
  -[VUILibraryDataSource setDelegate:](self->_downloadDataSource, "setDelegate:", self);
  -[VUIDownloadShowDataSource startFetch](self->_downloadDataSource, "startFetch");
  -[VUILibraryDataSource setDelegate:](self->_seasonsDataSource, "setDelegate:", self);
  -[VUIMediaEntitiesDataSource startFetch](self->_seasonsDataSource, "startFetch");
  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", self);

  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsMultipleSelectionDuringEditing:", 1);

  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v7, v9);

  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forHeaderFooterViewReuseIdentifier:", v11, v13);

  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  objc_msgSend(v14, "setTableFooterView:", v15);

  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSeparatorStyle:", 0);

  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], CFSTR("Library.id=\"DownloadedShow\"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIdentifier:", v18);

  if ((objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode") & 1) == 0)
  {
    v19 = objc_alloc(MEMORY[0x1E0DC34F0]);
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:", CFSTR("EDIT"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (UIBarButtonItem *)objc_msgSend(v19, "initWithTitle:style:target:action:", v21, 0, self, sel__editToggled);
    rightBarButtonItem = self->_rightBarButtonItem;
    self->_rightBarButtonItem = v22;

    -[VUIDownloadShowTableViewController navigationItem](self, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setRightBarButtonItem:", self->_rightBarButtonItem);

  }
  -[VUIDownloadShowTableViewController navigationItem](self, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leftBarButtonItem");
  v26 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  backBarButtonItem = self->_backBarButtonItem;
  self->_backBarButtonItem = v26;

  v28 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPressed);
  leftBarButtonItem = self->_leftBarButtonItem;
  self->_leftBarButtonItem = v28;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:selector:name:object:", self, sel_fullscreenPlaybackUIDidChangeNotification_, VUIPlaybackManagerFullscreenPlaybackUIDidChangeNotification[0], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIDownloadShowTableViewController;
  -[VUIDownloadShowTableViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[VUIDownloadShowTableViewController _clearTableViewSelections:](self, "_clearTableViewSelections:", v3);
  -[VUIDownloadShowTableViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIDownloadShowTableViewController;
  -[VUIDownloadShowTableViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[VUIDownloadShowTableViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIDownloadShowTableViewController;
  -[VUIDownloadShowTableViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  +[VUILibraryMetrics recordPageEventWithPageType:](VUILibraryMetrics, "recordPageEventWithPageType:", CFSTR("LibraryDownloadedTvShow"));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadShowTableViewController;
  -[VUIDownloadShowTableViewController dealloc](&v4, sel_dealloc);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUIDownloadShowTableViewController;
  v7 = a4;
  -[VUIDownloadShowTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__VUIDownloadShowTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E9F99FC0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __89__VUIDownloadShowTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exitEditingMode");
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v4 = a3;
  -[VUIDownloadShowTableViewController downloadDataSource](self, "downloadDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[VUIDownloadShowTableViewController downloadDataSource](self, "downloadDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "grouping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    -[VUIDownloadShowTableViewController setGroupings:](self, "setGroupings:", v8);

  }
  else
  {
    -[VUIDownloadShowTableViewController seasonsDataSource](self, "seasonsDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadShowTableViewController setSeasons:](self, "setSeasons:", v7);
  }

  -[VUIDownloadShowTableViewController seasonsDataSource](self, "seasonsDataSource");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "hasCompletedInitialFetch") & 1) != 0)
  {
    -[VUIDownloadShowTableViewController downloadDataSource](self, "downloadDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasCompletedInitialFetch");

    if (v10)
    {
      -[VUIDownloadShowTableViewController tableView](self, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadData");

      -[VUIDownloadShowTableViewController _popIfNeeded](self, "_popIfNeeded");
    }
  }
  else
  {

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  VUIDownloadEntity *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  VUISeparatorView *v18;

  v6 = a3;
  v7 = a4;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", objc_msgSend(v7, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[VUIDownloadEntity initWithMediaEntity:withDownloadType:]([VUIDownloadEntity alloc], "initWithMediaEntity:withDownloadType:", v12, 3);
  +[VUIDownloadEntityTableViewCell configureVUIDownloadEntityTableViewCell:withDownloadEntity:forMetrics:](VUIDownloadEntityTableViewCell, "configureVUIDownloadEntityTableViewCell:withDownloadEntity:forMetrics:", v10, v13, 0);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "downloadButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "setPresentingViewController:", self);
  v16 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section")) - 1;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v16, objc_msgSend(v7, "section"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "compare:", v17))
  {
    v18 = objc_alloc_init(VUISeparatorView);
    objc_msgSend(v10, "setBottomSeparatorView:", v18);

  }
  else
  {
    objc_msgSend(v10, "setBottomSeparatorView:", 0);
  }

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSMutableArray count](self->_groupings, "count", a3);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIDownloadShowTableViewController _headerTitleForEpisodeMediaItem:](self, "_headerTitleForEpisodeMediaItem:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setHeaderTitle:", v9);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  VUIDownloadShowTableHeaderView *v7;
  VUIDownloadShowTableHeaderView *sizingHeader;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  VUIDownloadShowTableHeaderView *v13;
  void *v14;
  double v15;
  CGRect v17;

  v6 = a3;
  if (!self->_sizingHeader)
  {
    v7 = objc_alloc_init(VUIDownloadShowTableHeaderView);
    sizingHeader = self->_sizingHeader;
    self->_sizingHeader = v7;

  }
  -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIDownloadShowTableViewController _headerTitleForEpisodeMediaItem:](self, "_headerTitleForEpisodeMediaItem:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadShowTableHeaderView setHeaderTitle:](self->_sizingHeader, "setHeaderTitle:", v12);
    v13 = self->_sizingHeader;
    -[VUIDownloadShowTableViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    -[VUIDownloadShowTableHeaderView sizeThatFits:](v13, "sizeThatFits:", CGRectGetWidth(v17), 1.79769313e308);
    v11 = v15;

  }
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  VUIMediaInfo *v17;
  void *v18;
  VUIMediaInfo *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEditing");

  if ((v9 & 1) == 0)
  {
    -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", objc_msgSend(v7, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v7, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      objc_msgSend(v14, "downloadExpirationDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "vui_isInTheFuture"))
      {
        -[VUIDownloadShowTableViewController _configureRenewAlertControllerForIndexPath:forPreferredStyle:withCompletion:](self, "_configureRenewAlertControllerForIndexPath:forPreferredStyle:withCompletion:", v7, 1, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          -[VUIDownloadShowTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);
        objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

      }
      else
      {
        v17 = [VUIMediaInfo alloc];
        v24[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[VUIMediaInfo initWithPlaybackContext:vuiMediaItems:](v17, "initWithPlaybackContext:vuiMediaItems:", 3, v18);

        -[VUIMediaInfo setIntent:](v19, "setIntent:", 1);
        -[VUIMediaInfo setAutomaticPlaybackStart:](v19, "setAutomaticPlaybackStart:", 0);
        if (v19)
        {
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __72__VUIDownloadShowTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
          v22[3] = &unk_1E9F98DF0;
          v23 = v14;
          +[VUIActionPlay playMediaInfo:watchType:isRentAndWatchNow:completion:](VUIActionPlay, "playMediaInfo:watchType:isRentAndWatchNow:completion:", v19, 0, 0, v22);
          v20 = v23;
        }
        else
        {
          VUIDefaultLogObject();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[VUIDownloadShowTableViewController tableView:didSelectRowAtIndexPath:].cold.1((uint64_t)v14, v20);
        }

      }
    }

    goto LABEL_17;
  }
  -[VUIDownloadShowTableViewController rightBarButtonItem](self, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEnabled");

  if ((v11 & 1) == 0)
  {
    -[VUIDownloadShowTableViewController rightBarButtonItem](self, "rightBarButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:", 1);
LABEL_17:

  }
}

uint64_t __72__VUIDownloadShowTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return +[VUILibraryMetrics recordPlayOfMediaEntity:isLaunchingExtras:](VUILibraryMetrics, "recordPlayOfMediaEntity:isLaunchingExtras:", *(_QWORD *)(a1 + 32), 0);
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[VUIDownloadShowTableViewController tableView](self, "tableView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditing");

  if (v6)
  {
    -[VUIDownloadShowTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathsForSelectedRows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      -[VUIDownloadShowTableViewController rightBarButtonItem](self, "rightBarButtonItem");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEnabled:", 0);

    }
  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  -[VUIDownloadShowTableViewController rightBarButtonItem](self, "rightBarButtonItem", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("DONE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  -[VUIDownloadShowTableViewController rightBarButtonItem](self, "rightBarButtonItem", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("EDIT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id location;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v31 = v6;
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0DC36C8];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:", CFSTR("DELETE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __99__VUIDownloadShowTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    v41[3] = &unk_1E9F99FE8;
    objc_copyWeak(&v43, &location);
    v29 = v6;
    v42 = v29;
    objc_msgSend(v8, "contextualActionWithStyle:title:handler:", 1, v10, v41);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "addObject:", v30);
    if (v29)
    {
      -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", objc_msgSend(v29, "section"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v29, "row"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      -[VUIDownloadShowTableViewController tableView](self, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "indexPathsForSelectedRows");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      v11 = 0;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v38;
        do
        {
          v17 = 0;
          v18 = v12;
          v19 = v11;
          do
          {
            if (*(_QWORD *)v38 != v16)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v17);
            -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", objc_msgSend(v20, "section"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v20, "row"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            ++v17;
            v18 = v12;
            v19 = v11;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v15);
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v12;
      if (-[VUIDownloadShowTableViewController _mediaItemShouldShowRenewOption:](self, "_mediaItemShouldShowRenewOption:", v21))
      {
        v22 = (void *)MEMORY[0x1E0DC36C8];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:", CFSTR("RENEW"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __99__VUIDownloadShowTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2;
        v34[3] = &unk_1E9F99FE8;
        objc_copyWeak(&v36, &location);
        v35 = v29;
        objc_msgSend(v22, "contextualActionWithStyle:title:handler:", 0, v24, v34);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "addObject:", v25);
        objc_destroyWeak(&v36);
      }

    }
    v26 = (void *)MEMORY[0x1E0DC3D08];
    v27 = (void *)objc_msgSend(v33, "copy");
    objc_msgSend(v26, "configurationWithActions:", v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);

    v6 = v31;
  }

  return v7;
}

void __99__VUIDownloadShowTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  void *v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_configureDeleteAlertControllerForIndexPath:withCompletion:", *(_QWORD *)(a1 + 32), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

}

void __99__VUIDownloadShowTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  void *v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_configureRenewAlertControllerForIndexPath:forPreferredStyle:withCompletion:", *(_QWORD *)(a1 + 32), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)downloadCellDidRequestCancelDownload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VUIDownloadShowTableViewController groupings](self, "groupings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      if ((objc_msgSend(v10, "markedAsDeleted") & 1) != 0
        || (objc_msgSend(v10, "downloadExpirationDate"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v11,
            !v11))
      {
        objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v6, "row"));
        -[VUIDownloadShowTableViewController tableView](self, "tableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "deleteRowsAtIndexPaths:withRowAnimation:", v13, 100);

      }
    }

  }
}

- (id)_headerTitleForEpisodeMediaItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "seasonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "seasonTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "seasonNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringValue");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:", CFSTR("SEASON_%@"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_editToggled
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  UIBarButtonItem *rightBarButtonItem;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditing");

  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "indexPathsForSelectedRows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      -[VUIDownloadShowTableViewController _configureDeleteAlertControllerForIndexPath:withCompletion:](self, "_configureDeleteAlertControllerForIndexPath:withCompletion:", 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v14 = v9;
        -[VUIDownloadShowTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
        v9 = v14;
      }

    }
    else
    {
      -[VUIDownloadShowTableViewController _exitEditingMode](self, "_exitEditingMode");
    }
  }
  else
  {
    objc_msgSend(v5, "setEditing:animated:", 1, 1);

    rightBarButtonItem = self->_rightBarButtonItem;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:", CFSTR("DELETE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](rightBarButtonItem, "setTitle:", v12);

    -[VUIDownloadShowTableViewController rightBarButtonItem](self, "rightBarButtonItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", 0);

    -[VUIDownloadShowTableViewController navigationItem](self, "navigationItem");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLeftBarButtonItem:", self->_leftBarButtonItem);

  }
}

- (id)_configureDeleteAlertControllerForIndexPath:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  VUIDownloadShowTableViewController *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD aBlock[4];
  id v53;
  id v54;
  id v55;
  id location[2];

  v6 = a3;
  v7 = a4;
  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForSelectedRows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:", CFSTR("DELETE_EXPLANATION"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:", CFSTR("DELETE_DOWNLOAD"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && v10 >= 2)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:", CFSTR("DELETES_EXPLANATION"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v12;
    v12 = (void *)v16;

    v18 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:", CFSTR("DELETE_%U_DOWNLOADS"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v20, CFSTR("%u"), 0, v10);
    v21 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v21;
  }
  objc_initWeak(location, self);
  v22 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke;
  aBlock[3] = &unk_1E9F99600;
  objc_copyWeak(&v55, location);
  v23 = v6;
  v53 = v23;
  v24 = v7;
  v54 = v24;
  v44 = _Block_copy(aBlock);
  v49[0] = v22;
  v49[1] = 3221225472;
  v49[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_6;
  v49[3] = &unk_1E9F9A060;
  objc_copyWeak(&v51, location);
  v25 = v24;
  v50 = v25;
  v26 = _Block_copy(v49);
  if (v23 || v10)
  {
    v40 = self;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v12, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v12;
    v43 = v14;
    v28 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%lu"), 0, v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v22;
    v47[1] = 3221225472;
    v47[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_7;
    v47[3] = &unk_1E9F9A088;
    v48 = v44;
    objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 2, v47);
    v30 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "addAction:", v30);
    v41 = (void *)v30;
    v31 = (void *)MEMORY[0x1E0DC3448];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:", CFSTR("CANCEL"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v22;
    v45[1] = 3221225472;
    v45[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_8;
    v45[3] = &unk_1E9F9A088;
    v46 = v26;
    objc_msgSend(v31, "actionWithTitle:style:handler:", v33, 1, v45);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "addAction:", v34);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "userInterfaceIdiom");

    if (v36 == 1)
    {
      objc_msgSend(v27, "setModalPresentationStyle:", 7);
      objc_msgSend(v27, "popoverPresentationController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadShowTableViewController rightBarButtonItem](v40, "rightBarButtonItem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setBarButtonItem:", v38);

    }
    v12 = v42;
    v14 = v43;
  }
  else
  {
    if (v25)
      (*((void (**)(id, _QWORD))v25 + 2))(v25, 0);
    v27 = 0;
  }

  objc_destroyWeak(&v51);
  objc_destroyWeak(&v55);
  objc_destroyWeak(location);

  return v27;
}

void __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[5];
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v1 = a1;
  v72 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(WeakRetained, "setAssetControllersToRemove:", v4);

  if (*(_QWORD *)(v1 + 32))
  {
    objc_msgSend(WeakRetained, "groupings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", objc_msgSend(*(id *)(v1 + 32), "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndex:", objc_msgSend(*(id *)(v1 + 32), "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);
    objc_msgSend(v7, "assetController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "assetControllersToRemove");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

  }
  else
  {
    v47 = v1;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(WeakRetained, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPathsForSelectedRows");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v66 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_msgSend(WeakRetained, "groupings");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v16, "section"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v16, "row"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v19);
          objc_msgSend(v19, "assetController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "assetControllersToRemove");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v20);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      }
      while (v13);
    }

    v1 = v47;
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(WeakRetained, "assetControllersToRemove");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v62 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "cancelAndRemoveDownload");
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v24);
  }

  if (*(_QWORD *)(v1 + 32))
  {
    objc_msgSend(WeakRetained, "tableView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_2;
    v59[3] = &unk_1E9F98FD8;
    v59[4] = WeakRetained;
    v60 = *(id *)(v1 + 32);
    v57[0] = v28;
    v57[1] = 3221225472;
    v57[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_3;
    v57[3] = &unk_1E9F98E40;
    v57[4] = WeakRetained;
    v58 = *(id *)(v1 + 40);
    objc_msgSend(v27, "performBatchUpdates:completion:", v59, v57);

  }
  else
  {
    v48 = v1;
    v29 = (void *)objc_opt_new();
    v30 = (void *)objc_opt_new();
    objc_msgSend(WeakRetained, "groupings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_4;
    v53[3] = &unk_1E9F9A038;
    v54 = v3;
    v32 = v29;
    v55 = v32;
    v33 = v30;
    v56 = v33;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v53);

    objc_msgSend(WeakRetained, "setGroupings:", v32);
    objc_msgSend(WeakRetained, "tableView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "beginUpdates");

    if (objc_msgSend(v33, "count"))
    {
      objc_msgSend(WeakRetained, "tableView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "deleteSections:withRowAnimation:", v33, 100);

    }
    v36 = (void *)objc_opt_new();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(WeakRetained, "tableView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "indexPathsForSelectedRows");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v50;
      do
      {
        for (k = 0; k != v40; ++k)
        {
          if (*(_QWORD *)v50 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
          if ((objc_msgSend(v33, "containsIndex:", objc_msgSend(v43, "section")) & 1) == 0)
            objc_msgSend(v36, "addObject:", v43);
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
      }
      while (v40);
    }

    if (objc_msgSend(v36, "count"))
    {
      objc_msgSend(WeakRetained, "tableView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "deleteRowsAtIndexPaths:withRowAnimation:", v36, 100);

    }
    objc_msgSend(WeakRetained, "tableView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "endUpdates");

    objc_msgSend(WeakRetained, "_exitEditingMode");
    objc_msgSend(WeakRetained, "_popIfNeeded");
    v46 = *(_QWORD *)(v48 + 40);
    if (v46)
      (*(void (**)(uint64_t, uint64_t))(v46 + 16))(v46, 1);

  }
}

void __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "groupings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "groupings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteSections:withRowAnimation:", v5, 100);

  }
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteRowsAtIndexPaths:withRowAnimation:", v8, 100);

}

uint64_t __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_exitEditingMode");
  objc_msgSend(*(id *)(a1 + 32), "_popIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_4(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_5;
  v8[3] = &unk_1E9F9A010;
  v9 = a1[4];
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  if (objc_msgSend(v7, "count"))
    objc_msgSend(a1[5], "addObject:", v7);
  else
    objc_msgSend(a1[6], "addIndex:", a3);

}

void __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_exitEditingMode");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

}

uint64_t __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_configureRenewAlertControllerForIndexPath:(id)a3 forPreferredStyle:(int64_t)a4 withCompletion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void (**v56)(void);
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL4 v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void (**v77)(void);
  VUIDownloadShowTableViewController *val;
  _QWORD v79[4];
  id v80;
  _QWORD aBlock[4];
  id v82;
  id v83;
  id v84;
  void (**v85)(void);
  id v86;
  _QWORD v87[4];
  void (**v88)(void);
  _QWORD v89[4];
  void (**v90)(void);
  id v91;
  _QWORD v92[4];
  id v93;
  void (**v94)(void);
  id v95;
  char v96;
  id location;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v76 = v7;
  v77 = (void (**)(void))a5;
  val = self;
  if (v7)
  {
    -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", objc_msgSend(v7, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    -[VUIDownloadShowTableViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPathsForSelectedRows");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    v12 = 0;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v99;
      do
      {
        v15 = 0;
        v16 = v8;
        do
        {
          if (*(_QWORD *)v99 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v15);
          -[NSMutableArray objectAtIndex:](val->_groupings, "objectAtIndex:", objc_msgSend(v17, "section"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v17, "row"));
          v18 = objc_claimAutoreleasedReturnValue();

          ++v15;
          v16 = v8;
          v12 = (void *)v18;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
        v12 = (void *)v18;
      }
      while (v13);
    }
    v9 = v12;

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v74 = v9;
    objc_msgSend(v74, "availabilityEndDate");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v75 && !objc_msgSend(v75, "vui_isInTheFuture"))
    {
      objc_initWeak(&location, val);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_5;
      aBlock[3] = &unk_1E9F9A128;
      objc_copyWeak(&v86, &location);
      v82 = v7;
      v32 = v74;
      v83 = v32;
      v84 = v8;
      v85 = v77;
      v73 = _Block_copy(aBlock);
      v33 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:", CFSTR("DOWNLOAD_MESSAGE_NO_LONGER_AVAILABLE"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "brandName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithValidatedFormat:validFormatSpecifiers:error:", v35, CFSTR("%@"), 0, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x1E0DC3450];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:", CFSTR("DOWNLOAD_NO_LONGER_AVAILABLE"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "alertControllerWithTitle:message:preferredStyle:", v40, v37, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (void *)MEMORY[0x1E0DC3448];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:", CFSTR("DELETE"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_8;
      v79[3] = &unk_1E9F9A088;
      v44 = v73;
      v80 = v44;
      objc_msgSend(v41, "actionWithTitle:style:handler:", v43, 0, v79);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "addAction:", v45);
      objc_destroyWeak(&v86);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isNetworkReachable");

      if (v20)
      {
        v71 = objc_msgSend(v74, "allowsManualDownloadRenewal");
        if (v71)
        {
          if (a4 == 1)
          {
            +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "localizedStringForKey:", CFSTR("RENEW_DOWNLOAD"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v70 = 0;
          }
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "localizedStringForKey:", CFSTR("RENEW_DOWNLOAD"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = (void *)MEMORY[0x1E0CB3940];
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "localizedStringForKey:", CFSTR("DOWNLOAD_MESSAGE_RENEW"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "brandName");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithValidatedFormat:validFormatSpecifiers:error:", v50, CFSTR("%@"), 0, v51);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (a4 == 1)
          {
            +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "localizedStringForKey:", CFSTR("DOWNLOAD_AGAIN"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v70 = 0;
          }
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "localizedStringForKey:", CFSTR("DOWNLOAD_AGAIN_BUTTON_TITLE"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = (void *)MEMORY[0x1E0CB3940];
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "localizedStringForKey:", CFSTR("DOWNLOAD_MESSAGE_REDOWNLOAD"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "brandName");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stringWithValidatedFormat:validFormatSpecifiers:error:", v50, CFSTR("%@"), 0, v51);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v70, v68, a4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, val);
        v54 = (void *)MEMORY[0x1E0DC3448];
        v55 = MEMORY[0x1E0C809B0];
        v92[0] = MEMORY[0x1E0C809B0];
        v92[1] = 3221225472;
        v92[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke;
        v92[3] = &unk_1E9F9A0D8;
        objc_copyWeak(&v95, &location);
        v93 = v74;
        v96 = v71;
        v56 = v77;
        v94 = v56;
        objc_msgSend(v54, "actionWithTitle:style:handler:", v69, 0, v92);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAction:", v57);
        v58 = (void *)MEMORY[0x1E0DC3448];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "localizedStringForKey:", CFSTR("CANCEL"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v89[0] = v55;
        v89[1] = 3221225472;
        v89[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_3;
        v89[3] = &unk_1E9F9A100;
        objc_copyWeak(&v91, &location);
        v90 = v56;
        objc_msgSend(v58, "actionWithTitle:style:handler:", v60, 1, v89);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "addAction:", v61);
        objc_destroyWeak(&v91);

        objc_destroyWeak(&v95);
        objc_destroyWeak(&location);

      }
      else
      {
        v23 = (void *)MEMORY[0x1E0DC3450];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:", CFSTR("DOWNLOAD_OFFLINE_RENEW"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:", CFSTR("DOWNLOAD_OFFLINE_RENEW_MESSAGE"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "alertControllerWithTitle:message:preferredStyle:", v25, v27, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = (void *)MEMORY[0x1E0DC3448];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:", CFSTR("OK"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_4;
        v87[3] = &unk_1E9F9A088;
        v88 = v77;
        objc_msgSend(v28, "actionWithTitle:style:handler:", v30, 1, v87);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "addAction:", v31);
      }
    }

  }
  else
  {
    if (v77)
      v77[2]();
    v22 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v62, "userInterfaceIdiom") == 1 && v22 != 0;

  if (v64)
  {
    objc_msgSend(v22, "setModalPresentationStyle:", 7);
    objc_msgSend(v22, "popoverPresentationController");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadShowTableViewController rightBarButtonItem](val, "rightBarButtonItem");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setBarButtonItem:", v66);

  }
  return v22;
}

void __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (*(_BYTE *)(a1 + 56))
      {
        objc_msgSend(*(id *)(a1 + 32), "assetController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fetchNewKeysForDownloadedVideo");

      }
      else
      {
        +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 32);
        objc_msgSend(v6, "assetController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "contentAllowsCellularDownload");
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_2;
        v10[3] = &unk_1E9F9A0B0;
        v11 = *(id *)(a1 + 32);
        objc_msgSend(v5, "preflightDownloadForLibraryMediaEntity:presentingViewController:contentAllowsCellularDownload:completion:", v6, WeakRetained, v8, v10);

      }
    }
    objc_msgSend(WeakRetained, "_exitEditingMode");
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
  }

}

void __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  id v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:", a3, a4, 0, 1, 0);

  }
}

void __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_exitEditingMode");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

}

uint64_t __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_5(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void (**v14)(id, _QWORD);
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  objc_msgSend(WeakRetained, "_exitEditingMode");
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(WeakRetained, "setAssetControllersToRemove:", v4);

  if (a1[4])
  {
    objc_msgSend(v3, "addObject:", a1[5]);
    objc_msgSend(a1[5], "assetController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "assetControllersToRemove");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(WeakRetained, "assetControllersToRemove");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "cancelAndRemoveDownload");
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  if (a1[4])
  {
    objc_msgSend(WeakRetained, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_6;
    v17[3] = &unk_1E9F99840;
    v18 = a1[6];
    v19 = a1[4];
    v20 = WeakRetained;
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_7;
    v15[3] = &unk_1E9F98E40;
    v15[4] = WeakRetained;
    v16 = a1[7];
    objc_msgSend(v12, "performBatchUpdates:completion:", v17, v15);

  }
  else
  {
    v14 = (void (**)(id, _QWORD))a1[7];
    if (v14)
      v14[2](v14, 0);
  }

}

void __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_6(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "removeObjectAtIndex:", objc_msgSend(a1[5], "row"));
  if (!objc_msgSend(a1[4], "count"))
  {
    objc_msgSend(a1[6], "groupings");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObjectAtIndex:", objc_msgSend(a1[5], "section"));

    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", objc_msgSend(a1[5], "section"));
    objc_msgSend(a1[6], "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteSections:withRowAnimation:", v3, 100);

  }
  objc_msgSend(a1[6], "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteRowsAtIndexPaths:withRowAnimation:", v6, 100);

}

uint64_t __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_popIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_exitEditingMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[VUIDownloadShowTableViewController rightBarButtonItem](self, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:animated:", 0, 1);

  -[VUIDownloadShowTableViewController rightBarButtonItem](self, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:", CFSTR("EDIT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  -[VUIDownloadShowTableViewController navigationItem](self, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadShowTableViewController backBarButtonItem](self, "backBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItem:", v8);

}

- (void)_popIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  -[VUIDownloadShowTableViewController groupings](self, "groupings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[VUIDownloadShowTableViewController navigationController](self, "navigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
}

- (id)_moreEpisodesURLForSection:(int64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", a3);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && -[VUIDownloadShowTableViewController _episodeHasAllCanonicalIDs:](self, "_episodeHasAllCanonicalIDs:", v9))
      {
        break;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    objc_msgSend(v9, "canonicalID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "seasonCanonicalID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showCanonicalID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0DC8808];
    v14 = objc_alloc_init(MEMORY[0x1E0DC8800]);
    objc_msgSend(v13, "_watchListAppPunchoutURLWithPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:allowPlayAction:isPlaybackURL:", v14, 3, v10, v12, v11, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_26;
  }
  else
  {
LABEL_10:

  }
  objc_msgSend(v4, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[VUIDownloadShowTableViewController seasons](self, "seasons");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v18 = *(_QWORD *)v29;
LABEL_14:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v18)
        objc_enumerationMutation(v17);
      v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v19);
      objc_msgSend(v20, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "seasonIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if ((v23 & 1) != 0)
        break;
      if (v15 == (void *)++v19)
      {
        v15 = (void *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v15)
          goto LABEL_14;
        goto LABEL_23;
      }
    }
    objc_msgSend(v20, "storeID");
    v24 = objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://itunes.apple.com/us/tv-season//id%@"), v24, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "URLWithString:", v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)v24;
      goto LABEL_23;
    }
    v15 = 0;
  }
  else
  {
LABEL_23:

  }
LABEL_26:

  return v15;
}

- (BOOL)_episodeHasAllCanonicalIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "canonicalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "seasonCanonicalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "showCanonicalID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_didPressGetMoreEpisodes:(id)a3
{
  void *v3;
  id v4;
  id v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0DC3470];
    v4 = a3;
    objc_msgSend(v3, "sharedApplication");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openURL:options:completionHandler:", v4, MEMORY[0x1E0C9AA70], 0);

  }
}

- (BOOL)_mediaItemShouldShowRenewOption:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;

  v3 = a3;
  objc_msgSend(v3, "availabilityEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadExpirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || objc_msgSend(v5, "vui_isInTheFuture"))
  {
    objc_msgSend(v3, "brandID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v8, "downloadConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "blacklistedEarlyRenewalBrands");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v8) = objc_msgSend(v10, "containsObject:", v7);
      if ((v8 & 1) != 0)
      {

LABEL_10:
        LOBYTE(v11) = 0;
        goto LABEL_11;
      }
    }

  }
  if (v4 && !objc_msgSend(v4, "vui_isInTheFuture"))
    goto LABEL_10;
  v11 = objc_msgSend(v3, "renewsOfflineKeysAutomatically") ^ 1;
LABEL_11:

  return v11;
}

- (void)_updateNavigationBarPadding
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  CGRect v26;

  v3 = (void *)MEMORY[0x1E0DC3F98];
  -[VUIDownloadShowTableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v26));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[VUIDownloadShowTableViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutMargins");
  if (v8 == v18 && v6 == v15 && v12 == v17)
  {
    v21 = v16;

    if (v10 == v21)
      return;
  }
  else
  {

  }
  -[VUIDownloadShowTableViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "navigationBar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLayoutMargins:", v6, v8, v10, v12);

  -[VUIDownloadShowTableViewController navigationController](self, "navigationController");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "navigationBar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsLayout");

}

- (void)_clearTableViewSelections:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  -[VUIDownloadShowTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VUIDownloadShowTableViewController transitionCoordinator](self, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__VUIDownloadShowTableViewController__clearTableViewSelections___block_invoke;
      v13[3] = &unk_1E9F98F00;
      v14 = v5;
      v15 = v7;
      v16 = a3;
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __64__VUIDownloadShowTableViewController__clearTableViewSelections___block_invoke_2;
      v10[3] = &unk_1E9F98F28;
      v11 = v14;
      v12 = v15;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", v13, v10);

    }
    else
    {
      objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v7, 1);
    }

  }
}

uint64_t __64__VUIDownloadShowTableViewController__clearTableViewSelections___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __64__VUIDownloadShowTableViewController__clearTableViewSelections___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  return result;
}

- (void)fullscreenPlaybackUIDidChangeNotification:(id)a3
{
  void *v4;
  char v5;

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFullscreenPlaybackUIBeingShown");

  if ((v5 & 1) == 0)
    -[VUIDownloadShowTableViewController _clearTableViewSelections:](self, "_clearTableViewSelections:", 1);
}

- (VUIDownloadShowDataSource)downloadDataSource
{
  return self->_downloadDataSource;
}

- (void)setDownloadDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_downloadDataSource, a3);
}

- (VUIMediaEntitiesDataSource)seasonsDataSource
{
  return self->_seasonsDataSource;
}

- (void)setSeasonsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_seasonsDataSource, a3);
}

- (VUIDownloadShowTableHeaderView)sizingHeader
{
  return self->_sizingHeader;
}

- (void)setSizingHeader:(id)a3
{
  objc_storeStrong((id *)&self->_sizingHeader, a3);
}

- (NSMutableArray)groupings
{
  return self->_groupings;
}

- (void)setGroupings:(id)a3
{
  objc_storeStrong((id *)&self->_groupings, a3);
}

- (UIBarButtonItem)rightBarButtonItem
{
  return self->_rightBarButtonItem;
}

- (void)setRightBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_rightBarButtonItem, a3);
}

- (UIBarButtonItem)leftBarButtonItem
{
  return self->_leftBarButtonItem;
}

- (void)setLeftBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_leftBarButtonItem, a3);
}

- (UIBarButtonItem)backBarButtonItem
{
  return self->_backBarButtonItem;
}

- (void)setBackBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_backBarButtonItem, a3);
}

- (NSArray)seasons
{
  return self->_seasons;
}

- (void)setSeasons:(id)a3
{
  objc_storeStrong((id *)&self->_seasons, a3);
}

- (NSMutableArray)assetControllersToRemove
{
  return self->_assetControllersToRemove;
}

- (void)setAssetControllersToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_assetControllersToRemove, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetControllersToRemove, 0);
  objc_storeStrong((id *)&self->_seasons, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_groupings, 0);
  objc_storeStrong((id *)&self->_sizingHeader, 0);
  objc_storeStrong((id *)&self->_seasonsDataSource, 0);
  objc_storeStrong((id *)&self->_downloadDataSource, 0);
}

- (void)tableView:(uint64_t)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "Unable to start playback because mediaInfo is nil; mediaEntity: %@",
    (uint8_t *)&v2,
    0xCu);
}

@end
