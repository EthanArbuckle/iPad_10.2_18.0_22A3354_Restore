@implementation _BKRoutingWindowSceneDelegate

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v13, "windowScene:didUpdateCoordinateSpace:interfaceOrientation:traitCollection:", v12, v11, a5, v10);

}

- (void)setSceneController:(id)a3
{
  objc_storeStrong((id *)&self->_sceneController, a3);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v5, "sceneWillEnterForeground:", v4);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v5, "sceneDidBecomeActive:", v4);

}

- (BKPrimarySceneControlling)sceneController
{
  return self->_sceneController;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  objc_msgSend(v10, "routeScene:willConnectToSession:options:", v9, v8, v7);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v5, "sceneDidDisconnect:", v4);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v5, "sceneWillResignActive:", v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v5, "sceneDidEnterBackground:", v4);

}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v8, "scene:willContinueUserActivityWithType:", v7, v6);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v8, "scene:continueUserActivity:", v7, v6);

}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v11, "scene:didFailToContinueUserActivityWithType:error:", v10, v9, v8);

}

- (void)scene:(id)a3 didUpdateUserActivity:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v8, "scene:didUpdateUserActivity:", v7, v6);

}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stateRestorationActivityForScene:", v4));

  return v6;
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v8, "scene:openURLContexts:", v7, v6);

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[_BKRoutingWindowSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v11, "windowScene:performActionForShortcutItem:completionHandler:", v10, v9, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneController, 0);
}

@end
