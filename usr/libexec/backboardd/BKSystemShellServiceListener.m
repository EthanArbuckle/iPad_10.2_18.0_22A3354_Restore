@implementation BKSystemShellServiceListener

- (BKSystemShellServiceListener)initWithSentinel:(id)a3
{
  id v5;
  BKSystemShellServiceListener *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  BKSystemShellServiceListener *v11;
  uint64_t v12;
  BSServiceConnectionListener *connectionListener;
  BKSystemShellServiceListener *v14;
  uint64_t v15;
  BSServiceConnectionListener *dataMigrationCheckInListener;
  _QWORD v18[4];
  BKSystemShellServiceListener *v19;
  _QWORD v20[4];
  BKSystemShellServiceListener *v21;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BKSystemShellServiceListener;
  v6 = -[BKSystemShellServiceListener init](&v22, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BSDispatchQueueAttributes serial](BSDispatchQueueAttributes, "serial"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceClass:", 25));
    v9 = BSDispatchQueueCreate(CFSTR("com.apple.backboard.systemshell"), v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_systemShellSentinel, a3);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000219AC;
    v20[3] = &unk_1000ECEE0;
    v11 = v6;
    v21 = v11;
    v12 = objc_claimAutoreleasedReturnValue(+[BSServiceConnectionListener listenerWithConfigurator:](BSServiceConnectionListener, "listenerWithConfigurator:", v20));
    connectionListener = v11->_connectionListener;
    v11->_connectionListener = (BSServiceConnectionListener *)v12;

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100021A10;
    v18[3] = &unk_1000ECEE0;
    v14 = v11;
    v19 = v14;
    v15 = objc_claimAutoreleasedReturnValue(+[BSServiceConnectionListener listenerWithConfigurator:](BSServiceConnectionListener, "listenerWithConfigurator:", v18));
    dataMigrationCheckInListener = v14->_dataMigrationCheckInListener;
    v14->_dataMigrationCheckInListener = (BSServiceConnectionListener *)v15;

  }
  return v6;
}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (void)activateForDataMigration
{
  -[BSServiceConnectionListener activate](self->_dataMigrationCheckInListener, "activate");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v9;
  id v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  BSServiceConnectionListener *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  BKSystemShellServiceListener *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;

  v18 = (BSServiceConnectionListener *)a3;
  v9 = a4;
  v10 = a5;
  if (self->_connectionListener == v18)
  {
    -[BKSystemShellServiceListener _shellListener:didReceiveConnection:withContext:](self, "_shellListener:didReceiveConnection:withContext:");
    goto LABEL_5;
  }
  if (self->_dataMigrationCheckInListener == v18)
  {
    -[BKSystemShellServiceListener _dataMigrationCheckInListener:didReceiveConnection:withContext:](self, "_dataMigrationCheckInListener:didReceiveConnection:withContext:");
LABEL_5:

    return;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("shouldn't be here")));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v15 = (objc_class *)objc_opt_class(self, v14);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138544642;
    v20 = v13;
    v21 = 2114;
    v22 = v17;
    v23 = 2048;
    v24 = self;
    v25 = 2114;
    v26 = CFSTR("BKSystemShellServiceListener.m");
    v27 = 1024;
    v28 = 81;
    v29 = 2114;
    v30 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
  __break(0);
}

- (BOOL)_remoteProcessIsAlreadyConnected:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  __int128 v8;
  __int128 v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "auditToken"));
  v5 = v4;
  v8 = 0u;
  v9 = 0u;
  if (v4)
    objc_msgSend(v4, "realToken", v8, v9);
  v6 = -[BKSystemShellSentinel auditTokenRepresentsSystemApp:](self->_systemShellSentinel, "auditTokenRepresentsSystemApp:", &v8);

  return v6;
}

