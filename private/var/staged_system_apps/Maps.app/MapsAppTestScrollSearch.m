@implementation MapsAppTestScrollSearch

- (BOOL)runTest
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id location;

  -[MapsAppTest setupForVKTest](self, "setupForVKTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  objc_msgSend(v3, "_mapstest_jumpPoint");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  objc_msgSend(v10, "_mapstest_pitch");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  objc_msgSend(v13, "_mapstest_yaw");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v17 = objc_msgSend(v16, "_mapstest_mapType");

  -[MapsAppTest switchToMapType:](self, "switchToMapType:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v18, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1, v5, v7, v9, v12, v15);

  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10045D544;
  v20[3] = &unk_1011AD260;
  objc_copyWeak(&v21, &location);
  -[MapsAppTestScrollSearch addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return 1;
}

- (void)cleanup:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MapsAppTest dismissTrayWithAssertTrayType:completion:](self, "dismissTrayWithAssertTrayType:completion:", 2, 0);
  v5.receiver = self;
  v5.super_class = (Class)MapsAppTestScrollSearch;
  -[MapsAppTest cleanup:](&v5, "cleanup:", v3);
}

- (void)searchForSearchString
{
  void *v3;
  void *v4;
  SearchFieldItem *v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[5];
  id v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_10045D744;
  v9[4] = sub_10045D754;
  v10 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10045D75C;
  v8[3] = &unk_1011AD198;
  v8[4] = self;
  v8[5] = v9;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("SearchSessionDidChangeSearchResultsNotification"), 0, v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10045D814;
  v7[3] = &unk_1011AD198;
  v7[4] = self;
  v7[5] = v9;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsPinsDroppedForSearchResultsNotification"), 0, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("searchString")));

  v5 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v5, "setSearchString:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v6, "pptTestSearchForFieldItem:", v5);

  _Block_object_dispose(v9, 8);
}

- (void)searchResultsDidAppear
{
  _QWORD v3[5];

  if (-[MapsAppTest canUpdateTrayLayout](self, "canUpdateTrayLayout"))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10045D96C;
    v3[3] = &unk_1011AC860;
    v3[4] = self;
    -[MapsAppTest updateTrayLayout:animated:completion:](self, "updateTrayLayout:animated:completion:", 2, 1, v3);
  }
  else
  {
    -[MapsAppTestScrollSearch _scrollingTest](self, "_scrollingTest");
  }
}

- (void)_scrollingTest
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pptTestScrollView"));

  v5 = RPTContentSizeInDirection(v4, 1);
  v6 = RPTGetBoundsForView(v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_alloc((Class)RPTScrollViewTestParameters);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  v15 = objc_msgSend(v13, "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", v14, 1, &stru_1011B74E8, v6, v8, v10, v12, v5);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  v20 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10045DB2C;
  v19[3] = &unk_1011AC860;
  v19[4] = self;
  v18 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", v16, v17, v19);

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v18);
}

- (void)addFullyDrawnCallback:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  dispatch_time_t v8;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest fullyDrawnCallbacks](self, "fullyDrawnCallbacks"));
  v6 = objc_msgSend(v4, "copy");

  v7 = objc_retainBlock(v6);
  objc_msgSend(v5, "addObject:", v7);

  -[MapsAppTest setupFullyDrawnNotification:](self, "setupFullyDrawnNotification:", "onFullyDrawn:");
  v8 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10045DC0C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end
