@implementation EntryPointsCoordinator

- (EntryPointsCoordinator)init
{
  EntryPointsCoordinator *v2;
  EntryPointsCoordinator *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *tasks;
  uint64_t v9;
  NSMutableArray *tasksToPerform;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *tasksQueue;
  dispatch_group_t v17;
  OS_dispatch_group *tasksGroup;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)EntryPointsCoordinator;
  v2 = -[EntryPointsCoordinator init](&v21, "init");
  v3 = v2;
  if (v2)
  {
    v2->_firstWidget = 1;
    v2->_coldLaunch = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v5 = sub_1002A8AA0(v4);

    if (v5 != 5)
    {
      v3->_shouldWaitForFirstContainee = 1;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v6, "addObserver:selector:name:object:", v3, "receivedDidPresentContaineeNotification:", CFSTR("ContainerDidPresentContaineeNotification"), 0);

    }
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    tasks = v3->_tasks;
    v3->_tasks = (NSMutableArray *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    tasksToPerform = v3->_tasksToPerform;
    v3->_tasksToPerform = (NSMutableArray *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);

    v15 = dispatch_queue_create("com.apple.MapsEntryPoint", v14);
    tasksQueue = v3->_tasksQueue;
    v3->_tasksQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_group_create();
    tasksGroup = v3->_tasksGroup;
    v3->_tasksGroup = (OS_dispatch_group *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v3, "receivedFullyDrawnNotification:", VKMapViewDidBecomeFullyDrawnNotification, 0);

  }
  return v3;
}

- (LaunchAlertsManager)launchAlertsManager
{
  LaunchAlertsManager *launchAlertsManager;
  LaunchAlertsManager *v4;
  LaunchAlertsManager *v5;
  id v6;
  NSObject *v7;
  LaunchAlertsManager *v8;
  int v10;
  LaunchAlertsManager *v11;

  launchAlertsManager = self->_launchAlertsManager;
  if (!launchAlertsManager)
  {
    v4 = objc_alloc_init(LaunchAlertsManager);
    v5 = self->_launchAlertsManager;
    self->_launchAlertsManager = v4;

    -[LaunchAlertsManager setDelegate:](self->_launchAlertsManager, "setDelegate:", self);
    v6 = sub_100431A4C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = self->_launchAlertsManager;
      v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[EP] created %@", (uint8_t *)&v10, 0xCu);
    }

    launchAlertsManager = self->_launchAlertsManager;
  }
  return launchAlertsManager;
}

- (void)_cleanState
{
  id v3;
  NSObject *v4;
  RichMapsActivity *mergedRichMapsActivity;
  uint8_t v6[16];

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[EP] cleanState", v6, 2u);
  }

  mergedRichMapsActivity = self->_mergedRichMapsActivity;
  self->_mergedRichMapsActivity = 0;

  self->_tasksDone = 0;
  self->_restoreTaskAdded = 0;
  -[NSMutableArray removeAllObjects](self->_tasks, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_tasksToPerform, "removeAllObjects");
  *(_WORD *)&self->_launchedWithExternalInput = 0;
}

- (void)_addCompletionIfNeeded
{
  NSObject *tasksGroup;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[NSMutableArray count](self->_tasksToPerform, "count") == (id)1)
  {
    objc_initWeak(&location, self);
    tasksGroup = self->_tasksGroup;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1007C4518;
    v4[3] = &unk_1011AD260;
    objc_copyWeak(&v5, &location);
    dispatch_group_notify(tasksGroup, (dispatch_queue_t)&_dispatch_main_q, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_addTask:(id)a3
{
  -[EntryPointsCoordinator _addTask:atFirstIndex:](self, "_addTask:atFirstIndex:", a3, 0);
}

- (void)_insertTaskAtFirstIndex:(id)a3
{
  -[EntryPointsCoordinator _addTask:atFirstIndex:](self, "_addTask:atFirstIndex:", a3, 1);
}

- (void)_addTask:(id)a3 atFirstIndex:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableArray *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSMutableArray *tasks;
  NSMutableArray *v12;
  id v13;
  NSObject *v14;
  NSObject *tasksQueue;
  _QWORD block[4];
  NSMutableArray *v17;
  EntryPointsCoordinator *v18;
  id v19;
  uint8_t buf[4];
  NSMutableArray *v21;

  v4 = a4;
  v6 = (NSMutableArray *)a3;
  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v10)
      {
        tasks = self->_tasks;
        *(_DWORD *)buf = 138412290;
        v21 = tasks;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[EP] insert in %@", buf, 0xCu);
      }

      -[NSMutableArray insertObject:atIndex:](self->_tasks, "insertObject:atIndex:", v6, 0);
      -[NSMutableArray insertObject:atIndex:](self->_tasksToPerform, "insertObject:atIndex:", v6, 0);
    }
    else
    {
      if (v10)
      {
        v12 = self->_tasks;
        *(_DWORD *)buf = 138412290;
        v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[EP] addTask in %@", buf, 0xCu);
      }

      -[NSMutableArray addObject:](self->_tasks, "addObject:", v6);
      -[NSMutableArray addObject:](self->_tasksToPerform, "addObject:", v6);
    }
    dispatch_group_enter((dispatch_group_t)self->_tasksGroup);
    v13 = sub_100431A4C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[EP] addTask dispatch_group_enter task: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    tasksQueue = self->_tasksQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007C4824;
    block[3] = &unk_1011AFE28;
    v17 = v6;
    objc_copyWeak(&v19, (id *)buf);
    v18 = self;
    dispatch_async(tasksQueue, block);
    -[EntryPointsCoordinator _addCompletionIfNeeded](self, "_addCompletionIfNeeded");
    objc_destroyWeak(&v19);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[EP] addTask not on the main thread", buf, 2u);
    }

  }
}

