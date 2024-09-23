@implementation CarTrafficAlertCardViewController

- (CarTrafficAlertCardViewController)initWithDelegate:(id)a3 trafficAlert:(id)a4 response:(id)a5
{
  id v8;
  id v9;
  id v10;
  CarTrafficAlertCardViewController *v11;
  CarTrafficAlertCardViewController *v12;
  id v13;
  id response;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CarTrafficAlertCardViewController;
  v11 = -[CarTrafficAlertCardViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_trafficAlert, a4);
    v13 = objc_retainBlock(v10);
    response = v12->_response;
    v12->_response = v13;

  }
  return v12;
}

- (void)loadView
{
  CarTrafficAlertView *v3;
  void *v4;
  void *v5;
  CarTrafficAlertView *v6;

  v3 = [CarTrafficAlertView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](self, "trafficAlert"));
  v6 = -[CarTrafficAlertView initWithDelegate:trafficAlert:](v3, "initWithDelegate:trafficAlert:", self, v4);

  -[CarTrafficAlertView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CarTrafficAlertCardViewController setView:](self, "setView:", v6);
  -[CarTrafficAlertCardViewController setTrafficAlertView:](self, "setTrafficAlertView:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](self, "trafficAlert"));
  -[CarTrafficAlertCardViewController _sendTrafficFeedbackForAlert:actionType:](self, "_sendTrafficFeedbackForAlert:actionType:", v5, 4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarTrafficAlertCardViewController;
  -[CarTrafficAlertCardViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_didReceiveIncidentUpdate:", CFSTR("SiriTrafficIncidentUpdateNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](self->_trafficAlert, "analyticsMessage"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](self->_trafficAlert, "analyticsMessage"));
    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 248, 1001, v7);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarTrafficAlertCardViewController;
  -[CarTrafficAlertCardViewController viewDidAppear:](&v9, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v7 = objc_msgSend(v6, "activationState");

  if (v7)
    -[CarTrafficAlertCardViewController _registerForSceneNotifications](self, "_registerForSceneNotifications");
  else
    -[CarTrafficAlertCardViewController _startProgressAnimationIfNeeded](self, "_startProgressAnimationIfNeeded");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[CarTrafficAlertCardViewController setDisplayTime:](self, "setDisplayTime:", v8);

  -[CarTrafficAlertCardViewController setDismissTime:](self, "setDismissTime:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarTrafficAlertCardViewController;
  -[CarTrafficAlertCardViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  -[CarTrafficAlertCardViewController _cancelDismissTimer](self, "_cancelDismissTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)_registerForSceneNotifications
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  CarTrafficAlertCardViewController *v8;
  CarTrafficAlertCardViewController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint8_t buf[4];
  __CFString *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));

  if (!v5)
  {
    v7 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v8 = self;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_10;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{public}@] CarTrafficAlert card failed to get scene to register for lifecycle events.", buf, 0xCu);

    goto LABEL_13;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  -[NSObject addObserver:selector:name:object:](v6, "addObserver:selector:name:object:", self, "_sceneDidActivate:", UISceneDidActivateNotification, v5);
LABEL_13:

}

- (void)_sceneDidActivate:(id)a3
{
  id v4;

  if (!-[CarTrafficAlertCardViewController hasStartedAnimatingProgressBar](self, "hasStartedAnimatingProgressBar", a3))
  {
    -[CarTrafficAlertCardViewController _startProgressAnimationIfNeeded](self, "_startProgressAnimationIfNeeded");
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:", self);

  }
}

- (void)_startProgressAnimationIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  if (!-[CarTrafficAlertCardViewController hasStartedAnimatingProgressBar](self, "hasStartedAnimatingProgressBar"))
  {
    if (-[CarTrafficAlertCardViewController isViewLoaded](self, "isViewLoaded"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController view](self, "view"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

      if (v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](self, "trafficAlert"));
        v6 = objc_msgSend(v5, "shouldShowTimer") ^ 1;
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlertView](self, "trafficAlertView"));
        objc_msgSend(v7, "setProgressBarHidden:", v6);

        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](self, "trafficAlert"));
        objc_msgSend(v8, "alertDisplayDuration");
        v10 = v9;

        if (v10 > 0.0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](self, "trafficAlert"));
          v12 = objc_msgSend(v11, "shouldShowTimer");

          if (v12)
          {
            objc_initWeak(&location, self);
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlertView](self, "trafficAlertView"));
            objc_msgSend(v13, "setAcceptProgress:", 0.0);

            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_10025F218;
            v17[3] = &unk_1011AD260;
            objc_copyWeak(&v18, &location);
            +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v17, 0, v10);
            -[CarTrafficAlertCardViewController setStartedAnimatingProgressBar:](self, "setStartedAnimatingProgressBar:", 1);
            -[CarTrafficAlertCardViewController _cancelDismissTimer](self, "_cancelDismissTimer");
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            v15[2] = sub_10025F260;
            v15[3] = &unk_1011ADF20;
            objc_copyWeak(&v16, &location);
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v15, v10));
            -[CarTrafficAlertCardViewController setDismissTimer:](self, "setDismissTimer:", v14);

            objc_destroyWeak(&v16);
            objc_destroyWeak(&v18);
            objc_destroyWeak(&location);
          }
        }
      }
    }
  }
}

