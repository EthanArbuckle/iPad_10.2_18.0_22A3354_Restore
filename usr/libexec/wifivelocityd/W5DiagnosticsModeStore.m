@implementation W5DiagnosticsModeStore

- (W5DiagnosticsModeStore)init
{
  W5DiagnosticsModeStore *v2;
  void *v3;
  void *v4;
  NSMutableSet *v5;
  NSMutableSet *diagnostics;
  OS_os_transaction *activeTransaction;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)W5DiagnosticsModeStore;
  v2 = -[W5DiagnosticsModeStore init](&v9, "init");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore _getCachedDiagnosticsMode:](v2, "_getCachedDiagnosticsMode:", 0));
  v4 = v3;
  if (v3)
    v5 = (NSMutableSet *)objc_msgSend(v3, "mutableCopy");
  else
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  diagnostics = v2->_diagnostics;
  v2->_diagnostics = v5;

  activeTransaction = v2->_activeTransaction;
  v2->_activeTransaction = 0;

  return v2;
}

- (id)diagnosticsModeMatchingPeerID:(id)a3 state:(int64_t)a4 role:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  int64_t v14;
  int64_t v15;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000E240;
  v12[3] = &unk_1000D52E0;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v8 = v13;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v12));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore _diagnosticsModeFilteredWithPredicate:](self, "_diagnosticsModeFilteredWithPredicate:", v9));

  return v10;
}

- (id)diagnosticsModeMatchingPeerID:(id)a3 state:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void **v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  int64_t v15;

  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10000E478;
  v13 = &unk_1000D5308;
  v14 = a3;
  v15 = a4;
  v6 = v14;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &v10));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore _diagnosticsModeFilteredWithPredicate:](self, "_diagnosticsModeFilteredWithPredicate:", v7, v10, v11, v12, v13));

  return v8;
}

- (id)diagnosticsModeWithState:(int64_t)a3
{
  return -[W5DiagnosticsModeStore diagnosticsModeMatchingPeerID:state:](self, "diagnosticsModeMatchingPeerID:state:", 0, a3);
}

- (id)diagnosticsModeMatchingUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000E6B8;
  v9[3] = &unk_1000D5330;
  v10 = a3;
  v4 = v10;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v9));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore _diagnosticsModeFilteredWithPredicate:](self, "_diagnosticsModeFilteredWithPredicate:", v5));

  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  else
    v7 = 0;

  return v7;
}

- (id)_diagnosticsModeFilteredWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore diagnostics](self, "diagnostics"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore diagnostics](self, "diagnostics"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v4));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateStoreWithDiagnosticsMode:(id)a3
{
  char *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  _BOOL8 v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  OS_os_transaction *v27;
  uint64_t v28;
  NSObject *activeTransaction;
  const char *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  _QWORD v36[5];
  int v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  uint64_t v46;

  v4 = (char *)a3;
  if (!v4)
  {
    v28 = sub_10008F56C();
    activeTransaction = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(activeTransaction, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 136315906;
      v38 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
      v39 = 2080;
      v40 = "W5DiagnosticsModeManager.m";
      v41 = 1024;
      v42 = 1526;
      v43 = 2080;
      v44 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
      LODWORD(v30) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, activeTransaction, 0, "[wifivelocity] %s (%s:%u) %s: nil mode provided", (const char *)&v37, v30, (_DWORD)v31, (const char *)v32);
    }
    goto LABEL_26;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore diagnostics](self, "diagnostics"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore diagnostics](self, "diagnostics"));
    objc_msgSend(v7, "removeObject:", v4);

  }
  v8 = sub_10008F56C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v37 = 136315906;
    v38 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
    v39 = 2080;
    v40 = "W5DiagnosticsModeManager.m";
    v41 = 1024;
    v42 = 1534;
    v43 = 2112;
    v44 = v4;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) [DM] updating store with DM: %@", &v37, 38);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore diagnostics](self, "diagnostics"));
  objc_msgSend(v10, "addObject:", v4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore diagnostics](self, "diagnostics"));
  v12 = -[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:](self, "_updateCachedDiagnosticsMode:error:", v11, 0);

  if ((v12 & 1) == 0)
  {
    v13 = sub_10008F56C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 136316162;
      v38 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
      v39 = 2080;
      v40 = "W5DiagnosticsModeManager.m";
      v41 = 1024;
      v42 = 1539;
      v43 = 2080;
      v44 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
      v45 = 2114;
      v46 = 0;
      LODWORD(v30) = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) %s: [DM] failed to update cache with error='%{public}@'", &v37, v30);
    }

  }
  if (sub_10000ECC8())
  {
    v15 = objc_msgSend(sub_10000ECC8(), "sharedAnalyticsProcessor");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (v16)
    {
      v17 = objc_msgSend(v4, "state") == (id)3;
      v18 = objc_alloc_init((Class)NSMutableDictionary);
      v31 = CFSTR("date");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v36[0] = v19;
      v32 = CFSTR("desc");
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
      v36[1] = v20;
      v33 = CFSTR("enabled");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17));
      v36[2] = v21;
      v34 = CFSTR("uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
      v35 = CFSTR("name");
      v36[3] = v22;
      v36[4] = CFSTR("W5DiagnosticsMode");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, &v31, 5));
      objc_msgSend(v18, "addEntriesFromDictionary:", v23);

      v24 = objc_msgSend(sub_10000ECC8(), "sharedAnalyticsProcessor");
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      objc_msgSend(v25, "processWAMessageMetric:data:", CFSTR("com.apple.wifi.DiagnosticState"), v18);

    }
  }
  if (!self->_activeTransaction)
  {
    if (objc_msgSend(v4, "state") == (id)2
      || objc_msgSend(v4, "state") == (id)3
      || objc_msgSend(v4, "state") == (id)4
      || objc_msgSend(v4, "state") == (id)5
      || objc_msgSend(v4, "state") == (id)10)
    {
      v27 = (OS_os_transaction *)os_transaction_create("diagnosticsModeStateActive");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"));
      objc_msgSend(v26, "osTransactionCreate:transaction:", "diagnosticsModeStateActive", v27);
      goto LABEL_25;
    }
    if (!self->_activeTransaction)
      goto LABEL_27;
  }
  if (objc_msgSend(v4, "state") == (id)1 || objc_msgSend(v4, "state") == (id)11)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"));
    objc_msgSend(v26, "osTransactionComplete:", self->_activeTransaction);
    v27 = 0;
