@implementation CarWidgetController

- (CarWidgetController)initWithCarSceneType:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  CarWidgetController *result;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v21 = "-[CarWidgetController initWithCarSceneType:]";
        v22 = 2080;
        v23 = "CarWidgetController.m";
        v24 = 1024;
        v25 = 27;
        v26 = 2080;
        v27 = "dispatch_get_main_queue()";
        v28 = 2080;
        v29 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v30 = 2080;
        v31 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v21 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  if (((unint64_t)(a3 - 4) < 4 || a3 == 1) && (unint64_t)a3 <= 3)
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[CarWidgetController initWithCarSceneType:]";
      v22 = 2080;
      v23 = "CarWidgetController.m";
      v24 = 1024;
      v25 = 28;
      v26 = 2080;
      v27 = "CarSceneTypeIsDashboardWidget(sceneType) || CarSceneTypeIsInstrumentClusterWidget(sceneType)";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)CarWidgetController;
  result = -[CarWidgetController init](&v19, "init");
  if (result)
    result->_sceneType = a3;
  return result;
}

- (void)dealloc
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v6 = sub_1004318FC();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v13 = "-[CarWidgetController dealloc]";
        v14 = 2080;
        v15 = "CarWidgetController.m";
        v16 = 1024;
        v17 = 38;
        v18 = 2080;
        v19 = "dispatch_get_main_queue()";
        v20 = 2080;
        v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v22 = 2080;
        v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v8 = sub_1004318FC();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v13 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CarWidgetController;
  -[CarWidgetController dealloc](&v11, "dealloc");
}

+ (Class)chromeViewControllerClass
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (Class)fallbackModeControllerClass
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)_mapsCar_scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  CarWidgetController *v27;
  __int16 v28;
  void *v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100431A4C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class(self);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 134349314;
    v27 = self;
    v28 = 2112;
    v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] willConnectToSession:options, widgetControllerClass: %@", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CarSessionController sharedInstance](CarSessionController, "sharedInstance"));
  objc_msgSend(v16, "addObserver:", self);

  v17 = objc_msgSend(objc_msgSend(objc_msgSend((id)objc_opt_class(self), "chromeViewControllerClass"), "alloc"), "initWithCarSceneType:", -[CarWidgetController sceneType](self, "sceneType"));
  -[CarWidgetController setChromeViewController:](self, "setChromeViewController:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarWidgetController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v18, "setSuppressed:", 1);

  objc_initWeak((id *)buf, self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarWidgetController chromeViewController](self, "chromeViewController"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100A67710;
  v24[3] = &unk_1011E0DB0;
  objc_copyWeak(&v25, (id *)buf);
  objc_msgSend(v19, "setFallbackContextCoordinationBlock:", v24);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarWidgetController chromeViewController](self, "chromeViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarWidgetController contextsForCurrentAppState](self, "contextsForCurrentAppState"));
  objc_msgSend(v20, "setContexts:animated:completion:", v21, 0, 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarWidgetController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v22, "addChromeViewController:", v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

- (void)_mapsCar_rebuildContextsForCurrentAppState
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarWidgetController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarWidgetController contextsForCurrentAppState](self, "contextsForCurrentAppState"));
  objc_msgSend(v3, "setContexts:animated:completion:", v4, 0, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarWidgetController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "setNeedsUpdateComponent:animated:", CFSTR("accessories"), 0);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  CarWidgetController *v12;
  __int16 v13;
  void *v14;

  v4 = sub_100431A4C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v11 = 134349314;
    v12 = self;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] sceneDidDisconnect, widgetControllerClass: %@", (uint8_t *)&v11, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarWidgetController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v9, "setSuppressed:", 1);

  -[CarWidgetController setChromeViewController:](self, "setChromeViewController:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarSessionController sharedInstance](CarSessionController, "sharedInstance"));
  objc_msgSend(v10, "removeObserver:", self);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  int v10;
  CarWidgetController *v11;
  __int16 v12;
  void *v13;

  v4 = sub_100431A4C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v10 = 134349314;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] sceneWillEnterForeground, widgetControllerClass: %@", (uint8_t *)&v10, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarWidgetController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v9, "setSuppressed:", 0);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  int v9;
  CarWidgetController *v10;
  __int16 v11;
  void *v12;

  v4 = sub_100431A4C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 134349314;
    v10 = self;
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] sceneDidEnterBackground, widgetControllerClass: %@", (uint8_t *)&v9, 0x16u);

  }
}

- (id)contextsForCurrentAppState
{
  -[CarWidgetController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return &__NSArray0__struct;
}

- (int64_t)sceneType
{
  return self->_sceneType;
}

- (CarChromeViewController)chromeViewController
{
  return self->_chromeViewController;
}

- (void)setChromeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_chromeViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chromeViewController, 0);
}

@end
