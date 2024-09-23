@implementation PXCuratedAssetCollectionDiagnosticsViewController

- (PXCuratedAssetCollectionDiagnosticsViewController)init
{
  PXCuratedAssetCollectionDiagnosticsViewController *v2;
  uint64_t v3;
  NSMutableArray *addedAssets;
  uint64_t v5;
  NSMutableArray *removedAssets;
  PHCachingImageManager *v7;
  PHCachingImageManager *imageManager;
  uint64_t v9;
  NSURL *screenshotURL;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *curationDebugFetchQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXCuratedAssetCollectionDiagnosticsViewController;
  v2 = -[PXCuratedAssetCollectionDiagnosticsViewController init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    addedAssets = v2->_addedAssets;
    v2->_addedAssets = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    removedAssets = v2->_removedAssets;
    v2->_removedAssets = (NSMutableArray *)v5;

    v7 = (PHCachingImageManager *)objc_alloc_init(MEMORY[0x1E0CD1488]);
    imageManager = v2->_imageManager;
    v2->_imageManager = v7;

    v2->_currentCurationType = 3;
    +[PXFeedbackTapToRadarUtilities captureScreenshot](PXFeedbackTapToRadarUtilities, "captureScreenshot");
    v9 = objc_claimAutoreleasedReturnValue();
    screenshotURL = v2->_screenshotURL;
    v2->_screenshotURL = (NSURL *)v9;

    v2->_shouldPresentTapToRadar = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.library.curationDebug", v11);
    curationDebugFetchQueue = v2->_curationDebugFetchQueue;
    v2->_curationDebugFetchQueue = (OS_dispatch_queue *)v12;

    -[PXCuratedAssetCollectionDiagnosticsViewController requestCurationDebugInfoWithOptions:setGlobally:](v2, "requestCurationDebugInfoWithOptions:setGlobally:", 0, 0);
  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UISegmentedControl *v7;
  UISegmentedControl *segmentedControl;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *contentView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  UITableView *v26;
  UITableView *tableView;
  id v28;
  id v29;
  UICollectionView *v30;
  UICollectionView *collectionView;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)PXCuratedAssetCollectionDiagnosticsViewController;
  -[PXCuratedAssetCollectionDiagnosticsViewController viewDidLoad](&v42, sel_viewDidLoad);
  -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[PXCuratedAssetCollectionDiagnosticsViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToolbarHidden:animated:", 1, 0);

  v7 = (UISegmentedControl *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", &unk_1E53E94C8);
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v7;

  -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, sel__switchLogsAction_, 4096);
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", self->_initiallyShowCuration);
  -[UISegmentedControl setHidden:](self->_segmentedControl, "setHidden:", 1);
  -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_segmentedControl);

  -[UISegmentedControl topAnchor](self->_segmentedControl, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v13, 10.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  contentView = self->_contentView;
  self->_contentView = v15;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_contentView);

  _NSDictionaryOfVariableBindings(CFSTR("_segmentedControl, _contentView"), self->_segmentedControl, self->_contentView, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_segmentedControl(<=44)]-10-[_contentView]-0-|"), 0, 0, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraints:", v20);

  -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_segmentedControl]-|"), 0, 0, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addConstraints:", v22);

  -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_contentView]|"), 0, 0, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addConstraints:", v24);

  v25 = objc_alloc(MEMORY[0x1E0DC3D48]);
  -[UIView frame](self->_contentView, "frame");
  v26 = (UITableView *)objc_msgSend(v25, "initWithFrame:style:", 1);
  tableView = self->_tableView;
  self->_tableView = v26;

  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView setHidden:](self->_tableView, "setHidden:", 1);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 0);
  -[UITableView setContentInsetAdjustmentBehavior:](self->_tableView, "setContentInsetAdjustmentBehavior:", 2);
  v28 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v29 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[UIView frame](self->_contentView, "frame");
  v30 = (UICollectionView *)objc_msgSend(v29, "initWithFrame:collectionViewLayout:", v28);
  collectionView = self->_collectionView;
  self->_collectionView = v30;

  -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  -[UICollectionView setHidden:](self->_collectionView, "setHidden:", 1);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v32);

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PXCuratedAssetCollectionCellReuseIdentifier"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("PXCuratedAssetCollectionSectionHeaderReuseIdentifier"));
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", self, sel_changeCurationType_);
  objc_msgSend(v33, "setDirection:", 2);
  -[UICollectionView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", v33);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", self, sel_changeCurationType_);

  objc_msgSend(v34, "setDirection:", 1);
  -[UICollectionView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", v34);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_showCurationSettings_);
  objc_msgSend(v35, "setNumberOfTouchesRequired:", 2);
  objc_msgSend(v35, "setNumberOfTapsRequired:", 2);
  objc_msgSend(v35, "setDelaysTouchesEnded:", 1);
  -[UICollectionView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", v35);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_tableView);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_collectionView);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Close"), 2, self, sel__closeAction_);
  -[PXCuratedAssetCollectionDiagnosticsViewController navigationItem](self, "navigationItem");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setLeftBarButtonItem:", v36);

  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Radar"), 2, self, sel__tapToRadar_);
  -[PXCuratedAssetCollectionDiagnosticsViewController navigationItem](self, "navigationItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setRightBarButtonItem:", v38);

  -[PXCuratedAssetCollectionDiagnosticsViewController navigationItem](self, "navigationItem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rightBarButtonItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setEnabled:", 0);

  -[PXCuratedAssetCollectionDiagnosticsViewController _switchLogsAction:](self, "_switchLogsAction:", 0);
}

- (void)showToolbarItems
{
  void *v3;
  int64_t currentCurationType;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  currentCurationType = self->_currentCurationType;
  if (currentCurationType == 3)
  {
    if (self->_curationComparisonEnabled)
      v7 = 18;
    else
      v7 = 17;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", v7, self, sel_toggleCurationComparison_);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__editSettings_);
    v10[0] = v3;
    v10[1] = v5;
    v10[2] = v3;
    v10[3] = v6;
    v10[4] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedAssetCollectionDiagnosticsViewController setToolbarItems:](self, "setToolbarItems:", v8);

    goto LABEL_8;
  }
  if (!currentCurationType)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 11, self, sel_showInfo_);
    v11[0] = v3;
    v11[1] = v5;
    v11[2] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedAssetCollectionDiagnosticsViewController setToolbarItems:](self, "setToolbarItems:", v6);
LABEL_8:

  }
  -[PXCuratedAssetCollectionDiagnosticsViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setToolbarHidden:animated:", 0, 1);

}

