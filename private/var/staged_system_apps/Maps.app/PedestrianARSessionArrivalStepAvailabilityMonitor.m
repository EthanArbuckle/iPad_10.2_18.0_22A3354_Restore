@implementation PedestrianARSessionArrivalStepAvailabilityMonitor

- (PedestrianARSessionArrivalStepAvailabilityMonitor)initWithObserver:(id)a3 platformController:(id)a4 navigationService:(id)a5 locationManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PedestrianARSessionArrivalStepAvailabilityMonitor *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id WeakRetained;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  char *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  char *v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  char *v41;
  objc_super v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  const char *v50;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    v27 = sub_1004318FC();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v44 = "-[PedestrianARSessionArrivalStepAvailabilityMonitor initWithObserver:platformController:navigationService:locationManager:]";
      v45 = 2080;
      v46 = "PedestrianARSessionArrivalStepAvailabilityMonitor.m";
      v47 = 1024;
      v48 = 58;
      v49 = 2080;
      v50 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v29 = sub_1004318FC();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v44 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v12)
  {
    v32 = sub_1004318FC();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v44 = "-[PedestrianARSessionArrivalStepAvailabilityMonitor initWithObserver:platformController:navigationService:locationManager:]";
      v45 = 2080;
      v46 = "PedestrianARSessionArrivalStepAvailabilityMonitor.m";
      v47 = 1024;
      v48 = 59;
      v49 = 2080;
      v50 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v34 = sub_1004318FC();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v44 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v13)
  {
    v37 = sub_1004318FC();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v44 = "-[PedestrianARSessionArrivalStepAvailabilityMonitor initWithObserver:platformController:navigationService:locationManager:]";
      v45 = 2080;
      v46 = "PedestrianARSessionArrivalStepAvailabilityMonitor.m";
      v47 = 1024;
      v48 = 60;
      v49 = 2080;
      v50 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v39 = sub_1004318FC();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v44 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v42.receiver = self;
  v42.super_class = (Class)PedestrianARSessionArrivalStepAvailabilityMonitor;
  v14 = -[PedestrianARSessionMonitor initWithObserver:](&v42, "initWithObserver:", v10);
  if (v14)
  {
    v15 = sub_1006DC410();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v44 = (const char *)v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v17, "addObserver:forKeyPath:options:context:", v14, CFSTR("PedestrianARInjectFakeStorefrontArrivalDataKey"), 1, 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v18, "addObserver:forKeyPath:options:context:", v14, CFSTR("PedestrianARForceShowArrivalOnLastStepKey"), 1, 0);

    v19 = objc_storeWeak((id *)&v14->_platformController, v11);
    objc_msgSend(v11, "addObserver:", v14);

    objc_storeWeak((id *)&v14->_locationManager, v13);
    v20 = objc_storeWeak((id *)&v14->_navigationService, v12);
    objc_msgSend(v12, "registerObserver:", v14);

    WeakRetained = objc_loadWeakRetained((id *)&v14->_platformController);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentSession"));

    v23 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
      v24 = v22;
    else
      v24 = 0;
    v25 = v24;

    -[PedestrianARSessionArrivalStepAvailabilityMonitor setRoutePlanningSession:](v14, "setRoutePlanningSession:", v25);
    -[PedestrianARSessionArrivalStepAvailabilityMonitor updateState](v14, "updateState");
  }

  return v14;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;
  id v9;
  objc_super v10;
  uint8_t buf[4];
  PedestrianARSessionArrivalStepAvailabilityMonitor *v12;

  v3 = sub_1006DC410();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("PedestrianARInjectFakeStorefrontArrivalDataKey"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("PedestrianARForceShowArrivalOnLastStepKey"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationService);
  objc_msgSend(WeakRetained, "unregisterObserver:", self);

  v8 = objc_loadWeakRetained((id *)&self->_locationManager);
  objc_msgSend(v8, "stopListeningForLocationUpdates:", self);

  v9 = objc_loadWeakRetained((id *)&self->_platformController);
  objc_msgSend(v9, "removeObserver:", self);

  v10.receiver = self;
  v10.super_class = (Class)PedestrianARSessionArrivalStepAvailabilityMonitor;
  -[PedestrianARSessionMonitor dealloc](&v10, "dealloc");
}

