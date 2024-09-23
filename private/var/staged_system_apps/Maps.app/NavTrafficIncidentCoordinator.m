@implementation NavTrafficIncidentCoordinator

- (NavTrafficIncidentCoordinator)init
{
  NavTrafficIncidentCoordinator *v2;
  void *v3;
  NavTrafficIncidentCoordinator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavTrafficIncidentCoordinator;
  v2 = -[NavTrafficIncidentCoordinator init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_didBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

    v4 = v2;
  }

  return v2;
}

- (TrafficIncidentOptionalRerouteContaineeViewController)rerouteTrafficIncidentViewController
{
  TrafficIncidentOptionalRerouteContaineeViewController *rerouteTrafficIncidentViewController;
  TrafficIncidentOptionalRerouteContaineeViewController *v4;
  TrafficIncidentOptionalRerouteContaineeViewController *v5;

  rerouteTrafficIncidentViewController = self->_rerouteTrafficIncidentViewController;
  if (!rerouteTrafficIncidentViewController)
  {
    v4 = -[TrafficIncidentOptionalRerouteContaineeViewController initWithNibName:bundle:]([TrafficIncidentOptionalRerouteContaineeViewController alloc], "initWithNibName:bundle:", 0, 0);
    v5 = self->_rerouteTrafficIncidentViewController;
    self->_rerouteTrafficIncidentViewController = v4;

    -[TrafficIncidentOptionalRerouteContaineeViewController setDelegate:](self->_rerouteTrafficIncidentViewController, "setDelegate:", self);
    rerouteTrafficIncidentViewController = self->_rerouteTrafficIncidentViewController;
  }
  return rerouteTrafficIncidentViewController;
}

- (NavTrafficIncidentContaineeViewController)trafficIncidentViewController
{
  NavTrafficIncidentContaineeViewController *trafficIncidentViewController;
  NavTrafficIncidentContaineeViewController *v4;
  NavTrafficIncidentContaineeViewController *v5;

  trafficIncidentViewController = self->_trafficIncidentViewController;
  if (!trafficIncidentViewController)
  {
    v4 = -[NavTrafficIncidentContaineeViewController initWithNibName:bundle:]([NavTrafficIncidentContaineeViewController alloc], "initWithNibName:bundle:", 0, 0);
    v5 = self->_trafficIncidentViewController;
    self->_trafficIncidentViewController = v4;

    -[ContaineeViewController setContaineeDelegate:](self->_trafficIncidentViewController, "setContaineeDelegate:", self);
    -[NavTrafficIncidentContaineeViewController setDelegate:](self->_trafficIncidentViewController, "setDelegate:", self);
    trafficIncidentViewController = self->_trafficIncidentViewController;
  }
  return trafficIncidentViewController;
}

- (NavTrafficIncidentAlertViewController)alertViewController
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));
    v5 = (unint64_t)objc_msgSend(v4, "alertType");

    v6 = 0;
    if (v5 <= 6)
    {
      if (((1 << v5) & 0x66) != 0)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator trafficIncidentViewController](self, "trafficIncidentViewController"));
      }
      else if (((1 << v5) & 0x18) != 0)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator rerouteTrafficIncidentViewController](self, "rerouteTrafficIncidentViewController"));
      }
    }
  }
  else
  {
    v6 = 0;
  }
  return (NavTrafficIncidentAlertViewController *)v6;
}

