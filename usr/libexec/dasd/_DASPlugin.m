@implementation _DASPlugin

+ (id)extensionForIdentifier:(id)a3 ofType:(id)a4
{
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  __objc2_class **p_superclass;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  __objc2_class **v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _QWORD v49[2];
  _QWORD v50[2];
  uint8_t buf[4];
  NSObject *v52;
  __int16 v53;
  NSObject *v54;
  __int16 v55;
  NSObject *v56;
  __int16 v57;
  NSObject *v58;
  _BYTE v59[128];

  v5 = a3;
  v41 = a4;
  if (!v5)
  {
    v27 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v41;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Missing identifier for extensionPoint %@", buf, 0xCu);
    }
    v28 = 0;
    goto LABEL_33;
  }
  v48 = 0;
  v6 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, &v48);
  v7 = v48;
  if (v6)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationExtensionRecords"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
    if (v9)
    {
      v10 = v9;
      v37 = v7;
      v38 = v6;
      v40 = v5;
      v11 = *(_QWORD *)v45;
      p_superclass = _DASCPMModePolicy.superclass;
      v13 = CFSTR("plugin");
LABEL_5:
      v14 = 0;
      v39 = v10;
      while (1)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v14);
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(p_superclass + 224, "logForCategory:", v13, v37));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleIdentifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "extensionPointRecord"));
          v19 = v11;
          v20 = v13;
          v21 = v8;
          v22 = p_superclass;
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
          *(_DWORD *)buf = 138413058;
          v52 = v17;
          v53 = 2112;
          v54 = v23;
          v55 = 2112;
          v56 = v41;
          v57 = 2112;
          v58 = v40;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Checking extension %@ with pointRecord %@ (want %@) for bundle %@", buf, 0x2Au);

          p_superclass = v22;
          v8 = v21;
          v13 = v20;
          v11 = v19;
          v10 = v39;

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "extensionPointRecord"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
        v26 = objc_msgSend(v25, "isEqualToString:", v41);

        if ((v26 & 1) != 0)
          break;
        if (v10 == (id)++v14)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
          if (v10)
            goto LABEL_5;
          v5 = v40;
          v7 = v37;
          v6 = v38;
          goto LABEL_22;
        }
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "extensionPointRecord"));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));

      if (v27)
      {
        v30 = v37;
        v43 = v37;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSExtension extensionWithIdentifier:error:](NSExtension, "extensionWithIdentifier:error:", v27, &v43));
        v31 = v43;
        v5 = v40;
        v6 = v38;
        goto LABEL_28;
      }
      v5 = v40;
      v7 = v37;
      v6 = v38;
      goto LABEL_23;
    }
  }
  else
  {
    v32 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_1000EBA94();

    v8 = v7;
    v7 = 0;
  }
LABEL_22:

LABEL_23:
  v49[0] = NSExtensionPointName;
  v49[1] = NSExtensionIdentifierName;
  v50[0] = v41;
  v50[1] = v5;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 2));
  v42 = v7;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSExtension extensionsWithMatchingAttributes:error:](NSExtension, "extensionsWithMatchingAttributes:error:", v30, &v42));
  v31 = v42;

  if ((unint64_t)objc_msgSend(v33, "count") >= 2)
  {
    v34 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_1000EBA34();

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));

  v27 = 0;
LABEL_28:

  if (!v28)
  {
    v35 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v52 = v27;
      v53 = 2112;
      v54 = v41;
      v55 = 2112;
      v56 = v5;
      v57 = 2112;
      v58 = v31;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Unable to find extension %@ (%@) for %@: %@", buf, 0x2Au);
    }

  }
LABEL_33:

  return v28;
}

