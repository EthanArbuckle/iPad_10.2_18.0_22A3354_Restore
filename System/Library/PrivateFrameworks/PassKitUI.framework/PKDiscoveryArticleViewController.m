@implementation PKDiscoveryArticleViewController

- (PKDiscoveryArticleViewController)initWithItemIdentifier:(id)a3 referrerIdentifier:(id)a4
{
  id v5;
  PKDiscoveryCardViewTemplateInformation *v6;
  PKDiscoveryArticleViewController *v7;

  v5 = a4;
  v6 = -[PKDiscoveryCardViewTemplateInformation initWithCardSize:displayType:]([PKDiscoveryCardViewTemplateInformation alloc], "initWithCardSize:displayType:", 1, 1);
  v7 = -[PKDiscoveryArticleViewController initWithArticleLayout:referrerIdentifier:cardTemplateInformation:](self, "initWithArticleLayout:referrerIdentifier:cardTemplateInformation:", 0, v5, v6);

  return v7;
}

- (PKDiscoveryArticleViewController)initWithArticleLayout:(id)a3 referrerIdentifier:(id)a4 cardTemplateInformation:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKDiscoveryArticleViewController *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *imageDownloads;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *cellImageCache;
  dispatch_queue_t v20;
  OS_dispatch_queue *loadImageQueue;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKDiscoveryArticleViewController;
  v12 = -[PKDiscoveryArticleViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  if (v12)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    imageDownloads = v12->_imageDownloads;
    v12->_imageDownloads = v13;

    v12->_lockDownloads._os_unfair_lock_opaque = 0;
    *(_OWORD *)&v12->_contentInsets.top = xmmword_19DF16E20;
    *(_OWORD *)&v12->_contentInsets.bottom = xmmword_19DF16E20;
    objc_storeStrong((id *)&v12->_referrerIdentifierOverride, a4);
    objc_msgSend(v9, "card");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "callToAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_callToAction = objc_msgSend(v16, "action");

    objc_storeStrong((id *)&v12->_articleLayout, a3);
    v12->_isDownloading = v9 == 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v12, sel__systemTextSizeChanged, *MEMORY[0x1E0DC48E8], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v12, sel__applicationWillTerminate, *MEMORY[0x1E0DC4870], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v12, sel__applicationWillResignActive, *MEMORY[0x1E0DC4868], 0);
    v12->_shouldHideStatusBar = 1;
    objc_storeStrong((id *)&v12->_cardTemplateInformation, a5);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cellImageCache = v12->_cellImageCache;
    v12->_cellImageCache = v18;

    v20 = dispatch_queue_create("com.apple.passbook.discoveryarticlevc.loadimage", 0);
    loadImageQueue = v12->_loadImageQueue;
    v12->_loadImageQueue = (OS_dispatch_queue *)v20;

    -[PKDiscoveryArticleViewController setTransitioningDelegate:](v12, "setTransitioningDelegate:", v12);
  }

  return v12;
}

