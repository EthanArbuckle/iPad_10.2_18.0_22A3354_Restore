@implementation RAPNavigationTracker

- (RAPNavigationTracker)initWithPlatformController:(id)a3
{
  id v4;
  RAPNavigationTracker *v5;
  RAPNavigationTracker *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t v12[16];
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RAPNavigationTracker;
  v5 = -[RAPNavigationTracker init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v7, "registerObserver:", v6);

    v8 = sub_100431F8C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Creating new RAPNavigationTracker.", v12, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    -[RAPNavigationTracker _updateWithRunningNavigation:](v6, "_updateWithRunningNavigation:", objc_msgSend(v10, "isInNavigatingState"));

  }
  return v6;
}

- (void)_updateWithRunningNavigation:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __int16 v16;
  __CFString *v17;

  if (self->_isShowingDirections != a3)
  {
    v3 = a3;
    v5 = sub_100431F8C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (v3)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = v7;
      if (self->_isShowingDirections)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = v9;
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Tracker _updateWithRunningNavigation: %@, currently running navigation: %@", (uint8_t *)&v14, 0x16u);

    }
    -[RAPNavigationTracker _reset](self, "_reset");
    self->_isShowingDirections = v3;
    if (v3)
    {
      v11 = sub_100431F8C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Tracker _updateWithRunningNavigation: will try to capture recording", (uint8_t *)&v14, 2u);
      }

      self->_latestNavigationStartedDate = CFAbsoluteTimeGetCurrent();
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      self->_latestNavigationIsDetour = objc_msgSend(v13, "isDetour");

      -[RAPNavigationTracker _createRapAppStateWithCompletion:](self, "_createRapAppStateWithCompletion:", 0);
    }
  }
}

- (void)_createRapAppStateWithCompletion:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v37;
  _QWORD *v38;
  id WeakRetained;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  RAPNavigationTracker *v44;
  id v45;
  id v46;
  id v47;
  _QWORD *v48;
  id v49;
  unsigned int v50;
  id location;
  id v52;
  uint64_t v53;
  uint8_t buf[8];
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  _BYTE v62[128];

  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_100305EF0;
  v60[3] = &unk_1011AE448;
  v35 = a3;
  v61 = v35;
  v38 = objc_retainBlock(v60);
  WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  if (!WeakRetained || !v37)
  {
    v17 = sub_100431F8C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Tracker won't create RAP state because either platformController or chrome is missing.", buf, 2u);
    }

    ((void (*)(_QWORD *, const __CFString *))v38[2])(v38, CFSTR("Tracker was in invalid configuration and couldn't create app state."));
    goto LABEL_29;
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sessionStack"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (!v4)
  {

    v5 = 0;
    v40 = 0;
    goto LABEL_25;
  }
  v40 = 0;
  v5 = 0;
  v6 = *(_QWORD *)v57;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v57 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
      v9 = objc_opt_class(RoutePlanningSession);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v10 = v40;
        v40 = v8;
        v11 = v5;
      }
      else
      {
        v12 = objc_opt_class(NavigationSession);
        v10 = v5;
        v11 = v8;
        if ((objc_opt_isKindOfClass(v8, v12) & 1) == 0)
          continue;
      }
      v13 = v8;

      v5 = v11;
    }
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  }
  while (v4);

  if (!v5 || !v40)
  {
LABEL_25:
    v19 = sub_100431F8C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Tracker won't create RAP state because we are not currently navigating", buf, 2u);
    }
    goto LABEL_27;
  }
  v14 = (unint64_t)objc_msgSend(v5, "currentTransportType");
  if (v14 <= 4 && ((1 << v14) & 0x19) != 0)
  {
    v15 = sub_100431F8C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Tracker won't create RAP state because this is not a supported transport type", buf, 2u);
    }

    ((void (*)(_QWORD *, const __CFString *))v38[2])(v38, CFSTR("Can't create directions RAP for transit."));
    goto LABEL_28;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRouteCollection", v35));
  if (!v21)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "currentRouteCollection"));
    if (!v21)
    {
      v34 = sub_100431F8C();
      v20 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Tracker can't create RAP state because we don't have a valid route collection", buf, 2u);
      }