- (void)_mergeTasks
{
  id v3;
  NSObject *v4;
  NSMutableArray *tasksToPerform;
  id v6;
  NSObject *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  MapsActivityMergeController *v16;
  RichMapsActivity *v17;
  RichMapsActivity *mergedRichMapsActivity;
  id v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  NSMutableArray *v27;

  if (-[NSMutableArray count](self->_tasksToPerform, "count"))
  {
    v3 = sub_100431A4C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      tasksToPerform = self->_tasksToPerform;
      *(_DWORD *)buf = 138412290;
      v27 = tasksToPerform;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[EP] mergeTasks we should not have any more tasks to perform %@", buf, 0xCu);
    }
  }
  else
  {
    if (-[NSMutableArray count](self->_tasks, "count") == (id)1 && self->_launchedWithExternalInput)
    {
      v6 = sub_100431A4C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[EP] mergeTasks we should have 2 tasks to merge", buf, 2u);
      }

    }
    v4 = objc_alloc_init((Class)NSMutableArray);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = self->_tasks;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "computedRichMapsActivity", (_QWORD)v21));

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "computedRichMapsActivity"));
            -[NSObject addObject:](v4, "addObject:", v15);

          }
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    if (-[NSObject count](v4, "count"))
    {
      v16 = objc_alloc_init(MapsActivityMergeController);
      v17 = (RichMapsActivity *)objc_claimAutoreleasedReturnValue(-[MapsActivityMergeController mergeActivities:](v16, "mergeActivities:", v4));
      -[RichMapsActivity setColdLaunch:](v17, "setColdLaunch:", self->_coldLaunch);
      self->_didLaunchWithExplicitIntent = -[RichMapsActivity didLaunchWithExplicitIntent](v17, "didLaunchWithExplicitIntent");
      mergedRichMapsActivity = self->_mergedRichMapsActivity;
      self->_mergedRichMapsActivity = v17;

      -[EntryPointsCoordinator _sendMergedRichMapsActivityIfPossible](self, "_sendMergedRichMapsActivityIfPossible");
    }
    else
    {
      v19 = sub_100431A4C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[EP] nothing to Merge", buf, 2u);
      }

      -[EntryPointsCoordinator _cleanState](self, "_cleanState");
    }
  }

}

- (void)_sendMergedRichMapsActivityIfPossible
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EntryPointsCoordinator launchAlertsManager](self, "launchAlertsManager"));
  v4 = objc_msgSend(v3, "currentlyShowingAlert");

  if (v4)
  {
    self->_waitingForAlerts = 1;
    v5 = sub_100431A4C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[EP] Wait for Alerts to process", v8, 2u);
    }

    if (self->_didLaunchWithExplicitIntent)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[EntryPointsCoordinator launchAlertsManager](self, "launchAlertsManager"));
      objc_msgSend(v7, "cancelVisibleAlertIfNecessary");

    }
  }
  else if (!-[EntryPointsCoordinator _debug_shouldSkipSendingMergedRichMapsActivity](self, "_debug_shouldSkipSendingMergedRichMapsActivity"))
  {
    -[EntryPointsCoordinator _sendMergedRichMapsActivity](self, "_sendMergedRichMapsActivity");
  }
}

