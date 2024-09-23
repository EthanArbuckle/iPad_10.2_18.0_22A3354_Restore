@implementation PXInboxViewController

- (PXInboxViewController)init
{
  void *v3;
  PXInboxViewController *v4;

  +[PXInboxViewController createInboxDataSourceManager](PXInboxViewController, "createInboxDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXInboxViewController initWithDataSourceManager:](self, "initWithDataSourceManager:", v3);

  return v4;
}

- (PXInboxViewController)initWithDataSourceManager:(id)a3
{
  id v5;
  PXInboxViewController *v6;
  PXInboxTableViewCellLayoutCoordinator *v7;
  PXInboxTableViewCellLayoutCoordinator *cellLayoutCoordinator;
  double v9;
  PXPhotoKitUIMediaProvider *v10;
  PXPhotoKitUIMediaProvider *mediaProvider;
  CGSize v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXInboxViewController;
  v6 = -[PXInboxViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    v7 = objc_alloc_init(PXInboxTableViewCellLayoutCoordinator);
    cellLayoutCoordinator = v6->_cellLayoutCoordinator;
    v6->_cellLayoutCoordinator = v7;

    +[PXInboxTableViewCellLayoutCoordinator dynamicCellHeight](PXInboxTableViewCellLayoutCoordinator, "dynamicCellHeight");
    v6->_currentRowHeight = v9;
    v10 = objc_alloc_init(PXPhotoKitUIMediaProvider);
    mediaProvider = v6->_mediaProvider;
    v6->_mediaProvider = v10;

    v6->_dataSourceIndexRange.location = 0;
    v6->_dataSourceIndexRange.length = 0;
    v12 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v6->_visibleContentRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v6->_visibleContentRect.size = v12;
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](v6->_dataSourceManager, "registerChangeObserver:context:", v6, PXDataSourceManagerObservationContext_107788);
  }

  return v6;
}

