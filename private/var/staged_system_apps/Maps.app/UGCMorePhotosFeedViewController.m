@implementation UGCMorePhotosFeedViewController

- (NSString)downloadToken
{
  NSString *downloadToken;
  id v4;
  NSString *v5;
  NSString *v6;

  downloadToken = self->_downloadToken;
  if (!downloadToken)
  {
    v4 = +[UGCPhotoDownloadManager generateRandomizedDownloadTokenForClass:](UGCPhotoDownloadManager, "generateRandomizedDownloadTokenForClass:", objc_opt_class(self));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_downloadToken;
    self->_downloadToken = v5;

    downloadToken = self->_downloadToken;
  }
  return downloadToken;
}

- (GEOMapItemPhotoOptions)thumbnailOptionsForMorePhotosFeed
{
  if (qword_1014D37C0 != -1)
    dispatch_once(&qword_1014D37C0, &stru_1011DA3B8);
  return (GEOMapItemPhotoOptions *)(id)qword_1014D37B8;
}

- (BOOL)shouldShowFloatingButtons
{
  return sub_1002A8AA0(self) != 5;
}

- (BOOL)shouldShowAddPhotosButton
{
  return -[UGCPhotoViewerDataSource isAllowedToShowAddPhotosCallToAction](self->_dataSource, "isAllowedToShowAddPhotosCallToAction");
}