- (void)updateState
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char *v16;
  char *v17;
  id v18;
  id v19;
  void *v20;
  unint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  char *v26;
  const char *v27;
  id v28;
  void *v29;
  char *v30;
  const __CFString *v31;
  id v32;
  id v33;
  NSObject *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  char *v38;
  void *v39;
  void *v40;
  char *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  id v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  double Double;
  id v66;
  NSObject *v67;
  const char *v68;
  NSObject *v69;
  uint32_t v70;
  void *v71;
  unsigned int v72;
  id v73;
  id v74;
  id v75;
  double v76;
  double v77;
  id v78;
  _BOOL4 v79;
  const char *v80;
  NSObject *v81;
  uint32_t v82;
  void *v83;
  unsigned int v84;
  id v85;
  id v86;
  const char *v87;
  void *v88;
  void *v89;
  id v90;
  PedestrianARSessionArrivalStepAvailabilityMonitor *v91;
  uint64_t v92;
  id v93;
  NSObject *v94;
  uint64_t v95;
  double v96;
  double v97;
  id v98;
  _BOOL4 v99;
  id v100;
  NSObject *v101;
  id v102;
  NSObject *v103;
  PedestrianARSessionArrivalStepAvailabilityMonitor *v104;
  id v105;
  NSObject *v106;
  const char *v107;
  uint8_t buf[4];
  PedestrianARSessionArrivalStepAvailabilityMonitor *v109;
  __int16 v110;
  const char *v111;
  __int16 v112;
  double v113;
  __int16 v114;
  double v115;
  __int16 v116;
  double v117;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v4 = sub_1006DC410();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v109 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Checking whether to allow feature during route planning", buf, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor routePlanningSession](self, "routePlanningSession"));
    v7 = objc_msgSend(v6, "currentTransportType");

    if (v7 == (id)2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor locationManager](self, "locationManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocation"));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor routePlanningSession](self, "routePlanningSession"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentRouteCollection"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentRoute"));

        if (v12)
        {
          v13 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithCLLocation:", v9);
          v14 = objc_msgSend(objc_alloc((Class)GEORouteMatcher), "initWithRoute:auditToken:", v12, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "matchToRouteWithLocation:", v13));
          v16 = (char *)objc_msgSend(v15, "stepIndex");
          v17 = (char *)objc_msgSend(v12, "stepsCount") - 1;
          if (v16 == v17)
          {
            v18 = v12;
            v19 = v9;
          }
          else
          {
            v46 = sub_1006DC410();
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              v107 = (const char *)objc_msgSend(v15, "stepIndex");
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "steps"));
              *(_DWORD *)buf = 134349568;
              v109 = self;
              v110 = 2048;
              v111 = v107;
              v112 = 2048;
              v113 = *(double *)&v48;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "[%{public}p] We are in route planning but user is not on the final step yet (current step index: %lu, total steps: %lu); will not interfere with feature availability",
                buf,
                0x20u);

            }
            -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", 1);
            v19 = 0;
            v18 = 0;
          }

          if (v16 != v17)
            goto LABEL_24;
          goto LABEL_37;
        }
        v44 = sub_1006DC410();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          v109 = self;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "[%{public}p] We are in route planning but do not have a route; will not interfere with feature availability",
            buf,
            0xCu);
        }

        -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", 1);
LABEL_23:
        v19 = 0;
        v18 = 0;
        goto LABEL_24;
      }
      v32 = sub_1006DC410();
      v23 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v109 = self;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}p] We are in route planning but do not have a last location estimate; will not interfere with feature availability",
          buf,
          0xCu);
      }
