@implementation MTAStopwatchViewController

- (MTStopwatchManager)stopwatchManager
{
  return self->_stopwatchManager;
}

- (void)setStopwatchManager:(id)a3
{
  objc_storeStrong((id *)&self->_stopwatchManager, a3);
}

- (void)setMigrator:(id)a3
{
  objc_storeStrong((id *)&self->_migrator, a3);
}

- (void)setLapTableController:(id)a3
{
  objc_storeStrong((id *)&self->_lapTableController, a3);
}

- (MTAStopwatchLapTableViewController)lapTableController
{
  return self->_lapTableController;
}

- (MTAStopwatchViewController)init
{
  uint64_t v2;
  MTAStopwatchViewController *v3;
  uint64_t v4;
  NSObject *v5;
  NSMutableArray *v6;
  NSMutableArray *laps;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MTAStopwatchLapTableViewController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSUserActivity *userActivity;
  MTStopwatchManager *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  MTAStopwatchViewController *v22;
  objc_super v24;
  uint8_t buf[4];
  MTAStopwatchViewController *v26;

  v24.receiver = self;
  v24.super_class = (Class)MTAStopwatchViewController;
  v3 = -[MTAStopwatchViewController init](&v24, "init");
  if (v3)
  {
    v4 = MTLogForCategory(5, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@ initialized", buf, 0xCu);
    }

    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    laps = v3->_laps;
    v3->_laps = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("stopwatch.fill")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController tabBarItem](v3, "tabBarItem"));
    objc_msgSend(v9, "setImage:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("STOP_WATCH"), &stru_10009A4D0, 0));
    -[MTAStopwatchViewController setTitle:](v3, "setTitle:", v11);

    -[MTAStopwatchViewController setEdgesForExtendedLayout:](v3, "setEdgesForExtendedLayout:", 5);
    v12 = -[MTAStopwatchLapTableViewController initWithStyle:]([MTAStopwatchLapTableViewController alloc], "initWithStyle:", 0);
    -[MTAStopwatchViewController setLapTableController:](v3, "setLapTableController:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](v3, "lapTableController"));
    -[MTAStopwatchViewController addChildViewController:](v3, "addChildViewController:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController title](v3, "title"));
    v15 = objc_claimAutoreleasedReturnValue(+[NSUserActivity mtUserActivityWithActivityType:title:](NSUserActivity, "mtUserActivityWithActivityType:title:", CFSTR("com.apple.clock.stopwatch"), v14));
    userActivity = v3->_userActivity;
    v3->_userActivity = (NSUserActivity *)v15;

    v17 = objc_opt_new(MTStopwatchManager);
    -[MTAStopwatchViewController setStopwatchManager:](v3, "setStopwatchManager:", v17);

    v18 = objc_alloc((Class)MTLegacyStopwatchMigrator);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopwatchManager](v3, "stopwatchManager"));
    v21 = objc_msgSend(v18, "initWithDefaults:manager:", v19, v20);
    -[MTAStopwatchViewController setMigrator:](v3, "setMigrator:", v21);

    v22 = v3;
  }

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[NSTimer invalidate](self->_restoreIdleTimerTimer, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)MTAStopwatchViewController;
  -[MTAStopwatchViewController dealloc](&v4, "dealloc");
}

- (void)handleLocaleChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
  objc_msgSend(v3, "handleLocaleChange");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
  objc_msgSend(v4, "handleLocaleChange");

  -[objc_class handleLocaleChange](-[MTAStopwatchViewController tableCellClass](self, "tableCellClass"), "handleLocaleChange");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tableView"));
  objc_msgSend(v5, "reloadData");

}

- (Class)tableCellClass
{
  return (Class)objc_opt_class(MTAStopwatchLapCell, a2);
}

- (void)setMode:(unint64_t)a3
{
  void *v5;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopwatchController](self, "stopwatchController"));
    objc_msgSend(v5, "setMode:", a3);

    -[MTAStopwatchViewController updateShortcutItemForCurrentState](self, "updateShortcutItemForCurrentState");
  }
}

- (void)updateTimeViewFont
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  if (MTUIShouldUseLargePadLayout(v5))
  {
    v6 = &qword_10007AB98;
  }
  else
  {
    v6 = (uint64_t *)&unk_10007AB90;
    if (v4 != (id)2)
      v6 = &qword_10007AB88;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", *(double *)v6, UIFontWeightThin));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mtui_fontByAddingTimeFontAttributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
  objc_msgSend(v8, "setFont:", v7);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableView"));
  objc_msgSend(v3, "reloadData");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  double v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  BOOL v16;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v7 = a3.width / a3.height;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
  v10 = v9;
  if (v7 <= 0.9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
    v13 = v12;
    v14 = 1;
  }
  else
  {
    objc_msgSend(v9, "setCurrentPage:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pageControl](self, "pageControl"));
    objc_msgSend(v11, "setCurrentPage:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scrollView"));
    v13 = v12;
    v14 = 0;
  }
  objc_msgSend(v12, "setScrollEnabled:", v14);

  v17.receiver = self;
  v17.super_class = (Class)MTAStopwatchViewController;
  -[MTAStopwatchViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100032968;
  v15[3] = &unk_100099C20;
  v15[4] = self;
  v16 = v7 > 0.9;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v15, 0);

}

