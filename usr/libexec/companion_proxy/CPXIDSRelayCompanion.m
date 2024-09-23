@implementation CPXIDSRelayCompanion

- (CPXIDSRelayCompanion)init
{
  CPXIDSRelayCompanion *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *connectionTimers;
  NSMutableDictionary *v5;
  NSMutableDictionary *connectionMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *connectionSources;
  dispatch_group_t v9;
  OS_dispatch_group *connectionSourceGroup;
  NSNumber *lockdownPortNum;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CPXIDSRelayCompanion;
  v2 = -[CPXIDSRelay init](&v13, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectionTimers = v2->_connectionTimers;
    v2->_connectionTimers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectionMap = v2->_connectionMap;
    v2->_connectionMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectionSources = v2->_connectionSources;
    v2->_connectionSources = v7;

    v9 = dispatch_group_create();
    connectionSourceGroup = v2->_connectionSourceGroup;
    v2->_connectionSourceGroup = (OS_dispatch_group *)v9;

    lockdownPortNum = v2->_lockdownPortNum;
    v2->_lockdownPortNum = 0;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CPXIDSRelayCompanion teardownAllListeningSockets](self, "teardownAllListeningSockets");
  v3.receiver = self;
  v3.super_class = (Class)CPXIDSRelayCompanion;
  -[CPXIDSRelayCompanion dealloc](&v3, "dealloc");
}

+ (id)defaultCPXIDSRelayCompanion
{
  if (qword_100019FF8 != -1)
    dispatch_once(&qword_100019FF8, &stru_1000145F8);
  return (id)qword_100019FF0;
}

- (id)copyLockdownPortNumWithRequireHostIP:(id)a3 ipV6:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CPXIDSRelayCompanion *v7;
  void **p_lockdownPortNumIPV6;
  void *lockdownPortNumIPV6;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (v4)
  {
    p_lockdownPortNumIPV6 = (void **)&v7->_lockdownPortNumIPV6;
    lockdownPortNumIPV6 = v7->_lockdownPortNumIPV6;
    if (!lockdownPortNumIPV6)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion setupListeningSocket:serviceName:requiredHostIP:ipV6:isLowPriority:preferWifi:](v7, "setupListeningSocket:serviceName:requiredHostIP:ipV6:isLowPriority:preferWifi:", 62078, CFSTR("com.apple.mobile.lockdown"), v6, 1, 0, 0));
LABEL_6:
      v11 = *p_lockdownPortNumIPV6;
      *p_lockdownPortNumIPV6 = (void *)v10;

      lockdownPortNumIPV6 = *p_lockdownPortNumIPV6;
    }
  }
  else
  {
    p_lockdownPortNumIPV6 = (void **)&v7->_lockdownPortNum;
    lockdownPortNumIPV6 = v7->_lockdownPortNum;
    if (!lockdownPortNumIPV6)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion setupListeningSocket:serviceName:requiredHostIP:ipV6:isLowPriority:preferWifi:](v7, "setupListeningSocket:serviceName:requiredHostIP:ipV6:isLowPriority:preferWifi:", 62078, CFSTR("com.apple.mobile.lockdown"), v6, 0, 0, 0));
      goto LABEL_6;
    }
  }
  v12 = lockdownPortNumIPV6;
  objc_sync_exit(v7);

  return v12;
}

- (void)startTimerForUDID:(id)a3 queue:(id)a4 timeout:(unint64_t)a5 withErrorCallback:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  dispatch_time_t v23;
  id v24;
  id v25;
  _QWORD handler[4];
  id v27;
  CPXIDSRelayCompanion *v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v10)
    sub_10000DB08();
  v13 = v12;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10000DB30((uint64_t)v10, v14, v15, v16, v17, v18, v19, v20);
  v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionTimers](self, "connectionTimers"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v10);

  v23 = dispatch_time(0, 1000000000 * a5);
  dispatch_source_set_timer(v21, v23, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100008AFC;
  handler[3] = &unk_100014620;
  v27 = v10;
  v28 = self;
  v29 = v13;
  v24 = v13;
  v25 = v10;
  dispatch_source_set_event_handler(v21, handler);
  dispatch_resume(v21);

}

