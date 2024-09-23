@implementation MapsAppTestGuidance

- (MapsAppTestGuidance)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8;
  MapsAppTestGuidance *v9;
  objc_super v11;

  v8 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MapsAppTestGuidance;
  v9 = -[MapsAppTest initWithApplication:testName:options:](&v11, "initWithApplication:testName:options:", a3, a4, v8);
  if (v9)
    v9->_swipeCount = (int64_t)objc_msgSend(v8, "_mapstest_guidanceStepSwipeCount");

  return v9;
}

- (void)cleanup:(BOOL)a3
{
  NSTimer *guidanceTimer;

  if (-[NSTimer isValid](self->_guidanceTimer, "isValid", a3))
  {
    -[NSTimer invalidate](self->_guidanceTimer, "invalidate");
    guidanceTimer = self->_guidanceTimer;
    self->_guidanceTimer = 0;

  }
}

- (BOOL)runTest
{
  dispatch_time_t v4;
  _QWORD block[5];
  _QWORD v6[5];
  objc_super v7;
  _QWORD v8[5];

  if (-[MapsAppTest isRunningOnCarPlay](self, "isRunningOnCarPlay"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1007A6184;
    v8[3] = &unk_1011AD1C0;
    v8[4] = self;
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsTestingDidEndGuidanceOrStepping"), 0, v8);
    v7.receiver = self;
    v7.super_class = (Class)MapsAppTestGuidance;
    return -[MapsAppTestRoute runTest](&v7, "runTest");
  }
  else
  {
    -[MapsAppTest setupForVKTest](self, "setupForVKTest");
    -[MapsAppTestRoute registerGEOSubtestsForRouting](self, "registerGEOSubtestsForRouting");
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1007A61B4;
    v6[3] = &unk_1011AD1C0;
    v6[4] = self;
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsTestingDidEndGuidanceOrStepping"), 0, v6);
    v4 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007A61E4;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
    return 1;
  }
}

- (void)doAfterSubTestForDisplayingRoutes
{
  -[MapsAppTestGuidance performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_enterGuidanceNavOrSteppingMode", 0, 3.0);
}

- (void)_enterGuidanceNavOrSteppingMode
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007A62B8;
  v4[3] = &unk_1011AD1C0;
  v4[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsTestingMapsRegionUpdatedWithGuidanceStep"), 0, v4);
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("guidanceStartToFirstStepShown"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestStartNavigation");

}

- (id)_subTestNameForGoingToGuidanceStep:(int64_t)a3 forSwipeCount:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;

  if (a4 == a3)
    v6 = CFSTR("gotoStep_Last");
  else
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%ld"), CFSTR("gotoStep_"), a3, v4, v5));
  return v6;
}

- (void)_guidanceOrSteppingDidShowFirstSign
{
  id v3;
  NSObject *v4;
  void *v5;
  NSTimer *v6;
  NSTimer *guidanceTimer;
  _QWORD v8[4];
  id v9;
  id buf[2];

  v3 = sub_100431E3C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MapsAppTestGuidance - _guidanceOrSteppingDidShowFirstSign", (uint8_t *)buf, 2u);
  }

  if (-[MapsAppTestGuidance _testIsStepping](self, "_testIsStepping"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
    if (objc_msgSend(v5, "pptTestSupportStepping")
      && objc_msgSend(v5, "pptTestHasNextStep"))
    {
      -[MapsAppTestGuidance _gotoNextStepAfterDelay:](self, "_gotoNextStepAfterDelay:", 2.0);
    }
    else
    {
      -[MapsAppTestGuidance _doAfterSubTestForShowingSign](self, "_doAfterSubTestForShowingSign");
    }

  }
  else
  {
    -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("guidanceAfterFirstStepShown"));
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_doAfterSubTestForShowingSign", 0, 0, 3.0));
    guidanceTimer = self->_guidanceTimer;
    self->_guidanceTimer = v6;

    objc_initWeak(buf, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1007A64D4;
    v8[3] = &unk_1011AD288;
    objc_copyWeak(&v9, buf);
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsPPTGuidanceWillUpdateNotifcation"), 0, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

- (void)willUpdateNavigationSign
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = sub_100431E3C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MapsAppTestGuidance - willUpdateNavigationSign", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007A6604;
  v5[3] = &unk_1011AD1C0;
  v5[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsPPTGuidanceDidUpdateNotifcation"), 0, v5);
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("guidanceMakeTurn"));
}

- (void)_gotoNextStepAfterDelay:(double)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  dispatch_time_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v5 = sub_100431E3C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MapsAppTestGuidance - _gotoNextStep", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v8 = objc_msgSend(v7, "pptTestCurrentStepIndex");
  if ((objc_msgSend(v7, "pptTestHasNextStep") & 1) != 0)
  {
    if ((uint64_t)v8 >= -[MapsAppTestGuidance swipeCount](self, "swipeCount"))
    {
      -[MapsAppTest failedTest](self, "failedTest");
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1007A67B8;
      v13[3] = &unk_1011AD1C0;
      v13[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsTestingSteppingSignDidChange"), 0, v13);
      v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1007A67C0;
      v10[3] = &unk_1011B15B0;
      v12 = v8;
      v10[4] = self;
      v11 = v7;
      dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v10);

    }
  }
  else
  {
    -[MapsAppTestGuidance _doAfterSubTestForShowingSign](self, "_doAfterSubTestForShowingSign");
  }

}

- (void)_steppingSignDidChange
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12[3];
  id buf[2];

  v3 = sub_100431E3C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MapsAppTestGuidance - _steppingSignDidChange", (uint8_t *)buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v6 = objc_msgSend(v5, "pptTestCurrentStepIndex");

  v7 = -[MapsAppTestGuidance swipeCount](self, "swipeCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestGuidance _subTestNameForGoingToGuidanceStep:forSwipeCount:](self, "_subTestNameForGoingToGuidanceStep:forSwipeCount:", v6, v7));
  objc_initWeak(buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1007A6988;
  v10[3] = &unk_1011C6A48;
  objc_copyWeak(v12, buf);
  v9 = v8;
  v11 = v9;
  v12[1] = v7;
  v12[2] = v6;
  -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(buf);

}

- (void)_doAfterSubTestForShowingSign
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007A6B1C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_endGuidanceNavOrSteppingMode
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_100431E3C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MapsAppTestGuidance - _endGuidanceNavOrSteppingMode", v6, 2u);
  }

  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("guidanceAfterFirstStepShown"));
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("guidanceEnd"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v5, "pptTestEndNavigation");

}

- (unint64_t)expandedTrayLayout
{
  return 1;
}

- (unint64_t)collapsedTrayLayout
{
  return 0;
}

- (void)_runPlayWithTraySubtest
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = sub_100431E3C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MapsAppTestGuidance - _runPlayWithTraySubtest", buf, 2u);
  }

  if (-[MapsAppTest canUpdateTrayLayout](self, "canUpdateTrayLayout"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1007A6CA8;
    v5[3] = &unk_1011AC860;
    v5[4] = self;
    -[MapsAppTest updateTrayLayout:withSubtestName:animated:completion:](self, "updateTrayLayout:withSubtestName:animated:completion:", -[MapsAppTestGuidance expandedTrayLayout](self, "expandedTrayLayout"), CFSTR("NavigationExpandTray"), 1, v5);
  }
  else
  {
    -[MapsAppTest failedTest](self, "failedTest");
  }
}

- (BOOL)_testIsStepping
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("guidanceStepping")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
    v4 = objc_msgSend(v5, "hasSuffix:", CFSTR("transit"));

  }
  return v4;
}

- (int64_t)swipeCount
{
  return self->_swipeCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceTimer, 0);
}

@end