- (void)loadView
{
  MTAStopwatchController *v3;
  id v4;
  double y;
  double width;
  double height;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  MTAStopwatchLapTableHeaderView *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  MTAStopwatchPagingViewController *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
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
  UIView *v68;
  void *v69;
  void *v70;
  MTAAnalogStopwatchView *v71;
  void *v72;
  void *v73;
  void *v74;
  UIView *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  _BOOL4 v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  _QWORD v94[5];
  objc_super v95;
  uint8_t buf[4];
  MTAStopwatchViewController *v97;
  _QWORD v98[2];

  v95.receiver = self;
  v95.super_class = (Class)MTAStopwatchViewController;
  -[MTAStopwatchViewController loadView](&v95, "loadView");
  -[MTAStopwatchViewController setAutomaticallyAdjustsScrollViewInsets:](self, "setAutomaticallyAdjustsScrollViewInsets:", 0);
  v3 = -[MTAStopwatchController initWithTarget:]([MTAStopwatchController alloc], "initWithTarget:", self);
  -[MTAStopwatchViewController setStopwatchController:](self, "setStopwatchController:", v3);

  -[MTAStopwatchViewController setMode:](self, "setMode:", 1);
  v4 = objc_alloc((Class)UIImageView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MTAStopwatchViewController setLapButtonOccludingView:](self, "setLapButtonOccludingView:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapButtonOccludingView](self, "lapButtonOccludingView"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapButtonOccludingView](self, "lapButtonOccludingView"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapButtonOccludingView](self, "lapButtonOccludingView"));
  objc_msgSend(v12, "addSubview:", v13);

  v14 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MTAStopwatchViewController setStartButtonOccludingView:](self, "setStartButtonOccludingView:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startButtonOccludingView](self, "startButtonOccludingView"));
  objc_msgSend(v16, "setBackgroundColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startButtonOccludingView](self, "startButtonOccludingView"));
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startButtonOccludingView](self, "startButtonOccludingView"));
  objc_msgSend(v18, "addSubview:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopwatchController](self, "stopwatchController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startStopButton"));
  objc_msgSend(v20, "addSubview:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopwatchController](self, "stopwatchController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lapControlButton"));
  objc_msgSend(v23, "addSubview:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopwatchController](self, "stopwatchController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startStopButton"));
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopwatchController](self, "stopwatchController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lapControlButton"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  LODWORD(v28) = -[MTAStopwatchViewController shouldUseRegularLayout](self, "shouldUseRegularLayout");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopwatchController](self, "stopwatchController"));
  objc_msgSend(v30, "setButtonSize:", v28);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "view"));
  objc_msgSend(v31, "addSubview:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
  objc_msgSend(v34, "didMoveToParentViewController:", self);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "view"));
  objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v37 = -[MTAStopwatchLapTableHeaderView initWithFrame:]([MTAStopwatchLapTableHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MTAStopwatchViewController setTableHeaderView:](self, "setTableHeaderView:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController tableHeaderView](self, "tableHeaderView"));
  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController tableHeaderView](self, "tableHeaderView"));
  objc_msgSend(v39, "setHidden:", 1);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController tableHeaderView](self, "tableHeaderView"));
  objc_msgSend(v40, "addSubview:", v41);

  v42 = objc_alloc_init(MTAStopwatchPagingViewController);
  -[MTAStopwatchViewController setPagingViewController:](self, "setPagingViewController:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
  -[MTAStopwatchViewController addChildViewController:](self, "addChildViewController:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "view"));
  objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
  objc_msgSend(v46, "setDelegate:", self);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "view"));
  objc_msgSend(v47, "insertSubview:atIndex:", v49, 0);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
  objc_msgSend(v50, "didMoveToParentViewController:", self);

  v51 = objc_msgSend(objc_alloc((Class)UIPageControl), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MTAStopwatchViewController setPageControl:](self, "setPageControl:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pageControl](self, "pageControl"));
  objc_msgSend(v52, "addTarget:action:forControlEvents:", self, "_pageControlValueChanged:", 4096);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pageControl](self, "pageControl"));
  objc_msgSend(v53, "setNumberOfPages:", 2);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pageControl](self, "pageControl"));
  objc_msgSend(v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pageControl](self, "pageControl"));
  objc_msgSend(v55, "addSubview:", v56);

  v57 = objc_alloc_init((Class)MTUITimeView);
  -[MTAStopwatchViewController setTimeView:](self, "setTimeView:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 88.0, UIFontWeightThin));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "mtui_fontByAddingTimeFontAttributes"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
  objc_msgSend(v60, "setFont:", v59);

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
  objc_msgSend(v62, "setTextColor:", v61);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
  objc_msgSend(v63, "setTextAlignment:", 1);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
  objc_msgSend(v64, "setAdjustsFontSizeToFitWidth:", 1);

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
  objc_msgSend(v66, "setBackgroundColor:", v65);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
  objc_msgSend(v67, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v68 = objc_opt_new(UIView);
  -[MTAStopwatchViewController setDigitalStopwatchContainer:](self, "setDigitalStopwatchContainer:", v68);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController digitalStopwatchContainer](self, "digitalStopwatchContainer"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
  objc_msgSend(v69, "addSubview:", v70);

  v71 = objc_alloc_init(MTAAnalogStopwatchView);
  -[MTAStopwatchViewController setAnalogStopwatch:](self, "setAnalogStopwatch:", v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
  objc_msgSend(v73, "setBackgroundColor:", v72);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
  objc_msgSend(v74, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v75 = objc_opt_new(UIView);
  -[MTAStopwatchViewController setAnalogStopwatchContainer:](self, "setAnalogStopwatchContainer:", v75);

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatchContainer](self, "analogStopwatchContainer"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
  objc_msgSend(v76, "addSubview:", v77);

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController digitalStopwatchContainer](self, "digitalStopwatchContainer"));
  v98[0] = v78;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatchContainer](self, "analogStopwatchContainer"));
  v98[1] = v79;
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v98, 2));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
  objc_msgSend(v81, "setPages:", v80);

  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v82, "addObserver:selector:name:object:", self, "handleLocaleChange", NSCurrentLocaleDidChangeNotification, 0);

    -[MTAStopwatchViewController updateShortcutItemForCurrentState](self, "updateShortcutItemForCurrentState");
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController migrator](self, "migrator"));
    v84 = objc_msgSend(v83, "needsMigration");

    v86 = MTLogForCategory(5, v85);
    v87 = objc_claimAutoreleasedReturnValue(v86);
    v88 = os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT);
    if (v84)
    {
      if (v88)
      {
        *(_DWORD *)buf = 138543362;
        v97 = self;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%{public}@ stopwatch need migration", buf, 0xCu);
      }

      v89 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController migrator](self, "migrator"));
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "migrateLegacyStopwatch"));
      v91 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "reschedule:", v91));
      v94[0] = _NSConcreteStackBlock;
      v94[1] = 3221225472;
      v94[2] = sub_1000334D0;
      v94[3] = &unk_100099C48;
      v94[4] = self;
      v93 = objc_msgSend(v92, "addCompletionBlock:", v94);

    }
    else
    {
      if (v88)
      {
        *(_DWORD *)buf = 138543362;
        v97 = self;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%{public}@ migration not needed, proceeding to load stopwatch", buf, 0xCu);
      }

      -[MTAStopwatchViewController reloadStopwatchesWithCompletion:](self, "reloadStopwatchesWithCompletion:", 0);
    }
  }
}

