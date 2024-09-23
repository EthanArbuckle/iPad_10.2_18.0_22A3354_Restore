@implementation MapsAppTest

- (void)_presentDirectionDetailsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100230570;
  v7[3] = &unk_1011AD2D0;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTTestTrayDidPresentNotification"), 0, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v6, "pptTestPresentDirectionsDetails");

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (MKMapView)mainMKMapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapViewForPPTTest"));

  return (MKMapView *)v3;
}

- (VKMapView)mainVKMapView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapViewForPPTTest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapLayer"));

  return (VKMapView *)v4;
}

- (void)switchToMapType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v5 = 1;
  switch(a3)
  {
    case 1uLL:
      v5 = 2;
      break;
    case 2uLL:
      break;
    case 3uLL:
      v5 = 6;
      break;
    case 4uLL:
      v5 = 5;
      break;
    default:
      if (a3 == 104)
        v5 = 3;
      else
        v5 = 0;
      break;
  }
  v6 = v4;
  objc_msgSend(v4, "setPPTTestViewMode:animated:", v5, 1);

}

- (void)switchToViewMode:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v4, "setPPTTestViewMode:animated:", a3, 1);

}

- (void)willSetupForVKTest
{
  void *v3;
  id v4;

  if (-[MapsAppTest isRunningOnCarPlay](self, "isRunningOnCarPlay"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
    objc_msgSend(v3, "setUserTrackingMode:animated:", 0, 0);

    v4 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
    objc_msgSend(v4, "setChromeHidden:", 1);

  }
}

- (void)didTearDownForVKTest
{
  id v3;

  if (-[MapsAppTest isRunningOnCarPlay](self, "isRunningOnCarPlay"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
    objc_msgSend(v3, "setChromeHidden:", 0);

  }
}

- (BOOL)isRunningOnCarPlay
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == (id)3;

  return v4;
}

- (PPTTestCoordinatorProtocol)testCoordinator
{
  id AssociatedObject;
  void *v4;
  void *v5;

  AssociatedObject = objc_getAssociatedObject(self, &unk_1014D3998);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testCoordinator"));

    objc_setAssociatedObject(self, &unk_1014D3998, v4, (void *)1);
  }
  return (PPTTestCoordinatorProtocol *)v4;
}

- (void)resizingTestWithCompletion:(id)a3
{
  -[MapsAppTest resizingTestAndSubTestsWithPrefix:completion:](self, "resizingTestAndSubTestsWithPrefix:completion:", 0, a3);
}

- (void)resizingTestAndSubTestsWithPrefix:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("_Latency")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("_Animation")));

  -[MapsAppTest _resizingTestWithNumberOfRounds:latencySubTestName:animationSubTestName:completion:](self, "_resizingTestWithNumberOfRounds:latencySubTestName:animationSubTestName:completion:", 10, v9, v8, v6);
}

- (void)_resizingTestWithNumberOfRounds:(unint64_t)a3 latencySubTestName:(id)a4 animationSubTestName:(id)a5 completion:(id)a6
{
  -[MapsAppTest _resizingTestWithCount:numbeorOfRounds:latencySubTestName:animationSubTestName:completion:](self, "_resizingTestWithCount:numbeorOfRounds:latencySubTestName:animationSubTestName:completion:", 0, a3, a4, a5, a6);
}

- (void)_resizingTestWithCount:(unint64_t)a3 numbeorOfRounds:(unint64_t)a4 latencySubTestName:(id)a5 animationSubTestName:(id)a6 completion:(id)a7
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  MapsAppTest *v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100908D98;
  v12[3] = &unk_1011DBB18;
  v17 = a3 + 1;
  v18 = a4;
  v13 = self;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v9 = v16;
  v10 = v15;
  v11 = v14;
  -[MapsAppTest _resizingTrayWithLatencySubTestName:animationSubTestName:completion:](v13, "_resizingTrayWithLatencySubTestName:animationSubTestName:completion:", v11, v10, v12);

}

