@implementation SteppingPageViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updatePageMarkerText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("%@ of %@"), CFSTR("localized string not found"), 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)-[UIPageControl currentPage](self->_pageControl, "currentPage") + 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v4, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[UIPageControl numberOfPages](self->_pageControl, "numberOfPages")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v6, 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v5, v7));
  -[UILabel setText:](self->_pageMarkerLabel, "setText:", v8);

}

- (void)_updatePageIndicatorVisibility
{
  unsigned int v3;
  UIPageControl *pageControl;
  double v5;
  double v6;
  void *v7;
  double v8;
  uint64_t v9;

  v3 = -[SteppingPageViewController isPageIndicatorHidden](self, "isPageIndicatorHidden");
  pageControl = self->_pageControl;
  if (v3)
  {
    -[UIPageControl setHidden:](pageControl, "setHidden:", 1);
  }
  else
  {
    -[UIPageControl intrinsicContentSize](pageControl, "intrinsicContentSize");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
    objc_msgSend(v7, "frame");
    -[UIPageControl setHidden:](self->_pageControl, "setHidden:", v6 > v8 + -32.0);

  }
  if (-[SteppingPageViewController isPageIndicatorHidden](self, "isPageIndicatorHidden"))
    v9 = 1;
  else
    v9 = -[UIPageControl isHidden](self->_pageControl, "isHidden") ^ 1;
  -[UILabel setHidden:](self->_pageMarkerLabel, "setHidden:", v9);
}

