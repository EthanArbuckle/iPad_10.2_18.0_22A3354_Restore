@implementation THFlowTOCViewController

- (THFlowTOCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  THFlowTOCViewController *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *mModelToUIMap;
  NSMutableDictionary *v11;
  NSMutableDictionary *mUIToModelMap;
  void *v13;
  id v14;
  objc_super v16;

  v5 = a3;
  v6 = THBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v16.receiver = self;
  v16.super_class = (Class)THFlowTOCViewController;
  v8 = -[THFlowTOCViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", v5, v7);

  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mModelToUIMap = v8->mModelToUIMap;
    v8->mModelToUIMap = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mUIToModelMap = v8->mUIToModelMap;
    v8->mUIToModelMap = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v14 = -[THFlowTOCViewController registerForTraitChanges:withAction:](v8, "registerForTraitChanges:withAction:", v13, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v8;
}

- (void)p_releaseOutlets
{
  THImageView *mHeaderView;
  TSWTableView *mTOCTableView;

  mHeaderView = self->mHeaderView;
  self->mHeaderView = 0;

  mTOCTableView = self->mTOCTableView;
  self->mTOCTableView = 0;

}

- (void)dealloc
{
  NSMutableDictionary *mModelToUIMap;
  NSMutableDictionary *mUIToModelMap;
  NSURL *mZipPackage;
  TSPData *mHeaderImageData;
  UIButton *mBackgroundButton;
  NSMutableDictionary *mChapterUIState;
  PFDContext *mDrmContext;
  UIImage *mCloseSectionImage;
  UIImage *mOpenSectionImage;
  THFlowTOCConfiguration *configuration;
  objc_super v13;

  -[THFlowTOCViewController p_releaseOutlets](self, "p_releaseOutlets");
  mModelToUIMap = self->mModelToUIMap;
  self->mModelToUIMap = 0;

  mUIToModelMap = self->mUIToModelMap;
  self->mUIToModelMap = 0;

  mZipPackage = self->mZipPackage;
  self->mZipPackage = 0;

  mHeaderImageData = self->mHeaderImageData;
  self->mHeaderImageData = 0;

  mBackgroundButton = self->mBackgroundButton;
  self->mBackgroundButton = 0;

  mChapterUIState = self->mChapterUIState;
  self->mChapterUIState = 0;

  mDrmContext = self->mDrmContext;
  self->mDrmContext = 0;

  mCloseSectionImage = self->mCloseSectionImage;
  self->mCloseSectionImage = 0;

  mOpenSectionImage = self->mOpenSectionImage;
  self->mOpenSectionImage = 0;

  configuration = self->_configuration;
  self->_configuration = 0;

  v13.receiver = self;
  v13.super_class = (Class)THFlowTOCViewController;
  -[THTOCViewController dealloc](&v13, "dealloc");
}

- (THFlowTOCConfiguration)configuration
{
  THFlowTOCConfiguration *configuration;
  THFlowTOCViewController *v4;
  THFlowTOCConfiguration *v5;
  THFlowTOCConfiguration *v6;

  configuration = self->_configuration;
  if (!configuration)
  {
    v4 = self;
    v5 = -[THFlowTOCConfiguration initWithContext:]([THFlowTOCConfiguration alloc], "initWithContext:", v4);
    v6 = self->_configuration;
    self->_configuration = v5;

    configuration = self->_configuration;
  }
  return configuration;
}

- (void)p_loadHeaderImageAndUpdateLayout
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  THImageView *v7;
  THImageView *mHeaderView;
  void *v9;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  double Height;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  TSWTableView *mTOCTableView;
  void *v27;
  double v28;
  id v29;
  CGRect v30;

  if (self->mHeaderImageData)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController headerImageViews](self, "headerImageViews"));

    if (!v3)
    {
      v4 = objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      -[THFlowTOCViewController setHeaderImageViews:](self, "setHeaderImageViews:", v4);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController headerImageViews](self, "headerImageViews"));
      objc_msgSend(v5, "setAutoresizesSubviews:", 0);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController headerImageViews](self, "headerImageViews"));
      objc_msgSend(v6, "addTarget:action:forControlEvents:", self, "p_tapOnBackground", 64);

      v7 = objc_alloc_init(THImageView);
      mHeaderView = self->mHeaderView;
      self->mHeaderView = v7;

      -[THImageView setUserInteractionEnabled:](self->mHeaderView, "setUserInteractionEnabled:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController headerImageViews](self, "headerImageViews"));
      objc_msgSend(v9, "addSubview:", self->mHeaderView);

    }
    v10 = -[TSWTableView frame](self->mTOCTableView, "frame");
    v12 = v11;
    v14 = TSUScreenScale(v10, v13) * v11;
    -[THFlowTOCViewController headerMaxSize](self, "headerMaxSize");
    if (v16 != v14 || v15 != 0.0)
    {
      -[THFlowTOCViewController setHeaderMaxSize:](self, "setHeaderMaxSize:", v14, 0.0);
      -[THImageView setImageData:maxSize:setLayerBounds:](self->mHeaderView, "setImageData:maxSize:setLayerBounds:", self->mHeaderImageData, 1, v14, 0.0);
    }
    -[THImageView frame](self->mHeaderView, "frame");
    if (v17 <= 0.0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController navigationController](self, "navigationController"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "navigationBar"));
      objc_msgSend(v22, "bounds");
      Height = CGRectGetHeight(v30);

    }
    else
    {
      v19 = v12 * (v18 / v17);
      Height = floorf(v19);
    }
    -[THImageView setFrame:](self->mHeaderView, "setFrame:", 0.0, 0.0, v12, Height);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController headerImageViews](self, "headerImageViews"));
    objc_msgSend(v23, "setFrame:", 0.0, 0.0, v12, Height);

    v29 = objc_msgSend(objc_alloc((Class)UITableViewHeaderFooterView), "initWithFrame:", 0.0, 0.0, v12, Height);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "contentView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController headerImageViews](self, "headerImageViews"));
    objc_msgSend(v24, "addSubview:", v25);

    -[TSWTableView setTableHeaderView:](self->mTOCTableView, "setTableHeaderView:", v29);
    mTOCTableView = self->mTOCTableView;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
    objc_msgSend(v27, "frame");
    -[TSWTableView _setPinsTableHeaderView:](mTOCTableView, "_setPinsTableHeaderView:", Height / v28 < 0.3, Height / v28);

  }
}

- (void)relinquishIntroMediaViewController
{
  -[THFlowTOCViewController setIntroMediaViewController:](self, "setIntroMediaViewController:", 0);
}

- (void)setIntroMediaViewController:(id)a3
{
  THiOSIntroMediaViewController *v5;
  THiOSIntroMediaViewController **p_mIntroMediaViewController;
  THiOSIntroMediaViewController *mIntroMediaViewController;
  THFlowTOCViewController *v8;
  THiOSIntroMediaViewController *v9;

  v5 = (THiOSIntroMediaViewController *)a3;
  p_mIntroMediaViewController = &self->mIntroMediaViewController;
  mIntroMediaViewController = self->mIntroMediaViewController;
  if (mIntroMediaViewController != v5)
  {
    v9 = v5;
    v8 = (THFlowTOCViewController *)objc_claimAutoreleasedReturnValue(-[THiOSIntroMediaViewController delegate](mIntroMediaViewController, "delegate"));

    if (v8 == self)
      -[THiOSIntroMediaViewController setDelegate:](*p_mIntroMediaViewController, "setDelegate:", 0);
    objc_storeStrong((id *)&self->mIntroMediaViewController, a3);
    -[THiOSIntroMediaViewController setDelegate:](*p_mIntroMediaViewController, "setDelegate:", self);
    v5 = v9;
  }

}

- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (a4)
  {
    v5 = a3;

    -[THFlowTOCViewController setIntroMediaViewController:](self, "setIntroMediaViewController:", v5);
    -[THTOCViewController setForceStatusBarVisible:](self, "setForceStatusBarVisible:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
    objc_msgSend(v16, "setFrame:", v8, v10, v12, v14);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
    objc_msgSend(v17, "addSubview:", v19);

    self->mForceTransitionCompletion = 0;
  }
  -[THFlowTOCViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance", a3);
}

- (BOOL)introMediaControllerIsActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)introMediaControllerIsOffscreen
{
  return !-[THFlowTOCViewController introMediaControllerIsActive](self, "introMediaControllerIsActive");
}

- (void)viewDidLoad
{
  void *v3;
  TSWTableView *mTOCTableView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double y;
  double height;
  double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)THFlowTOCViewController;
  -[THFlowTOCViewController viewDidLoad](&v32, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  mTOCTableView = self->mTOCTableView;
  if (!mTOCTableView)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController viewDidLoad]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 539, CFSTR("invalid nil value for '%s'"), "mTOCTableView");

    mTOCTableView = self->mTOCTableView;
  }
  -[TSWTableView setDelegate:](mTOCTableView, "setDelegate:", self);
  -[TSWTableView setDataSource:](self->mTOCTableView, "setDataSource:", self);
  -[TSWTableView setIgnoresEventsOutsideCells:](self->mTOCTableView, "setIgnoresEventsOutsideCells:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v8, "separatorColorWhite");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v9 / 255.0, 1.0));
  -[TSWTableView setSeparatorColor:](self->mTOCTableView, "setSeparatorColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  LODWORD(v8) = objc_msgSend(v11, "constrainTableWidthToLegacyiPadWidth");

  v12 = 0.0;
  if ((_DWORD)v8)
  {
    -[TSWTableView bounds](self->mTOCTableView, "bounds");
    v14 = (v13 + -768.0) * 0.5;
    if (v13 <= 768.0)
      v14 = 0.0;
    v12 = ceil(v14);
  }
  -[TSWTableView _setSectionContentInset:](self->mTOCTableView, "_setSectionContentInset:", 0.0, v12, 0.0, v12);
  -[TSWTableView _setPinsTableHeaderView:](self->mTOCTableView, "_setPinsTableHeaderView:", 0);
  -[TSWTableView setTranslatesAutoresizingMaskIntoConstraints:](self->mTOCTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TSWTableView registerClass:forCellReuseIdentifier:](self->mTOCTableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(THFlowTOCTableViewCell, v15), CFSTR("TOCCellReuseIdentifier"));
  y = CGRectZero.origin.y;
  height = CGRectZero.size.height;
  -[TSWTableView frame](self->mTOCTableView, "frame");
  v19 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, v18, height);
  objc_msgSend(v19, "setAutoresizingMask:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TSWTableView backgroundColor](self->mTOCTableView, "backgroundColor"));
  objc_msgSend(v19, "setBackgroundColor:", v20);

  -[TSWTableView setTableFooterView:](self->mTOCTableView, "setTableFooterView:", v19);
  self->mMaxPageNumberWidth = 0.0;
  self->mMaxOrdinalWidth = 0.0;
  -[THFlowTOCViewController initTOCSectionUIState](self, "initTOCSectionUIState");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage th_imageNamed:](UIImage, "th_imageNamed:", kTocArrowCloseImageN));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v22, "discloseButtonRadius");
  v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController p_circledButtonImageFromImage:radius:](self, "p_circledButtonImageFromImage:radius:", v21, v24));
  -[THFlowTOCViewController setCloseSectionImage:](self, "setCloseSectionImage:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage th_imageNamed:](UIImage, "th_imageNamed:", kTocArrowOpenImageN));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController p_circledButtonImageFromImage:radius:](self, "p_circledButtonImageFromImage:radius:", v26, v24));
  -[THFlowTOCViewController setOpenSectionImage:](self, "setOpenSectionImage:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bookTOCHeaderImageDataForTOC:", self));
  -[THFlowTOCViewController setHeaderImageData:](self, "setHeaderImageData:", v29);

  -[THFlowTOCViewController p_loadHeaderImageAndUpdateLayout](self, "p_loadHeaderImageAndUpdateLayout");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
  objc_msgSend(v31, "setBackgroundColor:", v30);

  -[THFlowTOCViewController p_applyTheme](self, "p_applyTheme");
}

- (id)p_circledButtonImageFromImage:(id)a3 radius:(double)a4
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4 + a4;
  objc_msgSend(v5, "size");
  v7 = TSDCenterRectOverRect(0.0);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = objc_alloc((Class)UIGraphicsImageRenderer);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
  v16 = objc_msgSend(v14, "initWithSize:format:", v15, v6, v6);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_BAC10;
  v20[3] = &unk_429068;
  v22 = 0;
  v23 = 0;
  v24 = v6;
  v25 = v6;
  v21 = v5;
  v26 = v7;
  v27 = v9;
  v28 = v11;
  v29 = v13;
  v17 = v5;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageWithActions:", v20));

  return v18;
}

- (void)p_tapOnBackground
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v4 = objc_msgSend(v3, "isToolbarHidden");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "showToolbarAnimated:", 1);
    else
      objc_msgSend(v5, "hideToolbarAnimated:", 1);

  }
}

- (void)p_applyTheme
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[THFlowTOCViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColorForTraitEnvironment:", self));

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tableViewSeparatorColor"));
      -[TSWTableView setSeparatorColor:](self->mTOCTableView, "setSeparatorColor:", v6);

    }
    else
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
    objc_msgSend(v7, "setBackgroundColor:", v10);

    -[TSWTableView setBackgroundColor:](self->mTOCTableView, "setBackgroundColor:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSWTableView tableFooterView](self->mTOCTableView, "tableFooterView"));
    objc_msgSend(v8, "setBackgroundColor:", v10);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSWTableView tableHeaderView](self->mTOCTableView, "tableHeaderView"));
    objc_msgSend(v9, "setBackgroundColor:", v10);

    -[TSWTableView reloadData](self->mTOCTableView, "reloadData");
    -[THFlowTOCViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    -[THFlowTOCViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THFlowTOCViewController;
  -[THFlowTOCViewController viewWillAppear:](&v11, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v4, "invalidate");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController backgroundButton](self, "backgroundButton"));
  if (!v5)
  {
    v6 = objc_alloc((Class)UIButton);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
    objc_msgSend(v7, "frame");
    v8 = objc_msgSend(v6, "initWithFrame:");

    objc_msgSend(v8, "setAutoresizingMask:", 18);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
    objc_msgSend(v9, "insertSubview:belowSubview:", v8, self->mTOCTableView);

    -[THFlowTOCViewController setBackgroundButton:](self, "setBackgroundButton:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController backgroundButton](self, "backgroundButton"));
    objc_msgSend(v10, "addTarget:action:forControlEvents:", self, "p_tapOnBackground", 64);

  }
}

- (void)setReflowablePaginationController:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_reflowablePaginationController);

  if (WeakRetained != obj)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController reflowablePaginationController](self, "reflowablePaginationController"));
    objc_msgSend(v5, "unregisterObserver:", self);

    objc_storeWeak((id *)&self->_reflowablePaginationController, obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController reflowablePaginationController](self, "reflowablePaginationController"));
    objc_msgSend(v6, "registerObserver:", self);

  }
}

