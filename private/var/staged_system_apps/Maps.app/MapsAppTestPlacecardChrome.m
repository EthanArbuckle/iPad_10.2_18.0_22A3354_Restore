@implementation MapsAppTestPlacecardChrome

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
  v20[2] = sub_100677FC8;
  v20[3] = &unk_1011AD260;
  objc_copyWeak(&v21, &location);
  -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return 1;
}

- (void)cleanup:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MapsAppTest dismissTrayWithAssertTrayType:completion:](self, "dismissTrayWithAssertTrayType:completion:", 1, 0);
  v5.receiver = self;
  v5.super_class = (Class)MapsAppTestPlacecardChrome;
  -[MapsAppTest cleanup:](&v5, "cleanup:", v3);
}

- (void)startPlacecardTest
{
  void *v3;
  void *v4;
  SearchFieldItem *v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[5];
  id v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_1006783CC;
  v11[4] = sub_1006783DC;
  v12 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1006783E4;
  v10[3] = &unk_1011AD198;
  v10[4] = self;
  v10[5] = v11;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("SearchSessionDidChangeSearchResultsNotification"), 0, v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10067849C;
  v9[3] = &unk_1011AD198;
  v9[4] = self;
  v9[5] = v11;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsPinsDroppedForSearchResultsNotification"), 0, v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006785F8;
  v8[3] = &unk_1011AD198;
  v8[4] = self;
  v8[5] = v11;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", MKBalloonCalloutDidShowNotification, 0, v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006786F0;
  v7[3] = &unk_1011AD170;
  v7[4] = self;
  v7[5] = v11;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", MKPlaceViewControllerDidShowNotification, 0, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("searchString")));

  v5 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v5, "setSearchString:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v6, "pptTestSearchForFieldItem:", v5);

  _Block_object_dispose(v11, 8);
}

- (MapsAppTestPlacecardChromeDelegate)placecardChromeDelegate
{
  return (MapsAppTestPlacecardChromeDelegate *)objc_loadWeakRetained((id *)&self->_placecardChromeDelegate);
}

- (void)setPlacecardChromeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placecardChromeDelegate, a3);
}

- (MUPlaceViewController)placeViewController
{
  return (MUPlaceViewController *)objc_loadWeakRetained((id *)&self->_placeViewController);
}

- (void)setPlaceViewController:(id)a3
{
  objc_storeWeak((id *)&self->_placeViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_placeViewController);
  objc_destroyWeak((id *)&self->_placecardChromeDelegate);
  objc_storeStrong((id *)&self->_searchInfo, 0);
}

@end
