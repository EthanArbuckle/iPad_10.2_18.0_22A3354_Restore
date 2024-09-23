@implementation CSRemoteXPCProxy

- (CSRemoteXPCProxy)init
{
  __assert_rtn("-[CSRemoteXPCProxy init]", "CSRemoteXPCProxy.m", 35, "0 && \"Must init CSRemoteXPCProxy using '_initWithDevice'\");
}

- (id)_initWithDevice:(id)a3 forDiagnosticID:(id)a4
{
  id v7;
  id v8;
  CSRemoteXPCProxy *v9;
  CSRemoteXPCProxy *v10;
  OS_xpc_remote_connection *connection;
  OS_dispatch_group *remoteGroup;
  CSRemoteXPCProxy *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v24.receiver = self;
    v24.super_class = (Class)CSRemoteXPCProxy;
    v9 = -[CSProxy init](&v24, "init");
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_device, a3);
      connection = v10->_connection;
      v10->_connection = 0;

      remoteGroup = v10->_remoteGroup;
      v10->_remoteGroup = 0;

      -[CSProxy setDiagnosticID:](v10, "setDiagnosticID:", v8);
    }
    self = v10;
    v13 = self;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "logSubsystem"));

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10005FEEC(v15, v16, v17, v18, v19, v20, v21, v22);

    v13 = 0;
  }

  return v13;
}

+ (id)getProxiesForDiagnosticID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getRemoteUUIDsForDiagnosticID:", v3));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSRemoteXPCProxy getRemoteDeviceForUUIDStr:](CSRemoteXPCProxy, "getRemoteDeviceForUUIDStr:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11), (_QWORD)v19));
        if (v12)
        {
          v13 = -[CSRemoteXPCProxy _initWithDevice:forDiagnosticID:]([CSRemoteXPCProxy alloc], "_initWithDevice:forDiagnosticID:", v12, v3);
          objc_msgSend(v4, "addObject:", v13);

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "logSubsystem"));

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134217984;
    v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: getProxies found total: %lu", buf, 0xCu);
  }

  v17 = objc_msgSend(v4, "copy");
  return v17;
}

- (void)safeLeaveRemoteGroup
{
  void *v2;
  NSObject *v3;
  CSRemoteXPCProxy *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy remoteGroup](obj, "remoteGroup"));

  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy remoteGroup](obj, "remoteGroup"));
    dispatch_group_leave(v3);

  }
  -[CSRemoteXPCProxy setRemoteGroup:](obj, "setRemoteGroup:", 0);
  objc_sync_exit(obj);

}

+ (id)getRemoteDeviceForUUIDStr:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  unsigned __int8 *v18;
  uuid_t uu;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    memset(uu, 0, sizeof(uu));
    v5 = objc_retainAutorelease(v3);
    v6 = uuid_parse((const char *)objc_msgSend(v5, "UTF8String"), uu);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "logSubsystem"));

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412546;
        v16 = (const char *)v5;
        v17 = 2048;
        v18 = (unsigned __int8 *)v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: uuid_parse failed to parse '%@' and returned %lu. Returning NULL for remote device", (uint8_t *)&v15, 0x16u);
      }
      v10 = 0;
    }
    else
    {
      v10 = (void *)remote_device_copy_device_with_uuid(uu);
      if (v10)
        goto LABEL_11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "logSubsystem"));

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412546;
        v16 = (const char *)v5;
        v17 = 2080;
        v18 = uu;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: remote_device_copy_device_with_uuid failed for UUID '%@' (uuid_t '%s'). Returning NULL", (uint8_t *)&v15, 0x16u);
      }
    }

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logSubsystem"));

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "+[CSRemoteXPCProxy getRemoteDeviceForUUIDStr:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: nil UUID str given to %s, returning NULL for remote device", (uint8_t *)&v15, 0xCu);
    }

    v10 = 0;
  }
LABEL_11:

  return v10;
}

