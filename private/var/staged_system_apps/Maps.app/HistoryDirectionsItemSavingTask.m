@implementation HistoryDirectionsItemSavingTask

- (HistoryDirectionsItemSavingTask)initWithNavigationService:(id)a3 routeInfoProvider:(id)a4 routeInterrupter:(id)a5
{
  id v9;
  id v10;
  id v11;
  HistoryDirectionsItemSavingTask *v12;
  HistoryDirectionsItemSavingTask *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HistoryDirectionsItemSavingTask;
  v12 = -[HistoryDirectionsItemSavingTask init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_navigationService, a3);
    -[MNNavigationService registerObserver:](v13->_navigationService, "registerObserver:", v13);
    objc_storeStrong((id *)&v13->_routeInfoProvider, a4);
    objc_storeStrong((id *)&v13->_routeInterrupter, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    objc_msgSend(v14, "addSendingObserver:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v13, "_appWillTerminate:", UIApplicationWillTerminateNotification, 0);

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  objc_msgSend(v3, "removeSendingObserver:", self);

  -[MNNavigationService unregisterObserver:](self->_navigationService, "unregisterObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)HistoryDirectionsItemSavingTask;
  -[HistoryDirectionsItemSavingTask dealloc](&v4, "dealloc");
}

+ (int64_t)creationPreference
{
  return 2;
}

- (id)historyEntryRoute
{
  return -[NavigationRouteHistoryInfoProviding historyEntryRoute](self->_routeInfoProvider, "historyEntryRoute");
}

- (void)_preserveAutosharingContacts:(BOOL)a3 inHistoryEntry:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  char isKindOfClass;
  __CFString *v18;
  __CFString *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  id v27;

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (v8)
  {
    if (v6)
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProviding archivedTripSharingState](self->_routeInfoProvider, "archivedTripSharingState"));
    else
      v10 = 0;
    v13 = sub_100325FC4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (v6)
        v15 = "Will archive";
      else
        v15 = "Will clear";
      v16 = objc_opt_class(NSData);
      isKindOfClass = objc_opt_isKindOfClass(v10, v16);
      v18 = CFSTR("NO");
      if ((isKindOfClass & 1) != 0)
        v18 = CFSTR("YES");
      v19 = v18;
      *(_DWORD *)buf = 136315650;
      v23 = v15;
      v24 = 2112;
      v25 = v19;
      v26 = 2048;
      v27 = objc_msgSend(v10, "length");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "_preserveAutosharingContacts: %s autosharing: sharing data: %@ (%lu)", buf, 0x20u);

    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100326004;
    v20[3] = &unk_1011AE218;
    v21 = v9;
    objc_msgSend(v8, "setSharedETAData:completion:", v10, v20);

  }
  else
  {
    v11 = sub_100325FC4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "_preserveAutosharingContacts: We don't have an entry to update autosharing", buf, 2u);
    }

    if (v9)
      v9[2](v9);
  }

}

- (BOOL)_updateEVInfoForHistoryEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  int v12;
  int v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "upcomingStop"));

  if (objc_msgSend(v5, "isEVRoute"))
  {
    v8 = objc_opt_class(GEOComposedWaypointEVStop);
    isKindOfClass = objc_opt_isKindOfClass(v7, v8);
  }
  else
  {
    isKindOfClass = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requiredCharge"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vehicleIdentifier"));
    v12 = v11 != 0;

  }
  else
  {
    v12 = 0;
  }

  v13 = isKindOfClass & 1;
  if (v12 != v13)
  {
    v14 = v7;
    v15 = objc_opt_class(GEOComposedWaypointEVStop);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
      v16 = v14;
    else
      v16 = 0;
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "chargingInfo"));
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v18, "batteryPercentageAfterCharging");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19 / 100.0));
      objc_msgSend(v3, "setRequiredCharge:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activeVehicleIdentifier"));
      objc_msgSend(v3, "setVehicleIdentifier:", v22);

    }
    else
    {
      objc_msgSend(v3, "setRequiredCharge:", 0);
      objc_msgSend(v3, "setVehicleIdentifier:", 0);
    }
    objc_msgSend(v3, "setType:", objc_msgSend(v5, "isEVRoute"));

  }
  return v12 != v13;
}

