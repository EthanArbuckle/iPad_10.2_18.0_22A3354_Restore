@implementation LockScreenSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  LockScreenSecureWindow *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  BLSAssertion *v43;
  BLSAssertion *blsAssertion;
  id v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  id v49;
  void *v50;
  _QWORD v51[4];
  NSObject *v52;
  LockScreenSceneDelegate *v53;
  id v54;
  _QWORD v55[2];
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v12 = sub_100431A4C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
    *(_DWORD *)buf = 138412802;
    v57 = v14;
    v58 = 2112;
    v59 = v9;
    v60 = 2112;
    v61 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[LockScreenSceneDelegate] -scene:willConnectToSession:withOptions: %@, %@, %@", buf, 0x20u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate appSessionController](self, "appSessionController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentlyNavigatingPlatformController"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate appSessionController](self, "appSessionController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentlyNavigatingPlatformController"));
    -[LockScreenSceneDelegate setPlatformController:](self, "setPlatformController:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate appSessionController](self, "appSessionController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeiOSPlatformControllersToCoverSheetSceneAssociation"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate platformController](self, "platformController"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v21));

    -[NSObject setLockScreenScene:](v22, "setLockScreenScene:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mapsScene](v22, "mapsScene"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "delegate"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "chromeViewController"));
    if ((objc_msgSend(v25, "willMoveToOrFromSecureLockScreenUI:", 1) & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate lockScreenWindow](self, "lockScreenWindow"));

      if (!v26)
      {
        v27 = sub_100431A4C();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v11;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Created lockScreenWindow for %@", buf, 0xCu);
        }

        v29 = -[LockScreenSecureWindow initWithWindowScene:]([LockScreenSecureWindow alloc], "initWithWindowScene:", v11);
        -[LockScreenSceneDelegate setLockScreenWindow:](self, "setLockScreenWindow:", v29);

      }
      v30 = sub_100431A4C();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Attaching to lock screen window", buf, 2u);
      }

      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100482158;
      v51[3] = &unk_1011AD238;
      v52 = v24;
      v53 = self;
      v32 = v25;
      v54 = v32;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v51);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate lockScreenWindow](self, "lockScreenWindow"));
      objc_msgSend(v33, "makeKeyAndVisible");

      objc_msgSend(v32, "didMoveToOrFromSecureLockScreenUI:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate platformController](self, "platformController"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate appSessionController](self, "appSessionController"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "primaryPlatformController"));

      if (v34 == v36)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate platformController](self, "platformController"));
        objc_msgSend(v37, "replaySessions");

      }
      if (!self->_blsAssertion)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_FBSScene"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[BLSRequestLiveUpdatingAttribute requestLiveUpdatingForFBSScene:](BLSRequestLiveUpdatingAttribute, "requestLiveUpdatingForFBSScene:", v50));
        v55[0] = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[BLSValidWhenBacklightInactiveAttribute ignoreWhenBacklightInactivates](BLSValidWhenBacklightInactiveAttribute, "ignoreWhenBacklightInactivates"));
        v55[1] = v39;
        v40 = v10;
        v41 = v9;
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 2));
        v43 = (BLSAssertion *)objc_claimAutoreleasedReturnValue(+[BLSAssertion acquireWithExplanation:observer:attributes:](BLSAssertion, "acquireWithExplanation:observer:attributes:", CFSTR("Acquiring BLSAssertion for live updates"), 0, v42));
        blsAssertion = self->_blsAssertion;
        self->_blsAssertion = v43;

        v9 = v41;
        v10 = v40;

      }
      v45 = sub_100431A4C();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Connected to secure lock screen window", buf, 2u);
      }

      v47 = v52;
    }
    else
    {
      v49 = sub_100431A4C();
      v47 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v25;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Failed to prepare to run on the secure window: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    v48 = sub_100431A4C();
    v22 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failing to connect due to there not being a currently navigating platform controller", buf, 2u);
    }
  }

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  BLSAssertion *blsAssertion;
  BLSAssertion *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    *(_DWORD *)buf = 138412290;
    v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[LockScreenSceneDelegate] -sceneDidDisconnect: %@", buf, 0xCu);

  }
  v8 = objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate lockScreenWindow](self, "lockScreenWindow"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screen"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayIdentity"));
    v12 = objc_msgSend(v11, "expectsSecureRendering");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate appSessionController](self, "appSessionController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeiOSPlatformControllersToCoverSheetSceneAssociation"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate platformController](self, "platformController"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v15));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mapsScene"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "chromeViewController"));
      objc_msgSend(v19, "willMoveToOrFromSecureLockScreenUI:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate lockScreenWindow](self, "lockScreenWindow"));
      objc_msgSend(v20, "setHidden:", 1);

      v21 = sub_100431A4C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Detaching from lock screen window", buf, 2u);
      }

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1004824B0;
      v30[3] = &unk_1011AD238;
      v30[4] = self;
      v23 = v18;
      v31 = v23;
      v24 = v19;
      v32 = v24;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "window"));
      objc_msgSend(v25, "makeKeyAndVisible");

      objc_msgSend(v24, "didMoveToOrFromSecureLockScreenUI:", 0);
      v26 = sub_100431A4C();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Disconnected from secure lock screen window", buf, 2u);
      }

    }
  }
  blsAssertion = self->_blsAssertion;
  if (blsAssertion)
  {
    -[BLSAssertion invalidate](blsAssertion, "invalidate");
    v29 = self->_blsAssertion;
    self->_blsAssertion = 0;

  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  v4 = sub_100431A4C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[LockScreenSceneDelegate] sceneDidBecomeActive: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (id)appSessionController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appSessionController"));

  return v3;
}

- (void)mapsAppCoordinatorWillEndLockscreenSession
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  FullscreenImageViewController *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  LockScreenSceneDelegate *v15;
  FullscreenImageViewController *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  FullscreenImageViewController *v20;
  __int16 v21;
  void *v22;

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[LockScreenSceneDelegate] screenshotting tearing down lockscreen content", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate lockScreenWindow](self, "lockScreenWindow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshotViewAfterScreenUpdates:", 0));

  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1004827CC;
  v14 = &unk_1011AC8B0;
  v15 = self;
  v7 = -[FullscreenImageViewController initWithView:scrollable:]([FullscreenImageViewController alloc], "initWithView:scrollable:", v6, 0);
  v16 = v7;
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", &v11);
  v8 = sub_100431A4C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LockScreenSceneDelegate lockScreenWindow](self, "lockScreenWindow", v11, v12, v13, v14, v15));
    *(_DWORD *)buf = 138412802;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[LockScreenSceneDelegate] setup screenshot: %@ hosted by: %@ in window: %@", buf, 0x20u);

  }
}

- (UIWindow)lockScreenWindow
{
  return self->_lockScreenWindow;
}

- (void)setLockScreenWindow:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenWindow, a3);
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
  objc_storeStrong((id *)&self->_platformController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_lockScreenWindow, 0);
  objc_storeStrong((id *)&self->_blsAssertion, 0);
}

@end
