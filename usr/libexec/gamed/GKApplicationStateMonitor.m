@implementation GKApplicationStateMonitor

- (BOOL)startObservingStateChangesForBundleID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor interestedBundleIDs](self, "interestedBundleIDs"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor interestedBundleIDs](self, "interestedBundleIDs"));
    objc_msgSend(v7, "addObject:", v4);

    -[GKApplicationStateMonitor updateStateObservation](self, "updateStateObservation");
  }

  return v6 ^ 1;
}

- (NSMutableSet)interestedBundleIDs
{
  return self->_interestedBundleIDs;
}

- (void)updateStateObservation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor processMonitor](self, "processMonitor"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007ED8;
  v4[3] = &unk_1002C3E60;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "updateConfiguration:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (GKApplicationStateMonitor)init
{
  GKApplicationStateMonitor *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKApplicationStateMonitor;
  v2 = -[GKApplicationStateMonitor init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitor](RBSProcessMonitor, "monitor"));
    -[GKApplicationStateMonitor setProcessMonitor:](v2, "setProcessMonitor:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[GKApplicationStateMonitor setInterestedBundleIDs:](v2, "setInterestedBundleIDs:", v4);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKApplicationStateMonitor;
  -[GKApplicationStateMonitor dealloc](&v4, "dealloc");
}

- (void)setHandler:(id)a3
{
  id v4;
  id v5;
  id handler;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  handler = self->_handler;
  self->_handler = v5;

  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor processMonitor](self, "processMonitor"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100119728;
  v8[3] = &unk_1002C3E60;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "updateConfiguration:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)stopObservingStateChangesForBundleID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor interestedBundleIDs](self, "interestedBundleIDs"));
  objc_msgSend(v5, "removeObject:", v4);

  -[GKApplicationStateMonitor updateStateObservation](self, "updateStateObservation");
}

- (void)startObservingApplicationWorkspaceChanges
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[GKApplicationStateMonitor startObservingApplicationWorkspaceChanges]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v5, "addObserver:", self);

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[GKApplicationStateMonitor applicationsDidUninstall:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v11, 0x16u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "applicationsDidUninstall:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor delegate](self, "delegate"));
    objc_msgSend(v10, "applicationsDidUninstall:", v5);

  }
}

- (void)applicationsWillUninstall:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[GKApplicationStateMonitor applicationsWillUninstall:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v11, 0x16u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "applicationsWillUninstall:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKApplicationStateMonitor delegate](self, "delegate"));
    objc_msgSend(v10, "applicationsWillUninstall:", v5);

  }
}

- (id)handler
{
  return self->_handler;
}

- (LSApplicationWorkspaceObserverProtocol)delegate
{
  return (LSApplicationWorkspaceObserverProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setProcessMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_processMonitor, a3);
}

- (void)setInterestedBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_interestedBundleIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestedBundleIDs, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_handler, 0);
}

@end