- (void)hideToolbarItems
{
  id v3;

  -[PXCuratedAssetCollectionDiagnosticsViewController setToolbarItems:](self, "setToolbarItems:", MEMORY[0x1E0C9AA60]);
  -[PXCuratedAssetCollectionDiagnosticsViewController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToolbarHidden:animated:", 1, 1);

}

- (void)toggleCurationComparison:(id)a3
{
  void *v4;
  PXCuratedAssetCollectionDiagnosticsViewController *v5;

  self->_curationComparisonEnabled ^= 1u;
  -[PXCuratedAssetCollectionDiagnosticsViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (PXCuratedAssetCollectionDiagnosticsViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    -[PXCuratedAssetCollectionDiagnosticsViewController showToolbarItems](self, "showToolbarItems");
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
}

- (void)showInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0DC3450];
  -[NSDictionary objectForKeyedSubscript:](self->_curationDebugInformation, "objectForKeyedSubscript:", CFSTR("keyAssetCurationCriteria"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Key Asset"), v5, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Dismiss"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v6);

  -[PXCuratedAssetCollectionDiagnosticsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXCuratedAssetCollectionDiagnosticsViewController;
  -[PXCuratedAssetCollectionDiagnosticsViewController viewWillAppear:](&v15, sel_viewWillAppear_, a3);
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;

  v8 = floor(v7 * 0.25);
  +[PXDiagnosticsCurationViewCell cellHeightWithCellWidth:](PXDiagnosticsCurationViewCell, "cellHeightWithCellWidth:", v8);
  objc_msgSend(v4, "setItemSize:", v8, v9);
  objc_msgSend(v4, "setMinimumInteritemSpacing:", 0.0);
  objc_msgSend(v4, "setMinimumLineSpacing:", 1.0);
  objc_msgSend(v4, "setSectionInset:", 0.0, (double)((unint64_t)(v7 + v8 * -4.0) >> 1), 0.0, (double)(unint64_t)(v7 + v8 * -4.0) - (double)((unint64_t)(v7 + v8 * -4.0) >> 1));
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;

  objc_msgSend(v4, "itemSize");
  self->_thumbnailSize.width = v12 * v13;
  self->_thumbnailSize.height = v12 * v14;
  self->_thumbnailContentMode = 1;

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedAssetCollectionDiagnosticsViewController;
  -[PXCuratedAssetCollectionDiagnosticsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PXCuratedAssetCollectionDiagnosticsViewController _updateCachedAssets](self, "_updateCachedAssets");
  -[PXCuratedAssetCollectionDiagnosticsViewController presentTapToRadarIfNeeded](self, "presentTapToRadarIfNeeded");
}

- (void)presentTapToRadarIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PXCuratedAssetCollectionDiagnosticsViewController_presentTapToRadarIfNeeded__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_editSettings:(id)a3
{
  void *v4;
  PXDiagnosticsHighlightCurationSettingsViewController *v5;
  PXDiagnosticsHighlightCurationSettingsViewController *editSettingsViewController;
  void *v7;
  id v8;

  -[PXCuratedAssetCollectionDiagnosticsViewController curationDebugInformationForCurationType:](self, "curationDebugInformationForCurationType:", self->_currentCurationType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("curationOptions"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_editSettingsViewController)
  {
    v5 = -[PXDiagnosticsHighlightCurationSettingsViewController initWithDelegate:]([PXDiagnosticsHighlightCurationSettingsViewController alloc], "initWithDelegate:", self);
    editSettingsViewController = self->_editSettingsViewController;
    self->_editSettingsViewController = v5;

    -[PXDiagnosticsHighlightCurationSettingsViewController setOptions:](self->_editSettingsViewController, "setOptions:", v8);
  }
  -[PXCuratedAssetCollectionDiagnosticsViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", self->_editSettingsViewController, 1);

}

- (void)_updateCachedAssets
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double MidY;
  CGRect *p_previousPreheatRect;
  double v13;
  double v14;
  NSArray *v15;
  NSArray *v16;
  double v17;
  _QWORD v18[5];
  NSArray *v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  -[UICollectionView bounds](self->_collectionView, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v7 = CGRectGetHeight(v20) * -0.5;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v22 = CGRectInset(v21, 0.0, v7);
  v8 = v22.origin.y;
  v9 = v22.size.width;
  v10 = v22.size.height;
  v17 = v22.origin.x;
  MidY = CGRectGetMidY(v22);
  p_previousPreheatRect = &self->_previousPreheatRect;
  v13 = MidY - CGRectGetMidY(self->_previousPreheatRect);
  if (v13 >= 0.0)
    v14 = v13;
  else
    v14 = -v13;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  if (v14 > CGRectGetHeight(v23) / 3.0)
  {
    v15 = self->_visibleAssets;
    v16 = v15;
    if (v15)
    {
      if (-[NSArray count](v15, "count"))
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __72__PXCuratedAssetCollectionDiagnosticsViewController__updateCachedAssets__block_invoke;
        v18[3] = &unk_1E5125800;
        v18[4] = self;
        v19 = v16;
        -[PXCuratedAssetCollectionDiagnosticsViewController _enumerateDifferencesBetweenRect:andRect:usingBlock:](self, "_enumerateDifferencesBetweenRect:andRect:usingBlock:", v18, p_previousPreheatRect->origin.x, self->_previousPreheatRect.origin.y, self->_previousPreheatRect.size.width, self->_previousPreheatRect.size.height, v17, v8, v9, v10);
        -[PHCachingImageManager startCachingImagesForAssets:targetSize:contentMode:options:](self->_imageManager, "startCachingImagesForAssets:targetSize:contentMode:options:", self->_addedAssets, self->_thumbnailContentMode, self->_thumbnailOptions, self->_thumbnailSize.width, self->_thumbnailSize.height);
        -[PHCachingImageManager stopCachingImagesForAssets:targetSize:contentMode:options:](self->_imageManager, "stopCachingImagesForAssets:targetSize:contentMode:options:", self->_removedAssets, self->_thumbnailContentMode, self->_thumbnailOptions, self->_thumbnailSize.width, self->_thumbnailSize.height);
        p_previousPreheatRect->origin.x = v17;
        self->_previousPreheatRect.origin.y = v8;
        self->_previousPreheatRect.size.width = v9;
        self->_previousPreheatRect.size.height = v10;
        -[NSMutableArray removeAllObjects](self->_addedAssets, "removeAllObjects");
        -[NSMutableArray removeAllObjects](self->_removedAssets, "removeAllObjects");

      }
    }

  }
}

- (void)_enumerateDifferencesBetweenRect:(CGRect)a3 andRect:(CGRect)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double MaxY;
  CGFloat v14;
  double MinY;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  void (**v36)(id, uint64_t, double, double, double, double);
  CGFloat rect;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v36 = (void (**)(id, uint64_t, double, double, double, double))a5;
  v38.origin.x = v12;
  v38.origin.y = v11;
  v38.size.width = v10;
  rect = v9;
  v38.size.height = v9;
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  if (CGRectIntersectsRect(v38, v59))
  {
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    MaxY = CGRectGetMaxY(v39);
    v40.origin.x = v12;
    v40.origin.y = v11;
    v40.size.width = v10;
    v40.size.height = rect;
    if (MaxY > CGRectGetMaxY(v40))
    {
      v41.origin.x = v12;
      v41.origin.y = v11;
      v41.size.width = v10;
      v41.size.height = rect;
      v32 = CGRectGetMaxY(v41);
      v42.origin.x = x;
      v42.origin.y = y;
      v42.size.width = width;
      v42.size.height = height;
      v31 = CGRectGetMaxY(v42);
      v43.origin.x = v12;
      v43.origin.y = v11;
      v43.size.width = v10;
      v43.size.height = rect;
      v14 = CGRectGetMaxY(v43);
      v36[2](v36, 1, x, v32, width, v31 - v14);
    }
    v44.origin.x = v12;
    v44.origin.y = v11;
    v44.size.width = v10;
    v44.size.height = rect;
    MinY = CGRectGetMinY(v44);
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    if (MinY > CGRectGetMinY(v45))
    {
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = height;
      v33 = CGRectGetMinY(v46);
      v47.origin.x = v12;
      v47.origin.y = v11;
      v47.size.width = v10;
      v47.size.height = rect;
      v16 = CGRectGetMinY(v47);
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      v17 = CGRectGetMinY(v48);
      v36[2](v36, 1, x, v33, width, v16 - v17);
    }
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    v18 = CGRectGetMaxY(v49);
    v50.origin.x = v12;
    v50.origin.y = v11;
    v50.size.width = v10;
    v50.size.height = rect;
    if (v18 < CGRectGetMaxY(v50))
    {
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      v34 = CGRectGetMaxY(v51);
      v52.origin.x = v12;
      v52.origin.y = v11;
      v52.size.width = v10;
      v52.size.height = rect;
      v19 = CGRectGetMaxY(v52);
      v53.origin.x = x;
      v53.origin.y = y;
      v53.size.width = width;
      v53.size.height = height;
      v20 = CGRectGetMaxY(v53);
      v36[2](v36, 0, x, v34, width, v19 - v20);
    }
    v54.origin.x = v12;
    v54.origin.y = v11;
    v54.size.width = v10;
    v54.size.height = rect;
    v21 = CGRectGetMinY(v54);
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = width;
    v55.size.height = height;
    if (v21 < CGRectGetMinY(v55))
    {
      v56.origin.x = v12;
      v56.origin.y = v11;
      v56.size.width = v10;
      v56.size.height = rect;
      v35 = CGRectGetMinY(v56);
      v57.origin.x = x;
      v57.origin.y = y;
      v57.size.width = width;
      v57.size.height = height;
      v22 = CGRectGetMinY(v57);
      v58.origin.x = v12;
      v58.origin.y = v11;
      v58.size.width = v10;
      v58.size.height = rect;
      v23.n128_f64[0] = v22 - CGRectGetMinY(v58);
      v24.n128_f64[0] = x;
      v25.n128_f64[0] = v35;
      v26.n128_f64[0] = width;
      ((void (*)(__n128, __n128, __n128, __n128))v36[2])(v24, v25, v26, v23);
    }
  }
  else
  {
    v36[2](v36, 1, x, y, width, height);
    v27.n128_f64[0] = v12;
    v28.n128_f64[0] = v11;
    v29.n128_f64[0] = v10;
    v30.n128_f64[0] = v9;
    ((void (*)(__n128, __n128, __n128, __n128))v36[2])(v27, v28, v29, v30);
  }

}

- (void)_updateUIElementsVisibility
{
  NSInteger v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  PXCuratedAssetCollectionDiagnosticsViewController *v10;
  UIActivityIndicatorView *v11;
  UIActivityIndicatorView *progressView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PXCuratedAssetCollectionDiagnosticsViewController *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;

  if (self->_isReady)
  {
    v3 = -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex");
    -[UISegmentedControl setHidden:](self->_segmentedControl, "setHidden:", 0);
    v23 = 0;
    v24 = 0;
    -[PXCuratedAssetCollectionDiagnosticsViewController generateSectionTitles:andTableContent:forIndex:](self, "generateSectionTitles:andTableContent:forIndex:", &v24, &v23, v3);
    v4 = v24;
    v5 = v24;
    v6 = v23;
    v7 = v23;
    if ((unint64_t)(v3 - 1) > 1)
    {
      objc_storeStrong((id *)&self->_sectionTitles, v4);
      objc_storeStrong((id *)&self->_tableContent, v6);
      -[UITableView setHidden:](self->_tableView, "setHidden:", 0);
      -[UICollectionView setHidden:](self->_collectionView, "setHidden:", 1);
      -[UITableView reloadData](self->_tableView, "reloadData");
      -[PXCuratedAssetCollectionDiagnosticsViewController navigationController](self, "navigationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "topViewController");
      v20 = (PXCuratedAssetCollectionDiagnosticsViewController *)objc_claimAutoreleasedReturnValue();

      if (v20 == self)
        -[PXCuratedAssetCollectionDiagnosticsViewController hideToolbarItems](self, "hideToolbarItems");
    }
    else
    {
      -[UITableView setHidden:](self->_tableView, "setHidden:", 1);
      -[UICollectionView setHidden:](self->_collectionView, "setHidden:", 0);
      -[UICollectionView reloadData](self->_collectionView, "reloadData");
      if (v3 == 2)
        v8 = 0;
      else
        v8 = 3;
      -[PXCuratedAssetCollectionDiagnosticsViewController setCurrentCurationType:](self, "setCurrentCurationType:", v8);
      -[PXCuratedAssetCollectionDiagnosticsViewController displayCurrentCurationType](self, "displayCurrentCurationType");
      -[PXCuratedAssetCollectionDiagnosticsViewController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topViewController");
      v10 = (PXCuratedAssetCollectionDiagnosticsViewController *)objc_claimAutoreleasedReturnValue();

      if (v10 == self)
        -[PXCuratedAssetCollectionDiagnosticsViewController showToolbarItems](self, "showToolbarItems");
    }
    -[UIActivityIndicatorView stopAnimating](self->_progressView, "stopAnimating");
    -[UIActivityIndicatorView removeFromSuperview](self->_progressView, "removeFromSuperview");
    -[PXCuratedAssetCollectionDiagnosticsViewController navigationItem](self, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rightBarButtonItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setEnabled:", 1);

  }
  else
  {
    v11 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    progressView = self->_progressView;
    self->_progressView = v11;

    -[UIView addSubview:](self->_contentView, "addSubview:", self->_progressView);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView centerXAnchor](self->_progressView, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[UIActivityIndicatorView centerYAnchor](self->_progressView, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    -[UIActivityIndicatorView startAnimating](self->_progressView, "startAnimating");
  }
}

- (id)_tapToRadarViewControllerWithScreenshot:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v7;
  PXFeedbackTapToRadarViewController *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  if (!self->_isReady)
    return 0;
  v3 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_screenshotURL, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[PXCuratedAssetCollectionDiagnosticsViewController radarAttachmentURLs](self, "radarAttachmentURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(PXFeedbackTapToRadarViewController);
  -[PXFeedbackTapToRadarViewController setRequestScreenshotPermission:](v8, "setRequestScreenshotPermission:", v3);
  -[PXCuratedAssetCollectionDiagnosticsViewController radarRoutes](self, "radarRoutes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackTapToRadarViewController setRoutes:](v8, "setRoutes:", v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93__PXCuratedAssetCollectionDiagnosticsViewController__tapToRadarViewControllerWithScreenshot___block_invoke;
  v12[3] = &unk_1E5147460;
  v12[4] = self;
  v13 = v5;
  v14 = v7;
  v10 = v7;
  v11 = v5;
  -[PXFeedbackTapToRadarViewController setFileRadarHandler:](v8, "setFileRadarHandler:", v12);

  return v8;
}

- (void)_tapToRadar:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[PXCuratedAssetCollectionDiagnosticsViewController _tapToRadarViewControllerWithScreenshot:](self, "_tapToRadarViewControllerWithScreenshot:", 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Error"), CFSTR("The debug information for the selected highlight is incomplete."), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v6);

    v4 = 0;
  }
  -[PXCuratedAssetCollectionDiagnosticsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_closeAction:(id)a3
{
  -[PXCuratedAssetCollectionDiagnosticsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sectionTitles, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[PXCuratedAssetCollectionDiagnosticsViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_tableContent, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("KeywordsCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("KeywordsCell"));
  -[PXCuratedAssetCollectionDiagnosticsViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v7, objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_tableContent, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v13, "isEqualToString:", CFSTR("location"));

  if ((_DWORD)v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v12;
      if ((unint64_t)objc_msgSend(v14, "count") < 2)
      {
        v18 = CFSTR("Invalid location");
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("(%@, %@)"), v16, v17);
        v18 = (const __CFString *)objc_claimAutoreleasedReturnValue();

        v14 = (id)v16;
      }

    }
    else
    {
      v18 = CFSTR("Invalid location");
    }

    v12 = (void *)v18;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v8, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v20, "setAttributedText:", v12);
  }
  else
  {
    objc_msgSend(v20, "setText:", v12);

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFont:", v21);

  }
  objc_msgSend(v8, "textLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNumberOfLines:", 0);

  objc_msgSend(v8, "textLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sizeToFit");

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[NSArray objectAtIndexedSubscript:](self->_sectionTitles, "objectAtIndexedSubscript:", a4);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[PXCuratedAssetCollectionDiagnosticsViewController curationDebugInformationForCurationType:](self, "curationDebugInformationForCurationType:", self->_currentCurationType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rootCluster"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sortedObjects"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _BOOL4 v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  PHCachingImageManager *imageManager;
  CGSize *p_thumbnailSize;
  int64_t thumbnailContentMode;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSDictionary *dedupedSymbolIndexByItemIdentifier;
  void *v63;
  void *v64;
  id v65;
  id v67;
  void *v68;
  void *v69;
  BOOL v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  PXCuratedAssetCollectionDiagnosticsViewController *v76;
  id obj;
  id obja;
  void *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "item");
  v75 = v6;
  v76 = self;
  v79 = v7;
  if (self->_curationDebugInformation)
  {
    -[PXCuratedAssetCollectionDiagnosticsViewController curationDebugInformationForCurationType:](self, "curationDebugInformationForCurationType:", self->_currentCurationType);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("rootCluster"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("sortedObjects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "section"))
    {
      v10 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("totalNumberOfItems"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntegerValue");

        v8 += v13;
        ++v10;
      }
      while (v10 < objc_msgSend(v7, "section"));
    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("sortedObjects"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v67 = v14;
      obj = v14;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = *(_QWORD *)v84;
        while (2)
        {
          v21 = 0;
          v22 = v17;
          v23 = v19;
          do
          {
            if (*(_QWORD *)v84 != v20)
              objc_enumerationMutation(obj);
            v19 = *(id *)(*((_QWORD *)&v83 + 1) + 8 * v21);

            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("totalNumberOfItems"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "unsignedIntegerValue");

            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("sortedObjects"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = v25 + v22;
            if (v17 > objc_msgSend(v79, "item"))
            {
              v28 = v26 != 0;
              if (v26)
                v27 = v22 == objc_msgSend(v79, "item");
              else
                v27 = 0;
              v6 = v75;
              self = v76;
              goto LABEL_23;
            }
            v18 = !v18;
            ++v21;
            v22 = v17;
            v23 = v19;
          }
          while (v16 != v21);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
          if (v16)
            continue;
          break;
        }

        v27 = 0;
        v28 = 0;
        v19 = 0;
        v6 = v75;
      }
      else
      {
        v27 = 0;
        v18 = 0;
        v28 = 0;
        v19 = 0;
      }
      self = v76;
LABEL_23:
      v31 = v68;
      v30 = v69;

      v14 = v67;
    }
    else
    {
      v27 = 0;
      v18 = 0;
      v28 = 0;
      v19 = 0;
      self = v76;
      v31 = v68;
      v30 = v69;
    }

    v70 = v27;
    v32 = 1;
    if (v18)
      v32 = 2;
    if (v28)
      v29 = v32;
    else
      v29 = 0;
    v7 = v79;
  }
  else
  {
    v70 = 0;
    v29 = 0;
    v19 = 0;
  }
  if (v8 < -[NSArray count](self->_sortedVisibleAssetUUIDs, "count")
    && (-[NSArray objectAtIndexedSubscript:](self->_sortedVisibleAssetUUIDs, "objectAtIndexedSubscript:", v8),
        (v33 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v34 = (void *)v33;
    -[NSDictionary objectForKeyedSubscript:](self->_assetByUUID, "objectForKeyedSubscript:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_visibleAssets, "objectAtIndexedSubscript:", v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PXCuratedAssetCollectionCellReuseIdentifier"), v7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setRepresentedAssetIdentifier:", v37);
  v38 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v38, "setAllowPlaceholder:", 1);
  objc_msgSend(v38, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v38, "setDeliveryMode:", 0);
  imageManager = self->_imageManager;
  p_thumbnailSize = &self->_thumbnailSize;
  thumbnailContentMode = v76->_thumbnailContentMode;
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __91__PXCuratedAssetCollectionDiagnosticsViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v80[3] = &unk_1E513F120;
  v42 = v36;
  v81 = v42;
  v43 = v37;
  v82 = v43;
  -[PHCachingImageManager requestImageForAsset:targetSize:contentMode:options:resultHandler:](imageManager, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v35, thumbnailContentMode, v38, v80, p_thumbnailSize->width, p_thumbnailSize->height);
  if (v76->_curationDebugInformation)
  {
    v44 = v29;
    -[PXCuratedAssetCollectionDiagnosticsViewController curationDebugInformationForCurationType:](v76, "curationDebugInformationForCurationType:", v76->_currentCurationType);
    obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obja, "objectForKeyedSubscript:", CFSTR("items"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v43;
    objc_msgSend(MEMORY[0x1E0CD1390], "uuidFromLocalIdentifier:", v43);
    v74 = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v76->_curationComparisonEnabled)
    {
      objc_msgSend(v42, "setDebugInfo:", 0);
      v71 = v47;
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("state"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setState:", v48);

      -[PXCuratedAssetCollectionDiagnosticsViewController assetsForCurationType:](v76, "assetsForCurationType:", v76->_currentCurationType);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "fetchedObjects");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "uuid");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v51, "isEqualToString:", v76->_keyAssetUUID) & 1) != 0)
      {
        v52 = CFSTR("Required");
      }
      else if (objc_msgSend(v50, "containsObject:", v35))
      {
        v52 = CFSTR("Chosen");
      }
      else
      {
        v52 = CFSTR("Rejected");
      }
      objc_msgSend(v42, "setAlternateState:", v52);

      objc_msgSend(v42, "state");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "alternateState");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v56, "isEqualToString:", v57))
      {
        objc_msgSend(v42, "setComparisonMatch:", 1);
      }
      else
      {
        objc_msgSend(v42, "state");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v58, "isEqualToString:", CFSTR("ForceChosen")))
        {
          objc_msgSend(v42, "alternateState");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setComparisonMatch:", objc_msgSend(v59, "isEqualToString:", CFSTR("Chosen")));

        }
        else
        {
          objc_msgSend(v42, "setComparisonMatch:", 0);
        }

      }
      objc_msgSend(v42, "setClusterState:", 0);
      objc_msgSend(v42, "setSymbolIndex:", 0);
      objc_msgSend(v42, "setDedupingType:", 0);
      objc_msgSend(v42, "setDedupedSymbolIndex:", 0);
      v53 = v75;
      v54 = v71;
    }
    else
    {
      v54 = v47;
      objc_msgSend(v42, "setDebugInfo:", v47);
      objc_msgSend(v42, "setClusterParity:", v44);
      v53 = v75;
      if (v70)
      {
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("state"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setClusterState:", v55);

      }
      else
      {
        objc_msgSend(v42, "setClusterState:", 0);
      }
      -[NSDictionary objectForKeyedSubscript:](v76->_dedupedSymbolIndexByItemIdentifier, "objectForKeyedSubscript:", v46);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setSymbolIndex:", v60);

      objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("dedupingType"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setDedupingType:", v61);

      dedupedSymbolIndexByItemIdentifier = v76->_dedupedSymbolIndexByItemIdentifier;
      objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("dedupedItemIdentifier"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](dedupedSymbolIndexByItemIdentifier, "objectForKeyedSubscript:", v50);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setDedupedSymbolIndex:", v63);

    }
    v43 = v73;
  }
  else
  {
    objc_msgSend(v42, "setDebugInfo:", 0);
    objc_msgSend(v42, "setClusterState:", 0);
    objc_msgSend(v42, "setClusterParity:", 0);
    v53 = v75;
  }
  v64 = v82;
  v65 = v42;

  return v65;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  if (a4)
    v7 = 0;
  else
    v7 = -[NSArray count](self->_visibleAssets, "count");
  if (self->_curationDebugInformation)
  {
    -[PXCuratedAssetCollectionDiagnosticsViewController curationDebugInformationForCurationType:](self, "curationDebugInformationForCurationType:", self->_currentCurationType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("rootCluster"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sortedObjects"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("totalNumberOfItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "unsignedIntegerValue");
    if (!v7)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("itemIdentifiers"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v13, "count");

    }
  }

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  v8 = 42.0;
  v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", a4, CFSTR("PXCuratedAssetCollectionSectionHeaderReuseIdentifier"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_curationDebugInformation)
  {
    -[PXCuratedAssetCollectionDiagnosticsViewController curationDebugInformationForCurationType:](self, "curationDebugInformationForCurationType:", self->_currentCurationType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rootCluster"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sortedObjects"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v8, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setSectionInfo:", v13);
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a3, "cellForItemAtIndexPath:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedAssetCollectionDiagnosticsViewController showItemDetailsWithDebugInfo:](self, "showItemDetailsWithDebugInfo:", v5);

}

- (void)displayCurrentCurationType
{
  void *v3;
  double v4;
  CGFloat v5;
  void *v6;
  double v7;
  CGFloat v8;
  double x;
  double y;
  double width;
  double height;
  UIView *v13;
  UIView *curationTypeView;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t currentCurationType;
  __CFString *v24;
  uint64_t v25;
  dispatch_time_t v26;
  _QWORD block[5];
  _QWORD v28[5];
  __CFString *v29;
  CGRect v30;
  CGRect v31;

  if (!self->_curationTypeView)
  {
    -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4 * 0.5;
    -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7 * 0.5;
    v30.origin.x = -90.0;
    v30.origin.y = -45.0;
    v30.size.width = 180.0;
    v30.size.height = 90.0;
    v31 = CGRectOffset(v30, v5, v8);
    x = v31.origin.x;
    y = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;

    v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    curationTypeView = self->_curationTypeView;
    self->_curationTypeView = v13;

    -[UIView layer](self->_curationTypeView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerRadius:", 6.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "colorWithAlphaComponent:", 0.75);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_curationTypeView, "setBackgroundColor:", v17);

    v18 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[UIView bounds](self->_curationTypeView, "bounds");
    v19 = (void *)objc_msgSend(v18, "initWithFrame:");
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 24.0, 2.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v20);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextColor:", v21);

    objc_msgSend(v19, "setTextAlignment:", 1);
    -[UIView addSubview:](self->_curationTypeView, "addSubview:", v19);
    -[UIView setHidden:](self->_curationTypeView, "setHidden:", 1);
    -[UIView setAlpha:](self->_curationTypeView, "setAlpha:", 0.0);
    -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", self->_curationTypeView);

  }
  currentCurationType = self->_currentCurationType;
  if (currentCurationType > 5)
    v24 = 0;
  else
    v24 = off_1E5125840[currentCurationType];
  v25 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke;
  v28[3] = &unk_1E5148D08;
  v28[4] = self;
  v29 = v24;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v28, 0.25);
  v26 = dispatch_time(0, 600000000);
  block[0] = v25;
  block[1] = 3221225472;
  block[2] = __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke_2;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_after(v26, MEMORY[0x1E0C80D38], block);

}

- (void)reloadCuration
{
  PHFetchResult *v3;
  PHFetchResult *allAssets;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *keyAssetUUID;
  NSDictionary *v9;
  PHFetchResult *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSDictionary *assetByUUID;
  NSDictionary *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *sortedVisibleAssetUUIDs;
  NSArray *v23;
  NSArray *v24;
  NSArray *visibleAssets;
  NSInteger v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[PXCuratedAssetCollectionDiagnosticsViewController assetsForCurationType:](self, "assetsForCurationType:", 5);
  v3 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  allAssets = self->_allAssets;
  self->_allAssets = v3;

  -[PXCuratedAssetCollectionDiagnosticsViewController assetsForCurationType:](self, "assetsForCurationType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  keyAssetUUID = self->_keyAssetUUID;
  self->_keyAssetUUID = v7;

  v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = self->_allAssets;
  v11 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v15, "uuid", (_QWORD)v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v15, v16);

      }
      v12 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  assetByUUID = self->_assetByUUID;
  self->_assetByUUID = v9;
  v18 = v9;

  -[PXCuratedAssetCollectionDiagnosticsViewController curationDebugInformationForCurationType:](self, "curationDebugInformationForCurationType:", self->_currentCurationType);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("rootCluster"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXCuratedAssetCollectionDiagnosticsViewController addAssetUUIDsTo:from:](self, "addAssetUUIDsTo:from:", v21, v20);
  sortedVisibleAssetUUIDs = self->_sortedVisibleAssetUUIDs;
  self->_sortedVisibleAssetUUIDs = v21;
  v23 = v21;

  -[PHFetchResult fetchedObjects](self->_allAssets, "fetchedObjects");
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  visibleAssets = self->_visibleAssets;
  self->_visibleAssets = v24;

  -[UICollectionView reloadData](self->_collectionView, "reloadData");
  v26 = -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex");

  if (v26 == 1)
    -[PXCuratedAssetCollectionDiagnosticsViewController displayCurrentCurationType](self, "displayCurrentCurationType");

}

- (void)changeCurationType:(id)a3
{
  id v4;
  int64_t currentCurationType;
  uint64_t v6;
  void *v7;
  void *v9;
  unint64_t v10;
  id v11;

  v4 = a3;
  currentCurationType = self->_currentCurationType;
  v11 = v4;
  if (objc_msgSend(v4, "direction") == 1)
  {
    if (currentCurationType <= 5)
      v6 = 5;
    else
      v6 = currentCurationType;
    while (v6 != currentCurationType)
    {
      -[PXCuratedAssetCollectionDiagnosticsViewController curationDebugInformationForCurationType:](self, "curationDebugInformationForCurationType:", ++currentCurationType);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        goto LABEL_7;
    }
  }
  else if (objc_msgSend(v11, "direction") == 2 && currentCurationType-- >= 1)
  {
    while (1)
    {
      -[PXCuratedAssetCollectionDiagnosticsViewController curationDebugInformationForCurationType:](self, "curationDebugInformationForCurationType:", currentCurationType);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        break;
      v10 = currentCurationType-- + 1;
      if (v10 < 2)
        goto LABEL_12;
    }
LABEL_7:
    -[PXCuratedAssetCollectionDiagnosticsViewController setCurrentCurationType:](self, "setCurrentCurationType:", currentCurationType);
  }
LABEL_12:

}

- (void)addAssetUUIDsTo:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("itemIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "addObjectsFromArray:", v8);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sortedObjects"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[PXCuratedAssetCollectionDiagnosticsViewController addAssetUUIDsTo:from:](self, "addAssetUUIDsTo:from:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)setCurrentCurationType:(int64_t)a3
{
  void *v4;
  PXCuratedAssetCollectionDiagnosticsViewController *v5;

  if (self->_currentCurationType != a3)
  {
    self->_currentCurationType = a3;
    -[PXCuratedAssetCollectionDiagnosticsViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (PXCuratedAssetCollectionDiagnosticsViewController *)objc_claimAutoreleasedReturnValue();

    if (v5 == self)
      -[PXCuratedAssetCollectionDiagnosticsViewController showToolbarItems](self, "showToolbarItems");
    -[PXCuratedAssetCollectionDiagnosticsViewController reloadCuration](self, "reloadCuration");
  }
}

- (void)showCurationSettings:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  UIView *v16;
  UIView *curationSettingsView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  CGRect v28;
  CGRect v29;

  if (!self->_curationSettingsView)
  {
    -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    if (v10 >= v12)
      v13 = v12;
    else
      v13 = v10;
    v14 = (v10 - v13) * 0.5 + 6.0;
    v15 = (v12 - v13) * 0.5 + 6.0;
    v28.origin.x = v6;
    v28.origin.y = v8;
    v28.size.width = v10;
    v28.size.height = v12;
    v29 = CGRectInset(v28, v14, v15);
    v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
    curationSettingsView = self->_curationSettingsView;
    self->_curationSettingsView = v16;

    -[UIView layer](self->_curationSettingsView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", 6.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_curationSettingsView, "setBackgroundColor:", v19);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", 7.0, 8.0, 60.0, 24.0);
    objc_msgSend(v20, "setTitle:forState:", CFSTR("Done"), 0);
    objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel_hideCurationSettings_, 0x2000);
    -[UIView addSubview:](self->_curationSettingsView, "addSubview:", v20);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E50]), "initWithFrame:", 35.0, 80.0, 200.0, 200.0);
    objc_msgSend(v21, "setBackgroundColor:", 0);
    objc_msgSend(v20, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "font");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v23);

    objc_msgSend(v21, "setText:", CFSTR("Symbols:\n\t💟 favorite\n\t🚮 junk\n\t📳 blurry\n\t🏞 SDOF/HDR\n\t✅ elected\n\t✳️ completed\n\t❌ rejected\n\t⁉️ ?!?!"));
    -[UIView addSubview:](self->_curationSettingsView, "addSubview:", v21);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E50]), "initWithFrame:", 180.0, 80.0, 200.0, 200.0);
    objc_msgSend(v24, "setBackgroundColor:", 0);
    objc_msgSend(v21, "font");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v25);

    objc_msgSend(v24, "setText:", CFSTR("Deduping\n\t⏏️ similar\n\t🔀 semantic\n\t⤴️ SDOF/HDR\n\t🔃 timing\n\t🎦 video"));
    -[UIView addSubview:](self->_curationSettingsView, "addSubview:", v24);
    -[UIView setHidden:](self->_curationSettingsView, "setHidden:", 1);
    -[UIView setAlpha:](self->_curationSettingsView, "setAlpha:", 0.0);
    -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", self->_curationSettingsView);

  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__PXCuratedAssetCollectionDiagnosticsViewController_showCurationSettings___block_invoke;
  v27[3] = &unk_1E5149198;
  v27[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v27, 0.25);
}

- (void)hideCurationSettings:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__PXCuratedAssetCollectionDiagnosticsViewController_hideCurationSettings___block_invoke;
  v4[3] = &unk_1E5149198;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__PXCuratedAssetCollectionDiagnosticsViewController_hideCurationSettings___block_invoke_2;
  v3[3] = &unk_1E5147360;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v4, v3, 0.25);
}