- (void)_resizingTrayWithLatencySubTestName:(id)a3 animationSubTestName:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  MapsAppTest *v11;
  id v12;
  id v13;
  id v14;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100908E9C;
  v10[3] = &unk_1011B4320;
  v11 = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v7 = v14;
  v8 = v13;
  v9 = v12;
  -[MapsAppTest _updateTrayLayout:animated:latencySubTestName:animationSubTestName:completion:](v11, "_updateTrayLayout:animated:latencySubTestName:animationSubTestName:completion:", 0, 1, v9, v8, v10);

}

- (BOOL)canUpdateTrayLayout
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v3 = objc_msgSend(v2, "pptTestCanUpdateTrayLayout");

  return v3;
}

- (void)updateTrayLayout:(unint64_t)a3 withSubtestName:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100909328;
  v14[3] = &unk_1011AECC0;
  v14[4] = self;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[MapsAppTest updateTrayLayout:animated:completion:](self, "updateTrayLayout:animated:completion:", a3, v7, v14);

}

- (void)_updateTrayLayout:(unint64_t)a3 animated:(BOOL)a4 latencySubTestName:(id)a5 animationSubTestName:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  char v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v9 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (objc_msgSend(v12, "length") && objc_msgSend(v13, "length"))
  {
    -[MapsAppTest startedSubTest:](self, "startedSubTest:", v12);
    v15 = (void *)UIApp;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1009094D8;
    v23[3] = &unk_1011AD238;
    v23[4] = self;
    v24 = v12;
    v25 = v13;
    objc_msgSend(v15, "installCACommitCompletionBlock:", v23);

    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100909508;
  v19[3] = &unk_1011BE4E8;
  v22 = v16;
  v19[4] = self;
  v20 = v13;
  v21 = v14;
  v17 = v14;
  v18 = v13;
  -[MapsAppTest updateTrayLayout:animated:completion:](self, "updateTrayLayout:animated:completion:", a3, v9, v19);

}

- (void)updateTrayLayout:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);

  v5 = a4;
  v8 = (void (**)(_QWORD))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v9, "userInterfaceIdiom") == (id)5)
  {

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
    v11 = objc_msgSend(v10, "pptTestCanUpdateTrayLayout");

    if ((v11 & 1) != 0)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100909678;
      v13[3] = &unk_1011B5B38;
      v14 = v8;
      +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTTestTrayLayoutDidUpdateNotification"), 0, v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
      objc_msgSend(v12, "pptTestUpdateTrayLayout:animated:", a3, v5);

      goto LABEL_7;
    }
  }
  if (v8)
    v8[2](v8);
LABEL_7:

}

- (void)presentDismissTrayTestWithPresenter:(id)a3 completion:(id)a4
{
  -[MapsAppTest presentDismissTrayTestAndSubTestsWithPrefix:presenter:completion:](self, "presentDismissTrayTestAndSubTestsWithPrefix:presenter:completion:", 0, a3, a4);
}

- (void)presentDismissTrayTestAndSubTestsWithPrefix:(id)a3 presenter:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("_Latency")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("_Animation")));

  -[MapsAppTest _presentDismissTrayTestWithNumberOfRounds:latencySubTestName:animationSubTestName:presenter:completion:](self, "_presentDismissTrayTestWithNumberOfRounds:latencySubTestName:animationSubTestName:presenter:completion:", 10, v12, v11, v9, v8);
}

- (void)_presentDismissTrayTestWithNumberOfRounds:(unint64_t)a3 latencySubTestName:(id)a4 animationSubTestName:(id)a5 presenter:(id)a6 completion:(id)a7
{
  -[MapsAppTest _presentDismissTrayTestWithCount:numberOfRounds:latencySubTestName:animationSubTestName:presenter:completion:](self, "_presentDismissTrayTestWithCount:numberOfRounds:latencySubTestName:animationSubTestName:presenter:completion:", 0, a3, a4, a5, a6, a7);
}

- (void)_presentDismissTrayTestWithCount:(unint64_t)a3 numberOfRounds:(unint64_t)a4 latencySubTestName:(id)a5 animationSubTestName:(id)a6 presenter:(id)a7 completion:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  MapsAppTest *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  unint64_t v22;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100909880;
  v15[3] = &unk_1011DBB40;
  v21 = a3 + 1;
  v22 = a4;
  v16 = self;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v11 = v20;
  v12 = v19;
  v13 = v18;
  v14 = v17;
  -[MapsAppTest _presentDismissTrayTestWithLatencySubTestName:animationSubTestName:presenter:completion:](v16, "_presentDismissTrayTestWithLatencySubTestName:animationSubTestName:presenter:completion:", v14, v13, v12, v15);

}

