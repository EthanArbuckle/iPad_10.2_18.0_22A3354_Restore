@implementation RPClientManager

+ (id)sharedInstance
{
  if (qword_100095BF8 != -1)
    dispatch_once(&qword_100095BF8, &stru_100081900);
  return (id)qword_100095BF0;
}

- (RPClientManager)init
{
  RPClientManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *bundleIDToClientDictionary;
  NSMutableDictionary *v5;
  NSMutableDictionary *mainBundleIDToBundleID;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  RPClientManager *v14;

  v8.receiver = self;
  v8.super_class = (Class)RPClientManager;
  v2 = -[RPClientManager init](&v8, "init");
  if (v2)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v10 = "-[RPClientManager init]";
      v11 = 1024;
      v12 = 34;
      v13 = 2048;
      v14 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bundleIDToClientDictionary = v2->_bundleIDToClientDictionary;
    v2->_bundleIDToClientDictionary = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mainBundleIDToBundleID = v2->_mainBundleIDToBundleID;
    v2->_mainBundleIDToBundleID = v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  RPClientManager *v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPClientManager dealloc]";
    v6 = 1024;
    v7 = 44;
    v8 = 2048;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPClientManager;
  -[RPClientManager dealloc](&v3, "dealloc");
}

- (void)addClient:(id)a3
{
  NSMutableDictionary *bundleIDToClientDictionary;
  id v5;
  void *v6;
  NSMutableDictionary *mainBundleIDToBundleID;
  void *v8;
  id v9;

  bundleIDToClientDictionary = self->_bundleIDToClientDictionary;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientBundleID"));
  -[NSMutableDictionary setObject:forKey:](bundleIDToClientDictionary, "setObject:forKey:", v5, v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientBundleID"));
  mainBundleIDToBundleID = self->_mainBundleIDToBundleID;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientMainBundleID"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](mainBundleIDToBundleID, "setObject:forKeyedSubscript:", v9, v8);
}

- (void)removeClient:(id)a3
{
  id v4;
  NSMutableDictionary *bundleIDToClientDictionary;
  void *v6;
  NSMutableDictionary *mainBundleIDToBundleID;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "stopCurrentActiveSessionWithHandler:", &stru_100081920);
  objc_msgSend(v4, "invalidate");
  bundleIDToClientDictionary = self->_bundleIDToClientDictionary;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientBundleID"));
  -[NSMutableDictionary removeObjectForKey:](bundleIDToClientDictionary, "removeObjectForKey:", v6);

  mainBundleIDToBundleID = self->_mainBundleIDToBundleID;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientMainBundleID"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](mainBundleIDToBundleID, "setObject:forKeyedSubscript:", 0, v8);
}

- (id)getClientWithBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIDToClientDictionary, "objectForKeyedSubscript:", v4)), v5, v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIDToClientDictionary, "objectForKeyedSubscript:", v4));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mainBundleIDToBundleID, "objectForKeyedSubscript:", v4));
    if (v7)
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIDToClientDictionary, "objectForKeyedSubscript:", v7));
    else
      v6 = 0;

  }
  return v6;
}

- (id)getClientForBroadcastWithHostBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIDToClientDictionary, "objectForKeyedSubscript:", v4)), v5, v5))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIDToClientDictionary, "objectForKeyedSubscript:", v4));
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bundleIDToClientDictionary, "allValues", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientBundleID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(".pid.")));

          if (v14)
          {
            if (objc_msgSend(v14, "count"))
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
              v16 = objc_msgSend(v4, "isEqualToString:", v15);

              if ((v16 & 1) != 0)
              {
                v6 = v12;

                goto LABEL_16;
              }
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }
    }

    v6 = 0;
  }
LABEL_16:

  return v6;
}

- (void)stopAllClientsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD block[4];
  id v16;
  _BYTE *v17;
  _QWORD v18[4];
  NSObject *v19;
  _BYTE *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint8_t v29[128];
  _BYTE buf[24];
  char v31;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[RPClientManager stopAllClientsWithHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 92;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v5 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v31 = 1;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bundleIDToClientDictionary, "allValues"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  v14 = v4;
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v25 = 136446466;
          v26 = "-[RPClientManager stopAllClientsWithHandler:]";
          v27 = 1024;
          v28 = 100;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d enter stop group", v25, 0x12u);
        }
        dispatch_group_enter(v5);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100024574;
        v18[3] = &unk_100081540;
        v20 = buf;
        v19 = v5;
        objc_msgSend(v10, "stopCurrentActiveSessionWithHandler:", v18);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v7);
  }

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v25 = 136446466;
    v26 = "-[RPClientManager stopAllClientsWithHandler:]";
    v27 = 1024;
    v28 = 118;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notify stop group", v25, 0x12u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002467C;
  block[3] = &unk_100081948;
  v16 = v14;
  v17 = buf;
  v13 = v14;
  dispatch_group_notify(v5, v12, block);

  _Block_object_dispose(buf, 8);
}

- (NSMutableDictionary)bundleIDToClientDictionary
{
  return self->_bundleIDToClientDictionary;
}

- (void)setBundleIDToClientDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDToClientDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainBundleIDToBundleID, 0);
  objc_storeStrong((id *)&self->_bundleIDToClientDictionary, 0);
}

@end
