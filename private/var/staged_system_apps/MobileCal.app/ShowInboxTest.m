@implementation ShowInboxTest

- (void)runTest
{
  void *v3;
  void *v4;
  id v5;
  dispatch_time_t v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootNavigationController"));
  v5 = objc_msgSend(v4, "resetToYearView");
  v6 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045778;
  block[3] = &unk_1001B2CD8;
  block[4] = self;
  v10 = v3;
  v11 = v4;
  v7 = v4;
  v8 = v3;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);

}

@end