- (void)_reportScolledToBottomIfNecessary
{
  void *v3;
  void *v4;
  id v5;

  if (-[PKDiscoveryArticleViewController isScrollable](self, "isScrollable") && !self->_reportedScrolledToBottom)
  {
    self->_reportedScrolledToBottom = 1;
    -[PKDiscoveryArticleViewController proximityReaderDelegate](self, "proximityReaderDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0D66D00], "sharedInstance");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[PKDiscoveryArticleLayout itemIdentifier](self->_articleLayout, "itemIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "discoveryItemWithIdentifier:callToAction:wasScrolledToTheBottom:", v4, self->_callToAction, self->_scrolledToBottom);

    }
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  UIPanGestureRecognizer *panGestureRecognizer;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PKDiscoveryArticleViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", self->_panGestureRecognizer);

  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = 0;

  -[PKDiscoveryCardView setDelegate:](self->_cardView, "setDelegate:", 0);
  v6.receiver = self;
  v6.super_class = (Class)PKDiscoveryArticleViewController;
  -[PKDiscoveryArticleViewController dealloc](&v6, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  PKDiscoveryLayout *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UICollectionView *v10;
  UICollectionView *collectionView;
  UICollectionView *v12;
  void *v13;
  PKDiscoveryCardView *v14;
  PKDiscoveryCardView *cardView;
  UIActivityIndicatorView *v16;
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v18;
  void *v19;
  UILabel *v20;
  UILabel *downloadingLabel;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PKContinuousButton *v33;
  PKContinuousButton *dismissButton;
  PKContinuousButton *v35;
  void *v36;
  UIPanGestureRecognizer *v37;
  UIPanGestureRecognizer *panGestureRecognizer;
  UIScreenEdgePanGestureRecognizer *v39;
  UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[2];
  __int128 v45;
  uint64_t v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)PKDiscoveryArticleViewController;
  -[PKDiscoveryArticleViewController loadView](&v47, sel_loadView);
  -[PKDiscoveryArticleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAnchorPoint:", 0.5, 0.0);
  v4 = objc_alloc_init(PKDiscoveryLayout);
  v5 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E0C9D648], v7, v8, v9);
  collectionView = self->_collectionView;
  self->_collectionView = v10;

  -[UICollectionView setContentInsetAdjustmentBehavior:](self->_collectionView, "setContentInsetAdjustmentBehavior:", 2);
  v12 = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v12, "setBackgroundColor:", v13);

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("cell"));
  -[UICollectionView layer](self->_collectionView, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAnchorPoint:", 0.5, 0.0);
  -[PKDiscoveryCardViewTemplateInformation setDisplayType:](self->_cardTemplateInformation, "setDisplayType:", 1);
  v14 = -[PKDiscoveryCardView initWithArticleLayout:dismissImage:cardTemplateInformation:]([PKDiscoveryCardView alloc], "initWithArticleLayout:dismissImage:cardTemplateInformation:", self->_articleLayout, 0, self->_cardTemplateInformation);
  cardView = self->_cardView;
  self->_cardView = v14;

  -[PKDiscoveryCardView setCallToActionTappedOverride:](self->_cardView, "setCallToActionTappedOverride:", self->_callToActionTappedOverride);
  -[PKDiscoveryCardView setDelegate:](self->_cardView, "setDelegate:", self);
  v16 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v16;

  v18 = self->_activityIndicator;
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](v18, "setColor:", v19);

  v20 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
  downloadingLabel = self->_downloadingLabel;
  self->_downloadingLabel = v20;

  v22 = self->_downloadingLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A98], (NSString *)*MEMORY[0x1E0DC4908]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v22, "setFont:", v23);

  v24 = self->_downloadingLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v24, "setTextColor:", v25);

  v26 = self->_downloadingLabel;
  PKLocalizedDiscoveryString(CFSTR("DISCOVERY_ARTICLE_DOWNLOADING_MESSAGE"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v26, "setText:", v27);

  v28 = 1.0;
  if (!self->_isDownloading)
    v28 = 0.0;
  -[UILabel setAlpha:](self->_downloadingLabel, "setAlpha:", v28);
  v29 = (void *)MEMORY[0x1E0DC3888];
  PKDefaultSystemFontOfSizeAndWeight(28.0, *MEMORY[0x1E0DC1440]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "configurationWithFont:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = 0;
  v44[1] = 0;
  v45 = xmmword_19DF16E30;
  v46 = 2;
  v33 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", v44);
  dismissButton = self->_dismissButton;
  self->_dismissButton = v33;

  -[PKContinuousButton setImage:forState:](self->_dismissButton, "setImage:forState:", v32, 0);
  -[PKContinuousButton addTarget:action:forControlEvents:](self->_dismissButton, "addTarget:action:forControlEvents:", self, sel__dismissButtonPressed, 64);
  v35 = self->_dismissButton;
  -[PKDiscoveryArticleViewController _dismissButtonColor](self, "_dismissButtonColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuousButton setTintColor:](v35, "setTintColor:", v36);

  -[PKContinuousButton setAccessibilityIdentifier:](self->_dismissButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
  v37 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__handlePanGesture_);
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v37;

  -[UIPanGestureRecognizer setDelegate:](self->_panGestureRecognizer, "setDelegate:", self);
  -[UICollectionView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", self->_panGestureRecognizer);
  v39 = (UIScreenEdgePanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C00]), "initWithTarget:action:", self, sel__leftScreenEdgePanSwipeGesture_);
  screenEdgePanGestureRecognizer = self->_screenEdgePanGestureRecognizer;
  self->_screenEdgePanGestureRecognizer = v39;

  -[UIScreenEdgePanGestureRecognizer setEdges:](self->_screenEdgePanGestureRecognizer, "setEdges:", 2);
  -[UIScreenEdgePanGestureRecognizer setDelegate:](self->_screenEdgePanGestureRecognizer, "setDelegate:", self);
  -[UICollectionView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", self->_screenEdgePanGestureRecognizer);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v41);

  objc_msgSend(v3, "addSubview:", self->_collectionView);
  -[UICollectionView addSubview:](self->_collectionView, "addSubview:", self->_cardView);
  objc_msgSend(v3, "addSubview:", self->_dismissButton);
  objc_msgSend(v3, "addSubview:", self->_activityIndicator);
  objc_msgSend(v3, "addSubview:", self->_downloadingLabel);
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678C8]);
  if (self->_isDownloading)
    -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");

}