- (SteppingPageViewController)initWithSignGenerator:(id)a3
{
  id v4;
  SteppingPageViewController *v5;
  SteppingPageViewController *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *auxViewHeightCache;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SteppingPageViewController;
  v5 = -[SteppingPageViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_signGenerator, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    auxViewHeightCache = v6->_auxViewHeightCache;
    v6->_auxViewHeightCache = v7;

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SteppingPageViewController;
  -[SteppingPageViewController viewDidLoad](&v7, "viewDidLoad");
  -[SteppingPageViewController _setupViews](self, "_setupViews");
  -[SteppingPageViewController _setupConstraints](self, "_setupConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = MNLocaleDidChangeNotification();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_localeDidChange", v6, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SteppingPageViewController;
  -[SteppingPageViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MapsTestingMapsRegionUpdatedWithGuidanceStep"), self);

}

- (void)_setupViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *auxViewContainer;
  void *v14;
  void *v15;
  void *v16;
  UITapGestureRecognizer *v17;
  UITapGestureRecognizer *singleTapGestureRecognizer;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  objc_msgSend(v3, "setClipsToBounds:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController theme](self, "theme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navSignPrimaryColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "panGestureRecognizer"));
  objc_msgSend(v9, "addGestureRecognizer:", v11);

  v12 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  auxViewContainer = self->_auxViewContainer;
  self->_auxViewContainer = v12;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_auxViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setClipsToBounds:](self->_auxViewContainer, "setClipsToBounds:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  objc_msgSend(v14, "addSubview:", self->_auxViewContainer);

  -[SteppingPageViewController _initPageControl](self, "_initPageControl");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  objc_msgSend(v15, "addSubview:", self->_pageControl);

  -[SteppingPageViewController _initPageMarkerLabel](self, "_initPageMarkerLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  objc_msgSend(v16, "addSubview:", self->_pageMarkerLabel);

  v17 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleTap:");
  singleTapGestureRecognizer = self->_singleTapGestureRecognizer;
  self->_singleTapGestureRecognizer = v17;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  objc_msgSend(v19, "addGestureRecognizer:", self->_singleTapGestureRecognizer);

}

- (UICollectionView)collectionView
{
  UICollectionView *collectionView;
  StepPagingCollectionViewFlowLayout *v4;
  UICollectionView *v5;
  UICollectionView *v6;
  void *v7;

  collectionView = self->_collectionView;
  if (!collectionView)
  {
    v4 = objc_alloc_init(StepPagingCollectionViewFlowLayout);
    -[StepPagingCollectionViewFlowLayout setScrollDirection:](v4, "setScrollDirection:", 1);
    -[StepPagingCollectionViewFlowLayout setMinimumLineSpacing:](v4, "setMinimumLineSpacing:", 0.0);
    -[StepPagingCollectionViewFlowLayout setMinimumInteritemSpacing:](v4, "setMinimumInteritemSpacing:", 0.0);
    -[StepPagingCollectionViewFlowLayout setSectionInset:](v4, "setSectionInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v5 = (UICollectionView *)objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v6 = self->_collectionView;
    self->_collectionView = v5;

    -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
    -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
    -[UICollectionView setOpaque:](self->_collectionView, "setOpaque:", 0);
    -[UICollectionView setPagingEnabled:](self->_collectionView, "setPagingEnabled:", 1);
    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v7);

    -[UICollectionView setContentInsetAdjustmentBehavior:](self->_collectionView, "setContentInsetAdjustmentBehavior:", 2);
    collectionView = self->_collectionView;
  }
  return collectionView;
}

- (void)_initPageControl
{
  UIPageControl *v3;
  UIPageControl *pageControl;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v3 = (UIPageControl *)objc_msgSend(objc_alloc((Class)UIPageControl), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  pageControl = self->_pageControl;
  self->_pageControl = v3;

  -[UIPageControl setUserInteractionEnabled:](self->_pageControl, "setUserInteractionEnabled:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", 0.300000012));
  -[UIPageControl setPageIndicatorTintColor:](self->_pageControl, "setPageIndicatorTintColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", 0.899999976));
  -[UIPageControl setCurrentPageIndicatorTintColor:](self->_pageControl, "setCurrentPageIndicatorTintColor:", v6);

  -[UIPageControl setTranslatesAutoresizingMaskIntoConstraints:](self->_pageControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (void)_initPageMarkerLabel
{
  UILabel *v3;
  UILabel *pageMarkerLabel;
  void *v5;
  void *v6;

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  pageMarkerLabel = self->_pageMarkerLabel;
  self->_pageMarkerLabel = v3;

  -[UILabel setTextAlignment:](self->_pageMarkerLabel, "setTextAlignment:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleCaption2));
  -[UILabel setFont:](self->_pageMarkerLabel, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_pageMarkerLabel, "setTextColor:", v6);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_pageMarkerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setHidden:](self->_pageMarkerLabel, "setHidden:", 1);
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *signHeightConstraint;
  double v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *auxViewHeightConstraint;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *collectionViewHeightConstraint;
  void *v14;
  void *v15;
  id WeakRetained;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *topAuxViewToPageControlBottomConstraint;
  void *v19;
  void *v20;
  id v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *topAuxViewToPageMarkerBaselineConstraint;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *pageControlHeightConstraint;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSLayoutConstraint *v38;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
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
  _QWORD v71[15];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:", 0.0));
  signHeightConstraint = self->_signHeightConstraint;
  self->_signHeightConstraint = v5;

  LODWORD(v7) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_signHeightConstraint, "setPriority:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_auxViewContainer, "heightAnchor"));
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", 0.0));
  auxViewHeightConstraint = self->_auxViewHeightConstraint;
  self->_auxViewHeightConstraint = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView heightAnchor](self->_collectionView, "heightAnchor"));
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 0.0));
  collectionViewHeightConstraint = self->_collectionViewHeightConstraint;
  self->_collectionViewHeightConstraint = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_auxViewContainer, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIPageControl bottomAnchor](self->_pageControl, "bottomAnchor"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_signGenerator);
  objc_msgSend(WeakRetained, "distanceFromPageControlBaselineToTopOfAuxView");
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15));
  topAuxViewToPageControlBottomConstraint = self->_topAuxViewToPageControlBottomConstraint;
  self->_topAuxViewToPageControlBottomConstraint = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_auxViewContainer, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_pageMarkerLabel, "lastBaselineAnchor"));
  v21 = objc_loadWeakRetained((id *)&self->_signGenerator);
  objc_msgSend(v21, "distanceFromPageControlBaselineToTopOfAuxView");
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20));
  topAuxViewToPageMarkerBaselineConstraint = self->_topAuxViewToPageMarkerBaselineConstraint;
  self->_topAuxViewToPageMarkerBaselineConstraint = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIPageControl heightAnchor](self->_pageControl, "heightAnchor"));
  v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:", 8.0));
  pageControlHeightConstraint = self->_pageControlHeightConstraint;
  self->_pageControlHeightConstraint = v25;

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v68));
  v71[0] = v67;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "trailingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
  v71[1] = v63;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_auxViewContainer, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
  v71[2] = v59;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_auxViewContainer, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
  v71[3] = v55;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIPageControl leadingAnchor](self->_pageControl, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, 16.0));
  v71[4] = v51;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIPageControl trailingAnchor](self->_pageControl, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "trailingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, -16.0));
  v71[5] = v47;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_pageMarkerLabel, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 16.0));
  v71[6] = v43;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_pageMarkerLabel, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, -16.0));
  v71[7] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_collectionView, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
  v32 = self->_pageControlHeightConstraint;
  v71[8] = v31;
  v71[9] = v32;
  v33 = self->_topAuxViewToPageMarkerBaselineConstraint;
  v71[10] = self->_topAuxViewToPageControlBottomConstraint;
  v71[11] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_auxViewContainer, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v36));
  v38 = self->_auxViewHeightConstraint;
  v71[12] = v37;
  v71[13] = v38;
  v71[14] = self->_collectionViewHeightConstraint;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 15));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v39);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SteppingPageViewController;
  -[SteppingPageViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SteppingPageViewController;
  -[SteppingPageViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  if (v4 == self->_widthAsOfLastSignRefresh)
  {

  }
  else
  {
    v5 = -[SteppingPageViewController numberOfSigns](self, "numberOfSigns");

    if (v5 >= 1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
      objc_msgSend(v6, "bounds");
      self->_widthAsOfLastSignRefresh = v7;

      -[SteppingPageViewController refreshSigns](self, "refreshSigns");
    }
  }
}

- (BOOL)_isRTL
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection") == (id)1;

  return v3;
}