- (BOOL)supportsPhotoAlbums
{
  UGCPhotoViewerDataSource *dataSource;

  dataSource = self->_dataSource;
  if (dataSource)
    LOBYTE(dataSource) = -[UGCPhotoViewerDataSource numberOfCategories](dataSource, "numberOfCategories") > 1;
  return (char)dataSource;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  double y;
  double width;
  double height;
  UICollectionView *v8;
  UICollectionView *collectionView;
  void *v10;
  id v11;
  UICollectionView *v12;
  _QWORD *v13;
  void *v14;
  UICollectionViewDiffableDataSource *v15;
  UICollectionViewDiffableDataSource *diffableDataSource;
  uint64_t v17;
  UGCPhotoFeedHeaderView *v18;
  UGCPhotoFeedHeaderView *headerGradientView;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  MUScrollableSegmentedPickerView *v30;
  MUScrollableSegmentedPickerView *albumFilterView;
  void *v32;
  id v33;
  void *v34;
  LoadingModeView *v35;
  void *v36;
  void *v37;
  LoadingModeView *v38;
  LoadingModeView *loadingModeView;
  ErrorModeView *v40;
  ErrorModeView *errorModeView;
  void *v42;
  UICollectionView *v43;
  uint64_t v44;
  void *v45;
  UICollectionView *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *gradientHeightConstraint;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSLayoutConstraint *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  objc_super v122;
  _QWORD v123[3];
  _QWORD v124[13];
  _QWORD v125[4];
  _QWORD v126[4];

  v122.receiver = self;
  v122.super_class = (Class)UGCMorePhotosFeedViewController;
  -[UGCMorePhotosFeedViewController viewDidLoad](&v122, "viewDidLoad");
  -[UGCPhotoViewerDataSource setActive:](self->_dataSource, "setActive:", 1);
  v3 = objc_alloc((Class)UICollectionView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController _thumbnailGalleryLayout](self, "_thumbnailGalleryLayout"));
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, CGRectZero.origin.x, y, width, height);
  collectionView = self->_collectionView;
  self->_collectionView = v8;

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setBounces:](self->_collectionView, "setBounces:", 1);
  -[UICollectionView setContentInsetAdjustmentBehavior:](self->_collectionView, "setContentInsetAdjustmentBehavior:", 2);
  -[UICollectionView setAutomaticallyAdjustsScrollIndicatorInsets:](self->_collectionView, "setAutomaticallyAdjustsScrollIndicatorInsets:", 0);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v10);

  -[UICollectionView setAccessibilityIdentifier:](self->_collectionView, "setAccessibilityIdentifier:", CFSTR("PhotosFeedCollectionView"));
  v11 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v12 = self->_collectionView;
  v13 = sub_10046DA38(self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (UICollectionViewDiffableDataSource *)objc_msgSend(v11, "initWithCollectionView:cellProvider:", v12, v14);
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v15;

  if (-[UGCMorePhotosFeedViewController shouldShowFloatingButtons](self, "shouldShowFloatingButtons"))
  {
    if (-[UGCMorePhotosFeedViewController shouldShowAddPhotosButton](self, "shouldShowAddPhotosButton"))
      v17 = 3;
    else
      v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  v18 = -[UGCPhotoFeedHeaderView initWithOptions:]([UGCPhotoFeedHeaderView alloc], "initWithOptions:", v17);
  headerGradientView = self->_headerGradientView;
  self->_headerGradientView = v18;

  -[UGCPhotoFeedHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerGradientView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UGCPhotoFeedHeaderView setPreservesSuperviewLayoutMargins:](self->_headerGradientView, "setPreservesSuperviewLayoutMargins:", 1);
  -[UGCPhotoFeedHeaderView setDelegate:](self->_headerGradientView, "setDelegate:", self);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "colorWithAlphaComponent:", 0.42));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "colorWithAlphaComponent:", 0.4));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "colorWithAlphaComponent:", 0.13));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "colorWithAlphaComponent:", 0.0));

  v118 = (void *)v23;
  v119 = (void *)v21;
  v126[0] = v21;
  v126[1] = v23;
  v116 = (void *)v27;
  v117 = (void *)v25;
  v126[2] = v25;
  v126[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v126, 4));
  -[UGCPhotoFeedHeaderView setColors:](self->_headerGradientView, "setColors:", v28);

  v125[0] = &off_101275218;
  v125[1] = &off_101274FE8;
  v125[2] = &off_101274FF8;
  v125[3] = &off_101275228;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v125, 4));
  -[UGCPhotoFeedHeaderView setLocations:](self->_headerGradientView, "setLocations:", v29);

  if (-[UGCPhotoViewerDataSource numberOfCategories](self->_dataSource, "numberOfCategories") >= 2)
  {
    v30 = (MUScrollableSegmentedPickerView *)objc_msgSend(objc_alloc((Class)MUScrollableSegmentedPickerView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    albumFilterView = self->_albumFilterView;
    self->_albumFilterView = v30;

    -[MUScrollableSegmentedPickerView setTranslatesAutoresizingMaskIntoConstraints:](self->_albumFilterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource albumCategories](self->_dataSource, "albumCategories"));
    v33 = sub_10039DCD4(v32, &stru_1011DA3F8);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    -[MUScrollableSegmentedPickerView setViewModels:](self->_albumFilterView, "setViewModels:", v34);

    -[MUScrollableSegmentedPickerView setSelectedIndex:](self->_albumFilterView, "setSelectedIndex:", -[UGCMorePhotosFeedViewController selectedAlbumIndex](self, "selectedAlbumIndex"));
    -[MUScrollableSegmentedPickerView setDelegate:](self->_albumFilterView, "setDelegate:", self);
  }
  v35 = [LoadingModeView alloc];
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Loading ..."), CFSTR("localized string not found"), 0));
  v38 = -[LoadingModeView initWithTitle:](v35, "initWithTitle:", v37);
  loadingModeView = self->_loadingModeView;
  self->_loadingModeView = v38;

  -[LoadingModeView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingModeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v40 = objc_alloc_init(ErrorModeView);
  errorModeView = self->_errorModeView;
  self->_errorModeView = v40;

  -[ErrorModeView setTranslatesAutoresizingMaskIntoConstraints:](self->_errorModeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  objc_msgSend(v42, "setAccessibilityIdentifier:", CFSTR("PhotosFeedView"));
  objc_msgSend(v42, "addSubview:", self->_collectionView);
  objc_msgSend(v42, "addSubview:", self->_loadingModeView);
  v120 = v42;
  objc_msgSend(v42, "addSubview:", self->_headerGradientView);
  if (-[UGCMorePhotosFeedViewController supportsPhotoAlbums](self, "supportsPhotoAlbums"))
    objc_msgSend(v42, "addSubview:", self->_albumFilterView);
  v43 = self->_collectionView;
  v44 = objc_opt_class(UGCPhotoThumbnailCollectionViewCell);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoThumbnailCollectionViewCell reuseIdentifier](UGCPhotoThumbnailCollectionViewCell, "reuseIdentifier"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v43, "registerClass:forCellWithReuseIdentifier:", v44, v45);

  v46 = self->_collectionView;
  v47 = objc_opt_class(MKCollectionBatchCell);
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v46, "registerClass:forCellWithReuseIdentifier:", v47, v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView heightAnchor](self->_headerGradientView, "heightAnchor"));
  -[UGCMorePhotosFeedViewController _scaledGradientHeight](self, "_scaledGradientHeight");
  v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToConstant:"));
  gradientHeightConstraint = self->_gradientHeightConstraint;
  self->_gradientHeightConstraint = v50;

  v121 = objc_alloc_init((Class)NSMutableArray);
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_collectionView, "topAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "topAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v110));
  v124[0] = v108;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "leadingAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:", v105));
  v124[1] = v104;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "trailingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v101));
  v124[2] = v100;
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "bottomAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v97));
  v124[3] = v96;
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView topAnchor](self->_loadingModeView, "topAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "topAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v93));
  v124[4] = v92;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView leadingAnchor](self->_loadingModeView, "leadingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "leadingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v89));
  v124[5] = v88;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView trailingAnchor](self->_loadingModeView, "trailingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "trailingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v85));
  v124[6] = v84;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView bottomAnchor](self->_loadingModeView, "bottomAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "bottomAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v81));
  v124[7] = v80;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView topAnchor](self->_headerGradientView, "topAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v77));
  v124[8] = v76;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView leadingAnchor](self->_headerGradientView, "leadingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
  v124[9] = v72;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView trailingAnchor](self->_headerGradientView, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v54));
  v124[10] = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoFeedHeaderView bottomAnchor](self->_headerGradientView, "bottomAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:", v58));
  v60 = self->_gradientHeightConstraint;
  v124[11] = v59;
  v124[12] = v60;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v124, 13));
  objc_msgSend(v121, "addObjectsFromArray:", v61);

  if (-[UGCMorePhotosFeedViewController supportsPhotoAlbums](self, "supportsPhotoAlbums"))
  {
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableSegmentedPickerView leadingAnchor](self->_albumFilterView, "leadingAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "layoutMarginsGuide"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "leadingAnchor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:", v111));
    v123[0] = v109;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableSegmentedPickerView trailingAnchor](self->_albumFilterView, "trailingAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "layoutMarginsGuide"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "trailingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v64));
    v123[1] = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollableSegmentedPickerView bottomAnchor](self->_albumFilterView, "bottomAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "layoutMarginsGuide"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "bottomAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v68, -8.0));
    v123[2] = v69;
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v123, 3));
    objc_msgSend(v121, "addObjectsFromArray:", v70);

  }
  v71 = objc_msgSend(v121, "copy");
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v71);

  -[UGCPhotoViewerDataSource setAlbumIndex:](self->_dataSource, "setAlbumIndex:", -[UGCMorePhotosFeedViewController selectedAlbumIndex](self, "selectedAlbumIndex"));
  -[UGCPhotoViewerDataSource setIndexOfTappedPhoto:](self->_dataSource, "setIndexOfTappedPhoto:", -[UGCMorePhotosFeedViewController startingImageIndex](self, "startingImageIndex"));
  -[UGCMorePhotosFeedViewController _updateHeaderIfNeeded](self, "_updateHeaderIfNeeded");
  -[UGCPhotoViewerDataSource fetchNextBatchRequestIfNeeded](self->_dataSource, "fetchNextBatchRequestIfNeeded");

}