- (void)_presentDismissTrayTestWithLatencySubTestName:(id)a3 animationSubTestName:(id)a4 presenter:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  id v13;
  _BOOL4 v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a5;
  v13 = a6;
  if (objc_msgSend(v10, "length"))
    v14 = objc_msgSend(v11, "length") != 0;
  else
    v14 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100909A60;
  v22[3] = &unk_1011DBB90;
  v26 = v14;
  v22[4] = self;
  v15 = v11;
  v23 = v15;
  v16 = v10;
  v24 = v16;
  v17 = v13;
  v25 = v17;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTTestTrayDidPresentNotification"), 0, v22);
  if (v14)
  {
    -[MapsAppTest startedSubTest:](self, "startedSubTest:", v16);
    v18 = (void *)UIApp;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100909CEC;
    v19[3] = &unk_1011AD238;
    v19[4] = self;
    v20 = v16;
    v21 = v15;
    objc_msgSend(v18, "installCACommitCompletionBlock:", v19);

  }
  if (v12)
    v12[2](v12);

}

- (void)dismissTrayWithSubtestName:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100909DA4;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[MapsAppTest dismissTrayWithCompletion:](self, "dismissTrayWithCompletion:", v7);

}

- (void)dismissTrayWithCompletion:(id)a3
{
  -[MapsAppTest dismissTrayWithAssertTrayType:completion:](self, "dismissTrayWithAssertTrayType:completion:", 0, a3);
}

- (void)dismissTrayWithAssertTrayType:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100909E74;
  v8[3] = &unk_1011B5B38;
  v9 = a4;
  v6 = v9;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTTestTrayDidDismissNotification"), 0, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v7, "pptTestDismissTrayAnimated:assertTrayType:", 1, a3);

}

- (void)popToRootTrayWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v6 = objc_msgSend(v5, "pptTestIsTrayType:", 2);

  if (v6)
  {
    if (!-[MapsAppTest isRunningOnCarPlay](self, "isRunningOnCarPlay"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
      objc_msgSend(v7, "pptTestSearchCancel");

    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100909FA4;
    v13[3] = &unk_1011ADA00;
    v14 = v4;
    v8 = v4;
    -[MapsAppTest updateTrayLayout:animated:completion:](self, "updateTrayLayout:animated:completion:", 1, 1, v13);
    v9 = v14;
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100909FB8;
    v11[3] = &unk_1011AE240;
    v11[4] = self;
    v12 = v4;
    v10 = v4;
    -[MapsAppTest dismissTrayWithAssertTrayType:completion:](self, "dismissTrayWithAssertTrayType:completion:", 0, v11);
    v9 = v12;
  }

}

- (void)rotateDeviceWithSubtestName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10090A078;
  v10[3] = &unk_1011AECC0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MapsAppTest rotateDeviceWithCompletion:](self, "rotateDeviceWithCompletion:", v10);

}

- (void)rotateDeviceWithCompletion:(id)a3
{
  id v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  Block_layout *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10090A1CC;
  v10[3] = &unk_1011B5B38;
  v3 = a3;
  v11 = v3;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTTestOrientationDidRotateNotification"), 0, v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = (char *)objc_msgSend(v4, "orientation");

  if ((unint64_t)(v5 - 3) < 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = v6;
    v8 = &stru_1011DBBD0;
    v9 = 1;
    goto LABEL_5;
  }
  if ((unint64_t)(v5 - 1) <= 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = v6;
    v8 = &stru_1011DBBB0;
    v9 = 4;
LABEL_5:
    objc_msgSend(v6, "rotateIfNeeded:completion:", v9, v8);

  }
}