+ (id)getUUIDStrForRemoteDevice:(id)a3
{
  char *v3;
  char *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  unsigned __int8 uu[8];
  uint64_t v14;

  *(_QWORD *)uu = 0;
  v14 = 0;
  remote_device_copy_uuid(a3, uu);
  v3 = (char *)malloc_type_calloc(0x25uLL, 1uLL, 0x100004077774924uLL);
  if (v3)
  {
    v4 = v3;
    uuid_unparse(uu, v3);
    if (!strncmp(v4, "00000000-0000-0000-0000-000000000000", 0x25uLL))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logSubsystem"));

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failed to parse device uuid - not appending remote UUID", (uint8_t *)&v11, 2u);
      }

      v5 = 0;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
    }
    free(v4);
    return v5;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "logSubsystem"));

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "+[CSRemoteXPCProxy getUUIDStrForRemoteDevice:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failed to allocate uuidStr in %s", (uint8_t *)&v11, 0xCu);
    }

    return 0;
  }
}

+ (BOOL)isDeviceWithUUIDAvailable:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSRemoteXPCProxy getRemoteDeviceForUUIDStr:](CSRemoteXPCProxy, "getRemoteDeviceForUUIDStr:", a3));
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)isHost
{
  if (+[CSDisplayProxy isHost](CSDisplayProxy, "isHost")
    || +[CSCoreDeviceProxy isHost](CSCoreDeviceProxy, "isHost"))
  {
    return 1;
  }
  else
  {
    return sub_100046500();
  }
}

+ (id)description
{
  if (+[CSRemoteXPCProxy isHost](CSRemoteXPCProxy, "isHost"))
    return CFSTR("RemoteXPCProxyRemote");
  else
    return CFSTR("RemoteXPCProxyHost");
}

- (unint64_t)getTimeoutSec
{
  void *v2;
  NSObject *v3;
  int v5;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "logSubsystem"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = 900;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: timeout target requested. Using %lus", (uint8_t *)&v5, 0xCu);
  }

  return 900;
}

- (unint64_t)getTimeoutTarget
{
  void *v3;
  unsigned int v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v4 = objc_msgSend(v3, "noTimeout");

  if (!v4)
    return dispatch_time(0, 1000000000 * -[CSRemoteXPCProxy getTimeoutSec](self, "getTimeoutSec"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "logSubsystem"));

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: timeout target requested. noTimeout is set - using DISPATCH_TIME_FOREVER", v8, 2u);
  }

  return dispatch_time(0, -1);
}

+ (void)handleClientEvent:(id)a3 forMsg:(id)a4 isTrusted:(BOOL)a5
{
  id v7;
  char *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  CFTypeRef CFProperty;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  unsigned __int8 v22;
  dispatch_queue_global_t global_queue;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  _QWORD v29[4];
  char *v30;
  id v31;
  uint8_t buf[4];
  const char *v33;

  v7 = a3;
  v8 = (char *)a4;
  if (xpc_dictionary_get_BOOL(v8, "initiatedByRemoteHost") && !a5)
  {
    if (sub_10004649C())
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logSubsystem"));

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v11 = "CSRemoteXPCProxy: Allowing remote invocation because we are on an Apple Display";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      }
    }
    else
    {
      if (!sub_100023500())
      {
        if (qword_1000B9868 != -1)
          dispatch_once(&qword_1000B9868, &stru_100099AD8);
        if (dword_1000B9860)
        {
          CFProperty = IORegistryEntryCreateCFProperty(dword_1000B9860, CFSTR("stress-rack"), 0, 0);
          if (CFProperty)
          {
            CFRelease(CFProperty);
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
            v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "logSubsystem"));

            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v11 = "CSRemoteXPCProxy: Allowing remote invocation because we are on a stress rack device";
              goto LABEL_24;
            }
            goto LABEL_25;
          }
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "logSubsystem"));

          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v33 = "BOOL isStressRackDevice(void)";
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: NVRAM is not supported on this system. Returning NO for %s", buf, 0xCu);
          }

        }
        if (!sub_100046500())
        {
          v18 = sub_100046900();
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "logSubsystem"));

          v20 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          if (!v18)
          {
            if (v20)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Returning default value of NO for RSD invocation", buf, 2u);
            }

            v28 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
            v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "logSubsystem"));

            if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              goto LABEL_31;
            *(_DWORD *)buf = 138412290;
            v33 = v8;
            v27 = "CSRemoteXPCProxy: Can't act as remote device. Rejecting request for message: %@";
            goto LABEL_30;
          }
          if (!v20)
            goto LABEL_25;
          *(_WORD *)buf = 0;
          v11 = "CSRemoteXPCProxy: Allowing remote invocation because on compute module C";
          goto LABEL_24;
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "logSubsystem"));

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v11 = "CSRemoteXPCProxy: Allowing remote invocation because on compute module B";
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "logSubsystem"));

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v11 = "CSRemoteXPCProxy: Allowing remote invocation because we are on a darwinOS iOS VM";
        goto LABEL_24;
      }
    }
