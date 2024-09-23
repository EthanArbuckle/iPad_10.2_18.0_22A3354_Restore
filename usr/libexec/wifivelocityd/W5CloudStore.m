@implementation W5CloudStore

+ (id)sharedStore
{
  if (qword_1000FB748 != -1)
    dispatch_once(&qword_1000FB748, &stru_1000D70F8);
  return (id)qword_1000FB740;
}

- (W5CloudStore)init
{
  W5CloudStore *v2;
  NSUbiquitousKeyValueStore *v3;
  NSUbiquitousKeyValueStore *appStore;
  NSUbiquitousKeyValueStore *v5;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  objc_super v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  v10.receiver = self;
  v10.super_class = (Class)W5CloudStore;
  v2 = -[W5CloudStore init](&v10, "init");
  if (!v2)
  {
LABEL_8:

    return 0;
  }
  v3 = (NSUbiquitousKeyValueStore *)objc_msgSend(objc_alloc((Class)NSUbiquitousKeyValueStore), "initWithStoreIdentifier:type:", CFSTR("com.apple.wifi.app"), 0);
  appStore = v2->_appStore;
  v2->_appStore = v3;

  v5 = v2->_appStore;
  if (!v5)
  {
    v7 = sub_10008F56C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = "-[W5CloudStore init]";
      v13 = 2080;
      v14 = "W5CloudStore.m";
      v15 = 1024;
      v16 = 53;
      LODWORD(v9) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) failed to create app KVS store", (const char *)&v11, v9, LODWORD(v10.receiver));
    }

    goto LABEL_8;
  }
  -[NSUbiquitousKeyValueStore synchronize](v5, "synchronize");
  return v2;
}

- (id)_homeDiagnosticsDomain
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5CloudStore appStore](self, "appStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("home-diagnostics")));

  if (v3)
    v4 = v3;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  v5 = v4;

  return v5;
}

- (void)_setHomeDiagnosticsDomain:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5CloudStore appStore](self, "appStore"));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("home-diagnostics"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[W5CloudStore appStore](self, "appStore"));
  objc_msgSend(v6, "synchronize");

}

- (BOOL)registerDiagnosticModePeer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  BOOL v29;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;
  int v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  id v50;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5CloudStore _homeDiagnosticsDomain](self, "_homeDiagnosticsDomain"));
  v11 = objc_msgSend(v10, "mutableCopy");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("registered-app-peers")));
  if (!v12)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  v38 = objc_msgSend(v12, "mutableCopy");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peerID"));

  v39 = v9;
  if (!v14)
  {
    v31 = sub_10008F56C();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v43 = 136315906;
      v44 = "-[W5CloudStore registerDiagnosticModePeer:configuration:error:]";
      v45 = 2080;
      v46 = "W5CloudStore.m";
      v47 = 1024;
      v48 = 96;
      v49 = 2114;
      v50 = v8;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v32, 0, "[wifivelocity] %s (%s:%u) nil peer ID for peer='%{public}@'", &v43, 38);
    }

    if (!a5)
      goto LABEL_27;
    goto LABEL_26;
  }
  v40 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v40));
  v16 = v40;
  if (!v15)
  {
    v33 = sub_10008F56C();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v43 = 136315906;
      v44 = "-[W5CloudStore registerDiagnosticModePeer:configuration:error:]";
      v45 = 2080;
      v46 = "W5CloudStore.m";
      v47 = 1024;
      v48 = 101;
      v49 = 2114;
      v50 = v8;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v34, 0, "[wifivelocity] %s (%s:%u) failed to encode peer='%{public}@'", &v43, 38);
    }

    if (!a5)
    {
      v29 = 0;
      goto LABEL_16;
    }
    if (v16)
    {
      v16 = objc_retainAutorelease(v16);
      v29 = 0;
      *a5 = v16;
      goto LABEL_16;
    }
LABEL_26:
    v41 = NSLocalizedFailureReasonErrorKey;
    v42 = CFSTR("W5ParamErr");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v35)));
    *a5 = v36;

LABEL_27:
    v29 = 0;
    v16 = 0;
    goto LABEL_16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("timestamp"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peer"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peer"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("name"));

  }
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("peer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", CFSTR("MinStartNotificationInterval")));
  if (v23)
    objc_msgSend(v17, "setObject:forKey:", v23, CFSTR("min-start-notification-interval"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", CFSTR("MinStopNotificationInterval")));

  if (v24)
    objc_msgSend(v17, "setObject:forKey:", v24, CFSTR("min-stop-notification-interval"));
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v17, v14);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v38, CFSTR("registered-app-peers"));
  -[W5CloudStore _setHomeDiagnosticsDomain:](self, "_setHomeDiagnosticsDomain:", v11);
  v25 = sub_10008F56C();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v43 = 136315906;
    v44 = "-[W5CloudStore registerDiagnosticModePeer:configuration:error:]";
    v45 = 2080;
    v46 = "W5CloudStore.m";
    v47 = 1024;
    v48 = 131;
    v49 = 2114;
    v50 = v8;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v26, 0, "[wifivelocity] %s (%s:%u) registered peer='%{public}@", &v43, 38);
  }

  v27 = sub_10008F56C();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v43 = 136315906;
    v44 = "-[W5CloudStore registerDiagnosticModePeer:configuration:error:]";
    v45 = 2080;
    v46 = "W5CloudStore.m";
    v47 = 1024;
    v48 = 132;
    v49 = 2112;
    v50 = v11;
    LODWORD(v37) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 0, "[wifivelocity] %s (%s:%u) W5CloudStore: %@", &v43, v37);
  }

  v29 = 1;