- (BOOL)_isPointNearLeftEdge:(CGPoint)a3
{
  unsigned int v5;
  NSInteger v6;

  if (a3.x > 90.0)
    return 0;
  v5 = -[SteppingPageViewController _isRTL](self, "_isRTL");
  v6 = -[UIPageControl currentPage](self->_pageControl, "currentPage");
  if (v5)
    return v6 < -[UIPageControl numberOfPages](self->_pageControl, "numberOfPages") - 1;
  else
    return v6 > 0;
}

- (BOOL)_isPointNearRightEdge:(CGPoint)a3
{
  double x;
  void *v5;
  double v6;
  double v7;
  unsigned int v9;
  NSInteger v10;

  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view", a3.x, a3.y));
  objc_msgSend(v5, "frame");
  v7 = v6;

  if (x < v7 + -90.0)
    return 0;
  v9 = -[SteppingPageViewController _isRTL](self, "_isRTL");
  v10 = -[UIPageControl currentPage](self->_pageControl, "currentPage");
  if (v9)
    return v10 > 0;
  else
    return v10 < -[UIPageControl numberOfPages](self->_pageControl, "numberOfPages") - 1;
}

- (void)_handleTap:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "state") == (id)3 && !self->_lastUserGesture)
  {
    if (!self->_leftBuffer && !self->_rightBuffer)
      -[SteppingPageViewController _getCurrentSignIndexesAdjustedForRTL:from:to:closest:progressBetweenSigns:](self, "_getCurrentSignIndexesAdjustedForRTL:from:to:closest:progressBetweenSigns:", 1, 0, 0, &self->_startSign, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
    objc_msgSend(v12, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    if (-[SteppingPageViewController _isRTL](self, "_isRTL"))
      v9 = -1;
    else
      v9 = 1;
    if (-[SteppingPageViewController _isPointNearLeftEdge:](self, "_isPointNearLeftEdge:", v6, v8))
    {
      ++self->_leftBuffer;
      self->_lastUserGesture = 1;
      v10 = self->_startSign - self->_leftBuffer * v9;
    }
    else
    {
      if (!-[SteppingPageViewController _isPointNearRightEdge:](self, "_isPointNearRightEdge:", v6, v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController delegate](self, "delegate"));
        objc_msgSend(v11, "steppingPageViewController:didTapOnSignAtIndex:", self, -[SteppingPageViewController signIndex](self, "signIndex"));

        goto LABEL_15;
      }
      ++self->_rightBuffer;
      self->_lastUserGesture = 1;
      v10 = self->_startSign + self->_rightBuffer * v9;
    }
    -[SteppingPageViewController setSignIndex:animated:](self, "setSignIndex:animated:", v10, 1);
  }
LABEL_15:

}

- (void)_updateSignHeight
{
  -[SteppingPageViewController _updateSignHeightAnimated:](self, "_updateSignHeightAnimated:", 0);
}

- (void)_updateSignHeightAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v5;
  _QWORD *v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD v9[5];
  _QWORD *v10;
  _QWORD v11[5];
  _QWORD v12[8];
  double v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v14 = 0;
  v15 = 0;
  v13 = 0.0;
  -[SteppingPageViewController _getCurrentSignIndexesAdjustedForRTL:from:to:closest:progressBetweenSigns:](self, "_getCurrentSignIndexesAdjustedForRTL:from:to:closest:progressBetweenSigns:", 1, &v15, &v14, 0, &v13);
  -[SteppingPageViewController _updateAuxViewsFrom:to:progress:](self, "_updateAuxViewsFrom:to:progress:", v15, v14, v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100341E94;
  v12[3] = &unk_1011B2488;
  v12[4] = self;
  v12[5] = v15;
  v12[6] = v14;
  *(double *)&v12[7] = v13;
  v5 = objc_retainBlock(v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100341EC4;
  v11[3] = &unk_1011AC860;
  v11[4] = self;
  v6 = objc_retainBlock(v11);
  v7 = (void (**)(_QWORD))v6;
  if (v3)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100341F04;
    v9[3] = &unk_1011B1EB0;
    v9[4] = self;
    v10 = v6;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v5, v9, 0.5);

  }
  else
  {
    ((void (*)(_QWORD *))v5[2])(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
    objc_msgSend(v8, "setNeedsUpdateConstraints");

    v7[2](v7);
  }

}