- (void)setLastSeenDate:(id)a3
{
  NSDate *v5;
  NSDate *v6;

  v5 = (NSDate *)a3;
  if (self->_lastSeenDate != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_lastSeenDate, a3);
    -[PXInboxViewController _updateSeenState](self, "_updateSeenState");
    v5 = v6;
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXInboxViewController;
  -[PXInboxViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PXInboxViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXForYouInboxTitle"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXInboxViewController setTitle:](self, "setTitle:", v4);

  -[PXInboxViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v3, "addSubview:", v5);
  objc_msgSend(v5, "reloadData");
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logForYouInboxViewedCount");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  -[PXInboxViewController _updateTableViewFrameAndBounds](self, "_updateTableViewFrameAndBounds");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXInboxViewController;
  -[PXInboxViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PXInboxViewController setVisible:](self, "setVisible:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXInboxViewController;
  -[PXInboxViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PXInboxViewController setVisible:](self, "setVisible:", 0);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXInboxViewController;
  -[PXInboxViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PXInboxViewController _updateTableViewFrameAndBounds](self, "_updateTableViewFrameAndBounds");
}

- (void)setDataSourceIndexRange:(_NSRange)a3
{
  void *v5;
  id v6;

  if (a3.location != self->_dataSourceIndexRange.location || a3.length != self->_dataSourceIndexRange.length)
  {
    self->_dataSourceIndexRange = a3;
    if (-[PXInboxViewController isVisible](self, "isVisible"))
    {
      if (-[PXInboxViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[PXInboxViewController tableView](self, "tableView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "reloadData");

        -[PXInboxViewController delegate](self, "delegate");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "gadget:didChange:", self, 64);

      }
    }
  }
}

- (UITableView)tableView
{
  UITableView *tableView;
  id v4;
  UITableView *v5;
  UITableView *v6;
  UITableView *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3D48]);
    v5 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_tableView;
    self->_tableView = v5;
    v7 = v5;

    -[UITableView setDelegate:](v7, "setDelegate:", self);
    -[UITableView setDataSource:](v7, "setDataSource:", self);
    -[PXInboxViewController _createDividerView](self, "_createDividerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setTableHeaderView:](v7, "setTableHeaderView:", v8);

    -[PXInboxViewController _createTransparentFullWidthViewOfHeight:](self, "_createTransparentFullWidthViewOfHeight:", 5.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setTableFooterView:](v7, "setTableFooterView:", v9);

    -[UITableView setCellLayoutMarginsFollowReadableWidth:](v7, "setCellLayoutMarginsFollowReadableWidth:", 0);
    -[UITableView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    -[UITableView setScrollEnabled:](v7, "setScrollEnabled:", 0);
    -[UITableView setClipsToBounds:](v7, "setClipsToBounds:", 0);
    -[UITableView setShowsVerticalScrollIndicator:](v7, "setShowsVerticalScrollIndicator:", 0);
    -[UITableView setShowsHorizontalScrollIndicator:](v7, "setShowsHorizontalScrollIndicator:", 0);
    -[PXInboxViewController gadgetSpec](self, "gadgetSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentInsets");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    PXEdgeInsetsMake();
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    -[UITableView setLayoutMargins:](v7, "setLayoutMargins:", v12, v14, v16, v18);
    -[UITableView setSeparatorInset:](v7, "setSeparatorInset:", v20, v22, v24, v26);
    -[UITableView registerClass:forCellReuseIdentifier:](v7, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXInboxTableViewCellReuseIdentifier"));

    tableView = self->_tableView;
  }
  return tableView;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXInboxViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  -[PXInboxViewController _dataSourceIndexPathFromTableViewIndexPath:](self, "_dataSourceIndexPathFromTableViewIndexPath:", v7);
  *(_OWORD *)buf = 0u;
  v29 = 0u;
  objc_msgSend(v8, "modelAtIndexPath:", buf);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "providerSourceForModel:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detailViewControllerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXInboxViewController setLastSelectedModel:](self, "setLastSelectedModel:", v9);
  v12 = objc_msgSend(v11, "presentationTypeForInboxModel:", v9);
  switch(v12)
  {
    case 0:
      objc_msgSend(v11, "viewControllerForInboxModel:fromViewController:", v9, self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[PXInboxViewController navigationController](self, "navigationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pushViewController:animated:", v13, 1);

      }
      goto LABEL_12;
    case 2:
      PXNavigableSharedAlbumActivityFeedHostViewControllerForGadget(self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        PXAssertGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = self;
          _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "couldn't find PXNavigableSharedAlbumActivityFeedHostViewController for %@", buf, 0xCu);
        }

      }
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __59__PXInboxViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v23[3] = &unk_1E5127288;
      v24 = v11;
      v25 = v9;
      objc_msgSend(v13, "navigateToSharedAlbumActivityFeedAnimated:configuration:completion:", 1, v23, 0);
      +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logForYouNavigatedToSharedAlbumActivityViewFromRecentActivityEntry");

      objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.navigatedToSharedAlbumActivityViewFromRecentActivityEntry"), MEMORY[0x1E0C9AA70]);
LABEL_12:

      break;
    case 1:
      -[PXInboxViewController _startOneUpPresentationForModel:](self, "_startOneUpPresentationForModel:", v9);
      break;
  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 0);
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logForYouInboxItemSelectedWithType:", objc_msgSend(v9, "inboxModelType"));

  v18 = objc_msgSend(v9, "inboxModelType") - 1;
  if (v18 >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.forYouInboxItemSelected"), MEMORY[0x1E0C9AA70]);
  }
  else
  {
    v19 = (uint64_t)*(&off_1E51491E0 + v18);
    v20 = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.forYouInboxItemSelected"), MEMORY[0x1E0C9AA70]);
    v21 = (void *)MEMORY[0x1E0D09910];
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.forYouInboxItemSelectedWithType%@"), v19);
    objc_msgSend(v21, "sendEvent:withPayload:", v22, v20);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  _OWORD buf[2];
  __int128 v42;
  __int128 v43;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PXInboxTableViewCellReuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXInboxViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  -[PXInboxViewController _dataSourceIndexPathFromTableViewIndexPath:](self, "_dataSourceIndexPathFromTableViewIndexPath:", v6);

  buf[0] = v42;
  buf[1] = v43;
  objc_msgSend(v8, "modelAtIndexPath:", buf);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "setModel:", v9);
    -[PXInboxViewController cellLayoutCoordinator](self, "cellLayoutCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLayoutCoordinator:", v10);

    objc_msgSend(v7, "setUnseen:", -[PXInboxViewController _isModelUnseen:](self, "_isModelUnseen:", v9));
    v11 = objc_msgSend(v7, "tag") + 1;
    objc_msgSend(v7, "setTag:", v11);
    objc_msgSend(v8, "providerSourceForModel:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject titleProvider](v12, "titleProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    if (v13)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __57__PXInboxViewController_tableView_cellForRowAtIndexPath___block_invoke;
      v38[3] = &unk_1E51272B0;
      v40 = v11;
      v39 = v7;
      objc_msgSend(v13, "requestTitleAndSubtitleForModel:completion:", v9, v38);

    }
    -[NSObject mediaProvider](v12, "mediaProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");

    objc_msgSend(v7, "thumbnailView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PXSizeScale();
    v19 = v18;
    v21 = v20;
    aBlock[0] = v14;
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PXInboxViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    aBlock[3] = &unk_1E5127328;
    v22 = v17;
    v32 = v22;
    v23 = v15;
    v33 = v23;
    v35 = v19;
    v36 = v21;
    v37 = v11;
    v24 = v7;
    v34 = v24;
    v25 = _Block_copy(aBlock);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v29[0] = v14;
      v29[1] = 3221225472;
      v29[2] = __57__PXInboxViewController_tableView_cellForRowAtIndexPath___block_invoke_6;
      v29[3] = &unk_1E5127350;
      v30 = v25;
      objc_msgSend(v9, "fetchLeftPreviewItemsWithCompletion:", v29);
      v26 = v30;
    }
    else
    {
      objc_msgSend(v9, "leftPreviewItems");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *))v25 + 2))(v25, v26);
    }

    v27 = v24;
  }
  else
  {
    PFUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Empty Inbox Model (Feed Section) Information!", (uint8_t *)buf, 2u);
    }
  }

  return v7;
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
  v9.super_class = (Class)PXInboxViewController;
  v7 = a4;
  -[PXInboxViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PXInboxViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5148240;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  id v4;

  if (-[PXInboxViewController isViewLoaded](self, "isViewLoaded", a3))
  {
    -[PXInboxViewController currentRowHeight](self, "currentRowHeight");
    +[PXInboxTableViewCellLayoutCoordinator dynamicCellHeight](PXInboxTableViewCellLayoutCoordinator, "dynamicCellHeight");
    -[PXInboxViewController setCurrentRowHeight:](self, "setCurrentRowHeight:");
    -[PXInboxViewController currentRowHeight](self, "currentRowHeight");
    if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      -[PXInboxViewController tableView](self, "tableView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "beginUpdates");
      objc_msgSend(v4, "endUpdates");

    }
  }
}

