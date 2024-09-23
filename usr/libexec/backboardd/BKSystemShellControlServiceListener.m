@implementation BKSystemShellControlServiceListener

- (BKSystemShellControlServiceListener)initWithSentinel:(id)a3
{
  id v5;
  BKSystemShellControlServiceListener *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  BKSystemShellControlServiceListener *v11;
  uint64_t v12;
  BSServiceConnectionListener *connectionListener;
  _QWORD v15[4];
  BKSystemShellControlServiceListener *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BKSystemShellControlServiceListener;
  v6 = -[BKSystemShellControlServiceListener init](&v17, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BSDispatchQueueAttributes serial](BSDispatchQueueAttributes, "serial"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceClass:", 25));
    v9 = BSDispatchQueueCreate(CFSTR("com.apple.backboard.systemshell-control"), v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_systemShellSentinel, a3);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100094AEC;
    v15[3] = &unk_1000ECEE0;
    v11 = v6;
    v16 = v11;
    v12 = objc_claimAutoreleasedReturnValue(+[BSServiceConnectionListener listenerWithConfigurator:](BSServiceConnectionListener, "listenerWithConfigurator:", v15));
    connectionListener = v11->_connectionListener;
    v11->_connectionListener = (BSServiceConnectionListener *)v12;

  }
  return v6;
}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  _QWORD v20[5];
  uint8_t buf[4];
  _BYTE v22[14];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteProcess"));
  v8 = objc_msgSend(v7, "pid");
  v9 = (int)v8;
  v10 = BKLogSystemShell(v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v22 = v6;
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)&v22[10] = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "shell control connection -- %{public}@ pid:%d", buf, 0x12u);
  }

  if (v9 <= 0)
  {
    v14 = BKLogSystemShell(v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      objc_msgSend(v6, "invalidate");
      goto LABEL_10;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v22 = v9;
    *(_WORD *)&v22[4] = 2114;
    *(_QWORD *)&v22[6] = v6;
    v16 = "dropping connection with junk pid (%d) -- %{public}@, ";
    v17 = v15;
    v18 = 18;
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_9;
  }
  v13 = objc_msgSend(v7, "hasEntitlement:", BKReplaceSystemAppEntitlement);
  if (!(_DWORD)v13)
  {
    v19 = BKLogSystemShell(v13);
    v15 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v22 = v7;
    v16 = "'%{public}@' is not appropriately entitled";
    v17 = v15;
    v18 = 12;
    goto LABEL_12;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000949B8;
  v20[3] = &unk_1000ECF68;
  v20[4] = self;
  objc_msgSend(v6, "configureConnection:", v20);
  objc_msgSend(v6, "activate");
LABEL_10:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemShellSentinel, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

@end