- (void)showItemDetailsWithDebugInfo:(id)a3
{
  id v4;
  UIView *itemDetailsView;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  UIView *v18;
  UIView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  PXHistoryLineView *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  _QWORD v52[5];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  itemDetailsView = self->_itemDetailsView;
  if (!itemDetailsView)
  {
    -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    if (v12 >= v14)
      v15 = v14;
    else
      v15 = v12;
    v16 = (v12 - v15) * 0.5 + 6.0;
    v17 = (v14 - v15) * 0.5 + 6.0;
    v64.origin.x = v8;
    v64.origin.y = v10;
    v64.size.width = v12;
    v64.size.height = v14;
    v65 = CGRectInset(v64, v16, v17);
    v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height);
    v19 = self->_itemDetailsView;
    self->_itemDetailsView = v18;

    -[UIView layer](self->_itemDetailsView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerRadius:", 6.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_itemDetailsView, "setBackgroundColor:", v21);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", 7.0, 8.0, 60.0, 24.0);
    objc_msgSend(v22, "setTitle:forState:", CFSTR("Done"), 0);
    objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel_hideItemDetails_, 0x2000);
    -[UIView addSubview:](self->_itemDetailsView, "addSubview:", v22);
    -[UIView setHidden:](self->_itemDetailsView, "setHidden:", 1);
    -[UIView setAlpha:](self->_itemDetailsView, "setAlpha:", 0.0);
    -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", self->_itemDetailsView);

    itemDetailsView = self->_itemDetailsView;
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[UIView subviews](itemDetailsView, "subviews");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v58 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
        }
        objc_msgSend(v29, "removeFromSuperview");
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    }
    while (v26);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("criteriaReason"));
  v30 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v30;
  if (v30)
  {
    v31 = v30;
    v32 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v35 = (void *)objc_msgSend(v32, "initWithFrame:", 10.0, 40.0, v34 + -20.0, 20.0);

    objc_msgSend(v35, "setAutoresizingMask:", 48);
    objc_msgSend(v35, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Criteria evaluation:\n%@"), v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setText:", v36);

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFont:", v37);

    objc_msgSend(v35, "sizeToFit");
    -[UIView addSubview:](self->_itemDetailsView, "addSubview:", v35);
    objc_msgSend(v35, "bounds");
    v39 = v38 + 40.0;

  }
  else
  {
    v39 = 40.0;
  }
  v51 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stateHistory"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v41)
  {
    v42 = v41;
    v43 = 0;
    v44 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v54 != v44)
          objc_enumerationMutation(v40);
        v46 = -[PXHistoryLineView initWithHistoryLine:]([PXHistoryLineView alloc], "initWithHistoryLine:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j));
        -[PXCuratedAssetCollectionDiagnosticsViewController view](self, "view");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "frame");
        v49 = v48 + -20.0;

        -[PXHistoryLineView setFrame:](v46, "setFrame:", 10.0, v39 + (double)(unint64_t)(v43 + j) * 40.0, v49, 20.0);
        -[UIView addSubview:](self->_itemDetailsView, "addSubview:", v46);

      }
      v43 += j;
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v42);
  }
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __82__PXCuratedAssetCollectionDiagnosticsViewController_showItemDetailsWithDebugInfo___block_invoke;
  v52[3] = &unk_1E5149198;
  v52[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v52, 0.25);

}

