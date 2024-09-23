@implementation W5DiagnosticsModeLocalStore

- (W5DiagnosticsModeLocalStore)init
{
  W5DiagnosticsModeLocalStore *v2;
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *localDiagnosticsStore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)W5DiagnosticsModeLocalStore;
  v2 = -[W5DiagnosticsModeLocalStore init](&v8, "init");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore _getCachedLocalStore:](v2, "_getCachedLocalStore:", 0));
  v4 = v3;
  if (v3)
    v5 = (NSMutableDictionary *)objc_msgSend(v3, "mutableCopy");
  else
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  localDiagnosticsStore = v2->_localDiagnosticsStore;
  v2->_localDiagnosticsStore = v5;

  return v2;
}

- (id)_getCachedLocalStore:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  uint64_t v19;
  void *v20;
  NSSet *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  int v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;

  v31 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentDomainForName:", CFSTR("com.apple.wifi.diagnosticsMode")));

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CachedDiagnosticsModeLocalStore")));
  v7 = objc_opt_class(NSMutableDictionary, v6);
  v9 = objc_opt_class(NSURL, v8);
  v11 = objc_opt_class(NSString, v10);
  v13 = objc_opt_class(W5DiagnosticsMode, v12);
  v15 = objc_opt_class(NSDictionary, v14);
  v17 = objc_opt_class(NSArray, v16);
  v30 = objc_opt_class(W5DiagnosticsModePeer, v18);
  v20 = (void *)v5;
  v21 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v9, v11, v13, v15, v17, v30, objc_opt_class(NSNumber, v19), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v32 = v31;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v22, v5, &v32));
  v24 = v32;

  if (!v23)
  {
    v26 = v4;
    v27 = sub_10008F56C();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 136316418;
      v34 = "-[W5DiagnosticsModeLocalStore _getCachedLocalStore:]";
      v35 = 2080;
      v36 = "W5DiagnosticsModeManager.m";
      v37 = 1024;
      v38 = 1634;
      v39 = 2114;
      v40 = 0;
      v41 = 2114;
      v42 = v20;
      v43 = 2114;
      v44 = v24;
      LODWORD(v29) = 58;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 0, "[wifivelocity] %s (%s:%u) failed to decode configuration data='%{public}@' from dictionary='%{public}@' with error='%{public}@'", &v33, v29);
    }

    v4 = v26;
  }

  return v23;
}

- (id)infoMatchingDiagnosticMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore localDiagnosticsStore](self, "localDiagnosticsStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

  }
  else
  {
    v8 = sub_10008F56C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = "-[W5DiagnosticsModeLocalStore infoMatchingDiagnosticMode:]";
      v13 = 2080;
      v14 = "W5DiagnosticsModeManager.m";
      v15 = 1024;
      v16 = 1642;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) nil mode provided", (const char *)&v11, 28);
    }

    v7 = 0;
  }

  return v7;
}