+ (id)existingPluginForIdentifier:(id)a3 ofType:(id)a4
{
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingString:", a4));
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1001ABE68);
  v5 = (void *)qword_1001ABE70;
  if (!qword_1001ABE70)
  {
    v6 = objc_opt_new(NSMutableDictionary);
    v7 = (void *)qword_1001ABE70;
    qword_1001ABE70 = (uint64_t)v6;

    v5 = (void *)qword_1001ABE70;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1001ABE68);

  return v8;
}

+ (id)pluginForIdentifier:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  _DASPlugin *v13;
  void *v14;
  void *v15;
  _DASPlugin *v16;
  NSObject *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", v7));
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1001ABE68);
  v9 = (void *)qword_1001ABE70;
  if (!qword_1001ABE70)
  {
    v10 = objc_opt_new(NSMutableDictionary);
    v11 = (void *)qword_1001ABE70;
    qword_1001ABE70 = (uint64_t)v10;

    v9 = (void *)qword_1001ABE70;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1001ABE68);
  if (!v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "extensionForIdentifier:ofType:", v6, v7));
    v15 = v14;
    if (v14)
    {
      if (!objc_msgSend(v14, "optedIn"))
      {
        v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_1000EBAF4();

        v13 = 0;
        goto LABEL_13;
      }
      v16 = -[_DASPlugin initWithExtension:pluginMapKey:]([_DASPlugin alloc], "initWithExtension:pluginMapKey:", v15, v8);
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1001ABE68);
      objc_msgSend((id)qword_1001ABE70, "setObject:forKeyedSubscript:", v16, v8);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1001ABE68);
    }
    else
    {
      v16 = 0;
    }
    v13 = v16;
LABEL_13:

    goto LABEL_14;
  }
  v13 = v12;
LABEL_14:

  return v13;
}

- (_DASPlugin)initWithExtension:(id)a3 pluginMapKey:(id)a4
{
  id v6;
  id v7;
  _DASPlugin *v8;
  _DASPlugin *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  dispatch_queue_attr_t v22;
  NSObject *v23;
  dispatch_queue_t v24;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)_DASPlugin;
  v8 = -[_DASPlugin init](&v26, "init");
  v9 = v8;
  if (v8)
  {
    -[_DASPlugin setExtension:](v8, "setExtension:", v6);
    -[_DASPlugin setPluginMapKey:](v9, "setPluginMapKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "infoDictionary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("CFBundleDisplayName")));
    -[_DASPlugin setDisplayName:](v9, "setDisplayName:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(".")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
    -[_DASPlugin setExtensionName:](v9, "setExtensionName:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extensionName](v9, "extensionName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Extension Queue (%@)"), v15));

    v17 = objc_retainAutorelease(v16);
    v18 = (const char *)objc_msgSend(v17, "cStringUsingEncoding:", 4);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_create(v18, v20);
    -[_DASPlugin setQueue:](v9, "setQueue:", v21);

    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = dispatch_queue_create("Extension Delegate Queue", v23);
    -[_DASPlugin setDelegateQueue:](v9, "setDelegateQueue:", v24);

    -[_DASPlugin _setupExtension](v9, "_setupExtension");
  }

  return v9;
}

- (void)_setupExtension
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D76EC;
  v7[3] = &unk_100160458;
  objc_copyWeak(&v8, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extension](self, "extension"));
  objc_msgSend(v3, "setRequestInterruptionBlock:", v7);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D7928;
  v5[3] = &unk_100160480;
  objc_copyWeak(&v6, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extension](self, "extension"));
  objc_msgSend(v4, "setRequestCancellationBlock:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_contextForSession
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extension](self, "extension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin sessionID](self, "sessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_extensionContextForUUID:", v4));

  return v5;
}