- (void)p_updateMaxPageNumberWidth
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  char *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  float mMaxOrdinalWidth;
  float mMaxPageNumberWidth;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  NSAttributedStringKey v33;
  void *v34;
  NSAttributedStringKey v35;
  void *v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v32 = objc_msgSend(v3, "showPageNumbers");

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController pageNumberFont](self, "pageNumberFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController labelFontForRow:](self, "labelFontForRow:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController labelFontForRow:](self, "labelFontForRow:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v7 = objc_msgSend(v6, "toc:numberOfTilesInDivision:", self, 0);

  v28 = v7;
  if (v7)
  {
    v8 = 0;
    v30 = v4;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource", v28));
      v29 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "toc:tileModelForChapterIndex:", self, v8));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "portraitEntries"));
      v12 = (char *)objc_msgSend(v11, "count");

      if (v12)
      {
        for (i = 0; i != v12; ++i)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "portraitEntries"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", i));

          if (objc_msgSend(v15, "includeInTOC"))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sectionIdentifier"));
            if (i)
              v17 = v5;
            else
              v17 = v4;
            v35 = NSFontAttributeName;
            v36 = v17;
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
            objc_msgSend(v16, "sizeWithAttributes:", v18);
            v20 = v19;

            if (v20 > self->mMaxOrdinalWidth)
              self->mMaxOrdinalWidth = v20;
            if (v32)
            {
              if (-[THFlowTOCViewController hasPaginatedData](self, "hasPaginatedData"))
                v21 = objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController p_displayPageNumberForTileEntry:](self, "p_displayPageNumberForTileEntry:", v15));
              else
                v21 = objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController p_maxAbsolutePageNumberForNodeAtTileEntry:](self, "p_maxAbsolutePageNumberForNodeAtTileEntry:", v15));
              v22 = (void *)v21;
              v33 = NSFontAttributeName;
              v34 = v31;
              v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
              objc_msgSend(v22, "sizeWithAttributes:", v23);
              v25 = v24;

              if (v25 > self->mMaxPageNumberWidth)
                self->mMaxPageNumberWidth = v25;

              v4 = v30;
            }

          }
        }
      }

      v8 = v29 + 1;
    }
    while ((id)(v29 + 1) != v28);
  }
  mMaxOrdinalWidth = self->mMaxOrdinalWidth;
  self->mMaxOrdinalWidth = ceilf(mMaxOrdinalWidth);
  mMaxPageNumberWidth = self->mMaxPageNumberWidth;
  self->mMaxPageNumberWidth = ceilf(mMaxPageNumberWidth);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unsigned int v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)THFlowTOCViewController;
  -[THFlowTOCViewController viewDidLayoutSubviews](&v15, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v3, "cellHeight");
  -[TSWTableView setRowHeight:](self->mTOCTableView, "setRowHeight:");

  -[THFlowTOCViewController p_updateMaxPageNumberWidth](self, "p_updateMaxPageNumberWidth");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v4, "ordinalNumberLeftMargin");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v7, "discloseButtonRightMargin");
  v9 = v8;

  v10 = 0.0;
  -[TSWTableView setSeparatorInset:](self->mTOCTableView, "setSeparatorInset:", 0.0, v6, 0.0, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  v12 = objc_msgSend(v11, "constrainTableWidthToLegacyiPadWidth");

  if (v12)
  {
    -[TSWTableView bounds](self->mTOCTableView, "bounds");
    v14 = (v13 + -768.0) * 0.5;
    if (v13 <= 768.0)
      v14 = 0.0;
    v10 = ceil(v14);
  }
  -[TSWTableView _setSectionContentInset:](self->mTOCTableView, "_setSectionContentInset:", 0.0, v10, 0.0, v10);
  -[THFlowTOCViewController p_loadHeaderImageAndUpdateLayout](self, "p_loadHeaderImageAndUpdateLayout");
  -[TSWTableView reloadData](self->mTOCTableView, "reloadData");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THFlowTOCViewController;
  -[THFlowTOCViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  objc_msgSend(v4, "tocIsReadyToPresent:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  objc_msgSend(v5, "setupDVCForTOCController:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THFlowTOCViewController;
  -[THFlowTOCViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController findVisibleCellInTable:forIndexPath:](self, "findVisibleCellInTable:forIndexPath:", self->mTOCTableView, self->mLastSelectedRow));
  objc_msgSend(v4, "stopProgressIndicator");

}

- (id)findVisibleCellInTable:(id)a3 forIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForVisibleRows"));
  if (objc_msgSend(v7, "indexOfObject:", v6) == (id)0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForRowAtIndexPath:", v6));

  return v8;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THFlowTOCViewController;
  -[THFlowTOCViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v5, "invalidate");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));

  if (v7)
  {
    -[THFlowTOCViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    -[THFlowTOCViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
  objc_msgSend(v8, "setNeedsUpdateConstraints");

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration", a3, a4));
  objc_msgSend(v5, "invalidate");

  -[THFlowTOCViewController p_applyTheme](self, "p_applyTheme");
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "isToolbarHidden");

  return v3;
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  if (!self->mTransitionView)
  {
    v2.receiver = self;
    v2.super_class = (Class)THFlowTOCViewController;
    -[THFlowTOCViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
  }
}

- (BOOL)animatesPageDuringTransition
{
  return 0;
}

- (void)willTransitionFromChapterIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController willTransitionFromChapterIndex:]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 850, CFSTR("Not supported in flow TOC"));

}

- (void)didTransitionFromCanvas
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController didTransitionFromCanvas]"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v2, v3, 854, CFSTR("Not supported in flow TOC"));

}

- (CGRect)rectForPageThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 inLayer:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController rectForPageThumbnailAtIndex:chapterIndex:inLayer:]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 858, CFSTR("Not supported in flow TOC"));

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)initTOCSectionUIState
{
  void *v3;
  char *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  THFlowTOCChapterUIState *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  THFlowTOCViewController *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v19 = self;
  v4 = (char *)objc_msgSend(v3, "toc:numberOfTilesInDivision:", self, 0);

  v20 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", v4);
  v18 = v4;
  if ((uint64_t)v4 >= 1)
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, v5));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](v19, "dataSource"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toc:tileModelForChapterIndex:", v19, v5));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "portraitEntries"));
      v11 = objc_msgSend(v10, "count");

      v12 = -[THFlowTOCChapterUIState initWithSection:]([THFlowTOCChapterUIState alloc], "initWithSection:", v6);
      -[NSMutableDictionary setObject:forKey:](v19->mModelToUIMap, "setObject:forKey:", v7, v6);
      -[NSMutableDictionary setObject:forKey:](v19->mUIToModelMap, "setObject:forKey:", v6, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      if ((unint64_t)v11 >= 2)
      {
        for (i = 1; (id)i != v11; ++i)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "portraitEntries"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", i));

          if (objc_msgSend(v16, "indentLevel") == (char *)&dword_0 + 1
            && objc_msgSend(v16, "includeInTOC"))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, v5));
            objc_msgSend(v13, "addObject:", v17);

          }
        }
      }
      -[THFlowTOCChapterUIState setSubItems:](v12, "setSubItems:", v13);
      objc_msgSend(v20, "setObject:forKey:", v12, v7);

      ++v5;
    }
    while (v5 != v18);
  }
  -[THFlowTOCViewController setChapterUIState:](v19, "setChapterUIState:", v20);

}