LABEL_22:

      -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", 1);
      goto LABEL_23;
    }
    v28 = sub_1006DC410();
    v23 = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      goto LABEL_22;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor routePlanningSession](self, "routePlanningSession"));
    v30 = (char *)objc_msgSend(v29, "currentTransportType");
    if ((unint64_t)(v30 - 1) > 4)
      v31 = CFSTR("Undefined");
    else
      v31 = *(&off_1011C0930 + (_QWORD)(v30 - 1));
    *(_DWORD *)buf = 134349314;
    v109 = self;
    v110 = 2112;
    v111 = (const char *)v31;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}p] We are route planning with a non-walking transport type (%@); will not interfere with feature availability",
      buf,
      0x16u);
LABEL_21:

    goto LABEL_22;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
  v21 = (unint64_t)objc_msgSend(v20, "state");
  if (v21 <= 6 && ((1 << v21) & 0x47) != 0)
  {

    v22 = sub_1006DC410();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      goto LABEL_22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
    v25 = MNNavigationServiceStateAsString(objc_msgSend(v24, "state"));
    v26 = (char *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 134349314;
    v109 = self;
    v110 = 2112;
    v111 = v26;
    v27 = "[%{public}p] We are not in route planning nor in a pedestrian AR navigation state (%@); will not interfere wit"
          "h feature availability";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v27, buf, 0x16u);

    goto LABEL_22;
  }

  v33 = sub_1006DC410();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v109 = self;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[%{public}p] Checking whether to allow feature during active guidance", buf, 0xCu);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
  v36 = objc_msgSend(v35, "navigationTransportType");

  if (v36 != 2)
  {
    v74 = sub_1006DC410();
    v23 = objc_claimAutoreleasedReturnValue(v74);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      goto LABEL_22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
    v75 = objc_msgSend(v24, "navigationTransportType");
    if (v75 >= 7)
      v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v75));
    else
      v26 = (char *)*(&off_1011C08F8 + (int)v75);
    *(_DWORD *)buf = 134349314;
    v109 = self;
    v110 = 2112;
    v111 = v26;
    v27 = "[%{public}p] We are navigating with a non-walking transport type (%@); will not interfere with feature availability";
    goto LABEL_13;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
  v38 = (char *)objc_msgSend(v37, "stepIndex");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "route"));
  v41 = (char *)objc_msgSend(v40, "stepsCount") - 1;

  if (v38 != v41)
  {
    v86 = sub_1006DC410();
    v23 = objc_claimAutoreleasedReturnValue(v86);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      goto LABEL_22;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
    v87 = (const char *)objc_msgSend(v29, "stepIndex");
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "route"));
    v90 = objc_msgSend(v89, "stepsCount");
    *(_DWORD *)buf = 134349568;
    v109 = self;
    v110 = 2048;
    v111 = v87;
    v112 = 2048;
    v113 = *(double *)&v90;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}p] User is not on the final step yet (current step index: %lu, total steps: %lu); will not interfere wit"
      "h feature availability",
      buf,
      0x20u);

    goto LABEL_21;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "route"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "lastLocation"));

LABEL_37:
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "steps"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "lastObject"));
  v51 = objc_msgSend(v50, "endRouteCoordinate");

  objc_msgSend(v18, "pointAtRouteCoordinate:", v51);
  v53 = v52;
  v55 = v54;
  objc_msgSend(v19, "coordinate");
  v57 = v56;
  objc_msgSend(v19, "coordinate");
  v59 = v58;
  if (objc_msgSend(v18, "hasArrivalStorefrontGeometry"))
  {
    v60 = objc_msgSend(v18, "arrivalStorefrontLocation");
    v63 = GEOCalculateDistance(v60, v53, v55, v61, v62);
    Double = GEOConfigGetDouble(MapsConfig_PedestrianARSessionArrivalStepAvailabilityMonitorLookaroundStorefrontArrivalDistanceThreshold, off_1014B4A38);
    if (v63 < Double)
    {
      v66 = sub_1006DC410();
      v67 = objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349568;
        v109 = self;
        v110 = 2048;
        v111 = *(const char **)&v63;
        v112 = 2048;
        v113 = Double;
        v68 = "[%{public}p] The arrival POI has storefront geometry and is sufficiently close to the end of the route (%f < %f)";
LABEL_41:
        v69 = v67;
        v70 = 32;
LABEL_59:
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, v68, buf, v70);
      }