- (void)reloadStopwatchesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopwatchManager](self, "stopwatchManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getStopwatches"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reschedule:", v7));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000336C0;
  v11[3] = &unk_100099C70;
  v11[4] = self;
  v12 = v4;
  v9 = v4;
  v10 = objc_msgSend(v8, "addCompletionBlock:", v11);

}

- (void)setupViewModelWithStopwatch:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _BOOL8 v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  MTAStopwatchViewController *v36;
  __int16 v37;
  void *v38;

  v6 = a3;
  v8 = MTLogForCategory(5, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v35 = 138543618;
    v36 = self;
    v37 = 2114;
    v38 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@ setting up view model with stopwatch: %{public}@", (uint8_t *)&v35, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));

  v13 = MTLogForCategory(5, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v35 = 138543618;
      v36 = self;
      v37 = 2114;
      v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@ view model already exists, updating with stopwatch: %{public}@", (uint8_t *)&v35, 0x16u);

    }
    v17 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
    v18 = objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v17, "updateStopwatch:", v18);
  }
  else
  {
    if (v15)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v35 = 138543618;
      v36 = self;
      v37 = 2114;
      v38 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@ view model does not exist, creating new one with stopwatch: %{public}@", (uint8_t *)&v35, 0x16u);

    }
    v20 = objc_alloc((Class)MTStopwatchViewModel);
    v17 = objc_msgSend(v6, "mutableCopy");
    v18 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopwatchManager](self, "stopwatchManager"));
    v3 = (void *)objc_opt_new(DefaultDateProvider);
    v21 = objc_msgSend(v20, "initWithStopwatch:manager:delegate:dateProvider:registerForNotifications:broadcastUpdates:", v17, v18, self, v3, 1, 0);
    -[MTAStopwatchViewController setViewModel:](self, "setViewModel:", v21);

  }
  if (objc_msgSend(v6, "state") == (id)2)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
    objc_msgSend(v22, "updateWithDisplayLink");

    v23 = 2;
  }
  else if (objc_msgSend(v6, "state") == (id)1)
  {
    v23 = 3;
  }
  else
  {
    v23 = 1;
  }
  -[MTAStopwatchViewController setMode:](self, "setMode:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v24, "updateTime");

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "getStopwatch"));
  v27 = objc_msgSend(v26, "state");
  if (v27 == (id)2)
  {
    v28 = 1;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getStopwatch"));
    objc_msgSend(v4, "currentInterval");
    v28 = v29 > 0.0;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
  objc_msgSend(v30, "setShowsCurrentLap:", v28);

  if (v27 != (id)2)
  {

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "getStopwatch"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "laps"));
  objc_msgSend(v31, "setLaps:", v34);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  _UNKNOWN **v6;
  _UNKNOWN **v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTAStopwatchViewController;
  -[MTAStopwatchViewController viewDidLoad](&v14, "viewDidLoad");
  -[MTAStopwatchViewController updateTimeViewFont](self, "updateTimeViewFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableView"));

  -[MTAStopwatchViewController _setObservableScrollView:forEdges:](self, "_setObservableScrollView:forEdges:", v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("STOPWATCH_INDEX")));

  if (v6)
    v7 = v6;
  else
    v7 = &off_10009CDA0;
  v8 = objc_msgSend(v7, "integerValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
  objc_msgSend(v9, "setCurrentPage:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pageControl](self, "pageControl"));
  objc_msgSend(v10, "setCurrentPage:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "handleContentSizeCategoryChange:", UIContentSizeCategoryDidChangeNotification, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "handleEnterBackground", UIApplicationDidEnterBackgroundNotification, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "handleEnterForeground", UIApplicationWillEnterForegroundNotification, 0);

}

- (void)handleContentSizeCategoryChange:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  void *v11;
  void *v12;
  double Height;
  double *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  CGRect v32;
  CGRect v33;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view", a3));
  objc_msgSend(v4, "bounds");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopwatchController](self, "stopwatchController"));
  v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startStopButton"));

  v9 = MTUIShouldUseLargePadLayout(v8);
  v10 = -[MTAStopwatchViewController shouldUseRegularLayout](self, "shouldUseRegularLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  objc_msgSend(v11, "bounds");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v12, "bounds");
  Height = CGRectGetHeight(v32);

  if (v10)
  {
    v14 = (double *)&unk_10007AB60;
    if (!v9)
      v14 = (double *)&unk_10007AB68;
    v15 = *v14;
    +[MTACircleButton buttonWidthForSize:](MTACircleButton, "buttonWidthForSize:", 1);
    if (v16 >= 120.0)
      v17 = 120.0;
    else
      v17 = v16;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    objc_msgSend(v18, "bounds");
    v19 = fmin(Height * 0.542, CGRectGetWidth(v33));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    objc_msgSend(v20, "safeAreaInsets");
    v22 = v19 - v21;

    +[MTACircleButton buttonWidthForSize:](MTACircleButton, "buttonWidthForSize:", 0);
    v15 = v22 + (v23 - 84.0) * 0.5;
    v17 = (v6 + 16.0 * -2.0) * 0.25;
    +[MTACircleButton buttonWidthForSize:](MTACircleButton, "buttonWidthForSize:", objc_msgSend(v31, "buttonCircleSize"));
    if (v24 < v17)
      v17 = v24;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  v26 = UIRoundToViewScale(v15);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startButtonTopConstraint](self, "startButtonTopConstraint"));
  objc_msgSend(v27, "setConstant:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapButtonTopConstraint](self, "lapButtonTopConstraint"));
  objc_msgSend(v28, "setConstant:", v26);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startButtonWidthConstraint](self, "startButtonWidthConstraint"));
  objc_msgSend(v29, "setConstant:", v17);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapButtonWidthConstraint](self, "lapButtonWidthConstraint"));
  objc_msgSend(v30, "setConstant:", v17);

}

