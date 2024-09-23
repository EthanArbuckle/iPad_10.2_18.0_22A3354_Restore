@implementation CarHybridInstrumentClusterNavigationModeController

- (CarHybridInstrumentClusterNavigationModeController)init
{
  CarHybridInstrumentClusterNavigationModeController *v2;
  id v3;
  NSObject *v4;
  CarMapWidgetETACardViewController *v5;
  CarMapWidgetETACardViewController *etaCardController;
  void *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  CarHybridInstrumentClusterNavigationModeController *v12;

  v10.receiver = self;
  v10.super_class = (Class)CarHybridInstrumentClusterNavigationModeController;
  v2 = -[CarHybridInstrumentClusterNavigationModeController init](&v10, "init");
  if (v2)
  {
    v3 = sub_100824E0C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v12 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v2->_cameraStyle = 1;
    v5 = -[CarMapWidgetETACardViewController initWithDestination:]([CarMapWidgetETACardViewController alloc], "initWithDestination:", 1);
    etaCardController = v2->_etaCardController;
    v2->_etaCardController = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "chromeConfigurationDidUpdateNotification:", CFSTR("CarInstrumentClusterChromeConfigurationDidUpdateNotification"), 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "carDisplayConfigDidChangeNotification:", CFSTR("CarDisplayConfigDidChangeNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  CarHybridInstrumentClusterNavigationModeController *v7;

  v3 = sub_100824E0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  -[CarChromeNavigationCameraStyleManager unregisterObserver:](self->_cameraStyleManager, "unregisterObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)CarHybridInstrumentClusterNavigationModeController;
  -[CarHybridInstrumentClusterNavigationModeController dealloc](&v5, "dealloc");
}

- (void)prepareToEnterStackInChromeViewController:(id)a3
{
  CarChromeNavigationCameraStyleManager *v4;
  CarChromeNavigationCameraStyleManager *cameraStyleManager;

  -[CarChromeNavigationCameraStyleManager unregisterObserver:](self->_cameraStyleManager, "unregisterObserver:", self);
  v4 = (CarChromeNavigationCameraStyleManager *)objc_claimAutoreleasedReturnValue(+[CarChromeNavigationCameraStyleManager sharedInstance](CarChromeNavigationCameraStyleManager, "sharedInstance"));
  cameraStyleManager = self->_cameraStyleManager;
  self->_cameraStyleManager = v4;

  -[CarChromeNavigationCameraStyleManager registerObserver:](self->_cameraStyleManager, "registerObserver:", self);
  self->_cameraStyle = -[CarChromeNavigationCameraStyleManager instrumentClusterCameraStyle](self->_cameraStyleManager, "instrumentClusterCameraStyle");
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
}

- (void)setCameraStyle:(int64_t)a3
{
  -[CarHybridInstrumentClusterNavigationModeController setCameraStyle:animated:](self, "setCameraStyle:animated:", a3, 0);
}

- (void)setCameraStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  int v9;
  CarHybridInstrumentClusterNavigationModeController *v10;
  __int16 v11;
  int64_t v12;

  if (self->_cameraStyle != a3)
  {
    v4 = a4;
    v7 = sub_100824E0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 134349312;
      v10 = self;
      v11 = 2048;
      v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Updating camera style: %ld", (uint8_t *)&v9, 0x16u);
    }

    self->_cameraStyle = a3;
    -[CarHybridInstrumentClusterNavigationModeController refreshCameraTypeAnimated:](self, "refreshCameraTypeAnimated:", v4);
  }
}

- (void)refreshCameraTypeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  CarHybridInstrumentClusterNavigationModeController *v12;

  v3 = a3;
  v5 = sub_100824E0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Refreshing camera type", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v7, "setNeedsUpdateMapInsets");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController carChromeViewController](self, "carChromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationDisplay"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008251AC;
  v10[3] = &unk_1011AD430;
  v10[4] = self;
  objc_msgSend(v9, "configureDisplay:animated:", v10, v3);

}