- (void)_setupSessionIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin sessionID](self, "sessionID"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extension](self, "extension"));
    v11 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "beginExtensionRequestWithOptions:inputItems:error:", 0, 0, &v11));
    v6 = v11;

    if (v6 || !v5)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000EBBF4();
    }
    else
    {
      -[_DASPlugin setSessionID:](self, "setSessionID:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin _contextForSession](self, "_contextForSession"));
      objc_msgSend(v7, "setContextPlugin:", self);

      v8 = objc_claimAutoreleasedReturnValue(-[_DASPlugin _contextForSession](self, "_contextForSession"));
      v9 = -[NSObject pid](v8, "pid");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin currentActivity](self, "currentActivity"));
      objc_msgSend(v10, "setPid:", v9);

    }
  }
}

- (void)performActivity:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  __int16 v18;
  uint64_t v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin currentActivity](self, "currentActivity"));

  v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_1000EBD44(self, (uint64_t)v4, v7);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Plugin performing activity: %@", buf, 0xCu);
    }

    -[_DASPlugin setCurrentActivity:](self, "setCurrentActivity:", v4);
    -[_DASPlugin _setupSessionIfNecessary](self, "_setupSessionIfNecessary");
    v7 = objc_claimAutoreleasedReturnValue(-[_DASPlugin _contextForSession](self, "_contextForSession"));
    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = objc_opt_class(v7);
        *(_DWORD *)buf = 138412546;
        v17 = v7;
        v18 = 2112;
        v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Host context %@ (%@)", buf, 0x16u);
      }

      v15 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject remoteContextWithError:](v7, "remoteContextWithError:", &v15));
      v9 = v15;
      v12 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
      v13 = v12;
      if (v9 || !v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_1000EBCE4();

      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v14 = objc_claimAutoreleasedReturnValue(-[_DASPlugin sessionID](self, "sessionID"));
          *(_DWORD *)buf = 138412290;
          v17 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Reaching out to plugin to perform action with request ID %@.", buf, 0xCu);

        }
        objc_msgSend(v11, "performActivity:", v4);
      }

    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_1000EBC54(self, v9);
    }

  }
}

- (void)suspend
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping task", buf, 2u);
  }

  -[_DASPlugin _setupSessionIfNecessary](self, "_setupSessionIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin _contextForSession](self, "_contextForSession"));
  v8 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteContextWithError:", &v8));
  v6 = v8;
  if (v6 || !v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000EBCE4();

  }
  else
  {
    objc_msgSend(v5, "suspend");
  }

}

- (void)extensionDidFinishWithStatus:(unsigned __int8)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  unsigned __int8 v14;
  uint8_t buf[4];
  void *v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin pluginDelegate](self, "pluginDelegate"));
  v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notifying delegate %@ that plugin has finished", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin currentActivity](self, "currentActivity"));
  v8 = objc_claimAutoreleasedReturnValue(-[_DASPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8078;
  block[3] = &unk_1001604A8;
  v12 = v5;
  v13 = v7;
  v14 = a3;
  v9 = v7;
  v10 = v5;
  dispatch_async(v8, block);

}

- (void)unload
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[_DASPlugin queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8128;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (id)container
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extension](self, "extension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_plugIn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containingUrl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));

  return v5;
}

- (id)containerID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin container](self, "container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));

  return v4;
}

- (NSString)extensionID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extension](self, "extension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));

  return (NSString *)v3;
}

- (BOOL)isInternal
{
  return 0;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extensionName](self, "extensionName"));
  v5 = -[_DASPlugin isInternal](self, "isInternal");
  v6 = &stru_1001617C8;
  if (v5)
    v6 = CFSTR(" (internal)");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %@%@>"), v3, v4, v6));

  return v7;
}

- (NSString)extensionName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setExtensionName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (_DASPluginDelegate)pluginDelegate
{
  return (_DASPluginDelegate *)objc_loadWeakRetained((id *)&self->_pluginDelegate);
}

- (void)setPluginDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pluginDelegate, a3);
}

- (NSExtension)extension
{
  return (NSExtension *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)pluginMapKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPluginMapKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (_DASActivity)currentActivity
{
  return (_DASActivity *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_pluginMapKey, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_pluginDelegate);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_extensionName, 0);
}

@end
