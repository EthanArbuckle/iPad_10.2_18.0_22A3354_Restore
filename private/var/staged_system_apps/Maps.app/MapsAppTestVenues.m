@implementation MapsAppTestVenues

- (BOOL)runTest
{
  void *v3;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestResetForLaunchURL");

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007AEB58;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  -[MapsAppTestVenues jumpToWestfieldSF:](self, "jumpToWestfieldSF:", v5);
  return 1;
}

- (void)jumpToWestfieldSF:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    v6 = objc_alloc_init((Class)GEOMapRegion);
    objc_msgSend(v6, "setWestLng:", -122.409078);
    objc_msgSend(v6, "setEastLng:", -122.403764);
    objc_msgSend(v6, "setSouthLat:", 37.7806008);
    objc_msgSend(v6, "setNorthLat:", 37.7871745);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
    objc_msgSend(v5, "setMapRegion:pitch:yaw:", v6, 0.0, 0.0);

    -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v4);
  }
}

- (void)displayPlacecardWithWillDisplayBlock:(id)a3 didDisplayBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)MKMapItemIdentifier);
  v9 = objc_msgSend(v8, "initWithMUID:resultProviderID:coordinate:", 0xCB37502B5BA58FCCLL, 0, MKCoordinateInvalid[0], MKCoordinateInvalid[1]);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v16 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ticketForIdentifiers:traits:", v11, 0));

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1007AEE4C;
    v13[3] = &unk_1011C6CB0;
    v13[4] = self;
    v14 = v6;
    v15 = v7;
    objc_msgSend(v12, "submitWithHandler:networkActivity:", v13, 0);

  }
  else
  {
    -[MapsAppTest failedTest](self, "failedTest");
  }

}

- (void)displayCategoryResultsWithMapItem:(id)a3 searchCategory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  MapsAppTestVenues *v16;
  id v17;

  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1007AF148;
  v15 = &unk_1011C6CD8;
  v16 = self;
  v17 = a5;
  v8 = v17;
  v9 = a4;
  v10 = a3;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("VenueBrowseDidDisplayCategoryResults"), 0, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator", v12, v13, v14, v15, v16));
  objc_msgSend(v11, "pptTestPresentVenueForMapItem:searchCategory:", v10, v9);

}

- (void)performScrollTestOnScrollView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  MapsAppTestVenues *v20;
  id v21;
  id v22;
  id location;
  id v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR(" - scroll")));

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", v6);
  objc_initWeak(&location, self);
  v7 = RPTContentSizeInDirection(v4, 1);
  v8 = RPTGetBoundsForView(v4);
  v12 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", v6, 1, &stru_1011C6CF8, v8, v9, v10, v11, v7);
  v24 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1007AF3E8;
  v19 = &unk_1011AFF10;
  objc_copyWeak(&v22, &location);
  v20 = self;
  v14 = v6;
  v21 = v14;
  v15 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", v14, v13, &v16);

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v15, v16, v17, v18, v19, v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

- (void)selectSearchResult:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  MapsAppTestVenues *v15;
  id v16;

  v6 = a4;
  v7 = MKPlaceViewControllerDidShowNotification;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1007AF500;
  v14 = &unk_1011C6CD8;
  v15 = self;
  v16 = v6;
  v8 = v6;
  v9 = a3;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", v7, 0, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator", v11, v12, v13, v14, v15));
  objc_msgSend(v10, "pptTestSelectVenueSearchResult:", v9);

}

- (void)selectSubCategory:(id)a3 venueCategoryViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void **v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[5];

  v8 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1007AF680;
  v17[3] = &unk_1011AD1C0;
  v17[4] = self;
  v9 = a4;
  v10 = a3;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("VenueBrowseDidFailToSelectSubcategory"), 0, v17);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1007AF688;
  v15 = &unk_1011B5B38;
  v16 = v8;
  v11 = v8;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("VenueBrowseDidDisplayCategoryResults"), 0, &v12);
  objc_msgSend(v9, "selectSubcategory:", v10, v12, v13, v14, v15);

}

- (void)runBrowseTest
{
  _QWORD v3[5];
  _QWORD v4[5];

  -[MapsAppTest startedTest](self, "startedTest");
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007AF720;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1007AF730;
  v3[3] = &unk_1011C6D70;
  -[MapsAppTestVenues displayPlacecardWithWillDisplayBlock:didDisplayBlock:](self, "displayPlacecardWithWillDisplayBlock:didDisplayBlock:", v4, v3);
}

- (void)runScrollCategoryResultsTest
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1007AFAF8;
  v2[3] = &unk_1011C6D70;
  v2[4] = self;
  -[MapsAppTestVenues displayPlacecardWithWillDisplayBlock:didDisplayBlock:](self, "displayPlacecardWithWillDisplayBlock:didDisplayBlock:", 0, v2);
}

- (void)runScrollSearchResultPlacecardTest
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1007AFD94;
  v2[3] = &unk_1011C6D70;
  v2[4] = self;
  -[MapsAppTestVenues displayPlacecardWithWillDisplayBlock:didDisplayBlock:](self, "displayPlacecardWithWillDisplayBlock:didDisplayBlock:", 0, v2);
}

@end
