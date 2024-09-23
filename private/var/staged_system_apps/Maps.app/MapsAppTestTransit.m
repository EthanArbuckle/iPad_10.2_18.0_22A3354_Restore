@implementation MapsAppTestTransit

- (void)_doAfterSubTestForShowingSign
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 1000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100518C34;
  v3[3] = &unk_1011AD260;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_performRTTest
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  NSTimer *v8;
  NSTimer *updateTimeout;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id buf[2];
  objc_super v24;

  v3 = sub_100431E3C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MapsAppTestTransit - _performRTTest", (uint8_t *)buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v6 = objc_msgSend(v5, "pptTestMoveToBoardStep");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
    objc_msgSend(v7, "pptTestPauseRealtimeTransitUpdates");

    objc_initWeak(buf, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100518FE0;
    v21[3] = &unk_1011AD288;
    objc_copyWeak(&v22, buf);
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsTestingTransitRouteUpdateWillUpdateRoute"), 0, v21);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100519028;
    v19[3] = &unk_1011AD288;
    objc_copyWeak(&v20, buf);
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsTestingTransitRouteUpdateDidUpdateRoute"), 0, v19);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100519070;
    v17[3] = &unk_1011AD288;
    objc_copyWeak(&v18, buf);
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsTestingTransitRouteUpdateWillUpdateDetails"), 0, v17);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1005190B8;
    v15[3] = &unk_1011AD288;
    objc_copyWeak(&v16, buf);
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsTestingTransitRouteUpdateDidUpdateDetails"), 0, v15);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100519138;
    v13[3] = &unk_1011ADF20;
    objc_copyWeak(&v14, buf);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v13, 5.0));
    updateTimeout = self->_updateTimeout;
    self->_updateTimeout = v8;

    v10 = dispatch_time(0, 1000000000);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100519164;
    v11[3] = &unk_1011AD260;
    objc_copyWeak(&v12, buf);
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(buf);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)MapsAppTestTransit;
    -[MapsAppTestGuidance _doAfterSubTestForShowingSign](&v24, "_doAfterSubTestForShowingSign");
  }
}

- (void)_handleSuperDoAfterSubTestForShowingSign
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MapsAppTestTransit;
  -[MapsAppTestGuidance _doAfterSubTestForShowingSign](&v2, "_doAfterSubTestForShowingSign");
}

- (unint64_t)expandedTrayLayout
{
  return 2;
}

- (unint64_t)collapsedTrayLayout
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimeout, 0);
}

@end