LABEL_27:

      ((void (*)(_QWORD *, const __CFString *))v38[2])(v38, CFSTR("Tracker was in invalid configuration and couldn't create app state."));
      goto LABEL_28;
    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "reportAProblemRecorder"));
  v23 = v22 == 0;

  if (v23)
  {
    v32 = sub_100431F8C();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "Tracker can't create RAP because the RP session doesn't have a recorder", buf, 2u);
    }

    ((void (*)(_QWORD *, const __CFString *))v38[2])(v38, CFSTR("Tracker was in invalid configuration and couldn't create app state."));
  }
  else
  {
    *(_QWORD *)buf = 0;
    v55 = 0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance"));
    v52 = objc_msgSend(v24, "navSessionID");
    v53 = v25;

    if ((GEOSessionIDEquals(&v52, buf) & 1) == 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "reportAProblemRecorder"));
      objc_msgSend(v26, "recordNewSessionID:", v52, v53);

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "currentRoute"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "geoWaypointRoute"));
    v29 = objc_msgSend(v28, "identifier");

    objc_initWeak(&location, self);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "reportAProblemRecorder"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100305FF4;
    v41[3] = &unk_1011B1270;
    objc_copyWeak(&v49, &location);
    v47 = v35;
    v50 = v29;
    v48 = v38;
    v31 = v21;
    v42 = v31;
    v5 = v5;
    v43 = v5;
    v44 = self;
    v40 = v40;
    v45 = v40;
    v46 = v37;
    objc_msgSend(v30, "savePartialRecordingWithCompletion:", v41);

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);

  }
LABEL_28:

LABEL_29:
}

- (void)_reset
{
  GEOComposedRoute *activeComposedRoute;
  RAPDisplayedRouteState *currentDirections;
  RAPDisplayedDirectionsPlan *displayedDirectionsPlan;
  RAPAppState *appState;

  self->_latestNavigationStartedDate = 0.0;
  self->_latestNavigationIsDetour = 0;
  activeComposedRoute = self->_activeComposedRoute;
  self->_activeComposedRoute = 0;

  currentDirections = self->_currentDirections;
  self->_currentDirections = 0;

  displayedDirectionsPlan = self->_displayedDirectionsPlan;
  self->_displayedDirectionsPlan = 0;

  self->_isShowingDirections = 0;
  appState = self->_appState;
  self->_appState = 0;

}

- (BOOL)canPresentRapFeedbackView
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  const char *v9;
  int v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  double Current;
  double Double;
  id v19;
  id v20;
  id v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  int v29;
  const __CFString *v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  __CFString *v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v4 = objc_msgSend(v3, "isUsingOfflineMaps");

  if ((v4 & 1) == 0)
  {
    if (!_MKRAPIsAvailable(v5) || sub_1003DDB84())
    {
      v7 = sub_100431F8C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v29 = 138412290;
        v30 = CFSTR("NO");
        v9 = "shouldDisplayAfterNavigationFeedbackFlow returned NO -> isRAPAvailable: %@";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v29, 0xCu);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    v10 = sub_1003E1BB0();
    if (v10 && !self->_latestNavigationIsDetour)
    {
      Current = CFAbsoluteTimeGetCurrent();
      Double = GEOConfigGetDouble(MapsConfig_RAPAfterNavFeedbackFlowRequiredDelay, off_1014B4228);
      if (Current < Double + self->_latestNavigationStartedDate)
      {
        v19 = sub_100431F8C();
        v8 = objc_claimAutoreleasedReturnValue(v19);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          goto LABEL_19;
        v29 = 134217984;
        v30 = (const __CFString *)(uint64_t)Double;
        v9 = "shouldDisplayAfterNavigationFeedbackFlow returned NO -> required delay of: %ld hasn't passed since nav started";
        goto LABEL_7;
      }
      if (self->_displayedDirectionsPlan && self->_activeComposedRoute && self->_currentDirections && self->_appState)
      {
        v20 = sub_100431F8C();
        v8 = objc_claimAutoreleasedReturnValue(v20);
        v6 = 1;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v29) = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "shouldDisplayAfterNavigationFeedbackFlow returned YES -> All requirements met", (uint8_t *)&v29, 2u);
        }
        goto LABEL_20;
      }
      v21 = sub_100431F8C();
      v8 = objc_claimAutoreleasedReturnValue(v21);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