- (void)stopTimerForUDID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10000DC0C((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionTimers](self, "connectionTimers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v4));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionTimers](self, "connectionTimers"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v4));
    dispatch_source_cancel(v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionTimers](self, "connectionTimers"));
    objc_msgSend(v16, "removeObjectForKey:", v4);

  }
}

- (void)acquirePort:(unint64_t)a3 isLowPriority:(BOOL)a4 preferWifi:(BOOL)a5
{
  _QWORD block[6];
  BOOL v6;
  BOOL v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008C70;
  block[3] = &unk_100014648;
  v6 = a5;
  v7 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)releasePort:(unint64_t)a3 isLowPriority:(BOOL)a4 preferWifi:(BOOL)a5
{
  _QWORD block[6];
  BOOL v6;
  BOOL v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008EB0;
  block[3] = &unk_100014648;
  v6 = a4;
  v7 = a5;
  block[4] = self;
  block[5] = a3;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)setupListeningSocket:(unsigned __int16)a3 serviceName:(id)a4 requiredHostIP:(id)a5 ipV6:(BOOL)a6 isLowPriority:(BOOL)a7 preferWifi:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v10;
  unsigned int v12;
  id v14;
  id v15;
  int v16;
  int v17;
  id v18;
  int v19;
  int *v20;
  char *v21;
  id v22;
  int v23;
  int *v24;
  char *v25;
  socklen_t v26;
  sockaddr *v27;
  sockaddr *v28;
  unsigned int v29;
  uintptr_t v30;
  dispatch_queue_global_t global_queue;
  NSObject *v32;
  NSObject *v33;
  CPXIDSForwardingProxy *v34;
  id v35;
  id v36;
  CPXIDSForwardingProxy *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  int v45;
  int *v46;
  char *v47;
  const char *v48;
  id v49;
  int v50;
  int *v51;
  char *v52;
  id v53;
  int v54;
  int *v55;
  char *v56;
  const char *v58;
  id v59;
  unsigned int v60;
  _QWORD v61[4];
  id v62;
  CPXIDSRelayCompanion *v63;
  CPXIDSForwardingProxy *v64;
  uint64_t *v65;
  __int16 v66;
  __int16 v67;
  _QWORD handler[5];
  id v69;
  id v70;
  uint64_t *v71;
  __int16 v72;
  BOOL v73;
  BOOL v74;
  int v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  int v79;
  socklen_t v80;
  uint64_t v81;
  in6_addr v82;
  int v83;
  uint8_t buf[4];
  unsigned int v85;
  __int16 v86;
  char *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  __int16 v92;
  const __CFString *v93;
  __int16 v94;
  const __CFString *v95;
  sockaddr v96;

  v8 = a8;
  v10 = a6;
  v12 = a3;
  v14 = a4;
  v15 = a5;
  *(_QWORD *)&v96.sa_len = 0;
  *(_QWORD *)&v96.sa_data[6] = 0;
  v81 = 0;
  v82 = (in6_addr)0;
  v83 = 0;
  v80 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = -1;
  if (v10)
    v16 = 30;
  else
    v16 = 2;
  v17 = socket(v16, 1, 0);
  *((_DWORD *)v77 + 6) = v17;
  if (v17 == -1)
  {
    v22 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *__error();
      v24 = __error();
      v25 = strerror(*v24);
      *(_DWORD *)buf = 67109378;
      v85 = v23;
      v86 = 2080;
      v87 = v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "socket failed: %d (%s)", buf, 0x12u);
    }

    goto LABEL_37;
  }
  if (v10)
  {
    v75 = 1;
    LODWORD(v81) = 7708;
    v82 = in6addr_any;
    v80 = 28;
    if (setsockopt(v17, 41, 27, &v75, 4u))
    {
      v18 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *__error();
        v20 = __error();
        v21 = strerror(*v20);
        *(_DWORD *)buf = 67109378;
        v85 = v19;
        v86 = 2080;
        v87 = v21;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setsockopt failed: %d (%s)", buf, 0x12u);
      }
      goto LABEL_36;
    }
    v17 = *((_DWORD *)v77 + 6);
    v27 = (sockaddr *)&v81;
    v26 = v80;
  }
  else
  {
    v96.sa_family = 2;
    *(_WORD *)v96.sa_data = 0;
    *(_DWORD *)&v96.sa_data[2] = 0;
    v26 = 16;
    v80 = 16;
    v27 = &v96;
  }
  if (bind(v17, v27, v26) == -1)
  {
    v44 = &_os_log_default;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v45 = *__error();
    v46 = __error();
    v47 = strerror(*v46);
    *(_DWORD *)buf = 67109378;
    v85 = v45;
    v86 = 2080;
    v87 = v47;
    v48 = "bind error: %d (%s)";
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v48, buf, 0x12u);
    goto LABEL_36;
  }
  if (getsockname(*((_DWORD *)v77 + 6), v27, &v80) == -1)
  {
    v49 = &_os_log_default;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v50 = *__error();
    v51 = __error();
    v52 = strerror(*v51);
    *(_DWORD *)buf = 67109378;
    v85 = v50;
    v86 = 2080;
    v87 = v52;
    v48 = "getsockname error: %d (%s)";
    goto LABEL_35;
  }
  v28 = &v96;
  if (v10)
    v28 = (sockaddr *)&v81;
  v29 = *(unsigned __int16 *)v28->sa_data;
  if (listen(*((_DWORD *)v77 + 6), 128) != -1)
  {
    v30 = *((int *)v77 + 6);
    global_queue = dispatch_get_global_queue(0, 0);
    v32 = objc_claimAutoreleasedReturnValue(global_queue);
    v33 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v30, 0, v32);

    if (v33)
    {
      v60 = bswap32(v29) >> 16;
      v34 = -[CPXIDSForwardingProxy initWithServerPort:targetingPort:]([CPXIDSForwardingProxy alloc], "initWithServerPort:targetingPort:");
      if (v34)
      {
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100009860;
        handler[3] = &unk_100014670;
        handler[4] = self;
        v71 = &v76;
        v72 = v12;
        v35 = v14;
        v69 = v35;
        v59 = v15;
        v70 = v59;
        v73 = a7;
        v74 = v8;
        dispatch_source_set_event_handler(v33, handler);
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_1000098C8;
        v61[3] = &unk_100014670;
        v66 = v60;
        v67 = v12;
        v65 = &v76;
        v36 = v35;
        v62 = v36;
        v63 = self;
        v37 = v34;
        v64 = v37;
        dispatch_source_set_cancel_handler(v33, v61);
        dispatch_resume(v33);
        v38 = objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionSourceGroup](self, "connectionSourceGroup"));
        dispatch_group_enter(v38);

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionSources](self, "connectionSources"));
        objc_sync_enter(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionSources](self, "connectionSources"));
        objc_msgSend(v40, "setObject:forKey:", v33, v37);

        objc_sync_exit(v39);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v41 = CFSTR("(ipV4)");
          *(_DWORD *)buf = 67110402;
          v85 = v60;
          v86 = 2048;
          v87 = (char *)v12;
          if (v10)
            v41 = CFSTR("(ipV6)");
          v42 = CFSTR("(Bluetooth)");
          v88 = 2112;
          v89 = v36;
          v90 = 2112;
          if (v8)
            v42 = CFSTR("(WiFi)");
          v91 = v59;
          v92 = 2112;
          v93 = v41;
          v94 = 2112;
          v95 = v42;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Forward port companion %d to gizmo %lu for %@ %@ %@. Client link preference: %@", buf, 0x3Au);
        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v60));

        goto LABEL_45;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v58 = "Failed to create proxied ports object.";
        goto LABEL_43;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v58 = "Failed to create listening dispatch source";