- (void)_updateSignHeightConstraintsFrom:(int64_t)a3 to:(int64_t)a4 progress:(double)a5
{
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  id WeakRetained;
  double v15;
  double v16;

  -[SteppingPageViewController _calculatedAuxViewHeightFrom:to:progress:](self, "_calculatedAuxViewHeightFrom:to:progress:");
  -[NSLayoutConstraint setConstant:](self->_auxViewHeightConstraint, "setConstant:");
  -[SteppingPageViewController _calculatedSignToPageControlBaselineHeightFrom:to:progress:](self, "_calculatedSignToPageControlBaselineHeightFrom:to:progress:", a3, a4, a5);
  v10 = v9;
  v11 = -[SteppingPageViewController isPageIndicatorHidden](self, "isPageIndicatorHidden");
  v12 = 8.0;
  v13 = 0.0;
  if (v11)
    v12 = 0.0;
  -[NSLayoutConstraint setConstant:](self->_pageControlHeightConstraint, "setConstant:", v12);
  if (!-[SteppingPageViewController isPageIndicatorHidden](self, "isPageIndicatorHidden"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_signGenerator);
    objc_msgSend(WeakRetained, "distanceFromPageControlBaselineToTopOfAuxView");
    v13 = v15;

  }
  -[NSLayoutConstraint setConstant:](self->_topAuxViewToPageControlBottomConstraint, "setConstant:", v13);
  -[NSLayoutConstraint setConstant:](self->_topAuxViewToPageMarkerBaselineConstraint, "setConstant:", v13);
  -[NSLayoutConstraint constant](self->_auxViewHeightConstraint, "constant");
  -[NSLayoutConstraint setConstant:](self->_signHeightConstraint, "setConstant:", v10 + v13 + v16);
}

- (void)refreshCurrentSign
{
  SteppingSignGenerator **p_signGenerator;
  id WeakRetained;
  char v5;
  id v6;

  p_signGenerator = &self->_signGenerator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_signGenerator);
  v5 = objc_opt_respondsToSelector(WeakRetained, "reloadSignAtIndex:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_signGenerator);
    objc_msgSend(v6, "reloadSignAtIndex:", -[SteppingPageViewController signIndex](self, "signIndex"));

    -[SteppingPageViewController refreshSigns](self, "refreshSigns");
  }
}

- (void)refreshSigns
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[SteppingPageViewController numberOfSigns](self, "numberOfSigns"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_signGenerator);
    objc_msgSend(WeakRetained, "invalidateSizeCaches");

    -[NSMutableDictionary removeAllObjects](self->_auxViewHeightCache, "removeAllObjects");
    -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", -[SteppingPageViewController numberOfSigns](self, "numberOfSigns"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleCaption2));
    -[UILabel setFont:](self->_pageMarkerLabel, "setFont:", v4);

    -[SteppingPageViewController _updatePageMarkerText](self, "_updatePageMarkerText");
    -[SteppingPageViewController heightForSignAtIndex:](self, "heightForSignAtIndex:", -[UIPageControl currentPage](self->_pageControl, "currentPage"));
    -[NSLayoutConstraint setConstant:](self->_collectionViewHeightConstraint, "setConstant:");
    -[SteppingPageViewController _updateSignHeight](self, "_updateSignHeight");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
    objc_msgSend(v5, "layoutIfNeeded");

    -[UICollectionView reloadData](self->_collectionView, "reloadData");
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", self->_currentSign, 0));
    objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v6, 16, 0);

  }
}

- (void)setPageIndicatorHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double widthAsOfLastSignRefresh;
  void *v7;
  double v8;
  double v9;

  if (self->_pageIndicatorHidden != a3)
  {
    v4 = a4;
    self->_pageIndicatorHidden = a3;
    if (-[SteppingPageViewController isViewLoaded](self, "isViewLoaded"))
    {
      widthAsOfLastSignRefresh = self->_widthAsOfLastSignRefresh;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
      objc_msgSend(v7, "bounds");
      v9 = v8;

      if (widthAsOfLastSignRefresh == v9)
        -[SteppingPageViewController _updateSignHeightAnimated:](self, "_updateSignHeightAnimated:", v4);
      else
        -[SteppingPageViewController refreshSigns](self, "refreshSigns");
    }
  }
}

- (void)setPageIndicatorHidden:(BOOL)a3
{
  -[SteppingPageViewController setPageIndicatorHidden:animated:](self, "setPageIndicatorHidden:animated:", a3, 0);
}

- (int64_t)resetCurrentSignAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;

  v3 = a3;
  v5 = -[UIPageControl currentPage](self->_pageControl, "currentPage");
  -[SteppingPageViewController refreshSigns](self, "refreshSigns");
  -[SteppingPageViewController setSignIndex:animated:](self, "setSignIndex:animated:", v5, v3);
  return v5;
}