- (void)configureNavigationDisplay:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _BOOL8 v12;
  void *v13;
  int v14;
  CarHybridInstrumentClusterNavigationModeController *v15;

  v4 = a3;
  v5 = sub_100824E0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v14 = 134349056;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Configuring navigation display", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(v4, "setCameraStyle:", -[CarHybridInstrumentClusterNavigationModeController cameraStyle](self, "cameraStyle"));
  objc_msgSend(v4, "setCameraPaused:", 0);
  if (GEOConfigGetBOOL(MapsConfig_InstrumentClusterHideCurrentLocationTextLabel, off_1014B4D78))
  {
    objc_msgSend(v4, "setShowsRoadLabel:", &__kCFBooleanFalse);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
    v10 = objc_msgSend(v9, "_car_hybridInstrumentClusterLayout");

    v12 = (id)-[CarHybridInstrumentClusterNavigationModeController cameraStyle](self, "cameraStyle") == (id)1
       && v10 == (id)2;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12));
    objc_msgSend(v4, "setShowsRoadLabel:", v13);

  }
}

- (BOOL)hidesStatusBanner
{
  return +[CarDisplayConfigAuxiliaryTask centerConsoleSceneCount](CarDisplayConfigAuxiliaryTask, "centerConsoleSceneCount") != 0;
}

- (BOOL)showsHeadingIndicator
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController _mapWidgetChromeViewController](self, "_mapWidgetChromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeConfiguration"));
  v4 = objc_msgSend(v3, "showsHeadingIndicator") != (id)2;

  return v4;
}

- (BOOL)wantsNavigationDisplay
{
  return 1;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)showsSpeedLimit
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController _mapWidgetChromeViewController](self, "_mapWidgetChromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeConfiguration"));
  v4 = objc_msgSend(v3, "showsSpeedLimit") != (id)2;

  return v4;
}

- (BOOL)allowMapZoomAndRecentering
{
  return 0;
}

- (BOOL)shouldAccessoriesModifyMapInsets
{
  return 0;
}

- (BOOL)shouldMapControlsModifyMapInsets
{
  return 0;
}

- (int64_t)autohideBehavior
{
  return 0;
}

- (int64_t)accessoriesHidingBehavior
{
  return 3;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  unsigned __int8 v10;
  _QWORD v11[5];
  uint8_t buf[4];
  CarHybridInstrumentClusterNavigationModeController *v13;

  v5 = a4;
  v6 = sub_100824E0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Becoming top context", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
  objc_msgSend(v8, "addAttachmentProvider:", self);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100825574;
  v11[3] = &unk_1011AC860;
  v11[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008255B8;
  v9[3] = &unk_1011ACE58;
  v9[4] = self;
  v10 = objc_msgSend(v5, "isAnimated");
  objc_msgSend(v5, "addPreparation:animations:completion:", v11, v9, 0);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  CarHybridInstrumentClusterNavigationModeController *v11;

  v5 = a4;
  v6 = sub_100824E0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Resigning top context", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
  objc_msgSend(v8, "removeAttachmentProvider:", self);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100825830;
  v9[3] = &unk_1011AC860;
  v9[4] = self;
  objc_msgSend(v5, "addPreparation:", v9);

}

- (id)personalizedItemSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));

  if (!v4)
    return &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchPinsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeStartEndItemSource"));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  return v8;
}