- (BOOL)_debug_shouldSkipSendingMergedRichMapsActivity
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;

  if ((_GEOConfigHasValue(MapsConfig_CameraDefaultPitch, off_1014B4DB8) & 1) != 0
    || _GEOConfigHasValue(MapsConfig_CameraDefaultZoom, off_1014B4DC8))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RichMapsActivity action](self->_mergedRichMapsActivity, "action"));
    v4 = objc_opt_class(RestorationAction);
    isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_sendMergedRichMapsActivity
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  RichMapsActivity *v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  RichMapsActivity *v10;
  id v11;
  id WeakRetained;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  RichMapsActivity *v18;
  uint8_t buf[4];
  void *v20;

  if (self->_mergedRichMapsActivity)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));

    v5 = sub_100431A4C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[EP] sendMergedRichMapsActivity (tag %@)", buf, 0xCu);
    }

    v7 = self->_mergedRichMapsActivity;
    global_queue = dispatch_get_global_queue(-2, 0);
    v9 = objc_claimAutoreleasedReturnValue(global_queue);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1007C4FE0;
    v16 = &unk_1011AC8B0;
    v17 = v4;
    v18 = v7;
    v10 = v7;
    v11 = v4;
    dispatch_async(v9, &v13);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "entryPointsCoordinator:didMergedRichMapsActivity:", self, self->_mergedRichMapsActivity, v13, v14, v15, v16);

  }
  -[EntryPointsCoordinator _cleanState](self, "_cleanState");
}

- (void)_lockMergeActivities
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  __CFString *v8;

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self->_mergeLocked)
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    v6 = v5;
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[EP] lockMergeActivities (%@)", (uint8_t *)&v7, 0xCu);

  }
  if (!self->_mergeLocked)
  {
    self->_mergeLocked = 1;
    dispatch_group_enter((dispatch_group_t)self->_tasksGroup);
  }
}

- (void)_unlockMergeActivities
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  __CFString *v8;

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self->_mergeLocked)
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    v6 = v5;
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[EP] unlockMergeActivities (%@)", (uint8_t *)&v7, 0xCu);

  }
  if (self->_mergeLocked)
    dispatch_group_leave((dispatch_group_t)self->_tasksGroup);
  self->_mergeLocked = 0;
}

- (void)_displayLaunchAlertsIfNecessary
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  unsigned int v12;
  void *v13;
  id v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  unsigned __int8 v21;
  void *v22;
  uint8_t v23[16];

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[EP] displayLaunchAlertsIfNecessary", v23, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EntryPointsCoordinator launchAlertsManager](self, "launchAlertsManager"));
  objc_msgSend(v5, "cancelVisibleAlertIfNecessary");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v6, "dismissCurrentInterruption");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_msgSend(WeakRetained, "isCarPlayOnlyContext");

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[EntryPointsCoordinator launchAlertsManager](self, "launchAlertsManager"));
    objc_msgSend(v9, "enqueueAlert:", 5);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[EntryPointsCoordinator launchAlertsManager](self, "launchAlertsManager"));
  objc_msgSend(v10, "enqueueAlert:", 0);

  v11 = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_msgSend(v11, "isCarPlayOnlyContext");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[EntryPointsCoordinator launchAlertsManager](self, "launchAlertsManager"));
    objc_msgSend(v13, "enqueueAlert:", 1);

  }
  v14 = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = objc_msgSend(v14, "isCarPlayOnlyContext");

  if ((v15 & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[EntryPointsCoordinator launchAlertsManager](self, "launchAlertsManager"));
    objc_msgSend(v16, "enqueueAlert:", 2);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[EntryPointsCoordinator launchAlertsManager](self, "launchAlertsManager"));
    objc_msgSend(v17, "enqueueAlert:", 3);

  }
  if (GEOConfigGetInteger(GEOConfigMapsSuggestionsShortcutManagerBehaviorSetupPlaceholderWhenNoContactsConsent[0], GEOConfigMapsSuggestionsShortcutManagerBehaviorSetupPlaceholderWhenNoContactsConsent[1]) == 1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[EntryPointsCoordinator launchAlertsManager](self, "launchAlertsManager"));
    objc_msgSend(v18, "enqueueAlert:", 4);

  }
  v19 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_msgSend(v19, "isCarPlayOnlyContext") & 1) != 0)
    goto LABEL_14;
  v20 = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = objc_msgSend(v20, "isNavigationTurnByTurnOrStepping");

  if ((v21 & 1) == 0)
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(-[EntryPointsCoordinator launchAlertsManager](self, "launchAlertsManager"));
    objc_msgSend(v19, "enqueueAlert:", 6);
LABEL_14:

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[EntryPointsCoordinator launchAlertsManager](self, "launchAlertsManager"));
  objc_msgSend(v22, "executeAlertsIfNecessary");

}

- (void)_updateLocaleInformation
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textInputMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryLanguage"));

  v5 = objc_claimAutoreleasedReturnValue(+[MapsAnalyticStateProvider serialQueue](MapsAnalyticStateProvider, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007C5544;
  block[3] = &unk_1011AC860;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)launchAlertsManagerDidFinishProcessingAlert:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_100431A4C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[EP] launchAlertsManagerDidFinishProcessingAlert", v6, 2u);
  }

  if (self->_waitingForAlerts)
  {
    self->_waitingForAlerts = 0;
    -[EntryPointsCoordinator _mergeTasks](self, "_mergeTasks");
  }
}