- (void)updateStoreWithInfo:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[24];
  __int128 v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v23 = sub_10008F56C();
    v22 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136315906;
      *(_QWORD *)&v26[4] = "-[W5DiagnosticsModeLocalStore updateStoreWithInfo:info:]";
      *(_WORD *)&v26[12] = 2080;
      *(_QWORD *)&v26[14] = "W5DiagnosticsModeManager.m";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] %s (%s:%u) %s: nil mode provided", v26, 38, *(_OWORD *)v26);
    }
    goto LABEL_14;
  }
  if (!v7)
  {
    v24 = sub_10008F56C();
    v22 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136315906;
      *(_QWORD *)&v26[4] = "-[W5DiagnosticsModeLocalStore updateStoreWithInfo:info:]";
      *(_WORD *)&v26[12] = 2080;
      *(_QWORD *)&v26[14] = "W5DiagnosticsModeManager.m";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] %s (%s:%u) %s: nil info provided", v26, 38, *(_OWORD *)v26);
    }
    goto LABEL_14;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore localDiagnosticsStore](self, "localDiagnosticsStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore localDiagnosticsStore](self, "localDiagnosticsStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    objc_msgSend(v12, "removeObjectForKey:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore localDiagnosticsStore](self, "localDiagnosticsStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  objc_msgSend(v14, "setObject:forKey:", v8, v15);

  v16 = sub_10008F56C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    *(_DWORD *)v26 = 136316162;
    *(_QWORD *)&v26[4] = "-[W5DiagnosticsModeLocalStore updateStoreWithInfo:info:]";
    *(_WORD *)&v26[12] = 2080;
    *(_QWORD *)&v26[14] = "W5DiagnosticsModeManager.m";
    *(_WORD *)&v26[22] = 1024;
    LODWORD(v27) = 1668;
    WORD2(v27) = 2112;
    *(_QWORD *)((char *)&v27 + 6) = v18;
    HIWORD(v27) = 2112;
    v28 = v8;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s (%s:%u) [DM] updating local store for DM: %@ with info: %@", v26, 48);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore localDiagnosticsStore](self, "localDiagnosticsStore"));
  v20 = -[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:](self, "_updateCachedLocalStore:error:", v19, 0);

  if ((v20 & 1) == 0)
  {
    v21 = sub_10008F56C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136316162;
      *(_QWORD *)&v26[4] = "-[W5DiagnosticsModeLocalStore updateStoreWithInfo:info:]";
      *(_WORD *)&v26[12] = 2080;
      *(_QWORD *)&v26[14] = "W5DiagnosticsModeManager.m";
      *(_WORD *)&v26[22] = 1024;
      LODWORD(v27) = 1671;
      WORD2(v27) = 2080;
      *(_QWORD *)((char *)&v27 + 6) = "-[W5DiagnosticsModeLocalStore updateStoreWithInfo:info:]";
      HIWORD(v27) = 2114;
      LODWORD(v25) = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] %s (%s:%u) %s: [DM] failed to update local cache with error='%{public}@'", v26, v25, *(_OWORD *)v26, *(_QWORD *)&v26[16], v27, 0);
    }
LABEL_14:

  }
}

- (void)addToStore:(id)a3 newInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore localDiagnosticsStore](self, "localDiagnosticsStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v8));

  if (!v9)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000FC60;
  v12[3] = &unk_1000D5358;
  v13 = v9;
  v10 = v9;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
  -[W5DiagnosticsModeLocalStore updateStoreWithInfo:info:](self, "updateStoreWithInfo:info:", v11, v10);

}

- (BOOL)_updateCachedLocalStore:(id)a3 error:(id)a4
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
    v20 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
    v21 = 2080;
    v22 = "W5DiagnosticsModeManager.m";
    v23 = 1024;
    v24 = 1689;
    v25 = 2080;
    v26 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
    v27 = 2114;
    v28 = v4;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) %s: [DM] updating cached local store with '%{public}@'", &v19, 48);
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
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("CachedDiagnosticsModeLocalStore"));
LABEL_7:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v12, "setPersistentDomain:forName:", v7, CFSTR("com.apple.wifi.diagnosticsMode"));

    v13 = sub_10008F56C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136316162;
      v20 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
      v21 = 2080;
      v22 = "W5DiagnosticsModeManager.m";
      v23 = 1024;
      v24 = 1704;
      v25 = 2080;
      v26 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
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
    v20 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
    v21 = 2080;
    v22 = "W5DiagnosticsModeManager.m";
    v23 = 1024;
    v24 = 1698;
    v25 = 2114;
    v26 = v11;
    LODWORD(v17) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) failed to encode configuration with error='%{public}@'", &v19, v17);
  }
LABEL_10:

  return v11 == 0;
}

- (NSMutableDictionary)localDiagnosticsStore
{
  return self->_localDiagnosticsStore;
}

- (void)setLocalDiagnosticsStore:(id)a3
{
  objc_storeStrong((id *)&self->_localDiagnosticsStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDiagnosticsStore, 0);
}

@end