- (id)desiredCards
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  int v8;
  CarHybridInstrumentClusterNavigationModeController *v9;
  __int16 v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[CarHybridInstrumentClusterNavigationModeController shouldShowGuidanceCard](self, "shouldShowGuidanceCard"))
    objc_msgSend(v3, "addObject:", CFSTR("Guidance"));
  if (-[CarHybridInstrumentClusterNavigationModeController shouldShowETATray](self, "shouldShowETATray"))
    objc_msgSend(v3, "addObject:", CFSTR("ETA"));
  v4 = sub_100824E0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134349314;
    v9 = self;
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Returning desired cards: %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = objc_msgSend(v3, "copy");
  return v6;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  NSNumber *v28;
  void *v29;
  id v30;
  void *v31;
  NSNumber *v37;
  void *v38;
  id v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  char v54;
  _BYTE v55[7];
  uint64_t v56;
  unsigned __int8 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  id v66;
  __int128 v67;
  __int128 v68;
  char v69;
  _BYTE v70[7];
  uint64_t v71;
  unsigned __int8 v72;
  _DWORD buf[3];
  __int16 v74;
  id v75;

  v6 = a3;
  v7 = a4;
  v8 = sub_100824E0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    buf[0] = 134349314;
    *(_QWORD *)&buf[1] = self;
    v74 = 2112;
    v75 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Configuring card: %@", (uint8_t *)buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
  v13 = objc_msgSend(v12, "_car_shouldHorizontallyCenterMapInsets");

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Guidance")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController guidanceCardController](self, "guidanceCardController"));
    objc_msgSend(v6, "setContent:", v14);

    v15 = objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v15, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "window"));
    v18 = 0;
    v19 = objc_msgSend(v17, "_car_hybridInstrumentClusterAlignment");

    if (v19)
    {
      if (v19 == (id)1)
      {
        v20 = xmmword_100E2F4D0;
        v15 = 8;
      }
      else
      {
        if (v19 != (id)2)
        {
          v29 = 0;
          goto LABEL_17;
        }
        v20 = xmmword_100E3C060;
        v15 = 2;
      }
      v42 = v20;
      v29 = 0;
      *(_DWORD *)((char *)buf + 3) = 0;
      buf[0] = 0;
      v18 = 2;
    }
    else
    {
      *(_DWORD *)((char *)buf + 3) = 0;
      buf[0] = 0;
      v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", GEOConfigGetDouble(MapsConfig_HybridInstrumentClusterNarrowAlignmentStyleCardMaxWidth, off_1014B5448));
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v42 = xmmword_100E2D550;
      v15 = 4;
      v18 = 3;
    }
LABEL_17:
    v58 = v42;
    v59 = 1;
    v60 = 0;
    v61 = 0;
    v62 = 1148846080;
    v63 = v18;
    v64 = 1148846080;
    v65 = 0;
    v30 = v29;
    v31 = v30;
    v66 = v30;
    __asm { FMOV            V0.2D, #8.0 }
    v67 = _Q0;
    v68 = _Q0;
    v69 = 0;
    *(_DWORD *)v70 = buf[0];
    *(_DWORD *)&v70[3] = *(_DWORD *)((char *)buf + 3);
    v71 = v15;
    v72 = v13;
    if (v6)
      objc_msgSend(v6, "setLayout:", &v58);
    else

    objc_msgSend(v6, "setAccessory:", 0);
    objc_msgSend(v6, "setSelectionHandler:", 0);

    goto LABEL_29;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("ETA")))
    goto LABEL_29;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController etaCardController](self, "etaCardController"));
  objc_msgSend(v6, "setContent:", v21);

  v22 = objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v22, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "window"));
  v25 = 0;
  v26 = objc_msgSend(v24, "_car_hybridInstrumentClusterAlignment");

  if (v26)
  {
    if (v26 == (id)1)
    {
      v27 = xmmword_100E34B90;
      v22 = 8;
    }
    else
    {
      if (v26 != (id)2)
      {
        v38 = 0;
        goto LABEL_25;
      }
      v27 = xmmword_100E3C050;
      v22 = 2;
    }
    v42 = v27;
    v38 = 0;
    *(_DWORD *)((char *)buf + 3) = 0;
    buf[0] = 0;
    v25 = 2;
  }
  else
  {
    *(_DWORD *)((char *)buf + 3) = 0;
    buf[0] = 0;
    v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", GEOConfigGetDouble(MapsConfig_HybridInstrumentClusterNarrowAlignmentStyleCardMaxWidth, off_1014B5448));
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v42 = xmmword_100E35230;
    v25 = 3;
    v22 = 1;
  }
LABEL_25:
  v43 = v42;
  v44 = 1;
  v45 = 0;
  v46 = 0;
  v47 = 1065353216;
  v48 = v25;
  v49 = 1148846080;
  v50 = 0;
  v39 = v38;
  v40 = v39;
  v51 = v39;
  __asm { FMOV            V0.2D, #8.0 }
  v52 = _Q0;
  v53 = _Q0;
  v54 = 0;
  *(_DWORD *)v55 = buf[0];
  *(_DWORD *)&v55[3] = *(_DWORD *)((char *)buf + 3);
  v56 = v22;
  v57 = v13;
  if (v6)
    objc_msgSend(v6, "setLayout:", &v43);
  else

  objc_msgSend(v6, "setAccessory:", 0);
LABEL_29:

}

