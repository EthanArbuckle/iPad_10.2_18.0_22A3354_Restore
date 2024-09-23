@implementation PedestrianARSessionTask

- (PedestrianARSessionTask)initWithPlatformController:(id)a3
{
  id v4;
  PedestrianARSessionTask *v5;
  id v6;
  NSObject *v7;
  PedestrianARSessionStateManager *v8;
  id WeakRetained;
  PedestrianARSessionStateManager *v10;
  PedestrianARSessionStateManager *stateManager;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;

  v4 = a3;
  if (!v4)
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "-[PedestrianARSessionTask initWithPlatformController:]";
      v21 = 2080;
      v22 = "PedestrianARSessionTask.m";
      v23 = 1024;
      v24 = 37;
      v25 = 2080;
      v26 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PedestrianARSessionTask;
  v5 = -[PedestrianARSessionTask init](&v18, "init");
  if (v5)
  {
    v6 = sub_1003D3498();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v20 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_platformController, v4);
    v8 = [PedestrianARSessionStateManager alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v5->_platformController);
    v10 = -[PedestrianARSessionStateManager initWithPlatformController:](v8, "initWithPlatformController:", WeakRetained);
    stateManager = v5->_stateManager;
    v5->_stateManager = v10;

    -[PedestrianARSessionStateManager addObserver:](v5->_stateManager, "addObserver:", v5);
  }

  return v5;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARSessionTask *v7;

  v3 = sub_1003D3498();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  -[PedestrianARSessionStateManager removeObserver:](self->_stateManager, "removeObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARSessionTask;
  -[PedestrianARSessionTask dealloc](&v5, "dealloc");
}

+ (BOOL)isPedestrianARModeSupported
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D3614;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D2390 != -1)
    dispatch_once(&qword_1014D2390, block);
  return byte_1014D2388;
}

+ (int64_t)creationPreference
{
  return 2;
}

+ (BOOL)isSupportedForTransportType:(int64_t)a3
{
  return a3 == 2;
}

- (void)stateManager:(id)a3 didChangeState:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  PedestrianARSessionTask *v15;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTask platformController](self, "platformController", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));

  v8 = objc_opt_class(IOSBasedChromeViewController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userLocationView"));
    objc_msgSend(v11, "setIsPedestrianARAvailable:", v4);

  }
  else
  {
    v12 = sub_1003D3498();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 134349056;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] chromeVC was not an IOSBased one; ignoring",
        (uint8_t *)&v14,
        0xCu);
    }

  }
}

- (PedestrianARSessionStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_stateManager, a3);
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_stateManager, 0);
}

@end