- (MapsAppTest)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  MapsAppTest *v12;
  MapsAppTest *v13;
  NSString *v14;
  NSString *testName;
  NSDictionary *v16;
  NSDictionary *options;
  NSMutableDictionary *v18;
  NSMutableDictionary *results;
  NSMutableArray *v20;
  NSMutableArray *fullyDrawnCallbacks;
  MapsAppTest *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "length"))
  {
    v24.receiver = self;
    v24.super_class = (Class)MapsAppTest;
    v12 = -[MapsAppTest init](&v24, "init");
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_app, a3);
      v14 = (NSString *)objc_msgSend(v10, "copy");
      testName = v13->_testName;
      v13->_testName = v14;

      v16 = (NSDictionary *)objc_msgSend(v11, "copy");
      options = v13->_options;
      v13->_options = v16;

      v18 = objc_opt_new(NSMutableDictionary);
      results = v13->_results;
      v13->_results = v18;

      v20 = objc_opt_new(NSMutableArray);
      fullyDrawnCallbacks = v13->_fullyDrawnCallbacks;
      v13->_fullyDrawnCallbacks = v20;

    }
    self = v13;
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)runTest
{
  return 0;
}

- (void)cleanup:(BOOL)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v5, "reset");

  -[NSMutableDictionary removeAllObjects](self->_results, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_fullyDrawnCallbacks, "removeAllObjects");
  -[MapsAppTest didTearDownForVKTest](self, "didTearDownForVKTest");
}

- (void)startedTest
{
  id v3;
  NSObject *v4;
  NSString *testName;
  int v6;
  NSString *v7;

  v3 = sub_100431E3C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    testName = self->_testName;
    v6 = 138412290;
    v7 = testName;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "test", "testName=%@", (uint8_t *)&v6, 0xCu);
  }

  -[MapsAppTesting startedTest:](self->_app, "startedTest:", self->_testName);
}

- (void)startedSubTest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_100431E3C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    v7 = 138412290;
    v8 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "subTest", "testName=%@", (uint8_t *)&v7, 0xCu);
  }

  -[MapsAppTesting startedSubTest:forTest:](self->_app, "startedSubTest:forTest:", v4, self->_testName);
}

- (void)startedSerialSubTest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_100431E3C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    v7 = 138412290;
    v8 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "subTest", "testName=%@", (uint8_t *)&v7, 0xCu);
  }

  -[MapsAppTesting startedSubTest:forTest:](self->_app, "startedSubTest:forTest:", v4, self->_testName);
}

- (void)startedSubTest:(id)a3 withMetrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = sub_100431E3C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    v10 = 138412290;
    v11 = v6;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "subTest", "testName=%@", (uint8_t *)&v10, 0xCu);
  }

  -[MapsAppTesting startedSubTest:forTest:withMetrics:](self->_app, "startedSubTest:forTest:withMetrics:", v6, self->_testName, v7);
}

- (void)finishedSubTest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  -[MapsAppTesting finishedSubTest:forTest:](self->_app, "finishedSubTest:forTest:", v4, self->_testName);
  v5 = sub_100431E3C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    v7 = 138412290;
    v8 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "subTest", "testName=%@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)finishedSerialSubTest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char *currentSubTestIndex;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;

  v21 = a3;
  -[MapsAppTesting finishedSubTest:forTest:](self->_app, "finishedSubTest:forTest:");
  v4 = sub_100431E3C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v21;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "subTest", "testName=%@", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v6, "disableTestStatistics");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "testStatistics"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v9, "resetTestStatistics");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v21, v15));
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest serialSubTests](self, "serialSubTests"));
  if (objc_msgSend(v19, "count")
    && (currentSubTestIndex = (char *)self->_currentSubTestIndex,
        currentSubTestIndex < (char *)objc_msgSend(v19, "count") - 1))
  {
    ++self->_currentSubTestIndex;
    -[MapsAppTest runSerialSubTestAtIndex:](self, "runSerialSubTestAtIndex:");
  }
  else
  {
    -[MapsAppTest finishedTest](self, "finishedTest");
  }

}

- (void)finishedTest
{
  -[MapsAppTest finishedTestWithExtraResults:](self, "finishedTestWithExtraResults:", 0);
}