- (void)hideItemDetails:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__PXCuratedAssetCollectionDiagnosticsViewController_hideItemDetails___block_invoke;
  v4[3] = &unk_1E5149198;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__PXCuratedAssetCollectionDiagnosticsViewController_hideItemDetails___block_invoke_2;
  v3[3] = &unk_1E5147360;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v4, v3, 0.25);
}

- (id)_curationTypeKeys
{
  return &unk_1E53E94E0;
}

- (id)curationDebugInformationForCurationType:(int64_t)a3
{
  __CFString *v3;

  if ((unint64_t)a3 > 4)
    v3 = 0;
  else
    v3 = off_1E5125870[a3];
  return -[NSDictionary objectForKeyedSubscript:](self->_curationDebugInformation, "objectForKeyedSubscript:", v3);
}

- (id)fullCurationDebugInformation
{
  dispatch_sync((dispatch_queue_t)self->_curationDebugFetchQueue, &__block_literal_global_97129);
  return self->_curationDebugInformation;
}

- (void)requestCurationDebugInfoWithOptions:(id)a3 setGlobally:(BOOL)a4
{
  id v6;
  NSObject *curationDebugFetchQueue;
  id v8;
  _QWORD block[4];
  id v10;
  PXCuratedAssetCollectionDiagnosticsViewController *v11;
  BOOL v12;

  v6 = a3;
  curationDebugFetchQueue = self->_curationDebugFetchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__PXCuratedAssetCollectionDiagnosticsViewController_requestCurationDebugInfoWithOptions_setGlobally___block_invoke;
  block[3] = &unk_1E51473C0;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(curationDebugFetchQueue, block);

}

