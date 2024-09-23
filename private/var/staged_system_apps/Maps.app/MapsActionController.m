@implementation MapsActionController

- (MapsActionController)init
{
  MapsActionController *v2;
  MapsActionController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsActionController;
  v2 = -[MapsActionController init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MapsActionController checkHandlersForActionClasses](v2, "checkHandlersForActionClasses");
  return v3;
}

- (IOSChromeViewController)chrome
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));

  return (IOSChromeViewController *)v3;
}

- (ActionCoordination)coordinator
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActionController chrome](self, "chrome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "topContext"));

  v4 = objc_opt_class(BaseModeController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionCoordinator"));
  else
    v5 = 0;

  return (ActionCoordination *)v5;
}

- (NavActionCoordination)navActionCoordinator
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActionController chrome](self, "chrome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "topContext"));

  v4 = objc_opt_class(NavModeController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionCoordinator"));
  else
    v5 = 0;

  return (NavActionCoordination *)v5;
}

- (AppStateManager)appStateManager
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "appStateManager"));

  return (AppStateManager *)v3;
}

- (BOOL)isRestoringState
{
  return self->_isRestoringState;
}

- (BOOL)isNavigationTurnByTurnOrStepping
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  v3 = objc_msgSend(WeakRetained, "isNavigationTurnByTurnOrStepping");

  return v3;
}

- (BOOL)isCarPlayOnlyContext
{
  return 0;
}

- (CarStateManager)carStateManager
{
  return 0;
}

- (void)entryPointsCoordinator:(id)a3 performErrorAction:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a4;
  v6 = sub_100431A4C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "MapsActionController: performErrorAction %@", (uint8_t *)&v8, 0xCu);
  }

  -[MapsActionController _performAction:](self, "_performAction:", v5);
}

- (void)entryPointsCoordinator:(id)a3 didMergedRichMapsActivity:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int IsEqualToMapItemForPurpose;
  id v21;
  NSObject *v22;
  MapsActionController *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  MapsActionController *v30;
  unsigned __int8 v31;
  id v32;
  NSObject *v33;
  _BOOL4 v34;
  id WeakRetained;
  void *v36;
  _QWORD v37[4];
  id v38;
  MapsActionController *v39;
  uint8_t buf[4];
  MapsActionController *v41;
  __int16 v42;
  void *v43;

  v6 = a4;
  if (v6)
  {
    self->_isRestoringState = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v7, "dismissCurrentInterruption");

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
    v9 = objc_opt_class(RestorationAction);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
      && -[MapsActionController isNavigationTurnByTurnOrStepping](self, "isNavigationTurnByTurnOrStepping")
      && (-[NSObject isCompatibleWithNavigation](v8, "isCompatibleWithNavigation") & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "destination"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapsActivity"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "directionsPlan"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "planningWaypoints"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "waypoint"));

      if (v12)
      {
        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItemStorage"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapItemStorage"));
          IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose(v18, v19, 1);

          if (IsEqualToMapItemForPurpose)
          {
            v21 = sub_100431A4C();
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = (MapsActionController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shortDescription"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "shortDescription"));
              *(_DWORD *)buf = 138412546;
              v41 = v23;
              v42 = 2112;
              v43 = v24;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "MapsActionController: Skipping application of route restoration, currentDestination: %@, restorationDestination: %@", buf, 0x16u);

            }
            goto LABEL_19;
          }
        }
      }

    }
    if (-[MapsActionController isNavigationTurnByTurnOrStepping](self, "isNavigationTurnByTurnOrStepping")
      && (-[NSObject isCompatibleWithNavigation](v8, "isCompatibleWithNavigation") & 1) == 0)
    {
      objc_storeStrong((id *)&self->_pendingActivityToApplyAfterNavEnd, a4);
      v28 = sub_100431A4C();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = (MapsActionController *)objc_claimAutoreleasedReturnValue(-[RichMapsActivity shortDescription](self->_pendingActivityToApplyAfterNavEnd, "shortDescription"));
        *(_DWORD *)buf = 138412290;
        v41 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "MapsActionController: NavigatingOrStepping is running for pending %@ ", buf, 0xCu);

      }
      v31 = -[NSObject forceEndNavigation](v8, "forceEndNavigation");
      v32 = sub_100431A4C();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
      if ((v31 & 1) != 0)
      {
        if (v34)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "MapsActionController: forceEndNavigation", buf, 2u);
        }

        WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
        objc_msgSend(WeakRetained, "endNavigationAndReturnToRoutePlanning:", 0);

      }
      else
      {
        if (v34)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "MapsActionController: ask for kMapsInterruptionMaybeEndNavigation", buf, 2u);
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100990240;
        v37[3] = &unk_1011DD5F8;
        v38 = v6;
        v39 = self;
        objc_msgSend(v36, "interruptApplicationWithKind:userInfo:completionHandler:", 7, 0, v37);

      }
    }
    else
    {
      v26 = sub_100431A4C();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "MapsActionController: call applyRichMapsActivityOrWaitForLocation", buf, 2u);
      }

      -[MapsActionController applyRichMapsActivityOrWaitForLocation:](self, "applyRichMapsActivityOrWaitForLocation:", v6);
    }
  }
  else
  {
    v25 = sub_100431A4C();
    v8 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MapsActionController:  %@ didMergedRichMapsActivity richMapsActivity is nil", buf, 0xCu);
    }
  }
LABEL_19:

}

- (BOOL)pendingAction
{
  return self->_pendingActivityToApplyAfterNavEnd != 0;
}