LABEL_25:

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v22 = objc_msgSend(v21, "tryStartRemoteInitiatedFlowForMsg:", v8);

  if ((v22 & 1) == 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "logSubsystem"));

    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
LABEL_31:

      xpc_remote_connection_cancel(v7);
      goto LABEL_32;
    }
    *(_DWORD *)buf = 138412290;
    v33 = v8;
    v27 = "CSRemoteXPCProxy: Failed to start remote initiated flow. Cancelling connection for message: %@";
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
    goto LABEL_31;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v24 = objc_claimAutoreleasedReturnValue(global_queue);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10002DD28;
  v29[3] = &unk_100099260;
  v30 = v8;
  v31 = v7;
  dispatch_async(v24, v29);

LABEL_32:
}

+ (void)handleRemoteConnection:(id)a3 forMsg:(id)a4 isTrusted:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  unsigned __int16 uint64;
  unsigned __int16 v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  v5 = a5;
  v7 = a3;
  v8 = a4;
  uint64 = xpc_dictionary_get_uint64(v8, "MSG_TYPE");
  v10 = xpc_dictionary_get_uint64(v8, "RESPONSE_TYPE");
  if (!uint64)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logSubsystem"));

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Unknown message type. Mismatched os versions.", buf, 2u);
    }

    if (v10 - 1 >= 2)
      uint64 = 1;
    else
      uint64 = 2;
  }
  v13 = uint64;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v15 = v14;
  if (v13 == 1)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "logSubsystem"));

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Deduced msg type: Request, triggering local sysdiagnose", v24, 2u);
    }

    +[CSRemoteXPCProxy handleClientEvent:forMsg:isTrusted:](CSRemoteXPCProxy, "handleClientEvent:forMsg:isTrusted:", v7, v8, v5);
  }
  else
  {
    v17 = objc_msgSend(v14, "isHost");

    if (v13 == 2 && v17)
    {
      v18 = v10;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "logSubsystem"));

      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18 == 1)
      {
        if (v21)
        {
          *(_WORD *)v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Deduced response type: success. Asking for file from remote", v23, 2u);
        }

        +[CSRemoteXPCProxy receiveFileFromRemote:forDiagnosticID:withCompletionBlock:](CSRemoteXPCProxy, "receiveFileFromRemote:forDiagnosticID:withCompletionBlock:", v8, 0, &stru_100099A20);
      }
      else
      {
        if (v21)
        {
          *(_WORD *)v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Deduced response type: failure", v22, 2u);
        }

      }
    }
  }

}

+ (void)initRemoteServers
{
  dispatch_queue_t v2;
  void *remote_service_listener;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = dispatch_queue_create("com.apple.sysdiagnose.cosysdiagnose.CSRemoteXPCProxy", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener("com.apple.sysdiagnose.remote", v2, 0);
  xpc_remote_connection_set_event_handler(remote_service_listener, &stru_100099A40);
  xpc_remote_connection_activate(remote_service_listener);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logSubsystem"));

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Remote server initialized.", v6, 2u);
  }

}