- (void)_interruptAndSaveHistoryEntry:(id)a3 completion:(id)a4
{
  NavigationRouteHistoryInfoProviding *v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NavigationRouteInterrupting *routeInterrupter;
  NavigationRouteHistoryInfoProviding *routeInfoProvider;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  NavigationRouteHistoryInfoProviding *v17;

  v6 = (NavigationRouteHistoryInfoProviding *)a3;
  v7 = a4;
  v8 = sub_100325FC4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will pause route with history entry: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    routeInterrupter = self->_routeInterrupter;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100326484;
    v13[3] = &unk_1011B1D58;
    v14 = v7;
    objc_copyWeak(&v15, (id *)buf);
    -[NavigationRouteInterrupting interruptHistoryEntryRoute:withCompletion:](routeInterrupter, "interruptHistoryEntryRoute:withCompletion:", v6, v13);
    objc_destroyWeak(&v15);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      routeInfoProvider = self->_routeInfoProvider;
      *(_DWORD *)buf = 138412290;
      v17 = routeInfoProvider;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to save historyEntryRoute because entry was nil. _routeInfoProvider: %@", buf, 0xCu);
    }

  }
}

- (void)_uninterruptHistoryEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NavigationRouteInterrupting *routeInterrupter;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = sub_100325FC4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Will un-pause route with history entry: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  routeInterrupter = self->_routeInterrupter;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10032671C;
  v12[3] = &unk_1011B1D58;
  v11 = v7;
  v13 = v11;
  objc_copyWeak(&v14, (id *)buf);
  -[NavigationRouteInterrupting cancelInterruptionOnHistoryEntryRoute:completion:](routeInterrupter, "cancelInterruptionOnHistoryEntryRoute:completion:", v6, v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak((id *)buf);
}

- (void)_launchRouteGeniusIfNeeded
{
  id v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t buf[16];
  uint8_t v19[16];

  if (self->_shouldLaunchRouteGeniusOnEnd)
  {
    v3 = -[MNNavigationService state](self->_navigationService, "state");
    if ((MNNavigationServiceStateIsNavigating(v3, v4) & 1) == 0)
    {
      self->_shouldLaunchRouteGeniusOnEnd = 0;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v6 = objc_msgSend(v5, "isCurrentlyConnectedToAnyCarScene");
      v7 = sub_100325FC4();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if ((v6 & 1) != 0)
      {
        if (v9)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Route paused and connected to CP -> will start route genius", buf, 2u);
        }

        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformController"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sessionStack"));
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          v13 = sub_100325FC4();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Session stack was not empty. clearing it out so that we can present RG.", v17, 2u);
          }

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformController"));
          objc_msgSend(v15, "clearSessions");

        }
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeGeniusManager"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));
        -[NSObject activateIfPossibleForChrome:](v8, "activateIfPossibleForChrome:", v16);

      }
      else if (v9)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "We're not connected to CP so we won't launch RG.", v19, 2u);
      }

    }
  }
}

- (id)_currentRouteHandleStorage
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService resumeRouteHandle](self->_navigationService, "resumeRouteHandle"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService resumeRouteHandle](self->_navigationService, "resumeRouteHandle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResumeRouteHandle resumeRouteHandleStorageFromResumeRouteHandle:](GEOResumeRouteHandle, "resumeRouteHandleStorageFromResumeRouteHandle:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_appWillTerminate:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  dispatch_time_t v11;
  _QWORD v12[5];
  id v13;
  NSObject *v14;
  uint8_t buf[16];

  v4 = -[MNNavigationService state](self->_navigationService, "state", a3);
  if (MNNavigationServiceStateIsNavigating(v4, v5)
    && -[MNNavigationService navigationState](self->_navigationService, "navigationState") == 7)
  {
    v6 = sub_100325FC4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "App is terminating with navigation active at the end of segment, will try to update Share ETA contacts and save historyEntry.", buf, 2u);
    }

    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100326B88;
    v12[3] = &unk_1011AD238;
    v12[4] = self;
    v13 = (id)objc_claimAutoreleasedReturnValue(-[HistoryDirectionsItemSavingTask historyEntryRoute](self, "historyEntryRoute"));
    v14 = v8;
    v9 = v8;
    v10 = v13;
    -[HistoryDirectionsItemSavingTask _preserveAutosharingContacts:inHistoryEntry:completion:](self, "_preserveAutosharingContacts:inHistoryEntry:completion:", 1, v10, v12);
    v11 = dispatch_time(0, 2000000000);
    dispatch_group_wait(v9, v11);

  }
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryDirectionsItemSavingTask historyEntryRoute](self, "historyEntryRoute"));
  v10 = v9;
  if (v9
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "historyEntry")),
        v12 = objc_opt_respondsToSelector(v11, "storageIdentifier"),
        v11,
        (v12 & 1) != 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "historyEntry"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storageIdentifier"));

    v15 = sub_100325FC4();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "didReroute: Will save route with ID: %@", (uint8_t *)&v17, 0xCu);
    }

  }
  else
  {
    v14 = 0;
  }
  if (((unint64_t)objc_msgSend(v8, "source") & 0xFFFFFFFFFFFFFFFELL) != 2)
    -[HistoryDirectionsItemSavingTask _saveRouteHistory:withOriginalHistoryIdentifier:arrivalState:](self, "_saveRouteHistory:withOriginalHistoryIdentifier:arrivalState:", v8, v14, objc_msgSend(v7, "arrivalState"));

}

