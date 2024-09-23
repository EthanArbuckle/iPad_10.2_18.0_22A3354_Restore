@implementation Daemon

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E22C;
  block[3] = &unk_100099320;
  block[4] = a1;
  if (qword_1000B3770 != -1)
    dispatch_once(&qword_1000B3770, block);
  return (id)qword_1000B3778;
}

- (BOOL)isInternalBuild
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E254;
  block[3] = &unk_1000993C8;
  block[4] = self;
  if (qword_1000B3780 != -1)
    dispatch_once(&qword_1000B3780, block);
  return self->_isInternalBuild;
}

- (void)run
{
  id v3;
  id v4;

  -[Daemon registerSignalHandlers](self, "registerSignalHandlers");
  -[Daemon startup](self, "startup");
  -[Daemon registerXPCEventHandlers](self, "registerXPCEventHandlers");
  -[Daemon addObservers](self, "addObservers");
  v3 = +[FMFIDSMessageController sharedInstance](FMFIDSMessageController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[Daemon listener](self, "listener"));
  objc_msgSend(v4, "resume");

}

- (void)startup
{
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[Daemon machServiceName](self, "machServiceName"));
  if (v5)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", v5);
    -[Daemon setListener:](self, "setListener:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon listener](self, "listener"));
    objc_msgSend(v4, "setDelegate:", self);

  }
}

- (id)xpcDarwinEventHandlers
{
  return &__NSDictionary0__struct;
}

- (id)xpcDistributedEventHandlers
{
  return &__NSDictionary0__struct;
}

- (void)registerXPCEventHandlers
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[Daemon xpcDarwinEventHandlers](self, "xpcDarwinEventHandlers"));
  if (v4)
    +[FMFXPCNotificationsUtil handleDarwinNotificationsWithHandlers:](FMFXPCNotificationsUtil, "handleDarwinNotificationsWithHandlers:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon xpcDistributedEventHandlers](self, "xpcDistributedEventHandlers"));
  if (v3)
    +[FMFXPCNotificationsUtil handleDistributedNotificationsWithHandlers:](FMFXPCNotificationsUtil, "handleDistributedNotificationsWithHandlers:", v3);

}

- (void)registerSignalHandlers
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  dispatch_source_t v5;
  void *v6;
  dispatch_source_t v7;
  void *v8;

  signal(20, (void (__cdecl *)(int))sub_10002E518);
  if (-[Daemon isInternalBuild](self, "isInternalBuild"))
  {
    signal(30, (void (__cdecl *)(int))sub_10002E518);
    signal(31, (void (__cdecl *)(int))sub_10002E518);
    global_queue = dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, v4);
    v6 = (void *)qword_1000B3788;
    qword_1000B3788 = (uint64_t)v5;

    dispatch_source_set_event_handler((dispatch_source_t)qword_1000B3788, &stru_10009A188);
    dispatch_resume((dispatch_object_t)qword_1000B3788);
    v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1FuLL, 0, v4);
    v8 = (void *)qword_1000B3790;
    qword_1000B3790 = (uint64_t)v7;

    dispatch_source_set_event_handler((dispatch_source_t)qword_1000B3790, &stru_10009A1C8);
    dispatch_resume((dispatch_object_t)qword_1000B3790);
  }
}

- (id)_verifyLaunchEventsConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  Daemon *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", CFSTR("/System/Library/LaunchDaemons/com.apple.icloud.fmfd.plist")));
  v4 = v3;
  if (v3)
  {
    v44 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LaunchEvents")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.notifyd.matching")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v56;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v56 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v7, "addObject:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13));
          v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Notification")));

          if (!objc_msgSend(v13, "isEqualToString:", v15))
          {
            v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Darwin event key %@ does not match with its notification name %@"), v13, v15));
            v16 = v8;
            goto LABEL_37;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        if (v10)
          continue;
        break;
      }
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon xpcDarwinEventHandlers](v44, "xpcDarwinEventHandlers"));
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10002EBBC;
    v53[3] = &unk_10009A0D0;
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v54 = v15;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v53);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v18 = objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v18, "minusSet:", v15);
    if (objc_msgSend(v18, "count"))
      objc_msgSend(v17, "appendFormat:", CFSTR("launchd plist has these darwin notifications that don't have a handler defined in code: %@\n"), v18);
    v19 = objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v19, "minusSet:", v7);
    if (objc_msgSend(v19, "count"))
      objc_msgSend(v17, "appendFormat:", CFSTR("launchd plist does not have these darwin notifications but, they have a handler defined in code: %@\n"), v19);
    if (objc_msgSend(v17, "length"))
    {
      v20 = v17;
    }
    else
    {
      v40 = v19;
      v41 = v18;
      v42 = v17;
      v43 = v16;
      v39 = v4;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LaunchEvents")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("com.apple.distnoted.matching")));

      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v50;
        while (2)
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(_QWORD *)v50 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v46, "addObject:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v28));
            v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Name")));

            if (!objc_msgSend(v28, "isEqualToString:", v30))
            {
              v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Distributed event key %@ does not match with its notification name %@"), v28, v30));
              v35 = v23;
              v4 = v39;
              v17 = v42;
              v16 = v43;
              goto LABEL_35;
            }

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
          if (v25)
            continue;
          break;
        }
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon xpcDistributedEventHandlers](v44, "xpcDistributedEventHandlers"));
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10002EC40;
      v47[3] = &unk_10009A0D0;
      v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v48 = v30;
      v45 = v31;
      objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v47);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
      v33 = objc_msgSend(v46, "mutableCopy");
      objc_msgSend(v33, "minusSet:", v30);
      if (objc_msgSend(v33, "count"))
        objc_msgSend(v32, "appendFormat:", CFSTR("launchd plist has these distributed notifications that don't have a handler defined in code: %@\n"), v33);
      v38 = v33;
      v34 = objc_msgSend(v30, "mutableCopy");
      objc_msgSend(v34, "minusSet:", v46);
      v17 = v42;
      v16 = v43;
      if (objc_msgSend(v34, "count"))
        objc_msgSend(v32, "appendFormat:", CFSTR("launchd plist does not have these distributed notifications but, they have a handler defined in code: %@\n"), v34);
      v37 = v32;
      if (objc_msgSend(v32, "length"))
        v20 = v32;
      else
        v20 = 0;
      v4 = v39;

      v35 = v45;
LABEL_35:

      v19 = v40;
      v18 = v41;
    }

LABEL_37:
  }
  else
  {
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not load %@"), 0));
  }

  return v20;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 0;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end