- (void)finishedTestWithExtraResults:(id)a3
{
  id v4;
  NSMutableDictionary *results;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSString *testName;
  int v13;
  NSString *v14;
  const __CFString *v15;
  void *v16;

  v4 = a3;
  results = self->_results;
  v15 = CFSTR("tilegroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeTileGroup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "identifier")));
  v16 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  -[NSMutableDictionary addEntriesFromDictionary:](results, "addEntriesFromDictionary:", v9);

  if (v4)
    -[NSMutableDictionary addEntriesFromDictionary:](self->_results, "addEntriesFromDictionary:", v4);
  -[MapsAppTesting finishedTest:extraResults:](self->_app, "finishedTest:extraResults:", self->_testName, self->_results);
  v10 = sub_100431E3C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    testName = self->_testName;
    v13 = 138412290;
    v14 = testName;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "test", "testName=%@ status=success", (uint8_t *)&v13, 0xCu);
  }

}

- (void)failedTest
{
  id v3;
  NSObject *v4;
  NSString *testName;
  int v6;
  NSString *v7;

  -[MapsAppTesting failedTest:](self->_app, "failedTest:", self->_testName);
  v3 = sub_100431E3C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    testName = self->_testName;
    v6 = 138412290;
    v7 = testName;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "test", "testName=%@ status=failed", (uint8_t *)&v6, 0xCu);
  }

}

- (void)failedTestWithReason:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSString *testName;
  int v8;
  NSString *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  -[MapsAppTesting failedTest:withFailure:](self->_app, "failedTest:withFailure:", self->_testName, v4);
  v5 = sub_100431E3C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    testName = self->_testName;
    v8 = 138412546;
    v9 = testName;
    v10 = 2112;
    v11 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "test", "testName=%@ status=failed reason=%@", (uint8_t *)&v8, 0x16u);
  }

}

- (NSArray)serialSubTests
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_mapstest_serialSubTests"));

  return (NSArray *)v3;
}

- (void)runSerialSubTestAtIndex:(unint64_t)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  NSString *v8;
  SEL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest serialSubTests](self, "serialSubTests"));
  v5 = (unint64_t)objc_msgSend(v15, "count") > a3;
  v6 = v15;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", a3));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("selector")));
    v9 = NSSelectorFromString(v8);

    if ((objc_opt_respondsToSelector(self, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("options")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("subTestName")));

      if (!v11)
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("selector")));
      if (objc_msgSend(v11, "hasSuffix:", CFSTR(":")))
      {
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringToIndex:", (char *)objc_msgSend(v11, "length") - 1));

        v11 = (void *)v12;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
      self->_currentSubTestStartTime = CACurrentMediaTime();
      -[MapsAppTest startedSerialSubTest:](self, "startedSerialSubTest:", v11);
      objc_msgSend(v13, "enableTestStatistics");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("options")));
      -[MapsAppTest performSelector:withObject:](self, "performSelector:withObject:", v9, v14);

    }
    v6 = v15;
  }

}

- (void)onFullyDrawn:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  unsigned int v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  v6 = objc_msgSend(v5, "isFullyDrawn");
  v7 = sub_100431E3C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "onFullyDrawn:", (uint8_t *)&v10, 2u);
    }

    -[MapsAppTest vkMapViewFullyDrawn:](self, "vkMapViewFullyDrawn:", v5);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412546;
      v11 = v4;
      v12 = 1024;
      v13 = objc_msgSend(v5, "isFullyDrawn");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "onFullyDrawn is called when mapView is not fully drawn. Notification: %@, [mapView isFullyDrawn] : %d", (uint8_t *)&v10, 0x12u);
    }

  }
}