- (void)_cancelDismissTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController dismissTimer](self, "dismissTimer"));
  objc_msgSend(v3, "invalidate");

  -[CarTrafficAlertCardViewController setDismissTimer:](self, "setDismissTimer:", 0);
}

- (void)updateFromTrafficAlert:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CarTrafficAlertCardViewController setTrafficAlert:](self, "setTrafficAlert:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlertView](self, "trafficAlertView"));
  objc_msgSend(v5, "setTrafficAlert:", v4);

  -[CarTrafficAlertCardViewController _startProgressAnimationIfNeeded](self, "_startProgressAnimationIfNeeded");
}

- (void)_dismissTrafficAlertWithResult:(int64_t)a3
{
  -[CarTrafficAlertCardViewController setStartedAnimatingProgressBar:](self, "setStartedAnimatingProgressBar:", 0);
  -[CarTrafficAlertCardViewController _dismissTrafficAlertWithResult:onTarget:](self, "_dismissTrafficAlertWithResult:onTarget:", a3, 1001);
}

- (void)_dismissTrafficAlertWithResult:(int64_t)a3 onTarget:(int)a4
{
  uint64_t v4;
  id v7;
  id v8;
  NSObject *v9;
  CarTrafficAlertCardViewController *v10;
  CarTrafficAlertCardViewController *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  CarTrafficAlertCardViewController *v40;
  objc_class *v41;
  NSString *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  CarTrafficAlertCardViewController *obj;
  uint8_t buf[4];
  __CFString *v50;
  __int16 v51;
  int64_t v52;

  v4 = *(_QWORD *)&a4;
  -[CarTrafficAlertCardViewController _cancelDismissTimer](self, "_cancelDismissTimer");
  obj = self;
  objc_sync_enter(obj);
  if (-[CarTrafficAlertCardViewController isDismissing](obj, "isDismissing"))
  {
    objc_sync_exit(obj);

    return;
  }
  -[CarTrafficAlertCardViewController setIsDismissing:](obj, "setIsDismissing:", 1);
  objc_sync_exit(obj);

  v7 = (id)-[CarTrafficAlertCardViewController _feedbackActionTypeFor:](obj, "_feedbackActionTypeFor:", a3);
  v8 = sub_10043364C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = obj;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_10;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138543618;
    v50 = v17;
    v51 = 1024;
    LODWORD(v52) = (_DWORD)v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] CarTrafficAlertCardViewController: Dismissing TrafficAlert with actionType: %d", buf, 0x12u);

  }
  if ((_DWORD)v7 == 1)
  {
    v20 = 1;
  }
  else if ((_DWORD)v7 == 3)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](obj, "trafficAlert"));
    v19 = -[CarTrafficAlertCardViewController _alertRequiresOptIn:](obj, "_alertRequiresOptIn:", v18);

    v20 = v19 ^ 1;
  }
  else
  {
    v20 = 0;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController response](obj, "response"));
  v22 = v21 == 0;

  if (!v22)
  {
    v23 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController response](obj, "response"));
    v23[2](v23, v20);

    -[CarTrafficAlertCardViewController setResponse:](obj, "setResponse:", 0);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[CarTrafficAlertCardViewController setDismissTime:](obj, "setDismissTime:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](obj, "trafficAlert"));
  -[CarTrafficAlertCardViewController _sendTrafficFeedbackForAlert:actionType:](obj, "_sendTrafficFeedbackForAlert:actionType:", v25, v7);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert originalRoute](obj->_trafficAlert, "originalRoute"));
  LODWORD(v25) = objc_msgSend(v26, "isEVRoute");

  if ((_DWORD)v25)
  {
    -[CarTrafficAlertCardViewController _recordEVAnalyticsWithResult:](obj, "_recordEVAnalyticsWithResult:", a3);
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](obj->_trafficAlert, "analyticsMessage"));

    if (v27)
    {
      if (a3 == 2)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](obj->_trafficAlert, "analyticsMessage"));
        objc_msgSend(v30, "captureUserAction:onTarget:eventValue:", 3061, 1001, v31);

      }
      else if (a3 == 1)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](obj->_trafficAlert, "analyticsMessage"));
        objc_msgSend(v28, "captureUserAction:onTarget:eventValue:", 3060, 1001, v29);

      }
    }
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](obj, "trafficAlert"));
  objc_msgSend(v32, "dismissTrafficIncidentAlert:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](obj, "trafficAlert"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "alertID"));
  objc_msgSend(v34, "clearTrafficIncidentBulletinWithAlertID:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](obj, "trafficAlert"));
  LODWORD(v35) = +[CarTrafficAlertCardViewController alertVotable:](CarTrafficAlertCardViewController, "alertVotable:", v37);

  if (!(_DWORD)v35)
    goto LABEL_36;
  v38 = sub_10043364C();
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    v40 = obj;
    v41 = (objc_class *)objc_opt_class(v40);
    v42 = NSStringFromClass(v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    if ((objc_opt_respondsToSelector(v40, "accessibilityIdentifier") & 1) != 0)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController performSelector:](v40, "performSelector:", "accessibilityIdentifier"));
      v45 = v44;
      if (v44 && !objc_msgSend(v44, "isEqualToString:", v43))
      {
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v43, v40, v45));

        goto LABEL_34;
      }

    }
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v43, v40));
LABEL_34:

    *(_DWORD *)buf = 138543618;
    v50 = v46;
    v51 = 2048;
    v52 = a3;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[%{public}@] CarTrafficAlertCardViewController: did vote on TrafficAlert: %ld", buf, 0x16u);

  }
  -[CarTrafficAlertCardViewController _didVoteIncident:onTarget:](obj, "_didVoteIncident:onTarget:", a3, v4);