- (void)viewWillLayoutSubviews
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double top;
  double left;
  double bottom;
  double right;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  objc_super v46;
  CGRect v47;

  v46.receiver = self;
  v46.super_class = (Class)PKDiscoveryArticleViewController;
  -[PKDiscoveryArticleViewController viewWillLayoutSubviews](&v46, sel_viewWillLayoutSubviews);
  -[PKDiscoveryArticleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (!-[PKDiscoveryArticleViewController isAnimatingCard](self, "isAnimatingCard"))
  {
    objc_msgSend(v3, "_shouldReverseLayoutDirection");
    -[PKContinuousButton sizeToFit](self->_dismissButton, "sizeToFit");
    -[PKContinuousButton frame](self->_dismissButton, "frame");
    v47.origin.x = v5;
    v47.origin.y = v7;
    v47.size.width = v9;
    v47.size.height = v11;
    CGRectInset(v47, 17.0, 20.0);
    PKSizeAlignedInRect();
    -[PKContinuousButton setFrame:](self->_dismissButton, "setFrame:");
    -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v5, v7, v9, v11);
    if (self->_hasSafeAreaInsetOverride)
    {
      top = self->_safeAreaOverrideInsets.top;
      left = self->_safeAreaOverrideInsets.left;
      bottom = self->_safeAreaOverrideInsets.bottom;
      right = self->_safeAreaOverrideInsets.right;
    }
    else
    {
      right = v19;
      bottom = v17;
      left = v15;
      top = v13;
    }
    -[UICollectionView setScrollIndicatorInsets:](self->_collectionView, "setScrollIndicatorInsets:", top, left, bottom, right);
    -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
    v25 = fmin(v7, v24);
    -[PKDiscoveryCardView sizeThatFits:](self->_cardView, "sizeThatFits:", v9, v11);
    v27 = v26;
    v29 = v28;
    -[PKDiscoveryCardView setHasSafeAreaInsetOverride:](self->_cardView, "setHasSafeAreaInsetOverride:", self->_hasSafeAreaInsetOverride);
    -[PKDiscoveryCardView setSafeAreaOverrideInsets:](self->_cardView, "setSafeAreaOverrideInsets:", self->_safeAreaOverrideInsets.top, self->_safeAreaOverrideInsets.left, self->_safeAreaOverrideInsets.bottom, self->_safeAreaOverrideInsets.right);
    -[PKDiscoveryCardView setFrame:](self->_cardView, "setFrame:", v5, v25, v27, v29);
    -[UILabel sizeThatFits:](self->_downloadingLabel, "sizeThatFits:", v9, v11);
    PKSizeAlignedInRect();
    PKSizeAlignedInRect();
    v31 = v30;
    v33 = v32;
    v44 = v35;
    v45 = v34;
    PKSizeAlignedInRect();
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v31, v33, v45, v44);
    -[UILabel setFrame:](self->_downloadingLabel, "setFrame:", v37, v39, v41, v43);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDiscoveryArticleViewController;
  -[PKDiscoveryArticleViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  if (self->_articleLayout && !self->_isDownloading)
  {
    -[PKDiscoveryArticleViewController proximityReaderDelegate](self, "proximityReaderDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0D66D00], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDiscoveryArticleLayout itemIdentifier](self->_articleLayout, "itemIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "discoveryItemWithIdentifier:callToAction:isScrollable:", v6, self->_callToAction, -[PKDiscoveryArticleViewController isScrollable](self, "isScrollable"));

    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDiscoveryArticleViewController;
  -[PKDiscoveryArticleViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PKDiscoveryArticleViewController _reportScolledToBottomIfNecessary](self, "_reportScolledToBottomIfNecessary");
}

- (BOOL)isScrollable
{
  void *v2;
  char v3;

  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScrollable");

  return v3;
}

- (BOOL)prefersStatusBarHidden
{
  return self->_shouldHideStatusBar;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 2;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(a3, "bounds");
  v6 = v5;
  +[PKDiscoveryCardView expandedHeight](PKDiscoveryCardView, "expandedHeight");
  v8 = v7 + 8.0;
  v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  void *v6;
  void *v7;
  CGFloat bottom;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[PKDiscoveryArticleViewController view](self, "view", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_hasSafeAreaInsetOverride)
  {
    bottom = self->_safeAreaOverrideInsets.bottom;
  }
  else
  {
    objc_msgSend(v6, "safeAreaInsets");
    bottom = v9;
  }
  objc_msgSend(v7, "bounds");
  v11 = v10;

  v12 = v11;
  v13 = bottom;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[PKDiscoveryArticleViewController _shelfForIndexPath:](self, "_shelfForIndexPath:", a5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryArticleLayout itemIdentifier](self->_articleLayout, "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDiscoveryShelfView viewForShelf:discoveryCardViewDelegate:itemIdentifier:](PKDiscoveryShelfView, "viewForShelf:discoveryCardViewDelegate:itemIdentifier:", v6, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setContentInsets:", self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);
  -[UICollectionView bounds](self->_collectionView, "bounds");
  objc_msgSend(v8, "sizeThatFits:", v9, 1.79769313e308);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setCallToActionTappedOverride:(id)a3
{
  void *v4;
  id callToActionTappedOverride;
  id v6;

  v6 = a3;
  v4 = _Block_copy(v6);
  callToActionTappedOverride = self->_callToActionTappedOverride;
  self->_callToActionTappedOverride = v4;

  -[PKDiscoveryCardView setCallToActionTappedOverride:](self->_cardView, "setCallToActionTappedOverride:", v6);
}

- (void)setArticleLayout:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  PKDiscoveryCardView *v8;
  PKDiscoveryCardView *cardView;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v4 = a4;
  v7 = a3;
  objc_storeStrong((id *)&self->_articleLayout, a3);
  self->_isDownloading = v7 == 0;
  -[PKDiscoveryCardView removeFromSuperview](self->_cardView, "removeFromSuperview");
  -[PKDiscoveryCardView setDelegate:](self->_cardView, "setDelegate:", 0);
  -[PKDiscoveryCardViewTemplateInformation setDisplayType:](self->_cardTemplateInformation, "setDisplayType:", 1);
  v8 = -[PKDiscoveryCardView initWithArticleLayout:dismissImage:cardTemplateInformation:]([PKDiscoveryCardView alloc], "initWithArticleLayout:dismissImage:cardTemplateInformation:", self->_articleLayout, 0, self->_cardTemplateInformation);
  cardView = self->_cardView;
  self->_cardView = v8;

  -[PKDiscoveryCardView setDelegate:](self->_cardView, "setDelegate:", self);
  -[UICollectionView addSubview:](self->_collectionView, "addSubview:", self->_cardView);
  -[PKDiscoveryArticleViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

  -[UICollectionView reloadData](self->_collectionView, "reloadData");
  if (v4)
  {
    -[UICollectionView setAlpha:](self->_collectionView, "setAlpha:", 0.0);
    v11[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__PKDiscoveryArticleViewController_setArticleLayout_animated___block_invoke;
    v12[3] = &unk_1E3E612E8;
    v12[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__PKDiscoveryArticleViewController_setArticleLayout_animated___block_invoke_2;
    v11[3] = &unk_1E3E62288;
    objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 0, v12, v11);
  }
  else
  {
    -[UIActivityIndicatorView setHidden:](self->_activityIndicator, "setHidden:", 1);
    -[UILabel setAlpha:](self->_downloadingLabel, "setAlpha:", 0.0);
    -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
  }

}

uint64_t __62__PKDiscoveryArticleViewController_setArticleLayout_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAlpha:", 0.0);
}

uint64_t __62__PKDiscoveryArticleViewController_setArticleLayout_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "stopAnimating");
}