LABEL_60:

      v91 = self;
      v92 = 1;
LABEL_61:
      -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](v91, "setShouldShowPedestrianAR:", v92);
      goto LABEL_24;
    }
    v76 = GEOCalculateDistance(v64, v53, v55, v57, v59);
    v77 = GEOConfigGetDouble(MapsConfig_PedestrianARSessionArrivalStepAvailabilityMonitorEndOfRouteDistanceThreshold, off_1014B4B38);
    v78 = sub_1006DC410();
    v67 = objc_claimAutoreleasedReturnValue(v78);
    v79 = os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);
    if (v76 >= v77)
    {
      if (v79)
      {
        *(_DWORD *)buf = 134350080;
        v109 = self;
        v110 = 2048;
        v111 = *(const char **)&v63;
        v112 = 2048;
        v113 = Double;
        v114 = 2048;
        v115 = v76;
        v116 = 2048;
        v117 = v77;
        v68 = "[%{public}p] The arrival POI has storefront geometry and is too far from the end of the route (%f >= %f), "
              "but the user is not close enough to the end of the route (%f >= %f)";
        v69 = v67;
        v70 = 52;
        goto LABEL_59;
      }
      goto LABEL_60;
    }
    if (v79)
    {
      *(_DWORD *)buf = 134350080;
      v109 = self;
      v110 = 2048;
      v111 = *(const char **)&v63;
      v112 = 2048;
      v113 = Double;
      v114 = 2048;
      v115 = v76;
      v116 = 2048;
      v117 = v77;
      v80 = "[%{public}p] The arrival POI has storefront geometry but is too far from the end of the route (%f >= %f), an"
            "d the user is sufficiently close to the end of the route (%f < %f)";
      v81 = v67;
      v82 = 52;
LABEL_68:
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, v80, buf, v82);
      goto LABEL_69;
    }
    goto LABEL_69;
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v72 = objc_msgSend(v71, "BOOLForKey:", CFSTR("PedestrianARInjectFakeStorefrontArrivalDataKey"));

  if (v72)
  {
    v73 = sub_1006DC410();
    v67 = objc_claimAutoreleasedReturnValue(v73);
    if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      goto LABEL_60;
    *(_DWORD *)buf = 134349056;
    v109 = self;
    v68 = "[%{public}p] The arrival POI does NOT have storefront geometry BUT the inject fake storefront arrival data deb"
          "ug flag is enabled; will allow the feature to be visible";
LABEL_54:
    v69 = v67;
    v70 = 12;
    goto LABEL_59;
  }
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v84 = objc_msgSend(v83, "BOOLForKey:", CFSTR("PedestrianARForceShowArrivalOnLastStepKey"));

  if (v84)
  {
    v85 = sub_1006DC410();
    v67 = objc_claimAutoreleasedReturnValue(v85);
    if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      goto LABEL_60;
    *(_DWORD *)buf = 134349056;
    v109 = self;
    v68 = "[%{public}p] The arrival POI does NOT have storefront geometry BUT the force show arrival on last step debug f"
          "lag is enabled; will allow the feature to be visible";
    goto LABEL_54;
  }
  if (v19)
  {
    v93 = sub_1006DC410();
    v94 = objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134350080;
      v109 = self;
      v110 = 2048;
      v111 = *(const char **)&v57;
      v112 = 2048;
      v113 = v59;
      v114 = 2048;
      v115 = v53;
      v116 = 2048;
      v117 = v55;
      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEBUG, "[%{public}p] Will calculate distance between user (%f, %f) and destination (%f, %f)", buf, 0x34u);
    }

    v96 = GEOCalculateDistance(v95, v57, v59, v53, v55);
    v97 = GEOConfigGetDouble(MapsConfig_PedestrianARSessionArrivalStepAvailabilityMonitorCoarseArrivalDistanceThreshold, off_1014B41E8);
    v98 = sub_1006DC410();
    v67 = objc_claimAutoreleasedReturnValue(v98);
    v99 = os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);
    if (v96 >= v97)
    {
      if (!v99)
        goto LABEL_60;
      *(_DWORD *)buf = 134349568;
      v109 = self;
      v110 = 2048;
      v111 = *(const char **)&v96;
      v112 = 2048;
      v113 = v97;
      v68 = "[%{public}p] The arrival POI does NOT have storefront geometry but the user is sufficiently far from the des"
            "tination (%f >= %f); will allow the feature to be visible";
      goto LABEL_41;
    }
    if (v99)
    {
      *(_DWORD *)buf = 134349568;
      v109 = self;
      v110 = 2048;
      v111 = *(const char **)&v96;
      v112 = 2048;
      v113 = v97;
      v80 = "[%{public}p] The arrival POI does NOT have storefront geometry and the user is too close to the destination "
            "(%f < %f); will not allow the feature to be visible";
      v81 = v67;
      v82 = 32;
      goto LABEL_68;
    }