- (void)navigationEnded
{
  id v3;
  NSObject *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;

  if (self->_pendingActivityToApplyAfterNavEnd)
  {
    v3 = sub_100431A4C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RichMapsActivity shortDescription](self->_pendingActivityToApplyAfterNavEnd, "shortDescription"));
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MapsActionController : navigationEnded for pending %@ ", buf, 0xCu);

    }
    v6 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009904B8;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)applyRichMapsActivityOrWaitForLocation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  int BOOL;
  int v12;
  void *v13;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortDescription"));
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MapsActionController : applyRichMapsActivityOrWaitForLocation for %@ ", (uint8_t *)&v12, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v9 = objc_msgSend(v8, "isAuthorizedForPreciseLocation");

  if (!v9)
    goto LABEL_8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
  if (!objc_msgSend(v10, "needsUserLocation"))
  {
    BOOL = GEOConfigGetBOOL(MapsConfig_StartUserLocationAlwayWait, off_1014B30F8);

    if (BOOL)
      goto LABEL_7;
LABEL_8:
    -[MapsActionController applyRichMapsActivity:](self, "applyRichMapsActivity:", v4);
    goto LABEL_9;
  }

LABEL_7:
  -[MapsActionController getUserLocationIfneededFor:](self, "getUserLocationIfneededFor:", v4);
LABEL_9:

}

- (void)getUserLocationIfneededFor:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  double Double;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  MapsActionController *v21;
  double v22;
  double v23;
  uint8_t buf[4];
  void *v25;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortDescription"));
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MapsActionController : Wait Location for %@ ", buf, 0xCu);

  }
  Double = GEOConfigGetDouble(MapsConfig_StartUserLocationTimeout, off_1014B3108);
  v9 = GEOConfigGetDouble(MapsConfig_StartUserLocationMaxAge, off_1014B3118);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
  objc_msgSend(v11, "userLocationDesiredAccuracy");
  v13 = v12;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1009907D0;
  v19 = &unk_1011DD620;
  v22 = Double;
  v23 = v9;
  v20 = v4;
  v21 = self;
  v14 = v4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "singleLocationUpdateWithDesiredAccuracy:handler:timeout:maxLocationAge:", &v16, v13, Double, v9));
  objc_msgSend(v15, "start", v16, v17, v18, v19);

}

- (void)applyRichMapsActivity:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  dispatch_queue_global_t global_queue;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void **v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;

  v4 = a3;
  if (v4)
  {
    v5 = sub_100431A4C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortDescription"));
      *(_DWORD *)buf = 138412290;
      v45 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MapsActionController : applyRichMapsActivity %@", buf, 0xCu);

    }
    if (objc_msgSend(v4, "isTestingAction"))
    {
      v8 = sub_100431A4C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "MapsActionController : applyRichMapsActivity Resetting UI for Testing Action", buf, 2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActionController chrome](self, "chrome"));
      objc_msgSend(v10, "resetForTestingAction");

      v11 = sub_100431A4C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "MapsActionController : applyRichMapsActivity Reset for Testing Complete", buf, 2u);
      }

    }
    if (objc_msgSend(v4, "needsUIReset"))
    {
      v13 = sub_100431A4C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "MapsActionController : applyRichMapsActivity resetting UI", buf, 2u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActionController chrome](self, "chrome"));
      objc_msgSend(v15, "resetForLaunchURLWithOptions:", 0);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapsActivity"));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));

      v20 = sub_100431A4C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "MapsActionController: apply (tag %@)", buf, 0xCu);
      }

      global_queue = dispatch_get_global_queue(-2, 0);
      v23 = objc_claimAutoreleasedReturnValue(global_queue);
      v38 = _NSConcreteStackBlock;
      v39 = 3221225472;
      v40 = sub_100990DB0;
      v41 = &unk_1011AC8B0;
      v24 = v19;
      v42 = v24;
      v25 = v17;
      v43 = v25;
      dispatch_async(v23, &v38);

      v26 = objc_opt_class(RestorationAction);
      if ((objc_opt_isKindOfClass(v16, v26) & 1) != 0)
      {
        v27 = v16;
        -[MapsActionController _applyActivity:assumedSourceFidelity:source:](self, "_applyActivity:assumedSourceFidelity:source:", v25, objc_msgSend(v27, "fidelity", v38, v39, v40, v41, v42), objc_msgSend(v27, "source"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
        v29 = objc_msgSend(v28, "isInternalInstall");

        if (v29)
        {
          v30 = objc_autoreleasePoolPush();
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "dataUsingEncoding:", 4));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bzip2CompressedData"));

          objc_autoreleasePoolPop(v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "description"));
          objc_msgSend(v34, "setObject:forKey:", v36, CFSTR("dateLastUserActivity"));

          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          objc_msgSend(v37, "setObject:forKey:", v33, CFSTR("lastUserActivityData"));

        }
      }
      else
      {
        -[MapsActionController _applyActivity:assumedSourceFidelity:source:](self, "_applyActivity:assumedSourceFidelity:source:", v25, 268435407, 2, v38, v39, v40, v41, v42);
      }

    }
    -[MapsActionController _performAction:](self, "_performAction:", v16);
    self->_isRestoringState = 0;

  }
}

- (void)_performAction:(id)a3
{
  +[MapsActionHandler performAction:inContext:](MapsActionHandler, "performAction:inContext:", a3, self);
}

- (void)_applyActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MapsActionController appStateManager](self, "appStateManager"));
  objc_msgSend(v9, "setMapsActivity:assumedSourceFidelity:source:", v8, a4, a5);

}

- (AppCoordinator)appCoordinator
{
  return (AppCoordinator *)objc_loadWeakRetained((id *)&self->_appCoordinator);
}

- (void)setAppCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_appCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appCoordinator);
  objc_storeStrong((id *)&self->_pendingActivityToApplyAfterNavEnd, 0);
}

@end
