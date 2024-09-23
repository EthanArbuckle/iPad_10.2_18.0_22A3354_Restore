@implementation RCLockScreenSceneDelegate

- (BOOL)isActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isAnimatingBackgroundColor
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCLockScreenSceneDelegate backgroundColorAnimation](self, "backgroundColorAnimation"));
  v3 = v2 != 0;

  return v3;
}

- (id)backgroundColorAnimation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "animationForKey:", CFSTR("backgroundColor")));

  v8 = objc_opt_class(CABasicAnimation, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    v9 = v6;
  else
    v9 = 0;

  return v9;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  RCLockScreenCoordinator *v8;
  RCLockScreenCoordinator *lockScreenCoordinator;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id WeakRetained;
  void *v17;
  void *v18;
  RCLockScreenCoordinator *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v7 = objc_opt_class(UIWindowScene, v6);
  if ((objc_opt_isKindOfClass(v29, v7) & 1) != 0)
  {
    v8 = objc_alloc_init(RCLockScreenCoordinator);
    lockScreenCoordinator = self->_lockScreenCoordinator;
    self->_lockScreenCoordinator = v8;

    v10 = v29;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "screen"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordingController"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayIdentity"));
    v15 = objc_msgSend(v14, "expectsSecureRendering");

    if (v15 && v13)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);

      if (!WeakRetained)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCLockScreenSceneDelegate _mainViewController](self, "_mainViewController"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lockScreenRecordingViewController"));
        objc_storeWeak((id *)&self->_lockScreenRecordingViewController, v18);

        v19 = self->_lockScreenCoordinator;
        v20 = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
        objc_msgSend(v20, "setDelegate:", v19);

      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));

      if (!v21)
      {
        v22 = objc_msgSend(objc_alloc((Class)SBFSecureWindow), "initWithWindowScene:", v10);
        -[RCSceneDelegate setWindow:](self, "setWindow:", v22);

      }
      v23 = objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
      v24 = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
      objc_msgSend((id)v23, "setRootViewController:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
      objc_msgSend(v25, "makeKeyAndVisible");

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      LOBYTE(v23) = objc_msgSend(v26, "supportsLockScreenRotation");

      if ((v23 & 1) == 0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
        objc_msgSend(v27, "setAccessibilityViewIsModal:", 1);

        LODWORD(v27) = UIAccessibilityScreenChangedNotification;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
        UIAccessibilityPostNotification((UIAccessibilityNotifications)v27, v28);

      }
    }

  }
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = objc_opt_class(UIWindowScene, v4);
  isKindOfClass = objc_opt_isKindOfClass(v16, v5);
  v7 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v16;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "screen"));
    v10 = objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayIdentity"));
      v13 = objc_msgSend(v12, "expectsSecureRendering");

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
        objc_msgSend(v14, "setHidden:", 1);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
        objc_msgSend(v15, "setRootViewController:", 0);

        -[RCSceneDelegate setWindow:](self, "setWindow:", 0);
      }
    }

    v7 = v16;
  }

}

- (BOOL)lockscreenWillDismissAfterRecording
{
  return -[RCLockScreenCoordinator lockscreenWillDismissAfterRecording](self->_lockScreenCoordinator, "lockscreenWillDismissAfterRecording");
}

- (id)_mainViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultSceneDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainViewController"));

  return v5;
}

- (RCLockScreenRecordingViewController)lockScreenRecordingViewController
{
  return (RCLockScreenRecordingViewController *)objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
}

- (void)setLockScreenRecordingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_lockScreenRecordingViewController, a3);
}

- (RCLockScreenCoordinator)lockScreenCoordinator
{
  return self->_lockScreenCoordinator;
}

- (void)setLockScreenCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenCoordinator, 0);
  objc_destroyWeak((id *)&self->_lockScreenRecordingViewController);
}

@end