- (unint64_t)gadgetType
{
  return 15;
}

- (unint64_t)gadgetCapabilities
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v5 = -[PXInboxViewController _numberOfRows](self, "_numberOfRows", a3.width, a3.height);
  -[PXInboxViewController currentRowHeight](self, "currentRowHeight");
  v7 = v6 * (double)v5 + 5.0;
  -[PXInboxViewController _dividerHeight](self, "_dividerHeight");
  v9 = v7 + v8;
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  void *v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  PXGadgetSpec *v24;

  v24 = (PXGadgetSpec *)a3;
  v5 = self->_gadgetSpec;
  v6 = v24;
  if (v5 == v24)
    goto LABEL_5;
  v7 = -[PXGadgetSpec isEqual:](v24, "isEqual:", v5);

  if (!v7)
  {
    objc_storeStrong((id *)&self->_gadgetSpec, a3);
    if (-[PXInboxViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PXGadgetSpec contentInsets](v24, "contentInsets");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      PXEdgeInsetsMake();
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      -[PXInboxViewController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLayoutMargins:", v9, v11, v13, v15);
      objc_msgSend(v6, "setSeparatorInset:", v17, v19, v21, v23);
LABEL_5:

    }
  }

}

- (void)setVisibleContentRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_visibleContentRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_visibleContentRect = &self->_visibleContentRect;
  if (!CGRectEqualToRect(a3, self->_visibleContentRect))
  {
    p_visibleContentRect->origin.x = x;
    p_visibleContentRect->origin.y = y;
    p_visibleContentRect->size.width = width;
    p_visibleContentRect->size.height = height;
    -[PXInboxViewController _updateTableViewFrameAndBounds](self, "_updateTableViewFrameAndBounds");
  }
}

