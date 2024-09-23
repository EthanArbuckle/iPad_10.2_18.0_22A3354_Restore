@implementation CSCoreDeviceProxy

+ (BOOL)isHost
{
  return 0;
}

+ (id)description
{
  if (+[CSCoreDeviceProxy isHost](CSCoreDeviceProxy, "isHost"))
    return CFSTR("CoreDeviceProxyRemote");
  else
    return CFSTR("CoreDeviceProxyHost");
}

+ (void)initRemoteServers
{
  dispatch_queue_t v2;
  void *remote_service_listener;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = dispatch_queue_create("com.apple.sysdiagnose.cosysdiagnose.CSCoreDeviceProxy", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener("com.apple.sysdiagnose.remote.trusted", v2, 0);
  xpc_remote_connection_set_event_handler(remote_service_listener, &stru_100099ED8);
  xpc_remote_connection_activate(remote_service_listener);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logSubsystem"));

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Remote server initialized.", v6, 2u);
  }

}

+ (id)getProxiesForDiagnosticID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  dispatch_semaphore_t v11;
  dispatch_queue_global_t global_queue;
  void *v13;
  NSObject *v14;
  id v15;
  dispatch_time_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t description;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  _QWORD v29[4];
  NSObject *v30;
  id v31;
  id v32;
  uint8_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t v43[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v7 = objc_msgSend(v6, "getCollectAllTrustedForDiagnosticID:", v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "logSubsystem"));

  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) == 0)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Did not detect the --collectAllTrusted flag, skipping proxies", buf, 2u);
    }

    v25 = objc_msgSend(v5, "copy");
    goto LABEL_18;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Detected --collectAllTrusted flag, beginning to find all proxies of connected devices", buf, 2u);
  }

  if ((objc_msgSend(a1, "isHost") & 1) == 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "logSubsystem"));

    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Proxy is not host, skipping browseDevices", buf, 2u);
    }

    v25 = objc_msgSend(v5, "copy");
LABEL_18:
    v24 = v25;
    goto LABEL_19;
  }
  v11 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  v40 = buf;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10005166C;
  v29[3] = &unk_100099F00;
  v14 = v11;
  v30 = v14;
  v33 = buf;
  v34 = &v35;
  v31 = v4;
  v15 = v5;
  v32 = v15;
  remote_device_browse_present(10, v13, v29);

  v16 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v14, v16))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "logSubsystem"));

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10006267C(v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "logSubsystem"));

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *((_QWORD *)v40 + 3);
    v22 = v36[3];
    description = remote_device_type_get_description(10);
    *(_DWORD *)v43 = 134218498;
    v44 = v21;
    v45 = 2048;
    v46 = v22;
    v47 = 2080;
    v48 = description;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Finished browsing. Found %lu devices (%lu usable) of type %s", v43, 0x20u);
  }

  v24 = objc_msgSend(v15, "copy");
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

LABEL_19:
  return v24;
}

- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3
{
  return -[CSRemoteXPCProxy triggerCoSysdiagnoseWithParams:forServiceName:](self, "triggerCoSysdiagnoseWithParams:forServiceName:", a3, "com.apple.sysdiagnose.remote.trusted");
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
    v6 = 60;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: timeout target requested. Using %lus", (uint8_t *)&v5, 0xCu);
  }

  return 60;
}

@end