- (id)curationDebugInformationWithOptions:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)assetsForCurationType:(int64_t)a3
{
  return 0;
}

- (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5
{
  return 0;
}

- (id)radarAttachmentURLs
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)radarComponentInfoForRoute:(id)a3
{
  return 0;
}

- (id)radarTitleTemplate
{
  return &stru_1E5149688;
}

- (id)radarDescriptionTemplate
{
  return &stru_1E5149688;
}

- (id)radarRoutes
{
  return 0;
}

- (BOOL)initiallyShowCuration
{
  return self->_initiallyShowCuration;
}

- (void)setInitiallyShowCuration:(BOOL)a3
{
  self->_initiallyShowCuration = a3;
}

- (int64_t)currentCurationType
{
  return self->_currentCurationType;
}

- (BOOL)shouldPresentTapToRadar
{
  return self->_shouldPresentTapToRadar;
}

- (void)setShouldPresentTapToRadar:(BOOL)a3
{
  self->_shouldPresentTapToRadar = a3;
}

- (NSString)hostLayoutDiagnosticDescription
{
  return self->_hostLayoutDiagnosticDescription;
}

- (void)setHostLayoutDiagnosticDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1248);
}

- (NSString)hostViewDiagnosticDescription
{
  return self->_hostViewDiagnosticDescription;
}