LABEL_36:
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController delegate](obj, "delegate"));
  objc_msgSend(v47, "trafficAlertCardViewControllerDismiss:", obj);

  -[CarTrafficAlertCardViewController setIsDismissing:](obj, "setIsDismissing:", 0);
}

- (void)_recordEVAnalyticsWithResult:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  unsigned int v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  CarTrafficAlertCardViewController *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert originalRoute](self->_trafficAlert, "originalRoute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypoints"));
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alternateRoute](self->_trafficAlert, "alternateRoute"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waypoints"));
  v10 = objc_msgSend(v9, "count");

  if (v7 != v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alternateRoute](self->_trafficAlert, "alternateRoute"));
    objc_msgSend(v11, "offeredEVRerouteWithAlternateRoute:wasAccepted:", v12, 0);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert originalRoute](self->_trafficAlert, "originalRoute"));
  if ((objc_msgSend(v13, "isEVRoute") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alternateRoute](self->_trafficAlert, "alternateRoute"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v31 = v15;
      v16 = 6097;
LABEL_11:
      v21 = 1001;
LABEL_12:
      objc_msgSend(v15, "captureUserAction:onTarget:eventValue:", v16, v21, 0);

      return;
    }
  }
  else
  {

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert originalRoute](self->_trafficAlert, "originalRoute"));
  if ((objc_msgSend(v17, "isEVRoute") & 1) == 0)
  {

LABEL_14:
    v22 = sub_10043364C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
LABEL_21:

      return;
    }
    v24 = self;
    v25 = (objc_class *)objc_opt_class(v24);
    v26 = NSStringFromClass(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if ((objc_opt_respondsToSelector(v24, "accessibilityIdentifier") & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController performSelector:](v24, "performSelector:", "accessibilityIdentifier"));
      v29 = v28;
      if (v28 && !objc_msgSend(v28, "isEqualToString:", v27))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v27, v24, v29));

        goto LABEL_20;
      }

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v27, v24));
LABEL_20:

    *(_DWORD *)buf = 138543362;
    v33 = v30;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%{public}@] CarTrafficAlertCardViewController: tried to record EV CarPlay dodgeball, but received an unsupported state.", buf, 0xCu);

    goto LABEL_21;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert originalRouteNavigability](self->_trafficAlert, "originalRouteNavigability"));
  v19 = objc_msgSend(v18, "isEvFeasible");

  if ((v19 & 1) != 0)
    goto LABEL_14;
  v20 = -[MNTrafficIncidentAlert isReroute](self->_trafficAlert, "isReroute");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v31 = v15;
  if (v20)
  {
    v16 = 6095;
    goto LABEL_11;
  }
  objc_msgSend(v15, "captureUserAction:onTarget:eventValue:", 75, 1001, 0);

  if (a3 == 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v31 = v15;
    v16 = 6099;
    v21 = 615;
    goto LABEL_12;
  }
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
  v18 = objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController displayTime](self, "displayTime"));
  if (v18)
  {
    v19 = (void *)v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController dismissTime](self, "dismissTime"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController dismissTime](self, "dismissTime"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController displayTime](self, "displayTime"));
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
  if (objc_msgSend(v3, "alertType") == (id)2)
    v4 = objc_msgSend(v3, "isAutomaticReroute") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