- (void)navigationService:(id)a3 didUpdateResumeRouteHandle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryDirectionsItemSavingTask historyEntryRoute](self, "historyEntryRoute"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryDirectionsItemSavingTask _currentRouteHandleStorage](self, "_currentRouteHandleStorage"));
  v8 = sub_100325FC4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resumeRouteHandle"));
    *(_DWORD *)buf = 138412290;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "navigationService:didUpdateResumeRouteHandle Will update resumeRouteHandle: %@", buf, 0xCu);

  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100326F1C;
  v12[3] = &unk_1011B1BE0;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v6, "updateResumeRouteHandle:completion:", v7, v12);

}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5 + 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "legs"));
  v12 = objc_msgSend(v11, "count");

  if (v9 < (unint64_t)v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryDirectionsItemSavingTask historyEntryRoute](self, "historyEntryRoute"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "historyEntry"));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003270E0;
    v15[3] = &unk_1011B1D80;
    v15[4] = self;
    v17 = v9;
    v16 = v8;
    -[HistoryDirectionsItemSavingTask _updateHistoryEntry:withBlock:](self, "_updateHistoryEntry:withBlock:", v14, v15);

  }
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, a3))
    self->_navigationIsEnding = 0;
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  void *v20;

  v8 = a3;
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, v9))
  {
    *(_WORD *)&self->_arrivedAtDestination = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryDirectionsItemSavingTask historyEntryRoute](self, "historyEntryRoute"));
    v12 = v11;
    if (v11
      && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "historyEntry")),
          v14 = objc_opt_respondsToSelector(v13, "storageIdentifier"),
          v13,
          (v14 & 1) != 0))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "historyEntry"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storageIdentifier"));

      v17 = sub_100325FC4();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = 138412290;
        v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "didChangeFromState: Will save route with ID: %@", (uint8_t *)&v19, 0xCu);
      }

    }
    else
    {
      v16 = 0;
    }
    -[HistoryDirectionsItemSavingTask _saveRouteHistory:withOriginalHistoryIdentifier:arrivalState:](self, "_saveRouteHistory:withOriginalHistoryIdentifier:arrivalState:", v10, v16, objc_msgSend(v8, "arrivalState"));

  }
  else
  {
    -[HistoryDirectionsItemSavingTask _launchRouteGeniusIfNeeded](self, "_launchRouteGeniusIfNeeded");
  }

}

- (void)navigationService:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  -[HistoryDirectionsItemSavingTask _handleArrivalAtWaypoint:endOfLegIndex:](self, "_handleArrivalAtWaypoint:endOfLegIndex:", a4, a5);
}

- (void)navigationService:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v14;
  unint64_t v15;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "legs"));
  if ((unint64_t)objc_msgSend(v8, "count") <= a4)
  {

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "legs"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", a4));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject destination](v11, "destination"));
      -[HistoryDirectionsItemSavingTask _handleArrivalAtWaypoint:endOfLegIndex:](self, "_handleArrivalAtWaypoint:endOfLegIndex:", v12, a4);

      goto LABEL_7;
    }
  }
  v13 = sub_100325FC4();
  v11 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v14 = 134217984;
    v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "navigationService:isApproachingEndOfLeg: received an invalid legIndex: %lu", (uint8_t *)&v14, 0xCu);
  }
LABEL_7:

}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  -[HistoryDirectionsItemSavingTask _handleArrivalAtWaypoint:endOfLegIndex:](self, "_handleArrivalAtWaypoint:endOfLegIndex:", a4, a5);
}