- (PXInboxAggregateDataSource)dataSource
{
  PXInboxAggregateDataSource *dataSource;
  void *v4;
  PXInboxAggregateDataSource *v5;
  PXInboxAggregateDataSource *v6;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    -[PXInboxViewController dataSourceManager](self, "dataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSource");
    v5 = (PXInboxAggregateDataSource *)objc_claimAutoreleasedReturnValue();
    v6 = self->_dataSource;
    self->_dataSource = v5;

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (void)_updateTableViewFrameAndBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double MinY;
  double v16;
  double Width;
  double v18;
  double Height;
  id v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if (-[PXInboxViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PXInboxViewController visibleContentRect](self, "visibleContentRect");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[PXInboxViewController tableView](self, "tableView");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    if (CGRectIsNull(v21))
    {
      -[PXInboxViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v13 = v12;
      MinY = v14;
      Width = v16;
      Height = v18;
    }
    else
    {
      v22.origin.x = v4;
      v22.origin.y = v6;
      v22.size.width = v8;
      v22.size.height = v10;
      MinY = CGRectGetMinY(v22);
      -[PXInboxViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      Width = CGRectGetWidth(v23);
      v24.origin.x = v4;
      v24.origin.y = v6;
      v24.size.width = v8;
      v24.size.height = v10;
      Height = CGRectGetHeight(v24);
      v13 = 0.0;
    }

    objc_msgSend(v20, "setFrame:", v13, MinY, Width, Height);
    objc_msgSend(v20, "setBounds:", v13, MinY, Width, Height);

  }
}

- (unint64_t)_numberOfRows
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v8;

  -[PXInboxViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);

  if (-[PXInboxViewController _shouldHandleAllIndexes](self, "_shouldHandleAllIndexes"))
    return v4;
  v5 = -[PXInboxViewController dataSourceIndexRange](self, "dataSourceIndexRange");
  if (v5 + v6 <= v4)
  {
    -[PXInboxViewController dataSourceIndexRange](self, "dataSourceIndexRange");
    return v8;
  }
  if (v4 >= v5)
    return v4 - v5;
  else
    return 0;
}

- (id)_createDividerView
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
  _PXInboxDividerView *v13;
  CGRect v15;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");

  -[PXInboxViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  CGRectGetWidth(v15);
  -[PXInboxViewController _dividerHeight](self, "_dividerHeight");
  PXRectRoundToPixel();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = -[_PXInboxDividerView initWithFrame:]([_PXInboxDividerView alloc], "initWithFrame:", v6, v8, v10, v12);
  -[_PXInboxDividerView setAutoresizingMask:](v13, "setAutoresizingMask:", 2);
  -[_PXInboxDividerView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
  return v13;
}

- (double)_dividerHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return 1.0 / v4;
}

- (id)_createTransparentFullWidthViewOfHeight:(double)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CGRect v10;

  v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[PXInboxViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = (void *)objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v10), a3);

  objc_msgSend(v7, "setAutoresizingMask:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setUserInteractionEnabled:", 0);
  return v7;
}

- (PXSimpleIndexPath)_dataSourceIndexPathFromTableViewIndexPath:(SEL)a3
{
  int64_t v6;
  _BOOL4 v7;
  int64_t v8;
  uint64_t v9;
  PXSimpleIndexPath *result;
  id v11;

  v6 = objc_msgSend(a4, "item");
  v7 = -[PXInboxViewController _shouldHandleAllIndexes](self, "_shouldHandleAllIndexes");
  -[PXInboxViewController dataSource](self, "dataSource");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  if (v7)
  {
    v8 = objc_msgSend(v11, "identifier");
  }
  else
  {
    v9 = -[PXInboxViewController dataSourceIndexRange](self, "dataSourceIndexRange");
    v8 = objc_msgSend(v11, "identifier");
    v6 += v9;
  }
  retstr->dataSourceIdentifier = v8;
  retstr->section = 0;
  retstr->item = v6;
  retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;

  return result;
}

- (id)_tableViewIndexPathFromDataSourceIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t item;

  item = a3->item;
  if (!-[PXInboxViewController _shouldHandleAllIndexes](self, "_shouldHandleAllIndexes"))
    item -= -[PXInboxViewController dataSourceIndexRange](self, "dataSourceIndexRange");
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", item, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_shouldHandleAllIndexes
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[PXInboxViewController dataSourceIndexRange](self, "dataSourceIndexRange");
  return (v2 | v3) == 0;
}