- (BOOL)isSectionOpen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController chapterUIState](self, "chapterUIState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6)
    v7 = objc_msgSend(v6, "opened");
  else
    v7 = 0;

  return v7;
}

- (void)setSectionOpenInUIState:(BOOL)a3 forSection:(id)a4
{
  _BOOL8 v4;
  void *v6;
  THFlowTOCChapterUIState *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  id v21;

  v4 = a3;
  v21 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController chapterUIState](self, "chapterUIState"));
  v7 = (THFlowTOCChapterUIState *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v21));

  if (!v7)
  {
    v7 = -[THFlowTOCChapterUIState initWithSection:]([THFlowTOCChapterUIState alloc], "initWithSection:", v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController chapterUIState](self, "chapterUIState"));
    objc_msgSend(v8, "setObject:forKey:", v7, v21);

  }
  -[THFlowTOCChapterUIState setOpened:](v7, "setOpened:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCChapterUIState subItems](v7, "subItems"));

  if (v9)
    goto LABEL_12;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "toc:tileModelForChapterIndex:", self, objc_msgSend(v21, "section")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (char *)objc_msgSend(v21, "row") + 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "portraitEntries"));
  v15 = (char *)objc_msgSend(v14, "count");

  if (v13 >= v15)
    goto LABEL_11;
  while (1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "portraitEntries"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", v13));

    if ((uint64_t)objc_msgSend(v17, "indentLevel") < 2)
      break;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v13, objc_msgSend(v21, "section")));
    objc_msgSend(v12, "addObject:", v18);

LABEL_8:
    ++v13;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "portraitEntries"));
    v20 = (char *)objc_msgSend(v19, "count");

    if (v13 >= v20)
      goto LABEL_11;
  }
  if (objc_msgSend(v17, "indentLevel") != (char *)&dword_0 + 1)
    goto LABEL_8;

LABEL_11:
  -[THFlowTOCChapterUIState setSubItems:](v7, "setSubItems:", v12);

LABEL_12:
}

- (id)subItemsForSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController chapterUIState](self, "chapterUIState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subItems"));
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource", a3));
  v5 = objc_msgSend(v4, "toc:numberOfTilesInDivision:", self, 0);

  return (int64_t)v5;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[0] = a3;
  v20[1] = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndexes:length:](NSIndexPath, "indexPathWithIndexes:length:", v20, 2));
  if (-[THFlowTOCViewController isSectionOpen:](self, "isSectionOpen:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController subItemsForSection:](self, "subItemsForSection:", v4));
    v6 = (char *)objc_msgSend(v5, "count") + 1;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if (-[THFlowTOCViewController isSectionOpen:](self, "isSectionOpen:", v12, (_QWORD)v15))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController subItemsForSection:](self, "subItemsForSection:", v12));
            v6 = &v6[(_QWORD)objc_msgSend(v13, "count")];

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = (_BYTE *)(&dword_0 + 1);
  }

  return (int64_t)v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[THFlowTOCViewController numberOfRowsInSection:](self, "numberOfRowsInSection:", a4);
}

- (CGRect)frameForOrdinalAtIndentLevel:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  unsigned int v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v5, "ordinalNumberLeftMargin");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  v9 = objc_msgSend(v8, "multiLevelIndent");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
    objc_msgSend(v10, "ordinalWidthLevel1");
    v12 = v11;

    if (a3 < 1)
    {
      v17 = 0.0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
      objc_msgSend(v13, "ordinalWidthLevel2");
      v12 = v14;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
      objc_msgSend(v15, "ordinalWidthLevel1");
      v17 = v16 + 0.0;

      if (a3 != 1)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
        objc_msgSend(v18, "ordinalWidthLevel3");
        v12 = v19;

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
        objc_msgSend(v20, "ordinalWidthLevel2");
        v17 = v17 + v21;

        if ((unint64_t)a3 >= 3)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
          objc_msgSend(v22, "ordinalWidthLevel3");
          v17 = v17 + v23 * (double)(a3 - 2);

        }
      }
    }
    v7 = v7 + v17;
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
    v25 = v24;
    if (a3)
      objc_msgSend(v24, "ordinalNumberRightMarginSection");
    else
      objc_msgSend(v24, "ordinalNumberRightMarginChapter");
    v27 = v26;

    v12 = v27 + self->mMaxOrdinalWidth;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v28, "cellHeight");
  v30 = v29;

  v31 = 0.0;
  v32 = v7;
  v33 = v12;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v31;
  result.origin.x = v32;
  return result;
}

- (int64_t)numberOfSubentriesForIndex:(int64_t)a3 inModel:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  int64_t v9;
  int64_t v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "portraitEntries"));
  v6 = objc_msgSend(v5, "count");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a3));
  v8 = objc_msgSend(v7, "indentLevel");
  v9 = 0;
  v10 = a3 + 1;
  while (v10 < (uint64_t)v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v10));

    if (objc_msgSend(v11, "includeInTOC") && (uint64_t)objc_msgSend(v11, "indentLevel") > (uint64_t)v8)
      ++v9;
    ++v10;
    v7 = v11;
    if ((uint64_t)objc_msgSend(v11, "indentLevel") <= (uint64_t)v8)
      goto LABEL_9;
  }
  v11 = v7;
LABEL_9:

  return v9;
}

- (id)labelFontForRow:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v5, "chapterLabelFontSize");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v8, "sectionLabelFontSize");
  v10 = v9;

  if (a3)
    v11 = v10;
  else
    v11 = v7;
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v11));
}

- (id)pageNumberFont
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v2, "pageNumberFontSize");
  v4 = v3;

  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v4);
}

- (id)ordinalTextColor
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tocPageNumberTextColor"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
  }

  return v5;
}

- (id)chapterTitleColor
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentTextColor"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  }

  return v5;
}

- (id)pageNumberColor
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tocPageNumberTextColor"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
  }

  return v5;
}

- (id)p_displayPageNumberForTileEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char *v10;
  uint64_t v11;

  v4 = a3;
  v5 = THBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("-"), &stru_43D7D8, 0));

  if (-[THFlowTOCViewController hasPaginatedData](self, "hasPaginatedData"))
  {
    v8 = objc_msgSend(v4, "displayPageNumberValue");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v10 = (char *)objc_msgSend(v9, "absolutePageIndexForTileEntry:", v4);

    if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_7;
    v8 = v10 + 1;
  }
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringForValue:withListNumberFormat:includeFormatting:](NSString, "stringForValue:withListNumberFormat:includeFormatting:", v8, objc_msgSend(v4, "displayPageNumberFormat"), 0));

    v7 = (void *)v11;
  }
LABEL_7:

  return v7;
}

