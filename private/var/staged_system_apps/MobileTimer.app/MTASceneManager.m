@implementation MTASceneManager

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  int v12;
  MTASceneManager *v13;

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ sceneWillEnterForeground", (uint8_t *)&v12, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "role"));
  v10 = objc_msgSend(v9, "isEqualToString:", UIWindowSceneSessionRoleApplication);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTASceneManager delegate](self, "delegate"));
    objc_msgSend(v11, "sceneWillEnterForeground:", v4);

  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  MTASceneManager *v29;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v12 = MTLogForCategory(8, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138543362;
    v29 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ willConnectToSession", (uint8_t *)&v28, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "role"));
  v15 = objc_msgSend(v14, "isEqualToString:", UIWindowSceneSessionRoleApplication);

  if (v15)
  {
    v16 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTASceneManager delegate](self, "delegate"));
    objc_msgSend(v17, "windowSceneWillConnect:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLContexts"));
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLContexts"));
      -[MTASceneManager scene:openURLContexts:](self, "scene:openURLContexts:", v16, v20);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortcutItem"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortcutItem"));
      -[MTASceneManager windowScene:performActionForShortcutItem:completionHandler:](self, "windowScene:performActionForShortcutItem:completionHandler:", v16, v22, &stru_100099F30);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userActivities"));
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userActivities"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "anyObject"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "activityType"));
      -[MTASceneManager scene:willContinueUserActivityWithType:](self, "scene:willContinueUserActivityWithType:", v16, v27);

      -[MTASceneManager scene:continueUserActivity:](self, "scene:continueUserActivity:", v16, v26);
    }

  }
}

- (MTASceneManager)init
{
  MTASceneManager *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTASceneManager;
  v2 = -[MTASceneManager init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
    -[MTASceneManager setDelegate:](v2, "setDelegate:", v4);

  }
  return v2;
}

- (MTASceneDelegate)delegate
{
  return (MTASceneDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  MTASceneManager *v10;

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ sceneDidBecomeActive", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTASceneManager delegate](self, "delegate"));
  objc_msgSend(v8, "sceneDidBecomeActive:", v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  MTASceneManager *v10;

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ sceneDidEnterBackground", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTASceneManager delegate](self, "delegate"));
  objc_msgSend(v8, "sceneDidEnterBackground:", v4);

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  MTASceneManager *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = MTLogForCategory(8, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ performActionForShortcutItem", (uint8_t *)&v15, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTASceneManager delegate](self, "delegate"));
  objc_msgSend(v14, "windowScene:performActionForShortcutItem:completionHandler:", v10, v9, v8);

}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  MTASceneManager *v13;

  v6 = a4;
  v7 = a3;
  v9 = MTLogForCategory(8, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ willContinueUserActivityWithType", (uint8_t *)&v12, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTASceneManager delegate](self, "delegate"));
  objc_msgSend(v11, "scene:willContinueUserActivityWithType:", v7, v6);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  MTASceneManager *v13;

  v6 = a4;
  v7 = a3;
  v9 = MTLogForCategory(8, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ continueUserActivity", (uint8_t *)&v12, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTASceneManager delegate](self, "delegate"));
  objc_msgSend(v11, "scene:continueUserActivity:", v7, v6);

}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  MTASceneManager *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = MTLogForCategory(8, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ didFailToContinueUserActivityWithType", (uint8_t *)&v15, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTASceneManager delegate](self, "delegate"));
  objc_msgSend(v14, "scene:didFailToContinueUserActivityWithType:error:", v10, v9, v8);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  MTASceneManager *v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v9 = MTLogForCategory(8, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ openURLContexts: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTASceneManager delegate](self, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "options"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sourceApplication"));
    objc_msgSend(v13, "scene:openURL:sourceApplication:", v6, v14, v16);

  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  MTASceneManager *v10;

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ sceneWillResignActive", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTASceneManager delegate](self, "delegate"));
  objc_msgSend(v8, "sceneWillResignActive:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
