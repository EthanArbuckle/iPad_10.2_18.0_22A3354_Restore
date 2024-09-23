@implementation BKSceneUtilities

+ (BOOL)connectionOptions:(id)a3 hasActivityType:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userActivities"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "activityType", (_QWORD)v13));
        v11 = objc_msgSend(v10, "isEqualToString:", v5);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

+ (BOOL)hasMultiWindowEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "supportsMultipleScenes");

  return v3;
}

+ (id)getUserInfoForConnectionOptions:(id)a3 withActivityType:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userActivities"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType", (_QWORD)v14));
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if (v12)
        {
          v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)URLContextOpenURLOptions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "options"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceApplication"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceApplication"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, UIApplicationOpenURLOptionsSourceApplicationKey);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "annotation"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "annotation"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, UIApplicationOpenURLOptionsAnnotationKey);

  }
  v10 = objc_msgSend(v4, "copy");

  return v10;
}

+ (id)sharedInstance
{
  if (qword_1009F4EC0 != -1)
    dispatch_once(&qword_1009F4EC0, &stru_1008E9F68);
  return (id)qword_1009F4EB8;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSceneUtilities;
  return -[BKSceneUtilities init](&v3, "init");
}

- (void)requestWindowForSceneSession:(id)a3 userActivity:(id)a4 errorHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = BCSceneLog(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Requesting window for session: %@", buf, 0xCu);
  }

  v12 = objc_alloc_init((Class)UISceneActivationRequestOptions);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scene"));
  objc_msgSend(v12, "setRequestingScene:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000CA0F0;
  v16[3] = &unk_1008E9F90;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v14, "requestSceneSessionActivation:userActivity:options:errorHandler:", v7, v9, v12, v16);

}

- (void)destroySceneWithSceneSession:(id)a3 withAnimationType:(int64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a3;
  v7 = BCSceneLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentIdentifier"));
    v13 = 138412290;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Running destroySceneWithSceneSession identifier=%@", (uint8_t *)&v13, 0xCu);

  }
  v10 = objc_msgSend((id)objc_opt_class(self), "hasMultiWindowEnabled");
  if (v6 && v10)
  {
    v11 = objc_alloc_init((Class)UIWindowSceneDestructionRequestOptions);
    objc_msgSend(v11, "setWindowDismissalAnimation:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v12, "requestSceneSessionDestruction:options:errorHandler:", v6, v11, &stru_1008E9FB0);

  }
}

@end