- (void)setHostViewDiagnosticDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostViewDiagnosticDescription, 0);
  objc_storeStrong((id *)&self->_hostLayoutDiagnosticDescription, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_editSettingsViewController, 0);
  objc_storeStrong((id *)&self->_screenshotURL, 0);
  objc_storeStrong((id *)&self->_dedupedSymbolIndexByItemIdentifier, 0);
  objc_storeStrong((id *)&self->_itemDetailsView, 0);
  objc_storeStrong((id *)&self->_curationTypeView, 0);
  objc_storeStrong((id *)&self->_curationSettingsView, 0);
  objc_storeStrong((id *)&self->_curationDebugFetchQueue, 0);
  objc_storeStrong((id *)&self->_curationDebugInformation, 0);
  objc_storeStrong((id *)&self->_sortedVisibleAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_assetByUUID, 0);
  objc_storeStrong((id *)&self->_keyAssetUUID, 0);
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_visibleAssets, 0);
  objc_storeStrong((id *)&self->_removedAssets, 0);
  objc_storeStrong((id *)&self->_addedAssets, 0);
  objc_storeStrong((id *)&self->_thumbnailOptions, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_tableContent, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

void __101__PXCuratedAssetCollectionDiagnosticsViewController_requestCurationDebugInfoWithOptions_setGlobally___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id obj;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD block[5];
  id v30;
  id v31;
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
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("includeKeyAsset"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("includeCuration"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("extendedCurationOptions"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("setGlobally"));

  v23 = v2;
  objc_msgSend(*(id *)(a1 + 40), "curationDebugInformationWithOptions:", v2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v22 = a1;
  objc_msgSend(*(id *)(a1 + 40), "_curationTypeKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v27)
  {
    v6 = 0;
    v25 = *(_QWORD *)v37;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(obj);
        v28 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v7);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v26, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("items"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectEnumerator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v33 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("dedupedItemIdentifier"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_msgSend(v5, "objectForKeyedSubscript:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v17)
                {
                  v18 = v6 + 1;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v16);

                  v6 = v18;
                }

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v13);
        }

        v7 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v27);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__PXCuratedAssetCollectionDiagnosticsViewController_requestCurationDebugInfoWithOptions_setGlobally___block_invoke_2;
  block[3] = &unk_1E51457C8;
  block[4] = *(_QWORD *)(v22 + 40);
  v30 = v26;
  v31 = v5;
  v20 = v5;
  v21 = v26;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __101__PXCuratedAssetCollectionDiagnosticsViewController_requestCurationDebugInfoWithOptions_setGlobally___block_invoke_2(id *a1)
{
  void *v2;
  id v3;

  objc_storeStrong((id *)a1[4] + 143, a1[5]);
  objc_storeStrong((id *)a1[4] + 150, a1[6]);
  *((_BYTE *)a1[4] + 1168) = 1;
  objc_msgSend(a1[4], "reloadCuration");
  objc_msgSend(a1[4], "_updateUIElementsVisibility");
  objc_msgSend(a1[4], "curationDebugInformationForCurationType:", *((_QWORD *)a1[4] + 155));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("curationOptions"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*((id *)a1[4] + 152), "setOptions:", v3);
  objc_msgSend(a1[4], "presentTapToRadarIfNeeded");

}

uint64_t __69__PXCuratedAssetCollectionDiagnosticsViewController_hideItemDetails___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setAlpha:", 0.0);
}

uint64_t __69__PXCuratedAssetCollectionDiagnosticsViewController_hideItemDetails___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1192), "setHidden:", 1);
  return result;
}