LABEL_43:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v58, buf, 2u);
    }
    close(*((_DWORD *)v77 + 6));
    v43 = 0;
LABEL_45:

    goto LABEL_38;
  }
  v53 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v54 = *__error();
    v55 = __error();
    v56 = strerror(*v55);
    *(_DWORD *)buf = 67109378;
    v85 = v54;
    v86 = 2080;
    v87 = v56;
    v48 = "listen error: %d (%s)";
    goto LABEL_35;
  }
LABEL_36:

  close(*((_DWORD *)v77 + 6));
LABEL_37:
  v43 = 0;
LABEL_38:
  _Block_object_dispose(&v76, 8);

  return v43;
}

- (void)teardownListeningSocket:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionSources](self, "connectionSources"));
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionSources](self, "connectionSources", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "targetPort") == a3)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionSources](self, "connectionSources"));
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

          if (v13)
            dispatch_source_cancel(v13);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

- (void)teardownAllListeningSockets
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSObject *v10;
  dispatch_time_t v11;
  intptr_t v12;
  _BOOL4 v13;
  const char *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionSources](self, "connectionSources"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "There are %lu sources to tear down", buf, 0xCu);
  }
  if (objc_msgSend(v4, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          dispatch_source_cancel(*(dispatch_source_t *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v10 = objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionSourceGroup](self, "connectionSourceGroup", (_QWORD)v16));
    v11 = dispatch_time(0, 3000000000);
    v12 = dispatch_group_wait(v10, v11);

    v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (!v13)
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v14 = "Timed out waiting to cancel all connection sources";
    }
    else
    {
      if (!v13)
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v14 = "Successfully cancelled all connection sources";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
  }
LABEL_17:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionSources](self, "connectionSources"));
  if (objc_msgSend(v15, "count"))
    sub_10000DC78();

}

