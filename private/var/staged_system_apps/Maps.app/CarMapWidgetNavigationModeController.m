@implementation CarMapWidgetNavigationModeController

- (CarMapWidgetNavigationModeController)init
{
  CarMapWidgetNavigationModeController *v2;
  CarMapWidgetETACardViewController *v3;
  CarMapWidgetETACardViewController *etaCard;
  NSMutableSet *v5;
  NSMutableSet *invalidatedAlertIds;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarMapWidgetNavigationModeController;
  v2 = -[CarMapWidgetNavigationModeController init](&v8, "init");
  if (v2)
  {
    v3 = -[CarMapWidgetETACardViewController initWithDestination:]([CarMapWidgetETACardViewController alloc], "initWithDestination:", 0);
    etaCard = v2->_etaCard;
    v2->_etaCard = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    invalidatedAlertIds = v2->_invalidatedAlertIds;
    v2->_invalidatedAlertIds = v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CarChromeNavigationCameraStyleManager unregisterObserver:](self->_cameraStyleManager, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)CarMapWidgetNavigationModeController;
  -[CarMapWidgetNavigationModeController dealloc](&v3, "dealloc");
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)showsHeadingIndicator
{
  void *v2;
  unint64_t v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController"));
  v3 = (unint64_t)objc_msgSend(v2, "sceneType");
  v4 = (v3 < 8) & (0xF2u >> v3);

  return v4;
}

- (BOOL)showsSpeedLimit
{
  return 1;
}

- (BOOL)allowMapZoomAndRecentering
{
  return (id)-[CarMapWidgetNavigationModeController cameraStyle](self, "cameraStyle") == (id)2;
}

- (BOOL)shouldAccessoriesModifyMapInsets
{
  return (id)-[CarMapWidgetNavigationModeController cameraStyle](self, "cameraStyle") == (id)2;
}

- (BOOL)shouldMapControlsModifyMapInsets
{
  return (id)-[CarMapWidgetNavigationModeController cameraStyle](self, "cameraStyle") == (id)2;
}

- (int64_t)autohideBehavior
{
  return 1;
}

- (int64_t)accessoriesHidingBehavior
{
  return 3;
}

- (void)setHasETAInfo:(BOOL)a3
{
  id v4;

  if (self->_hasETAInfo != a3)
  {
    self->_hasETAInfo = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v4, "updateCardsForContext:animated:", self, 1);

  }
}

- (void)setHasArrived:(BOOL)a3
{
  id v4;

  if (self->_hasArrived != a3)
  {
    self->_hasArrived = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v4, "updateCardsForContext:animated:", self, 1);

  }
}

- (void)setCurrentRoute:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  CarMapWidgetNavigationModeController *v16;
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
      if (qword_1014D21A0 != -1)
        dispatch_once(&qword_1014D21A0, &stru_1011B2728);
      v9 = (void *)qword_1014D2198;
      if (os_log_type_enabled((os_log_t)qword_1014D2198, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "uniqueRouteID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
        v15 = 134349314;
        v16 = self;
        v17 = 2112;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Updating route: %@", (uint8_t *)&v15, 0x16u);

      }
      objc_storeStrong((id *)&self->_currentRoute, a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "navigationDisplay"));
      objc_msgSend(v14, "updateWithRoute:", self->_currentRoute);

    }
  }

}

- (void)prepareToEnterStackInChromeViewController:(id)a3
{
  CarChromeNavigationCameraStyleManager *v4;
  CarChromeNavigationCameraStyleManager *cameraStyleManager;
  void *v6;
  id v7;
  CarChromeNavigationCameraStyleManager *v8;
  int64_t v9;

  -[CarChromeNavigationCameraStyleManager unregisterObserver:](self->_cameraStyleManager, "unregisterObserver:", self);
  v4 = (CarChromeNavigationCameraStyleManager *)objc_claimAutoreleasedReturnValue(+[CarChromeNavigationCameraStyleManager sharedInstance](CarChromeNavigationCameraStyleManager, "sharedInstance"));
  cameraStyleManager = self->_cameraStyleManager;
  self->_cameraStyleManager = v4;

  -[CarChromeNavigationCameraStyleManager registerObserver:](self->_cameraStyleManager, "registerObserver:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController"));
  v7 = objc_msgSend(v6, "sceneType");

  v8 = self->_cameraStyleManager;
  if ((unint64_t)v7 < 4)
    v9 = -[CarChromeNavigationCameraStyleManager centerConsoleCameraStyle](v8, "centerConsoleCameraStyle");
  else
    v9 = -[CarChromeNavigationCameraStyleManager instrumentClusterCameraStyle](v8, "instrumentClusterCameraStyle");
  self->_cameraStyle = v9;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  _QWORD v4[5];
  _QWORD v5[5];

  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10034BF54;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10034BFCC;
  v4[3] = &unk_1011AC860;
  objc_msgSend(a4, "addPreparation:animations:completion:", v5, v4, 0);
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10034C168;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(a4, "addPreparation:animations:completion:", v4, &stru_1011B26E0, 0);
}

