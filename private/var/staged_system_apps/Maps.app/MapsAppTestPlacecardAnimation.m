@implementation MapsAppTestPlacecardAnimation

- (BOOL)runTest
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  SearchResult *v22;
  SearchResult *v23;
  _QWORD v25[4];
  SearchResult *v26;
  id v27;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapstest_location"));

  if (v4)
  {
    -[MapsAppTest setupForVKTest](self, "setupForVKTest");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    objc_msgSend(v5, "_mapstest_jumpPoint");
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    objc_msgSend(v12, "_mapstest_pitch");
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    objc_msgSend(v15, "_mapstest_yaw");
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    v19 = objc_msgSend(v18, "_mapstest_mapType");

    -[MapsAppTest switchToMapType:](self, "switchToMapType:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
    objc_msgSend(v20, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1, v7, v9, v11, v14, v17);

    v21 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithCLLocation:", v4);
    v22 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v21);
    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1006769AC;
    v25[3] = &unk_1011AD1E8;
    objc_copyWeak(&v27, &location);
    v23 = v22;
    v26 = v23;
    -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v25);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return v4 != 0;
}

- (void)_startTestPresentWithSearchResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[MapsAppTest startedTest](self, "startedTest");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100676AAC;
  v8[3] = &unk_1011AC8B0;
  v8[4] = self;
  v9 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100676AF0;
  v7[3] = &unk_1011AC860;
  v6 = v4;
  -[MapsAppTest presentDismissTrayTestAndSubTestsWithPrefix:presenter:completion:](self, "presentDismissTrayTestAndSubTestsWithPrefix:presenter:completion:", v5, v8, v7);

}

@end