- (void)acceptConnection:(id)a3 socket:(int)a4 targetPort:(unint64_t)a5 serviceName:(id)a6 requiredHostIP:(id)a7 isLowPriority:(BOOL)a8 preferWifi:(BOOL)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  unint64_t v40;
  int v41;
  BOOL v42;
  BOOL v43;
  char v44;
  socklen_t v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  _BYTE v49[18];
  __int16 v50;
  unint64_t v51;
  sockaddr v52;

  v9 = a8;
  v15 = a3;
  v16 = a6;
  v17 = a7;
  *(_QWORD *)&v52.sa_len = 0;
  *(_QWORD *)&v52.sa_data[6] = 0;
  v45 = 16;
  v44 = 0;
  v18 = accept(a4, &v52, &v45);
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v35 = "Must have a host IP to check against";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
    goto LABEL_20;
  }
  v19 = v18;
  v20 = sub_10000B238(v18, &v44);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if (!v21)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v35 = "createIPStringFromSocket failed";
    goto LABEL_16;
  }
  v22 = v21;
  if (a5 == 62078 || (objc_msgSend(v21, "isEqualToString:", v17) & 1) != 0)
  {
    v36 = v22;
    -[CPXIDSRelayCompanion acquirePort:isLowPriority:preferWifi:](self, "acquirePort:isLowPriority:preferWifi:", a5, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUIDString"));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v47 = v16;
      v48 = 1024;
      *(_DWORD *)v49 = a5;
      *(_WORD *)&v49[4] = 2112;
      *(_QWORD *)&v49[6] = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Accepted a connection for service %@ with target port: %d and sending IDSRelayMessageConnect with UUID: %@", buf, 0x1Cu);
    }
    v25 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", &off_100015318, CFSTR("Type"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v24, CFSTR("UUID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v26, CFSTR("Port"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v27, CFSTR("LowPriority"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v28, CFSTR("Socket"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a9));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v29, CFSTR("PreferWifi"));

    if (v16)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v16, CFSTR("ServiceName"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionMap](self, "connectionMap"));
    objc_msgSend(v30, "setObject:forKey:", v25, v24);

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000A2F4;
    v37[3] = &unk_100014698;
    v37[4] = self;
    v31 = v24;
    v38 = v31;
    v40 = a5;
    v42 = v9;
    v43 = a9;
    v39 = v16;
    v41 = v19;
    v32 = objc_retainBlock(v37);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelay queue](self, "queue"));
    -[CPXIDSRelayCompanion startTimerForUDID:queue:timeout:withErrorCallback:](self, "startTimerForUDID:queue:timeout:withErrorCallback:", v31, v33, 35, v32);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelay sendMessage:messageDictionary:](self, "sendMessage:messageDictionary:", v15, v25));
    if (!v34)
    {
      -[CPXIDSRelayCompanion stopTimerForUDID:](self, "stopTimerForUDID:", v31);
      ((void (*)(_QWORD *))v32[2])(v32);
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v47 = v22;
      v48 = 2112;
      *(_QWORD *)v49 = v17;
      *(_WORD *)&v49[8] = 2112;
      *(_QWORD *)&v49[10] = v16;
      v50 = 2048;
      v51 = a5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Denying host at %@, was expecting %@. Must be same IP that started %@ on %lu.", buf, 0x2Au);
    }

  }
LABEL_20:

}

