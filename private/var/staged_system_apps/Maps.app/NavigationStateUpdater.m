@implementation NavigationStateUpdater

- (NavigationStateUpdater)initWithPlatformController:(id)a3
{
  id v4;
  NavigationStateUpdater *v5;
  NavigationStateUpdater *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NavigationStateUpdater;
  v5 = -[NavigationStateUpdater init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = dispatch_queue_create("com.apple.Maps.NavigationStateUpdater", 0);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v9, "registerObserver:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NavigationStateUpdater;
  -[NavigationStateUpdater dealloc](&v4, "dealloc");
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)updateMapsActivityWithStack:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  RoutePlanningSessionDirectionsPlanBuilder *v14;
  void *v15;
  uint8_t buf[4];
  __CFString *v17;

  v4 = a3;
  v5 = sub_10043188C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v4;
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "count"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v8, v9));

      }
      else
      {
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v8));
      }
    }
    else
    {
      v10 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138543362;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[EP] updateMapsActivityWithStack: %{public}@", buf, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateUpdater navigationSession](self, "navigationSession"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateUpdater navigationSession](self, "navigationSession"));
    v13 = objc_msgSend(v12, "guidanceType");

    if (v13 == (id)2 || !objc_msgSend(v4, "count"))
    {
      v11 = 0;
    }
    else
    {
      v14 = sub_1003C915C(v4, 0xFFFFFFFLL);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "buildDirectionsPlan"));

    }
  }
  -[NavigationStateUpdater setDirectionPlan:](self, "setDirectionPlan:", v11);
  -[NavigationStateUpdater _saveDirectionPlan](self, "_saveDirectionPlan");

}

- (void)_saveDirectionPlan
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  id v10;
  NSObject *workQueue;
  id v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateUpdater directionPlan](self, "directionPlan"));
  v4 = objc_msgSend(v3, "copy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setBool:forKey:", 0, CFSTR("NavigationUserActivityPendingDeletion"));

    v7 = sub_10043188C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "_saveDirectionPlan: plan is not marked for deletion";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("NavigationUserActivityPendingDeletion"));

    v10 = sub_10043188C();
    v8 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "_saveDirectionPlan: plan is marked for deletion";
      goto LABEL_6;
    }
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100867824;
  block[3] = &unk_1011AC860;
  v14 = v4;
  v12 = v4;
  dispatch_async(workQueue, block);

}

- (void)setNavigationSession:(id)a3
{
  NavigationSession *v5;
  NavigationSession *navigationSession;
  void *v7;
  void *v8;
  NavigationSession *v9;

  v5 = (NavigationSession *)a3;
  navigationSession = self->_navigationSession;
  if (navigationSession != v5)
  {
    v9 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession waypointController](navigationSession, "waypointController"));
    objc_msgSend(v7, "unregisterObserver:", self);

    -[NavigationSession removeObserver:](self->_navigationSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_navigationSession, a3);
    -[NavigationSession addObserver:](self->_navigationSession, "addObserver:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession waypointController](self->_navigationSession, "waypointController"));
    objc_msgSend(v8, "registerObserver:", self);

    v5 = v9;
  }

}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a5;
  v7 = a3;
  v8 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v12, v8) & 1) != 0)
    v9 = v12;
  else
    v9 = 0;
  v10 = v9;
  -[NavigationStateUpdater setNavigationSession:](self, "setNavigationSession:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sessionStack"));
  -[NavigationStateUpdater updateMapsActivityWithStack:](self, "updateMapsActivityWithStack:", v11);

}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NavigationStateUpdater navigationSession](self, "navigationSession"));

  if (v7 == v6)
  {
    v8 = sub_10043188C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("NotStarted");
      if (a4 == 1)
        v10 = CFSTR("Running");
      if (a4 == 2)
        v10 = CFSTR("Suspended");
      v12 = 138543362;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[EP] mapsSession:didChangeState: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    if (a4 == 1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateUpdater directionPlan](self, "directionPlan"));
      objc_msgSend(v11, "setDisplayMethod:", 2);

      -[NavigationStateUpdater _saveDirectionPlan](self, "_saveDirectionPlan");
    }
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  char v10;
  id WeakRetained;
  void *v12;
  id v13;

  v8 = a3;
  if (a5 != a4)
  {
    v13 = v8;
    v10 = MNNavigationServiceStateChangedToNavigating(a4, a5, v9);
    v8 = v13;
    if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 4 && (v10 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sessionStack"));
      -[NavigationStateUpdater updateMapsActivityWithStack:](self, "updateMapsActivityWithStack:", v12);

      v8 = v13;
    }
  }

}

- (void)navigationService:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  char *v10;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService", a3, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "route"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "legs"));
  v10 = (char *)objc_msgSend(v9, "count") - 1;

  if (v10 == (char *)a5)
  {
    -[NavigationStateUpdater setDirectionPlan:](self, "setDirectionPlan:", 0);
    -[NavigationStateUpdater _saveDirectionPlan](self, "_saveDirectionPlan");
  }
}

- (void)navigationWaypointController:(id)a3 didUpdateDisplayedWaypoints:(id)a4
{
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sessionStack"));
  -[NavigationStateUpdater updateMapsActivityWithStack:](self, "updateMapsActivityWithStack:", v5);

}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (DirectionsPlan)directionPlan
{
  return self->_directionPlan;
}

- (void)setDirectionPlan:(id)a3
{
  objc_storeStrong((id *)&self->_directionPlan, a3);
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_directionPlan, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
