@implementation VIOSessionMonitor

- (VIOSessionMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  id v7;
  id v8;
  VIOSessionMonitor *v9;
  VIOSessionMonitor *v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  char *v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[VIOSessionMonitor initWithStateManager:platformController:]";
      v25 = 2080;
      v26 = "VIOSessionMonitor.m";
      v27 = 1024;
      v28 = 22;
      v29 = 2080;
      v30 = "stateManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v8)
  {
    v17 = sub_1004318FC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[VIOSessionMonitor initWithStateManager:platformController:]";
      v25 = 2080;
      v26 = "VIOSessionMonitor.m";
      v27 = 1024;
      v28 = 23;
      v29 = 2080;
      v30 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v24 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)VIOSessionMonitor;
  v9 = -[VIOSessionMonitor init](&v22, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stateManager, a3);
    objc_storeWeak((id *)&v10->_platformController, v8);
    v10->_enabled = 1;
  }

  return v10;
}

- (ARSession)session
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor stateManager](self, "stateManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "session"));

  return (ARSession *)v3;
}

- (ARConfiguration)configuration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor stateManager](self, "stateManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "configuration"));

  return (ARConfiguration *)v3;
}

- (BOOL)shouldDisableVIOSession
{
  return 0;
}

+ (BOOL)isAvailable
{
  return 1;
}

- (VIOSessionStateManager)stateManager
{
  return self->_stateManager;
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_stateManager, 0);
}

@end