- (void)_handleArrivalAtWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;

  v6 = a3;
  v7 = sub_100325FC4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortDescription"));
    *(_DWORD *)buf = 136315650;
    v19 = "-[HistoryDirectionsItemSavingTask _handleArrivalAtWaypoint:endOfLegIndex:]";
    v20 = 2112;
    v21 = v9;
    v22 = 2048;
    v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s waypoint: %@ legIndex: %lu", buf, 0x20u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
  self->_arrivedAtDestination = objc_msgSend(v11, "isLegIndexOfLastLeg:", a4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryDirectionsItemSavingTask historyEntryRoute](self, "historyEntryRoute"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "historyEntry"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100327734;
  v15[3] = &unk_1011B1D80;
  v16 = v10;
  v17 = a4;
  v15[4] = self;
  v14 = v10;
  -[HistoryDirectionsItemSavingTask _updateHistoryEntry:withBlock:](self, "_updateHistoryEntry:withBlock:", v13, v15);

}

- (void)navigationService:(id)a3 willEndWithReason:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  __CFString *v24;
  unint64_t v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;

  v6 = a3;
  self->_navigationIsEnding = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryDirectionsItemSavingTask historyEntryRoute](self, "historyEntryRoute"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
  v9 = sub_100325FC4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v25 = a4;
    if (a4 - 1 > 9)
      v11 = CFSTR("Unknown");
    else
      v11 = off_1011B1E28[a4 - 1];
    if (objc_msgSend(v6, "isResumingMultipointRoute"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = v12;
    if (self->_arrivedAtDestination)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v24 = v14;
    if (objc_msgSend(v8, "isMultipointRoute"))
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    v16 = v15;
    v23 = objc_msgSend(v6, "targetLegIndex");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "legs"));
    *(_DWORD *)buf = 138544898;
    v27 = v11;
    v28 = 2114;
    v29 = v13;
    v30 = 2114;
    v31 = v24;
    v32 = 2114;
    v33 = v16;
    v34 = 2048;
    v35 = v23;
    v36 = 2048;
    v37 = objc_msgSend(v18, "count");
    v38 = 2048;
    v39 = objc_msgSend(v6, "stepIndex");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Navigation will end with reason: %{public}@ (resumed: %{public}@, arrived: %{public}@, multi-point: %{public}@, target leg: %lu/%lu, step: %lu).", buf, 0x48u);

    a4 = v25;
  }

  if (self->_arrivedAtDestination || !sub_100325B6C(v6, a4))
  {
    v21 = sub_100325FC4();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Will not interrupt history for resuming later. Will clear Share ETA contacts and re-save.", buf, 2u);
    }

    -[HistoryDirectionsItemSavingTask _preserveAutosharingContacts:inHistoryEntry:completion:](self, "_preserveAutosharingContacts:inHistoryEntry:completion:", 0, v7, 0);
    -[HistoryDirectionsItemSavingTask _uninterruptHistoryEntry:completion:](self, "_uninterruptHistoryEntry:completion:", v7, 0);
  }
  else
  {
    v19 = sub_100325FC4();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Have not arrived at final destination, will interrupt and save history item to resume later.", buf, 2u);
    }

    -[HistoryDirectionsItemSavingTask _interruptAndSaveHistoryEntry:completion:](self, "_interruptAndSaveHistoryEntry:completion:", v7, 0);
  }

}

- (void)_updateHistoryEntry:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  Block_layout *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(MSHistoryDirectionsItem);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = v5;
    v9 = sub_100325FC4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      v12 = objc_retainBlock(v6);
      *(_DWORD *)buf = 138543618;
      v25 = v11;
      v26 = 2114;
      v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Adding edit+commit blocks to history entry (non-MPR): %{public}@, block: %{public}@", buf, 0x16u);

    }
    (*((void (**)(id, id, _QWORD))v6 + 2))(v6, v8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    v23 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v15 = &stru_1011B1DA0;
LABEL_9:
    objc_msgSend(v13, "saveWithObjects:completionHandler:", v14, v15);

    goto LABEL_10;
  }
  v16 = objc_opt_class(MSHistoryMultiPointRoute);
  if ((objc_opt_isKindOfClass(v5, v16) & 1) != 0)
  {
    v17 = v5;
    v18 = sub_100325FC4();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
      v21 = objc_retainBlock(v6);
      *(_DWORD *)buf = 138543618;
      v25 = v20;
      v26 = 2114;
      v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Adding edit+commit blocks to history entry (MPR): %{public}@, block: %{public}@", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    v22 = v17;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v15 = &stru_1011B1DC0;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_saveRouteHistory:(id)a3 withOriginalHistoryIdentifier:(id)a4 arrivalState:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  HistoryDirectionsItemSavingTask *v18;
  unint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "source") == (id)3 || objc_msgSend(v8, "source") == (id)2)
  {
    -[HistoryDirectionsItemSavingTask _saveCustomRouteToHistory:uuid:](self, "_saveCustomRouteToHistory:uuid:", v8, v9);
  }
  else
  {
    v10 = sub_100325FC4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryDirectionsItemSavingTask historyEntryRoute](self, "historyEntryRoute"));
      v13 = sub_10064BC50(a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138412802;
      v21 = v12;
      v22 = 2112;
      v23 = v9;
      v24 = 2114;
      v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updating historyEntryRoute : %@. originalUUID: %@, arrivalState: %{public}@", buf, 0x20u);

    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10032822C;
    v16[3] = &unk_1011B1DE8;
    v18 = self;
    v19 = a5;
    v17 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[HistoryEntryRecentsItem saveRoute:withOriginalHistoryIdentifier:editBlock:](HistoryEntryRecentsItem, "saveRoute:withOriginalHistoryIdentifier:editBlock:", v17, v9, v16));
    -[NavigationRouteHistoryInfoProviding updateHistoryEntryRoute:](self->_routeInfoProvider, "updateHistoryEntryRoute:", v15);

  }
}

