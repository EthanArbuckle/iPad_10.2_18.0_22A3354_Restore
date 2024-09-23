@implementation PXSearchZeroKeywordGadget

- (PXSearchZeroKeywordGadget)initWithDataSource:(id)a3 dataSourceSection:(unint64_t)a4 sectionType:(int64_t)a5
{
  id v9;
  PXSearchZeroKeywordGadgetLayout *v10;
  PXSearchZeroKeywordGadget *v11;
  PXSearchZeroKeywordGadget *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *placeTileFetchCounterQueue;
  objc_super v16;

  v9 = a3;
  v10 = objc_alloc_init(PXSearchZeroKeywordGadgetLayout);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v10, "setMinimumLineSpacing:", 10.0);
  -[UICollectionViewFlowLayout setScrollDirection:](v10, "setScrollDirection:", 1);
  v16.receiver = self;
  v16.super_class = (Class)PXSearchZeroKeywordGadget;
  v11 = -[PXSearchZeroKeywordGadget initWithCollectionViewLayout:](&v16, sel_initWithCollectionViewLayout_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_zeroKeywordDataSource, a3);
    v12->_dataSourceSection = a4;
    v12->_sectionType = a5;
    v12->_cellLabelNumberOfLinesPermitted = 2;
    if (a5 == 2)
    {
      v13 = dispatch_queue_create("com.apple.photos.search.placeTileFetchCounterQueue", 0);
      placeTileFetchCounterQueue = v12->_placeTileFetchCounterQueue;
      v12->_placeTileFetchCounterQueue = (OS_dispatch_queue *)v13;

    }
  }

  return v12;
}