+ (BOOL)alertVotable:(id)a3
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

- (void)_didVoteIncident:(int64_t)a3 onTarget:(int)a4
{
  uint64_t v4;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  __CFString *v28;
  id v29;

  v4 = *(_QWORD *)&a4;
  v7 = -[CarTrafficAlertCardViewController _voteTypeAlertWithResult:](self, "_voteTypeAlertWithResult:");
  if ((_DWORD)v7 != 1)
  {
    v12 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](self, "trafficAlert"));
    v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "incident"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "incidentId"));
    v14 = +[TrafficIncidentLayoutItem geoTrafficIncidentTypeForRouteIncidentType:](TrafficIncidentLayoutItem, "geoTrafficIncidentTypeForRouteIncidentType:", objc_msgSend(v29, "type"));
    if ((objc_msgSend(v29, "hasPosition") & 1) != 0)
    {
      v15 = objc_alloc((Class)GEOLocation);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "position"));
      objc_msgSend(v16, "lat");
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "position"));
      objc_msgSend(v19, "lng");
      v9 = objc_msgSend(v15, "initWithLatitude:longitude:", v18, v20);

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentLocation"));
    }

    v11 = -[TrafficIncidentReport initWithIncidentLocation:type:userPath:]([TrafficIncidentReport alloc], "initWithIncidentLocation:type:userPath:", v9, v14, 3);
    -[__CFString setReportedFromCarplay:](v11, "setReportedFromCarplay:", 1);
    if ((_DWORD)v12 == 3 && v29)
    {
      v21 = objc_msgSend(objc_alloc((Class)VKTrafficIncidentFeature), "initWithRouteIncident:routeOffsetInMeters:routeRelevance:onRoute:", v29, 0, 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
      objc_msgSend(v22, "removeTrafficIncidentFeature:", v21);

    }
    -[__CFString submitFeedbackForType:incidentId:completionHandler:](v11, "submitFeedbackForType:incidentId:completionHandler:", v12, v8, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v24 = +[TrafficIncidentReport actionForVoteType:](TrafficIncidentReport, "actionForVoteType:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](self, "trafficAlert"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "incident"));
    v27 = objc_msgSend(v26, "type");
    v28 = CFSTR("ACCIDENT");
    switch((int)v27)
    {
      case 0:
        break;
      case 1:
        v28 = CFSTR("CONSTRUCTION");
        break;
      case 2:
        v28 = CFSTR("ROAD_CLOSURE");
        break;
      case 3:
        v28 = CFSTR("EVENT");
        break;
      case 4:
        v28 = CFSTR("HAZARD");
        break;
      case 5:
        v28 = CFSTR("LANE_CLOSURE");
        break;
      case 6:
        v28 = CFSTR("RAMP_CLOSURE");
        break;
      case 7:
        v28 = CFSTR("TRAFFIC");
        break;
      case 8:
        v28 = CFSTR("WALKING_CLOSURE");
        break;
      case 9:
        v28 = CFSTR("CONGESTION_ZONE_RESTRICTION");
        break;
      case 10:
        v28 = CFSTR("LICENSE_PLATE_RESTRICTION");
        break;
      case 11:
      case 12:
        goto LABEL_16;
      case 13:
        v28 = CFSTR("SPEED_TRAP");
        break;
      case 14:
        v28 = CFSTR("AREA_INCIDENT");
        break;
      default:
        if ((_DWORD)v27 == 100)
          v28 = CFSTR("TIME_BASED_RESTRICTION");
        else
LABEL_16:
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v27));
        break;
    }
    objc_msgSend(v23, "captureUserAction:onTarget:eventValue:", v24, v4, v28);

    goto LABEL_44;
  }
  if (a3 == 5)
  {
    v29 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlert](self, "trafficAlert"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incident"));
    v10 = objc_msgSend(v9, "type");
    v11 = CFSTR("ACCIDENT");
    switch((int)v10)
    {
      case 0:
        break;
      case 1:
        v11 = CFSTR("CONSTRUCTION");
        break;
      case 2:
        v11 = CFSTR("ROAD_CLOSURE");
        break;
      case 3:
        v11 = CFSTR("EVENT");
        break;
      case 4:
        v11 = CFSTR("HAZARD");
        break;
      case 5:
        v11 = CFSTR("LANE_CLOSURE");
        break;
      case 6:
        v11 = CFSTR("RAMP_CLOSURE");
        break;
      case 7:
        v11 = CFSTR("TRAFFIC");
        break;
      case 8:
        v11 = CFSTR("WALKING_CLOSURE");
        break;
      case 9:
        v11 = CFSTR("CONGESTION_ZONE_RESTRICTION");
        break;
      case 10:
        v11 = CFSTR("LICENSE_PLATE_RESTRICTION");
        break;
      case 11:
      case 12:
        goto LABEL_31;
      case 13:
        v11 = CFSTR("SPEED_TRAP");
        break;
      case 14:
        v11 = CFSTR("AREA_INCIDENT");
        break;
      default:
        if ((_DWORD)v10 == 100)
          v11 = CFSTR("TIME_BASED_RESTRICTION");
        else
LABEL_31:
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v10));
        break;
    }
    objc_msgSend(v29, "captureUserAction:onTarget:eventValue:", 108, v4, v11);