- (id)p_maxAbsolutePageNumberForNodeAtTileEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = THBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("-"), &stru_43D7D8, 0));

  if (!-[THFlowTOCViewController hasPaginatedData](self, "hasPaginatedData"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v9 = (uint64_t)objc_msgSend(v8, "maxAbsolutePageIndexForNodeAtTileEntry:", v4);

    if (v9 <= 0x7FFFFFFFFFFFFFFDLL)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[NSString stringForValue:withListNumberFormat:includeFormatting:](NSString, "stringForValue:withListNumberFormat:includeFormatting:", (v9 + 1), objc_msgSend(v4, "displayPageNumberFormat"), 0));

      v7 = (void *)v10;
    }
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double mMaxPageNumberWidth;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  unsigned int v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  unsigned int v55;
  void *v56;
  void *v57;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v9 = objc_msgSend(v8, "showPageNumbers");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v10, "cellHeight");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  v55 = v9;
  if ((objc_msgSend(v13, "pageNumberDynamicWidth") & 1) != 0)
  {
    mMaxPageNumberWidth = self->mMaxPageNumberWidth;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
    objc_msgSend(v15, "pageNumberLeftMargin");
    v17 = mMaxPageNumberWidth + v16;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
    objc_msgSend(v15, "pageNumberWidth");
    v17 = v18;
  }

  objc_msgSend(v7, "bounds");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  v22 = objc_msgSend(v21, "constrainTableWidthToLegacyiPadWidth");

  v23 = fmin(v20, 768.0);
  if (v22)
    v20 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("TOCCellReuseIdentifier"), v6));

  objc_msgSend(v24, "setFrame:", 0.0, 0.0, v20, v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration"));
  objc_msgSend(v24, "updateConstraintsWithConfiguration:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "backgroundColorForTraitEnvironment:", self));
    objc_msgSend(v24, "setBackgroundColor:", v28);

  }
  if (!v24)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController tableView:cellForRowAtIndexPath:]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, v31, 1167, CFSTR("invalid nil value for '%s'"), "cell");

  }
  v57 = v6;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mUIToModelMap, "objectForKey:", v6));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "toc:tileModelForChapterIndex:", self, objc_msgSend(v32, "section")));

  v56 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "portraitEntries"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndex:", objc_msgSend(v32, "row")));

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController labelFontForRow:](self, "labelFontForRow:", objc_msgSend(v32, "row")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ordinalLabel"));
  objc_msgSend(v39, "setFont:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController ordinalTextColor](self, "ordinalTextColor"));
  objc_msgSend(v39, "setTextColor:", v40);

  objc_msgSend(v39, "setBackgroundColor:", v37);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "sectionIdentifier"));
  objc_msgSend(v39, "setText:", v41);

  -[THFlowTOCViewController frameForOrdinalAtIndentLevel:](self, "frameForOrdinalAtIndentLevel:", objc_msgSend(v36, "indentLevel"));
  objc_msgSend(v24, "updateOrdinalLabelFrame:");
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rowLabel"));
  objc_msgSend(v42, "setFont:", v38);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController chapterTitleColor](self, "chapterTitleColor"));
  objc_msgSend(v42, "setTextColor:", v43);

  objc_msgSend(v42, "setBackgroundColor:", v37);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "title"));
  objc_msgSend(v42, "setText:", v44);

  if (v55)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pageNumberLabel"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController pageNumberFont](self, "pageNumberFont"));
    objc_msgSend(v45, "setFont:", v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController pageNumberColor](self, "pageNumberColor"));
    objc_msgSend(v45, "setTextColor:", v47);

    objc_msgSend(v45, "setBackgroundColor:", v37);
    objc_msgSend(v45, "setTextAlignment:", 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController p_displayPageNumberForTileEntry:](self, "p_displayPageNumberForTileEntry:", v36));
    objc_msgSend(v45, "setText:", v48);

    objc_msgSend(v45, "setHidden:", 0);
    objc_msgSend(v24, "updatePageNumberLabelWidth:", v17);

  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "openCloseButton"));
  if ((uint64_t)objc_msgSend(v36, "indentLevel") > 1
    || -[THFlowTOCViewController numberOfSubentriesForIndex:inModel:](self, "numberOfSubentriesForIndex:inModel:", objc_msgSend(v32, "row"), v56) < 1)
  {
    v51 = 1;
  }
  else
  {
    objc_msgSend(v49, "setBackgroundColor:", v37);
    if (-[THFlowTOCViewController isSectionOpen:](self, "isSectionOpen:", v57))
      v50 = objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController closeSectionImage](self, "closeSectionImage"));
    else
      v50 = objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController openSectionImage](self, "openSectionImage"));
    v52 = (void *)v50;
    objc_msgSend(v49, "setImage:forState:", v50, 0);

    objc_msgSend(v49, "setTag:", objc_msgSend(v57, "section"));
    objc_msgSend(v49, "addTarget:action:forControlEvents:", self, "accessoryTapped:", 64);
    v51 = 0;
  }
  objc_msgSend(v49, "setHidden:", v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "activityIndicatorView"));
  objc_msgSend(v53, "setHidden:", 1);

  objc_msgSend(v24, "setDelegate:", self);
  objc_msgSend(v24, "setIndexPath:", v57);
  objc_msgSend(v24, "updateBackgroundImage");

  return v24;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController configuration](self, "configuration", a3, a4));
  objc_msgSend(v4, "cellHeight");
  v6 = v5;

  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  if ((TSUPadUI(v7, v8) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mUIToModelMap, "objectForKey:", v7));
    v10 = objc_msgSend(v9, "row");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));

    if (!v11)
    {
      if (v10)
        v12 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryBackground](UIColor, "bc_booksSecondaryBackground"));
      else
        v12 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
      v13 = (void *)v12;
      objc_msgSend(v14, "setBackgroundColor:", v12);

    }
  }

}

- (void)makeSectionOpen:(id)a3 withSender:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  char *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  char *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id obj;
  id obja;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mUIToModelMap, "objectForKey:", v6));
  v9 = -[THFlowTOCViewController numberOfRowsInSection:](self, "numberOfRowsInSection:", objc_msgSend(v6, "section"));
  -[THFlowTOCViewController setSectionOpenInUIState:forSection:](self, "setSectionOpenInUIState:forSection:", 1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController closeSectionImage](self, "closeSectionImage"));
  v43 = v7;
  objc_msgSend(v7, "setImage:forState:", v10, 0);

  v42 = (void *)v8;
  obj = (id)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController subItemsForSection:](self, "subItemsForSection:", v8));
  v11 = (char *)objc_msgSend(obj, "count");
  v12 = -[NSMutableDictionary count](self->mModelToUIMap, "count");
  if (v12 != -[NSMutableDictionary count](self->mUIToModelMap, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController makeSectionOpen:withSender:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 1301, CFSTR("MAPS CORRUPT"));

  }
  v16 = v9 - 1;
  v44 = v6;
  if (v9 - 1 >= (unint64_t)objc_msgSend(v6, "row") + 1)
  {
    while (1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v16, objc_msgSend(v6, "section")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", &v11[v16], objc_msgSend(v6, "section")));
      v19 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mUIToModelMap, "objectForKey:", v17));
      if (!v19)
        break;
      v20 = (void *)v19;
      -[NSMutableDictionary removeObjectForKey:](self->mUIToModelMap, "removeObjectForKey:", v17);
      -[NSMutableDictionary setObject:forKey:](self->mUIToModelMap, "setObject:forKey:", v20, v18);
      -[NSMutableDictionary setObject:forKey:](self->mModelToUIMap, "setObject:forKey:", v18, v20);
      v21 = -[NSMutableDictionary count](self->mModelToUIMap, "count");
      if (v21 != -[NSMutableDictionary count](self->mUIToModelMap, "count"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
        v23 = v11;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController makeSectionOpen:withSender:]"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v24, v25, 1319, CFSTR("MAPS CORRUPT"));

        v11 = v23;
        v6 = v44;

      }
      if (--v16 < (unint64_t)objc_msgSend(v6, "row") + 1)
        goto LABEL_10;
    }

  }
