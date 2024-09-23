@implementation MonthViewController

- (MonthViewController)initWithDataProvider:(id)a3 activityDateCache:(id)a4 badgeImageFactory:(id)a5 pauseRingsCoordinator:(id)a6 workoutFormattingManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MonthViewController *v17;
  MonthViewController *v18;
  uint64_t v19;
  CHWorkoutDataProvider *workoutsDataProvider;
  id v21;
  void *v22;
  id v24;
  objc_super v25;

  v13 = a3;
  v24 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MonthViewController;
  v17 = -[MonthViewController init](&v25, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_activityDataProvider, a3);
    objc_storeStrong((id *)&v18->_activityDateCache, a4);
    objc_storeStrong((id *)&v18->_workoutFormattingManager, a7);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "workoutDataProvider"));
    workoutsDataProvider = v18->_workoutsDataProvider;
    v18->_workoutsDataProvider = (CHWorkoutDataProvider *)v19;

    objc_storeStrong((id *)&v18->_badgeImageFactory, a5);
    objc_storeStrong((id *)&v18->_pauseRingsCoordinator, a6);
    v21 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v18, "_didTapCancelButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController navigationItem](v18, "navigationItem"));
    objc_msgSend(v22, "setLeftBarButtonItem:", v21);

  }
  return v18;
}

- (void)viewDidLoad
{
  MonthScrollViewController *v3;
  MonthScrollViewController *scrollVC;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MonthViewController;
  -[MonthViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = -[MonthScrollViewController initWithDateCache:workoutsDataProvider:pauseRingsCoordinator:]([MonthScrollViewController alloc], "initWithDateCache:workoutsDataProvider:pauseRingsCoordinator:", self->_activityDateCache, self->_workoutsDataProvider, self->_pauseRingsCoordinator);
  scrollVC = self->_scrollVC;
  self->_scrollVC = v3;

  -[MonthViewController addChildViewController:](self, "addChildViewController:", self->_scrollVC);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController view](self->_scrollVC, "view"));
  objc_msgSend(v5, "addSubview:", v6);

  -[MonthScrollViewController didMoveToParentViewController:](self->_scrollVC, "didMoveToParentViewController:", self);
  -[MonthScrollViewController setMonthScrollDelegate:](self->_scrollVC, "setMonthScrollDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthScrollViewController scrollView](self->_scrollVC, "scrollView"));
  -[MonthViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v7, 15);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[MonthViewController scrolledPastMonthWithDate:](self, "scrolledPastMonthWithDate:", v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MonthViewController;
  v4 = -[MonthViewController viewWillAppear:](&v13, "viewWillAppear:", a3);
  _HKInitializeLogging(v4, v5);
  v6 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MVC] Month view appeared.", buf, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController transitionCoordinator](self, "transitionCoordinator"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000AB890;
  v10[3] = &unk_100779D98;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v10, 0);

}

- (void)dateSelected:(id)a3
{
  -[ActivityDateCache setWithCurrentSelectedDate:caller:](self->_activityDateCache, "setWithCurrentSelectedDate:caller:", a3, self);
  -[MonthViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_didTapCancelButton
{
  -[MonthViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_registerForNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_updateBackButtonOnSelectedDateChange:", CFSTR("FitnessCurrentSelectedDateChangedNotification"), 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MonthViewController;
  -[MonthViewController dealloc](&v4, "dealloc");
}

- (id)_titleStringForDate:(id)a3
{
  return (id)HKLocalizedStringForDateAndTemplateWithFormattingContext(a3, 6, 2);
}

- (void)scrolledPastMonthWithDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityDateCache dateCache](self->_activityDateCache, "dateCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendar"));
  v6 = objc_msgSend(v5, "component:fromDate:", 8, v9);

  if ((id)self->_currentMonth != v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController _titleStringForDate:](self, "_titleStringForDate:", v9));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v8, "setTitle:", v7);

    self->_currentMonth = (int64_t)v6;
  }

}

- (void)_updateBackButtonOnSelectedDateChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v6 = objc_opt_class(self, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) == 0)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[ActivityDateCache currentSelectedDate](self->_activityDateCache, "currentSelectedDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityDateCache calendar](self->_activityDateCache, "calendar"));
    v9 = objc_msgSend(v8, "component:fromDate:", 8, v15);

    if ((id)self->_currentMonth != v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityDateCache dateCache](self->_activityDateCache, "dateCache"));
      v11 = HKRelativeMonthYearText(v15, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      v13 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v12, 0, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v14, "setBackBarButtonItem:", v13);

      -[MonthViewController scrolledPastMonthWithDate:](self, "scrolledPastMonthWithDate:", v15);
    }

  }
}

- (MonthScrollViewController)scrollVC
{
  return self->_scrollVC;
}

- (void)setScrollVC:(id)a3
{
  objc_storeStrong((id *)&self->_scrollVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollVC, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_storeStrong((id *)&self->_activityDateCache, 0);
  objc_storeStrong((id *)&self->_activityDataProvider, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_achievementsDataProvider, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_workoutsDataProvider, 0);
}

@end