- (void)_saveCustomRouteToHistory:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = sub_100325FC4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueRouteID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storageID"));
    v14 = 138543874;
    v15 = v10;
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Saving custom route %{public}@ on uuid %{public}@, storageID %{public}@", (uint8_t *)&v14, 0x20u);

  }
  v12 = objc_msgSend(objc_alloc((Class)GEOComposedWaypointToRoute), "initWithRoute:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[HistoryEntryRecentsItem saveCustomRoute:asWaypoint:withOriginalHistoryIdentifier:](HistoryEntryRecentsItem, "saveCustomRoute:asWaypoint:withOriginalHistoryIdentifier:", v6, v12, v7));
  -[NavigationRouteHistoryInfoProviding updateHistoryEntryRoute:](self->_routeInfoProvider, "updateHistoryEntryRoute:", v13);

}

- (unint64_t)_routeProgressWaypointIndexForCurrentLegIndex:(unint64_t)a3 inRoute:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  _BYTE v39[128];

  v5 = a4;
  v6 = sub_100325FC4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v36 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Calculating route progress waypoint index for current leg %lu", buf, 0xCu);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v30 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "legs"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    v12 = 1;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        if ((unint64_t)objc_msgSend(v14, "legIndex") >= a3)
        {
          v22 = sub_100325FC4();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v24 = objc_msgSend(v14, "legIndex");
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "destination"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));
            *(_DWORD *)buf = 134218243;
            v36 = (unint64_t)v24;
            v37 = 2113;
            v38 = (unint64_t)v26;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "\tFound user-provided waypoint for resuming is %lu (%{private}@)", buf, 0x16u);

          }
          goto LABEL_21;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "destination"));
        v16 = objc_msgSend(v15, "isServerProvidedWaypoint");

        if (v16)
        {
          v17 = sub_100325FC4();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = objc_msgSend(v14, "legIndex");
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "destination"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
            *(_DWORD *)buf = 134218243;
            v36 = (unint64_t)v19;
            v37 = 2113;
            v38 = (unint64_t)v21;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "\tSkipping leg %lu (%{private}@), is server-provided waypoint", buf, 0x16u);

          }
        }
        else
        {
          ++v12;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v12 = 1;
  }
LABEL_21:

  v27 = sub_100325FC4();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v36 = v12;
    v37 = 2048;
    v38 = a3;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "\tCalculated route progress index %lu given current leg %lu", buf, 0x16u);
  }

  return v12;
}

- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4
{
  id v5;
  _BOOL4 navigationIsEnding;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  id v11;

  v5 = a4;
  navigationIsEnding = self->_navigationIsEnding;
  v7 = sub_100325FC4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (navigationIsEnding)
  {
    if (v9)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will not update Share ETA receivers in history item, navigation is ending", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    if (v9)
    {
      v10 = 134217984;
      v11 = objc_msgSend(v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Share ETA updated with %lu receivers, will update history item", (uint8_t *)&v10, 0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(-[HistoryDirectionsItemSavingTask historyEntryRoute](self, "historyEntryRoute"));
    -[HistoryDirectionsItemSavingTask _preserveAutosharingContacts:inHistoryEntry:completion:](self, "_preserveAutosharingContacts:inHistoryEntry:completion:", 1, v8, 0);
  }

}

- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4
{
  -[HistoryDirectionsItemSavingTask sharedTripService:didUpdateReceivers:](self, "sharedTripService:didUpdateReceivers:", a3, &__NSArray0__struct);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeInterrupter, 0);
  objc_storeStrong((id *)&self->_routeInfoProvider, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end