- (BOOL)shouldUseRegularLayout
{
  char v3;
  void *v4;
  id v5;

  v3 = MTUIShouldUseLargePadLayout(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 == (id)2)
    return 1;
  else
    return v3;
}

- (void)updateViewConstraints
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
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
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  double *v136;
  double v137;
  double v138;
  double v139;
  double v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  double v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  objc_super v183;
  __int128 v184;
  __int128 v185;
  objc_super v186;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[MTAStopwatchViewController latestLayoutSize](self, "latestLayoutSize");
  if (v9 == v5 && v8 == v7)
  {
    v186.receiver = self;
    v186.super_class = (Class)MTAStopwatchViewController;
    -[MTAStopwatchViewController updateViewConstraints](&v186, "updateViewConstraints");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tableView"));

    v13 = objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController tableHeaderView](self, "tableHeaderView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopwatchController](self, "stopwatchController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startStopButton"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopwatchController](self, "stopwatchController"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lapControlButton"));

    v184 = 0u;
    v185 = 0u;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    v182 = v18;
    +[MTAUtilities controlButtonAttributesForView:buttonCircleSize:](MTAUtilities, "controlButtonAttributesForView:buttonCircleSize:", v21, objc_msgSend(v18, "buttonCircleSize"));

    v181 = (void *)v13;
    v180 = (void *)v15;
    v22 = v18;
    v23 = (void *)v20;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "safeAreaLayoutGuide"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v27, 0.0));
    -[MTAStopwatchViewController setStartButtonTopConstraint:](self, "setStartButtonTopConstraint:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "safeAreaLayoutGuide"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v32, 0.0));
    -[MTAStopwatchViewController setLapButtonTopConstraint:](self, "setLapButtonTopConstraint:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapButtonTopConstraint](self, "lapButtonTopConstraint"));
    objc_msgSend(v16, "addObject:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startButtonTopConstraint](self, "startButtonTopConstraint"));
    objc_msgSend(v16, "addObject:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, 16.0));
    objc_msgSend(v16, "addObject:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "widthAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToConstant:", 0.0));
    -[MTAStopwatchViewController setLapButtonWidthConstraint:](self, "setLapButtonWidthConstraint:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapButtonWidthConstraint](self, "lapButtonWidthConstraint"));
    objc_msgSend(v16, "addObject:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "heightAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "widthAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));
    objc_msgSend(v16, "addObject:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, -16.0));
    objc_msgSend(v16, "addObject:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "widthAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToConstant:", 0.0));
    -[MTAStopwatchViewController setStartButtonWidthConstraint:](self, "setStartButtonWidthConstraint:", v51);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startButtonWidthConstraint](self, "startButtonWidthConstraint"));
    objc_msgSend(v16, "addObject:", v52);

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "heightAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "widthAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v54));
    objc_msgSend(v16, "addObject:", v55);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapButtonOccludingView](self, "lapButtonOccludingView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "centerXAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerXAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v58));
    objc_msgSend(v16, "addObject:", v59);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapButtonOccludingView](self, "lapButtonOccludingView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "centerYAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v62));
    objc_msgSend(v16, "addObject:", v63);

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapButtonOccludingView](self, "lapButtonOccludingView"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "widthAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "widthAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:multiplier:constant:", v66, 1.0, 2.0));
    objc_msgSend(v16, "addObject:", v67);

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapButtonOccludingView](self, "lapButtonOccludingView"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "heightAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "heightAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:multiplier:constant:", v70, 1.0, 2.0));
    objc_msgSend(v16, "addObject:", v71);

    v72 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startButtonOccludingView](self, "startButtonOccludingView"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "centerXAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerXAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v74));
    objc_msgSend(v16, "addObject:", v75);

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startButtonOccludingView](self, "startButtonOccludingView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "centerYAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerYAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v78));
    objc_msgSend(v16, "addObject:", v79);

    v80 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startButtonOccludingView](self, "startButtonOccludingView"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "widthAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "widthAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:multiplier:constant:", v82, 1.0, 2.0));
    objc_msgSend(v16, "addObject:", v83);

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startButtonOccludingView](self, "startButtonOccludingView"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "heightAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "heightAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:multiplier:constant:", v86, 1.0, 2.0));
    objc_msgSend(v16, "addObject:", v87);

    v88 = sub_100032500(0.0 + 2.0);
    v89 = objc_claimAutoreleasedReturnValue(v88);
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapButtonOccludingView](self, "lapButtonOccludingView"));
    objc_msgSend(v90, "setImage:", v89);

    v91 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startButtonOccludingView](self, "startButtonOccludingView"));
    objc_msgSend(v91, "setImage:", v89);

    v178 = v23;
    v179 = (void *)v89;
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:constant:", v93, 16.0));
    v95 = v23;
    objc_msgSend(v16, "addObject:", v94);

    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "leadingAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v98));
    objc_msgSend(v16, "addObject:", v99);

    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "trailingAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v102));
    objc_msgSend(v16, "addObject:", v103);

    v104 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pageControl](self, "pageControl"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "centerXAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "centerXAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:", v107));
    objc_msgSend(v16, "addObject:", v108);

    v109 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pageControl](self, "pageControl"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "centerYAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "centerYAnchor"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:", v111));
    objc_msgSend(v16, "addObject:", v112);

    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "bottomAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:", v115));
    objc_msgSend(v16, "addObject:", v116);

    v117 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
    objc_msgSend(v117, "setCellStyle:", 1);

    v118 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController tableHeaderView](self, "tableHeaderView"));
    objc_msgSend(v118, "setHidden:", 1);

    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "leadingAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "leadingAnchor"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v121));
    objc_msgSend(v16, "addObject:", v122);

    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "trailingAnchor"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "trailingAnchor"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "constraintEqualToAnchor:", v125));
    objc_msgSend(v16, "addObject:", v126);

    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "topAnchor"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "safeAreaLayoutGuide"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "topAnchor"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToAnchor:", v130));
    objc_msgSend(v16, "addObject:", v131);

    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "bottomAnchor"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pageControl](self, "pageControl"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "topAnchor"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "constraintEqualToAnchor:constant:", v134, 15.0));
    objc_msgSend(v16, "addObject:", v135);

    v136 = (double *)&unk_10007AB28;
    if (!BYTE10(v185))
      v136 = (double *)&qword_10007AAE0;
    v137 = 0.0 * 0.5 + 0.0;
    v138 = v137 + *v136 * -2.0;
    v139 = v137 - (v5 + *v136 * -2.0);
    if (v138 <= v5)
      v140 = *v136;
    else
      v140 = v139 * 0.5;
    v141 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "centerXAnchor"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatchContainer](self, "analogStopwatchContainer"));
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "centerXAnchor"));
    v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "constraintEqualToAnchor:", v144));
    objc_msgSend(v16, "addObject:", v145);

    v146 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
    v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "topAnchor"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatchContainer](self, "analogStopwatchContainer"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "topAnchor"));
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:constant:", v149, v140));
    objc_msgSend(v16, "addObject:", v150);

    v151 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
    v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "bottomAnchor"));
    v153 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatchContainer](self, "analogStopwatchContainer"));
    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "bottomAnchor"));
    v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "constraintEqualToAnchor:constant:", v154, -v140));

    LODWORD(v156) = 1148829696;
    objc_msgSend(v155, "setPriority:", v156);
    objc_msgSend(v16, "addObject:", v155);
    v157 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "widthAnchor"));
    v159 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
    v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "heightAnchor"));
    v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "constraintEqualToAnchor:", v160));
    objc_msgSend(v16, "addObject:", v161);

    v162 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
    v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "leadingAnchor"));
    v164 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController digitalStopwatchContainer](self, "digitalStopwatchContainer"));
    v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "leadingAnchor"));
    v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "constraintEqualToAnchor:", v165));
    objc_msgSend(v16, "addObject:", v166);

    v167 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
    v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "trailingAnchor"));
    v169 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController digitalStopwatchContainer](self, "digitalStopwatchContainer"));
    v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "trailingAnchor"));
    v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "constraintEqualToAnchor:", v170));
    objc_msgSend(v16, "addObject:", v171);

    v172 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
    v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "centerYAnchor"));
    v174 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController digitalStopwatchContainer](self, "digitalStopwatchContainer"));
    v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "centerYAnchor"));
    v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "constraintEqualToAnchor:", v175));
    objc_msgSend(v16, "addObject:", v176);

    v177 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController constraints](self, "constraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v177);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);
    -[MTAStopwatchViewController setConstraints:](self, "setConstraints:", v16);
    -[MTAStopwatchViewController setLatestLayoutSize:](self, "setLatestLayoutSize:", v5, v7);
    v183.receiver = self;
    v183.super_class = (Class)MTAStopwatchViewController;
    -[MTAStopwatchViewController updateViewConstraints](&v183, "updateViewConstraints");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTAStopwatchViewController;
  -[MTAStopwatchViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  objc_msgSend(v4, "setNeedsUpdateConstraints");

  -[MTAStopwatchViewController renderViewModel](self, "renderViewModel");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAStopwatchViewController;
  -[MTAStopwatchViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[NSUserActivity becomeCurrent](self->_userActivity, "becomeCurrent");
}

- (void)renderViewModel
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getStopwatch"));
  v5 = objc_msgSend(v4, "state");

  if (v5 == (id)2)
  {
    -[MTAStopwatchViewController startDisplayUpdates](self, "startDisplayUpdates");
    v6 = 2;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getStopwatch"));
    objc_msgSend(v8, "currentInterval");
    v10 = v9;

    if (v10 <= 0.0)
      goto LABEL_6;
    v6 = 3;
  }
  -[MTAStopwatchViewController setMode:](self, "setMode:", v6);
LABEL_6:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getStopwatch"));
  objc_msgSend(v12, "currentInterval");
  v14 = v13;

  if (v14 > 0.0)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
    objc_msgSend(v15, "updateTime");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[NSUserActivity resignCurrent](self->_userActivity, "resignCurrent");
  v5.receiver = self;
  v5.super_class = (Class)MTAStopwatchViewController;
  -[MTAStopwatchViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAStopwatchViewController;
  -[MTAStopwatchViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[MTAStopwatchViewController endDisplayUpdates](self, "endDisplayUpdates");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTAStopwatchViewController;
  -[MTAStopwatchViewController viewDidLayoutSubviews](&v15, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v6 = v4 / v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
  v8 = v7;
  if (v6 <= 0.9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scrollView"));
    objc_msgSend(v14, "setScrollEnabled:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pageControl](self, "pageControl"));
    v12 = v11;
    v13 = 1.0;
  }
  else
  {
    objc_msgSend(v7, "setCurrentPage:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
    objc_msgSend(v10, "setScrollEnabled:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pageControl](self, "pageControl"));
    v12 = v11;
    v13 = 0.0;
  }
  objc_msgSend(v11, "setAlpha:", v13);

}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  unint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));

  v4 = (char *)objc_msgSend(v6, "interfaceOrientation") - 3 < (char *)2;
  return v4;
}

- (void)stopwatchPagingViewController:(id)a3 didPage:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pageControl](self, "pageControl", a3));
  objc_msgSend(v5, "setCurrentPage:", a4);

}

- (void)saveState
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "currentPage")));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("STOPWATCH_INDEX"));

}