LABEL_25:

    activeTransaction = self->_activeTransaction;
    self->_activeTransaction = v27;
LABEL_26:

  }
LABEL_27:

}

- (id)_getCachedDiagnosticsMode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSSet *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  id v29;
  int v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;

  v28 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentDomainForName:", CFSTR("com.apple.wifi.diagnosticsMode")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CachedDiagnosticsMode")));
  v7 = objc_opt_class(NSSet, v6);
  v9 = objc_opt_class(NSString, v8);
  v11 = objc_opt_class(W5DiagnosticsMode, v10);
  v13 = objc_opt_class(NSDictionary, v12);
  v15 = objc_opt_class(NSArray, v14);
  v17 = objc_opt_class(W5DiagnosticsModePeer, v16);
  v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v9, v11, v13, v15, v17, objc_opt_class(NSNumber, v18), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v29 = v28;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v20, v5, &v29));
  v22 = v29;

  if (!v21)
  {
    v24 = v4;
    v25 = sub_10008F56C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136316418;
      v31 = "-[W5DiagnosticsModeStore _getCachedDiagnosticsMode:]";
      v32 = 2080;
      v33 = "W5DiagnosticsModeManager.m";
      v34 = 1024;
      v35 = 1578;
      v36 = 2114;
      v37 = 0;
      v38 = 2114;
      v39 = v5;
      v40 = 2114;
      v41 = v22;
      LODWORD(v27) = 58;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v26, 0, "[wifivelocity] %s (%s:%u) failed to decode configuration data='%{public}@' from dictionary='%{public}@' with error='%{public}@'", &v30, v27);
    }

    v4 = v24;
  }

  return v21;
}

- (BOOL)_updateCachedDiagnosticsMode:(id)a3 error:(id)a4
{
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  char *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  char *v28;

  v4 = (char *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentDomainForName:", CFSTR("com.apple.wifi.diagnosticsMode")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));

  v8 = sub_10008F56C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136316162;
    v20 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
    v21 = 2080;
    v22 = "W5DiagnosticsModeManager.m";
    v23 = 1024;
    v24 = 1586;
    v25 = 2080;
    v26 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
    v27 = 2114;
    v28 = v4;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) %s: [DM] updating cached diagnostics mode with '%{public}@'", &v19, 48);
  }

  if (!v4)
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_7;
  }
  v18 = 0;
  v10 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v18));
  v11 = (char *)v18;
  if (v10)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("CachedDiagnosticsMode"));
LABEL_7:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v12, "setPersistentDomain:forName:", v7, CFSTR("com.apple.wifi.diagnosticsMode"));

    v13 = sub_10008F56C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136316162;
      v20 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
      v21 = 2080;
      v22 = "W5DiagnosticsModeManager.m";
      v23 = 1024;
      v24 = 1601;
      v25 = 2080;
      v26 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
      v27 = 2114;
      v28 = v11;
      LODWORD(v17) = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) %s: [DM] successfully encoded error='%{public}@'", &v19, v17);
    }

    goto LABEL_10;
  }
  v16 = sub_10008F56C();
  v10 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315906;
    v20 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
    v21 = 2080;
    v22 = "W5DiagnosticsModeManager.m";
    v23 = 1024;
    v24 = 1595;
    v25 = 2114;
    v26 = v11;
    LODWORD(v17) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) failed to encode configuration with error='%{public}@'", &v19, v17);
  }
LABEL_10:

  return v11 == 0;
}

- (NSMutableSet)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_diagnostics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
}

@end
