@implementation USBListener

- (USBListener)init
{
  USBListener *v2;
  USBListener *v3;
  OS_remote_device_browser *browser;
  os_log_t v5;
  OS_os_log *log;
  NSMutableArray *v7;
  NSMutableArray *disconnectHandlers;
  NSObject *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)USBListener;
  v2 = -[USBListener init](&v11, "init");
  v3 = v2;
  if (!v2)
  {
LABEL_6:

    return 0;
  }
  browser = v2->_browser;
  v2->_browser = 0;

  v3->_active = 0;
  v5 = os_log_create("com.apple.dt.remotepairing", "usblistener");
  log = v3->_log;
  v3->_log = (OS_os_log *)v5;

  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  disconnectHandlers = v3->_disconnectHandlers;
  v3->_disconnectHandlers = v7;

  if (!v3->_disconnectHandlers)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[USBListener log](v3, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100062DD8();

    goto LABEL_6;
  }
  return v3;
}

- (BOOL)startOnQueue:(id)a3
{
  id v4;
  void *v5;
  void *started;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, int);
  void *v14;
  USBListener *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[USBListener log](self, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100062E04();
    goto LABEL_8;
  }
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100016F64;
  v14 = &unk_10007A408;
  v15 = self;
  v16 = v4;
  started = (void *)remote_device_start_browsing(9, v16, &v11);
  -[USBListener setBrowser:](self, "setBrowser:", started, v11, v12, v13, v14, v15);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[USBListener browser](self, "browser"));
  if (!v7)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[USBListener log](self, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100062E30();
LABEL_8:

    v8 = 0;
    goto LABEL_9;
  }
  v8 = 1;
  -[USBListener setActive:](self, "setActive:", 1);
LABEL_9:

  return v8;
}

- (BOOL)addDisconnectHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[USBListener disconnectHandlers](self, "disconnectHandlers"));
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[USBListener disconnectHandlers](self, "disconnectHandlers"));
    v7 = objc_msgSend(v4, "copy");
    v8 = objc_retainBlock(v7);
    objc_msgSend(v6, "addObject:", v8);

    objc_sync_exit(v5);
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[USBListener log](self, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100062E04();
  }

  return v4 != 0;
}

- (void)dispatchDisconnectListeners
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[USBListener disconnectHandlers](self, "disconnectHandlers"));
  objc_sync_enter(v3);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[USBListener disconnectHandlers](self, "disconnectHandlers", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7) + 16))();
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)dealloc
{
  objc_super v3;

  self->_active = 0;
  remote_device_browser_cancel(self->_browser, a2);
  v3.receiver = self;
  v3.super_class = (Class)USBListener;
  -[USBListener dealloc](&v3, "dealloc");
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (OS_remote_device_browser)browser
{
  return (OS_remote_device_browser *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBrowser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)disconnectHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisconnectHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_disconnectHandlers, 0);
  objc_storeStrong((id *)&self->_browser, 0);
}

@end