- (BOOL)_shouldRestoreNavigationSession:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  int v20;
  int v22;
  __CFString *v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  __CFString *v27;

  v4 = a3;
  v5 = +[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneConnected](UIApplication, "_maps_isAnyApplicationOrCarPlayApplicationSceneConnected");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scene"));

  v7 = +[UIApplication _maps_isCarPlayWidgetScene:](UIApplication, "_maps_isCarPlayWidgetScene:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("NavigationUserActivityPendingDeletion"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("NavigationUserActivityDefault")));

  v12 = sub_100431A4C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    if (v5)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = v14;
    if (v7)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    v17 = v16;
    if (v11)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    v19 = v18;
    v22 = 138412802;
    v23 = v15;
    v24 = 2112;
    v25 = v17;
    v26 = 2112;
    v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[EP] _shouldRestoreNavigationSession main %@ widget %@ data %@", (uint8_t *)&v22, 0x20u);

  }
  v20 = v5 | v7 ^ 1;
  if (!v11)
    v20 = 1;
  return ((v20 | v9) & 1) == 0 && self->_firstWidget;
}

- (BOOL)_sessionShouldParticipateInLifecycle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scene"));
  LOBYTE(self) = -[EntryPointsCoordinator _sessionShouldParticipateInLifecycle:scene:](self, "_sessionShouldParticipateInLifecycle:scene:", v4, v5);

  return (char)self;
}

- (BOOL)_sessionShouldParticipateInLifecycle:(id)a3 scene:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "role"));
  v7 = objc_msgSend(v6, "isEqualToString:", UIWindowSceneSessionRoleApplication);

  if ((v7 & 1) != 0)
    v8 = 1;
  else
    v8 = +[UIApplication _maps_isCarPlayApplicationScene:](UIApplication, "_maps_isCarPlayApplicationScene:", v5);

  return v8;
}

- (void)prepareBackgroundNavigation
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[EP] prepareBackgroundNavigation", v5, 2u);
  }

  self->_launchedInBackground = 1;
  if (self->_mergeLocked)
    -[EntryPointsCoordinator _unlockMergeActivities](self, "_unlockMergeActivities");
}

- (void)willConnectToSession:(id)a3 options:(id)a4 windowSize:(CGSize)a5 scene:(id)a6
{
  double height;
  double width;
  __CFString *v11;
  __CFString *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  __CFString *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  __CFString *v51;

  height = a5.height;
  width = a5.width;
  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  v13 = -[EntryPointsCoordinator _sessionShouldParticipateInLifecycle:scene:](self, "_sessionShouldParticipateInLifecycle:scene:", v11, a6);
  v14 = sub_100431A4C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if ((v13 & 1) == 0)
  {
    if (v16)
    {
      LOWORD(v46) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[EP] willConnectToSession scene not participating", (uint8_t *)&v46, 2u);
    }
    goto LABEL_38;
  }
  if (v16)
  {
    v46 = 138412546;
    v47 = v11;
    v48 = 2112;
    v49 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[EP] willConnectToSession: %@ options: %@", (uint8_t *)&v46, 0x16u);
  }

  v17 = objc_claimAutoreleasedReturnValue(-[__CFString shortcutItem](v12, "shortcutItem"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString URLContexts](v12, "URLContexts"));
  if (objc_msgSend(v18, "count"))
  {
    self->_launchedWithExternalInput = 1;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString handoffUserActivityType](v12, "handoffUserActivityType"));
    if (v19)
    {
      self->_launchedWithExternalInput = 1;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString userActivities](v12, "userActivities"));
      self->_launchedWithExternalInput = ((unint64_t)objc_msgSend(v20, "count") | v17) != 0;

    }
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString URLContexts](v12, "URLContexts"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "anyObject"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URL"));
  v24 = -[EntryPointsCoordinator _isBackgroundNavigationLaunch:](self, "_isBackgroundNavigationLaunch:", v23);

  v25 = sub_100431A4C();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    if (self->_launchedWithExternalInput)
      v27 = CFSTR("YES");
    else
      v27 = CFSTR("NO");
    v28 = v27;
    if (self->_launchedInBackground)
      v29 = CFSTR("YES");
    else
      v29 = CFSTR("NO");
    v30 = v29;
    if (v24)
      v31 = CFSTR("YES");
    else
      v31 = CFSTR("NO");
    v32 = v31;
    v46 = 138412802;
    v47 = v28;
    v48 = 2112;
    v49 = v30;
    v50 = 2112;
    v51 = v32;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[EP] launchedWithExternalInput: %@, launchedInBackground: %@, isBackgroundNavigationLaunch: %@", (uint8_t *)&v46, 0x20u);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString sourceApplication](v12, "sourceApplication"));
  -[EntryPointsCoordinator setLaunchApplication:](self, "setLaunchApplication:", v33);

  if (self->_launchedWithExternalInput)
  {
    v34 = self->_launchedInBackground ? 0 : v24;
    if (v34 == 1)
      -[EntryPointsCoordinator prepareBackgroundNavigation](self, "prepareBackgroundNavigation");
  }
  if (!self->_waitingForCarplayAppScene
    && !+[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground](UIApplication, "_maps_isAnyApplicationOrCarPlayApplicationSceneForeground"))
  {
    -[EntryPointsCoordinator _lockMergeActivities](self, "_lockMergeActivities");
  }
  self->_waitingForCarplayAppScene = 0;
  -[EntryPointsCoordinator _addRestoreTaskForSession:](self, "_addRestoreTaskForSession:", v11);
  self->_launchedInBackground = 0;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString URLContexts](v12, "URLContexts"));
  v36 = objc_msgSend(v35, "count");

  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString URLContexts](v12, "URLContexts"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "anyObject"));

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "URL"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "options"));
    -[EntryPointsCoordinator openURL:session:sceneOptions:mkOptions:windowSize:](self, "openURL:session:sceneOptions:mkOptions:windowSize:", v39, v11, v40, 0, width, height);

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString userActivities](v12, "userActivities"));
  v42 = objc_msgSend(v41, "count");

  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString userActivities](v12, "userActivities"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "anyObject"));

    -[EntryPointsCoordinator continueUserActivity:session:windowSize:](self, "continueUserActivity:session:windowSize:", v44, v11, width, height);
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString shortcutItem](v12, "shortcutItem"));

  if (v45)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[__CFString shortcutItem](v12, "shortcutItem"));
    -[EntryPointsCoordinator openShortcutItem:](self, "openShortcutItem:", v15);