- (void)sizeClassWillChangeWithTransitionCoordinator:(id)a3
{
  id v4;
  UIView *resizeSnapshot;
  void *v6;
  UIView *v7;
  UIView *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = a3;
  resizeSnapshot = self->_resizeSnapshot;
  if (resizeSnapshot)
    -[UIView removeFromSuperview](resizeSnapshot, "removeFromSuperview");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  v7 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 0));
  v8 = self->_resizeSnapshot;
  self->_resizeSnapshot = v7;

  -[UIView setAutoresizingMask:](self->_resizeSnapshot, "setAutoresizingMask:", 18);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", self->_resizeSnapshot);

  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100342460;
  v11[3] = &unk_1011AEDC8;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100342468;
  v10[3] = &unk_1011AEDC8;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v11, v10);

}

- (void)_animateSizeClassChange
{
  NSInteger v3;
  void *v4;
  void *v5;
  void *v6;

  if (+[UIView _maps_shouldAdoptImplicitAnimationParameters](UIView, "_maps_shouldAdoptImplicitAnimationParameters"))
  {
    -[UIView setAlpha:](self->_resizeSnapshot, "setAlpha:", 0.0);
  }
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v3 = -[UIPageControl currentPage](self->_pageControl, "currentPage");
  -[SteppingPageViewController refreshSigns](self, "refreshSigns");
  if (+[UIView _maps_shouldAdoptImplicitAnimationParameters](UIView, "_maps_shouldAdoptImplicitAnimationParameters"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAAnimation animation](CAAnimation, "animation"));
    objc_msgSend(v5, "addAnimation:forKey:", v6, CFSTR("transition"));

  }
  -[SteppingPageViewController setSignIndex:animated:](self, "setSignIndex:animated:", v3, 0);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)_sizeClassDidChange
{
  UIView *resizeSnapshot;

  -[UIView removeFromSuperview](self->_resizeSnapshot, "removeFromSuperview");
  resizeSnapshot = self->_resizeSnapshot;
  self->_resizeSnapshot = 0;

}

- (double)heightForSignAtIndex:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  id WeakRetained;
  double v9;
  double v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  v7 = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_signGenerator);
  objc_msgSend(WeakRetained, "sizeForSignAtIndex:fittingSize:", a3, v7, 2000.0);
  v10 = v9;

  return v10;
}

- (double)_heightForAuxViewAtIndex:(int64_t)a3
{
  NSMutableDictionary *auxViewHeightCache;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id WeakRetained;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;

  auxViewHeightCache = self->_auxViewHeightCache;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](auxViewHeightCache, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_signGenerator);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "auxViewAtIndex:", a3));

    v9 = 0.0;
    if (v11 && (objc_msgSend(v11, "isHidden") & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
      objc_msgSend(v12, "frame");
      v14 = v13;

      objc_msgSend(v11, "sizeThatFits:", v14, 2000.0);
      v9 = v15;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
    v17 = self->_auxViewHeightCache;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

  }
  return v9;
}

- (int64_t)numberOfSigns
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_signGenerator);
  v3 = objc_msgSend(WeakRetained, "numberOfSigns");

  return (int64_t)v3;
}

- (id)signCellIfVisibleAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", a3, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForItemAtIndexPath:", v4));

  return v6;
}

- (id)auxViewIfVisibleAtIndex:(int64_t)a3
{
  UIView **p_fromAuxView;
  UIView *fromAuxView;
  SteppingSignGenerator **p_signGenerator;
  id WeakRetained;
  UIView *v9;
  UIView *toAuxView;
  id v11;
  UIView *v12;
  UIView *v13;

  p_fromAuxView = &self->_fromAuxView;
  fromAuxView = self->_fromAuxView;
  p_signGenerator = &self->_signGenerator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_signGenerator);
  v9 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "auxViewAtIndex:", a3));

  if (fromAuxView == v9
    || (p_fromAuxView = &self->_toAuxView,
        toAuxView = self->_toAuxView,
        v11 = objc_loadWeakRetained((id *)p_signGenerator),
        v12 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "auxViewAtIndex:", a3)),
        v12,
        v11,
        toAuxView == v12))
  {
    v13 = *p_fromAuxView;
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (int64_t)signIndex
{
  int64_t v3;

  v3 = 0;
  -[SteppingPageViewController _getCurrentSignIndexesAdjustedForRTL:from:to:closest:progressBetweenSigns:](self, "_getCurrentSignIndexesAdjustedForRTL:from:to:closest:progressBetweenSigns:", 1, &v3, 0, 0, 0);
  return v3;
}

- (void)setSignIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v6;
  int64_t v7;
  void *v8;
  NSTimer *v9;
  NSTimer *scrollTimer;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSInteger v17;

  v4 = a4;
  v6 = -[SteppingPageViewController _adjustedSignIndex:adjustForRTL:](self, "_adjustedSignIndex:adjustForRTL:", a3, 0);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    self->_currentSign = v6;
    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
      objc_msgSend(v8, "setScrollEnabled:", 0);

      -[NSTimer invalidate](self->_scrollTimer, "invalidate");
      v9 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_forcedScrollDidEnd", 0, 0, 0.300000012));
      scrollTimer = self->_scrollTimer;
      self->_scrollTimer = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
      objc_msgSend(v11, "layoutIfNeeded");

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v7, 0));
      objc_msgSend(v12, "scrollToItemAtIndexPath:atScrollPosition:animated:", v13, 16, v4);

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
      objc_msgSend(v14, "layoutIfNeeded");

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v7, 0));
      objc_msgSend(v15, "scrollToItemAtIndexPath:atScrollPosition:animated:", v16, 16, 0);

      v17 = -[UIPageControl currentPage](self->_pageControl, "currentPage");
      -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController delegate](self, "delegate"));
      objc_msgSend(v12, "steppingPageViewController:didChangeCurrentSign:previousSign:fromUserGesture:", self, v7, v17, 0);
    }

    -[SteppingPageViewController _updatePageMarkerText](self, "_updatePageMarkerText");
  }
}