- (void)setIsDownloading:(BOOL)a3
{
  _BOOL4 v3;
  UIActivityIndicatorView *v5;
  void *v6;
  uint64_t v7;
  UIActivityIndicatorView *v8;
  _QWORD v9[4];
  UIActivityIndicatorView *v10;
  BOOL v11;
  _QWORD v12[5];
  UIActivityIndicatorView *v13;
  BOOL v14;

  if (((!self->_isDownloading ^ a3) & 1) == 0)
  {
    v3 = a3;
    self->_isDownloading = a3;
    v5 = self->_activityIndicator;
    if (v3)
      -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__PKDiscoveryArticleViewController_setIsDownloading___block_invoke;
    v12[3] = &unk_1E3E64908;
    v14 = v3;
    v12[4] = self;
    v13 = v5;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __53__PKDiscoveryArticleViewController_setIsDownloading___block_invoke_2;
    v9[3] = &unk_1E3E65288;
    v11 = v3;
    v10 = v13;
    v8 = v13;
    objc_msgSend(v6, "pkui_animateUsingOptions:animations:completion:", 6, v12, v9);

  }
}

uint64_t __53__PKDiscoveryArticleViewController_setIsDownloading___block_invoke(uint64_t a1)
{
  double v2;

  if (*(_BYTE *)(a1 + 48))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAlpha:", v2);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v2);
}

uint64_t __53__PKDiscoveryArticleViewController_setIsDownloading___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "stopAnimating");
  return result;
}

- (void)discoveryCardViewCTATapped:(id)a3 callToAction:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "action");
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = v11;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Article view CTA (action=%ld) tapped", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKDiscoveryArticleLayout item](self->_articleLayout, "item");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "discoveryArticleViewController:tappedCallToAction:item:", self, v9, v14);

  -[PKDiscoveryArticleViewController proximityReaderDelegate](self, "proximityReaderDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0D66D00], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tappedDiscoveryItemWithIdentifier:callToAction:cardSize:", v10, objc_msgSend(v9, "action"), -[PKDiscoveryCardViewTemplateInformation cardSize](self->_cardTemplateInformation, "cardSize"));

  }
  switch(v11)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 11:
      -[PKDiscoveryArticleViewController _performProvisioningCTATapped:callToAction:](self, "_performProvisioningCTATapped:callToAction:", v8, v9);
      goto LABEL_25;
    case 4:
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = (_QWORD *)MEMORY[0x1E0D6BAD0];
      goto LABEL_23;
    case 5:
      PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "openSensitiveURL:withOptions:", v19, 0);

      -[PKDiscoveryArticleViewController proximityReaderDelegate](self, "proximityReaderDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        objc_msgSend(MEMORY[0x1E0D66D00], "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "completedDiscoveryItemCTAWithCompletion:", 0);

      }
      goto LABEL_25;
    case 6:
      if (PKPeerPaymentIsSetup())
      {
        -[PKDiscoveryArticleViewController view](self, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "window");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "rootViewController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v25)
          objc_msgSend(v25, "presentPeerPaymentPassAnimated:completion:", 1, 0);
      }
      else
      {
        v17 = objc_alloc(MEMORY[0x1E0CB3940]);
        v18 = (_QWORD *)MEMORY[0x1E0D6BBF0];
LABEL_23:
        v25 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("prefs:root=PASSBOOK&path=%@"), *v18);
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "openSensitiveURL:withOptions:", v32, 0);

      }
LABEL_24:

LABEL_25:
      return;
    case 7:
      -[PKDiscoveryArticleViewController _performAccountUserInvitationFlowWithCTATapped:callToAction:](self, "_performAccountUserInvitationFlowWithCTATapped:callToAction:", v8, v9);
      goto LABEL_25;
    case 8:
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "window");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "rootViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v25;
      else
        v29 = 0;
      v30 = v29;
      objc_msgSend(v9, "appStoreAppIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "presentAppStorePageForItemWithIdentifier:", v31);

      goto LABEL_24;
    case 9:
      -[PKDiscoveryArticleViewController _performStandaloneApplyWithCTATapped:callToAction:](self, "_performStandaloneApplyWithCTATapped:callToAction:", v8, v9);
      goto LABEL_25;
    case 10:
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = (_QWORD *)MEMORY[0x1E0D6BAE0];
      goto LABEL_23;
    default:
      goto LABEL_25;
  }
}

- (void)_performAccountUserInvitationFlowWithCTATapped:(id)a3 callToAction:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKDiscoveryArticleViewController _showActivityIndicator:view:](self, "_showActivityIndicator:view:", 1, v6);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96__PKDiscoveryArticleViewController__performAccountUserInvitationFlowWithCTATapped_callToAction___block_invoke;
  v9[3] = &unk_1E3E61B68;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  +[PKAccountInvitationController presentCreateAccountUserInvitationWithViewController:account:accountUserCollection:familyMemberCollection:context:completion:](PKAccountInvitationController, "presentCreateAccountUserInvitationWithViewController:account:accountUserCollection:familyMemberCollection:context:completion:", self, 0, 0, 0, 0, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __96__PKDiscoveryArticleViewController__performAccountUserInvitationFlowWithCTATapped_callToAction___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __96__PKDiscoveryArticleViewController__performAccountUserInvitationFlowWithCTATapped_callToAction___block_invoke_2;
  v2[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __96__PKDiscoveryArticleViewController__performAccountUserInvitationFlowWithCTATapped_callToAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_showActivityIndicator:view:", 0, *(_QWORD *)(a1 + 32));

}

- (void)_performStandaloneApplyWithCTATapped:(id)a3 callToAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *referrerIdentifierOverride;
  NSString *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "allowedFeatureIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PKFeatureIdentifierFromString();

  if (!v8)
    goto LABEL_9;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = *MEMORY[0x1E0D6BB38];
  v11 = *MEMORY[0x1E0D6BAD8];
  PKFeatureIdentifierToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("//%@/%@/%@"), v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v13);
  objc_msgSend(v14, "setScheme:", *MEMORY[0x1E0D6BCA8]);
  referrerIdentifierOverride = self->_referrerIdentifierOverride;
  if (referrerIdentifierOverride)
  {
    v16 = referrerIdentifierOverride;
LABEL_5:
    v17 = objc_alloc(MEMORY[0x1E0CB39D8]);
    v18 = (void *)objc_msgSend(v17, "initWithName:value:", *MEMORY[0x1E0D6BB58], v16);
    v22[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setQueryItems:", v19);

    goto LABEL_6;
  }
  objc_msgSend(v5, "referrerIdentifier");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v16)
    goto LABEL_5;