+ (void)receiveFileFromRemote:(id)a3 forDiagnosticID:(id)a4 withCompletionBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  xpc_object_t value;
  void *v11;
  id v12;
  const char *string;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  char *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  id v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  void (**v65)(_QWORD);
  id v66;
  NSFileAttributeKey v67;
  _UNKNOWN **v68;
  uint8_t buf[4];
  char *v70;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  value = xpc_dictionary_get_value(v7, "FILE_TX");
  v11 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (v11)
  {
    v12 = v7;
    string = xpc_dictionary_get_string(v12, "FILE_NAME");
    if (!string)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "logSubsystem"));

      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_10005FFC4(v30, v31, v32, v33, v34, v35, v36, v37);
      v38 = 0;
      goto LABEL_27;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));

    if (!sub_10002EAB0(v15))
    {
      v16 = xpc_dictionary_get_string(v12, "udid");
      if (v16)
      {
        v17 = v16;
        v18 = (void *)remote_device_copy_device_with_name();
        v61 = v8;
        if (!v18)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
          v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "logSubsystem"));

          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v70 = (char *)v17;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failed to fetch device for UDID '%s'. Not appending remote UUID", buf, 0xCu);
          }

          v30 = v15;
          goto LABEL_26;
        }
        v19 = objc_claimAutoreleasedReturnValue(+[CSRemoteXPCProxy getUUIDStrForRemoteDevice:](CSRemoteXPCProxy, "getUUIDStrForRemoteDevice:", v18));
        v60 = (void *)v19;
        if (v19)
        {
          v20 = v19;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByDeletingPathExtension"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByDeletingPathExtension"));

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingFormat:", CFSTR("_%@.tar.gz"), v20));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "logSubsystem"));

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v70 = (char *)v15;
            v25 = "CSRemoteXPCProxy: Found remote UUID. New tarball name: %@";
LABEL_24:
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
          }
        }
        else
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "logSubsystem"));

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v70 = (char *)v17;
            v25 = "CSRemoteXPCProxy: Failed to fetch uuidStr for device with UDID '%s'. Not appending remote UUID";
            goto LABEL_24;
          }
        }

        v30 = v15;
LABEL_26:
        v8 = v61;

        v38 = v30;
        goto LABEL_27;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "logSubsystem"));

      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v70 = (char *)v15;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: UDID not found in xpc dict for name: %@ - assuming legacy client and not appending remote UUID", buf, 0xCu);
      }

    }
    v30 = v15;
    v38 = v30;
LABEL_27:

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "waitForHostOutputDirForDiagnosticID:", v8));

    if (v45)
    {
      if (!sub_10002EAB0(v38))
      {
        v62 = v8;
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "stringByAppendingPathComponent:", CFSTR("/co-sysdiagnoses/")));
        v67 = NSFilePosixPermissions;
        v68 = &off_1000ACE30;
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
        v66 = 0;
        v49 = objc_msgSend(v46, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v47, 1, v48, &v66);
        v50 = v66;

        if (v49)
        {
          v51 = v45;
          v45 = v47;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_10005FF1C((uint64_t)v47, v50);
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedDescription"));
          objc_msgSend(v54, "stderrWrite:", CFSTR("Unable to create co-sysdiagnose directory at: %@ with error: %@"), v47, v55);

          v51 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedDescription"));
          objc_msgSend(v51, "log:", CFSTR("Unable to create co-sysdiagnose directory at: %@ with error: %@"), v47, v56);

        }
        v8 = v62;
      }
      v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "stringByAppendingPathComponent:", v38)));
      v58 = objc_msgSend(v57, "fileSystemRepresentation");
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_10002EAF4;
      v63[3] = &unk_100099A68;
      v64 = v57;
      v65 = v9;
      v59 = v57;
      xpc_file_transfer_write_to_path(v11, v58, v63);

    }
    else
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "logSubsystem"));

      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v70 = (char *)v38;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failed to write remote archive %@ because host dir is not set", buf, 0xCu);
      }

      v9[2](v9);
    }

    goto LABEL_40;
  }
  v26 = xpc_copy_description(v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "logSubsystem"));

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v70 = v26;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Did not receive any file transfer object. Got xpc response: %s", buf, 0xCu);
  }

  free(v26);
  v9[2](v9);
LABEL_40:

}

+ (void)remoteSendFile:(id)a3 toPeer:(id)a4 withTimeoutTarget:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  dispatch_group_t v11;
  id v12;
  char *v13;
  const char *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  NSObject *v35;
  uint8_t buf[4];
  id v37;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logSubsystem"));

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Transferring %@ to host", buf, 0xCu);
  }

  v11 = dispatch_group_create();
  v12 = objc_retainAutorelease(v7);
  v13 = basename((char *)objc_msgSend(v12, "fileSystemRepresentation"));
  if (v13)
  {
    v14 = v13;
    v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v15, "MSG_TYPE", 2uLL);
    xpc_dictionary_set_uint64(v15, "RESPONSE_TYPE", 1uLL);
    xpc_dictionary_set_string(v15, "FILE_NAME", v14);
    v16 = sub_100023718();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = v17;
    if (v17)
      xpc_dictionary_set_string(v15, "udid", (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
    v19 = objc_msgSend(objc_retainAutorelease(v12), "fileSystemRepresentation");
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10002EF68;
    v34[3] = &unk_100099A90;
    v20 = v11;
    v35 = v20;
    v21 = (void *)xpc_file_transfer_create_with_path(v19, v34);
    if (v21)
    {
      dispatch_group_enter(v20);
      xpc_dictionary_set_value(v15, "FILE_TX", v21);
      xpc_remote_connection_send_message(v8, v15);
      if (!a5 || !dispatch_group_wait(v20, a5))
        goto LABEL_17;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "logSubsystem"));

      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v24 = "CSRemoteXPCProxy: Timed out waiting to send file to host";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
      }
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "logSubsystem"));

      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v24 = "CSRemoteXPCProxy: Couldn't create transfer object. Skipping file transfer";
        goto LABEL_15;
      }
    }

