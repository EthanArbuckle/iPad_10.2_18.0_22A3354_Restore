@implementation FRApplicationUpdateNotifier

- (void)restoreStates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryForKey:", CFSTR("FRAUNPersistedState")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRApplicationUpdateNotifier persistableProperties](self, "persistableProperties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryWithValuesForKeys:", v4));

  if (objc_msgSend(v5, "count"))
    -[FRApplicationUpdateNotifier setValuesForKeysWithDictionary:](self, "setValuesForKeysWithDictionary:", v5);

}

- (FRApplicationUpdateNotifier)initWithVersionHelpers:(id)a3 appActivityMonitor:(id)a4
{
  id v7;
  id v8;
  FRApplicationUpdateNotifier *v9;
  FRApplicationUpdateNotifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007BDD4();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007BD08();
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)FRApplicationUpdateNotifier;
  v9 = -[FRApplicationUpdateNotifier init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_versionHelpers, a3);
    objc_msgSend(v8, "addObserver:", v10);
  }

  return v10;
}

- (void)activityObservingApplicationWindowDidBecomeForeground
{
  id v3;

  if (-[FRApplicationUpdateNotifier shouldShowUpdateAlert](self, "shouldShowUpdateAlert"))
    -[FRApplicationUpdateNotifier showAppUpdateAlert](self, "showAppUpdateAlert");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[FRApplicationUpdateNotifier versionHelpers](self, "versionHelpers"));
  objc_msgSend(v3, "updateAppObsolescenceState");

}

- (BOOL)shouldShowUpdateAlert
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRApplicationUpdateNotifier versionHelpers](self, "versionHelpers"));
  v4 = objc_msgSend(v3, "isUpdateRequired")
    && !-[FRApplicationUpdateNotifier isPresentingAlert](self, "isPresentingAlert")
    && -[FRApplicationUpdateNotifier isAlertPresentationIntervalPassed](self, "isAlertPresentationIntervalPassed")
    && -[FRApplicationUpdateNotifier alertPresentationCount](self, "alertPresentationCount") < 3;

  return v4;
}

- (FRVersionHelpers)versionHelpers
{
  return self->_versionHelpers;
}

- (void)setup
{
  -[FRApplicationUpdateNotifier restoreStates](self, "restoreStates");
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (id)persistableProperties
{
  return &off_1000E4988;
}

- (FRApplicationUpdateNotifier)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRApplicationUpdateNotifier init]";
    v7 = 2080;
    v8 = "FRApplicationUpdateNotifier.m";
    v9 = 1024;
    v10 = 41;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRApplicationUpdateNotifier init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)persistStates
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRApplicationUpdateNotifier persistableProperties](self, "persistableProperties", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRApplicationUpdateNotifier valueForKey:](self, "valueForKey:", v9));
        if (v10)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v11, "setObject:forKey:", v3, CFSTR("FRAUNPersistedState"));

}

- (void)showAppUpdateAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRApplicationUpdateNotifier viewController](self, "viewController"));

  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007BEA0();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRApplicationUpdateNotifier viewController](self, "viewController"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FRTimeToUpdateAlertTitle"), &stru_1000DF290, 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FRInstallLatestVersionOS"), &stru_1000DF290, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FRGoToSettings"), &stru_1000DF290, 0));

    LODWORD(v9) = -[FRApplicationUpdateNotifier shouldPresentLastAlertForCurrentUpdate](self, "shouldPresentLastAlertForCurrentUpdate");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    if ((_DWORD)v9)
      v13 = CFSTR("No Thanks");
    else
      v13 = CFSTR("Not Now");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1000DF290, 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1));
    objc_initWeak(location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100035378;
    v25[3] = &unk_1000DB670;
    objc_copyWeak(&v26, location);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000353C0;
    v23[3] = &unk_1000D9970;
    v16 = objc_retainBlock(v25);
    v24 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v23));
    objc_msgSend(v15, "addAction:", v17);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000353D0;
    v21[3] = &unk_1000D9970;
    v18 = v16;
    v22 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v21));
    objc_msgSend(v15, "addAction:", v19);
    self->_isPresentingAlert = 1;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FRApplicationUpdateNotifier viewController](self, "viewController"));
    objc_msgSend(v20, "presentViewController:animated:completion:", v15, 1, 0);

    objc_destroyWeak(&v26);
    objc_destroyWeak(location);

  }
}

- (void)updateAlertDidDismiss:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));
  -[FRApplicationUpdateNotifier setNextAlertPresentationDate:](self, "setNextAlertPresentationDate:", v5);

  ++self->_alertPresentationCount;
  -[FRApplicationUpdateNotifier persistStates](self, "persistStates");
  if (v3)
    -[FRApplicationUpdateNotifier launchSettings](self, "launchSettings");
}

- (void)launchSettings
{
  id v2;

  v2 = (id)objc_opt_new(BKSSystemService);
  objc_msgSend(v2, "openApplication:options:withResult:", CFSTR("com.apple.Preferences"), 0, 0);

}

- (BOOL)isAlertPresentationIntervalPassed
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  NSDate *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  NSDate *nextAlertPresentationDate;

  v3 = NewsCoreUserDefaults(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "BOOLForKey:", FCSimulateAppObsolescenceSharedPreferenceKey);
  if ((v5 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = NewsCoreUserDefaults(v5, v6);
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue(v8);
    v10 = -[NSDate BOOLForKey:](v9, "BOOLForKey:", FCSimulateOSObsolescenceSharedPreferenceKey);
    if ((v10 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v12 = NewsCoreUserDefaults(v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = objc_msgSend(v13, "BOOLForKey:", FCSimulateHardwareObsolescenceSharedPreferenceKey);

      if ((v14 & 1) != 0)
        return 1;
      nextAlertPresentationDate = self->_nextAlertPresentationDate;
      if (!nextAlertPresentationDate)
        return 1;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate earlierDate:](nextAlertPresentationDate, "earlierDate:", v4));
      v7 = v9 == self->_nextAlertPresentationDate;
    }

  }
  return v7;
}

- (BOOL)shouldPresentLastAlertForCurrentUpdate
{
  return self->_alertPresentationCount > 1;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (NSDate)nextAlertPresentationDate
{
  return self->_nextAlertPresentationDate;
}

- (void)setNextAlertPresentationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)alertPresentationCount
{
  return self->_alertPresentationCount;
}

- (void)setAlertPresentationCount:(int64_t)a3
{
  self->_alertPresentationCount = a3;
}

- (BOOL)isPresentingAlert
{
  return self->_isPresentingAlert;
}

- (void)setIsPresentingAlert:(BOOL)a3
{
  self->_isPresentingAlert = a3;
}

- (void)setVersionHelpers:(id)a3
{
  objc_storeStrong((id *)&self->_versionHelpers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionHelpers, 0);
  objc_storeStrong((id *)&self->_nextAlertPresentationDate, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