- (void)vkMapViewFullyDrawn:(id)a3
{
  void *v3;
  void (**v5)(_QWORD);
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  void (**v13)(_QWORD);
  id v14;
  NSObject *v15;
  void (**v16)(_QWORD);
  __int128 v17;
  uint8_t buf[4];
  void (**v19)(_QWORD);
  __int16 v20;
  void *v21;
  __int16 v22;
  unsigned int v23;

  v5 = (void (**)(_QWORD))a3;
  if (!v5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
    if (objc_msgSend(v3, "isFullyDrawn"))
    {

LABEL_10:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v11, "removeObserver:name:object:", self, VKMapViewDidBecomeFullyDrawnNotification, 0);

      if (-[NSMutableArray count](self->_fullyDrawnCallbacks, "count"))
      {
        *(_QWORD *)&v12 = 138412290;
        v17 = v12;
        do
        {
          v13 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_fullyDrawnCallbacks, "firstObject", v17));
          -[NSMutableArray removeObjectAtIndex:](self->_fullyDrawnCallbacks, "removeObjectAtIndex:", 0);
          v14 = sub_100431E3C();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = objc_retainBlock(v13);
            *(_DWORD *)buf = v17;
            v19 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Invoking callback: %@", buf, 0xCu);

          }
          v13[2](v13);

        }
        while (-[NSMutableArray count](self->_fullyDrawnCallbacks, "count"));
      }
      goto LABEL_15;
    }
  }
  v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));

  if (!v5)
  if (v6 == v5)
    goto LABEL_10;
  v7 = sub_100431E3C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
    *(_DWORD *)buf = 138412802;
    v19 = v5;
    v20 = 2112;
    v21 = v9;
    v22 = 1024;
    v23 = objc_msgSend(v10, "isFullyDrawn");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "vkMapViewFullyDrawn: but not calling back! mapView: %@ mainVKMapView: %@ isFullyDrawn: %d", buf, 0x1Cu);

  }
LABEL_15:

}

- (void)addFullyDrawnCallback:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSMutableArray *fullyDrawnCallbacks;
  id v9;
  id v10;
  dispatch_time_t v11;
  _QWORD block[5];
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = sub_100431E3C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_retainBlock(v4);
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Adding FullyDrawnCallback: %@", buf, 0xCu);

  }
  fullyDrawnCallbacks = self->_fullyDrawnCallbacks;
  v9 = objc_msgSend(v4, "copy");
  v10 = objc_retainBlock(v9);
  -[NSMutableArray addObject:](fullyDrawnCallbacks, "addObject:", v10);

  v11 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009140B4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)setupFullyDrawnNotification:(SEL)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, a3, VKMapViewDidBecomeFullyDrawnNotification, 0);

}

- (void)setupForVKTestWithMapView:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;

  v4 = a3;
  -[MapsAppTest willSetupForVKTest](self, "willSetupForVKTest");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v10 = 0uLL;
  objc_msgSend(v5, "_mapstest_getSelectedFeatures:disabled:", &v10, (char *)&v10 + 8);
  v6 = *((_QWORD *)&v10 + 1);
  if (v10 != 0)
  {
    if ((_QWORD)v10)
    {
      v6 = ~(_QWORD)v10;
      *((_QWORD *)&v10 + 1) = ~(_QWORD)v10;
    }
    if (((v6 | v10) & 0x80) != 0)
    {
      objc_msgSend(v4, "setTrafficEnabled:", (v6 & 0x80) == 0);
      v6 = *((_QWORD *)&v10 + 1);
    }
    objc_msgSend(v4, "setDisablePolygons:", (v6 >> 3) & 1);
    objc_msgSend(v4, "setDisableRoads:", (*((_QWORD *)&v10 + 1) >> 1) & 1);
    objc_msgSend(v4, "setDisableLabels:", (*((_QWORD *)&v10 + 1) >> 2) & 1);
    objc_msgSend(v4, "setDisableBuildingFootprints:", (*((_QWORD *)&v10 + 1) >> 4) & 1);
    objc_msgSend(v4, "setDisableRasters:", (*((_QWORD *)&v10 + 1) >> 5) & 1);
    objc_msgSend(v4, "setDisableGrid:", (*((_QWORD *)&v10 + 1) >> 6) & 1);
    objc_msgSend(v4, "setDisableTransitLines:", (*((_QWORD *)&v10 + 1) >> 8) & 1);
  }
  if (objc_msgSend(v5, "_mapstest_hasMapType"))
    objc_msgSend(v5, "_mapstest_hasViewMode");
  if (objc_msgSend(v5, "_mapstest_hasViewMode"))
    -[MapsAppTest switchToViewMode:](self, "switchToViewMode:", objc_msgSend(v5, "_mapstest_viewMode"));
  else
    -[MapsAppTest switchToMapType:](self, "switchToMapType:", objc_msgSend(v5, "_mapstest_mapType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("selectedFeatureId")));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v7));
    v9 = 0;
    objc_msgSend(v8, "scanUnsignedLongLong:", &v9);
    objc_msgSend(v4, "setSelectedFeatureId:", v9);

  }
  else
  {
    objc_msgSend(v4, "deselectFeatureId");
  }

}