LABEL_10:
  v26 = -[NSMutableDictionary count](self->mModelToUIMap, "count");
  if (v26 != -[NSMutableDictionary count](self->mUIToModelMap, "count"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController makeSectionOpen:withSender:]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 1321, CFSTR("MAPS CORRUPT"));

  }
  v30 = (char *)objc_msgSend(v6, "row");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obja = obj;
  v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v34)
          objc_enumerationMutation(obja);
        v36 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)i + (_QWORD)v30 + 1, objc_msgSend(v36, "section")));
        objc_msgSend(v31, "addObject:", v37);
        -[NSMutableDictionary setObject:forKey:](self->mModelToUIMap, "setObject:forKey:", v37, v36);
        -[NSMutableDictionary setObject:forKey:](self->mUIToModelMap, "setObject:forKey:", v36, v37);
        v38 = -[NSMutableDictionary count](self->mModelToUIMap, "count");
        if (v38 != -[NSMutableDictionary count](self->mUIToModelMap, "count"))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController makeSectionOpen:withSender:]"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
          objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, v41, 1334, CFSTR("MAPS CORRUPT"));

        }
      }
      v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      v30 = (char *)i + (_QWORD)v30;
    }
    while (v33);
  }

  -[TSWTableView beginUpdates](self->mTOCTableView, "beginUpdates");
  -[TSWTableView insertRowsAtIndexPaths:withRowAnimation:](self->mTOCTableView, "insertRowsAtIndexPaths:withRowAnimation:", v31, 3);
  -[TSWTableView endUpdates](self->mTOCTableView, "endUpdates");

}

- (void)makeSectionClosed:(id)a3 withSender:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *k;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _UNKNOWN **v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  unsigned int v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mUIToModelMap, "objectForKey:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController subItemsForSection:](self, "subItemsForSection:", v8));
  v44 = -[THFlowTOCViewController numberOfRowsInSection:](self, "numberOfRowsInSection:", objc_msgSend(v6, "section"));
  v42 = (void *)v8;
  -[THFlowTOCViewController setSectionOpenInUIState:forSection:](self, "setSectionOpenInUIState:forSection:", 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController openSectionImage](self, "openSectionImage"));
  v43 = v7;
  objc_msgSend(v7, "setImage:forState:", v10, 0);

  objc_msgSend(v6, "row");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mModelToUIMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i)));
        objc_msgSend(v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    }
    while (v14);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v12;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v58;
    v45 = *(_QWORD *)v58;
    do
    {
      v21 = 0;
      v46 = v19;
      do
      {
        if (*(_QWORD *)v58 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v21);
        if (-[THFlowTOCViewController isSectionOpen:](self, "isSectionOpen:", v22))
        {
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController subItemsForSection:](self, "subItemsForSection:", v22));
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v54;
            do
            {
              for (j = 0; j != v25; j = (char *)j + 1)
              {
                if (*(_QWORD *)v54 != v26)
                  objc_enumerationMutation(v23);
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mModelToUIMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j)));
                objc_msgSend(v11, "addObject:", v28);

              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
            }
            while (v25);
          }

          -[THFlowTOCViewController setSectionOpenInUIState:forSection:](self, "setSectionOpenInUIState:forSection:", 0, v22);
          v20 = v45;
          v19 = v46;
        }
        v21 = (char *)v21 + 1;
      }
      while (v21 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    }
    while (v19);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v29 = v11;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v31; k = (char *)k + 1)
      {
        if (*(_QWORD *)v50 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)k);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mUIToModelMap, "objectForKey:", v34));
        -[NSMutableDictionary removeObjectForKey:](self->mModelToUIMap, "removeObjectForKey:", v35);
        -[NSMutableDictionary removeObjectForKey:](self->mUIToModelMap, "removeObjectForKey:", v34);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    }
    while (v31);
  }

  v36 = v6;
  if (v44 >= 2)
  {
    v37 = 1;
    v38 = &AEAnnotationPopoverShouldHideNotification_ptr;
    v47 = 1;
    do
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38[419], "indexPathForRow:inSection:", v37, objc_msgSend(v36, "section")));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mUIToModelMap, "objectForKey:", v39));
      if (v40)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38[419], "indexPathForRow:inSection:", v47, objc_msgSend(v36, "section")));
        -[NSMutableDictionary setObject:forKey:](self->mUIToModelMap, "setObject:forKey:", v40, v41);
        -[NSMutableDictionary setObject:forKey:](self->mModelToUIMap, "setObject:forKey:", v41, v40);
        if (objc_msgSend(v39, "compare:", v41))
          -[NSMutableDictionary removeObjectForKey:](self->mUIToModelMap, "removeObjectForKey:", v39);
        ++v47;

        v36 = v6;
        v38 = &AEAnnotationPopoverShouldHideNotification_ptr;
      }

      ++v37;
    }
    while (v44 != v37);
  }
  -[TSWTableView beginUpdates](self->mTOCTableView, "beginUpdates");
  -[TSWTableView deleteRowsAtIndexPaths:withRowAnimation:](self->mTOCTableView, "deleteRowsAtIndexPaths:withRowAnimation:", v29, 3);
  -[TSWTableView endUpdates](self->mTOCTableView, "endUpdates");

}

- (void)accessoryTapped:(id)a3
{
  TSWTableView *mTOCTableView;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  mTOCTableView = self->mTOCTableView;
  v5 = a3;
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  -[TSWTableView convertPoint:fromView:](mTOCTableView, "convertPoint:fromView:", v10, v7, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue(-[TSWTableView indexPathForRowAtPoint:](mTOCTableView, "indexPathForRowAtPoint:"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mUIToModelMap, "objectForKey:", v12));
  if (-[THFlowTOCViewController isSectionOpen:](self, "isSectionOpen:", v11))
    -[THFlowTOCViewController makeSectionClosed:withSender:](self, "makeSectionClosed:withSender:", v12, v5);
  else
    -[THFlowTOCViewController makeSectionOpen:withSender:](self, "makeSectionOpen:withSender:", v12, v5);

}

- (void)p_showPageForModelLink:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
  objc_msgSend(v5, "showPageForModelLink:animated:", v4, 1);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSIndexPath *v6;
  id v7;
  void *v8;
  NSIndexPath *mLastSelectedRow;
  NSIndexPath *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = (NSIndexPath *)a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForSelectedRow"));
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v8, 0);

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", self->mLastSelectedRow, 0);
  v18 = (id)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController findVisibleCellInTable:forIndexPath:](self, "findVisibleCellInTable:forIndexPath:", v7, self->mLastSelectedRow));
  self->mSuppressLastSelectedRow = 1;
  mLastSelectedRow = self->mLastSelectedRow;
  self->mLastSelectedRow = v6;
  v10 = v6;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController findVisibleCellInTable:forIndexPath:](self, "findVisibleCellInTable:forIndexPath:", v7, self->mLastSelectedRow));
  objc_msgSend(v18, "updateBackgroundImage");
  objc_msgSend(v11, "updateBackgroundImage");
  objc_msgSend(v11, "startProgressIndicator");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->mUIToModelMap, "objectForKey:", v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "toc:tileModelForChapterIndex:", self, objc_msgSend(v12, "section")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "portraitEntries"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v12, "row")));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "modelLink"));
  -[THFlowTOCViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_showPageForModelLink:", v17, 0.0);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v4;

  if (self->mSuppressLastSelectedRow)
  {
    self->mSuppressLastSelectedRow = 0;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController findVisibleCellInTable:forIndexPath:](self, "findVisibleCellInTable:forIndexPath:", self->mTOCTableView, self->mLastSelectedRow));
    objc_msgSend(v4, "updateBackgroundImage");

  }
}