LABEL_6:
  objc_msgSend(v14, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "openURL:withOptions:", v20, 0);

  }
LABEL_9:

}

- (void)_performProvisioningCTATapped:(id)a3 callToAction:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSString *referrerIdentifierOverride;
  NSString *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithWebService:", v9);

  referrerIdentifierOverride = self->_referrerIdentifierOverride;
  if (referrerIdentifierOverride)
  {
    v12 = referrerIdentifierOverride;
  }
  else
  {
    objc_msgSend(v7, "referrerIdentifier");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  objc_msgSend(v10, "setReferrerIdentifier:", v12);
  objc_msgSend(v7, "paymentNetworks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowedPaymentNetworks:", v14);

  objc_msgSend(v7, "transitNetworkIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRequiredTransitNetworkIdentifiers:", v15);

  objc_msgSend(v7, "allowedFeatureIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowedFeatureIdentifiers:", v16);

  objc_msgSend(v7, "productIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowedProductIdentifiers:", v17);

  -[PKDiscoveryArticleViewController _showActivityIndicator:view:](self, "_showActivityIndicator:view:", 1, v6);
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke;
  aBlock[3] = &unk_1E3E65C48;
  objc_copyWeak(&v32, &location);
  v19 = v10;
  v29 = v19;
  v20 = v7;
  v30 = v20;
  v21 = v6;
  v31 = v21;
  v22 = _Block_copy(aBlock);
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_5;
  v25[3] = &unk_1E3E642A8;
  v23 = v19;
  v26 = v23;
  v24 = v22;
  v27 = v24;
  objc_msgSend(v23, "preflightWithCompletion:", v25);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

void __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_2;
  v7[3] = &unk_1E3E65C20;
  objc_copyWeak(&v12, a1 + 7);
  v13 = a2;
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  v11 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v12);
}

void __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(WeakRetained, "_paymentSetupNavigationControllerForProvisioningController:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPaymentSetupMode:", objc_msgSend(*(id *)(a1 + 40), "paymentSetupMode"));
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_3;
      v9[3] = &unk_1E3E62E98;
      v10 = v3;
      v11 = v4;
      v12 = *(id *)(a1 + 48);
      v5 = v4;
      objc_msgSend(v5, "preflightWithCompletion:", v9);

    }
    else
    {
      objc_msgSend(WeakRetained, "_showActivityIndicator:view:", 0, *(_QWORD *)(a1 + 48));
      v6 = *(void **)(a1 + 56);
      if (v6)
      {
        v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v7;
      +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "presentViewController:animated:completion:", v8, 1, 0);

    }
  }

}

void __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_4;
  v4[3] = &unk_1E3E61388;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v5, "presentViewController:animated:completion:", v3, 1, v4);

}

uint64_t __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showActivityIndicator:view:", 0, *(_QWORD *)(a1 + 40));
}

void __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "paymentSetupProductModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allSetupProducts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2 && objc_msgSend(v7, "count") == 1)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_6;
    v10[3] = &unk_1E3E61540;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v8, "setupProductForProvisioning:includePurchases:withCompletionHandler:", v9, 1, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __79__PKDiscoveryArticleViewController__performProvisioningCTATapped_callToAction___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4;
  PKPaymentSetupNavigationController *v5;

  v4 = a3;
  v5 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", v4, 0);

  -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v5, "setCustomFormSheetPresentationStyleForiPad");
  -[PKPaymentSetupNavigationController setSetupDelegate:](v5, "setSetupDelegate:", self);
  return v5;
}

- (void)_showActivityIndicator:(BOOL)a3 view:(id)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    objc_msgSend(v5, "setShowActivityIndicator:", v4);

}

- (void)paymentSetupDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "provisioningController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provisionedPasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureElementPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentPass");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryArticleViewController _dismissForActionCompleted:withRelevantPassUniqueIdentifier:](self, "_dismissForActionCompleted:withRelevantPassUniqueIdentifier:", 1, v8);

  }
  else
  {
    -[PKDiscoveryArticleViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  PKDiscoveryArticleViewController *v7;
  id v8;
  PKPresentationControllerForOpaqueViewControllerDestination *v9;

  v7 = (PKDiscoveryArticleViewController *)a3;
  v8 = a4;
  if (v7 == self && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v9 = -[PKPresentationControllerForOpaqueViewControllerDestination initWithPresentedViewController:presentingViewController:]([PKPresentationControllerForOpaqueViewControllerDestination alloc], "initWithPresentedViewController:presentingViewController:", v7, v8);
  else
    v9 = 0;

  return v9;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PKDiscoveryArticleLayout shelves](self->_articleLayout, "shelves", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("cell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[PKDiscoveryArticleViewController _shelfForIndexPath:](self, "_shelfForIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PKDiscoveryArticleLayout itemIdentifier](self->_articleLayout, "itemIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKDiscoveryShelfView viewForShelf:discoveryCardViewDelegate:itemIdentifier:](PKDiscoveryShelfView, "viewForShelf:discoveryCardViewDelegate:itemIdentifier:", v9, self, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setContentInsets:", self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);
    objc_msgSend(v7, "shelfView");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      if ((void *)v12 == v11)
      {
LABEL_6:
        v15 = objc_msgSend(v9, "type");
        if (v15 == 4)
        {
          -[PKDiscoveryArticleViewController _configureCallToActionShelfView:forCallToActionShelf:atIndexPath:](self, "_configureCallToActionShelfView:forCallToActionShelf:atIndexPath:", v11, v9, v6);
        }
        else if (v15 == 2)
        {
          -[PKDiscoveryArticleViewController _configureInlineMediaShelfView:forInlineMediaShelf:atIndexPath:](self, "_configureInlineMediaShelfView:forInlineMediaShelf:atIndexPath:", v11, v9, v6);
        }

        goto LABEL_14;
      }
      objc_msgSend(v7, "shelfView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeFromSuperview");

      objc_msgSend(v7, "setShelfView:", 0);
    }
    objc_msgSend(v7, "setShelfView:", v11);
    goto LABEL_6;
  }
  PKLogFacilityTypeGetObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = 0;
    _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Could not create PKDiscoveryShelfView for shelf: %@", (uint8_t *)&v18, 0xCu);
  }

