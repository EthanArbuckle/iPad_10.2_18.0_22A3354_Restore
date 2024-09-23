@implementation CHTrophyCaseViewController

- (CHTrophyCaseViewController)initWithBadgeImageFactory:(id)a3 formattingManager:(id)a4 localizationProvider:(id)a5 initialAchievement:(id)a6 shouldShowCelebration:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CHTrophyCaseViewController *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id obj;
  BOOL v26;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v27.receiver = self;
  v27.super_class = (Class)CHTrophyCaseViewController;
  v17 = -[CHTrophyCaseViewController initWithNibName:bundle:](&v27, "initWithNibName:bundle:", 0, 0);
  if (v17)
  {
    v26 = a7;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    obj = a6;
    v19 = v16;
    v20 = v15;
    v21 = v14;
    v22 = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("AWARDS"), &stru_1007AE1D0, CFSTR("Localizable")));
    -[CHTrophyCaseViewController setTitle:](v17, "setTitle:", v23);

    v13 = v22;
    v14 = v21;
    v15 = v20;
    v16 = v19;

    objc_storeStrong((id *)&v17->_badgeImageFactory, a3);
    objc_storeStrong((id *)&v17->_formattingManager, a4);
    objc_storeStrong((id *)&v17->_localizationProvider, a5);
    objc_storeStrong((id *)&v17->_initialAchievement, obj);
    v17->_shouldShowCelebration = v26;
  }

  return v17;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  double y;
  double width;
  double height;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CHAchievementsRecentAndRelevantDataSource *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CHAchievementsRecentAndRelevantDataSource *v29;
  CHAchievementsDataSource *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CHAchievementsDataSource *v37;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
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
  void *v71;
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
  id v84;
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
  _QWORD *v104;
  CHRecentAndRelevantAchievementsCollectionViewFlowLayout *v105;
  id v106;
  id v107;
  _QWORD v108[4];
  id v109;
  id location;
  objc_super v111;
  _QWORD v112[4];
  _QWORD v113[4];

  v111.receiver = self;
  v111.super_class = (Class)CHTrophyCaseViewController;
  -[CHTrophyCaseViewController viewDidLoad](&v111, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v107 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "_rowAlignmentOptions"));
  v106 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v106, "setObject:forKeyedSubscript:", &off_1007B3DB8, UIFlowLayoutRowVerticalAlignmentKey);
  v6 = objc_msgSend(v106, "copy");
  objc_msgSend(v107, "_setRowAlignmentsOptions:", v6);

  v7 = objc_alloc((Class)UICollectionView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v107, CGRectZero.origin.x, y, width, height);
  -[CHTrophyCaseViewController setMainCollectionView:](self, "setMainCollectionView:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController mainCollectionView](self, "mainCollectionView"));
  objc_msgSend(v13, "setBackgroundColor:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController mainCollectionView](self, "mainCollectionView"));
  objc_msgSend(v14, "setPrefetchingEnabled:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController mainCollectionView](self, "mainCollectionView"));
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController mainCollectionView](self, "mainCollectionView"));
  objc_msgSend(v16, "addSubview:", v17);

  v105 = objc_alloc_init(CHRecentAndRelevantAchievementsCollectionViewFlowLayout);
  v18 = objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v105, CGRectZero.origin.x, y, width, height);
  -[CHTrophyCaseViewController setRecentAndRelevantCollectionView:](self, "setRecentAndRelevantCollectionView:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController recentAndRelevantCollectionView](self, "recentAndRelevantCollectionView"));
  objc_msgSend(v20, "setBackgroundColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController recentAndRelevantCollectionView](self, "recentAndRelevantCollectionView"));
  objc_msgSend(v21, "setPrefetchingEnabled:", 1);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController recentAndRelevantCollectionView](self, "recentAndRelevantCollectionView"));
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController recentAndRelevantCollectionView](self, "recentAndRelevantCollectionView"));
  objc_msgSend(v23, "setShowsHorizontalScrollIndicator:", 0);

  -[CHRecentAndRelevantAchievementsCollectionViewFlowLayout setSectionHeadersPinToVisibleBounds:](v105, "setSectionHeadersPinToVisibleBounds:", 1);
  v24 = [CHAchievementsRecentAndRelevantDataSource alloc];
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController dataProvider](self, "dataProvider"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController recentAndRelevantCollectionView](self, "recentAndRelevantCollectionView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController localizationProvider](self, "localizationProvider"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController badgeImageFactory](self, "badgeImageFactory"));
  v29 = -[CHAchievementsRecentAndRelevantDataSource initWithDataProvider:collectionView:localizationProvider:badgeImageFactory:](v24, "initWithDataProvider:collectionView:localizationProvider:badgeImageFactory:", v25, v26, v27, v28);
  -[CHTrophyCaseViewController setRecentAndRelevantDataSource:](self, "setRecentAndRelevantDataSource:", v29);

  v30 = [CHAchievementsDataSource alloc];
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController dataProvider](self, "dataProvider"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController mainCollectionView](self, "mainCollectionView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController recentAndRelevantCollectionView](self, "recentAndRelevantCollectionView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController recentAndRelevantDataSource](self, "recentAndRelevantDataSource"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController localizationProvider](self, "localizationProvider"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController badgeImageFactory](self, "badgeImageFactory"));
  v37 = -[CHAchievementsDataSource initWithDataProvider:collectionView:recentAndRelevantCollectionView:recentAndRelevantDataSource:localizationProvider:badgeImageFactory:](v30, "initWithDataProvider:collectionView:recentAndRelevantCollectionView:recentAndRelevantDataSource:localizationProvider:badgeImageFactory:", v31, v32, v33, v34, v35, v36);
  -[CHTrophyCaseViewController setMainSectionDataSource:](self, "setMainSectionDataSource:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController mainCollectionView](self, "mainCollectionView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "topAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v41));

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController mainCollectionView](self, "mainCollectionView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v45));

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController mainCollectionView](self, "mainCollectionView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leadingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v49));

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController mainCollectionView](self, "mainCollectionView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController view](self, "view"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "trailingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v53));

  v113[0] = v103;
  v113[1] = v102;
  v113[2] = v101;
  v113[3] = v100;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v113, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v54);

  objc_initWeak(&location, self);
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_1000B73DC;
  v108[3] = &unk_10077A0A0;
  objc_copyWeak(&v109, &location);
  v104 = objc_retainBlock(v108);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController mainSectionDataSource](self, "mainSectionDataSource"));
  objc_msgSend(v55, "setAchievementTappedHandler:", v104);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController recentAndRelevantDataSource](self, "recentAndRelevantDataSource"));
  objc_msgSend(v56, "setAchievementTappedHandler:", v104);

  v57 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CHTrophyCaseViewController setLoadingView:](self, "setLoadingView:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController loadingView](self, "loadingView"));
  objc_msgSend(v58, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController loadingView](self, "loadingView"));
  objc_msgSend(v60, "setBackgroundColor:", v59);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController view](self, "view"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController loadingView](self, "loadingView"));
  objc_msgSend(v61, "addSubview:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController loadingView](self, "loadingView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "centerXAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController view](self, "view"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "centerXAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v66));

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController loadingView](self, "loadingView"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "centerYAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController view](self, "view"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "centerYAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v71));

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController loadingView](self, "loadingView"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "widthAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController view](self, "view"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "widthAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v76));

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController loadingView](self, "loadingView"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "heightAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController view](self, "view"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "heightAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v81));

  v112[0] = v67;
  v112[1] = v72;
  v112[2] = v77;
  v112[3] = v82;
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v112, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v83);

  v84 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  -[CHTrophyCaseViewController setSpinner:](self, "setSpinner:", v84);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController spinner](self, "spinner"));
  objc_msgSend(v85, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController loadingView](self, "loadingView"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController spinner](self, "spinner"));
  objc_msgSend(v86, "addSubview:", v87);

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController spinner](self, "spinner"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "centerXAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController loadingView](self, "loadingView"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "centerXAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v91));
  objc_msgSend(v92, "setActive:", 1);

  v93 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController spinner](self, "spinner"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "centerYAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController loadingView](self, "loadingView"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "centerYAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v96));
  objc_msgSend(v97, "setActive:", 1);

  v98 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController spinner](self, "spinner"));
  objc_msgSend(v98, "startAnimating");

  v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v99, "addObserver:selector:name:object:", self, "unitPreferencesDidChange:", kFIUIFitnessUnitPreferencesDidChangeNotification, 0);

  objc_destroyWeak(&v109);
  objc_destroyWeak(&location);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHTrophyCaseViewController;
  -[CHTrophyCaseViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  if (!self->_observerSetupComplete)
  {
    self->_observerSetupComplete = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController dataProvider](self, "dataProvider"));
    objc_msgSend(v4, "addInitialLoadObserver:", self);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController navigationController](self, "navigationController"));
  v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___CHActivityHistoryPaletteNavigationController);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController navigationController](self, "navigationController"));
    objc_msgSend(v7, "detachPalette");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHTrophyCaseViewController;
  -[CHTrophyCaseViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController navigationController](self, "navigationController"));
  objc_msgSend(v4, "setDelegate:", self);

  -[CHTrophyCaseViewController setTransitionAnimator:](self, "setTransitionAnimator:", 0);
  -[CHTrophyCaseViewController _presentInitialAchievementIfNeeded](self, "_presentInitialAchievementIfNeeded");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController dataProvider](self, "dataProvider"));
  objc_msgSend(v3, "removeInitialLoadObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CHTrophyCaseViewController;
  -[CHTrophyCaseViewController dealloc](&v4, "dealloc");
}

