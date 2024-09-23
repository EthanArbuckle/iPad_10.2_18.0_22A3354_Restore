@implementation RotationTest

- (id)_subTestNameForTargetInterfaceOrientation:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("RotateToPortrait");
  else
    return CFSTR("RotateToLandscape");
}

- (id)delaySubTestName
{
  return CFSTR("Delay");
}

- (RotationTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5
{
  id v8;
  RotationTest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RotationTest;
  v9 = -[ApplicationTest initWithApplication:model:options:](&v15, "initWithApplication:model:options:", a3, a4, v8);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("iterations")));
    v11 = v10;
    if (v10)
      v9->_iterations = (unint64_t)objc_msgSend(v10, "integerValue");
    else
      v9->_inputInvalid = 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RotationTest rotationAnimationStartedNotificationName](v9, "rotationAnimationStartedNotificationName"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RotationTest rotationAnimationCompleteNotificationName](v9, "rotationAnimationCompleteNotificationName"));
      v9->_useNotifications = v13 != 0;

    }
    else
    {
      v9->_useNotifications = 0;
    }

  }
  return v9;
}

- (id)rotationAnimationStartedNotificationName
{
  return 0;
}

- (id)rotationAnimationCompleteNotificationName
{
  return 0;
}

- (id)checkTestPreconditions
{
  return 0;
}

- (void)runTest
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;
  _QWORD v17[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RotationTest checkTestPreconditions](self, "checkTestPreconditions"));
  v5 = objc_msgSend((id)objc_opt_class(self), "testName");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (self->_inputInvalid)
  {
    objc_msgSend(v3, "startedTest:", v6);
    objc_msgSend(v3, "failedTest:withFailure:", v6, CFSTR("input invalid was marked as true when trying to run test"));
  }
  else if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Test precondition not met: %@"), v4));
    objc_msgSend(v3, "startedTest:", v6);
    objc_msgSend(v3, "failedTest:withFailure:", v6, v7);

  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
    v16 = (void *)v8;
    objc_msgSend(v9, "setSelectedDate:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootNavigationController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "windowScene"));
    v15 = (char *)objc_msgSend(v14, "interfaceOrientation");

    if ((unint64_t)(v15 - 1) > 1)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10005028C;
      v17[3] = &unk_1001B25D0;
      v17[4] = self;
      objc_msgSend(UIApp, "rotateIfNeeded:completion:", 1, v17);
    }
    else
    {
      -[RotationTest _startTest](self, "_startTest");
    }

  }
}

- (void)_startTest
{
  id v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = objc_msgSend((id)objc_opt_class(self), "testName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  -[RotationTest _setupViewToDate:](self, "_setupViewToDate:", v5);
  v6 = dispatch_time(0, 4000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005035C;
  v8[3] = &unk_1001B26A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);

}

- (void)_finishTest
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_msgSend((id)objc_opt_class(self), "testName");
  v6 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v4, "finishedTest:waitForCommit:extraResults:", v6, 1, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)_rotationTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  int64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  if (self->_iterations)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootNavigationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
    v8 = (char *)objc_msgSend(v7, "interfaceOrientation");

    if ((unint64_t)(v8 - 3) < 2)
      v9 = 1;
    else
      v9 = 4;
    --self->_iterations;
    self->_currentTargetOrientation = v9;
    v10 = objc_msgSend((id)objc_opt_class(self), "testName");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (self->_useNotifications)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RotationTest delaySubTestName](self, "delaySubTestName"));
      objc_msgSend(v12, "startedSubTest:forTest:", v13, v11);

    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005066C;
    v14[3] = &unk_1001B25D0;
    v14[4] = self;
    objc_msgSend(UIApp, "rotateIfNeeded:completion:", v9, v14);

  }
  else
  {
    -[RotationTest _finishTest](self, "_finishTest");
  }
}

- (void)_rotationAnimationStarted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = objc_msgSend((id)objc_opt_class(self), "testName");
  v9 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RotationTest _subTestNameForTargetInterfaceOrientation:](self, "_subTestNameForTargetInterfaceOrientation:", self->_currentTargetOrientation));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RotationTest delaySubTestName](self, "delaySubTestName"));
  objc_msgSend(v6, "finishedSubTest:forTest:waitForCommit:", v7, v9, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v8, "startedSubTest:forTest:", v5, v9);

}

- (void)_rotationAnimationCompleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  v4 = objc_msgSend((id)objc_opt_class(self), "testName");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RotationTest _subTestNameForTargetInterfaceOrientation:](self, "_subTestNameForTargetInterfaceOrientation:", self->_currentTargetOrientation));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v7, "finishedSubTest:forTest:waitForCommit:", v6, v5, 0);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050864;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_setupViewToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootNavigationController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resetToYearView"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  objc_msgSend(v8, "showDate:animated:", v7, 0);

}

@end