- (void)updateShortcutItemForCurrentState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortcutItems"));
  v8 = objc_msgSend(v4, "mutableCopy");

  v5 = objc_msgSend(v8, "indexOfObjectPassingTest:", &stru_100099C90);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController shortcutItemForCurrentState](self, "shortcutItemForCurrentState"));
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "insertObject:atIndex:", v6, 0);
  else
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v7, "setShortcutItems:", v8);

}

- (id)shortcutItemForCurrentState
{
  return -[MTAStopwatchViewController shortcutItemForMode:](self, "shortcutItemForMode:", self->_mode);
}

- (id)shortcutItemForMode:(unint64_t)a3
{
  void *v3;

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController startStopwatchShortcutItemForMode:](self, "startStopwatchShortcutItemForMode:"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController stopStopwatchShortcutItem](self, "stopStopwatchShortcutItem"));
  return v3;
}

- (id)startStopwatchShortcutItemForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", CFSTR("stopwatch")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (a3 == 1)
    v7 = CFSTR("START_STOPWATCH_QUICK_ACTION_TITLE");
  else
    v7 = CFSTR("RESUME_STOPWATCH_QUICK_ACTION_TITLE");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_10009A4D0, CFSTR("Localizable-OrbHW")));

  v9 = objc_msgSend(objc_alloc((Class)UIApplicationShortcutItem), "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.mobiletimer.start-stopwatch"), v8, 0, v4, 0);
  return v9;
}