LABEL_38:

  }
}

- (void)willResignActiveWithSession:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (-[EntryPointsCoordinator _sessionShouldParticipateInLifecycle:](self, "_sessionShouldParticipateInLifecycle:", a3))
  {
    v3 = sub_100431A4C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[EP] willResignActive", v5, 2u);
    }

  }
}

- (void)didEnterBackgroundWithSession:(id)a3
{
  unsigned int v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (-[EntryPointsCoordinator _sessionShouldParticipateInLifecycle:](self, "_sessionShouldParticipateInLifecycle:", a3))
  {
    v4 = +[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground](UIApplication, "_maps_isAnyApplicationOrCarPlayApplicationSceneForeground");
    v5 = sub_100431A4C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[EP] ignoring didEnterBackground since another application scene is foreground, not locking merge activities", buf, 2u);
      }

    }
    else
    {
      if (v7)
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[EP] didEnterBackground", v8, 2u);
      }

      -[EntryPointsCoordinator _cleanState](self, "_cleanState");
      -[EntryPointsCoordinator _lockMergeActivities](self, "_lockMergeActivities");
      +[MapsAnalyticStateProvider clearSharedState](MapsAnalyticStateProvider, "clearSharedState");
    }
  }
}

- (void)willEnterForegroundWithSession:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (-[EntryPointsCoordinator _sessionShouldParticipateInLifecycle:](self, "_sessionShouldParticipateInLifecycle:", v4))
  {
    v5 = sub_100431A4C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[EP] willEnterForeground", v7, 2u);
    }

    -[EntryPointsCoordinator _addRestoreTaskForSession:](self, "_addRestoreTaskForSession:", v4);
  }

}