- (void)unitPreferencesDidChange:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController recentAndRelevantCollectionView](self, "recentAndRelevantCollectionView", a3));
  objc_msgSend(v4, "reloadData");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController mainCollectionView](self, "mainCollectionView"));
  objc_msgSend(v5, "reloadData");

}

- (void)presentDetailForAchievement:(id)a3 badgeRect:(CGRect)a4 conversionView:(id)a5 cell:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSString *v19;
  void *v20;
  CHAchievementDetailViewController *v21;
  void *v22;
  CHAchievementDetailViewController *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  CGRect v37;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v17 = ACHLogDefault(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v19 = NSStringFromCGRect(v37);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    *(_DWORD *)buf = 138543874;
    v32 = v13;
    v33 = 2114;
    v34 = v20;
    v35 = 2114;
    v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Presenting detail for achievement %{public}@ badgeRect %{public}@ conversionView %{public}@", buf, 0x20u);

  }
  v21 = [CHAchievementDetailViewController alloc];
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController localizationProvider](self, "localizationProvider"));
  v23 = -[CHAchievementDetailViewController initWithAchievement:locProvider:formatsForFriend:forDayView:forModalPresentation:shouldShowCelebration:](v21, "initWithAchievement:locProvider:formatsForFriend:forDayView:forModalPresentation:shouldShowCelebration:", v13, v22, 0, 0, 0, 0);

  v24 = objc_msgSend(v13, "unearned") ^ 1;
  v25 = objc_alloc((Class)AAUIAchievementDetailTransitionAnimator);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000B78B4;
  v29[3] = &unk_100778DB0;
  v30 = v15;
  v26 = v15;
  v27 = objc_msgSend(v25, "initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:presentAlongsideBlock:dismissAlongsideBlock:completionBlock:", self, v23, v24, v14, &stru_10077A0E0, &stru_10077A100, x, y, width, height, v29);
  -[CHTrophyCaseViewController setTransitionAnimator:](self, "setTransitionAnimator:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController navigationController](self, "navigationController"));
  objc_msgSend(v28, "pushViewController:animated:", v23, 1);

}

