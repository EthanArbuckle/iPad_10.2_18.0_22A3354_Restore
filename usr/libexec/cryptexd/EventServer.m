@implementation EventServer

- (EventServer)initWithEventStream:(const char *)a3
{
  EventServer *v4;
  dispatch_queue_t v5;
  uint64_t v6;
  uint64_t v7;
  OS_xpc_event_publisher *publisher;
  os_log_t v9;
  OS_os_log *log;
  NSMutableDictionary *v11;
  NSMutableDictionary *clients;
  void *v13;
  EventServer *v14;
  void *v15;
  _QWORD v17[4];
  EventServer *v18;
  _QWORD v19[4];
  EventServer *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)EventServer;
  v4 = -[EventServer init](&v21, "init");
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.security.cryptexd.event_server", 0);
    v6 = xpc_event_publisher_create(a3, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    publisher = v4->_publisher;
    v4->_publisher = (OS_xpc_event_publisher *)v7;

    v9 = os_log_create("com.apple.libcryptex", "event_server");
    log = v4->_log;
    v4->_log = (OS_os_log *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clients = v4->_clients;
    v4->_clients = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer publisher](v4, "publisher"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100013BF0;
    v19[3] = &unk_100055C40;
    v14 = v4;
    v20 = v14;
    xpc_event_publisher_set_handler(v13, v19);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer publisher](v14, "publisher"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100013D1C;
    v17[3] = &unk_100055C68;
    v18 = v14;
    xpc_event_publisher_set_error_handler(v15, v17);

  }
  return v4;
}

- (void)activate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[EventServer publisher](self, "publisher"));
  xpc_event_publisher_activate();

}

- (void)withInstalledCryptexList:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v5 = sub_100014FE0();
  v4 = objc_msgSend(v3, "copy");

  sub_100018134(v5, (uint64_t)v4, (uint64_t)sub_100013DAC);
}

- (void)sendAlreadyInstalledCryptexesToClient:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if ((objc_msgSend(v4, "eventMask") & 1) != 0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100013E5C;
    v5[3] = &unk_100055CB8;
    v5[4] = self;
    v6 = v4;
    -[EventServer withInstalledCryptexList:](self, "withInstalledCryptexList:", v5);

  }
}

- (void)handlePublisherAddToken:(unint64_t)a3 descriptor:(id)a4
{
  id v6;
  int v7;
  int v8;
  NSObject *v9;
  int *v10;
  int v11;
  NSObject *v12;
  EventClient *v13;
  void *v14;
  EventClient *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  unint64_t v28;

  v6 = a4;
  v21 = 0;
  v22 = 0;
  v7 = sub_10003CEB8(v6, "CryptexEventClientName", &v22);
  if (v7)
  {
    v8 = *__error();
    v9 = objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "CryptexEventClientName";
      v25 = 1024;
      LODWORD(v26) = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Subscriber missing expected key '%{public}s'. Ignoring.: %{darwin.errno}d", buf, 0x12u);
    }

    v10 = __error();
LABEL_9:
    *v10 = v8;
    goto LABEL_10;
  }
  v11 = sub_10003CE58(v6, "CryptexEventMask", (uint64_t *)&v21);
  if (v11)
  {
    v8 = *__error();
    v12 = objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v24 = v22;
      v25 = 2082;
      v26 = "CryptexEventMask";
      v27 = 1024;
      LODWORD(v28) = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Subscriber '%s' missing expected key '%{public}s'. Ignoring.: %{darwin.errno}d", buf, 0x1Cu);
    }

    v10 = __error();
    goto LABEL_9;
  }
  v13 = [EventClient alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v22));
  v15 = -[EventClient initWithToken:name:eventMask:](v13, "initWithToken:name:eventMask:", a3, v14, v21);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  objc_sync_enter(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v18);

  objc_sync_exit(v16);
  v19 = *__error();
  v20 = objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v24 = v22;
    v25 = 2048;
    v26 = v21;
    v27 = 2048;
    v28 = a3;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "'%s' subscribed with event mask 0x%llx, token %llu", buf, 0x20u);
  }

  *__error() = v19;
  -[EventServer sendAlreadyInstalledCryptexesToClient:](self, "sendAlreadyInstalledCryptexesToClient:", v15);