- (void)didBecomeActiveWithSession:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _BOOL4 shouldWaitForFirstContainee;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  _QWORD *v33;
  uint8_t *v34;
  uint8_t buf[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id location;

  v4 = a3;
  v5 = -[EntryPointsCoordinator _sessionShouldParticipateInLifecycle:](self, "_sessionShouldParticipateInLifecycle:", v4);
  v6 = sub_100431A4C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[EP] didBecomeActive", buf, 2u);
    }

    objc_initWeak(&location, self);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1007C645C;
    v45[3] = &unk_1011AD260;
    objc_copyWeak(&v46, &location);
    v9 = objc_retainBlock(v45);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1007C64F0;
    v41[3] = &unk_1011B3488;
    objc_copyWeak(&v44, &location);
    v41[4] = self;
    v10 = v9;
    v43 = v10;
    v11 = v4;
    v42 = v11;
    v12 = objc_retainBlock(v41);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "role"));
    if ((objc_msgSend(v13, "isEqual:", _UIWindowSceneSessionRoleCarPlay) & 1) != 0)
    {

    }
    else
    {
      shouldWaitForFirstContainee = self->_shouldWaitForFirstContainee;

      if (shouldWaitForFirstContainee)
      {
        v22 = sub_100431A4C();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[EP] waiting for first containee", buf, 2u);
        }

        *(_WORD *)&self->_shouldWaitForFirstContainee = 256;
        *(_QWORD *)buf = 0;
        v36 = buf;
        v37 = 0x3032000000;
        v38 = sub_1007C665C;
        v39 = sub_1007C666C;
        v40 = 0;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1007C6674;
        v32[3] = &unk_1011B4A30;
        v34 = buf;
        v33 = v12;
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "addObserverForName:object:queue:usingBlock:", CFSTR("ContainerDidPresentContaineeNotification"), 0, v25, v32));
        v27 = (void *)*((_QWORD *)v36 + 5);
        *((_QWORD *)v36 + 5) = v26;

        _Block_object_dispose(buf, 8);
        goto LABEL_20;
      }
    }
    if (!self->_waitingForFirstContainee)
      ((void (*)(_QWORD *))v12[2])(v12);
LABEL_20:

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
    goto LABEL_26;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[EP] _sessionShouldParticipateInLifecycle == NO", buf, 2u);
  }

  if (-[EntryPointsCoordinator _shouldRestoreNavigationSession:](self, "_shouldRestoreNavigationSession:", v4))
  {
    self->_firstWidget = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("NavigationRestorationAttempts")));

    if (v15)
    {
      v16 = (char *)objc_msgSend(v15, "unsignedIntegerValue");
      if ((unint64_t)v16 > 2)
      {
        v17 = sub_100431A4C();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[EP] discard Navigation defaults, too many attempts", buf, 2u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v19, "removeObjectForKey:", CFSTR("NavigationUserActivityDefault"));

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v20, "removeObjectForKey:", CFSTR("NavigationRestorationAttempts"));

LABEL_25:
        goto LABEL_26;
      }
    }
    else
    {
      v16 = 0;
    }
    v28 = sub_100431A4C();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[EP] needs to launch main CarPlay", buf, 2u);
    }

    self->_waitingForCarplayAppScene = 1;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16 + 1));
    objc_msgSend(v30, "setObject:forKey:", v31, CFSTR("NavigationRestorationAttempts"));

    +[MapsCarPlayServicesShim openMapsCarPlayApplicationSuspended](MapsCarPlayServicesShim, "openMapsCarPlayApplicationSuspended");
    goto LABEL_25;
  }
LABEL_26:

}

- (void)_addRestoreTaskForSession:(id)a3
{
  id v4;
  unsigned int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  NSObject *v14;
  NSMutableArray *tasks;
  void *v16;
  int v17;
  NSMutableArray *v18;

  v4 = a3;
  if (self->_launchedInBackground)
  {
    v5 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(WeakRetained, "isNavigationTurnByTurnOrStepping") ^ 1;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = v7;
  if (!v5
    || (objc_msgSend(v7, "shouldLaunchSafe") & 1) != 0
    || objc_msgSend(v8, "launchedToTest"))
  {
    v9 = sub_100431A4C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = CFSTR("NO");
      if (v5)
        v11 = CFSTR("YES");
      v12 = v11;
      v17 = 138412290;
      v18 = (NSMutableArray *)v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[EP] _addRestoreTaskForSession should restore %@", (uint8_t *)&v17, 0xCu);

    }
  }
  else
  {
    if (self->_restoreTaskAdded)
    {
      v13 = sub_100431A4C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        tasks = self->_tasks;
        v17 = 138412290;
        v18 = tasks;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[EP] we are trying to add another restoration task in %@", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      v14 = objc_claimAutoreleasedReturnValue(+[SceneSessionRestorationArbiter activityForSceneSession:](SceneSessionRestorationArbiter, "activityForSceneSession:", v4));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UserActivityHandlingTask taskForUserActivity:atColdLaunch:](UserActivityHandlingTask, "taskForUserActivity:atColdLaunch:", v14, self->_coldLaunch));
      if (v16)
      {
        self->_restoreTaskAdded = 1;
        -[EntryPointsCoordinator _insertTaskAtFirstIndex:](self, "_insertTaskAtFirstIndex:", v16);
      }

    }
  }

}