LABEL_69:

    v91 = self;
    v92 = 0;
    goto LABEL_61;
  }
  v100 = sub_1004318FC();
  v101 = objc_claimAutoreleasedReturnValue(v100);
  if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v109 = (PedestrianARSessionArrivalStepAvailabilityMonitor *)"-[PedestrianARSessionArrivalStepAvailabilityMonitor updateState]";
    v110 = 2080;
    v111 = "PedestrianARSessionArrivalStepAvailabilityMonitor.m";
    v112 = 1024;
    LODWORD(v113) = 191;
    _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v102 = sub_1004318FC();
    v103 = objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      v104 = (PedestrianARSessionArrivalStepAvailabilityMonitor *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v109 = v104;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  v105 = sub_1006DC410();
  v106 = objc_claimAutoreleasedReturnValue(v105);
  if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v109 = self;
    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, "[%{public}p] The arrival POI does NOT have storefront geometry and we don't know the user's current location; will"
      " not allow the feature to be visible",
      buf,
      0xCu);
  }

  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", 0);
  v19 = 0;
LABEL_24:

}

- (void)setRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v4;
  RoutePlanningSession *routePlanningSession;
  RoutePlanningSession *v6;
  RoutePlanningSession *v7;
  void *v8;
  id v9;

  v4 = (RoutePlanningSession *)a3;
  -[RoutePlanningSession removeObserver:](self->_routePlanningSession, "removeObserver:", self);
  routePlanningSession = self->_routePlanningSession;
  self->_routePlanningSession = v4;
  v6 = v4;

  -[RoutePlanningSession addObserver:](self->_routePlanningSession, "addObserver:", self);
  v7 = self->_routePlanningSession;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor locationManager](self, "locationManager"));
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "listenForLocationUpdates:", self);
  else
    objc_msgSend(v8, "stopListeningForLocationUpdates:", self);

}

+ (BOOL)isEnabled
{
  return 1;
}