- (id)stopStopwatchShortcutItem
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", CFSTR("stopwatch")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("STOP_STOPWATCH_QUICK_ACTION_TITLE"), &stru_10009A4D0, CFSTR("Localizable-OrbHW")));

  v5 = objc_msgSend(objc_alloc((Class)UIApplicationShortcutItem), "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.mobiletimer.stop-stopwatch"), v4, 0, v2, 0);
  return v5;
}

- (id)defaultShortcutItem
{
  if (self->_isTimerRunning)
    return -[MTAStopwatchViewController shortcutItemForMode:](self, "shortcutItemForMode:", 2);
  if (self->_currentInterval <= 0.0)
    return -[MTAStopwatchViewController shortcutItemForMode:](self, "shortcutItemForMode:", 1);
  return -[MTAStopwatchViewController shortcutItemForMode:](self, "shortcutItemForMode:", 3);
}

- (void)handleStartStopwatchShortcutAction
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000361A4;
  v2[3] = &unk_100099320;
  v2[4] = self;
  -[MTAStopwatchViewController reloadStopwatchesWithCompletion:](self, "reloadStopwatchesWithCompletion:", v2);
}

- (void)handleStopStopwatchShortcutAction
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100036244;
  v2[3] = &unk_100099320;
  v2[4] = self;
  -[MTAStopwatchViewController reloadStopwatchesWithCompletion:](self, "reloadStopwatchesWithCompletion:", v2);
}

- (void)handleLapStopwatchShortcutAction
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000362B4;
  v2[3] = &unk_100099320;
  v2[4] = self;
  -[MTAStopwatchViewController reloadStopwatchesWithCompletion:](self, "reloadStopwatchesWithCompletion:", v2);
}

- (void)handleResetStopwatchShortcutAction
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100036324;
  v2[3] = &unk_100099320;
  v2[4] = self;
  -[MTAStopwatchViewController reloadStopwatchesWithCompletion:](self, "reloadStopwatchesWithCompletion:", v2);
}

- (void)_pageControlValueChanged:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController pagingViewController](self, "pagingViewController"));
  v5 = objc_msgSend(v4, "currentPage");

  objc_msgSend(v6, "setCurrentPage:animated:", v5, 1);
}