LABEL_17:
    goto LABEL_18;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "logSubsystem"));

  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_10005FFF4(v15, v26, v27, v28, v29, v30, v31, v32);
LABEL_18:

}

+ (id)getService:(const char *)a3 forDevice:(id)a4
{
  id v5;
  uint64_t name;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;

  v5 = a4;
  name = remote_device_get_name();
  if (remote_device_get_state(v5) == 2)
  {
    v7 = remote_device_copy_service(v5, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "logSubsystem"));

    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        v14 = 136315394;
        v15 = a3;
        v16 = 2080;
        v17 = name;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Found service '%s' on connected device '%s'. Device is usable", (uint8_t *)&v14, 0x16u);
      }

      v7 = v7;
      v11 = v7;
    }
    else
    {
      if (v10)
      {
        v14 = 136315394;
        v15 = a3;
        v16 = 2080;
        v17 = name;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Service '%s' not found for device %s", (uint8_t *)&v14, 0x16u);
      }

      v11 = 0;
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "logSubsystem"));

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = (const char *)name;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Device %s not connected", (uint8_t *)&v14, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3 forServiceName:(const char *)a4
{
  id v6;
  void *v7;
  uint64_t type;
  uint64_t description;
  void *v10;
  void *v11;
  dispatch_queue_global_t global_queue;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  dispatch_group_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  char *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  BOOL v30;
  void *v31;
  NSObject *v32;
  _QWORD v34[6];
  uint8_t buf[4];
  char *v36;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy device](self, "device"));
  type = remote_device_get_type();

  description = remote_device_type_get_description(type);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy device](self, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSRemoteXPCProxy getService:forDevice:](CSRemoteXPCProxy, "getService:forDevice:", a4, v10));

  if (!v11)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "logSubsystem"));

    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failing to trigger co-sysdiagnose: device is not usable", buf, 2u);
    }

    goto LABEL_18;
  }
  global_queue = dispatch_get_global_queue(25, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v14 = (void *)xpc_remote_connection_create_with_remote_service(v11, v13, 0);
  -[CSRemoteXPCProxy setConnection:](self, "setConnection:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "logSubsystem"));

  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (!v15)
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failing to trigger co-sysdiagnose: failed to create remote xpc connection", buf, 2u);
    }

LABEL_18:
    v30 = 0;
    goto LABEL_19;
  }
  if (v18)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Triggering co-sysdiagnose", buf, 2u);
  }

  -[CSRemoteXPCProxy safeLeaveRemoteGroup](self, "safeLeaveRemoteGroup");
  v19 = dispatch_group_create();
  -[CSRemoteXPCProxy setRemoteGroup:](self, "setRemoteGroup:", v19);

  v20 = objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy remoteGroup](self, "remoteGroup"));
  dispatch_group_enter(v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10002F680;
  v34[3] = &unk_100099AB8;
  v34[4] = self;
  v34[5] = description;
  xpc_remote_connection_set_event_handler(v21, v34);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));
  xpc_remote_connection_activate(v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  LODWORD(v21) = objc_msgSend(v23, "isHost");

  if ((_DWORD)v21)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "logSubsystem"));

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Forcing remote to not act as host", buf, 2u);
    }

    xpc_dictionary_set_BOOL(v6, "initiatedByRemoteHost", 1);
  }
  xpc_dictionary_set_uint64(v6, "MSG_TYPE", 1uLL);
  xpc_dictionary_set_uint64(v6, "REQUEST_TYPE", 1uLL);
  v26 = xpc_copy_description(v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "logSubsystem"));

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = v26;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Forwarding to remote device: %s", buf, 0xCu);
  }

  free(v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));
  xpc_remote_connection_send_message(v29, v6);

  v30 = 1;
