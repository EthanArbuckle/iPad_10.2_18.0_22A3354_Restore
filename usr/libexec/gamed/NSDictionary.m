@implementation NSDictionary

- (id)_gkPlistXMLDataForClient:(id)a3 player:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "appSessionForPlayer:", a4));
    if (v5)
    {
      v6 = -[NSDictionary mutableCopy](self, "mutableCopy");
      objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("app-session"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v6, 100, 0, 0));

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", self, 100, 0, 0));
    }

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", self, 100, 0, 0));
  }
  return v7;
}

+ (id)_gkDictionaryWithServerData:(id)a3 serverStatus:(int64_t *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v36;
  uint64_t v37;
  NSErrorUserInfoKey v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  NSErrorUserInfoKey v42;
  const __CFString *v43;

  v7 = a3;
  v8 = v7;
  if (!a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/NSDictionary+GKDaemonAdditions.m"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (serverStatus != ((void *)0))\n[%s (%s:%d)]"), v9, "+[NSDictionary(GKDaemonAdditions) _gkDictionaryWithServerData:serverStatus:error:]", objc_msgSend(v11, "UTF8String"), 41));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }
  *a4 = 0;
  if (v8)
  {
    v36 = 0;
    v37 = 100;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v8, 0, &v37, &v36));
    v14 = v36;
    v16 = objc_opt_class(NSDictionary, v15);
    if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
    {
      if (v13)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", GKRequestStatusKey));
        v18 = objc_msgSend(v17, "integerValue");

        *a4 = (int64_t)v18;
        if (a5 && v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", GKErrorMessageKey));
          v20 = GKAuthenticateAlertKey;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", GKAuthenticateAlertKey));

          if (v21)
          {
            v40 = v20;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v20));
            v41 = v22;
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
            *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError userErrorForServerCode:reason:userInfo:](NSError, "userErrorForServerCode:reason:userInfo:", v18, v19, v23));

          }
          else
          {
            *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError userErrorForServerCode:reason:](NSError, "userErrorForServerCode:reason:", v18, v19));
          }

        }
      }
      else if (a5)
      {
        *a5 = objc_retainAutorelease(v14);
      }
    }
    else if (a5)
    {
      v42 = NSLocalizedFailureReasonErrorKey;
      v43 = CFSTR("Received unexpected data format in server response.");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:userInfo:](NSError, "userErrorForCode:userInfo:", 3, v34));

    }
  }
  else
  {
    if (a5)
    {
      if (!os_log_GKGeneral)
        v24 = (id)GKOSLoggers(v7);
      v25 = os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_1000BB1E0(v25, v26, v27, v28, v29, v30, v31, v32);
      v38 = NSLocalizedFailureReasonErrorKey;
      v39 = CFSTR("No data received from the server.");
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:userInfo:](NSError, "userErrorForCode:userInfo:", 3, v33));

    }
    v14 = 0;
    v13 = 0;
  }

  return v13;
}

+ (id)_gkDictionaryWithServerDataJson:(id)a3 serverStatus:(int64_t *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v36;
  NSErrorUserInfoKey v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;

  v7 = a3;
  v8 = v7;
  if (!a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/NSDictionary+GKDaemonAdditions.m"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (serverStatus != ((void *)0))\n[%s (%s:%d)]"), v9, "+[NSDictionary(GKDaemonAdditions) _gkDictionaryWithServerDataJson:serverStatus:error:]", objc_msgSend(v11, "UTF8String"), 94));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }
  *a4 = 0;
  if (!v8)
  {
    if (a5)
    {
      if (!os_log_GKGeneral)
        v24 = (id)GKOSLoggers(v7);
      v25 = os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_1000BB1E0(v25, v26, v27, v28, v29, v30, v31, v32);
      v37 = NSLocalizedFailureReasonErrorKey;
      v38 = CFSTR("No data received from the server.");
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:userInfo:](NSError, "userErrorForCode:userInfo:", 3, v33));

    }
    v14 = 0;
    goto LABEL_17;
  }
  v36 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v8, 0, &v36));
  v14 = v36;
  v16 = objc_opt_class(NSDictionary, v15);
  if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
  {
    if (v13)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", GKRequestStatusKey));
      v18 = objc_msgSend(v17, "integerValue");

      *a4 = (int64_t)v18;
      if (a5 && v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", GKErrorMessageKey));
        v20 = GKAuthenticateAlertKey;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", GKAuthenticateAlertKey));

        if (v21)
        {
          v39 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v20));
          v40 = v22;
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
          *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError userErrorForServerCode:reason:userInfo:](NSError, "userErrorForServerCode:reason:userInfo:", v18, v19, v23));

        }
        else
        {
          *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError userErrorForServerCode:reason:](NSError, "userErrorForServerCode:reason:", v18, v19));
        }

      }
      goto LABEL_24;
    }
    if (a5)
    {
      v14 = objc_retainAutorelease(v14);
      v13 = 0;
      *a5 = v14;
      goto LABEL_24;
    }
LABEL_17:
    v13 = 0;
    goto LABEL_24;
  }
  if (a5)
  {
    v41 = NSLocalizedFailureReasonErrorKey;
    v42 = CFSTR("Received unexpected data format in server response.");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:userInfo:](NSError, "userErrorForCode:userInfo:", 3, v34));

  }
LABEL_24:

  return v13;
}

+ (id)_gkDictionaryWithServerData:(id)a3 error:(id *)a4
{
  uint64_t v5;

  v5 = 0;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_gkDictionaryWithServerData:serverStatus:error:", a3, &v5, a4));
}

+ (id)_gkDictionaryWithServerDataJson:(id)a3 error:(id *)a4
{
  uint64_t v5;

  v5 = 0;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_gkDictionaryWithServerDataJson:serverStatus:error:", a3, &v5, a4));
}

- (unint64_t)unsignedIntegerValueFromKey:(id)a3 defaultValue:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", a3));
  v7 = objc_opt_class(NSNumber, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    a4 = (unint64_t)objc_msgSend(v5, "unsignedIntegerValue");

  return a4;
}

- (double)doubleValueFromKey:(id)a3 defaultValue:(double)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", a3));
  v7 = objc_opt_class(NSNumber, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    objc_msgSend(v5, "doubleValue");
    a4 = v8;
  }

  return a4;
}

@end
