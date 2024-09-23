@implementation PedestrianARContext

- (PedestrianARContext)initWithRoute:(id)a3 platformController:(id)a4 guidanceObserver:(id)a5 navigationService:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PedestrianARContext *v14;
  id v15;
  NSObject *v16;
  PedestrianARViewController *v17;
  PedestrianARViewController *pedestrianARViewController;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  char *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  char *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  char *v39;
  objc_super v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    v20 = sub_1004318FC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARContext initWithRoute:platformController:guidanceObserver:navigationService:]";
      v43 = 2080;
      v44 = "PedestrianARContext.m";
      v45 = 1024;
      v46 = 44;
      v47 = 2080;
      v48 = "route != nil";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v11)
  {
    v25 = sub_1004318FC();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARContext initWithRoute:platformController:guidanceObserver:navigationService:]";
      v43 = 2080;
      v44 = "PedestrianARContext.m";
      v45 = 1024;
      v46 = 45;
      v47 = 2080;
      v48 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v27 = sub_1004318FC();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v12)
  {
    v30 = sub_1004318FC();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARContext initWithRoute:platformController:guidanceObserver:navigationService:]";
      v43 = 2080;
      v44 = "PedestrianARContext.m";
      v45 = 1024;
      v46 = 46;
      v47 = 2080;
      v48 = "guidanceObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v13)
  {
    v35 = sub_1004318FC();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARContext initWithRoute:platformController:guidanceObserver:navigationService:]";
      v43 = 2080;
      v44 = "PedestrianARContext.m";
      v45 = 1024;
      v46 = 47;
      v47 = 2080;
      v48 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v37 = sub_1004318FC();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)PedestrianARContext;
  v14 = -[PedestrianARContext init](&v40, "init");
  if (v14)
  {
    v15 = sub_1007A34E4();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v42 = (const char *)v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v17 = -[PedestrianARViewController initWithRoute:platformController:guidanceObserver:navigationService:]([PedestrianARViewController alloc], "initWithRoute:platformController:guidanceObserver:navigationService:", v10, v11, v12, v13);
    pedestrianARViewController = v14->_pedestrianARViewController;
    v14->_pedestrianARViewController = v17;

    -[PedestrianARViewController setArDelegate:](v14->_pedestrianARViewController, "setArDelegate:", v14);
    -[ContainerViewController setChromeContext:](v14->_pedestrianARViewController, "setChromeContext:", v14);
  }

  return v14;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARContext *v7;

  v3 = sub_1007A34E4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARContext;
  -[PedestrianARContext dealloc](&v5, "dealloc");
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (id)fullscreenViewControllerPresentationTransition
{
  return objc_opt_new(ModeTransitionController);
}

- (id)fullscreenViewControllerDismissalTransition
{
  return objc_opt_new(ModeTransitionController);
}

- (ChromeViewController)chromeViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARContext pedestrianARViewController](self, "pedestrianARViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));

  return (ChromeViewController *)v3;
}

- (void)setChromeViewController:(id)a3
{
  char *v4;
  __objc2_class_ro **p_info;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  PedestrianARContext *v14;
  int v15;
  PedestrianARContext *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;

  v4 = (char *)a3;
  if (!v4)
    goto LABEL_4;
  p_info = TransitDirectionsListItem.info;
  v6 = objc_opt_class(IOSBasedChromeViewController);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315906;
      v16 = (PedestrianARContext *)"-[PedestrianARContext setChromeViewController:]";
      v17 = 2080;
      v18 = "PedestrianARContext.m";
      v19 = 1024;
      v20 = 91;
      v21 = 2080;
      v22 = "chromeViewController == nil || [chromeViewController isKindOfClass:IOSBasedChromeViewController.class]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v15, 0x26u);
    }

    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (PedestrianARContext *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v15 = 138412290;
        v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

        p_info = (__objc2_class_ro **)(TransitDirectionsListItem + 32);
      }

    }
  }
  v7 = objc_opt_class(p_info + 106);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) == 0)
  {
    v9 = sub_1007A34E4();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = 134349314;
      v16 = self;
      v17 = 2112;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{public}p] Chrome VC must be an iOS one: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
LABEL_4:
    v8 = objc_claimAutoreleasedReturnValue(-[PedestrianARContext pedestrianARViewController](self, "pedestrianARViewController"));
    -[NSObject setChromeViewController:](v8, "setChromeViewController:", v4);
  }

}

- (BOOL)showsMapView
{
  return 0;
}

- (BOOL)shouldResetStateAfterResigning
{
  return 0;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  PedestrianARContext *v14;
  __int16 v15;
  const char *v16;

  v6 = a3;
  v7 = a4;
  v8 = sub_1007A34E4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v14 = self;
    v15 = 2080;
    v16 = "-[PedestrianARContext becomeTopContextInChromeViewController:withAnimation:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] %s", buf, 0x16u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1007A39A8;
  v11[3] = &unk_1011AC860;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v7, "addPreparation:", v11);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  PedestrianARContext *v9;
  __int16 v10;
  const char *v11;

  v5 = sub_1007A34E4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134349314;
    v9 = self;
    v10 = 2080;
    v11 = "-[PedestrianARContext resignTopContextInChromeViewController:withAnimation:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] %s", (uint8_t *)&v8, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARContext pedestrianARViewController](self, "pedestrianARViewController"));
  objc_msgSend(v7, "stop");

}

- (BOOL)supportsLockscreen
{
  return 1;
}

- (void)willBeginDisplayingInSecureLockScreen
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARContext pedestrianARViewController](self, "pedestrianARViewController"));
  objc_msgSend(v2, "willBeginDisplayingInSecureLockScreen");

}

- (void)pedestrianARViewControllerDidStop:(id)a3
{
  void *v4;
  PedestrianARContext *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  PedestrianARContext *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARContext chromeViewController](self, "chromeViewController", a3));
  v5 = (PedestrianARContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previousTopContext"));

  if (v5 == self)
  {
    v7 = sub_1007A34E4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] VC stopped but we're currently in the process of being dismissed; ignoring",
        buf,
        0xCu);
    }

  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appCoordinator"));
    objc_msgSend(v6, "exitPedestrianAR");

  }
}

- (BOOL)provideAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v9;
  id v10;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007A3DC0;
  block[3] = &unk_1011AECC0;
  block[4] = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  return 1;
}

- (PedestrianARViewController)pedestrianARViewController
{
  return self->_pedestrianARViewController;
}

- (void)setPedestrianARViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pedestrianARViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pedestrianARViewController, 0);
}

@end