- (void)viewDidLoad
{
  PXPlacesThumbnailManager *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSearchZeroKeywordGadget;
  -[PXSearchZeroKeywordGadget viewDidLoad](&v8, sel_viewDidLoad);
  v3 = objc_alloc_init(PXPlacesThumbnailManager);
  -[PXSearchZeroKeywordGadget setPlacesThumbnailManager:](self, "setPlacesThumbnailManager:", v3);

  -[PXSearchZeroKeywordGadget _configureCollectionView](self, "_configureCollectionView");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[PXSearchZeroKeywordGadget _configureCellLabelNumberOfLinesWithScreenSize:](self, "_configureCellLabelNumberOfLinesWithScreenSize:", v5, v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSearchZeroKeywordGadget;
  -[PXSearchZeroKeywordGadget viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory)
  {
    if (-[PXSearchZeroKeywordGadget sectionType](self, "sectionType") == 1
      || -[PXSearchZeroKeywordGadget sectionType](self, "sectionType") == 4)
    {
      -[PXSearchZeroKeywordGadget layoutPeopleViews](self, "layoutPeopleViews");
    }
    else
    {
      -[PXSearchZeroKeywordGadget collectionViewLayout](self, "collectionViewLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "invalidateLayout");

    }
  }
}

- (void)reloadData
{
  void *v3;
  id v4;

  -[PXSearchZeroKeywordGadget imageManager](self, "imageManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopCachingImagesForAllAssets");

  -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXSearchZeroKeywordGadget;
  -[PXSearchZeroKeywordGadget traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  if (-[PXSearchZeroKeywordGadget sectionType](self, "sectionType") == 2)
  {
    -[PXSearchZeroKeywordGadget traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

    if (v6)
    {
      -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reloadData");

    }
  }

}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  PXGadgetSpec *v29;

  v5 = (PXGadgetSpec *)a3;
  if (self->_gadgetSpec != v5)
  {
    v29 = v5;
    -[PXGadgetSpec contentInsets](v5, "contentInsets");
    v7 = v6;
    -[PXGadgetSpec contentInsets](self->_gadgetSpec, "contentInsets");
    v9 = v7 - v8;
    -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentOffset");
    v12 = v11 - v9;

    objc_storeStrong((id *)&self->_gadgetSpec, a3);
    -[PXGadgetSpec contentInsets](v29, "contentInsets");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContentInset:", v14, v16, v18, v20);

    -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "contentOffset");
    v24 = v23;
    -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setContentOffset:", v12, v24);

    -[PXSearchZeroKeywordGadget getCellSize](self, "getCellSize");
    v27 = v26 + 10.0;
    -[PXSearchZeroKeywordGadget zeroKeywordGadgetLayout](self, "zeroKeywordGadgetLayout");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setColumnWidth:", v27);

    v5 = v29;
  }

}

- (NSString)localizedTitle
{
  void *v3;
  void *v4;

  -[PXSearchZeroKeywordGadget zeroKeywordDataSource](self, "zeroKeywordDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleForSection:", -[PXSearchZeroKeywordGadget dataSourceSection](self, "dataSourceSection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unint64_t)gadgetType
{
  return 8;
}

- (unint64_t)gadgetCapabilities
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  -[PXSearchZeroKeywordGadget updateCellLabelNumberOfLinesWithScreenSize:](self, "updateCellLabelNumberOfLinesWithScreenSize:", a3.width, a3.height);
  -[PXSearchZeroKeywordGadget gadgetSpec](self, "gadgetSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInsets");
  v7 = v6;
  v9 = v8;

  -[PXSearchZeroKeywordGadget getCellSizeWithScreenWidth:](self, "getCellSizeWithScreenWidth:", width);
  v11 = v7 + v9 + v10;
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (BOOL)hasLoadedContentData
{
  return 1;
}

- (id)debugURLsForDiagnostics
{
  void *v2;
  void *v3;

  -[PXSearchZeroKeywordGadget zeroKeywordDataSource](self, "zeroKeywordDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tapToRadarAttachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_configureCollectionView
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  +[PXSearchZeroKeywordCollectionViewCell reuseIdentifier](PXSearchZeroKeywordCollectionViewCell, "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", v3, v4);

  v5 = objc_opt_class();
  +[PXPeopleZeroKeywordCollectionViewCell reuseIdentifier](PXPeopleZeroKeywordCollectionViewCell, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", v5, v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v7);

  -[PXSearchZeroKeywordGadget gadgetSpec](self, "gadgetSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInsets");
  objc_msgSend(v9, "setContentInset:");

  objc_msgSend(v9, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v9, "setPrefetchDataSource:", self);
  objc_msgSend(v9, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v9, "setAlwaysBounceHorizontal:", 1);
  objc_msgSend(v9, "setClipsToBounds:", 0);
  objc_msgSend(v9, "setFocusGroupIdentifier:", 0);

}

- (PXSearchZeroKeywordGadgetLayout)zeroKeywordGadgetLayout
{
  void *v2;
  void *v3;

  -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXSearchZeroKeywordGadgetLayout *)v3;
}

- (void)_configureCellLabelNumberOfLinesWithScreenSize:(CGSize)a3
{
  double width;
  void *v5;
  NSString *v6;
  _BOOL8 IsAccessibilityCategory;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  id v21;

  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);
  -[PXSearchZeroKeywordGadget gadgetSpec](self, "gadgetSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInsets");
  +[PXSearchZeroKeywordCollectionViewCell expectedNumberOfCellsVisibleWithAccessibilityText:withInset:cellSpacing:screenWidth:](PXSearchZeroKeywordCollectionViewCell, "expectedNumberOfCellsVisibleWithAccessibilityText:withInset:cellSpacing:screenWidth:", IsAccessibilityCategory);
  v10 = v9;

  v11 = vcvtad_u64_f64(v10);
  v12 = -[PXSearchZeroKeywordGadget dataSourceSection](self, "dataSourceSection");
  -[PXSearchZeroKeywordGadget zeroKeywordDataSource](self, "zeroKeywordDataSource");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v21, "numberOfItemsInSection:", v12);
  if (v11)
  {
    v14 = v13;
    v15 = 0;
    while (1)
    {
      if (v15 < v14)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v15, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "viewModelForIndexPath:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSearchZeroKeywordGadget getCellSizeWithScreenWidth:](self, "getCellSizeWithScreenWidth:", width);
        v19 = +[PXSearchZeroKeywordCollectionViewCell cellLabelTextNeedsMultipleLines:cellWidth:](PXSearchZeroKeywordCollectionViewCell, "cellLabelTextNeedsMultipleLines:cellWidth:", v18);

        if (v19)
          break;
      }
      if (v11 == ++v15)
        goto LABEL_6;
    }
    v20 = 2;
  }
  else
  {
LABEL_6:
    v20 = 1;
  }
  -[PXSearchZeroKeywordGadget setCellLabelNumberOfLinesPermitted:](self, "setCellLabelNumberOfLinesPermitted:", v20);

}

- (void)_fetchPlaceThumbnailForCell:(id)a3 itemType:(int64_t)a4 key:(id)a5 currentTag:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  int64_t v27;

  v10 = a3;
  v11 = a5;
  -[PXSearchZeroKeywordGadget traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceStyle");
  -[PXSearchZeroKeywordGadget placesThumbnailManager](self, "placesThumbnailManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = a4 == 6;
  -[PXSearchZeroKeywordGadget getCellSize](self, "getCellSize");
  v17 = v16;
  v19 = v18;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __81__PXSearchZeroKeywordGadget__fetchPlaceThumbnailForCell_itemType_key_currentTag___block_invoke;
  v22[3] = &unk_1E51255D8;
  v22[4] = self;
  v23 = v10;
  v24 = v11;
  v25 = v13;
  v26 = a6;
  v27 = a4;
  v20 = v11;
  v21 = v10;
  objc_msgSend(v14, "fetchPlacesThumbnailForPlaceName:placeIsHome:traitCollection:withSize:completion:", v20, v15, v12, v22, v17, v19);

}

- (unint64_t)placeTileFetchCounter
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PXSearchZeroKeywordGadget placeTileFetchCounterQueue](self, "placeTileFetchCounterQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PXSearchZeroKeywordGadget_placeTileFetchCounter__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setPlaceTileFetchCounter:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[PXSearchZeroKeywordGadget placeTileFetchCounterQueue](self, "placeTileFetchCounterQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PXSearchZeroKeywordGadget_setPlaceTileFetchCounter___block_invoke;
  v6[3] = &unk_1E5144EB8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (void)_updateCurrentContentOffsetWithProposedOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInset");

  -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentSize");
  -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  CGRectGetWidth(v15);

  -[PXSearchZeroKeywordGadget zeroKeywordGadgetLayout](self, "zeroKeywordGadgetLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", x, y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v11 = v10;

  PXClamp();
  v13 = v12;
  -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentOffset:", v13, v11);

}

- (PHCachingImageManager)imageManager
{
  PHCachingImageManager *imageManager;
  PHCachingImageManager *v4;
  PHCachingImageManager *v5;

  imageManager = self->_imageManager;
  if (!imageManager)
  {
    v4 = (PHCachingImageManager *)objc_alloc_init(MEMORY[0x1E0CD1488]);
    v5 = self->_imageManager;
    self->_imageManager = v4;

    imageManager = self->_imageManager;
  }
  return imageManager;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[PXSearchZeroKeywordGadget zeroKeywordDataSource](self, "zeroKeywordDataSource", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", -[PXSearchZeroKeywordGadget dataSourceSection](self, "dataSourceSection"));

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  CGFloat Width;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  _QWORD v48[5];
  BOOL v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  void *v53;
  _QWORD v54[3];
  CGRect v55;

  v54[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PXSearchZeroKeywordGadget zeroKeywordDataSource](self, "zeroKeywordDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXSearchZeroKeywordGadget dataSourceSection](self, "dataSourceSection");
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v6, "item"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModelForIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "itemType");
  if (v12 < 2)
  {
    +[PXPeopleZeroKeywordCollectionViewCell reuseIdentifier](PXPeopleZeroKeywordCollectionViewCell, "reuseIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v29, v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "title");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchZeroKeywordCollectionViewCell attributedStringForCellLabelWithString:](PXSearchZeroKeywordCollectionViewCell, "attributedStringForCellLabelWithString:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "textLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAttributedText:", v31);

    v33 = -[PXSearchZeroKeywordGadget cellLabelNumberOfLinesPermitted](self, "cellLabelNumberOfLinesPermitted");
    objc_msgSend(v28, "textLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setNumberOfLines:", v33);

    if (v12)
    {
      objc_msgSend(v11, "socialGroup");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      Width = 4.0;
    }
    else
    {
      objc_msgSend(v11, "person");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "frame");
      Width = CGRectGetWidth(v55);

    }
    -[PXSearchZeroKeywordGadget getCellThumbnailSize](self, "getCellThumbnailSize");
    objc_msgSend(v28, "setPeople:withThumbnailSize:", v16);
    objc_msgSend(v28, "imageCornerOverlayView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __67__PXSearchZeroKeywordGadget_collectionView_cellForItemAtIndexPath___block_invoke_153;
    v48[3] = &__block_descriptor_41_e45_v16__0___PXMutableRoundedCornerOverlayView__8l;
    *(CGFloat *)&v48[4] = Width;
    v49 = v12 != 0;
    objc_msgSend(v45, "performChanges:", v48);

  }
  else
  {
    v47 = v8;
    +[PXSearchZeroKeywordCollectionViewCell reuseIdentifier](PXSearchZeroKeywordCollectionViewCell, "reuseIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "tag") + 1;
    objc_msgSend(v14, "setTag:", v15);
    v16 = v14;
    objc_msgSend(v11, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchZeroKeywordCollectionViewCell attributedStringForCellLabelWithString:](PXSearchZeroKeywordCollectionViewCell, "attributedStringForCellLabelWithString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAttributedText:", v18);

    v20 = -[PXSearchZeroKeywordGadget cellLabelNumberOfLinesPermitted](self, "cellLabelNumberOfLinesPermitted");
    objc_msgSend(v16, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNumberOfLines:", v20);

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 2)
    {
      objc_msgSend(v16, "imageCornerOverlayView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "performChanges:", &__block_literal_global_96231);

      objc_msgSend(v16, "imageView");
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v23, "setAccessibilityIgnoresInvertColors:", 0);

      objc_msgSend(v11, "displayInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      LOBYTE(v23) = objc_opt_isKindOfClass();
      objc_msgSend(v11, "displayInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if ((v23 & 1) != 0)
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AC8]);
        v27 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v27;
      }
      -[PXSearchZeroKeywordGadget _fetchPlaceThumbnailForCell:itemType:key:currentTag:](self, "_fetchPlaceThumbnailForCell:itemType:key:currentTag:", v16, v12, v26, v15);

      goto LABEL_6;
    }
    if (v12 > 8)
    {
LABEL_6:
      v28 = v16;
      v8 = v47;
      goto LABEL_17;
    }
    v8 = v47;
    if (((1 << v12) & 0x1B8) != 0)
    {
      objc_msgSend(v16, "imageCornerOverlayView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "performChanges:", &__block_literal_global_149);

      objc_msgSend(v11, "asset");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v38 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
        objc_msgSend(v38, "setNetworkAccessAllowed:", 1);
        -[PXSearchZeroKeywordGadget imageManager](self, "imageManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSearchZeroKeywordGadget getCellSize](self, "getCellSize");
        -[PXSearchZeroKeywordGadget view](self, "view");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "px_screenScale");

        PXSizeScale();
        v42 = fmin(v41, 360.0);
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __67__PXSearchZeroKeywordGadget_collectionView_cellForItemAtIndexPath___block_invoke_3;
        v50[3] = &unk_1E5146170;
        v51 = v16;
        v52 = v15;
        objc_msgSend(v39, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v37, 1, v38, v50, v42, v42);
        v54[0] = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "startCachingImagesForAssets:targetSize:contentMode:options:", v43, 1, v38, v42, v42);

        v8 = v47;
      }

    }
    v28 = v16;
  }
LABEL_17:

  return v28;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(a4, "item", a3), -[PXSearchZeroKeywordGadget dataSourceSection](self, "dataSourceSection"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSearchZeroKeywordGadget zeroKeywordDataSource](self, "zeroKeywordDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModelForIndexPath:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchZeroKeywordGadget delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gadgetViewControllerHostingGadget:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "selectZeroKeyword:", v6);

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PXSearchZeroKeywordGadget zeroKeywordDataSource](self, "zeroKeywordDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    v18 = *MEMORY[0x1E0D72AC8];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "item", v18), -[PXSearchZeroKeywordGadget dataSourceSection](self, "dataSourceSection"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "viewModelForIndexPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "itemType");
        if ((v13 | 4) == 6)
        {
          v14 = v13;
          objc_msgSend(v12, "displayInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", v18);
            v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = v15;
          }
          v17 = v16;
          -[PXSearchZeroKeywordGadget _fetchPlaceThumbnailForCell:itemType:key:currentTag:](self, "_fetchPlaceThumbnailForCell:itemType:key:currentTag:", 0, v14, v16, -1);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend(a3, "isTracking"))
  {
    -[PXSearchZeroKeywordGadget delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gadgetViewControllerHostingGadget:", self);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      objc_msgSend(v9, "navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "searchBar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resignFirstResponder");

    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[PXSearchZeroKeywordGadget _scrollViewStoppedScrolling](self, "_scrollViewStoppedScrolling", a3);
}

- (CGSize)getCellSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PXSearchZeroKeywordGadget getCellSizeWithScreenWidth:](self, "getCellSizeWithScreenWidth:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)getCellSizeWithScreenWidth:(double)a3
{
  int64_t v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v4 = -[PXSearchZeroKeywordGadget sectionType](self, "sectionType");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (v4 == 4)
  {
    if (!IsAccessibilityCategory)
    {
      +[PXSearchZeroKeywordCollectionViewCell cellSizeWithoutTextLabel](PXSearchZeroKeywordCollectionViewCell, "cellSizeWithoutTextLabel");
      goto LABEL_9;
    }
    -[PXSearchZeroKeywordGadget gadgetSpec](self, "gadgetSpec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentInsets");
    +[PXSearchZeroKeywordCollectionViewCell cellSizeForAccessibilityTextWithoutTextLabelUsingCollectionInset:collectionCellSpacing:screenWidth:](PXSearchZeroKeywordCollectionViewCell, "cellSizeForAccessibilityTextWithoutTextLabelUsingCollectionInset:collectionCellSpacing:screenWidth:");
  }
  else
  {
    v11 = -[PXSearchZeroKeywordGadget cellLabelNumberOfLinesPermitted](self, "cellLabelNumberOfLinesPermitted");
    if (!IsAccessibilityCategory)
    {
      +[PXSearchZeroKeywordCollectionViewCell cellSizeWithTextLabelNumberOfLines:](PXSearchZeroKeywordCollectionViewCell, "cellSizeWithTextLabelNumberOfLines:", v11);
      goto LABEL_9;
    }
    -[PXSearchZeroKeywordGadget gadgetSpec](self, "gadgetSpec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentInsets");
    +[PXSearchZeroKeywordCollectionViewCell cellSizeForAccessibilityTextWithTextLabelNumberOfLines:collectionInset:collectionCellSpacing:screenWidth:](PXSearchZeroKeywordCollectionViewCell, "cellSizeForAccessibilityTextWithTextLabelNumberOfLines:collectionInset:collectionCellSpacing:screenWidth:", v11);
  }
  v12 = v9;
  v13 = v10;

  v14 = v12;
  v15 = v13;
LABEL_9:
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)getCellThumbnailSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  NSString *v8;
  _BOOL4 IsAccessibilityCategory;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  +[PXSearchZeroKeywordCollectionViewCell thumbnailSize](PXSearchZeroKeywordCollectionViewCell, "thumbnailSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (IsAccessibilityCategory)
  {
    -[PXSearchZeroKeywordGadget gadgetSpec](self, "gadgetSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentInsets");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    +[PXSearchZeroKeywordCollectionViewCell thumbnailSizeForAccessibilityTextUsingCollectionInset:cellSpacing:screenWidth:](PXSearchZeroKeywordCollectionViewCell, "thumbnailSizeForAccessibilityTextUsingCollectionInset:cellSpacing:screenWidth:", v12, v14, v16, v18, 10.0, v20);
    v4 = v21;
    v6 = v22;

  }
  v23 = v4;
  v24 = v6;
  result.height = v24;
  result.width = v23;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[7];
  _QWORD v22[7];
  objc_super v23;

  height = a3.height;
  width = a3.width;
  v23.receiver = self;
  v23.super_class = (Class)PXSearchZeroKeywordGadget;
  v7 = a4;
  -[PXSearchZeroKeywordGadget viewWillTransitionToSize:withTransitionCoordinator:](&v23, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PXSearchZeroKeywordGadget updateCellLabelNumberOfLinesWithScreenSize:](self, "updateCellLabelNumberOfLinesWithScreenSize:", width, height);
  -[PXSearchZeroKeywordGadget collectionViewLayout](self, "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateLayout");

  v9 = -[PXSearchZeroKeywordGadget sectionType](self, "sectionType");
  v10 = MEMORY[0x1E0C809B0];
  if (v9 == 1 || -[PXSearchZeroKeywordGadget sectionType](self, "sectionType") == 4)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredContentSizeCategory");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

    if (IsAccessibilityCategory)
    {
      -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "indexPathsForVisibleItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      v22[1] = 3221225472;
      v22[2] = __80__PXSearchZeroKeywordGadget_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      v22[3] = &unk_1E5125660;
      v22[4] = self;
      *(double *)&v22[5] = width;
      *(double *)&v22[6] = height;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v22);

    }
  }
  -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentOffset");
  v18 = v17;
  v20 = v19;

  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __80__PXSearchZeroKeywordGadget_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v21[3] = &unk_1E5125688;
  v21[4] = self;
  v21[5] = v18;
  v21[6] = v20;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v21, 0);

}

- (void)layoutPeopleViews
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (-[PXSearchZeroKeywordGadget sectionType](self, "sectionType") == 1
    || -[PXSearchZeroKeywordGadget sectionType](self, "sectionType") == 4)
  {
    -[PXSearchZeroKeywordGadget collectionViewLayout](self, "collectionViewLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateLayout");

    -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathsForVisibleItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__PXSearchZeroKeywordGadget_layoutPeopleViews__block_invoke;
    v6[3] = &unk_1E51256B0;
    v6[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  }
}

- (void)updateCellLabelNumberOfLinesWithScreenSize:(CGSize)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PXSearchZeroKeywordGadget _configureCellLabelNumberOfLinesWithScreenSize:](self, "_configureCellLabelNumberOfLinesWithScreenSize:", a3.width, a3.height);
  -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForVisibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        -[PXSearchZeroKeywordGadget collectionView](self, "collectionView", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cellForItemAtIndexPath:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = -[PXSearchZeroKeywordGadget cellLabelNumberOfLinesPermitted](self, "cellLabelNumberOfLinesPermitted");
        objc_msgSend(v13, "textLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setNumberOfLines:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  -[PXSearchZeroKeywordGadget getCellSize](self, "getCellSize", a3);
  v5 = v4 + 10.0;
  -[PXSearchZeroKeywordGadget zeroKeywordGadgetLayout](self, "zeroKeywordGadgetLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColumnWidth:", v5);

  if (-[PXSearchZeroKeywordGadget sectionType](self, "sectionType") == 1
    || -[PXSearchZeroKeywordGadget sectionType](self, "sectionType") == 4)
  {
    -[PXSearchZeroKeywordGadget layoutPeopleViews](self, "layoutPeopleViews");
  }
  else
  {
    -[PXSearchZeroKeywordGadget collectionViewLayout](self, "collectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateLayout");

  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  -[PXSearchZeroKeywordGadget updateCellLabelNumberOfLinesWithScreenSize:](self, "updateCellLabelNumberOfLinesWithScreenSize:", v9, v10);

  -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentOffset");
  -[PXSearchZeroKeywordGadget _updateCurrentContentOffsetWithProposedOffset:](self, "_updateCurrentContentOffsetWithProposedOffset:");

}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  PXDiagnosticsItemProvider *v23;
  char isKindOfClass;
  uint64_t v25;
  id *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[3];

  y = a3.y;
  x = a3.x;
  v42[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[PXSearchZeroKeywordGadget collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v8, "indexPathForItemAtPoint:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchZeroKeywordGadget zeroKeywordDataSource](self, "zeroKeywordDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PXSearchZeroKeywordGadget dataSourceSection](self, "dataSourceSection");
  v35 = v13;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v13, "item"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewModelForIndexPath:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "representedObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v18, "debugDictionary");
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("Zero Keyword Diagnostics"), CFSTR("PXDiagnosticsTitle"));
  objc_msgSend(v17, "debugDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("Debug Dictionary"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, CFSTR("Represented Object"));
  v23 = objc_alloc_init(PXDiagnosticsItemProvider);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v25 = MEMORY[0x1E0C809B0];
  if ((isKindOfClass & 1) != 0)
  {
    v33 = v14;
    v34 = v8;
    objc_msgSend(v17, "asset");
    v40[0] = v25;
    v40[1] = 3221225472;
    v40[2] = __83__PXSearchZeroKeywordGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
    v40[3] = &unk_1E5148158;
    v26 = &v41;
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v27 = v41;
    -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v23, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierAsset"), v40);
    objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "detailedDebugDescriptionInLibrary:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, CFSTR("PHAsset"));

LABEL_7:
    v14 = v33;
    v8 = v34;
    v25 = MEMORY[0x1E0C809B0];
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v14;
    v34 = v8;
    objc_msgSend(v17, "assetCollection");
    v38[0] = v25;
    v38[1] = 3221225472;
    v38[2] = __83__PXSearchZeroKeywordGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_2;
    v38[3] = &unk_1E5148158;
    v26 = &v39;
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v27 = v39;
    -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v23, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierAssetCollection"), v38);
    goto LABEL_7;
  }
LABEL_8:
  v36[0] = v25;
  v36[1] = 3221225472;
  v36[2] = __83__PXSearchZeroKeywordGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_3;
  v36[3] = &unk_1E5148158;
  v37 = v20;
  v30 = v20;
  -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v23, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierDebugDictionary"), v36);
  v42[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)_scrollViewStoppedScrolling
{
  id v3;

  -[PXSearchZeroKeywordGadget _searchHomeViewController](self, "_searchHomeViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zeroKeywordGadgetDidScroll:", self);

}

- (id)_searchHomeViewController
{
  void *v3;
  void *v4;

  -[PXSearchZeroKeywordGadget delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gadgetViewControllerHostingGadget:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (PXSearchZeroKeywordDataSource)zeroKeywordDataSource
{
  return self->_zeroKeywordDataSource;
}

- (unint64_t)dataSourceSection
{
  return self->_dataSourceSection;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (PXPlacesThumbnailManager)placesThumbnailManager
{
  return self->_placesThumbnailManager;
}

- (void)setPlacesThumbnailManager:(id)a3
{
  objc_storeStrong((id *)&self->_placesThumbnailManager, a3);
}

- (unint64_t)cellLabelNumberOfLinesPermitted
{
  return self->_cellLabelNumberOfLinesPermitted;
}

- (void)setCellLabelNumberOfLinesPermitted:(unint64_t)a3
{
  self->_cellLabelNumberOfLinesPermitted = a3;
}

- (OS_dispatch_queue)placeTileFetchCounterQueue
{
  return self->_placeTileFetchCounterQueue;
}

- (void)setPlaceTileFetchCounterQueue:(id)a3
{
  objc_storeStrong((id *)&self->_placeTileFetchCounterQueue, a3);
}

- (void)setImageManager:(id)a3
{
  objc_storeStrong((id *)&self->_imageManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_placeTileFetchCounterQueue, 0);
  objc_storeStrong((id *)&self->_placesThumbnailManager, 0);
  objc_storeStrong((id *)&self->_zeroKeywordDataSource, 0);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

id __83__PXSearchZeroKeywordGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __83__PXSearchZeroKeywordGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __83__PXSearchZeroKeywordGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __46__PXSearchZeroKeywordGadget_layoutPeopleViews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "getCellThumbnailSize");
  objc_msgSend(v6, "setThumbnailSize:");

}

void __80__PXSearchZeroKeywordGadget_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "gadgetSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInsets");
  +[PXSearchZeroKeywordCollectionViewCell thumbnailSizeForAccessibilityTextUsingCollectionInset:cellSpacing:screenWidth:](PXSearchZeroKeywordCollectionViewCell, "thumbnailSizeForAccessibilityTextUsingCollectionInset:cellSpacing:screenWidth:");
  objc_msgSend(v7, "setThumbnailSize:");

}

uint64_t __80__PXSearchZeroKeywordGadget_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentContentOffsetWithProposedOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __67__PXSearchZeroKeywordGadget_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[4];
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5
    && (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PXSearchZeroKeywordGadget_collectionView_cellForItemAtIndexPath___block_invoke_4;
    block[3] = &unk_1E5145560;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13 = v10;
    v15 = v11;
    v14 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v9 = v13;
  }
  else
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v5;
      v18 = 2112;
      v19 = v7;
      v20 = 2080;
      v21 = "-[PXSearchZeroKeywordGadget collectionView:cellForItemAtIndexPath:]_block_invoke_3";
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Error fetching thumbnail for Search Zero Keyword cell. Image: %@, Info Dictionary: %@, Function: %s", buf, 0x20u);
    }
  }

}