- (void)handleIDSRelayConnectionResponse:(id)a3 fromID:(id)a4 UUID:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  CPXIDSRelayCompanion *v35;
  id v36;
  __int128 *p_buf;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  unsigned __int8 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  int v60;
  __int128 buf;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _QWORD v66[3];
  _QWORD v67[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceForFromID:", v11));
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_10000A894;
  v47 = sub_10000A8A4;
  v48 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionMap](self, "connectionMap"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v12));

  if (v16)
  {
    -[CPXIDSRelayCompanion stopTimerForUDID:](self, "stopTimerForUDID:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelayCompanion connectionMap](self, "connectionMap"));
    objc_msgSend(v17, "removeObjectForKey:", v12);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("Socket")));
    v19 = objc_msgSend(v18, "intValue");
    *((_DWORD *)v58 + 6) = v19;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("Port")));
    v21 = objc_msgSend(v20, "unsignedIntegerValue");
    v54[3] = (uint64_t)v21;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("LowPriority")));
    v23 = objc_msgSend(v22, "BOOLValue");
    *((_BYTE *)v50 + 24) = v23;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("ServiceName")));
    v25 = (void *)v44[5];
    v44[5] = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("PreferWifi")));
    v27 = objc_msgSend(v26, "BOOLValue");

    v66[0] = IDSOpenSocketOptionTransportKey;
    v66[1] = IDSOpenSocketOptionPriorityKey;
    v67[0] = &off_100015330;
    v67[1] = &off_100015348;
    v66[2] = IDSOpenSocketOptionStreamNameKey;
    v67[2] = v12;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 3));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v62 = 0x3032000000;
    v63 = sub_10000A894;
    v64 = sub_10000A8A4;
    v65 = 0;
    v29 = objc_alloc((Class)IDSDeviceConnection);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10000A8AC;
    v33[3] = &unk_100014708;
    p_buf = &buf;
    v38 = &v57;
    v39 = &v53;
    v34 = v12;
    v35 = self;
    v40 = &v43;
    v41 = &v49;
    v42 = v27;
    v36 = v13;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CPXIDSRelay queue](self, "queue"));
    v31 = objc_msgSend(v29, "initSocketWithDevice:options:completionHandler:queue:", v14, v28, v33, v30);
    v32 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v31;

    _Block_object_dispose(&buf, 8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error locating entry in connection map for %@", (uint8_t *)&buf, 0xCu);
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  unsigned __int16 v17;
  void *v18;
  uint8_t v19[16];
  uint8_t buf[8];
  id v21;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v21 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a5, 0, 0, &v21));
  v15 = v21;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("Type")));
    v17 = (unsigned __int16)objc_msgSend(v16, "intValue");

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("UUID")));
    if (v17 == 2)
    {
      -[CPXIDSRelayCompanion handleIDSRelayConnectionResponse:fromID:UUID:context:](self, "handleIDSRelayConnectionResponse:fromID:UUID:context:", v11, v12, v18, v13);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error: unknown message", v19, 2u);
    }

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error creating dictionary for message", buf, 2u);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (!a6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error occurred sending message (id: %@): %@", (uint8_t *)&v15, 0x16u);
  }

}

- (NSNumber)lockdownPortNum
{
  return self->_lockdownPortNum;
}

- (void)setLockdownPortNum:(id)a3
{
  objc_storeStrong((id *)&self->_lockdownPortNum, a3);
}

- (NSNumber)lockdownPortNumIPV6
{
  return self->_lockdownPortNumIPV6;
}

- (void)setLockdownPortNumIPV6:(id)a3
{
  objc_storeStrong((id *)&self->_lockdownPortNumIPV6, a3);
}

- (NSMutableDictionary)connectionSources
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableDictionary)connectionMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConnectionMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)connectionTimers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConnectionTimers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OS_dispatch_group)connectionSourceGroup
{
  return self->_connectionSourceGroup;
}

- (void)setConnectionSourceGroup:(id)a3
{
  objc_storeStrong((id *)&self->_connectionSourceGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionSourceGroup, 0);
  objc_storeStrong((id *)&self->_connectionTimers, 0);
  objc_storeStrong((id *)&self->_connectionMap, 0);
  objc_storeStrong((id *)&self->_connectionSources, 0);
  objc_storeStrong((id *)&self->_lockdownPortNumIPV6, 0);
  objc_storeStrong((id *)&self->_lockdownPortNum, 0);
}

@end