LABEL_14:
  return v7;
}

- (id)_shelfForIndexPath:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(a3, "row");
  -[PKDiscoveryArticleLayout shelves](self->_articleLayout, "shelves");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= objc_msgSend(v5, "count"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_systemTextSizeChanged
{
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  -[PKDiscoveryArticleViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[PKDiscoveryArticleViewController proximityReaderDelegate](self, "proximityReaderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v17, "contentOffset");
    v7 = v6;
    objc_msgSend(v17, "frame");
    v9 = v7 + v8;
    -[PKDiscoveryArticleViewController proximityReaderDelegate](self, "proximityReaderDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryArticleLayout itemIdentifier](self->_articleLayout, "itemIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "discoveryItemWithIdentifier:position:", v11, v9);

  }
  else if (-[PKDiscoveryArticleViewController isScrollable](self, "isScrollable"))
  {
    if (!self->_scrolledToBottom)
    {
      objc_msgSend(v17, "contentOffset");
      v13 = v12;
      objc_msgSend(v17, "contentSize");
      v15 = v14;
      objc_msgSend(v17, "frame");
      self->_scrolledToBottom = v13 >= v15 - v16;
      if (v13 >= v15 - v16)
        -[PKDiscoveryArticleViewController _reportScolledToBottomIfNecessary](self, "_reportScolledToBottomIfNecessary");
    }
  }

}

- (void)_configureInlineMediaShelfView:(id)a3 forInlineMediaShelf:(id)a4 atIndexPath:(id)a5
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
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "media");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "type");

  if (v12 == 1)
  {
    v13 = v8;
    -[NSMutableDictionary objectForKey:](self->_cellImageCache, "objectForKey:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("mediaAsset"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v13, "setImage:animated:", v15, 0);
    }
    else
    {
      objc_msgSend(v9, "media");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __99__PKDiscoveryArticleViewController__configureInlineMediaShelfView_forInlineMediaShelf_atIndexPath___block_invoke;
      v17[3] = &unk_1E3E613B0;
      v18 = v13;
      -[PKDiscoveryArticleViewController _loadMedia:forShelfViewAtIndexPath:withCellImageCacheKey:completion:](self, "_loadMedia:forShelfViewAtIndexPath:withCellImageCacheKey:completion:", v16, v10, CFSTR("mediaAsset"), v17);

    }
  }

}

uint64_t __99__PKDiscoveryArticleViewController__configureInlineMediaShelfView_forInlineMediaShelf_atIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:animated:", a2, 1);
}