void __67__PXSearchZeroKeywordGadget_collectionView_cellForItemAtIndexPath___block_invoke_153(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setCornerRadius:", v3);
  objc_msgSend(v4, "setContinuousCorners:", *(unsigned __int8 *)(a1 + 40));

}

void __67__PXSearchZeroKeywordGadget_collectionView_cellForItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 48))
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "imageView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v2);

  }
}

void __67__PXSearchZeroKeywordGadget_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setCornerRadius:", 4.0);
  objc_msgSend(v2, "setContinuousCorners:", 1);

}

void __67__PXSearchZeroKeywordGadget_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setCornerRadius:", 4.0);
  objc_msgSend(v2, "setContinuousCorners:", 1);

}

uint64_t __54__PXSearchZeroKeywordGadget_setPlaceTileFetchCounter___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 1032) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __50__PXSearchZeroKeywordGadget_placeTileFetchCounter__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 1032);
  return result;
}

void __81__PXSearchZeroKeywordGadget__fetchPlaceThumbnailForCell_itemType_key_currentTag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  dispatch_time_t v8;
  uint64_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23[3];
  _BYTE location[12];
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPlaceTileFetchCounter:", 0);
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__PXSearchZeroKeywordGadget__fetchPlaceThumbnailForCell_itemType_key_currentTag___block_invoke_2;
    block[3] = &unk_1E5130118;
    objc_copyWeak(v23, (id *)location);
    v23[1] = *(id *)(a1 + 56);
    v4 = *(id *)(a1 + 40);
    v5 = *(void **)(a1 + 64);
    v20 = v4;
    v23[2] = v5;
    v21 = v3;
    v22 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v23);
    objc_destroyWeak((id *)location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPlaceTileFetchCounter:", objc_msgSend(*(id *)(a1 + 32), "placeTileFetchCounter") + 1);
    v6 = objc_msgSend(*(id *)(a1 + 32), "placeTileFetchCounter");
    v7 = v6;
    if (v6 > 0x1E)
    {
      v10 = dispatch_time(0, 60000000000);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __81__PXSearchZeroKeywordGadget__fetchPlaceThumbnailForCell_itemType_key_currentTag___block_invoke_4;
      v15[3] = &unk_1E5144EB8;
      v15[4] = *(_QWORD *)(a1 + 32);
      v15[5] = v7;
      dispatch_after(v10, MEMORY[0x1E0C80D38], v15);
      PLUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 40);
        v12 = *(_QWORD *)(a1 + 48);
        PLSearchHomeItemTypeName();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138413314;
        *(_QWORD *)&location[4] = v12;
        v25 = 2048;
        v26 = v7;
        v27 = 2112;
        v28 = v13;
        v29 = 2112;
        v30 = v14;
        v31 = 2080;
        v32 = "-[PXSearchZeroKeywordGadget _fetchPlaceThumbnailForCell:itemType:key:currentTag:]_block_invoke";
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Retry counter exceeded limit for place: %@, counter: %lu, cell: %@, itemType: %@, function: %s", location, 0x34u);

      }
    }
    else
    {
      v8 = dispatch_time(0, 2000000000 * v6);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __81__PXSearchZeroKeywordGadget__fetchPlaceThumbnailForCell_itemType_key_currentTag___block_invoke_3;
      v16[3] = &unk_1E5145560;
      v9 = *(_QWORD *)(a1 + 72);
      v16[4] = *(_QWORD *)(a1 + 32);
      v18 = v9;
      v17 = *(id *)(a1 + 48);
      dispatch_after(v8, MEMORY[0x1E0C80D38], v16);

    }
  }

}

void __81__PXSearchZeroKeywordGadget__fetchPlaceThumbnailForCell_itemType_key_currentTag___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  v6 = *(_QWORD *)(a1 + 64);

  if (v5 == v6)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 72))
    {
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "imageView");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setImage:", v7);
LABEL_7:

      return;
    }
    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "zeroKeywordDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexForPlaceKey:", *(_QWORD *)(a1 + 48));

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v10, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained(v2);
      objc_msgSend(v11, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cellForItemAtIndexPath:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v13, "imageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setImage:", v14);

      goto LABEL_7;
    }
  }
}

uint64_t __81__PXSearchZeroKeywordGadget__fetchPlaceThumbnailForCell_itemType_key_currentTag___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlaceThumbnailForCell:itemType:key:currentTag:", 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), -1);
}

uint64_t __81__PXSearchZeroKeywordGadget__fetchPlaceThumbnailForCell_itemType_key_currentTag___block_invoke_4(uint64_t result)
{
  if (*(_QWORD *)(result + 40) >= 0x1FuLL)
    return objc_msgSend(*(id *)(result + 32), "setPlaceTileFetchCounter:", 0);
  return result;
}

@end