LABEL_10:
}

- (void)handlePublisherRemoveToken:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  unint64_t v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  objc_msgSend(v9, "removeObjectForKey:", v10);

  objc_sync_exit(v5);
  v11 = *__error();
  v12 = objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientName"));
    v14 = 138412546;
    v15 = v13;
    v16 = 2048;
    v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "'%@' unsubscribed with token %llu", (uint8_t *)&v14, 0x16u);

  }
  *__error() = v11;

}

- (void)handlePublisherError:(int)a3
{
  int v5;
  NSObject *v6;
  _DWORD v7[2];

  v5 = *__error();
  v6 = objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "XPC publisher error: %{darwin.errno}d", (uint8_t *)v7, 8u);
  }

  *__error() = v5;
}

- (id)broadcastEvent:(unint64_t)a3 forCryptex:(id)a4 withInfo:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v19 = a4;
  v20 = a5;
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  objc_sync_enter(v9);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer clients](self, "clients", v19));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v14));

        if (((unint64_t)objc_msgSend(v16, "eventMask") & a3) != 0)
          objc_msgSend(v8, "addObject:", v16);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer broadcastEvent:forCryptex:withInfo:toClients:](self, "broadcastEvent:forCryptex:withInfo:toClients:", a3, v19, v20, v8));

  return v17;
}

- (id)broadcastEvent:(unint64_t)a3 forCryptex:(id)a4 withInfo:(id)a5 toClients:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  xpc_object_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  CFErrorRef v27;
  void *v28;
  signed int v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  char *v33;
  void *v35;
  void *v36;
  id v37;
  id v38;
  unint64_t v39;
  id v40;
  xpc_object_t xdict;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t buf[4];
  unint64_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v11;
  v38 = v12;
  v14 = xpc_dictionary_create(0, 0, 0);
  v39 = a3;
  xpc_dictionary_set_uint64(v14, "CRYPTEX_EVENT_TYPE", a3);
  v40 = objc_retainAutorelease(v10);
  xdict = v14;
  xpc_dictionary_set_string(v14, "CRYPTEX_EVENT_CRYPTEX_NAME", (const char *)objc_msgSend(v40, "UTF8String"));
  v36 = v13;
  if (v13)
  {
    v46 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v13, 100, 0, &v46));
    v16 = v46;
    if (!v15)
    {
      v28 = v16;
      v29 = objc_msgSend(v16, "code");
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));

      if (v30)
      {
        v31 = objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          v32 = 3;
        else
          v32 = 2;
        *(_WORD *)buf = 0;
        v33 = (char *)_os_log_send_and_compose_impl(v32, 0, 0, 0, &_mh_execute_header, v31, 16);

      }
      else
      {
        *(_WORD *)buf = 0;
        v33 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
      }
      v27 = sub_10000A6F8("-[EventServer broadcastEvent:forCryptex:withInfo:toClients:]", "event_server.m", 220, "com.apple.security.cryptex", v29, v28, v33);
      free(v33);
      goto LABEL_22;
    }
    v35 = v16;
    v37 = objc_retainAutorelease(v15);
    xpc_dictionary_set_data(v14, "CRYPTEX_EVENT_INFO", objc_msgSend(v37, "bytes"), (size_t)objc_msgSend(v37, "length"));
  }
  else
  {
    v37 = 0;
    v35 = 0;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v17 = v38;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v22 = *__error();
        v23 = objc_claimAutoreleasedReturnValue(-[EventServer log](self, "log"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientName"));
          *(_DWORD *)buf = 134218498;
          v48 = v39;
          v49 = 2112;
          v50 = v40;
          v51 = 2112;
          v52 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "event 0x%llx for cryptex '%@' sent to '%@'", buf, 0x20u);

        }
        *__error() = v22;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[EventServer publisher](self, "publisher"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "token"));
        xpc_event_publisher_fire(v25, objc_msgSend(v26, "unsignedLongLongValue"), xdict);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v18);
  }

  v27 = 0;
  v28 = v37;
LABEL_22:

  return v27;
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSMutableDictionary)clients
{
  return self->_clients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

@end