- (BOOL)_isBackgroundNavigationLaunch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("x-maps-reopen"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "query"));
      if (objc_msgSend(v7, "length"))
        LOBYTE(v6) = objc_msgSend(v7, "hasPrefix:", CFSTR("backgroundnavigation"));
      else
        LOBYTE(v6) = 0;

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)openURL:(id)a3 session:(id)a4 sceneOptions:(id)a5 mkOptions:(id)a6 windowSize:(CGSize)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  CGFloat v28;
  CGFloat v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;

  height = a7.height;
  width = a7.width;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = sub_100431A4C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    v31 = v13;
    v32 = 2112;
    v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[EP] openURL: %{private}@ sceneOptions: %@", buf, 0x16u);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1007C6B5C;
  v23[3] = &unk_1011C7340;
  v23[4] = self;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v28 = width;
  v29 = height;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  +[UIApplication _mapsCarPlay_connectApplicationSceneIfNeededForSession:completion:](UIApplication, "_mapsCarPlay_connectApplicationSceneIfNeededForSession:completion:", v21, v23);

}

- (void)_openURL:(id)a3 referringURL:(id)a4 sourceApplication:(id)a5 session:(id)a6 sceneOptions:(id)a7 mkOptions:(id)a8 windowSize:(CGSize)a9
{
  double height;
  double width;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;

  height = a9.height;
  width = a9.width;
  v16 = a3;
  v17 = a7;
  v18 = a8;
  v19 = a5;
  v20 = a4;
  v21 = sub_100431A4C();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v24 = 138478083;
    v25 = v16;
    v26 = 2112;
    v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[EP] _openURL: %{private}@ sceneOptions: %@", (uint8_t *)&v24, 0x16u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[URLHandlingTask taskForURL:referringURL:sourceApplication:sceneOptions:mkOptions:windowSize:](URLHandlingTask, "taskForURL:referringURL:sourceApplication:sceneOptions:mkOptions:windowSize:", v16, v20, v19, v17, v18, width, height));
  if (v23)
    -[EntryPointsCoordinator _addTask:](self, "_addTask:", v23);

}

- (void)willContinueUserActivityWithType:(id)a3
{
  id v4;
  void *v5;
  LoadingToken *v6;
  LoadingToken *continuityLoadingToken;
  id v8;
  NSObject *v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LoadingIndicatorController sharedController](LoadingIndicatorController, "sharedController"));
  v6 = (LoadingToken *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "beginShowingLoadingIndicator"));
  continuityLoadingToken = self->_continuityLoadingToken;
  self->_continuityLoadingToken = v6;

  v8 = sub_100431A4C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[EP] willContinueUserActivityWithType %@", (uint8_t *)&v10, 0xCu);
  }

}

- (void)didFailToContinueUserActivityWithType:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  LoadingToken *continuityLoadingToken;
  id v9;
  NSObject *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  ErrorActionOption *v19;
  void *v20;
  void *v21;
  ErrorActionOption *v22;
  void *v23;
  ErrorAction *v24;
  id WeakRetained;
  ErrorActionOption *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;

  v6 = a3;
  v7 = a4;
  continuityLoadingToken = self->_continuityLoadingToken;
  self->_continuityLoadingToken = 0;

  v9 = sub_100431A4C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v6;
    v29 = 2112;
    v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[EP] didFailToContinueUserActivityWithType %@ %@", buf, 0x16u);
  }

  self->_launchedWithExternalInput = 0;
  v11 = objc_msgSend(v6, "isEqual:", CSSearchableItemActionType);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = v12;
  if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Failed to continue activity [Spotlight opening error alert]"), CFSTR("localized string not found"), 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = v15;
    v17 = CFSTR("The Spotlight selection could not be opened. [Spotlight opening error alert]");
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Failed to continue activity [Continuation error alert]"), CFSTR("localized string not found"), 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = v15;
    v17 = CFSTR("The connection to your other device may have been interrupted. Please try again. [Continuation error alert]");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", v17, CFSTR("localized string not found"), 0));

  v19 = [ErrorActionOption alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("OK [Continuation error alert]"), CFSTR("localized string not found"), 0));
  v22 = -[ErrorActionOption initWithTitle:cancels:handler:](v19, "initWithTitle:cancels:handler:", v21, 1, 0);
  v26 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));

  v24 = -[ErrorAction initWithTitle:message:options:]([ErrorAction alloc], "initWithTitle:message:options:", v14, v18, v23);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "entryPointsCoordinator:performErrorAction:", self, v24);

}

- (void)continueUserActivity:(id)a3 session:(id)a4 windowSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  LoadingToken *continuityLoadingToken;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  CGFloat v19;
  CGFloat v20;
  uint8_t buf[4];
  id v22;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  continuityLoadingToken = self->_continuityLoadingToken;
  self->_continuityLoadingToken = 0;

  v12 = sub_100431A4C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[EP] continueUserActivity %@", buf, 0xCu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1007C71AC;
  v16[3] = &unk_1011C7368;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = width;
  v20 = height;
  v14 = v10;
  v15 = v9;
  +[UIApplication _mapsCarPlay_connectApplicationSceneIfNeededForSession:completion:](UIApplication, "_mapsCarPlay_connectApplicationSceneIfNeededForSession:completion:", v14, v16);

}

