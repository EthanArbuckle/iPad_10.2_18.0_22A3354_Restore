@implementation MacPlacePhotoViewerScene

+ (MacPlacePhotoViewerScene)sharedInstance
{
  if (qword_1014D2608 != -1)
    dispatch_once(&qword_1014D2608, &stru_1011B80F0);
  return (MacPlacePhotoViewerScene *)(id)qword_1014D2600;
}

- (MacPlacePhotoViewerScene)init
{
  MacPlacePhotoViewerScene *v2;
  MacPlacePhotoViewerRootViewController *v3;
  MacPlacePhotoViewerRootViewController *rootViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MacPlacePhotoViewerScene;
  v2 = -[MacPlacePhotoViewerScene init](&v6, "init");
  if (v2)
  {
    v3 = -[MacPlacePhotoViewerRootViewController initWithNibName:bundle:]([MacPlacePhotoViewerRootViewController alloc], "initWithNibName:bundle:", 0, 0);
    rootViewController = v2->_rootViewController;
    v2->_rootViewController = v3;

  }
  return v2;
}

+ (id)requestSceneActivation
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MacPlacePhotoViewerScene sharedInstance](MacPlacePhotoViewerScene, "sharedInstance"));
  objc_msgSend(v2, "_destroyCurrentSceneIfNeeded");
  return v2;
}

+ (void)teardownCurrentScene
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MacPlacePhotoViewerScene sharedInstance](MacPlacePhotoViewerScene, "sharedInstance"));
  objc_msgSend(v2, "_destroyCurrentSceneIfNeeded");

}

- (void)openPhotoGalleryWithConfiguration:(id)a3 sceneDelegate:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  MacPlacePhotoViewerRootViewController *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100431A4C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[MacPlacePhotoViewerScene] -openPhotoGalleryWithConfiguration:sceneDelegate:delegate: %@, %@, %@", (uint8_t *)&v14, 0x20u);
  }

  v13 = -[MacPlacePhotoViewerRootViewController initWithConfiguration:sceneDelegate:]([MacPlacePhotoViewerRootViewController alloc], "initWithConfiguration:sceneDelegate:", v8, v9);
  -[MacPlacePhotoViewerScene _presentSceneWithRootViewController:delegate:](self, "_presentSceneWithRootViewController:delegate:", v13, v10);

}

- (void)_presentSceneWithRootViewController:(id)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  -[MacPlacePhotoViewerScene setRootViewController:](self, "setRootViewController:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerScene rootViewController](self, "rootViewController"));
  objc_msgSend(v7, "setDelegate:", self);

  -[MacPlacePhotoViewerScene setDelegate:](self, "setDelegate:", v6);
  v10 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.Maps.MacPlacePhotoViewer"));
  objc_msgSend(v10, "setEligibleForHandoff:", 0);
  v8 = objc_alloc_init((Class)UISceneActivationRequestOptions);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v9, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v10, v8, 0);

}

- (void)_destroyCurrentSceneIfNeeded
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[MacPlacePhotoViewerScene] -_destroyCurrentSceneIfNeeded", v10, 2u);
  }

  if (qword_1014D25F8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerScene delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "placePhotoViewerSceneWillDisconnect:");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerScene delegate](self, "delegate"));
      objc_msgSend(v7, "placePhotoViewerSceneWillDisconnect:", self);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v8, "requestSceneSessionDestruction:options:errorHandler:", qword_1014D25F8, 0, 0);

    v9 = (void *)qword_1014D25F8;
    qword_1014D25F8 = 0;

  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  UIWindow *v19;
  UIWindow *window;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100431A4C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    v23 = 138412802;
    v24 = v13;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[MacPlacePhotoViewerScene] -scene:willConnectToSession:withOptions: %@, %@, %@", (uint8_t *)&v23, 0x20u);

  }
  v14 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v8, v14) & 1) != 0)
  {
    v15 = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sizeRestrictions"));
    objc_msgSend(v16, "setMinimumSize:", 800.0, 600.0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sizeRestrictions"));
    objc_msgSend(v17, "setMaximumSize:", 800.0, 600.0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MacPlacePhotoViewerScene sharedInstance](MacPlacePhotoViewerScene, "sharedInstance"));
    v19 = (UIWindow *)objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v15);
    window = self->_window;
    self->_window = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rootViewController"));
    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", v21);

    -[UIWindow setHidden:](self->_window, "setHidden:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sceneTitle"));
    objc_msgSend(v15, "setTitle:", v22);

    objc_storeStrong((id *)&qword_1014D25F8, a4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v23) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: [scene isKindOfClass:[UIWindowScene class]]", (uint8_t *)&v23, 2u);
  }

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[MacPlacePhotoViewerScene] -sceneDidDisconnect: %@", (uint8_t *)&v12, 0xCu);

  }
  -[MacPlacePhotoViewerScene setWindow:](self, "setWindow:", 0);
  v8 = (void *)qword_1014D25F8;
  qword_1014D25F8 = 0;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerScene delegate](self, "delegate"));
  v10 = objc_opt_respondsToSelector(v9, "placePhotoViewerSceneWillDisconnect:");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerScene delegate](self, "delegate"));
    objc_msgSend(v11, "placePhotoViewerSceneWillDisconnect:", self);

  }
}

- (UIViewController)topmostViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerScene rootViewController](self, "rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "topmostViewController"));

  return (UIViewController *)v3;
}

- (NSString)sceneTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MacPlacePhotoViewerRootViewController configuration](self->_rootViewController, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  return (NSString *)v4;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (MacPlacePhotoViewerRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (MacPlacePhotoViewerSceneDelegate)delegate
{
  return (MacPlacePhotoViewerSceneDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