LABEL_16:

  return v29;
}

- (BOOL)unregisterDiagnosticModePeer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  BOOL v16;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5CloudStore _homeDiagnosticsDomain](self, "_homeDiagnosticsDomain"));
  v8 = objc_msgSend(v7, "mutableCopy");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("registered-app-peers")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peerID"));

  if (!v11)
  {
    v18 = sub_10008F56C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315906;
      v25 = "-[W5CloudStore unregisterDiagnosticModePeer:error:]";
      v26 = 2080;
      v27 = "W5CloudStore.m";
      v28 = 1024;
      v29 = 152;
      v30 = 2114;
      v31 = v6;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) nil peer ID for peer='%{public}@'", &v24, 38);
    }
    goto LABEL_13;
  }
  if (!v9)
  {
    v20 = sub_10008F56C();
    v19 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315650;
      v25 = "-[W5CloudStore unregisterDiagnosticModePeer:error:]";
      v26 = 2080;
      v27 = "W5CloudStore.m";
      v28 = 1024;
      v29 = 153;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) peers is empty", &v24, 28);
    }
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  v12 = objc_msgSend(v9, "mutableCopy");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));

  if (v13)
  {
    objc_msgSend(v12, "removeObjectForKey:", v11);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("registered-app-peers"));
    -[W5CloudStore _setHomeDiagnosticsDomain:](self, "_setHomeDiagnosticsDomain:", v8);
    v14 = sub_10008F56C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315906;
      v25 = "-[W5CloudStore unregisterDiagnosticModePeer:error:]";
      v26 = 2080;
      v27 = "W5CloudStore.m";
      v28 = 1024;
      v29 = 166;
      v30 = 2114;
      v31 = v6;
      v16 = 1;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) unregistered peer='%{public}@", &v24, 38);
    }
    else
    {
      v16 = 1;
    }
    goto LABEL_7;
  }
  v21 = sub_10008F56C();
  v19 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136315906;
    v25 = "-[W5CloudStore unregisterDiagnosticModePeer:error:]";
    v26 = 2080;
    v27 = "W5CloudStore.m";
    v28 = 1024;
    v29 = 156;
    v30 = 2114;
    v31 = v11;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) peer is not registered with ID='%{public}@'", &v24, 38);
  }
LABEL_14:

  if (!a4)
  {
    v16 = 0;
    goto LABEL_8;
  }
  v22 = NSLocalizedFailureReasonErrorKey;
  v23 = CFSTR("W5ParamErr");
  v15 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v15));
LABEL_7:

LABEL_8:
  return v16;
}

- (id)registeredPeers
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSSet *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5CloudStore _homeDiagnosticsDomain](self, "_homeDiagnosticsDomain"));
  v3 = objc_msgSend(v2, "mutableCopy");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("registered-app-peers")));
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v4)
  {
    v21 = v4;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5DiagnosticsModePeer, v7), 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("peer")));
          v23 = 0;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v13, v14, &v23));
          v16 = v23;

          if (v15)
          {
            objc_msgSend(v22, "addObject:", v15);
          }
          else
          {
            v17 = sub_10008F56C();
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v28 = 136315906;
              v29 = "-[W5CloudStore registeredPeers]";
              v30 = 2080;
              v31 = "W5CloudStore.m";
              v32 = 1024;
              v33 = 191;
              v34 = 2114;
              v35 = v16;
              LODWORD(v20) = 38;
              _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) failed to decode peer error='%{public}@'", &v28, v20);
            }

          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v8);
    }

    v4 = v21;
  }

  return v22;
}

- (id)getMinNotificationInterval:(id)a3 notificationType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5CloudStore _homeDiagnosticsDomain](self, "_homeDiagnosticsDomain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("registered-app-peers")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

  if (v9)
  {
    if (a4 == 2)
    {
      v10 = CFSTR("min-start-notification-interval");
      goto LABEL_7;
    }
    if (a4 == 3)
    {
      v10 = CFSTR("min-stop-notification-interval");
LABEL_7:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));
      goto LABEL_8;
    }
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (NSUbiquitousKeyValueStore)appStore
{
  return self->_appStore;
}

- (void)setAppStore:(id)a3
{
  objc_storeStrong((id *)&self->_appStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStore, 0);
}

@end