- (void)paginationController:(id)a3 paginationCompleteStateChangedTo:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (-[THFlowTOCViewController isViewLoaded](self, "isViewLoaded", a3))
  {
    if (v4)
      -[THFlowTOCViewController p_updateMaxPageNumberWidth](self, "p_updateMaxPageNumberWidth");
    -[TSWTableView reloadData](self->mTOCTableView, "reloadData");
  }
}

- (void)tableViewCellHighlightDidChange:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "isHighlighted"))
  {
    self->mSuppressLastSelectedRow = 1;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController findVisibleCellInTable:forIndexPath:](self, "findVisibleCellInTable:forIndexPath:", self->mTOCTableView, self->mLastSelectedRow));
    objc_msgSend(v4, "updateBackgroundImage");

  }
}

- (void)tableViewCell:(id)a3 hideSeparators:(BOOL)a4
{
  _BOOL8 v4;
  TSWTableView *mTOCTableView;
  id v6;

  v4 = a4;
  mTOCTableView = self->mTOCTableView;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[TSWTableView indexPathForCell:](mTOCTableView, "indexPathForCell:", a3));
  -[TSWTableView setSeparatorsHidden:forCellAtIndexPath:](mTOCTableView, "setSeparatorsHidden:forCellAtIndexPath:", v4, v6);

}

- (BOOL)tableViewCellShouldStayHighlighted:(id)a3
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "indexPath"));
  if (objc_msgSend(v4, "isEqual:", self->mLastSelectedRow))
    v5 = !self->mSuppressLastSelectedRow;
  else
    v5 = 0;

  return v5;
}

- (id)tableViewCellBackgroundColor:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;

  v4 = a3;
  v5 = -[THFlowTOCViewController tableViewCellShouldStayHighlighted:](self, "tableViewCellShouldStayHighlighted:", v4);
  v6 = objc_msgSend(v4, "isHighlighted");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));

  v9 = v6 | v5;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController theme](self, "theme"));
    v11 = v10;
    if (v9)
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableViewCellSelectedColor"));
    else
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "backgroundColorForTraitEnvironment:", self));
    v15 = (void *)v12;

    v7 = v15;
LABEL_9:

    return v7;
  }
  if (v9)
  {
    if (v6)
    {
      v13 = 0.882352941;
      v14 = 0.929411765;
    }
    else
    {
      if (!v5)
        return v7;
      v13 = 0.929411765;
      v14 = 0.956862745;
    }
    v11 = v7;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v13, v14, 1.0, 1.0));
    goto LABEL_9;
  }
  return v7;
}

- (void)transitionWillFinish:(id)a3
{
  THTOCSplitTransitionView *mTransitionView;
  void *v5;
  void *v6;
  void *v7;
  THTOCSplitTransitionView *v8;

  mTransitionView = (THTOCSplitTransitionView *)a3;
  v8 = mTransitionView;
  if (self->mTransitionView != mTransitionView)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController transitionWillFinish:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 1584, CFSTR("unexpected transition view"));

    mTransitionView = self->mTransitionView;
  }
  if (!-[THTOCSplitTransitionView wasReversed](mTransitionView, "wasReversed"))
  {
    -[THTOCViewController setForceStatusBarVisible:](self, "setForceStatusBarVisible:", 1);
    -[THFlowTOCViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
  }

}

- (void)transitionDidFinish:(id)a3
{
  THTOCSplitTransitionView *mTransitionView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  THTOCSplitTransitionView *v19;
  THTOCSplitTransitionView *v20;

  mTransitionView = (THTOCSplitTransitionView *)a3;
  v20 = mTransitionView;
  if (self->mTransitionView != mTransitionView)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController transitionDidFinish:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 1594, CFSTR("unexpected transition view"));

    mTransitionView = self->mTransitionView;
  }
  if (!-[THTOCSplitTransitionView wasReversed](mTransitionView, "wasReversed"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    objc_msgSend(v8, "TOCViewControllerDidShowChapter:", self);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
    objc_msgSend(v9, "didTransitionFromViewController:toTOCViewController:", v10, self);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
    LODWORD(v10) = objc_msgSend(v11, "isPlaying");

    if ((_DWORD)v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
      objc_msgSend(v12, "pause");

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
    objc_msgSend(v13, "prepareControlsForTOC");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
    objc_msgSend(v14, "prepareMovieForTOC");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
    v16 = objc_msgSend(v15, "isViewLoaded");

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
      objc_msgSend(v18, "removeFromSuperview");

    }
    -[THFlowTOCViewController setIntroMediaViewController:](self, "setIntroMediaViewController:", 0);
  }
  v19 = self->mTransitionView;
  self->mTransitionView = 0;

}

- (BOOL)closeButtonIsNeeded
{
  return 1;
}

- (void)introMediaControllerShouldAdvancePast:(id)a3
{
  void *v4;
  THTOCSplitTransitionView *mTransitionView;
  void *v6;
  void *v7;
  void *v8;

  self->mForceTransitionCompletion = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController", a3));
  objc_msgSend(v4, "prepareControlsForTOC");

  if (!self->mTransitionView)
  {
    -[THFlowTOCViewController p_setupTransitionView](self, "p_setupTransitionView");
    mTransitionView = self->mTransitionView;
    if (!mTransitionView)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController introMediaControllerShouldAdvancePast:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 1637, CFSTR("invalid nil value for '%s'"), "mTransitionView");

      mTransitionView = self->mTransitionView;
    }
    -[THTOCSplitTransitionView beginTransition](mTransitionView, "beginTransition");
  }
}

- (id)p_indexPathForChapterIndex:(unint64_t)a3 lessonIndex:(unint64_t)a4
{
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
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  if ((unint64_t)-[TSWTableView numberOfSections](self->mTOCTableView, "numberOfSections") <= a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController p_indexPathForChapterIndex:lessonIndex:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 1645, CFSTR("invalid chapter index"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, a3));
  if (-[THFlowTOCViewController isSectionOpen:](self, "isSectionOpen:", v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THTOCViewController dataSource](self, "dataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toc:tileModelForChapterIndex:", self, a3));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "portraitEntries"));
    if ((unint64_t)objc_msgSend(v13, "count") <= a4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController p_indexPathForChapterIndex:lessonIndex:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 1651, CFSTR("invalid lesson index"));

    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v13;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = 0;
      v22 = *(_QWORD *)v27;
LABEL_8:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v17);
        v20 += objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v23), "includeInTOC");
        if (v21 + v23 + 1 >= a4)
          break;
        if (v19 == (id)++v23)
        {
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          v21 += v23;
          if (v19)
            goto LABEL_8;
          break;
        }
      }
    }
    else
    {
      v20 = 0;
    }

    v24 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v20, a3));
    v10 = (void *)v24;
  }
  return v10;
}

- (id)p_cellForChapterIndex:(unint64_t)a3 lessonIndex:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController p_indexPathForChapterIndex:lessonIndex:](self, "p_indexPathForChapterIndex:lessonIndex:", a3, a4));
  v7 = objc_opt_class(THFlowTOCTableViewCell, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSWTableView cellForRowAtIndexPath:](self->mTOCTableView, "cellForRowAtIndexPath:", v5));
  TSUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (double)bottomSeparatorYPositionForChapterIndex:(unint64_t)a3 lessonIndex:(unint64_t)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double MaxY;
  CGRect v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController p_cellForChapterIndex:lessonIndex:](self, "p_cellForChapterIndex:lessonIndex:", a3, a4));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
  objc_msgSend(v5, "convertRect:toView:", v14, v7, v9, v11, v13);
  MaxY = CGRectGetMaxY(v17);

  return MaxY;
}