- (void)startDisplayUpdates
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSTimer *v7;
  NSTimer *restoreIdleTimerTimer;
  void *v9;
  int v10;
  MTAStopwatchViewController *v11;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ startDisplayUpdates", (uint8_t *)&v10, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v5, "invalidateDisplayLink");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v6, "updateWithDisplayLink");

  -[NSTimer invalidate](self->_restoreIdleTimerTimer, "invalidate");
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_restoreIdleTimer", 0, 0, 300.0));
  restoreIdleTimerTimer = self->_restoreIdleTimerTimer;
  self->_restoreIdleTimerTimer = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v9, "setIdleTimerDisabled:", 1);

}

- (void)endDisplayUpdates
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  MTAStopwatchViewController *v7;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ endDisplayUpdates", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v5, "invalidateDisplayLink");

  -[MTAStopwatchViewController _restoreIdleTimer](self, "_restoreIdleTimer");
}

- (void)_restoreIdleTimer
{
  NSTimer *restoreIdleTimerTimer;
  id v4;

  -[NSTimer invalidate](self->_restoreIdleTimerTimer, "invalidate");
  restoreIdleTimerTimer = self->_restoreIdleTimerTimer;
  self->_restoreIdleTimerTimer = 0;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "setIdleTimerDisabled:", 0);

}

- (double)runningTotalForLap:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v4, "runningTotalForLap:", a3);
  v6 = v5;

  return v6;
}

- (void)startLapTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  MTAStopwatchViewController *v13;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ starting lap timer", (uint8_t *)&v12, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getStopwatch"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "laps"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
    objc_msgSend(v9, "clearAllLaps");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v10, "startLapTimer");

  -[MTAStopwatchViewController startDisplayUpdates](self, "startDisplayUpdates");
  -[MTAStopwatchViewController setMode:](self, "setMode:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
  objc_msgSend(v11, "setShowsCurrentLap:", 1);

  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCAStopwatchStarts);
}

- (void)pauseLapTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  MTAStopwatchViewController *v7;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ pausing lap timer", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v5, "pauseLapTimer");

  -[MTAStopwatchViewController pauseLapTimerUI](self, "pauseLapTimerUI");
}

- (void)pauseLapTimerUI
{
  void *v3;

  -[MTAStopwatchViewController endDisplayUpdates](self, "endDisplayUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v3, "updateTime");

  -[MTAStopwatchViewController setMode:](self, "setMode:", 3);
  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCAStopwatchPauses);
}

- (void)lapLapTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  MTAStopwatchViewController *v7;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ lapping lap timer", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v5, "lapLapTimer");

  -[MTAStopwatchViewController lapLapTimerUI](self, "lapLapTimerUI");
}

- (void)lapLapTimerUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getStopwatch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
  objc_msgSend(v9, "addLap:", v8);

  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCAStopwatchLaps);
}

- (void)resetLapTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  MTAStopwatchViewController *v8;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting lap timer", (uint8_t *)&v7, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v5, "resetLapTimer");

  -[MTAStopwatchViewController resetLapTimerUI](self, "resetLapTimerUI");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v6, "updateTime");

}

- (void)resetLapTimerUI
{
  void *v3;
  void *v4;

  -[MTAStopwatchViewController endDisplayUpdates](self, "endDisplayUpdates");
  -[MTAStopwatchViewController setMode:](self, "setMode:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
  objc_msgSend(v3, "setShowsCurrentLap:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
  objc_msgSend(v4, "clearAllLaps");

  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCAStopwatchResets);
}

- (void)resumeLapTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  MTAStopwatchViewController *v7;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming lap timer", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v5, "resumeLapTimer");

  -[MTAStopwatchViewController resumeLapTimerUI](self, "resumeLapTimerUI");
}

- (void)resumeLapTimerUI
{
  -[MTAStopwatchViewController startDisplayUpdates](self, "startDisplayUpdates");
  -[MTAStopwatchViewController setMode:](self, "setMode:", 2);
}

- (void)didAddLap:(double)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  MTAStopwatchViewController *v7;

  v4 = MTLogForCategory(5, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@ didAddLap", (uint8_t *)&v6, 0xCu);
  }

  -[MTAStopwatchViewController lapLapTimerUI](self, "lapLapTimerUI");
}

- (void)didLapLapTimer
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  MTAStopwatchViewController *v6;

  v3 = MTLogForCategory(5, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@ didLapLapTimer", (uint8_t *)&v5, 0xCu);
  }

  -[MTAStopwatchViewController lapLapTimerUI](self, "lapLapTimerUI");
}

- (void)didPauseLapTimer
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  MTAStopwatchViewController *v6;

  v3 = MTLogForCategory(5, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@ didPauseLapTimer", (uint8_t *)&v5, 0xCu);
  }

  -[MTAStopwatchViewController pauseLapTimerUI](self, "pauseLapTimerUI");
}

- (void)didPauseStopwatch
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  MTAStopwatchViewController *v6;

  v3 = MTLogForCategory(5, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@ didPauseStopwatch", (uint8_t *)&v5, 0xCu);
  }

  -[MTAStopwatchViewController endDisplayUpdates](self, "endDisplayUpdates");
  -[MTAStopwatchViewController setMode:](self, "setMode:", 3);
}

- (void)didResetLapTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  MTAStopwatchViewController *v7;

  v3 = MTLogForCategory(5, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@ didResetLapTimer", (uint8_t *)&v6, 0xCu);
  }

  -[MTAStopwatchViewController resetLapTimerUI](self, "resetLapTimerUI");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController viewModel](self, "viewModel"));
  objc_msgSend(v5, "updateTime");

}

