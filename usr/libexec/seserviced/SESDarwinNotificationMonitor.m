@implementation SESDarwinNotificationMonitor

+ (id)sharedObject
{
  if (qword_10034BB20 != -1)
    dispatch_once(&qword_10034BB20, &stru_100304120);
  return (id)qword_10034BB18;
}

- (SESDarwinNotificationMonitor)initWithQueue:(id)a3
{
  id v5;
  SESDarwinNotificationMonitor *v6;
  SESDarwinNotificationMonitor *v7;
  uint64_t v8;
  NSMapTable *registeredDelegates;
  NSMutableSet *v10;
  NSMutableSet *pendingNotificationIdentifiers;
  NSObject *queue;
  _QWORD handler[4];
  SESDarwinNotificationMonitor *v15;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SESDarwinNotificationMonitor;
  v6 = -[SESDarwinNotificationMonitor init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    registeredDelegates = v7->_registeredDelegates;
    v7->_registeredDelegates = (NSMapTable *)v8;

    v10 = objc_opt_new(NSMutableSet);
    pendingNotificationIdentifiers = v7->_pendingNotificationIdentifiers;
    v7->_pendingNotificationIdentifiers = v10;

    queue = v7->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002C808;
    handler[3] = &unk_100304148;
    v15 = v7;
    xpc_set_event_stream_handler("com.apple.notifyd.matching", queue, handler);

  }
  return v7;
}

+ (void)kickoff
{
  id v2;

  v2 = +[SESDarwinNotificationMonitor sharedObject](SESDarwinNotificationMonitor, "sharedObject");
}

- (void)_handleEvent:(id)a3
{
  NSObject *queue;
  id v5;
  const char *string;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  void *v18;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  string = xpc_dictionary_get_string(v5, _xpc_event_key_name);

  if (string)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    v9 = SESDefaultLogObject(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Notification %@ received", (uint8_t *)&v17, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_registeredDelegates, "objectForKey:", v7));
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "onDarwinNotification:", v7);
    }
    else
    {
      v13 = -[NSMutableSet count](self->_pendingNotificationIdentifiers, "count");
      if ((unint64_t)v13 < 0x65)
      {
        -[NSMutableSet addObject:](self->_pendingNotificationIdentifiers, "addObject:", v7);
      }
      else
      {
        v15 = SESDefaultLogObject(v13, v14);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = 138412290;
          v18 = v7;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Too many notifications received, dropping event %@", (uint8_t *)&v17, 0xCu);
        }

      }
    }

  }
}

+ (BOOL)registerDelegate:(id)a3 forEvent:(id)a4
{
  id v5;
  id v6;
  dispatch_queue_t *v7;
  NSObject *v8;
  dispatch_queue_t *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  BOOL v17;
  _QWORD v19[4];
  dispatch_queue_t *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  int v31;

  v5 = a3;
  v6 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v7 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue(+[SESDarwinNotificationMonitor sharedObject](SESDarwinNotificationMonitor, "sharedObject"));
  dispatch_assert_queue_not_V2(v7[1]);
  v8 = v7[1];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002CB98;
  v19[3] = &unk_100304170;
  v9 = v7;
  v20 = v9;
  v10 = v5;
  v21 = v10;
  v11 = v6;
  v22 = v11;
  v23 = &v24;
  dispatch_sync(v8, v19);
  v14 = SESDefaultLogObject(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *((unsigned __int8 *)v25 + 24);
    *(_DWORD *)buf = 138412546;
    v29 = v11;
    v30 = 1024;
    v31 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Registered delegate for event %@, pending %d", buf, 0x12u);
  }

  v17 = *((_BYTE *)v25 + 24) != 0;
  _Block_object_dispose(&v24, 8);

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingNotificationIdentifiers, 0);
  objc_storeStrong((id *)&self->_registeredDelegates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