- (void)_continueUserActivity:(id)a3 session:(id)a4 windowSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  v11 = sub_100431A4C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[EP] _continueUserActivity %@", buf, 0xCu);
  }

  if (-[EntryPointsCoordinator shouldHandleUniversalLinkWithUserActivity:](self, "shouldHandleUniversalLinkWithUserActivity:", v9))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "webpageURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "referrerURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_sourceApplication"));
    -[EntryPointsCoordinator _openURL:referringURL:sourceApplication:session:sceneOptions:mkOptions:windowSize:](self, "_openURL:referringURL:sourceApplication:session:sceneOptions:mkOptions:windowSize:", v13, v14, v15, v10, 0, 0, width, height);
    goto LABEL_9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activityType"));
  if (!objc_msgSend(v14, "isEqual:", CFSTR("com.apple.Maps")))
  {
LABEL_8:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UserActivityHandlingTask taskForUserActivity:atColdLaunch:](UserActivityHandlingTask, "taskForUserActivity:atColdLaunch:", v9, self->_coldLaunch));
    -[EntryPointsCoordinator _addTask:](self, "_addTask:", v15);
    goto LABEL_9;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("bs")));
  if (v16)
  {

    goto LABEL_8;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MapsActionKey")));

  if (!v17)
    goto LABEL_8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MapsActionLaunchURLKey")));
  v18 = sub_100431A4C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    *(_DWORD *)buf = 138412546;
    v28 = v20;
    v29 = 2112;
    v30 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[EP] LAUNCHING Siri Action '%@' from URL %@", buf, 0x16u);

  }
  v25 = _UISceneConnectionOptionsSourceApplicationKey;
  v26 = CFSTR("SiriActions");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UISceneOpenURLOptions _optionsFromDictionary:](UISceneOpenURLOptions, "_optionsFromDictionary:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_sourceApplication"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[URLHandlingTask taskForURL:referringURL:sourceApplication:sceneOptions:mkOptions:windowSize:](URLHandlingTask, "taskForURL:referringURL:sourceApplication:sceneOptions:mkOptions:windowSize:", v15, 0, v23, v22, 0, width, height));

  if (v24)
    -[EntryPointsCoordinator _addTask:](self, "_addTask:", v24);

LABEL_9:
}

- (BOOL)shouldHandleUniversalLinkWithUserActivity:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));
  v5 = objc_msgSend(v4, "isEqual:", NSUserActivityTypeBrowsingWeb);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "webpageURL"));
    if (v6)
      LOBYTE(v5) = +[_MKURLParser isValidMapURL:](_MKURLParser, "isValidMapURL:", v6);
    else
      LOBYTE(v5) = 0;

  }
  return v5;
}

- (void)openShortcutItem:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[EP] openShortcutItem %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutHandlingTask taskForShortcutItem:](ShortcutHandlingTask, "taskForShortcutItem:", v4));
  -[EntryPointsCoordinator _addTask:](self, "_addTask:", v7);

}

- (void)openNotificationData:(id)a3 forType:(id)a4 recordIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = sub_100431A4C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[EP] openNotificationData %@", (uint8_t *)&v14, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NotificationHandlingTask taskForData:type:recordIdentifier:](NotificationHandlingTask, "taskForData:type:recordIdentifier:", v10, v8, v9));
  -[EntryPointsCoordinator _addTask:](self, "_addTask:", v13);

}

- (void)receivedDidPresentContaineeNotification:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("ContainerDidPresentContaineeNotification"), 0);

  *(_WORD *)&self->_shouldWaitForFirstContainee = 0;
}

- (void)receivedFullyDrawnNotification:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, VKMapViewDidBecomeFullyDrawnNotification, 0);

  -[EntryPointsCoordinator _updateLocaleInformation](self, "_updateLocaleInformation");
}

- (EntryPointsCoordinatorDelegate)delegate
{
  return (EntryPointsCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)didLaunchWithExplicitIntent
{
  return self->_didLaunchWithExplicitIntent;
}

- (void)setLaunchAlertsManager:(id)a3
{
  objc_storeStrong((id *)&self->_launchAlertsManager, a3);
}

- (NSString)launchApplication
{
  return self->_launchApplication;
}

- (void)setLaunchApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchApplication, 0);
  objc_storeStrong((id *)&self->_launchAlertsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mergedRichMapsActivity, 0);
  objc_storeStrong((id *)&self->_continuityLoadingToken, 0);
  objc_storeStrong((id *)&self->_tasksToPerform, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_tasksGroup, 0);
  objc_storeStrong((id *)&self->_tasksQueue, 0);
}

@end