- (id)desiredCards
{
  void *v3;
  const __CFString *v5;

  if (-[CarMapWidgetNavigationModeController hasArrived](self, "hasArrived")
    || !-[CarMapWidgetNavigationModeController hasETAInfo](self, "hasETAInfo"))
  {
    v3 = &__NSArray0__struct;
  }
  else
  {
    v5 = CFSTR("DashboardETACardKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  }
  return v3;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("DashboardETACardKey")))
  {
    objc_msgSend(v6, "setContent:", self->_etaCard);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController"));
    v9 = (unint64_t)objc_msgSend(v8, "sceneType") - 1;
    if (v9 > 6)
    {
      v11 = 3;
      v10 = 1148846080;
    }
    else
    {
      v10 = dword_100E35240[v9];
      v11 = qword_100E35260[v9];
    }

    HIDWORD(v28) = 0;
    *(_DWORD *)((char *)&v28 + 1) = 0;
    v17 = xmmword_100E35230;
    v18 = 1;
    v19 = 0;
    v20 = 0;
    v21 = 1065353216;
    v22 = v11;
    LODWORD(v23) = v10;
    v24 = 0;
    v25 = 0;
    __asm { FMOV            V0.2D, #5.0 }
    v26 = _Q0;
    v27 = _Q0;
    LOBYTE(v28) = 1;
    v29 = 1;
    LOBYTE(v30) = 0;
    if (v6)
      objc_msgSend(v6, "setLayout:", &v17);
    objc_msgSend(v6, "setAccessory:", 0, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
  }

}

- (void)configureNavigationDisplay:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setCameraStyle:", -[CarMapWidgetNavigationModeController cameraStyle](self, "cameraStyle"));
  objc_msgSend(v4, "setCameraPaused:", 0);

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));

  if (!v4)
    return &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchPinsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeStartEndItemSource"));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  return v8;
}

- (void)setCameraStyle:(int64_t)a3
{
  -[CarMapWidgetNavigationModeController setCameraStyle:animated:](self, "setCameraStyle:animated:", a3, 0);
}

- (void)setCameraStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_cameraStyle != a3)
  {
    self->_cameraStyle = a3;
    -[CarMapWidgetNavigationModeController refreshCameraTypeAnimated:](self, "refreshCameraTypeAnimated:", a4);
  }
}

- (void)refreshCameraTypeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "setNeedsUpdateComponent:animated:", CFSTR("mapcontrols"), 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v6, "setNeedsUpdateComponent:animated:", CFSTR("accessories"), 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v7, "setNeedsUpdateMapInsets");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationDisplay"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10034C5DC;
  v10[3] = &unk_1011AD430;
  v10[4] = self;
  objc_msgSend(v9, "configureDisplay:animated:", v10, v3);

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
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  if (objc_msgSend(v10, "navigationState") != 5)
  {
    v3 = [GuidanceETA alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayEtaInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remainingDistanceInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "batteryChargeInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "upcomingStop"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timezone"));
    v9 = -[GuidanceETA initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:](v3, "initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:", v4, v5, v6, v8, objc_msgSend(v10, "navigationTransportType"));

    -[CarMapWidgetETACardViewController setLatestETA:](self->_etaCard, "setLatestETA:", v9);
    -[CarMapWidgetNavigationModeController setHasETAInfo:](self, "setHasETAInfo:", v9 != 0);

  }
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  -[CarMapWidgetNavigationModeController setCurrentRoute:](self, "setCurrentRoute:", a4);
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
    -[CarMapWidgetNavigationModeController setCurrentRoute:](self, "setCurrentRoute:", v9);

  }
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  -[CarMapWidgetNavigationModeController setHasArrived:](self, "setHasArrived:", 1, a4, a5);
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  -[CarMapWidgetNavigationModeController setHasArrived:](self, "setHasArrived:", 0, a4, a5, a6);
}

- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  double v16;
  double v17;
  NSTimer *v18;
  NSTimer *alertDismissTimer;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[8];
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "navigationDisplay"));
  objc_msgSend((id)v12, "setTrafficAlert:", v9);

  -[CarMapWidgetNavigationModeController _cancelAlertDismissTimer](self, "_cancelAlertDismissTimer");
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  LOBYTE(v12) = objc_msgSend(v13, "isCurrentlyConnectedToCarAppScene");

  if ((v12 & 1) == 0)
  {
    v14 = sub_1004335DC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "didReceiveTrafficIncidentAlert and was not connected to carApp scene. Starting auto dismiss timer.", buf, 2u);
    }

    objc_msgSend(v9, "alertDisplayDuration");
    v17 = v16;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10034C970;
    v20[3] = &unk_1011B2708;
    objc_copyWeak(&v23, &location);
    v21 = v9;
    v22 = v10;
    v18 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v20, v17));
    alertDismissTimer = self->_alertDismissTimer;
    self->_alertDismissTimer = v18;

    objc_destroyWeak(&v23);
  }
  objc_destroyWeak(&location);

}

- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  id v5;
  NSMutableSet *invalidatedAlertIds;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  invalidatedAlertIds = self->_invalidatedAlertIds;
  v10 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertID"));
  LOBYTE(invalidatedAlertIds) = -[NSMutableSet containsObject:](invalidatedAlertIds, "containsObject:", v7);

  if ((invalidatedAlertIds & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationDisplay"));
    objc_msgSend(v9, "setTrafficAlert:", v10);

  }
}

- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  NSMutableSet *invalidatedAlertIds;
  void *v6;
  void *v7;
  id v8;

  invalidatedAlertIds = self->_invalidatedAlertIds;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "alertID", a3));
  -[NSMutableSet addObject:](invalidatedAlertIds, "addObject:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationDisplay"));
  objc_msgSend(v7, "setTrafficAlert:", 0);

}

- (void)_trafficAlertVisibilityChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  NSMutableSet *invalidatedAlertIds;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationDisplay"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trafficAlert"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCarTrafficAlertIdKey")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "alertID"));
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    invalidatedAlertIds = self->_invalidatedAlertIds;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "alertID"));
    -[NSMutableSet addObject:](invalidatedAlertIds, "addObject:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "navigationDisplay"));
    objc_msgSend(v14, "setTrafficAlert:", 0);

  }
}

- (void)_dismissAlertIfNeeded:(id)a3 withResponse:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSMutableSet *invalidatedAlertIds;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v9 = objc_msgSend(v8, "isCurrentlyConnectedToCarAppScene");

  v10 = sub_1004335DC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "_dismissAlertIfNeeded called, but user opened main app in the meantime.", buf, 2u);
    }

  }
  else
  {
    if (v12)
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "_dismissAlertIfNeeded - dismissing alert.", v17, 2u);
    }

    -[CarMapWidgetNavigationModeController _cancelAlertDismissTimer](self, "_cancelAlertDismissTimer");
    invalidatedAlertIds = self->_invalidatedAlertIds;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alertID"));
    -[NSMutableSet addObject:](invalidatedAlertIds, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "navigationDisplay"));
    objc_msgSend(v16, "setTrafficAlert:", 0);

    if (v7)
      v7[2](v7, 0);
  }

}

- (void)_cancelAlertDismissTimer
{
  NSTimer *alertDismissTimer;

  -[NSTimer invalidate](self->_alertDismissTimer, "invalidate");
  alertDismissTimer = self->_alertDismissTimer;
  self->_alertDismissTimer = 0;

}

- (void)carChromeNavigationCameraStyleManager:(id)a3 didChangeCenterConsoleCameraStyle:(int64_t)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController", a3));
  v7 = objc_msgSend(v6, "sceneType");

  if ((unint64_t)v7 <= 3)
    -[CarMapWidgetNavigationModeController setCameraStyle:animated:](self, "setCameraStyle:animated:", a4, 1);
}

- (void)carChromeNavigationCameraStyleManager:(id)a3 didChangeInstrumentClusterCameraStyle:(int64_t)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetNavigationModeController carChromeViewController](self, "carChromeViewController", a3));
  v7 = objc_msgSend(v6, "sceneType");

  if ((unint64_t)v7 >= 4)
    -[CarMapWidgetNavigationModeController setCameraStyle:animated:](self, "setCameraStyle:animated:", a4, 1);
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

- (BOOL)hasArrived
{
  return self->_hasArrived;
}

- (BOOL)hasETAInfo
{
  return self->_hasETAInfo;
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
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
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_invalidatedAlertIds, 0);
  objc_storeStrong((id *)&self->_alertDismissTimer, 0);
  objc_storeStrong((id *)&self->_etaCard, 0);
}

@end