- (void)_attachErrorView
{
  ErrorModeView *errorModeView;
  void *v4;
  void *v5;
  ErrorModeView *v6;
  void *v7;
  id v8;

  -[LoadingModeView removeFromSuperview](self->_loadingModeView, "removeFromSuperview");
  errorModeView = self->_errorModeView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UGCErrorStringBuilder buildBestErrorStringForCurrentNetworkState](UGCErrorStringBuilder, "buildBestErrorStringForCurrentNetworkState"));
  -[ErrorModeView setTitle:andMessage:](errorModeView, "setTitle:andMessage:", &stru_1011EB268, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  objc_msgSend(v5, "insertSubview:aboveSubview:", self->_errorModeView, self->_collectionView);

  v6 = self->_errorModeView;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView _maps_constraintsForCenteringInView:](v6, "_maps_constraintsForCenteringInView:", v8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

}

- (UGCMorePhotosFeedViewController)initWithMapItem:(id)a3
{
  id v5;
  UGCMorePhotosFeedViewController *v6;
  UGCMorePhotosFeedViewController *v7;
  uint64_t v8;
  UGCPhotoDownloadManager *photoDownloadManager;
  UGCPhotoViewerDataSource *v10;
  void *v11;
  UGCPhotoViewerDataSource *v12;
  UGCPhotoViewerDataSource *dataSource;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UGCMorePhotosFeedViewController;
  v6 = -[UGCMorePhotosFeedViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[UGCPhotoDownloadManager sharedDownloadManager](UGCPhotoDownloadManager, "sharedDownloadManager"));
    photoDownloadManager = v7->_photoDownloadManager;
    v7->_photoDownloadManager = (UGCPhotoDownloadManager *)v8;

    v10 = [UGCPhotoViewerDataSource alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController mapItem](v7, "mapItem"));
    v12 = -[UGCPhotoViewerDataSource initWithMapItem:delegate:](v10, "initWithMapItem:delegate:", v11, v7);
    dataSource = v7->_dataSource;
    v7->_dataSource = v12;

    v7->_shouldCancelImageDownloads = GEOConfigGetBOOL(MapsConfig_ThumbnailPhotoViewerShouldCancelDownloads, off_1014B4728);
  }

  return v7;
}