- (BOOL)supportsAlternateRouteSelection
{
  return 0;
}

- (void)_updateDisplayETA
{
  GuidanceETA *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  GuidanceETA *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  if (objc_msgSend(v11, "navigationState") != 5)
  {
    v3 = [GuidanceETA alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayEtaInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remainingDistanceInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "batteryChargeInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "upcomingStop"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timezone"));
    v9 = -[GuidanceETA initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:](v3, "initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:", v4, v5, v6, v8, objc_msgSend(v11, "navigationTransportType"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController etaCardController](self, "etaCardController"));
    objc_msgSend(v10, "setLatestETA:", v9);

    -[CarHybridInstrumentClusterNavigationModeController setHasETAInfo:](self, "setHasETAInfo:", v9 != 0);
  }

}

- (void)setCurrentRoute:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  CarHybridInstrumentClusterNavigationModeController *v16;
  __int16 v17;
  void *v18;

  v5 = a3;
  v6 = self->_currentRoute;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = sub_100824E0C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "uniqueRouteID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
        v15 = 134349314;
        v16 = self;
        v17 = 2112;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Updating route: %@", (uint8_t *)&v15, 0x16u);

      }
      objc_storeStrong((id *)&self->_currentRoute, a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController carChromeViewController](self, "carChromeViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "navigationDisplay"));
      objc_msgSend(v14, "updateWithRoute:", self->_currentRoute);

    }
  }

}

- (CarGuidanceCardViewController)guidanceCardController
{
  CarGuidanceCardViewController *guidanceCardController;
  CarGuidanceCardViewController *v4;
  CarGuidanceCardViewController *v5;

  guidanceCardController = self->_guidanceCardController;
  if (!guidanceCardController)
  {
    v4 = -[CarGuidanceCardViewController initWithDestination:guidanceCardSizeProvider:interactionDelegate:]([CarGuidanceCardViewController alloc], "initWithDestination:guidanceCardSizeProvider:interactionDelegate:", 2, self, 0);
    v5 = self->_guidanceCardController;
    self->_guidanceCardController = v4;

    guidanceCardController = self->_guidanceCardController;
  }
  return guidanceCardController;
}

- (GuidanceObserver)guidanceObserver
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "guidanceObserver"));

  return (GuidanceObserver *)v3;
}

- (void)_setupGuidanceDisplays:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  CarHybridInstrumentClusterNavigationModeController *v14;

  v4 = sub_100824E0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v13 = 134349056;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Setting up guidance displays", (uint8_t *)&v13, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController guidanceObserver](self, "guidanceObserver"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController guidanceCardController](self, "guidanceCardController"));
  objc_msgSend(v6, "addOutlet:forOwner:", v7, self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController guidanceCardController](self, "guidanceCardController"));
  v9 = objc_msgSend(v8, "isViewLoaded");

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController guidanceCardController](self, "guidanceCardController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));

    -[CarHybridInstrumentClusterNavigationModeController updateCardsAnimated:](self, "updateCardsAnimated:", 0);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController guidanceCardController](self, "guidanceCardController"));
  objc_msgSend(v6, "repeatAllUpdatesForOutlet:", v12);

}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)chromeNavigationDisplay:(id)a3 configurationDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  CarHybridInstrumentClusterNavigationModeController *v9;

  v5 = sub_100824E0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] CarNavigationDisplay configuration changed", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController carChromeViewController](self, "carChromeViewController"));
  objc_msgSend(v7, "updateCardsForContext:animated:", self, 0);

}

- (void)setHasArrived:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  int v7;
  CarHybridInstrumentClusterNavigationModeController *v8;
  __int16 v9;
  _BOOL4 v10;

  if (self->_hasArrived != a3)
  {
    v3 = a3;
    self->_hasArrived = a3;
    v5 = sub_100824E0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 134349312;
      v8 = self;
      v9 = 1024;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updating has arrived: %d", (uint8_t *)&v7, 0x12u);
    }

    -[CarHybridInstrumentClusterNavigationModeController updateCardsAnimated:](self, "updateCardsAnimated:", 1);
  }
}