- (void)setSignIndex:(int64_t)a3
{
  -[SteppingPageViewController setSignIndex:animated:](self, "setSignIndex:animated:", a3, 1);
}

- (void)reloadWithSignGenerator:(id)a3
{
  objc_storeWeak((id *)&self->_signGenerator, a3);
  -[SteppingPageViewController refreshSigns](self, "refreshSigns");
  -[SteppingPageViewController setSignIndex:animated:](self, "setSignIndex:animated:", 0, 0);
}

- (void)_updateCurrentPageAndNotifyDelegate
{
  NSInteger v3;
  int64_t v4;
  void *v5;
  id v6;

  v3 = -[UIPageControl currentPage](self->_pageControl, "currentPage");
  v4 = -[SteppingPageViewController signIndex](self, "signIndex");
  self->_currentSign = v4;
  -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", v4);
  -[SteppingPageViewController _updatePageMarkerText](self, "_updatePageMarkerText");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController delegate](self, "delegate"));
  objc_msgSend(v5, "steppingPageViewController:didChangeCurrentSign:previousSign:fromUserGesture:", self, v4, v3, self->_lastUserGesture);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("MapsTestingSteppingSignDidChange"), self);

}

- (void)_forcedScrollDidEnd
{
  id v2;

  self->_leftBuffer = 0;
  self->_rightBuffer = 0;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
  objc_msgSend(v2, "setScrollEnabled:", 1);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  -[SteppingPageViewController _updateCurrentPageAndNotifyDelegate](self, "_updateCurrentPageAndNotifyDelegate", a3);
  self->_lastUserGesture = 0;
  -[SteppingPageViewController _updateSignHeight](self, "_updateSignHeight");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[SteppingPageViewController _updateCurrentPageAndNotifyDelegate](self, "_updateCurrentPageAndNotifyDelegate", a3);
  self->_lastUserGesture = 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView", a3));
  v5 = objc_msgSend(v4, "isScrollAnimating");

  if ((v5 & 1) == 0)
    -[SteppingPageViewController _updateCurrentPageAndNotifyDelegate](self, "_updateCurrentPageAndNotifyDelegate");
  -[SteppingPageViewController _updateSignHeight](self, "_updateSignHeight");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  self->_lastUserGesture = 2;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "steppingPageViewControllerUserDidStartScrolling:", self);

}

- (double)_calculatedSignToPageControlBaselineHeightFrom:(int64_t)a3 to:(int64_t)a4 progress:(double)a5
{
  void *v9;
  double v10;
  double v11;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  unsigned __int8 v20;
  double v21;
  double v22;
  double v23;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self, "view"));
  objc_msgSend(v9, "frame");
  v11 = v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_signGenerator);
  objc_msgSend(WeakRetained, "sizeForSignAtIndex:fittingSize:", a3, v11, 2000.0);
  v14 = v13;

  v15 = v14;
  if (a4 != a3)
  {
    v16 = objc_loadWeakRetained((id *)&self->_signGenerator);
    objc_msgSend(v16, "sizeForSignAtIndex:fittingSize:", a4, v11, 2000.0);
    v15 = v17;

  }
  if (v14 <= v15)
    v18 = v15;
  else
    v18 = v14;
  -[NSLayoutConstraint constant](self->_collectionViewHeightConstraint, "constant");
  if (v18 > v19)
    -[NSLayoutConstraint setConstant:](self->_collectionViewHeightConstraint, "setConstant:", v18);
  v20 = -[SteppingPageViewController isPageIndicatorHidden](self, "isPageIndicatorHidden");
  v21 = 0.0;
  v22 = 0.0;
  if ((v20 & 1) == 0)
  {
    -[SteppingPageViewController _signToPageControlBottomMarginAtIndex:fittingSize:](self, "_signToPageControlBottomMarginAtIndex:fittingSize:", a3, v11, 2000.0);
    v21 = v23;
    -[SteppingPageViewController _signToPageControlBottomMarginAtIndex:fittingSize:](self, "_signToPageControlBottomMarginAtIndex:fittingSize:", a4, v11, 2000.0);
  }
  return v14 + (v15 - v14) * a5 + v21 + (v22 - v21) * a5;
}

- (double)_signToPageControlBottomMarginAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double height;
  double width;
  id WeakRetained;
  double v9;
  double v10;
  void *v11;
  double v12;

  height = a4.height;
  width = a4.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_signGenerator);
  objc_msgSend(WeakRetained, "distanceFromPageControlBaselineToBottomOfSignAtIndex:fittingSize:", a3, width, height);
  v10 = v9;

  if ((-[UILabel isHidden](self->_pageMarkerLabel, "isHidden") & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_pageMarkerLabel, "font"));
    objc_msgSend(v11, "_scaledValueForValue:", v10);
    v10 = v12;

  }
  return v10;
}

- (void)_initAuxView:(id)a3 forIndex:(int64_t)a4
{
  id v5;
  NSDictionary *v6;
  UIView *auxViewContainer;
  void *v8;
  UIView *v9;
  void *v10;
  id v11;

  if (a3)
  {
    v5 = a3;
    v6 = _NSDictionaryOfVariableBindings(CFSTR("auxView"), v5, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_auxViewContainer, "addSubview:", v5);

    auxViewContainer = self->_auxViewContainer;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[auxView]|"), 0, 0, v11));
    -[UIView addConstraints:](auxViewContainer, "addConstraints:", v8);

    v9 = self->_auxViewContainer;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[auxView]|"), 0, 0, v11));
    -[UIView addConstraints:](v9, "addConstraints:", v10);

  }
}

- (void)_updateAuxViewsFrom:(int64_t)a3 to:(int64_t)a4 progress:(double)a5
{
  UIView *fromAuxView;
  SteppingSignGenerator **p_signGenerator;
  id WeakRetained;
  UIView *v12;
  id v13;
  UIView *v14;
  id v15;
  UIView *v16;
  UIView *v17;
  id v18;
  UIView *v19;
  UIView *v20;
  UIView *v21;
  UIView *toAuxView;

  fromAuxView = self->_fromAuxView;
  p_signGenerator = &self->_signGenerator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_signGenerator);
  v12 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "auxViewAtIndex:", a3));
  if (fromAuxView == v12)
  {
    toAuxView = self->_toAuxView;
    v13 = objc_loadWeakRetained((id *)p_signGenerator);
    v14 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "auxViewAtIndex:", a4));

    if (toAuxView == v14)
      goto LABEL_6;
  }
  else
  {

  }
  -[UIView removeFromSuperview](self->_fromAuxView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_toAuxView, "removeFromSuperview");
  v15 = objc_loadWeakRetained((id *)p_signGenerator);
  v16 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "auxViewAtIndex:", a3));
  v17 = self->_fromAuxView;
  self->_fromAuxView = v16;

  -[SteppingPageViewController _initAuxView:forIndex:](self, "_initAuxView:forIndex:", self->_fromAuxView, a3);
  v18 = objc_loadWeakRetained((id *)p_signGenerator);
  v19 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "auxViewAtIndex:", a4));
  v20 = self->_toAuxView;
  self->_toAuxView = v19;

  v21 = self->_toAuxView;
  if (v21 != self->_fromAuxView)
    -[SteppingPageViewController _initAuxView:forIndex:](self, "_initAuxView:forIndex:", v21, a4);
LABEL_6:
  -[UIView setAlpha:](self->_fromAuxView, "setAlpha:", 1.0 - a5);
  -[UIView setAlpha:](self->_toAuxView, "setAlpha:", a5);
}

- (double)_calculatedAuxViewHeightFrom:(int64_t)a3 to:(int64_t)a4 progress:(double)a5
{
  double result;
  double v10;
  double v11;

  -[SteppingPageViewController _heightForAuxViewAtIndex:](self, "_heightForAuxViewAtIndex:");
  v10 = result;
  if (a3 != a4)
  {
    -[SteppingPageViewController _heightForAuxViewAtIndex:](self, "_heightForAuxViewAtIndex:", a4);
    return v10 + (v11 - v10) * a5;
  }
  return result;
}

- (double)_collectionViewContentOffsetIndex
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "contentOffset");
  v4 = 0.0;
  if (v5 < 0.0)
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "frame");
  v8 = v7;

  if (v8 > 0.0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
    objc_msgSend(v3, "contentOffset");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
    objc_msgSend(v11, "frame");
    v4 = v10 / v12;

LABEL_4:
  }
  return v4;
}

