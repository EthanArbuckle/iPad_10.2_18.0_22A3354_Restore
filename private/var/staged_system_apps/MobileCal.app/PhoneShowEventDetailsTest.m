@implementation PhoneShowEventDetailsTest

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
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v3 = objc_msgSend((id)objc_opt_class(self), "testName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend((id)objc_opt_class(self), "_delaySubTestName");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend((id)objc_opt_class(self), "_animationSubTestName");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneShowEventDetailsTest _eventForTest](self, "_eventForTest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootNavigationController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resetToDayView"));

    objc_msgSend(v13, "reloadData");
    v14 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100038C98;
    block[3] = &unk_1001B2CB0;
    block[4] = self;
    v18 = v4;
    v19 = v6;
    v20 = v9;
    v21 = v8;
    dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    objc_msgSend(v10, "startedTest:", v4);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create event")));
    objc_msgSend(v15, "failedTest:withFailure:", v4, v16);

  }
}

- (void)_detailViewControllerAppeared:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = objc_msgSend((id)objc_opt_class(self), "testName");
  v13 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = objc_msgSend((id)objc_opt_class(self), "_animationSubTestName");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v7, "finishedSubTest:forTest:", v6, v13);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v8, "finishedTest:extraResults:", v13, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneShowEventDetailsTest _eventForTest](self, "_eventForTest"));
  objc_msgSend(v10, "removeEvent:span:error:", v11, 0, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "removeObserver:name:object:", self, EKEventViewControllerDidAppearNotification, 0);

}

- (id)_eventForTest
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038FEC;
  block[3] = &unk_1001B2538;
  block[4] = self;
  if (qword_1001F6090 != -1)
    dispatch_once(&qword_1001F6090, block);
  return (id)qword_1001F6088;
}

@end
