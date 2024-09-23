@implementation LaunchAlertsManager

- (LaunchAlertsManager)init
{
  LaunchAlertsManager *v2;
  uint64_t v3;
  NSMutableOrderedSet *alerts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LaunchAlertsManager;
  v2 = -[LaunchAlertsManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
    alerts = v2->_alerts;
    v2->_alerts = (NSMutableOrderedSet *)v3;

  }
  return v2;
}

- (void)enqueueAlert:(int64_t)a3
{
  NSMutableOrderedSet *alerts;
  void *v6;
  NSMutableOrderedSet *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;

  if ((objc_msgSend(UIApp, "launchedToTest") & 1) == 0
    && (GEOConfigGetBOOL(MapsConfig_PreventAllLaunchAlerts, off_1014B48C8) & 1) == 0)
  {
    alerts = self->_alerts;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    LOBYTE(alerts) = -[NSMutableOrderedSet containsObject:](alerts, "containsObject:", v6);

    if ((alerts & 1) == 0)
    {
      v7 = self->_alerts;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      -[NSMutableOrderedSet addObject:](v7, "addObject:", v8);

      v9 = sub_100431A4C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
        v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "LaunchAlertsManager: enqueueAlert %@", (uint8_t *)&v12, 0xCu);

      }
    }
    -[LaunchAlertsManager executeAlertsIfNecessary](self, "executeAlertsIfNecessary");
  }
}

- (void)executeAlertsIfNecessary
{
  id v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "LaunchAlertsManager: executeAlertsIfNecessary", buf, 2u);
  }

  if (!self->_processingAlert)
  {
    self->_processingAlert = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C31348;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)cancelVisibleAlertIfNecessary
{
  if ((objc_opt_respondsToSelector(self->_currentAlert, "cancelAlertIfNecessary") & 1) != 0)
    -[DisplayAlert cancelAlertIfNecessary](self->_currentAlert, "cancelAlertIfNecessary");
}

- (BOOL)currentlyShowingAlert
{
  return self->_processingAlert;
}

- (void)_executeNextAlert
{
  void *v3;
  id v4;
  DisplayAlert *v5;
  DisplayAlert *currentAlert;
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  DisplayAlert *v12;
  id v13;
  NSObject *v14;
  id WeakRetained;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;

  if (-[NSMutableOrderedSet count](self->_alerts, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet firstObject](self->_alerts, "firstObject"));
    v4 = objc_msgSend(v3, "integerValue");

    -[NSMutableOrderedSet removeObjectAtIndex:](self->_alerts, "removeObjectAtIndex:", 0);
    v5 = (DisplayAlert *)objc_claimAutoreleasedReturnValue(-[LaunchAlertsManager _getAlertObjectOfType:](self, "_getAlertObjectOfType:", v4));
    currentAlert = self->_currentAlert;
    self->_currentAlert = v5;

    v7 = sub_100431A4C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class(self->_currentAlert);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "LaunchAlertsManager: handling %@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    v12 = self->_currentAlert;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100C315A4;
    v16[3] = &unk_1011AD260;
    objc_copyWeak(&v17, (id *)buf);
    -[DisplayAlert displayAlertIfNecessaryWithCompletionHandler:](v12, "displayAlertIfNecessaryWithCompletionHandler:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v13 = sub_100431A4C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "LaunchAlertsManager: alerts processed", buf, 2u);
    }

    *(_WORD *)&self->_alertsProcessed = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "launchAlertsManagerDidFinishProcessingAlert:", self);

  }
}

- (void)_currentAlertDidFinish
{
  DisplayAlert *currentAlert;

  currentAlert = self->_currentAlert;
  self->_currentAlert = 0;

  -[LaunchAlertsManager _executeNextAlert](self, "_executeNextAlert");
}

- (id)_getAlertObjectOfType:(int64_t)a3
{
  __objc2_class *v3;
  uint64_t Log;
  NSObject *v5;
  id result;
  uint8_t v7[16];

  switch(a3)
  {
    case 0:
      v3 = AppLaunchLocationAlert;
      goto LABEL_12;
    case 1:
      v3 = AppLaunchPreciseLocationDisabledAlert;
      goto LABEL_12;
    case 2:
      v3 = AppLaunchAddressCorrectionAlert;
      goto LABEL_12;
    case 3:
      v3 = AppLaunchNavTraceAlert;
      goto LABEL_12;
    case 4:
      v3 = AppLaunchContactsAlert;
      goto LABEL_12;
    case 5:
      v3 = AppLaunchNotifcationPrewarmAlert;
      goto LABEL_12;
    case 6:
      v3 = AppLaunchHikingAlert;
LABEL_12:
      result = objc_alloc_init(v3);
      break;
    default:
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "LaunchAlerts");
      v5 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Unknown Launch Alert Type passed!", v7, 2u);
      }

      result = 0;
      break;
  }
  return result;
}

- (LaunchAlertsManagerDelegate)delegate
{
  return (LaunchAlertsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentAlert, 0);
  objc_storeStrong((id *)&self->_alerts, 0);
}

@end
