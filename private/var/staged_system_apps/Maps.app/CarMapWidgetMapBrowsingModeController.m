@implementation CarMapWidgetMapBrowsingModeController

- (CarMapWidgetMapBrowsingModeController)init
{
  CarMapWidgetMapBrowsingModeController *v2;
  CarPreciseLocationOffButtonCardViewController *v3;
  CarPreciseLocationOffButtonCardViewController *preciseLocationOffButtonCardController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarMapWidgetMapBrowsingModeController;
  v2 = -[CarMapWidgetMapBrowsingModeController init](&v6, "init");
  if (v2)
  {
    v3 = -[CarPreciseLocationOffButtonCardViewController initWithDelegate:]([CarPreciseLocationOffButtonCardViewController alloc], "initWithDelegate:", v2);
    preciseLocationOffButtonCardController = v2->_preciseLocationOffButtonCardController;
    v2->_preciseLocationOffButtonCardController = v3;

  }
  return v2;
}

- (id)desiredCards
{
  void *v2;
  const __CFString *v4;

  if (-[CarPreciseLocationOffButtonCardViewController shouldBeVisible](self->_preciseLocationOffButtonCardController, "shouldBeVisible"))
  {
    v4 = CFSTR("PreciseLocationOffButton");
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));
  }
  else
  {
    v2 = &__NSArray0__struct;
  }
  return v2;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  _QWORD v13[7];
  int v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[7];
  uint64_t v21;
  char v22;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("PreciseLocationOffButton")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetMapBrowsingModeController preciseLocationOffButtonCardController](self, "preciseLocationOffButtonCardController"));
    objc_msgSend(v6, "setContent:", v7);

    memset(v20, 0, sizeof(v20));
    v13[0] = 1;
    memset(&v13[1], 0, 24);
    v13[4] = 2;
    v13[5] = 1148846080;
    v13[6] = 0;
    v14 = 1065353216;
    v15 = 0;
    v16 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v17 = _Q0;
    v18 = _Q0;
    v19 = 1;
    v21 = 4;
    v22 = 0;
    if (v6)
      objc_msgSend(v6, "setLayout:", v13);
    objc_msgSend(v6, "setAccessory:", 0);
  }

}

- (void)preciseLocationOffButtonCard:(id)a3 visibilityUpdated:(BOOL)a4
{
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController", a3, a4));
  v6 = objc_msgSend(v5, "isCurrentContext:", self);

  if ((v6 & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CarMapWidgetMapBrowsingModeController carChromeViewController](self, "carChromeViewController"));
    objc_msgSend(v9, "updateCardsForContext:animated:", self, 1);

  }
  else
  {
    v7 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "mapBrowsing mode tried to update precise location off visibility, but it is not the current mode.", buf, 2u);
    }

  }
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  unsigned __int8 v10;
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CarMapWidgetMapBrowsingModeController;
  v6 = a4;
  -[CarBasicMapBrowsingModeController becomeTopContextInChromeViewController:withAnimation:](&v12, "becomeTopContextInChromeViewController:withAnimation:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "_sceneWillEnterForeground:", UISceneWillEnterForegroundNotification, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002C6360;
  v11[3] = &unk_1011AC860;
  v11[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002C63CC;
  v9[3] = &unk_1011AF4D8;
  v9[4] = self;
  v10 = objc_msgSend(v6, "isAnimated");
  objc_msgSend(v6, "addPreparation:animations:completion:", v11, &stru_1011B0068, v9);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CarMapWidgetMapBrowsingModeController;
  v7 = a4;
  -[CarBasicMapBrowsingModeController resignTopContextInChromeViewController:withAnimation:](&v12, "resignTopContextInChromeViewController:withAnimation:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:", self);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002C64B8;
  v10[3] = &unk_1011AC8B0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "addPreparation:", v10);

}

- (BOOL)allowMapZoomAndRecentering
{
  return 1;
}

- (BOOL)_mapViewCanChangeUserTrackingModeWhenRegionDidChange:(id)a3
{
  return 0;
}

- (void)_sceneWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_uiScene"));

  if (v4 == v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetMapBrowsingModeController carChromeViewController](self, "carChromeViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultMapSettings"));
    objc_msgSend(v8, "reload");

    -[CarMapWidgetMapBrowsingModeController applyMapSettingsAndTrackingAnimated:](self, "applyMapSettingsAndTrackingAnimated:", 0);
  }
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  -[CarMapWidgetMapBrowsingModeController applyMapSettingsAndTrackingAnimated:](self, "applyMapSettingsAndTrackingAnimated:", 1);
}

- (void)applyMapSettingsAndTrackingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ChromeMapSettings *v13;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
  v6 = objc_msgSend(v5, "isCurrentContext:", self);

  if (v6)
  {
    v13 = -[ChromeMapSettings initWithType:userInterfaceIdiom:]([ChromeMapSettings alloc], "initWithType:userInterfaceIdiom:", 1, 3);
    if (-[ChromeMapSettings trackingMode](v13, "trackingMode"))
      v7 = -[ChromeMapSettings trackingMode](v13, "trackingMode");
    else
      v7 = 2;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController trackingController](self, "trackingController"));
    objc_msgSend(v8, "setForcedTrackingMode:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    -[ChromeMapSettings setDelegate:](v13, "setDelegate:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));
    -[ChromeMapSettings setMapView:](v13, "setMapView:", v11);

    -[ChromeMapSettings setTrackingMode:](v13, "setTrackingMode:", v7);
    -[CarMapWidgetMapBrowsingModeController setMapSettings:](self, "setMapSettings:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetMapBrowsingModeController mapSettings](self, "mapSettings"));
    objc_msgSend(v12, "applyToMapViewAnimated:duration:completion:", v3, 0, -1.0);

  }
}

- (id)carFocusOrderSequences
{
  return &__NSArray0__struct;
}

- (ChromeMapSettings)mapSettings
{
  return self->_mapSettings;
}

- (void)setMapSettings:(id)a3
{
  objc_storeStrong((id *)&self->_mapSettings, a3);
}

- (CarPreciseLocationOffButtonCardViewController)preciseLocationOffButtonCardController
{
  return self->_preciseLocationOffButtonCardController;
}

- (void)setPreciseLocationOffButtonCardController:(id)a3
{
  objc_storeStrong((id *)&self->_preciseLocationOffButtonCardController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preciseLocationOffButtonCardController, 0);
  objc_storeStrong((id *)&self->_mapSettings, 0);
}

@end