- (void)didResumeLapTimer
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  MTAStopwatchViewController *v6;

  v3 = MTLogForCategory(5, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@ didResumeLapTimer", (uint8_t *)&v5, 0xCu);
  }

  -[MTAStopwatchViewController resumeLapTimerUI](self, "resumeLapTimerUI");
}

- (void)didStartLapTimer
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  MTAStopwatchViewController *v6;

  v3 = MTLogForCategory(5, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@ didStartLapTimer", (uint8_t *)&v5, 0xCu);
  }

  -[MTAStopwatchViewController startLapTimer](self, "startLapTimer");
}

- (void)didUpdateCurrentInterval:(double)a3 adjustedCurrentInterval:(double)a4 totalInterval:(double)a5 adjustedTotalInterval:(double)a6 isStopwatchRunning:(BOOL)a7 isStopwatchStopped:(BOOL)a8
{
  _BOOL4 v8;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  v8 = a7;
  if (-[MTAStopwatchViewController shouldProcessUpdate](self, "shouldProcessUpdate", a7, a8))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController timeView](self, "timeView"));
    v15 = v14;
    if (v8)
    {
      objc_msgSend(v14, "setTime:", a6);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
      objc_msgSend(v16, "setDisplayAdjustedElapsedTime:", a6);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
      v18 = v17;
      v19 = a4;
    }
    else
    {
      objc_msgSend(v14, "setTime:", a5);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
      objc_msgSend(v20, "setDisplayAdjustedElapsedTime:", a5);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController lapTableController](self, "lapTableController"));
      v18 = v17;
      v19 = a3;
    }
    objc_msgSend(v17, "setCurrentInterval:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
    objc_msgSend(v21, "setElapsedTime:", a5);

    v22 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchViewController analogStopwatch](self, "analogStopwatch"));
    objc_msgSend(v22, "setCurrentLapTime:", a3);

  }
}

- (BOOL)shouldProcessUpdate
{
  return 1;
}

- (MTAStopwatchController)stopwatchController
{
  return self->_stopwatchController;
}

- (void)setStopwatchController:(id)a3
{
  objc_storeStrong((id *)&self->_stopwatchController, a3);
}

- (MTAStopwatchLapTableHeaderView)tableHeaderView
{
  return self->_tableHeaderView;
}

- (void)setTableHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_tableHeaderView, a3);
}

- (UIImageView)lapButtonOccludingView
{
  return self->_lapButtonOccludingView;
}

- (void)setLapButtonOccludingView:(id)a3
{
  objc_storeStrong((id *)&self->_lapButtonOccludingView, a3);
}

- (UIImageView)startButtonOccludingView
{
  return self->_startButtonOccludingView;
}

- (void)setStartButtonOccludingView:(id)a3
{
  objc_storeStrong((id *)&self->_startButtonOccludingView, a3);
}

- (MTAStopwatchPagingViewController)pagingViewController
{
  return self->_pagingViewController;
}

- (void)setPagingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pagingViewController, a3);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (UIView)analogStopwatchContainer
{
  return self->_analogStopwatchContainer;
}

- (void)setAnalogStopwatchContainer:(id)a3
{
  objc_storeStrong((id *)&self->_analogStopwatchContainer, a3);
}

- (MTAAnalogStopwatchView)analogStopwatch
{
  return self->_analogStopwatch;
}

- (void)setAnalogStopwatch:(id)a3
{
  objc_storeStrong((id *)&self->_analogStopwatch, a3);
}

- (UIView)digitalStopwatchContainer
{
  return self->_digitalStopwatchContainer;
}

- (void)setDigitalStopwatchContainer:(id)a3
{
  objc_storeStrong((id *)&self->_digitalStopwatchContainer, a3);
}

- (MTUITimeView)timeView
{
  return self->_timeView;
}

- (void)setTimeView:(id)a3
{
  objc_storeStrong((id *)&self->_timeView, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (CGSize)latestLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_latestLayoutSize.width;
  height = self->_latestLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLatestLayoutSize:(CGSize)a3
{
  self->_latestLayoutSize = a3;
}

- (NSLayoutConstraint)startButtonTopConstraint
{
  return self->_startButtonTopConstraint;
}

- (void)setStartButtonTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_startButtonTopConstraint, a3);
}

- (NSLayoutConstraint)lapButtonTopConstraint
{
  return self->_lapButtonTopConstraint;
}

- (void)setLapButtonTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_lapButtonTopConstraint, a3);
}

- (NSLayoutConstraint)startButtonWidthConstraint
{
  return self->_startButtonWidthConstraint;
}

- (void)setStartButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_startButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)lapButtonWidthConstraint
{
  return self->_lapButtonWidthConstraint;
}

- (void)setLapButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_lapButtonWidthConstraint, a3);
}

- (MTStopwatchViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (MTLegacyStopwatchMigrator)migrator
{
  return self->_migrator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_stopwatchManager, 0);
  objc_storeStrong((id *)&self->_lapButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_startButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_lapButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_startButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_digitalStopwatchContainer, 0);
  objc_storeStrong((id *)&self->_analogStopwatch, 0);
  objc_storeStrong((id *)&self->_analogStopwatchContainer, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_pagingViewController, 0);
  objc_storeStrong((id *)&self->_startButtonOccludingView, 0);
  objc_storeStrong((id *)&self->_lapButtonOccludingView, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_lapTableController, 0);
  objc_storeStrong((id *)&self->_stopwatchController, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_restoreIdleTimerTimer, 0);
  objc_storeStrong((id *)&self->_laps, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