- (void)_configureCallToActionShelfView:(id)a3 forCallToActionShelf:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *cellImageCache;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v8 = a3;
  v9 = a5;
  cellImageCache = self->_cellImageCache;
  v11 = a4;
  -[NSMutableDictionary objectForKey:](cellImageCache, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "callToAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "icon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("wordmarkAsset"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      goto LABEL_6;
LABEL_8:
    objc_msgSend(v13, "wordmarkAsset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __101__PKDiscoveryArticleViewController__configureCallToActionShelfView_forCallToActionShelf_atIndexPath___block_invoke_2;
    v19[3] = &unk_1E3E613B0;
    v20 = v8;
    -[PKDiscoveryArticleViewController _loadMedia:forShelfViewAtIndexPath:withCellImageCacheKey:completion:](self, "_loadMedia:forShelfViewAtIndexPath:withCellImageCacheKey:completion:", v18, v9, CFSTR("wordmarkAsset"), v19);

    goto LABEL_9;
  }
  objc_msgSend(v12, "objectForKey:", CFSTR("mediaAsset"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("wordmarkAsset"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(v13, "icon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __101__PKDiscoveryArticleViewController__configureCallToActionShelfView_forCallToActionShelf_atIndexPath___block_invoke;
    v21[3] = &unk_1E3E613B0;
    v22 = v8;
    -[PKDiscoveryArticleViewController _loadMedia:forShelfViewAtIndexPath:withCellImageCacheKey:completion:](self, "_loadMedia:forShelfViewAtIndexPath:withCellImageCacheKey:completion:", v17, v9, CFSTR("mediaAsset"), v21);

    if (v16)
      goto LABEL_6;
    goto LABEL_8;
  }
  objc_msgSend(v8, "setImage:animated:", v15, 0);

  if (!v16)
    goto LABEL_8;
LABEL_6:
  objc_msgSend(v8, "setWordmarkAsset:animated:", v16, 0);
LABEL_9:

}

uint64_t __101__PKDiscoveryArticleViewController__configureCallToActionShelfView_forCallToActionShelf_atIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:animated:", a2, 1);
}

uint64_t __101__PKDiscoveryArticleViewController__configureCallToActionShelfView_forCallToActionShelf_atIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWordmarkAsset:animated:", a2, 1);
}

- (void)_loadMedia:(id)a3 forShelfViewAtIndexPath:(id)a4 withCellImageCacheKey:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *loadImageQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  PKDiscoveryArticleViewController *v23;
  id v24;
  id v25;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  loadImageQueue = self->_loadImageQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke;
  block[3] = &unk_1E3E71C18;
  v20 = v10;
  v15 = v10;
  objc_copyWeak(&v25, &location);
  v21 = v11;
  v22 = v12;
  v23 = self;
  v24 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  dispatch_async(loadImageQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44[2];
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD block[4];
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;

  PKScreenScale();
  v3 = v2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v4 != 4)
  {
    if (v4 == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "passKitUIImageName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pathExtension");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("pdf"));

      if (v7)
      {
        objc_msgSend(v5, "stringByDeletingPathExtension");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        PKPassKitUIBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "URLForResource:withExtension:", v8, CFSTR("pdf"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "width");
        v12 = v11;
        objc_msgSend(*(id *)(a1 + 32), "height");
        v14 = v13;
        v15 = PKUIScreenScale();
        PKUIImageFromPDF(v10, v12, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        PKUIImageNamed(v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_2;
      v57[3] = &unk_1E3E6D8E8;
      v20 = &v62;
      objc_copyWeak(&v62, (id *)(a1 + 72));
      v58 = v16;
      v59 = *(id *)(a1 + 40);
      v60 = *(id *)(a1 + 48);
      v61 = *(id *)(a1 + 64);
      v21 = v16;
      dispatch_async(MEMORY[0x1E0C80D38], v57);

      v22 = v58;
      goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 32), "imageDataFromCacheWithScale:", *(double *)&v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66DF8]), "initWithData:scale:", v5, *(double *)&v3);
      objc_msgSend(v23, "preheatBitmapData");
      v24 = objc_alloc(MEMORY[0x1E0DC3870]);
      v25 = objc_retainAutorelease(v23);
      v26 = (void *)objc_msgSend(v24, "initWithCGImage:", objc_msgSend(v25, "imageRef"));
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_4;
      v45[3] = &unk_1E3E6D8E8;
      v27 = &v50;
      objc_copyWeak(&v50, (id *)(a1 + 72));
      v46 = v26;
      v47 = *(id *)(a1 + 40);
      v48 = *(id *)(a1 + 48);
      v49 = *(id *)(a1 + 64);
      v28 = v26;
      dispatch_async(MEMORY[0x1E0C80D38], v45);

    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 1096));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1088), "objectForKey:", *(_QWORD *)(a1 + 40));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "objectForKey:", *(_QWORD *)(a1 + 48));
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v32 = (void *)v31;
          v33 = _Block_copy(*(const void **)(a1 + 64));
          objc_msgSend(v32, "addObject:", v33);

        }
        else
        {
          v36 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v37 = _Block_copy(*(const void **)(a1 + 64));
          v32 = (void *)objc_msgSend(v36, "initWithObjects:", v37, 0);

          objc_msgSend(v30, "setObject:forKey:", v32, *(_QWORD *)(a1 + 48));
        }
        v25 = v30;
      }
      else
      {
        v34 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v35 = _Block_copy(*(const void **)(a1 + 64));
        v32 = (void *)objc_msgSend(v34, "initWithObjects:", v35, 0);

        v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
        objc_msgSend(v25, "setObject:forKey:", v32, *(_QWORD *)(a1 + 48));
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1088), "setObject:forKey:", v25, *(_QWORD *)(a1 + 40));
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 1096));
      if (v30)
        goto LABEL_19;
      v38 = *(void **)(a1 + 32);
      PKScreenScale();
      v40 = v39;
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_5;
      v41[3] = &unk_1E3E71BF0;
      v41[4] = *(_QWORD *)(a1 + 56);
      v44[1] = v3;
      v27 = v44;
      objc_copyWeak(v44, (id *)(a1 + 72));
      v42 = *(id *)(a1 + 40);
      v43 = *(id *)(a1 + 48);
      objc_msgSend(v38, "downloadImageDataWithScale:shouldWriteData:completion:", 0, v41, v40);

    }
    objc_destroyWeak(v27);
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 32), "localAssetURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v5, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageWithContentsOfFile:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_3;
  block[3] = &unk_1E3E6D8E8;
  v20 = &v56;
  objc_copyWeak(&v56, (id *)(a1 + 72));
  v52 = v19;
  v53 = *(id *)(a1 + 40);
  v54 = *(id *)(a1 + 48);
  v55 = *(id *)(a1 + 64);
  v21 = v19;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  v22 = v52;
LABEL_11:

  objc_destroyWeak(v20);