- (id)_thumbnailGalleryLayout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController traitCollection](self, "traitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UGCMorePhotosFeedLayoutBuilder thumbnailGalleryLayoutForTraitCollection:](UGCMorePhotosFeedLayoutBuilder, "thumbnailGalleryLayoutForTraitCollection:", v2));

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  UICollectionView *collectionView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UGCMorePhotosFeedViewController;
  -[UGCMorePhotosFeedViewController traitCollectionDidChange:](&v16, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "verticalSizeClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController traitCollection](self, "traitCollection"));
  if (v5 != objc_msgSend(v6, "verticalSizeClass"))
  {

    goto LABEL_5;
  }
  v7 = objc_msgSend(v4, "horizontalSizeClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController traitCollection](self, "traitCollection"));
  v9 = objc_msgSend(v8, "horizontalSizeClass");

  if (v7 != v9)
  {
LABEL_5:
    collectionView = self->_collectionView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController _thumbnailGalleryLayout](self, "_thumbnailGalleryLayout"));
    -[UICollectionView setCollectionViewLayout:](collectionView, "setCollectionViewLayout:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController traitCollection](self, "traitCollection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "preferredContentSizeCategory"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v15 = sub_1002A8950(v13, v14);

  if (v15)
  {
    -[UGCMorePhotosFeedViewController _scaledGradientHeight](self, "_scaledGradientHeight");
    -[NSLayoutConstraint setConstant:](self->_gradientHeightConstraint, "setConstant:");
  }

}

- (void)_updateHeaderIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  UGCMorePhotosFeedViewController *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;

  if (-[UGCMorePhotosFeedViewController shouldShowFloatingButtons](self, "shouldShowFloatingButtons"))
  {
    if (-[UGCMorePhotosFeedViewController shouldShowAddPhotosButton](self, "shouldShowAddPhotosButton"))
      v3 = 3;
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _allPhotoAttributions](self->_mapItem, "_allPhotoAttributions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Photos"), CFSTR("localized string not found"), 0));

  if (objc_msgSend(v4, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MUPlacePhotoHeaderAttributionFormatter formattedHeaderStringForPhotoAttributions:](MUPlacePhotoHeaderAttributionFormatter, "formattedHeaderStringForPhotoAttributions:", v4));
    if (objc_msgSend(v7, "length"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Photos from %@"), CFSTR("localized string not found"), 0));

      v28 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7));
    }
    else
    {
      v28 = v6;
    }

  }
  else
  {
    v28 = v6;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self->_mapItem, "name"));
  v11 = -[UGCPhotoViewerDataSource totalNumberOfPhotosForCurrentDataProvider](self->_dataSource, "totalNumberOfPhotosForCurrentDataProvider");
  v12 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("%@ · %lu [Photo viewer header subtitle]"), CFSTR("localized string not found"), 0));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v12, v11));
  if (-[UGCMorePhotosFeedViewController supportsPhotoAlbums](self, "supportsPhotoAlbums"))
  {
    v16 = -[MUScrollableSegmentedPickerView selectedIndex](self->_albumFilterView, "selectedIndex");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource albumCategories](self->_dataSource, "albumCategories"));
    v18 = objc_msgSend(v17, "count");

    if (v16 < v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource albumCategories](self->_dataSource, "albumCategories"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", -[MUScrollableSegmentedPickerView selectedIndex](self->_albumFilterView, "selectedIndex")));

      if (v20)
      {
        v21 = objc_msgSend(v20, "categoryType");
        if ((unint64_t)v21 >= 2)
        {
          if (v21 != (id)2)
          {
            v22 = 0;
            v27 = 0;
LABEL_25:
            -[UGCMorePhotosFeedViewController _updateHeaderViewWithTitleText:subtitleText:options:](self, "_updateHeaderViewWithTitleText:subtitleText:options:", v22, v27, v3);

            goto LABEL_20;
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Photos From You"), CFSTR("localized string not found"), 0));

        }
        else
        {
          v22 = v28;
        }
        v27 = v15;
        goto LABEL_25;
      }
    }
    v23 = self;
    v24 = v28;
    v25 = v28;
  }
  else
  {
    v23 = self;
    v24 = v28;
    v25 = v15;
  }
  -[UGCMorePhotosFeedViewController _updateHeaderViewWithTitleText:subtitleText:options:](v23, "_updateHeaderViewWithTitleText:subtitleText:options:", v24, v25, v3);
