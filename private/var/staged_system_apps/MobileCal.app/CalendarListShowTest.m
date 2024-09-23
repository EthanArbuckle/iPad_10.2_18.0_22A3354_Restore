@implementation CalendarListShowTest

- (void)runTest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  dispatch_time_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootNavigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));
  v6 = objc_msgSend(v4, "resetToYearView");
  v7 = dispatch_time(0, 2000000000);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003C928;
  v11[3] = &unk_1001B2C88;
  v11[4] = self;
  v12 = v3;
  v13 = v5;
  v14 = v4;
  v8 = v4;
  v9 = v5;
  v10 = v3;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v11);

}

@end