LABEL_20:

}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void (*v4)(void);
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained[135], "objectForKey:", *(_QWORD *)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
      objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      objc_msgSend(v5[135], "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

    }
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v4();

}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void (*v4)(void);
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained[135], "objectForKey:", *(_QWORD *)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
      objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      objc_msgSend(v5[135], "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

    }
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v4();

}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void (*v4)(void);
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained[135], "objectForKey:", *(_QWORD *)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
      objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      objc_msgSend(v5[135], "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

    }
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v4();

}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10[2];

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_6;
  block[3] = &unk_1E3E71BC8;
  v7 = v3;
  v10[1] = *(id *)(a1 + 64);
  v5 = v3;
  objc_copyWeak(v10, (id *)(a1 + 56));
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

  objc_destroyWeak(v10);
}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66DF8]), "initWithData:scale:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 64));
  objc_msgSend(v2, "preheatBitmapData");
  v3 = objc_alloc(MEMORY[0x1E0DC3870]);
  v4 = objc_retainAutorelease(v2);
  v5 = (void *)objc_msgSend(v3, "initWithCGImage:", objc_msgSend(v4, "imageRef"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_7;
  v7[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  v8 = v5;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v11);
}

void __104__PKDiscoveryArticleViewController__loadMedia_forShelfViewAtIndexPath_withCellImageCacheKey_completion___block_invoke_7(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained[135], "objectForKey:", *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
      objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      objc_msgSend(v3[135], "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));

    }
    os_unfair_lock_lock((os_unfair_lock_t)v3 + 274);
    objc_msgSend(v3[136], "objectForKey:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3[136], "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)v3 + 274);
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  char isKindOfClass;
  double v6;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 1;
  -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
  return v6 == -20.0;
}

- (void)_handlePanGesture:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "state") == 3)
  {
    -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
    v5 = v4;
    -[UICollectionView safeAreaInsets](self->_collectionView, "safeAreaInsets");
    v7 = -v6;
    -[PKDiscoveryArticleViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "translationInView:", v8);
    v10 = v9;

    -[PKDiscoveryArticleViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "velocityInView:", v11);
    v13 = v12;

    if (v5 <= v7 && v10 > 0.0 && v13 > 0.0)
      -[PKDiscoveryArticleViewController _dismissForActionCompleted:withRelevantPassUniqueIdentifier:](self, "_dismissForActionCompleted:withRelevantPassUniqueIdentifier:", 0, 0);
  }

}

- (void)_leftScreenEdgePanSwipeGesture:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[PKDiscoveryArticleViewController _dismissForActionCompleted:withRelevantPassUniqueIdentifier:](self, "_dismissForActionCompleted:withRelevantPassUniqueIdentifier:", 0, 0);
}

- (BOOL)_hasCardInGalleryView
{
  void *v3;
  PKDiscoveryArticleLayout *articleLayout;
  id v5;
  void *v6;
  char v7;

  -[PKDiscoveryArticleViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    articleLayout = self->_articleLayout;
    v5 = v3;
    -[PKDiscoveryArticleLayout itemIdentifier](articleLayout, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "hasDiscoveryCardWithItemIdentifier:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_dismissForActionCompleted:(BOOL)a3 withRelevantPassUniqueIdentifier:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = a4;
  -[PKDiscoveryArticleViewController presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE5741B8))
  {
    objc_msgSend(v6, "dismissDiscoveryArticleViewController:afterActionCompleted:withRelevantPassUniqueIdenitifer:", self, v4, v12);
    -[PKDiscoveryArticleViewController proximityReaderDelegate](self, "proximityReaderDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0D66D00], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDiscoveryArticleLayout itemIdentifier](self->_articleLayout, "itemIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDiscoveryArticleLayout card](self->_articleLayout, "card");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "callToAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissedDiscoveryItemWithIdentifier:callToAction:cardSize:", v9, objc_msgSend(v11, "action"), -[PKDiscoveryCardViewTemplateInformation cardSize](self->_cardTemplateInformation, "cardSize"));

    }
  }
  else
  {
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)_dismissButtonPressed
{
  void *v3;

  -[PKDiscoveryArticleViewController cardView](self, "cardView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadAndUploadImageData");

  -[PKDiscoveryArticleViewController _dismissForActionCompleted:withRelevantPassUniqueIdentifier:](self, "_dismissForActionCompleted:withRelevantPassUniqueIdentifier:", 0, 0);
}

- (id)_dismissButtonColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryArticleLayout card](self->_articleLayout, "card");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "foregroundContentMode");

  if (v5 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;

    v3 = v7;
  }
  return v3;
}

- (PKDiscoveryCardView)cardView
{
  return self->_cardView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (BOOL)hasSafeAreaInsetOverride
{
  return self->_hasSafeAreaInsetOverride;
}

- (void)setHasSafeAreaInsetOverride:(BOOL)a3
{
  self->_hasSafeAreaInsetOverride = a3;
}

- (UIEdgeInsets)safeAreaOverrideInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaOverrideInsets.top;
  left = self->_safeAreaOverrideInsets.left;
  bottom = self->_safeAreaOverrideInsets.bottom;
  right = self->_safeAreaOverrideInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSafeAreaOverrideInsets:(UIEdgeInsets)a3
{
  self->_safeAreaOverrideInsets = a3;
}

- (BOOL)isAnimatingCard
{
  return self->_animatingCard;
}

- (void)setAnimatingCard:(BOOL)a3
{
  self->_animatingCard = a3;
}

- (PKDiscoveryArticleViewControllerDelegate)delegate
{
  return (PKDiscoveryArticleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKProximityReaderDiscoveryDelegate)proximityReaderDelegate
{
  return (PKProximityReaderDiscoveryDelegate *)objc_loadWeakRetained((id *)&self->_proximityReaderDelegate);
}

- (void)setProximityReaderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_proximityReaderDelegate, a3);
}

- (BOOL)shouldHideStatusBar
{
  return self->_shouldHideStatusBar;
}

- (void)setShouldHideStatusBar:(BOOL)a3
{
  self->_shouldHideStatusBar = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proximityReaderDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_cardTemplateInformation, 0);
  objc_storeStrong((id *)&self->_loadImageQueue, 0);
  objc_storeStrong((id *)&self->_imageDownloads, 0);
  objc_storeStrong((id *)&self->_cellImageCache, 0);
  objc_storeStrong((id *)&self->_screenEdgePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong(&self->_callToActionTappedOverride, 0);
  objc_storeStrong((id *)&self->_referrerIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_downloadingLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_articleLayout, 0);
}

@end