- (NSString)debugDescription
{
  id v3;
  double Double;
  __CFString *v5;
  __CFString *v6;
  char *v7;
  const __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  const __CFString *v22;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  void *v45;

  v3 = objc_msgSend((id)objc_opt_class(self), "friendlyName");
  v45 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Double = GEOConfigGetDouble(MapsConfig_PedestrianARSessionArrivalStepAvailabilityMonitorCoarseArrivalDistanceThreshold, off_1014B41E8);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor locationManager](self, "locationManager"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "lastLocation"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor routePlanningSession](self, "routePlanningSession"));
  if (v41)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v40 = v5;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor routePlanningSession](self, "routePlanningSession"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "currentRouteCollection"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "currentRoute"));
  if (v37)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v43 = v6;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor routePlanningSession](self, "routePlanningSession"));
  v7 = (char *)objc_msgSend(v36, "currentTransportType");
  if ((unint64_t)(v7 - 1) > 4)
    v8 = CFSTR("Undefined");
  else
    v8 = *(&off_1011C0930 + (_QWORD)(v7 - 1));
  v30 = v8;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "route"));
  if (v33)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v28 = v9;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
  v10 = MNNavigationServiceStateAsString(objc_msgSend(v32, "state"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
  v11 = objc_msgSend(v29, "navigationTransportType");
  if (v11 >= 7)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v11));
  else
    v12 = *(&off_1011C08F8 + (int)v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
  v24 = objc_msgSend(v27, "stepIndex");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "route"));
  v13 = objc_msgSend(v25, "stepsCount");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor navigationService](self, "navigationService"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "route"));
  if (objc_msgSend(v15, "hasArrivalStorefrontGeometry"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v18, "BOOLForKey:", CFSTR("PedestrianARInjectFakeStorefrontArrivalDataKey")))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v21, "BOOLForKey:", CFSTR("PedestrianARForceShowArrivalOnLastStepKey")))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\ncoarse arrival distance threshold: %f\nlast location: %@\nin route planning: %@\nhas route planning route: %@\nroute planning transport type: %@\nhas nav route: %@\nnav state: %@\nnav transport type: %@\nstep index: %lu\ntotal steps: %lu\narrival has storefront geometry: %@\ninject fake storefront arrival data debug flag: %@\nforce show arrival on last step debug flag: %@\n"), v45, *(_QWORD *)&Double, v44, v40, v43, v30, v28, v31, v12, v24, v13, v17, v20, v22));

  return (NSString *)v35;
}