LABEL_20:

}

- (void)_updateHeaderViewWithTitleText:(id)a3 subtitleText:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  UGCPhotoFeedHeaderTitleModel *v10;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(UGCPhotoFeedHeaderTitleModel);
  -[UGCPhotoFeedHeaderTitleModel setShowPunchoutSymbol:](v10, "setShowPunchoutSymbol:", -[UGCPhotoViewerDataSource isSingleVendorThatHasPhotosNeedingObfuscation](self->_dataSource, "isSingleVendorThatHasPhotosNeedingObfuscation"));
  -[UGCPhotoFeedHeaderTitleModel setTitleText:](v10, "setTitleText:", v9);

  -[UGCPhotoFeedHeaderView setTitleModel:](self->_headerGradientView, "setTitleModel:", v10);
  -[UGCPhotoFeedHeaderView setSubtitleText:](self->_headerGradientView, "setSubtitleText:", v8);

  -[UGCPhotoFeedHeaderView setOptions:](self->_headerGradientView, "setOptions:", a5);
}

- (double)_scaledGradientHeight
{
  double result;

  -[UGCPhotoFeedHeaderView heightForUnscaledHeight:](self->_headerGradientView, "heightForUnscaledHeight:", 200.0);
  return result;
}

- (void)photoFeedHeaderView:(id)a3 selectedDoneWithPresentationOptions:(id)a4
{
  -[UGCMorePhotosFeedViewController _doneButtonPressed](self, "_doneButtonPressed", a3, a4);
}