- (void)setupForVKTest
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  -[MapsAppTest setupForVKTestWithMapView:](self, "setupForVKTestWithMapView:", v3);

}

- (void)registerGEOManifestSubtests
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_Manifest:", CFSTR("GEOPPTTest_ManifestBEGIN"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_Manifest:", CFSTR("GEOPPTTest_ManifestEND"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v5, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_Manifest"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_Manifest_SetupConnection:", CFSTR("GEOPPTTest_Manifest_SetupConnectionBEGIN"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_Manifest_SetupConnection:", CFSTR("GEOPPTTest_Manifest_SetupConnectionEND"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v8, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_Manifest_SetupConnection"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_Manifest_Update:", CFSTR("GEOPPTTest_Manifest_UpdateBEGIN"), 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_Manifest_Update:", CFSTR("GEOPPTTest_Manifest_UpdateEND"), 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v11, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_Manifest_Update"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_Manifest_ForcedUpdate:", CFSTR("GEOPPTTest_Manifest_ForcedUpdateBEGIN"), 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_Manifest_ForcedUpdate:", CFSTR("GEOPPTTest_Manifest_ForcedUpdateEND"), 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v14, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_Manifest_ForcedUpdate"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_Manifest_GetResourceManifest:", CFSTR("GEOPPTTest_Manifest_GetResourceManifestBEGIN"), 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_Manifest_GetResourceManifest:", CFSTR("GEOPPTTest_Manifest_GetResourceManifestEND"), 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v17, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_Manifest_GetResourceManifest"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v18, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_Manifest_SetManifestToken:", CFSTR("GEOPPTTest_Manifest_SetManifestTokenBEGIN"), 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v19, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_Manifest_SetManifestToken:", CFSTR("GEOPPTTest_Manifest_SetManifestTokenEND"), 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v20, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_Manifest_SetManifestToken"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v21, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_Manifest_SetActiveTileGroup:", CFSTR("GEOPPTTest_Manifest_SetActiveTileGroupBEGIN"), 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_Manifest_SetActiveTileGroup:", CFSTR("GEOPPTTest_Manifest_SetActiveTileGroupEND"), 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v23, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_Manifest_SetActiveTileGroup"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v24, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_Manifest_ResetActiveTileGroup:", CFSTR("GEOPPTTest_Manifest_ResetActiveTileGroupBEGIN"), 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v25, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_Manifest_ResetActiveTileGroup:", CFSTR("GEOPPTTest_Manifest_ResetActiveTileGroupEND"), 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v26, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_Manifest_ResetActiveTileGroup"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v27, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_Manifest_HandleMessage:", CFSTR("GEOPPTTest_Manifest_HandleMessageBEGIN"), 0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v28, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_Manifest_HandleMessage:", CFSTR("GEOPPTTest_Manifest_HandleMessageEND"), 0);

  v29 = (id)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v29, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_Manifest_HandleMessage"));

}

- (void)willBeginGEOPPTTest_Manifest:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914894;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914904;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_SetupConnection:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10091496C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_SetupConnection:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009149DC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_Update:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914A44;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_Update:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914AB4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_ForcedUpdate:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914B1C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_ForcedUpdate:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914B8C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_GetResourceManifest:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914BF4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_GetResourceManifest:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914C64;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_SetManifestToken:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914CCC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_SetManifestToken:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914D3C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_SetActiveTileGroup:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914DA4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_SetActiveTileGroup:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914E14;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_ResetActiveTileGroup:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914E7C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_ResetActiveTileGroup:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914EEC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_Manifest_HandleMessage:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914F54;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_Manifest_HandleMessage:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100914FC4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (NSString)testName
{
  return self->_testName;
}

- (NSDictionary)options
{
  return self->_options;
}

- (MapsAppTesting)app
{
  return self->_app;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (unint64_t)currentSubTestIndex
{
  return self->_currentSubTestIndex;
}

- (double)currentSubTestStartTime
{
  return self->_currentSubTestStartTime;
}

- (NSMutableArray)fullyDrawnCallbacks
{
  return self->_fullyDrawnCallbacks;
}

- (void)setFullyDrawnCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_fullyDrawnCallbacks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullyDrawnCallbacks, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