- (void)_dismissDetailViewsIfNeededWithPreviousDataSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  -[PXInboxViewController lastSelectedModel](self, "lastSelectedModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXInboxViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PXInboxViewController isVisible](self, "isVisible"))
    {
      objc_msgSend(v5, "models");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "containsObject:", v4);

      if ((v7 & 1) == 0)
      {
        objc_msgSend(v13, "providerSourceForModel:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "detailViewControllerProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "presentationTypeForInboxModel:", v4) == 0;

        -[PXInboxViewController navigationController](self, "navigationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v11, "popToRootViewControllerAnimated:", v10);

        -[PXInboxViewController setLastSelectedModel:](self, "setLastSelectedModel:", 0);
      }
    }

  }
}

- (BOOL)_isModelUnseen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;

  v4 = a3;
  -[PXInboxViewController lastSeenDate](self, "lastSeenDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "creationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v8 = fabs(v7) >= 0.000001 && v7 > 0.0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updateSeenState
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;

  if (-[PXInboxViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PXInboxViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v14 = v3;
      v4 = -[PXInboxViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v3, 0);
      -[PXInboxViewController dataSource](self, "dataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PXInboxViewController dataSourceIndexRange](self, "dataSourceIndexRange");
      if (v4)
      {
        v7 = v6;
        for (i = 0; i != v4; ++i)
        {
          objc_msgSend(v5, "models");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", v7 + i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = -[PXInboxViewController _isModelUnseen:](self, "_isModelUnseen:", v10);
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "cellForRowAtIndexPath:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 != objc_msgSend(v13, "isUnseen"))
            objc_msgSend(v13, "setUnseen:", v11);

        }
      }

      v3 = v14;
    }

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXDataSourceManagerObservationContext_107788 == a5)
    px_dispatch_on_main_queue();
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 0;
}

- (void)_startOneUpPresentationForModel:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXInboxViewController.m"), 689, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXInboxViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gadgetTransition");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("transition"), v11);
LABEL_7:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("transition"), v11, v13, v15);

    goto LABEL_7;
  }
LABEL_4:

  objc_msgSend(v6, "oneUpPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "startWithConfigurationHandler:", 0);

}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PXPhotosDataSourceConfiguration *v12;
  PXPhotosDataSource *v13;
  PXPhotoKitAssetsDataSourceManager *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[PXInboxViewController lastSelectedModel](self, "lastSelectedModel", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXInboxViewController.m"), 701, CFSTR("%@ attempted to present 1-Up without a selected model"), self);

  }
  objc_msgSend(v5, "assetsForOneUp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CD14E0];
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transientCollectionListWithCollections:title:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v11, 0);
  v13 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v12);
  v14 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v13);

  return v14;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  _OWORD v23[2];
  __int128 v24;
  __int128 v25;

  v5 = a4;
  -[PXInboxViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXInboxViewController lastSelectedModel](self, "lastSelectedModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  -[PXInboxViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "indexPathForModel:", v7);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }

  v23[0] = v24;
  v23[1] = v25;
  -[PXInboxViewController _tableViewIndexPathFromDataSourceIndexPath:](self, "_tableViewIndexPathFromDataSourceIndexPath:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "thumbnailView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftPreviewItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v13, "indexOfObject:", v14);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = v12;
    objc_msgSend(v16, "bounds");
    PXRectGetCenter();
    PXRectWithCenterAndSize();
  }
  else
  {
    objc_msgSend(v12, "imageViewForItemAtIndex:", v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
  }
  v21 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4620), "initWithRect:inCoordinateSpace:", v16, v17, v18, v19, v20);

  return v21;
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;

  v5 = a4;
  -[PXInboxViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXInboxViewController lastSelectedModel](self, "lastSelectedModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  -[PXInboxViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "indexPathForModel:", v7);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }

  v24[0] = v25;
  v24[1] = v26;
  -[PXInboxViewController _tableViewIndexPathFromDataSourceIndexPath:](self, "_tableViewIndexPathFromDataSourceIndexPath:", v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  objc_msgSend(v6, "cellForRowAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v7;
  objc_msgSend(v7, "leftPreviewItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v5;
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("asset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "count");
  if (v14 >= 3)
    v15 = 3;
  else
    v15 = v14;
  if (v15)
  {
    for (i = 0; i != v15; ++i)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v13, "containsObject:", v17);
      objc_msgSend(v11, "thumbnailView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageViewForItemAtIndex:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setHidden:", v18);
    }
  }

}

- (void)ppt_performBlockAfterLoadingCompletes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PXInboxViewController dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXInboxViewController setDataSource:](self, "setDataSource:", v5);

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)accessoryButtonType
{
  return self->_accessoryButtonType;
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (CGRect)visibleContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleContentRect.origin.x;
  y = self->_visibleContentRect.origin.y;
  width = self->_visibleContentRect.size.width;
  height = self->_visibleContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (_NSRange)dataSourceIndexRange
{
  _NSRange *p_dataSourceIndexRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_dataSourceIndexRange = &self->_dataSourceIndexRange;
  location = self->_dataSourceIndexRange.location;
  length = p_dataSourceIndexRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (PXInboxAggregateDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (PXInboxTableViewCellLayoutCoordinator)cellLayoutCoordinator
{
  return self->_cellLayoutCoordinator;
}

- (void)setCellLayoutCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_cellLayoutCoordinator, a3);
}

- (double)currentRowHeight
{
  return self->_currentRowHeight;
}

- (void)setCurrentRowHeight:(double)a3
{
  self->_currentRowHeight = a3;
}

- (PXPhotoKitUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, a3);
}