- (void)presentAlertViewForTrafficIncidentAlert:(id)a3 responseCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  double v10;
  double v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  char v29;

  v6 = a3;
  if (v6)
  {
    v7 = a4;
    -[NavTrafficIncidentCoordinator setPresentedAlert:](self, "setPresentedAlert:", v6);
    -[NavTrafficIncidentCoordinator setResponseCallback:](self, "setResponseCallback:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[NavTrafficIncidentCoordinator setDisplayTime:](self, "setDisplayTime:", v8);

    -[NavTrafficIncidentCoordinator setDismissTime:](self, "setDismissTime:", 0);
    v9 = objc_msgSend(v6, "isReroute");
    objc_msgSend(v6, "alertDisplayDuration");
    v11 = v10;
    v12 = 1;
    if (objc_msgSend(v6, "shouldShowTimer") && v11 > 0.0)
      v12 = -[NavTrafficIncidentCoordinator _alertRequiresOptIn:](self, "_alertRequiresOptIn:", v6);
    if (v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator rerouteTrafficIncidentViewController](self, "rerouteTrafficIncidentViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cardPresentationController"));
      objc_msgSend(v14, "setPresentedModally:", 1);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](self, "alertViewController"));
    objc_msgSend(v15, "setIncidentAlert:", v6);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](self, "alertViewController"));
    objc_msgSend(v16, "setProgressBarHidden:", v12);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentationDelegate](self, "presentationDelegate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](self, "alertViewController"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1003B1298;
    v27[3] = &unk_1011B4060;
    v27[4] = self;
    v19 = v6;
    v28 = v19;
    v29 = v9;
    objc_msgSend(v17, "presentTrafficIncidentViewController:completion:", v18, v27);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "alertID"));
    v22 = objc_msgSend(v19, "isReroute");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "alertTitles"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "alertDescriptions"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
    objc_msgSend(v20, "showTrafficIncidentAlertWithID:withReroute:title:description:", v21, v22, v24, v26);

    -[NavTrafficIncidentCoordinator _sendTrafficFeedbackForAlert:actionType:](self, "_sendTrafficFeedbackForAlert:actionType:", v19, 4);
  }

}

- (void)_updateProgressTimerForAlert:(id)a3
{
  double v4;
  double v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "alertDisplayDuration");
  v5 = v4;
  if (!objc_msgSend(v14, "shouldShowTimer") || v5 <= 0.0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](self, "alertViewController"));
    objc_msgSend(v12, "setProgressBarHidden:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v13, "invalidate");

    goto LABEL_7;
  }
  v6 = -[NavTrafficIncidentCoordinator _alertRequiresOptIn:](self, "_alertRequiresOptIn:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](self, "alertViewController"));
  objc_msgSend(v7, "setProgressBarHidden:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator timeoutTimer](self, "timeoutTimer"));
  objc_msgSend(v8, "invalidate");

  if (v6)
  {
LABEL_7:
    -[NavTrafficIncidentCoordinator setTimeoutTimer:](self, "setTimeoutTimer:", 0);
    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_dismissTrafficAlertWithTimer:", v14, 0, v5));
  -[NavTrafficIncidentCoordinator setTimeoutTimer:](self, "setTimeoutTimer:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](self, "alertViewController"));
  v11 = objc_msgSend(v10, "progressBarHidden");

  if ((v11 & 1) == 0)
    -[NavTrafficIncidentCoordinator _animateProgressWithDuration:startValue:](self, "_animateProgressWithDuration:startValue:", v5, 0.0);
LABEL_8:

}

- (void)dismissAlertViewForTrafficIncidentAlert:(id)a3 acceptedNewRoute:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 1;
  else
    v4 = 2;
  -[NavTrafficIncidentCoordinator dismissAlertViewForTrafficIncidentAlert:actionType:target:](self, "dismissAlertViewForTrafficIncidentAlert:actionType:target:", a3, v4, 739);
}

- (void)dismissAlertViewForTrafficIncidentAlert:(id)a3 actionType:(int64_t)a4 target:(int)a5
{
  id v7;
  id v8;

  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));

  if (v8 == v7)
    -[NavTrafficIncidentCoordinator _dismissTrafficAlertWithActionType:target:](self, "_dismissTrafficAlertWithActionType:target:", a4, 739);
}

- (void)dismissVisibleTrafficAlertView:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 5;
  else
    v3 = 6;
  -[NavTrafficIncidentCoordinator _dismissTrafficAlertWithActionType:target:](self, "_dismissTrafficAlertWithActionType:target:", v3, 739);
}

- (void)updatedAlertViewWithTrafficIncidentAlert:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bannerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bannerID"));
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));
    v9 = objc_msgSend(v8, "shouldShowTimer");
    v10 = objc_msgSend(v12, "shouldShowTimer");

    if (v9 != v10)
      -[NavTrafficIncidentCoordinator _updateProgressTimerForAlert:](self, "_updateProgressTimerForAlert:", v12);
    -[NavTrafficIncidentCoordinator setPresentedAlert:](self, "setPresentedAlert:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](self, "alertViewController"));
    objc_msgSend(v11, "setIncidentAlert:", v12);

  }
}