- (void)detachPalette
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController navigationController](self, "navigationController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___CHActivityHistoryPaletteNavigationController);

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController navigationController](self, "navigationController"));
    objc_msgSend(v5, "detachPalette");

  }
}

- (void)_presentInitialAchievementIfNeeded
{
  CHAchievementDetailViewController *v3;
  ACHAchievement *initialAchievement;
  void *v5;
  CHAchievementDetailViewController *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  if (self->_initialAchievement && !self->_initialAchievementPresented)
  {
    self->_initialAchievementPresented = 1;
    v3 = [CHAchievementDetailViewController alloc];
    initialAchievement = self->_initialAchievement;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController localizationProvider](self, "localizationProvider"));
    v6 = -[CHAchievementDetailViewController initWithAchievement:locProvider:formatsForFriend:forDayView:forModalPresentation:shouldShowCelebration:](v3, "initWithAchievement:locProvider:formatsForFriend:forDayView:forModalPresentation:shouldShowCelebration:", initialAchievement, v5, 0, 0, 1, self->_shouldShowCelebration);

    v9 = ACHLogDefault(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pushing achievement detail sheet for initial achievement", v13, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController navigationController](self, "navigationController"));
    objc_msgSend(v11, "pushViewController:animated:", v6, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController delegate](self, "delegate"));
    objc_msgSend(v12, "trophyCaseDidBeginCelebration:", self);

  }
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4 == 2)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController transitionAnimatorFromViewController](self, "transitionAnimatorFromViewController"));
    if (v14 == v12)
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController transitionAnimator](self, "transitionAnimator"));
    else
      v13 = 0;

  }
  else if (a4 == 1)
  {
    -[CHTrophyCaseViewController setTransitionAnimatorFromViewController:](self, "setTransitionAnimatorFromViewController:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController transitionAnimator](self, "transitionAnimator"));
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController navigationController](self, "navigationController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
  v6 = objc_opt_class(CHAchievementDetailViewController, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  return (isKindOfClass & 1) == 0;
}

- (void)achievementsDataProviderDidFinishInitialLoad:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B7BF0;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setWheelchairUseCache:(id)a3
{
  _HKWheelchairUseCharacteristicCache **p_wheelchairUseCache;
  id v6;

  p_wheelchairUseCache = &self->_wheelchairUseCache;
  objc_storeStrong((id *)&self->_wheelchairUseCache, a3);
  v6 = a3;
  -[_HKWheelchairUseCharacteristicCache addObserver:](*p_wheelchairUseCache, "addObserver:", self);

}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CHTrophyCaseViewController localizationProvider](self, "localizationProvider", a3));
  objc_msgSend(v5, "setWheelchairUser:", v4);

}