- (PXInboxModel)lastSelectedModel
{
  return self->_lastSelectedModel;
}

- (void)setLastSelectedModel:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedModel, a3);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelectedModel, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_cellLayoutCoordinator, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __54__PXInboxViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  BOOL v41;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_shouldHandleAllIndexes");
  if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "changeHistory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v5, "identifier"), objc_msgSend(v6, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v2)
        goto LABEL_4;
    }
    else
    {
      v10 = 0;
      if (!v2)
      {
LABEL_4:
        v29 = v4;
        v11 = objc_msgSend(*(id *)(a1 + 32), "dataSourceIndexRange");
        v13 = v12;
        v30 = v3;
        v14 = objc_msgSend(*(id *)(a1 + 32), "tableView:numberOfRowsInSection:", v3, 0);
        v15 = objc_msgSend(v6, "numberOfItemsInSection:", 0);
        v16 = v15 - v11;
        if (v15 < v11)
          v16 = 0;
        if (v11 + v13 <= v15)
          v17 = v13;
        else
          v17 = v16;
        v31 = v10;
        objc_msgSend(v10, "itemChangesInSection:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "hasIncrementalChanges");

        if (!v19)
        {
          objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
        if (v14)
        {
          objc_msgSend(v5, "models");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "subarrayWithRange:", v11, v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
LABEL_12:
            objc_msgSend(v6, "models");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "subarrayWithRange:", v11, v17);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
            objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v21, v23, MEMORY[0x1E0C9AA60]);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
            v25 = v14 != v17;
            v4 = v29;
            v3 = v30;
            v10 = v31;
            if (!v24)
              goto LABEL_24;
LABEL_21:
            if (objc_msgSend(v24, "hasIncrementalChanges")
              && objc_msgSend(*(id *)(a1 + 32), "isVisible"))
            {
              v37[0] = MEMORY[0x1E0C809B0];
              v37[1] = 3221225472;
              v37[2] = __54__PXInboxViewController_observable_didChange_context___block_invoke_2;
              v37[3] = &unk_1E5134020;
              v37[4] = *(_QWORD *)(a1 + 32);
              v38 = v6;
              v39 = v24;
              v40 = v3;
              v41 = v25;
              v32[0] = MEMORY[0x1E0C809B0];
              v32[1] = 3221225472;
              v32[2] = __54__PXInboxViewController_observable_didChange_context___block_invoke_4;
              v32[3] = &unk_1E5127378;
              v33 = v39;
              v26 = v40;
              v27 = *(_QWORD *)(a1 + 32);
              v34 = v26;
              v35 = v27;
              v36 = v5;
              objc_msgSend(v26, "performBatchUpdates:completion:", v37, v32);

LABEL_26:
              return;
            }
LABEL_24:
            objc_msgSend(*(id *)(a1 + 32), "setDataSource:", v6);
            objc_msgSend(v3, "reloadData");
            objc_msgSend(*(id *)(a1 + 32), "_dismissDetailViewsIfNeededWithPreviousDataSource:", v5);
            if (v25)
            {
              objc_msgSend(*(id *)(a1 + 32), "delegate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "gadget:didChange:", *(_QWORD *)(a1 + 32), 64);

            }
            goto LABEL_26;
          }
        }
        else
        {
          v21 = (void *)MEMORY[0x1E0C9AA60];
          if (v17)
            goto LABEL_12;
        }
        v23 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_19;
      }
    }
    objc_msgSend(v10, "itemChangesInSection:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    if (!v24)
      goto LABEL_24;
    goto LABEL_21;
  }
}