- (void)didTapRejectButtonOnTrafficIncidentAlertViewControllerTarget:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](self, "alertViewController"));
  v6 = objc_opt_class(TrafficIncidentOptionalRerouteContaineeViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = 2;
  else
    v7 = 4;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));
  -[NavTrafficIncidentCoordinator dismissAlertViewForTrafficIncidentAlert:actionType:target:](self, "dismissAlertViewForTrafficIncidentAlert:actionType:target:", v8, v7, v3);

}

- (void)didTapAcceptButtonOnTrafficIncidentAlertViewControllerTarget:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](self, "alertViewController"));
  v6 = objc_opt_class(TrafficIncidentOptionalRerouteContaineeViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = 1;
  else
    v7 = 3;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));
  -[NavTrafficIncidentCoordinator dismissAlertViewForTrafficIncidentAlert:actionType:target:](self, "dismissAlertViewForTrafficIncidentAlert:actionType:target:", v8, v7, v3);

}

- (void)_didVoteAlert:(id)a3 type:(int)a4 target:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  uint64_t v23;
  TrafficIncidentReport *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  __CFString *v35;
  id v36;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v36 = v8;
  if ((_DWORD)v6 != 4 || (v9 = objc_msgSend(v8, "acceptButtonDisplay") == 1, v8 = v36, v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incident"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "incidentId"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "incident"));
    if ((objc_msgSend(v12, "hasPosition") & 1) != 0)
    {
      v13 = objc_alloc((Class)GEOLocation);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "incident"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "position"));
      objc_msgSend(v15, "lat");
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "incident"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "position"));
      objc_msgSend(v19, "lng");
      v21 = objc_msgSend(v13, "initWithLatitude:longitude:", v17, v20);

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentLocation"));
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "incident"));
    v23 = +[TrafficIncidentLayoutItem geoTrafficIncidentTypeForRouteIncidentType:](TrafficIncidentLayoutItem, "geoTrafficIncidentTypeForRouteIncidentType:", objc_msgSend(v22, "type"));

    v24 = -[TrafficIncidentReport initWithIncidentLocation:type:userPath:]([TrafficIncidentReport alloc], "initWithIncidentLocation:type:userPath:", v21, v23, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "incident"));

    if ((_DWORD)v6 == 3 && v25)
    {
      v26 = objc_alloc((Class)VKTrafficIncidentFeature);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "incident"));
      v28 = objc_msgSend(v26, "initWithRouteIncident:routeOffsetInMeters:routeRelevance:onRoute:", v27, 0, 0, 0);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
      objc_msgSend(v29, "removeTrafficIncidentFeature:", v28);

    }
    -[TrafficIncidentReport submitFeedbackForType:incidentId:completionHandler:](v24, "submitFeedbackForType:incidentId:completionHandler:", v6, v11, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v31 = +[TrafficIncidentReport actionForVoteType:](TrafficIncidentReport, "actionForVoteType:", v6);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "incident"));
    v34 = objc_msgSend(v33, "type");
    v35 = CFSTR("ACCIDENT");
    switch((int)v34)
    {
      case 0:
        break;
      case 1:
        v35 = CFSTR("CONSTRUCTION");
        break;
      case 2:
        v35 = CFSTR("ROAD_CLOSURE");
        break;
      case 3:
        v35 = CFSTR("EVENT");
        break;
      case 4:
        v35 = CFSTR("HAZARD");
        break;
      case 5:
        v35 = CFSTR("LANE_CLOSURE");
        break;
      case 6:
        v35 = CFSTR("RAMP_CLOSURE");
        break;
      case 7:
        v35 = CFSTR("TRAFFIC");
        break;
      case 8:
        v35 = CFSTR("WALKING_CLOSURE");
        break;
      case 9:
        v35 = CFSTR("CONGESTION_ZONE_RESTRICTION");
        break;
      case 10:
        v35 = CFSTR("LICENSE_PLATE_RESTRICTION");
        break;
      case 11:
      case 12:
        goto LABEL_14;
      case 13:
        v35 = CFSTR("SPEED_TRAP");
        break;
      case 14:
        v35 = CFSTR("AREA_INCIDENT");
        break;
      default:
        if ((_DWORD)v34 == 100)
          v35 = CFSTR("TIME_BASED_RESTRICTION");
        else
LABEL_14:
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v34));
        break;
    }
    objc_msgSend(v30, "captureUserAction:onTarget:eventValue:", v31, v5, v35);

    v8 = v36;
  }

}