- (void)setHasETAInfo:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  int v7;
  CarHybridInstrumentClusterNavigationModeController *v8;
  __int16 v9;
  _BOOL4 v10;

  if (self->_hasETAInfo != a3)
  {
    v3 = a3;
    self->_hasETAInfo = a3;
    v5 = sub_100824E0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 134349312;
      v8 = self;
      v9 = 1024;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updating has eta info: %d", (uint8_t *)&v7, 0x12u);
    }

    -[CarHybridInstrumentClusterNavigationModeController updateCardsAnimated:](self, "updateCardsAnimated:", 1);
  }
}

- (id)_mapWidgetChromeViewController
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  CarHybridInstrumentClusterNavigationModeController *v11;
  id v12;
  NSObject *v13;
  char *v14;
  int v16;
  CarHybridInstrumentClusterNavigationModeController *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
  v4 = objc_opt_class(CarMapWidgetChromeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
  }
  else
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315650;
      v17 = (CarHybridInstrumentClusterNavigationModeController *)"-[CarHybridInstrumentClusterNavigationModeController _"
                                                                  "mapWidgetChromeViewController]";
      v18 = 2080;
      v19 = "CarHybridInstrumentClusterNavigationModeController.m";
      v20 = 1024;
      v21 = 413;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v16, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (CarHybridInstrumentClusterNavigationModeController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v16 = 138412290;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);

      }
    }
    v12 = sub_100824E0C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (char *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
      v16 = 134349314;
      v17 = self;
      v18 = 2112;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}p] chromeViewController (%@) was not a CarMapWidgetChromeViewController", (uint8_t *)&v16, 0x16u);

    }
    v6 = 0;
  }
  return v6;
}

- (BOOL)shouldShowGuidanceCard
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _BOOL4 v15;
  int BOOL;
  id v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  CarHybridInstrumentClusterNavigationModeController *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  __CFString *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  __CFString *v42;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = objc_msgSend(v5, "_car_hybridInstrumentClusterAlignmentStyle");

  if (v6)
    v7 = &MapsConfig_CarPlayHybridInstrumentClusterGuidanceCardVisibleOverviewWide;
  else
    v7 = &MapsConfig_CarPlayHybridInstrumentClusterGuidanceCardVisibleOverviewNarrow;
  v8 = *v7;
  v9 = (uint64_t *)&off_1014B51F8;
  if (v6)
    v9 = (uint64_t *)&off_1014B5238;
  v10 = *v9;
  if (v6)
    v11 = &MapsConfig_CarPlayHybridInstrumentClusterGuidanceCardVisibleDetailWide;
  else
    v11 = &MapsConfig_CarPlayHybridInstrumentClusterGuidanceCardVisibleDetailNarrow;
  v12 = *v11;
  v13 = (uint64_t *)&off_1014B5208;
  if (v6)
    v13 = (uint64_t *)&off_1014B5248;
  v14 = *v13;
  if (GEOConfigGetBOOL(v8, v10) && self->_cameraStyle == 2)
  {
    v15 = 1;
  }
  else if (GEOConfigGetBOOL(v12, v14))
  {
    v15 = self->_cameraStyle == 1;
  }
  else
  {
    v15 = 0;
  }
  BOOL = GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterGuidanceCardEnabled, off_1014B4D38);
  v17 = sub_100824E0C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = CFSTR("Wide");
    if (!v6)
      v19 = CFSTR("Narrow");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController", v19));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "window"));
    if (-[CarHybridInstrumentClusterNavigationModeController hasArrived](self, "hasArrived"))
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v23 = v22;
    if (v15)
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    v25 = v24;
    if (BOOL)
      v26 = CFSTR("YES");
    else
      v26 = CFSTR("NO");
    v27 = v26;
    *(_DWORD *)buf = 134350338;
    v32 = self;
    v33 = 2112;
    v34 = v29;
    v35 = 2112;
    v36 = v21;
    v37 = 2112;
    v38 = v23;
    v39 = 2112;
    v40 = v25;
    v41 = 2112;
    v42 = v27;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Configuring guidance card with alignment style: %@, window: %@, hasArrived: %@, showGuidanceCard: %@, geoDefaultEnabled: %@", buf, 0x3Eu);

  }
  if ((BOOL & v15) == 1)
    return !-[CarHybridInstrumentClusterNavigationModeController hasArrived](self, "hasArrived");
  else
    return 0;
}

