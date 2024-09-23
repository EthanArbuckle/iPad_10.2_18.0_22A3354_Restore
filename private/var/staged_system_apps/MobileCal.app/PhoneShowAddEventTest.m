@implementation PhoneShowAddEventTest

+ (id)_delaySubTestName
{
  return CFSTR("Delay");
}

+ (id)_animationSubTestName
{
  return CFSTR("Animation");
}

- (void)runTest
{
  double v3;
  id v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_time_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "testName", v3));
  *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_delaySubTestName", v6));
  *(_QWORD *)&v9 = objc_opt_class(self).n128_u64[0];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_animationSubTestName", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootNavigationController"));
  v14 = objc_msgSend(v13, "resetToDayView");

  v15 = dispatch_time(0, 1000000000);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100080C34;
  v19[3] = &unk_1001B2C88;
  v19[4] = self;
  v20 = v5;
  v21 = v8;
  v22 = v11;
  v16 = v11;
  v17 = v8;
  v18 = v5;
  dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, v19);

}

- (void)_viewControllerAppeared:(id)a3
{
  double v4;
  id v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testName", v4));
  *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_animationSubTestName", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v9, "finishedSubTest:forTest:", v8, v15);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v10, "finishedTest:extraResults:", v15, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootNavigationController"));
  v13 = objc_msgSend(v12, "popToRootViewControllerAnimated:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "removeObserver:name:object:", self, EKEventViewControllerDidAppearNotification, 0);

}

@end