LABEL_19:
        v6 = 0;
LABEL_20:

        return v6;
      }
      if (self->_displayedDirectionsPlan)
        v22 = CFSTR("NO");
      else
        v22 = CFSTR("YES");
      v13 = v22;
      if (self->_activeComposedRoute)
        v23 = CFSTR("NO");
      else
        v23 = CFSTR("YES");
      v24 = v23;
      if (self->_currentDirections)
        v25 = CFSTR("NO");
      else
        v25 = CFSTR("YES");
      v26 = v25;
      if (self->_appState)
        v27 = CFSTR("NO");
      else
        v27 = CFSTR("YES");
      v28 = v27;
      v29 = 138413058;
      v30 = v13;
      v31 = 2112;
      v32 = v24;
      v33 = 2112;
      v34 = v26;
      v35 = 2112;
      v36 = v28;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "shouldDisplayAfterNavigationFeedbackFlow returned NO -> a required property was nil. _displayedDirectionsPlan: %@, _activeComposedRoute: %@, _currentDirections: %@, _appState: %@", (uint8_t *)&v29, 0x2Au);

    }
    else
    {
      v11 = sub_100431F8C();
      v8 = objc_claimAutoreleasedReturnValue(v11);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      if (v10)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      v13 = v12;
      if (self->_latestNavigationIsDetour)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      v15 = v14;
      v29 = 138412546;
      v30 = v13;
      v31 = 2112;
      v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "shouldDisplayAfterNavigationFeedbackFlow returned NO -> isAfterNavigationFlowAvailable: %@, _latestNavigationIsDetour: %@", (uint8_t *)&v29, 0x16u);

    }
    goto LABEL_19;
  }
  return 0;
}

- (id)rapAppStateForCurrentNavigation
{
  return self->_appState;
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;

  v8 = sub_100431F8C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = MNNavigationServiceStateAsString(a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v13 = 138412290;
    v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Tracker: navigationService is now in state: %@", (uint8_t *)&v13, 0xCu);

  }
  -[RAPNavigationTracker _updateWithRunningNavigation:](self, "_updateWithRunningNavigation:", MNNavigationServiceStateChangedToNavigating(a4, a5, v12));
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  self->_latestNavigationIsDetour = objc_msgSend(a3, "isDetour");
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  -[RAPNavigationTracker _createRapAppStateWithCompletion:](self, "_createRapAppStateWithCompletion:", 0, a4, a5);
}

- (GEOComposedRoute)activeComposedRoute
{
  return self->_activeComposedRoute;
}

- (RAPDisplayedRouteState)currentDirections
{
  return self->_currentDirections;
}

- (RAPDisplayedDirectionsPlan)displayedDirectionsPlan
{
  return self->_displayedDirectionsPlan;
}

- (BOOL)isShowingDirections
{
  return self->_isShowingDirections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appState, 0);
  objc_storeStrong((id *)&self->_displayedDirectionsPlan, 0);
  objc_storeStrong((id *)&self->_currentDirections, 0);
  objc_storeStrong((id *)&self->_activeComposedRoute, 0);
  objc_destroyWeak((id *)&self->_platformController);
}

@end
