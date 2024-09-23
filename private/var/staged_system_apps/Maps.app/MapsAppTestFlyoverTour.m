@implementation MapsAppTestFlyoverTour

- (BOOL)runTest
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  -[MapsAppTest setupForVKTest](self, "setupForVKTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v3, "setMapType:", 3);
  objc_msgSend(v3, "enableTestStatistics");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v5 = objc_msgSend(v4, "_mapstest_flyoverTourId");

  -[MapsAppTest startedTest](self, "startedTest");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10028DC8C;
  v9[3] = &unk_1011ACCB8;
  v9[4] = self;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v6, "_startFlyoverTourAnimation:duration:completion:", v5, v9, 0.0);

  return 1;
}

- (void)cleanup:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v5, "disableTestStatistics");
  objc_msgSend(v5, "clearScene");
  v6.receiver = self;
  v6.super_class = (Class)MapsAppTestFlyoverTour;
  -[MapsAppTest cleanup:](&v6, "cleanup:", v3);

}

@end