- (void)_doneButtonPressed
{
  UGCMorePhotosFeedViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "photoThumbnailGalleryViewControllerDidSelectDone:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "photoThumbnailGalleryViewControllerDidSelectDone:", self);

  }
}

- (void)photoFeedHeaderView:(id)a3 selectedAddPhotoWithEntryPoint:(int64_t)a4 usingPresentationOptions:(id)a5
{
  UGCMorePhotosFeedViewControllerDelegate **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "photoThumbnailGalleryViewController:selectedAddPhotosUsingEntryPoint:presentationOptions:", self, a4, v8);

}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputEscape, 0, "_doneButtonPressed"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  UGCPhotoDownloadManager *photoDownloadManager;
  void *v36;
  id v37;
  id v38;
  void *v39;
  _QWORD v41[4];
  id v42;
  void *v43;

  v8 = a4;
  v9 = a3;
  if (objc_msgSend(a5, "isEqual:", CFSTR("LoadingCellIdentifier")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v8));

    objc_msgSend(v11, "startedLoadingBatch");
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoThumbnailCollectionViewCell reuseIdentifier](UGCPhotoThumbnailCollectionViewCell, "reuseIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v8));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController photoList](self, "photoList"));
    v15 = objc_msgSend(v8, "row");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController traitCollection](self, "traitCollection"));
    objc_msgSend(v17, "displayScale");
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "geoMapItemPhoto"));
    objc_msgSend(v13, "frame");
    v22 = v21;
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController thumbnailOptionsForMorePhotosFeed](self, "thumbnailOptionsForMorePhotosFeed"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bestPhotoForFrameSize:displayScale:options:", v25, v22, v24, v19));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "photoID"));
    objc_msgSend(v13, "setAssetIdentifier:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UGCDownloadablePhotoInfoComposer downloadablePhotoForGeoMapItemPhotoInfo:](UGCDownloadablePhotoInfoComposer, "downloadablePhotoForGeoMapItemPhotoInfo:", v26));
    v29 = objc_msgSend(v16, "needsObfuscationWhenRenderedInFullScreen");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController mapItem](self, "mapItem"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_allPhotoAttributions"));
    v32 = objc_msgSend(v31, "count");

    if (v32 == (id)1 || (v29 & 1) == 0)
    {
      objc_msgSend(v13, "setProviderName:", 0);
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attribution"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "providerName"));
      objc_msgSend(v13, "setProviderName:", v34);

    }
    photoDownloadManager = self->_photoDownloadManager;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController downloadToken](self, "downloadToken"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1008A0E7C;
    v41[3] = &unk_1011DA420;
    v37 = v13;
    v42 = v37;
    v43 = v16;
    v38 = v16;
    -[UGCPhotoDownloadManager fetchImageForPhotoInfo:downloadToken:completion:](photoDownloadManager, "fetchImageForPhotoInfo:downloadToken:completion:", v28, v36, v41);

    v39 = v43;
    v11 = v37;

  }
  return v11;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  uint64_t v7;
  char isKindOfClass;

  v6 = a4;
  v7 = objc_opt_class(MKCollectionBatchCell);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
    -[UGCPhotoViewerDataSource fetchNextBatchRequestIfNeeded](self->_dataSource, "fetchNextBatchRequestIfNeeded");
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  UGCPhotoDownloadManager *photoDownloadManager;
  void *v19;
  id v20;

  v20 = a4;
  v7 = a5;
  if (-[UGCMorePhotosFeedViewController shouldCancelImageDownloads](self, "shouldCancelImageDownloads"))
  {
    v8 = objc_msgSend(v7, "row");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController photoList](self, "photoList"));
    v10 = objc_msgSend(v9, "count");

    if (v8 < v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController photoList](self, "photoList"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row")));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geoMapItemPhoto"));
      objc_msgSend(v20, "frame");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bestPhotoForSize:allowSmaller:", 1, v14, v15));

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UGCDownloadablePhotoInfoComposer downloadablePhotoForGeoMapItemPhotoInfo:](UGCDownloadablePhotoInfoComposer, "downloadablePhotoForGeoMapItemPhotoInfo:", v16));
      photoDownloadManager = self->_photoDownloadManager;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController downloadToken](self, "downloadToken"));
      -[UGCPhotoDownloadManager cancelRequestForPhotoInfo:downloadToken:](photoDownloadManager, "cancelRequestForPhotoInfo:downloadToken:", v17, v19);

    }
  }

}