- (int)_voteTypeAlertWithResult:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 3)
    return 1;
  else
    return dword_100E34A60[a3 - 3];
}

- (int)_GEOTrafficFeedbackTypeForAction:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return dword_100E35648[a3 - 1];
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "originalRoute"));
  if ((objc_msgSend(v5, "isEVRoute") & 1) == 0)
  {

    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "originalRouteNavigability"));
  v7 = objc_msgSend(v6, "isEvFeasible");

  if ((v7 & 1) != 0)
  {
LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v9 = v8;
    v10 = 3059;
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v9 = v8;
  v10 = 6099;
LABEL_6:
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", v10, 615, 0);

  -[NavTrafficIncidentCoordinator dismissAlertViewForTrafficIncidentAlert:actionType:target:](self, "dismissAlertViewForTrafficIncidentAlert:actionType:target:", v11, 5, 739);
}

- (void)_dismissTrafficAlertWithTimer:(id)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
  v5 = objc_opt_class(MNTrafficIncidentAlert);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
  else
    v7 = objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bannerID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bannerID"));
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
    -[NavTrafficIncidentCoordinator _dismissTrafficAlertWithActionType:target:](self, "_dismissTrafficAlertWithActionType:target:", 6, 739);

}

- (void)_dismissTrafficAlertWithActionType:(int64_t)a3 target:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NavTrafficIncidentCoordinator *v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  NavTrafficIncidentCoordinator *obj;
  uint8_t buf[4];
  int64_t v24;

  v4 = *(_QWORD *)&a4;
  obj = self;
  objc_sync_enter(obj);
  if (-[NavTrafficIncidentCoordinator isDismissing](obj, "isDismissing")
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](obj, "presentedAlert")),
        v6,
        !v6))
  {
    objc_sync_exit(obj);

  }
  else
  {
    -[NavTrafficIncidentCoordinator setIsDismissing:](obj, "setIsDismissing:", 1);
    objc_sync_exit(obj);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[NavTrafficIncidentCoordinator setDismissTime:](obj, "setDismissTime:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator timeoutTimer](obj, "timeoutTimer"));
    objc_msgSend(v8, "invalidate");

    if (qword_1014D2320 != -1)
      dispatch_once(&qword_1014D2320, &stru_1011B4080);
    v9 = qword_1014D2318;
    if (os_log_type_enabled((os_log_t)qword_1014D2318, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v24 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Dismissing TrafficAlert with actionType: %ld", buf, 0xCu);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](obj, "alertViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](obj, "presentedAlert"));
    -[NavTrafficIncidentCoordinator setPresentedAlert:](obj, "setPresentedAlert:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator responseCallback](obj, "responseCallback"));
    v13 = v12 == 0;

    if (!v13)
    {
      v14 = obj;
      if (a3 == 1)
      {
        v15 = 1;
      }
      else if (a3 == 6)
      {
        v15 = -[NavTrafficIncidentCoordinator _alertRequiresOptIn:](obj, "_alertRequiresOptIn:", v11) ^ 1;
        v14 = obj;
      }
      else
      {
        v15 = 0;
      }
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator responseCallback](v14, "responseCallback"));
      v16[2](v16, v15);

      -[NavTrafficIncidentCoordinator setResponseCallback:](obj, "setResponseCallback:", 0);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentationDelegate](obj, "presentationDelegate"));
    objc_msgSend(v17, "dismissTrafficIncidentViewController:", v10);

    -[NavTrafficIncidentCoordinator _sendTrafficFeedbackForAlert:actionType:](obj, "_sendTrafficFeedbackForAlert:actionType:", v11, -[NavTrafficIncidentCoordinator _GEOTrafficFeedbackTypeForAction:](obj, "_GEOTrafficFeedbackTypeForAction:", a3));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
    objc_msgSend(v18, "dismissTrafficIncidentAlert:", v11);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "alertID"));
    objc_msgSend(v19, "clearTrafficIncidentBulletinWithAlertID:", v20);

    v21 = !-[NavTrafficIncidentCoordinator _alertVotable:](obj, "_alertVotable:", v11);
    if (a3 == 5)
      LOBYTE(v21) = 1;
    if ((v21 & 1) == 0)
      -[NavTrafficIncidentCoordinator _didVoteAlert:type:target:](obj, "_didVoteAlert:type:target:", v11, -[NavTrafficIncidentCoordinator _voteTypeAlertWithResult:](obj, "_voteTypeAlertWithResult:", a3), v4);
    -[NavTrafficIncidentCoordinator setIsDismissing:](obj, "setIsDismissing:", 0);

  }
}

