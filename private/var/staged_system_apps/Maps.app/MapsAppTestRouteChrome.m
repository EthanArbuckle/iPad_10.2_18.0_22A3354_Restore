@implementation MapsAppTestRouteChrome

- (void)cleanup:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MapsAppTest popToRootTrayWithCompletion:](self, "popToRootTrayWithCompletion:", 0);
  v5.receiver = self;
  v5.super_class = (Class)MapsAppTestRouteChrome;
  -[MapsAppTest cleanup:](&v5, "cleanup:", v3);
}

- (BOOL)runTest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestResetForLaunchURL");

  -[MapsAppTest setupForVKTest](self, "setupForVKTest");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapstest_directionsPlan"));

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10022FA40;
  v8[3] = &unk_1011AD1E8;
  objc_copyWeak(&v10, &location);
  v6 = v5;
  v9 = v6;
  -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return 1;
}

- (void)_setupDirectionsPlan:(id)a3
{
  id v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_10022FB7C;
  v9 = &unk_1011AD288;
  objc_copyWeak(&v10, &location);
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsRoutePlanningShowingRoutesNotification"), 0, &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator", v6, v7, v8, v9));
  objc_msgSend(v5, "setPPTTestDirectionsPlan:", v4);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (MapsAppTestRouteChromeDelegate)chromeDelegate
{
  return (MapsAppTestRouteChromeDelegate *)objc_loadWeakRetained((id *)&self->_chromeDelegate);
}

- (void)setChromeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_chromeDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeDelegate);
}

@end