void __54__PXInboxViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setDataSource:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "removedIndexes");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v7, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "deleteRowsAtIndexPaths:withRowAnimation:", v2, 0);

  }
  objc_msgSend(*(id *)(a1 + 48), "insertedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "insertRowsAtIndexPaths:withRowAnimation:", v4, 0);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PXInboxViewController_observable_didChange_context___block_invoke_3;
  v8[3] = &unk_1E512E020;
  v5 = *(void **)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v5, "enumerateMovedIndexesUsingBlock:", v8);
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gadget:didChange:", *(_QWORD *)(a1 + 32), 64);

  }
}

void __54__PXInboxViewController_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "changedIndexes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v3, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "reloadRowsAtIndexPaths:withRowAnimation:", v2, 0);

  }
  objc_msgSend(*(id *)(a1 + 48), "_dismissDetailViewsIfNeededWithPreviousDataSource:", *(_QWORD *)(a1 + 56));

}

void __54__PXInboxViewController_observable_didChange_context___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "moveRowAtIndexPath:toIndexPath:", v6, v5);

}

void __76__PXInboxViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[PXInboxTableViewCellLayoutCoordinator dynamicCellHeight](PXInboxTableViewCellLayoutCoordinator, "dynamicCellHeight");
  objc_msgSend(*(id *)(a1 + 32), "setCurrentRowHeight:");
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForVisibleRows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadRowsAtIndexPaths:withRowAnimation:", v3, 5);

}

void __57__PXInboxViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 == objc_msgSend(*(id *)(a1 + 32), "tag"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setTitle:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", v5);
  }

}

void __57__PXInboxViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  __int128 v10;
  uint64_t v11;

  v5 = a2;
  if ((unint64_t)objc_msgSend(v5, "count") < 4)
  {
    v4 = v5;
  }
  else
  {
    objc_msgSend(v5, "subarrayWithRange:", 0, 3);
    v3 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v3;
  }
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfItems:", objc_msgSend(v4, "count", v4));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PXInboxViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
  v7[3] = &unk_1E5127300;
  v8 = *(id *)(a1 + 40);
  v10 = *(_OWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __57__PXInboxViewController_tableView_cellForRowAtIndexPath___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PXInboxViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PXInboxViewController_tableView_cellForRowAtIndexPath___block_invoke_4;
  v7[3] = &unk_1E51272D8;
  v9 = *(_QWORD *)(a1 + 64);
  v6 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v10 = a3;
  objc_msgSend(v6, "requestImageForPreviewItem:targetSize:resultHandler:", a2, v7, *(double *)(a1 + 48), *(double *)(a1 + 56));

}

void __57__PXInboxViewController_tableView_cellForRowAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  px_dispatch_on_main_queue();

}

void __57__PXInboxViewController_tableView_cellForRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2 == objc_msgSend(*(id *)(a1 + 40), "tag"))
    {
      objc_msgSend(*(id *)(a1 + 40), "thumbnailView");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setImage:forItemAtIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

    }
  }
}

void __59__PXInboxViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "navigateToInboxModel:inSharedAlbumActivityFeedViewController:", *(_QWORD *)(a1 + 40), v3);

}

+ (PXInboxAggregateDataSourceManager)createInboxDataSourceManager
{
  PXSAInboxDataSourceManager *v2;
  PXInboxAggregateDataSourceManager *v3;
  void *v4;
  PXInboxAggregateDataSourceManager *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PXSAInboxDataSourceManager);
  v3 = [PXInboxAggregateDataSourceManager alloc];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXInboxAggregateDataSourceManager initWithDataSourceManagers:](v3, "initWithDataSourceManagers:", v4);

  return v5;
}

+ (void)preloadResources
{
  +[PXInboxTableViewCell preloadResources](PXInboxTableViewCell, "preloadResources");
  +[PXSAInboxTitleProvider preloadResources](PXSAInboxTitleProvider, "preloadResources");
}

@end