- (void)_animateProgressWithDuration:(double)a3 startValue:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](self, "alertViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v9, "removeAllAnimations");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](self, "alertViewController"));
  objc_msgSend(v10, "setRerouteTimerProgress:", a4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator alertViewController](self, "alertViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v12, "layoutIfNeeded");

  v13[4] = self;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003B217C;
  v14[3] = &unk_1011AC860;
  v14[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003B21E4;
  v13[3] = &unk_1011AE8F8;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v13, a3);
}

- (void)_didBecomeActive:(id)a3
{
  void *v4;
  unsigned int v5;
  double v6;
  double v7;

  if (-[NavTrafficIncidentCoordinator _hasValidRerouteTimer](self, "_hasValidRerouteTimer", a3)
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert")),
        v5 = -[NavTrafficIncidentCoordinator _alertVotable:](self, "_alertVotable:", v4),
        v4,
        v5))
  {
    v6 = 0.0;
    v7 = 0.0;
    -[NavTrafficIncidentCoordinator _getTimeoutTimerProgress:timeRemaining:](self, "_getTimeoutTimerProgress:timeRemaining:", &v7, &v6);
    if (v6 > 0.0)
      -[NavTrafficIncidentCoordinator _animateProgressWithDuration:startValue:](self, "_animateProgressWithDuration:startValue:", v6, v7);
  }
}

- (void)_getTimeoutTimerProgress:(double *)a3 timeRemaining:(double *)a4
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));
  objc_msgSend(v7, "alertDisplayDuration");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator timeoutTimer](self, "timeoutTimer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fireDate"));
  objc_msgSend(v11, "timeIntervalSinceNow");
  v12 = 0.0;
  if (v13 > 0.0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator timeoutTimer](self, "timeoutTimer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fireDate"));
    objc_msgSend(v15, "timeIntervalSinceNow");
    v12 = v16;

  }
  if (v12 >= v9)
    v17 = v9;
  else
    v17 = v12;
  if (a4)
    *a4 = v17;
  if (a3)
  {
    if (v9 == 0.0)
      v18 = 0.0;
    else
      v18 = fmin(fmax((v9 - v17) / v9, 0.0), 1.0);
    *a3 = v18;
  }
}

- (double)_timeoutTimerProgress
{
  double v3;

  v3 = 0.0;
  -[NavTrafficIncidentCoordinator _getTimeoutTimerProgress:timeRemaining:](self, "_getTimeoutTimerProgress:timeRemaining:", &v3, 0);
  return v3;
}

