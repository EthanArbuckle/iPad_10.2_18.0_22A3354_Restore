@implementation MapsAppTestRAPPOI

- (BOOL)runTest
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestResetForLaunchURL");

  -[MapsAppTestRAP overrideProblemSubmissionURL](self, "overrideProblemSubmissionURL");
  -[MapsAppTestRAP overridePrivacyConsent](self, "overridePrivacyConsent");
  -[MapsAppTest setupForVKTest](self, "setupForVKTest");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  objc_msgSend(v4, "_mapstest_jumpPoint");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  objc_msgSend(v11, "_mapstest_pitch");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  objc_msgSend(v14, "_mapstest_yaw");
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v18 = objc_msgSend(v17, "_mapstest_mapType");

  -[MapsAppTest switchToMapType:](self, "switchToMapType:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v19, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1, v6, v8, v10, v13, v16);

  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100B9480C;
  v21[3] = &unk_1011AD260;
  objc_copyWeak(&v22, &location);
  -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v21);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  return 1;
}

- (void)_startRAPPlacecardTest
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_showRAPCallout:", MKBalloonCalloutDidShowNotification, 0);

  -[MapsAppTestRAPPOI performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_startCalloutRAPControllerPresentationTest", 0, 1.0);
}

- (void)_startCalloutRAPControllerPresentationTest
{
  void *v3;
  SearchFieldItem *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("searchString")));

  v4 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v4, "setSearchString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v5, "pptTestSearchForFieldItem:", v4);

}

- (void)_showRAPCallout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v8, "removeObserver:name:object:", self, MKBalloonCalloutDidShowNotification, 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_showRAPPlaceCard:", MKPlaceViewControllerDidShowNotification, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSession currentSearchSession](SearchSession, "currentSearchSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
    objc_msgSend(v7, "pptTestPresentPlaceCardForSearchResult:animated:", v6, 1);

  }
  else
  {
    -[MapsAppTest failedTest](self, "failedTest");
  }

}

- (void)_showRAPPlaceCard:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, MKPlaceViewControllerDidShowNotification, 0);
  -[MapsAppTest failedTest](self, "failedTest");

}

@end