uint64_t __82__PXCuratedAssetCollectionDiagnosticsViewController_showItemDetailsWithDebugInfo___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setHidden:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setAlpha:", 1.0);
}

uint64_t __74__PXCuratedAssetCollectionDiagnosticsViewController_hideCurationSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setAlpha:", 0.0);
}

uint64_t __74__PXCuratedAssetCollectionDiagnosticsViewController_hideCurationSettings___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1176), "setHidden:", 1);
  return result;
}

uint64_t __74__PXCuratedAssetCollectionDiagnosticsViewController_showCurationSettings___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setHidden:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setAlpha:", 1.0);
}

void __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setText:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setAlpha:", 1.0);

}

uint64_t __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke_3;
  v3[3] = &unk_1E5149198;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke_4;
  v2[3] = &unk_1E5147360;
  v2[4] = v4;
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v3, v2, 0.25);
}

uint64_t __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setAlpha:", 0.0);
}

uint64_t __79__PXCuratedAssetCollectionDiagnosticsViewController_displayCurrentCurationType__block_invoke_4(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1184), "setHidden:", 1);
  return result;
}

void __91__PXCuratedAssetCollectionDiagnosticsViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "representedAssetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setThumbnailImage:", v5);

}

void __93__PXCuratedAssetCollectionDiagnosticsViewController__tapToRadarViewControllerWithScreenshot___block_invoke(uint64_t a1, int a2, char a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "radarComponentInfoForRoute:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "radarTitleTemplate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "radarDescriptionTemplate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "version");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C9AA60];
    if (a2)
      v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    if ((a3 & 1) != 0)
    {
      v17[0] = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v16) = 1;
      +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v8, v9, CFSTR("Other bug"), v10, v11, v12, CFSTR("1091395"), v13, v14, v16, v15, 0);

    }
    else
    {
      LOWORD(v16) = 0;
      +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v8, v9, CFSTR("Other bug"), v10, v11, v12, CFSTR("1091395"), v13, v14, v16, MEMORY[0x1E0C9AA60], 0);
    }

  }
}

void __72__PXCuratedAssetCollectionDiagnosticsViewController__updateCachedAssets__block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "collectionViewLayout", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutAttributesForElementsInRect:", a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    if (a2)
      v17 = &OBJC_IVAR___PXCuratedAssetCollectionDiagnosticsViewController__addedAssets;
    else
      v17 = &OBJC_IVAR___PXCuratedAssetCollectionDiagnosticsViewController__removedAssets;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "indexPath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v19, "item"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + *v17), "addObject:", v20);

        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

}

uint64_t __78__PXCuratedAssetCollectionDiagnosticsViewController_presentTapToRadarIfNeeded__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 1233))
  {
    if (*(_QWORD *)(v1 + 1144))
    {
      *(_BYTE *)(v1 + 1233) = 0;
      return objc_msgSend(*(id *)(result + 32), "_tapToRadar:", 0);
    }
  }
  return result;
}

@end