- (void)_updateSnapshotForCurrentState
{
  id v3;
  void *v4;
  void *v5;
  UICollectionViewDiffableDataSource *diffableDataSource;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", &off_101273E60);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController photoList](self, "photoList"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController photoList](self, "photoList"));
    objc_msgSend(v3, "appendItemsWithIdentifiers:", v5);

  }
  if (!-[UGCPhotoViewerDataSource hasReachedTotalCount](self->_dataSource, "hasReachedTotalCount"))
  {
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", &off_101273E78);
    objc_msgSend(v3, "appendItemsWithIdentifiers:", &off_101273E90);
  }
  objc_initWeak(&location, self);
  diffableDataSource = self->_diffableDataSource;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008A1340;
  v7[3] = &unk_1011AD260;
  objc_copyWeak(&v8, &location);
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:](diffableDataSource, "applySnapshot:animatingDifferences:completion:", v3, 1, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "row");
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v6));

  v9 = objc_msgSend(v6, "row");
  -[UGCMorePhotosFeedViewController _captureUserAction:index:](self, "_captureUserAction:index:", 6006, v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCMorePhotosFeedViewController photoList](self, "photoList"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource currentAlbumCategory](self->_dataSource, "currentAlbumCategory"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "photoImageView"));
  objc_msgSend(WeakRetained, "photoThumbnailGalleryViewController:selectedPhotoAtIndex:photoList:albumCategory:imageViewForTransition:", self, v8, v11, v12, v13);

}

- (void)_captureUserAction:(int)a3
{
  -[UGCMorePhotosFeedViewController _captureUserAction:value:](self, "_captureUserAction:value:", *(_QWORD *)&a3, 0);
}

- (void)_captureUserAction:(int)a3 index:(unint64_t)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), a4));
  -[UGCMorePhotosFeedViewController _captureUserAction:value:](self, "_captureUserAction:value:", v4, v6);

}

- (void)_captureUserAction:(int)a3 value:(id)a4
{
  +[GEOAPPortal captureUGCUserAction:target:value:photoSources:](GEOAPPortal, "captureUGCUserAction:target:value:photoSources:", *(_QWORD *)&a3, 665, a4, 0);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  id v7;
  id v8;

  y = a4.y;
  v7 = a3;
  if (y > 0.0)
  {
    v8 = v7;
    -[UGCMorePhotosFeedViewController _handleScrollDown](self, "_handleScrollDown");
LABEL_5:
    v7 = v8;
    goto LABEL_6;
  }
  if (y < 0.0)
  {
    v8 = v7;
    -[UGCMorePhotosFeedViewController _handleScrollUp](self, "_handleScrollUp");
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_handleScrollUp
{
  -[UGCMorePhotosFeedViewController _captureUserAction:](self, "_captureUserAction:", 6101);
}

- (void)_handleScrollDown
{
  -[UGCMorePhotosFeedViewController _captureUserAction:](self, "_captureUserAction:", 6100);
}

- (id)imageViewForIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "photoImageView"));

  return v6;
}