LABEL_19:

  return v30;
}

- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3
{
  return -[CSRemoteXPCProxy triggerCoSysdiagnoseWithParams:forServiceName:](self, "triggerCoSysdiagnoseWithParams:forServiceName:", a3, "com.apple.sysdiagnose.remote");
}

- (void)cancelConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));
    xpc_remote_connection_cancel(v4);

  }
  -[CSRemoteXPCProxy setConnection:](self, "setConnection:", 0);
}

- (void)handleRemoteResponse:(id)a3
{
  id v4;
  unsigned __int16 uint64;
  unsigned __int16 v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  uint64 = xpc_dictionary_get_uint64(v4, "REQUEST_TYPE");
  v6 = xpc_dictionary_get_uint64(v4, "RESPONSE_TYPE");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "logSubsystem"));

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = sub_1000239A4(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = sub_10002397C(uint64);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412546;
    v22 = v10;
    v23 = 2112;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Received response: %@ from remote for request: %@", buf, 0x16u);

  }
  if (v6 == 2)
  {
    v14 = xpc_dictionary_get_uint64(v4, "FAILURE_REASON");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "logSubsystem"));

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = sub_100022C74(v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Failed response from remote, error: %@", buf, 0xCu);

    }
    goto LABEL_10;
  }
  if (v6 != 1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "logSubsystem"));

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Unknown response type received: %d", buf, 8u);
    }
LABEL_10:

    -[CSRemoteXPCProxy safeLeaveRemoteGroup](self, "safeLeaveRemoteGroup");
    goto LABEL_11;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSProxy diagnosticID](self, "diagnosticID"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002FB14;
  v20[3] = &unk_100098F88;
  v20[4] = self;
  +[CSRemoteXPCProxy receiveFileFromRemote:forDiagnosticID:withCompletionBlock:](CSRemoteXPCProxy, "receiveFileFromRemote:forDiagnosticID:withCompletionBlock:", v4, v13, v20);

LABEL_11:
}

- (void)waitToReceiveCoSysdiagnose
{
  void *v3;
  void *v4;
  NSObject *v5;
  intptr_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  void *v11;
  void *v12;
  __int16 v13;
  uint8_t buf[2];
  __int16 v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy remoteGroup](self, "remoteGroup"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));

    if (v4)
    {
      v5 = objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy remoteGroup](self, "remoteGroup"));
      v6 = dispatch_group_wait(v5, -[CSRemoteXPCProxy getTimeoutTarget](self, "getTimeoutTarget"));

      if (!v6)
        return;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "logSubsystem"));

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 0;
        v9 = "CSRemoteXPCProxy: Timed out waiting for remote co-sysdiagnose";
        v10 = (uint8_t *)&v13;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "logSubsystem"));

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "CSRemoteXPCProxy: self.connection is nil - connection has been cancelled. Skipping waiting";
        v10 = buf;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logSubsystem"));

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v9 = "CSRemoteXPCProxy: Remote sysdiagnose wasn't triggered or is done transferring. Skipping waiting";
      v10 = (uint8_t *)&v15;
      goto LABEL_10;
    }
  }

}

- (void)transferFileToHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));
    +[CSRemoteXPCProxy remoteSendFile:toPeer:withTimeoutTarget:](CSRemoteXPCProxy, "remoteSendFile:toPeer:withTimeoutTarget:", v4, v6, -[CSRemoteXPCProxy getTimeoutTarget](self, "getTimeoutTarget"));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "logSubsystem"));

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Didn't create connection to host - stopping file transfer", v9, 2u);
    }

  }
}

- (OS_dispatch_group)remoteGroup
{
  return self->_remoteGroup;
}

- (void)setRemoteGroup:(id)a3
{
  objc_storeStrong((id *)&self->_remoteGroup, a3);
}

- (OS_remote_device)device
{
  return (OS_remote_device *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_xpc_remote_connection)connection
{
  return (OS_xpc_remote_connection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_remoteGroup, 0);
}

@end