- (BOOL)shouldShowETATray
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  id v24;
  NSObject *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  char v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  char v44;
  uint8_t buf[4];
  CarHybridInstrumentClusterNavigationModeController *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  __CFString *v58;
  __int16 v59;
  __CFString *v60;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController _mapWidgetChromeViewController](self, "_mapWidgetChromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeConfiguration"));
  v5 = objc_msgSend(v4, "showsETA");
  v6 = v5 != (id)2;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v10 = objc_msgSend(v9, "_car_hybridInstrumentClusterAlignmentStyle");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));
  v14 = objc_msgSend(v13, "_car_hybridInstrumentClusterLayout");

  if (v10 || v14 != (id)2)
  {
    if (v10)
      v15 = &MapsConfig_CarPlayHybridInstrumentClusterETATrayVisibleOverviewWide;
    else
      v15 = &MapsConfig_CarPlayHybridInstrumentClusterETATrayVisibleOverviewNarrow;
    v16 = *v15;
    v17 = (uint64_t *)&off_1014B5218;
    if (v10)
      v17 = (uint64_t *)&off_1014B5258;
    v18 = *v17;
    v19 = &MapsConfig_CarPlayHybridInstrumentClusterETATrayVisibleDetailNarrow;
    v20 = (uint64_t *)&off_1014B5228;
    if (v10)
      v20 = (uint64_t *)&off_1014B5268;
    v21 = *v20;
    if (v10)
      v19 = &MapsConfig_CarPlayHybridInstrumentClusterETATrayVisibleDetailWide;
    v22 = *v19;
    if (GEOConfigGetBOOL(v16, v18) && self->_cameraStyle == 2)
    {
      LODWORD(v23) = 1;
    }
    else if (GEOConfigGetBOOL(v22, v21))
    {
      LODWORD(v23) = self->_cameraStyle == 1;
    }
    else
    {
      LODWORD(v23) = 0;
    }
    v24 = sub_100824E0C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      if (v10)
        v26 = CFSTR("Wide");
      else
        v26 = CFSTR("Narrow");
      v27 = CFSTR("Maneuver");
      if (v14 == (id)1)
        v27 = CFSTR("ManeuverMap");
      if (v14 == (id)2)
        v27 = CFSTR("ManeuverMapOther");
      v40 = v27;
      v41 = v26;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController chromeViewController](self, "chromeViewController"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "view"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "window"));
      if (-[CarHybridInstrumentClusterNavigationModeController hasArrived](self, "hasArrived"))
        v29 = CFSTR("YES");
      else
        v29 = CFSTR("NO");
      v30 = v29;
      if ((_DWORD)v23)
        v31 = CFSTR("YES");
      else
        v31 = CFSTR("NO");
      v44 = (char)v23;
      v23 = v31;
      if (-[CarHybridInstrumentClusterNavigationModeController hasETAInfo](self, "hasETAInfo"))
        v32 = CFSTR("YES");
      else
        v32 = CFSTR("NO");
      v33 = v32;
      if (v5 == (id)2)
        v34 = CFSTR("NO");
      else
        v34 = CFSTR("YES");
      v35 = v34;
      *(_DWORD *)buf = 134350850;
      v46 = self;
      v47 = 2112;
      v48 = v41;
      v49 = 2112;
      v50 = v40;
      v51 = 2112;
      v52 = v28;
      v53 = 2112;
      v54 = v30;
      v55 = 2112;
      v56 = v23;
      v57 = 2112;
      v58 = v33;
      v59 = 2112;
      v60 = v35;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}p] Configuring ETA card with alignment style: %@, layout: %@, window: %@, hasArrived: %@, showETATray: %@, hasETAInfo: %@, chromeConfigEnabled: %@", buf, 0x52u);

      LOBYTE(v23) = v44;
    }

    if (-[CarHybridInstrumentClusterNavigationModeController hasArrived](self, "hasArrived"))
    {
      return 0;
    }
    else
    {
      if (v14)
        v36 = (char)v23;
      else
        v36 = 0;
      v37 = -[CarHybridInstrumentClusterNavigationModeController hasETAInfo](self, "hasETAInfo");
      if (v5 == (id)2)
        v38 = 0;
      else
        v38 = v37;
      return v38 & v36;
    }
  }
  return v6;
}

