@implementation RCPlatterSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  RCPlatterViewControllerCoordinator *v10;
  RCPlatterViewControllerCoordinator *platterViewControllerCoordinator;
  VMAudioService *v12;
  VMAudioService *audioService;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  RCPlatterViewController *v20;
  RCPlatterViewController *platterViewController;
  id v22;
  void *v23;

  v6 = a3;
  v8 = objc_opt_class(UIWindowScene, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = v6;
    v10 = objc_alloc_init(RCPlatterViewControllerCoordinator);
    platterViewControllerCoordinator = self->_platterViewControllerCoordinator;
    self->_platterViewControllerCoordinator = v10;

    v12 = (VMAudioService *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
    audioService = self->_audioService;
    self->_audioService = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService recordingController](self->_audioService, "recordingController"));
    if (v14)
    {
      v15 = objc_msgSend(v9, "SBUI_isHostedBySystemAperture");
      v16 = v15;
      if (self->_platterViewController)
      {
        if (v15)
        {
LABEL_5:
          objc_msgSend(v9, "setSystemApertureElementViewControllerProvider:", self->_platterViewController);
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterSceneDelegate _mainViewController](self, "_mainViewController"));
        v20 = (RCPlatterViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "platterViewControllerForPresentationStyle:", v16 ^ 1));
        platterViewController = self->_platterViewController;
        self->_platterViewController = v20;

        -[RCPlatterViewController setDelegate:](self->_platterViewController, "setDelegate:", self->_platterViewControllerCoordinator);
        if (v16)
          goto LABEL_5;
      }
      -[RCPlatterSceneDelegate setResolvedMetricsForScene:](self, "setResolvedMetricsForScene:", v9);
      -[RCPlatterSceneDelegate setBackgroundTintColorForScene:](self, "setBackgroundTintColorForScene:", v9);
      v22 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v9);
      -[RCSceneDelegate setWindow:](self, "setWindow:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
      objc_msgSend(v23, "setRootViewController:", self->_platterViewController);

      v18 = objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
      -[NSObject makeKeyAndVisible](v18, "makeKeyAndVisible");
    }
    else
    {
      v17 = OSLogForCategory(kVMLogCategoryDefault);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        sub_10010C194(v18);
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)isInAndromeda
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = -[RCPlatterViewController isViewLoaded](self->_platterViewController, "isViewLoaded");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self->_platterViewController, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
    v8 = objc_msgSend(v7, "isInAndromeda");

    LOBYTE(v3) = v8;
  }
  return v3;
}

- (id)_recorderAppDelegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return v3;
}

- (id)_mainViewController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterSceneDelegate _recorderAppDelegate](self, "_recorderAppDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "defaultSceneDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainViewController"));

  return v4;
}

- (RCPlatterViewController)platterViewController
{
  return self->_platterViewController;
}

- (void)setPlatterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_platterViewController, a3);
}

- (RCPlatterViewControllerCoordinator)platterViewControllerCoordinator
{
  return self->_platterViewControllerCoordinator;
}

- (void)setPlatterViewControllerCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_platterViewControllerCoordinator, a3);
}

- (VMAudioService)audioService
{
  return self->_audioService;
}

- (void)setAudioService:(id)a3
{
  objc_storeStrong((id *)&self->_audioService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioService, 0);
  objc_storeStrong((id *)&self->_platterViewControllerCoordinator, 0);
  objc_storeStrong((id *)&self->_platterViewController, 0);
}

- (void)setResolvedMetricsForScene:(id)a3
{
  id v4;
  uint64_t v5;
  RCPlatterSceneDelegate *v6;

  v4 = a3;
  v6 = self;
  sub_1000EB4E8(v4, v5);

}

- (void)setBackgroundTintColorForScene:(id)a3
{
  uint64_t v5;
  void *v6;
  RCPlatterSceneDelegate *v7;
  RCPlatterSceneDelegate *v8;
  RCPlatterSceneDelegate *v9;
  RCPlatterSceneDelegate *v10;

  v5 = type metadata accessor for ActivityScene(0, a2);
  if (swift_dynamicCastClass(a3, v5))
  {
    v6 = (void *)objc_opt_self(RCRecorderStyleProvider);
    v7 = (RCPlatterSceneDelegate *)a3;
    v8 = self;
    v9 = (RCPlatterSceneDelegate *)objc_msgSend(v6, "sharedStyleProvider");
    if (v9)
    {
      v10 = v9;
      dispatch thunk of ActivityScene.backgroundTintColor.setter(-[RCPlatterSceneDelegate bannerBackgroundColor](v9, "bannerBackgroundColor"));

      v8 = v7;
    }
    else
    {
      v10 = v7;
    }

  }
}

@end