- (void)_activateConnection:(id)a3 withContext:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  void *v33;

  v6 = a3;
  v7 = BKSSystemShellConnectionContextKeyLaunchJobLabel;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "decodeStringForKey:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "decodeStringForKey:", BKSSystemShellConnectionContextKeyBundlePath));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "decodeStringForKey:", BKSSystemShellConnectionContextKeyBundleID));
  objc_msgSend(v8, "decodeDoubleForKey:", BKSSystemShellConnectionContextKeyIdleSleepInterval);
  v13 = v12;
  v14 = objc_msgSend(v8, "decodeInt64ForKey:", BKSSystemShellConnectionContextKeyWatchdogType);

  if (!v9)
  {
    v17 = BKLogSystemShell();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v19 = "missing jobLabel";
    goto LABEL_12;
  }
  if (!v10)
  {
    v20 = BKLogSystemShell();
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v19 = "missing bundlePath";
    goto LABEL_12;
  }
  if (!v11)
  {
    v21 = BKLogSystemShell();
    v18 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v19 = "missing bundleIdentifier";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
LABEL_13:

    if ((unint64_t)v14 < 2)
    {
LABEL_17:
      objc_msgSend(v6, "invalidate");
      goto LABEL_18;
    }
LABEL_14:
    v22 = BKLogSystemShell();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<unknown:%lX>"), v14));
      *(_DWORD *)buf = 138543362;
      v33 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "we don't handle this watchdogType:%{public}@", buf, 0xCu);

    }
    goto LABEL_17;
  }
  if ((unint64_t)v14 >= 2)
    goto LABEL_14;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100021914;
  v25[3] = &unk_1000E9C90;
  v26 = v11;
  v27 = v10;
  v28 = v9;
  v30 = v13;
  v31 = v14;
  v15 = v6;
  v29 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellDescriptor build:](BKSystemShellDescriptor, "build:", v25));
  -[BKSystemShellSentinel systemShellDidConnect:connection:](self->_systemShellSentinel, "systemShellDidConnect:connection:", v16, v15);
  objc_msgSend(v15, "activate");

LABEL_18:
}

- (BOOL)_validateConnection:(id)a3 withContext:(id)a4 forListenerLabel:(id)a5
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  _BYTE v21[14];

  v6 = a3;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteProcess"));
  v9 = objc_msgSend(v8, "pid");
  v10 = BKLogSystemShell();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138543874;
    v19 = v7;
    v20 = 2114;
    *(_QWORD *)v21 = v6;
    *(_WORD *)&v21[8] = 1024;
    *(_DWORD *)&v21[10] = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] received connection -- %{public}@ pid:%d", (uint8_t *)&v18, 0x1Cu);
  }

  if (v9 <= 0)
  {
    v13 = BKLogSystemShell();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 138543874;
      v19 = v7;
      v20 = 1024;
      *(_DWORD *)v21 = v9;
      *(_WORD *)&v21[4] = 2114;
      *(_QWORD *)&v21[6] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] dropping connection with junk pid (%d) -- %{public}@, ", (uint8_t *)&v18, 0x1Cu);
    }

    objc_msgSend(v6, "invalidate");
    goto LABEL_12;
  }
  if ((objc_msgSend(v8, "hasEntitlement:", BKBackBoardClientEntitlement) & 1) == 0)
  {
    v15 = BKLogSystemShell();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 138543618;
      v19 = v7;
      v20 = 2114;
      *(_QWORD *)v21 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{public}@] '%{public}@' is not a system shell", (uint8_t *)&v18, 0x16u);
    }

LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 1;
LABEL_13:

  return v12;
}

- (void)_dataMigrationCheckInListener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  BKSystemShellServiceListener *v18;
  uint8_t buf[4];
  void *v20;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteProcess"));
  v8 = -[BKSystemShellServiceListener _remoteProcessIsAlreadyConnected:](self, "_remoteProcessIsAlreadyConnected:", v7);

  if (v8)
  {
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_100021624;
    v16 = &unk_1000E9CD8;
    v9 = v6;
    v17 = v9;
    v18 = self;
    objc_msgSend(v9, "configureConnection:", &v13);
    objc_msgSend(v9, "activate", v13, v14, v15, v16);

  }
  else
  {
    v10 = BKLogSystemShell();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteProcess"));
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[DataMigrationCheckIn] unknown system shell:'%{public}@'", buf, 0xCu);

    }
    objc_msgSend(v6, "invalidate");
  }

}

- (void)_shellListener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BKSystemShellServiceListener *v12;

  v9 = a4;
  v7 = a5;
  if (-[BKSystemShellServiceListener _validateConnection:withContext:forListenerLabel:](self, "_validateConnection:withContext:forListenerLabel:", v9, v7, CFSTR("Shell")))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100021274;
    v10[3] = &unk_1000E9CD8;
    v8 = v9;
    v11 = v8;
    v12 = self;
    objc_msgSend(v8, "configureConnection:", v10);
    -[BKSystemShellServiceListener _activateConnection:withContext:](self, "_activateConnection:withContext:", v8, v7);

  }
  else
  {
    objc_msgSend(v9, "invalidate");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemShellSentinel, 0);
  objc_storeStrong((id *)&self->_dataMigrationCheckInListener, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

@end