- (void)updateCardsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController carChromeViewController](self, "carChromeViewController"));
  objc_msgSend(v5, "updateCardsForContext:animated:", self, v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController carChromeViewController](self, "carChromeViewController"));
  objc_msgSend(v6, "setNeedsUpdateComponent:animated:", CFSTR("navigationDisplay"), v3);

}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  -[CarHybridInstrumentClusterNavigationModeController setCurrentRoute:](self, "setCurrentRoute:", a4);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
    -[CarHybridInstrumentClusterNavigationModeController setCurrentRoute:](self, "setCurrentRoute:", v9);

  }
}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  -[CarHybridInstrumentClusterNavigationModeController setHasArrived:](self, "setHasArrived:", objc_msgSend(a3, "arrivalState") == (id)5);
}

- (void)etaCardSign:(id)a3 didSelectAction:(unint64_t)a4
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;

  v4 = sub_1004318FC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315650;
    v10 = "-[CarHybridInstrumentClusterNavigationModeController etaCardSign:didSelectAction:]";
    v11 = 2080;
    v12 = "CarHybridInstrumentClusterNavigationModeController.m";
    v13 = 1024;
    v14 = 486;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v9, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);

    }
  }
}

- (id)upcomingWaypoints
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController currentRoute](self, "currentRoute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "waypointsAfterStepIndex:legIndex:", objc_msgSend(v3, "stepIndex"), 0));

  return v4;
}

- (BOOL)isSharingTrip
{
  return 0;
}

- (id)sharingButtonTitle
{
  return &stru_1011EB268;
}

- (id)contactSharingSuggestion
{
  return 0;
}

- (NSString)arrivalTitle
{
  return 0;
}

- (NSString)arrivalSubtitle
{
  return 0;
}

- (CGSize)availableSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController guidanceCardController](self, "guidanceCardController"));
  objc_msgSend(v2, "availableCardSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)maneuverViewLayoutType
{
  return 1;
}

- (void)chromeConfigurationDidUpdateNotification:(id)a3
{
  id v4;

  -[CarHybridInstrumentClusterNavigationModeController updateCardsAnimated:](self, "updateCardsAnimated:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController carChromeViewController](self, "carChromeViewController"));
  objc_msgSend(v4, "reloadAccessoriesForContext:animated:", self, 1);

}

- (void)carDisplayConfigDidChangeNotification:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarHybridInstrumentClusterNavigationModeController carChromeViewController](self, "carChromeViewController", a3));
  objc_msgSend(v3, "setNeedsUpdateComponent:animated:", CFSTR("statusBanner"), 0);

}

- (void)carChromeNavigationCameraStyleManager:(id)a3 didChangeInstrumentClusterCameraStyle:(int64_t)a4
{
  -[CarHybridInstrumentClusterNavigationModeController setCameraStyle:animated:](self, "setCameraStyle:animated:", a4, 1);
  -[CarHybridInstrumentClusterNavigationModeController updateCardsAnimated:](self, "updateCardsAnimated:", 1);
}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008272C0;
  block[3] = &unk_1011AECC0;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (int64_t)cameraStyle
{
  return self->_cameraStyle;
}

- (void)setGuidanceCardController:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceCardController, a3);
}

- (CarMapWidgetETACardViewController)etaCardController
{
  return self->_etaCardController;
}

- (void)setEtaCardController:(id)a3
{
  objc_storeStrong((id *)&self->_etaCardController, a3);
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (BOOL)hasArrived
{
  return self->_hasArrived;
}

- (BOOL)hasETAInfo
{
  return self->_hasETAInfo;
}

- (CarChromeNavigationCameraStyleManager)cameraStyleManager
{
  return self->_cameraStyleManager;
}

- (void)setCameraStyleManager:(id)a3
{
  objc_storeStrong((id *)&self->_cameraStyleManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraStyleManager, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_etaCardController, 0);
  objc_storeStrong((id *)&self->_guidanceCardController, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end