LABEL_44:

  }
}

- (int)_voteTypeAlertWithResult:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 3)
    return 1;
  else
    return dword_100E34A60[a3 - 3];
}

- (NSArray)focusOrderSubItems
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlertView](self, "trafficAlertView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "focusOrderSubItems"));

  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertCardViewController trafficAlertView](self, "trafficAlertView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredFocusEnvironments"));

  return (NSArray *)v3;
}

- (void)trafficAlertView:(id)a3 didDismissWithResult:(int64_t)a4
{
  -[CarTrafficAlertCardViewController _dismissTrafficAlertWithResult:](self, "_dismissTrafficAlertWithResult:", a4);
}

- (int)_feedbackActionTypeFor:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 1;
  else
    return dword_100E34A40[a3];
}

- (void)_didReceiveIncidentUpdate:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("SiriTrafficIncidentIsClearKey")));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    v7 = 4;
  else
    v7 = 3;
  -[CarTrafficAlertCardViewController _dismissTrafficAlertWithResult:onTarget:](self, "_dismissTrafficAlertWithResult:onTarget:", v7, 0);
}

- (CarTrafficAlertCardViewControllerDelegate)delegate
{
  return (CarTrafficAlertCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MNTrafficIncidentAlert)trafficAlert
{
  return self->_trafficAlert;
}

- (void)setTrafficAlert:(id)a3
{
  objc_storeStrong((id *)&self->_trafficAlert, a3);
}

- (CarTrafficAlertView)trafficAlertView
{
  return self->_trafficAlertView;
}

- (void)setTrafficAlertView:(id)a3
{
  objc_storeStrong((id *)&self->_trafficAlertView, a3);
}

- (id)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (NSTimer)dismissTimer
{
  return self->_dismissTimer;
}

- (void)setDismissTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissTimer, a3);
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

- (BOOL)hasStartedAnimatingProgressBar
{
  return self->_startedAnimatingProgressBar;
}

- (void)setStartedAnimatingProgressBar:(BOOL)a3
{
  self->_startedAnimatingProgressBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTime, 0);
  objc_storeStrong((id *)&self->_displayTime, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_response, 0);
  objc_storeStrong((id *)&self->_trafficAlertView, 0);
  objc_storeStrong((id *)&self->_trafficAlert, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