+ (id)friendlyName
{
  return CFSTR("Arrival Step Availability Monitor");
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  PedestrianARSessionArrivalStepAvailabilityMonitor *v9;
  __int16 v10;
  void *v11;

  v4 = a3;
  v5 = sub_1006DC410();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
    v8 = 134349314;
    v9 = self;
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Got a new location update: %@", (uint8_t *)&v8, 0x16u);

  }
  -[PedestrianARSessionArrivalStepAvailabilityMonitor updateState](self, "updateState");

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  PedestrianARSessionArrivalStepAvailabilityMonitor *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v8 = sub_1006DC410();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = MNNavigationServiceStateAsString(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = MNNavigationServiceStateAsString(a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = 134349570;
    v15 = self;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] nav service changed from state %@ to state %@; updating state",
      (uint8_t *)&v14,
      0x20u);

  }
  -[PedestrianARSessionArrivalStepAvailabilityMonitor updateState](self, "updateState");
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  int v10;
  PedestrianARSessionArrivalStepAvailabilityMonitor *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;

  v8 = sub_1006DC410();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134349568;
    v11 = self;
    v12 = 2048;
    v13 = a4;
    v14 = 2048;
    v15 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] nav service updated step index: %lu, segment index: %lu; updating state",
      (uint8_t *)&v10,
      0x20u);
  }

  -[PedestrianARSessionArrivalStepAvailabilityMonitor updateState](self, "updateState");
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  PedestrianARSessionArrivalStepAvailabilityMonitor *v12;
  __int16 v13;
  void *v14;

  v6 = *(_QWORD *)&a4;
  v8 = sub_1006DC410();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (v6 >= 7)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v6));
    else
      v10 = *(&off_1011C08F8 + (int)v6);
    *(_DWORD *)buf = 134349314;
    v12 = self;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] nav service switched to new transport type: %@", buf, 0x16u);

  }
  -[PedestrianARSessionArrivalStepAvailabilityMonitor updateState](self, "updateState");
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  PedestrianARSessionArrivalStepAvailabilityMonitor *v9;
  __int16 v10;
  id v11;

  v5 = a4;
  v6 = sub_1006DC410();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134349314;
    v9 = self;
    v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] nav service updated matched location: %@", (uint8_t *)&v8, 0x16u);
  }

  -[PedestrianARSessionArrivalStepAvailabilityMonitor updateState](self, "updateState");
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  PedestrianARSessionArrivalStepAvailabilityMonitor *v14;
  __int16 v15;
  id v16;

  v6 = a5;
  v7 = sub_1006DC410();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134349314;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Got a new session: %@", (uint8_t *)&v13, 0x16u);
  }

  v9 = v6;
  v10 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  -[PedestrianARSessionArrivalStepAvailabilityMonitor setRoutePlanningSession:](self, "setRoutePlanningSession:", v12);
  -[PedestrianARSessionArrivalStepAvailabilityMonitor updateState](self, "updateState");

}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  PedestrianARSessionArrivalStepAvailabilityMonitor *v12;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionArrivalStepAvailabilityMonitor routePlanningSession](self, "routePlanningSession", a3, a4));
  v8 = objc_msgSend(v7, "currentTransportType");

  if (v8 == (id)a5)
  {
    v9 = sub_1006DC410();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = 134349056;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Route planning updated the route collection for the current transport type", (uint8_t *)&v11, 0xCu);
    }

    -[PedestrianARSessionArrivalStepAvailabilityMonitor updateState](self, "updateState");
  }
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  id v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  PedestrianARSessionArrivalStepAvailabilityMonitor *v11;
  __int16 v12;
  const __CFString *v13;

  v7 = sub_1006DC410();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    if ((unint64_t)(a4 - 1) > 4)
      v9 = CFSTR("Undefined");
    else
      v9 = *(&off_1011C0930 + a4 - 1);
    v10 = 134349314;
    v11 = self;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Route planning updated the current transport type: %@", (uint8_t *)&v10, 0x16u);
  }

  -[PedestrianARSessionArrivalStepAvailabilityMonitor updateState](self, "updateState");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  const char *v19;
  id v20;
  __CFString *v21;
  objc_super v22;
  objc_super v23;
  uint8_t buf[4];
  PedestrianARSessionArrivalStepAvailabilityMonitor *v25;
  __int16 v26;
  __CFString *v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));

  if (v13 != v11)
  {
    -[PedestrianARSessionArrivalStepAvailabilityMonitor observeValueForKeyPath:ofObject:change:context:](&v22, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6, self, PedestrianARSessionArrivalStepAvailabilityMonitor, v23.receiver, v23.super_class);
    goto LABEL_16;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("PedestrianARInjectFakeStorefrontArrivalDataKey")))
  {
    v14 = sub_1006DC410();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
      v17 = CFSTR("YES");
      if (!v16)
        v17 = CFSTR("NO");
      v18 = v17;
      *(_DWORD *)buf = 134349314;
      v25 = self;
      v26 = 2112;
      v27 = v18;
      v19 = "[%{public}p] Debug inject fake storefront arrival data key was toggled: %@; updating state";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v19, buf, 0x16u);

    }
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("PedestrianARForceShowArrivalOnLastStepKey")))
    {
      -[PedestrianARSessionArrivalStepAvailabilityMonitor observeValueForKeyPath:ofObject:change:context:](&v23, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6, v22.receiver, v22.super_class, self, PedestrianARSessionArrivalStepAvailabilityMonitor);
      goto LABEL_16;
    }
    v20 = sub_1006DC410();
    v15 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
      v21 = CFSTR("YES");
      if (!v16)
        v21 = CFSTR("NO");
      v18 = v21;
      *(_DWORD *)buf = 134349314;
      v25 = self;
      v26 = 2112;
      v27 = v18;
      v19 = "[%{public}p] Debug force show arrival on last step key was toggled: %@; updating state";
      goto LABEL_14;
    }
  }

  -[PedestrianARSessionArrivalStepAvailabilityMonitor updateState](self, "updateState");
LABEL_16:

}

- (MKLocationManager)locationManager
{
  return (MKLocationManager *)objc_loadWeakRetained((id *)&self->_locationManager);
}

- (void)setLocationManager:(id)a3
{
  objc_storeWeak((id *)&self->_locationManager, a3);
}

- (MNNavigationService)navigationService
{
  return (MNNavigationService *)objc_loadWeakRetained((id *)&self->_navigationService);
}

- (void)setNavigationService:(id)a3
{
  objc_storeWeak((id *)&self->_navigationService, a3);
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_destroyWeak((id *)&self->_navigationService);
  objc_destroyWeak((id *)&self->_locationManager);
}

@end