- (int64_t)_adjustedSignIndex:(int64_t)a3 adjustForRTL:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v7;
  int64_t v8;
  int64_t v9;

  v4 = a4;
  v7 = -[SteppingPageViewController numberOfSigns](self, "numberOfSigns");
  if (!v7)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = v7;
  if ((a3 & ~(a3 >> 63)) >= v7)
    v9 = v7 - 1;
  else
    v9 = a3 & ~(a3 >> 63);
  if (v4 && -[SteppingPageViewController _isRTL](self, "_isRTL"))
    return v8 + ~v9;
  return v9;
}

- (void)_getCurrentSignIndexesAdjustedForRTL:(BOOL)a3 from:(int64_t *)a4 to:(int64_t *)a5 closest:(int64_t *)a6 progressBetweenSigns:(double *)a7
{
  _BOOL8 v11;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  double v18;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;

  v11 = a3;
  -[SteppingPageViewController _collectionViewContentOffsetIndex](self, "_collectionViewContentOffsetIndex");
  v14 = v13;
  if (a6)
    *a6 = -[SteppingPageViewController _adjustedSignIndex:adjustForRTL:](self, "_adjustedSignIndex:adjustForRTL:", llround(v13), v11);
  v15 = vcvtmd_s64_f64(v14);
  if (a4)
    *a4 = -[SteppingPageViewController _adjustedSignIndex:adjustForRTL:](self, "_adjustedSignIndex:adjustForRTL:", v15, v11);
  v16 = vcvtpd_s64_f64(v14);
  if (a5)
    *a5 = -[SteppingPageViewController _adjustedSignIndex:adjustForRTL:](self, "_adjustedSignIndex:adjustForRTL:", v16, v11);
  if (a7)
  {
    v17 = -[SteppingPageViewController numberOfSigns](self, "numberOfSigns");
    v18 = 1.0;
    if (v17 > v15 && v17 > v16 && v15 != v16)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView", 1.0));
      objc_msgSend(v21, "frame");
      v23 = v22 * (double)v15;

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
      objc_msgSend(v24, "frame");
      v26 = v25 * (double)v16;

      v27 = v26 - v23;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
      objc_msgSend(v28, "contentOffset");
      v30 = v29 - v23;

      v18 = v30 / v27;
    }
    *a7 = v18;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signGenerator](self, "signGenerator"));
  v7 = objc_msgSend(v5, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signAtIndex:", v7));
  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signGenerator](self, "signGenerator", a3, a4));
  v5 = objc_msgSend(v4, "numberOfSigns");

  return (int64_t)v5;
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v7, v6));

  return v9;
}

- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v9, v8));

  return v12;
}

- (void)registerClass:(Class)a3 forCellWithReuseIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", a3, v6);

}

- (void)registerClass:(Class)a3 forSupplementaryViewOfKind:(id)a4 withReuseIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", a3, v9, v8);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[SteppingPageViewController sizeClassWillChangeWithTransitionCoordinator:](self, "sizeClassWillChangeWithTransitionCoordinator:", v7);
  v8.receiver = self;
  v8.super_class = (Class)SteppingPageViewController;
  -[SteppingPageViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (SteppingSignGenerator)signGenerator
{
  return (SteppingSignGenerator *)objc_loadWeakRetained((id *)&self->_signGenerator);
}

- (SteppingPageViewControllerDelegate)delegate
{
  return (SteppingPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UIView)auxViewContainer
{
  return self->_auxViewContainer;
}

- (void)setAuxViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_auxViewContainer, a3);
}

- (NSLayoutConstraint)signHeightConstraint
{
  return self->_signHeightConstraint;
}

- (void)setSignHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_signHeightConstraint, a3);
}

- (BOOL)isPageIndicatorHidden
{
  return self->_pageIndicatorHidden;
}

- (UITapGestureRecognizer)singleTapGestureRecognizer
{
  return self->_singleTapGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_signHeightConstraint, 0);
  objc_storeStrong((id *)&self->_auxViewContainer, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_signGenerator);
  objc_storeStrong((id *)&self->_scrollTimer, 0);
  objc_storeStrong((id *)&self->_resizeSnapshot, 0);
  objc_storeStrong((id *)&self->_toAuxView, 0);
  objc_storeStrong((id *)&self->_fromAuxView, 0);
  objc_storeStrong((id *)&self->_auxViewHeightCache, 0);
  objc_storeStrong((id *)&self->_topAuxViewToPageMarkerBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topAuxViewToPageControlBottomConstraint, 0);
  objc_storeStrong((id *)&self->_pageControlHeightConstraint, 0);
  objc_storeStrong((id *)&self->_auxViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_pageMarkerLabel, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
}

@end