- (BOOL)_hasValidRerouteTimer
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator timeoutTimer](self, "timeoutTimer"));
  if (objc_msgSend(v3, "isValid"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));
    if (objc_msgSend(v4, "isReroute"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator presentedAlert](self, "presentedAlert"));
      v6 = objc_msgSend(v5, "isAutomaticReroute");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_sendTrafficFeedbackForAlert:(id)a3 actionType:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;

  v4 = *(_QWORD *)&a4;
  v29 = a3;
  v6 = objc_alloc_init((Class)GEOTrafficRerouteFeedback);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "etaResponseID"));
  objc_msgSend(v6, "setResponseId:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "alternateRoute"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverRouteID"));
  objc_msgSend(v6, "setReroutedRouteID:", v9);

  objc_msgSend(v29, "newEstimatedTime");
  objc_msgSend(v6, "setReroutedRouteTravelTime:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "alternateRoute"));
  objc_msgSend(v6, "setReroutedRouteHistoricTravelTime:", objc_msgSend(v11, "historicTravelTime"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "originalRoute"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serverRouteID"));
  objc_msgSend(v6, "setOldRouteID:", v13);

  objc_msgSend(v29, "oldEstimatedTime");
  objc_msgSend(v6, "setOldRouteTravelTime:", v14);
  objc_msgSend(v29, "oldHistoricTime");
  objc_msgSend(v6, "setOldRouteHistoricTravelTime:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "oldRouteIncidents"));
  objc_msgSend(v6, "setOldRouteIncidents:", v16);

  objc_msgSend(v6, "setActionType:", v4);
  objc_msgSend(v6, "setBackgrounded:", +[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground](UIApplication, "_maps_isAnyApplicationOrCarPlayApplicationSceneForeground") ^ 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bannerID"));
  objc_msgSend(v6, "setDisplayedBannerId:", v17);

  objc_msgSend(v29, "distanceToDestination");
  objc_msgSend(v6, "setDistanceToDestination:");
  v18 = objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator displayTime](self, "displayTime"));
  if (v18)
  {
    v19 = (void *)v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator dismissTime](self, "dismissTime"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator dismissTime](self, "dismissTime"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentCoordinator displayTime](self, "displayTime"));
      objc_msgSend(v21, "timeIntervalSinceDate:", v22);
      v24 = v23;

      objc_msgSend(v6, "setBannerDurationSeconds:", v24);
    }
  }
  v25 = objc_msgSend(v29, "alertType");
  v26 = 1;
  switch((unint64_t)v25)
  {
    case 0uLL:
    case 5uLL:
    case 7uLL:
      v26 = 0;
      goto LABEL_10;
    case 1uLL:
      goto LABEL_10;
    case 2uLL:
    case 6uLL:
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "incident", 1));

      if (v27)
        v26 = 5;
      else
        v26 = 3;
      goto LABEL_10;
    case 3uLL:
    case 4uLL:
      v26 = 2;
LABEL_10:
      objc_msgSend(v6, "setAlertType:", v26);
      break;
    default:
      break;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector", v26));
  objc_msgSend(v28, "addTrafficRerouteFeedback:", v6);

}

- (BOOL)_alertRequiresOptIn:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  if (objc_msgSend(v3, "isReroute"))
    v4 = objc_msgSend(v3, "isAutomaticReroute") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)_alertVotable:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "alertType") == (id)1 || objc_msgSend(v3, "alertType") == (id)2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "acceptButtonTitle"));
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NavTrafficIncidentPresentation)presentationDelegate
{
  return (NavTrafficIncidentPresentation *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (MNTrafficIncidentAlert)presentedAlert
{
  return self->_presentedAlert;
}

- (void)setPresentedAlert:(id)a3
{
  objc_storeStrong((id *)&self->_presentedAlert, a3);
}

- (id)responseCallback
{
  return self->_responseCallback;
}

- (void)setResponseCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (NSDate)displayTime
{
  return self->_displayTime;
}

- (void)setDisplayTime:(id)a3
{
  objc_storeStrong((id *)&self->_displayTime, a3);
}

- (NSDate)dismissTime
{
  return self->_dismissTime;
}

- (void)setDismissTime:(id)a3
{
  objc_storeStrong((id *)&self->_dismissTime, a3);
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTime, 0);
  objc_storeStrong((id *)&self->_displayTime, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_responseCallback, 0);
  objc_storeStrong((id *)&self->_presentedAlert, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_trafficIncidentViewController, 0);
  objc_storeStrong((id *)&self->_rerouteTrafficIncidentViewController, 0);
}

@end