- (CHTrophyCaseViewControllerDelegate)delegate
{
  return (CHTrophyCaseViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AAUIAchievementsDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCache
{
  return self->_wheelchairUseCache;
}

- (UICollectionView)mainCollectionView
{
  return self->_mainCollectionView;
}

- (void)setMainCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_mainCollectionView, a3);
}

- (UICollectionView)recentAndRelevantCollectionView
{
  return self->_recentAndRelevantCollectionView;
}

- (void)setRecentAndRelevantCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_recentAndRelevantCollectionView, a3);
}

- (CHAchievementsDataSource)mainSectionDataSource
{
  return self->_mainSectionDataSource;
}

- (void)setMainSectionDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_mainSectionDataSource, a3);
}

- (CHAchievementsRecentAndRelevantDataSource)recentAndRelevantDataSource
{
  return self->_recentAndRelevantDataSource;
}

- (void)setRecentAndRelevantDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_recentAndRelevantDataSource, a3);
}

- (AAUIAchievementDetailTransitionAnimator)transitionAnimator
{
  return self->_transitionAnimator;
}

- (void)setTransitionAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_transitionAnimator, a3);
}

- (UIViewController)transitionAnimatorFromViewController
{
  return self->_transitionAnimatorFromViewController;
}

- (void)setTransitionAnimatorFromViewController:(id)a3
{
  objc_storeStrong((id *)&self->_transitionAnimatorFromViewController, a3);
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (AAUIBadgeImageFactory)badgeImageFactory
{
  return self->_badgeImageFactory;
}

- (void)setBadgeImageFactory:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImageFactory, a3);
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
  objc_storeStrong((id *)&self->_formattingManager, a3);
}

- (ACHAchievementLocalizationProvider)localizationProvider
{
  return self->_localizationProvider;
}

- (void)setLocalizationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_localizationProvider, a3);
}

- (ACHAchievement)initialAchievement
{
  return self->_initialAchievement;
}

- (void)setInitialAchievement:(id)a3
{
  objc_storeStrong((id *)&self->_initialAchievement, a3);
}

- (UIView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (BOOL)observerSetupComplete
{
  return self->_observerSetupComplete;
}

- (void)setObserverSetupComplete:(BOOL)a3
{
  self->_observerSetupComplete = a3;
}

- (BOOL)initialAchievementPresented
{
  return self->_initialAchievementPresented;
}

- (void)setInitialAchievementPresented:(BOOL)a3
{
  self->_initialAchievementPresented = a3;
}

- (BOOL)shouldShowCelebration
{
  return self->_shouldShowCelebration;
}

- (void)setShouldShowCelebration:(BOOL)a3
{
  self->_shouldShowCelebration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_initialAchievement, 0);
  objc_storeStrong((id *)&self->_localizationProvider, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_transitionAnimatorFromViewController, 0);
  objc_storeStrong((id *)&self->_transitionAnimator, 0);
  objc_storeStrong((id *)&self->_recentAndRelevantDataSource, 0);
  objc_storeStrong((id *)&self->_mainSectionDataSource, 0);
  objc_storeStrong((id *)&self->_recentAndRelevantCollectionView, 0);
  objc_storeStrong((id *)&self->_mainCollectionView, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCache, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
