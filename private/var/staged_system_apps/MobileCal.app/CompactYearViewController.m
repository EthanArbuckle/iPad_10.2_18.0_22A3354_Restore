@implementation CompactYearViewController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;

  v9.receiver = self;
  v9.super_class = (Class)CompactYearViewController;
  -[YearViewController viewDidAppear:](&v9, "viewDidAppear:", a3);
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138543362;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear", buf, 0xCu);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  _QWORD *v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  CompactYearViewController *v15;
  CGFloat v16;
  CGFloat v17;
  _QWORD v18[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[MainViewController setDisableRotationTimings:](self, "setDisableRotationTimings:", 1);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100093E14;
  v18[3] = &unk_1001B2C38;
  v18[4] = self;
  v8 = objc_retainBlock(v18);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100093EA4;
  v13[3] = &unk_1001B3DF0;
  v16 = width;
  v17 = height;
  v9 = v7;
  v14 = v9;
  v15 = self;
  v10 = objc_retainBlock(v13);
  if (v9)
  {
    -[MainViewController transitionToSizeWillStart](self, "transitionToSizeWillStart");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100093EE0;
    v11[3] = &unk_1001B3E18;
    v11[4] = self;
    v12 = v10;
    objc_msgSend(v9, "animateAlongsideTransition:completion:", v8, v11);

  }
  else
  {
    ((void (*)(_QWORD *, _QWORD))v8[2])(v8, 0);
    ((void (*)(_QWORD *, _QWORD))v10[2])(v10, 0);
  }

}

- (Class)multipleMonthViewClass
{
  void *v2;
  int v3;
  __objc2_class **v4;
  id v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CompactYearViewController traitCollection](self, "traitCollection"));
  v3 = EKUIUsesLargeTextYearView();
  v4 = off_1001B1648;
  if (!v3)
    v4 = off_1001B13D8;
  objc_opt_class(*v4);
  v6 = v5;

  return (Class)v6;
}

- (unint64_t)monthsPerRow
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CompactYearViewController traitCollection](self, "traitCollection"));
  if (EKUIUsesLargeTextYearView())
    v3 = 2;
  else
    v3 = 3;

  return v3;
}

- (BOOL)shouldAnimateTransitionsToMonthView
{
  return 1;
}

- (void)updatePalette:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setWeekdayHeaderVisible:", 0);
  objc_msgSend(v3, "setWeekdayHeaderFillsHalfWidth:", 0);
  objc_msgSend(v3, "setTodayButtonVisible:", 0);
  objc_msgSend(v3, "setDateStringVisible:", 0);
  objc_msgSend(v3, "setDividerLineVisible:", 0);
  objc_msgSend(v3, "setDayScrubberController:", 0);
  objc_msgSend(v3, "setFocusBannerPlacement:", 1);
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)setShouldRespondToApplicationDidBecomeActiveStateChange:(BOOL)a3
{
  self->_applicationResuming = a3;
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  return !self->_applicationResuming;
}

- (int64_t)intendedSizeClass
{
  return 1;
}

@end