- (void)scrollToPhotoAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UICollectionView *collectionView;
  id v8;

  v4 = a4;
  if (-[NSArray count](self->_photoList, "count") > a3)
  {
    collectionView = self->_collectionView;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, 0));
    -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v8, 2, v4);

  }
}

- (void)photoViewerDataSourceDidUpdate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentPhotoList"));
  -[UGCMorePhotosFeedViewController setPhotoList:](self, "setPhotoList:", v5);

  LODWORD(v5) = objc_msgSend(v4, "hasDataToShow");
  if ((_DWORD)v5)
    -[LoadingModeView removeFromSuperview](self->_loadingModeView, "removeFromSuperview");
  -[UGCMorePhotosFeedViewController _updateHeaderIfNeeded](self, "_updateHeaderIfNeeded");
  -[UGCMorePhotosFeedViewController _updateSnapshotForCurrentState](self, "_updateSnapshotForCurrentState");
}

- (void)photoViewerDataSourceDidUpdate:(id)a3 withError:(id)a4
{
  if ((objc_msgSend(a3, "hasDataToShow") & 1) == 0)
    -[UGCMorePhotosFeedViewController _attachErrorView](self, "_attachErrorView");
}

- (id)userUploadDataProviderForDataSource:(id)a3
{
  UGCMorePhotosFeedViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "userUploadedDataProviderForThumbnailGallery:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userUploadedDataProviderForThumbnailGallery:", self));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)scrollableSegmentedPickerView:(id)a3 didChangeSelectedIndex:(unint64_t)a4
{
  void *v5;

  -[UGCPhotoViewerDataSource setAlbumIndex:](self->_dataSource, "setAlbumIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataSource currentPhotoList](self->_dataSource, "currentPhotoList"));
  -[UGCMorePhotosFeedViewController setPhotoList:](self, "setPhotoList:", v5);

  -[UGCMorePhotosFeedViewController _updateHeaderIfNeeded](self, "_updateHeaderIfNeeded");
  if (-[UGCPhotoViewerDataSource hasDataToShow](self->_dataSource, "hasDataToShow"))
    -[UGCMorePhotosFeedViewController _updateSnapshotForCurrentState](self, "_updateSnapshotForCurrentState");
  else
    -[UGCPhotoViewerDataSource fetchNextBatchRequestIfNeeded](self->_dataSource, "fetchNextBatchRequestIfNeeded");
}

- (unint64_t)startingImageIndex
{
  return self->_startingImageIndex;
}

- (void)setStartingImageIndex:(unint64_t)a3
{
  self->_startingImageIndex = a3;
}

- (unint64_t)selectedAlbumIndex
{
  return self->_selectedAlbumIndex;
}

- (void)setSelectedAlbumIndex:(unint64_t)a3
{
  self->_selectedAlbumIndex = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (UGCMorePhotosFeedViewControllerDelegate)delegate
{
  return (UGCMorePhotosFeedViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)photoList
{
  return self->_photoList;
}

- (void)setPhotoList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (LoadingModeView)loadingModeView
{
  return self->_loadingModeView;
}

- (ErrorModeView)errorModeView
{
  return self->_errorModeView;
}

- (BOOL)shouldCancelImageDownloads
{
  return self->_shouldCancelImageDownloads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorModeView, 0);
  objc_storeStrong((id *)&self->_loadingModeView, 0);
  objc_storeStrong((id *)&self->_photoList, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_downloadToken, 0);
  objc_storeStrong((id *)&self->_gradientHeightConstraint, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_photoDownloadManager, 0);
  objc_storeStrong((id *)&self->_albumFilterView, 0);
  objc_storeStrong((id *)&self->_headerGradientView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
}

@end