- (void)scrollToRowForChapterIndex:(unint64_t)a3 lessonIndex:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController p_indexPathForChapterIndex:lessonIndex:](self, "p_indexPathForChapterIndex:lessonIndex:", a3, a4));
  -[TSWTableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->mTOCTableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v5, 2, 0);

}

- (id)rasterizedImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v16[8];
  objc_super v17;
  CATransform3D v18;
  CATransform3D v19;

  CATransform3DMakeTranslation(&v19, 10000.0, 10000.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  v18 = v19;
  objc_msgSend(v5, "setTransform:", &v18);

  v17.receiver = self;
  v17.super_class = (Class)THFlowTOCViewController;
  v6 = -[THFlowTOCViewController rasterizedImage](&v17, "rasterizedImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  v11 = *(_OWORD *)&CATransform3DIdentity.m33;
  v16[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v16[5] = v11;
  v12 = *(_OWORD *)&CATransform3DIdentity.m43;
  v16[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v16[7] = v12;
  v13 = *(_OWORD *)&CATransform3DIdentity.m13;
  v16[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v16[1] = v13;
  v14 = *(_OWORD *)&CATransform3DIdentity.m23;
  v16[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v16[3] = v14;
  objc_msgSend(v10, "setTransform:", v16);

  return v7;
}

- (void)p_setupTransitionView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  THTOCSplitTransitionView *v9;
  void *v10;
  THTOCSplitTransitionView *v11;
  THTOCSplitTransitionView *mTransitionView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  THTOCSplitTransitionView *v20;
  void *v21;
  id v22;

  if (self->mTransitionView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController p_setupTransitionView]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 1706, CFSTR("expected nil value for '%s'"), "mTransitionView");

  }
  if ((-[THFlowTOCViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCViewController p_setupTransitionView]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 1707, CFSTR("THFlowTOCViewController view is not loaded"));

  }
  v9 = [THTOCSplitTransitionView alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  v11 = -[THTOCSplitTransitionView initWithFrame:](v9, "initWithFrame:");
  mTransitionView = self->mTransitionView;
  self->mTransitionView = v11;

  -[THTransitionView setDelegate:](self->mTransitionView, "setDelegate:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
  -[THTransitionView setFromViewController:](self->mTransitionView, "setFromViewController:", v13);

  -[THTOCSplitTransitionView setKeepScaleAnimationView:](self->mTransitionView, "setKeepScaleAnimationView:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController introMediaViewController](self, "introMediaViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "snapshotViewAfterScreenUpdates:", 0));
  -[THTOCSplitTransitionView setScaleAnimationView:](self->mTransitionView, "setScaleAnimationView:", v16);

  -[THTOCSplitTransitionView setKeepSplitAnimationView:](self->mTransitionView, "setKeepSplitAnimationView:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TSWTableView snapshotViewAfterScreenUpdates:](self->mTOCTableView, "snapshotViewAfterScreenUpdates:", 0));
  -[THTOCSplitTransitionView setSplitAnimationView:](self->mTransitionView, "setSplitAnimationView:", v17);

  -[THTransitionView setToViewController:](self->mTransitionView, "setToViewController:", self);
  -[THTOCSplitTransitionView setReverse:](self->mTransitionView, "setReverse:", 1);
  -[THTOCSplitTransitionView slideAnimationScalar](self->mTransitionView, "slideAnimationScalar");
  -[THTOCSplitTransitionView setAnimationDuration:](self->mTransitionView, "setAnimationDuration:", 0.349999994 / v18);
  v22 = (id)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "superview"));
  v20 = self->mTransitionView;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self, "view"));
  objc_msgSend(v19, "insertSubview:aboveSubview:", v20, v21);

}

- (TSPData)headerImageData
{
  return self->mHeaderImageData;
}

- (void)setHeaderImageData:(id)a3
{
  objc_storeStrong((id *)&self->mHeaderImageData, a3);
}

- (NSURL)zipPackage
{
  return self->mZipPackage;
}

- (void)setZipPackage:(id)a3
{
  objc_storeStrong((id *)&self->mZipPackage, a3);
}

- (PFDContext)drmContext
{
  return self->mDrmContext;
}

- (void)setDrmContext:(id)a3
{
  objc_storeStrong((id *)&self->mDrmContext, a3);
}

- (THiOSIntroMediaViewController)introMediaViewController
{
  return self->mIntroMediaViewController;
}

- (UIButton)backgroundButton
{
  return self->mBackgroundButton;
}

- (void)setBackgroundButton:(id)a3
{
  objc_storeStrong((id *)&self->mBackgroundButton, a3);
}

- (UIImage)closeSectionImage
{
  return self->mCloseSectionImage;
}

- (void)setCloseSectionImage:(id)a3
{
  objc_storeStrong((id *)&self->mCloseSectionImage, a3);
}

- (UIImage)openSectionImage
{
  return self->mOpenSectionImage;
}

- (void)setOpenSectionImage:(id)a3
{
  objc_storeStrong((id *)&self->mOpenSectionImage, a3);
}

- (NSMutableDictionary)chapterUIState
{
  return self->mChapterUIState;
}

- (void)setChapterUIState:(id)a3
{
  objc_storeStrong((id *)&self->mChapterUIState, a3);
}

- (UIButton)headerImageViews
{
  return self->_headerImageViews;
}

- (void)setHeaderImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_headerImageViews, a3);
}

- (THReflowablePaginationController)reflowablePaginationController
{
  return (THReflowablePaginationController *)objc_loadWeakRetained((id *)&self->_reflowablePaginationController);
}

- (BOOL)hasPaginatedData
{
  return self->_hasPaginatedData;
}

- (void)setHasPaginatedData:(BOOL)a3
{
  self->_hasPaginatedData = a3;
}

- (CGSize)headerMaxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_headerMaxSize.width;
  height = self->_headerMaxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setHeaderMaxSize:(CGSize)a3
{
  self->_headerMaxSize = a3;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_reflowablePaginationController);
  objc_storeStrong((id *)&self->_headerImageViews, 0);
  objc_storeStrong((id *)&self->mOpenSectionImage, 0);
  objc_storeStrong((id *)&self->mCloseSectionImage, 0);
  objc_storeStrong((id *)&self->mBackgroundButton, 0);
  objc_storeStrong((id *)&self->mDrmContext, 0);
  objc_storeStrong((id *)&self->mChapterUIState, 0);
  objc_storeStrong((id *)&self->mTransitionView, 0);
  objc_storeStrong((id *)&self->mLastSelectedRow, 0);
  objc_storeStrong((id *)&self->mIntroMediaViewController, 0);
  objc_storeStrong((id *)&self->mHeaderImageData, 0);
  objc_storeStrong((id *)&self->mZipPackage, 0);
  objc_storeStrong((id *)&self->mTableBottomFade, 0);
  objc_storeStrong((id *)&self->mTableTopFade, 0);
  objc_storeStrong((id *)&self->mUIToModelMap, 0);
  objc_storeStrong((id *)&self->mModelToUIMap, 0);
  objc_storeStrong((id *)&self->mTOCTableView, 0);
  objc_storeStrong((id *)&self->mHeaderView, 0);
}

@end
