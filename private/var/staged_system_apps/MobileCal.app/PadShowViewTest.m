@implementation PadShowViewTest

- (void)runTest
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
  void *v12;
  dispatch_time_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_viewShown:", CFSTR("MainViewControllerDidAppearNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNavigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootNavigationController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resetToYearView"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
  objc_msgSend(v9, "showDate:animated:", v10, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pushCalendarViewControllerWithViewType:andDate:", -[PadShowViewTest _viewType](self, "_viewType"), v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentChildViewController"));
  objc_msgSend(v12, "selectDate:animated:", v6, 0);

  v13 = dispatch_time(0, 5000000000);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000DA8C0;
  v17[3] = &unk_1001B2C88;
  v17[4] = self;
  v18 = v4;
  v19 = v5;
  v20 = v6;
  v14 = v6;
  v15 = v5;
  v16 = v4;
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v17);

}

- (int64_t)_viewType
{
  return -1;
}

- (void)_viewShown:(id)a3
{
  double v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testName", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DAB58;
  v8[3] = &unk_1001B2538;
  v8[4] = self;
  objc_msgSend(v7, "finishedTest:extraResults:withTeardownBlock:", v6, 0, v8);

}

@end
