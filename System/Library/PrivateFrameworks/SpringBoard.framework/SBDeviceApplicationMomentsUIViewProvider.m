@implementation SBDeviceApplicationMomentsUIViewProvider

- (id)acquireSystemUIScenePresentingAssertion
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentsUISceneController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addPresenter:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)priority
{
  return 1;
}

- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4
{
  FBScene **p_presentedScene;
  id v7;
  id v8;
  void *v9;
  objc_super v11;

  p_presentedScene = &self->_presentedScene;
  v7 = a4;
  v8 = a3;
  objc_storeWeak((id *)p_presentedScene, v8);
  v11.receiver = self;
  v11.super_class = (Class)SBDeviceApplicationMomentsUIViewProvider;
  -[SBDeviceApplicationSystemUISceneAbstractViewProvider presentScene:viewControllerBuilderBlock:](&v11, sel_presentScene_viewControllerBuilderBlock_, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dismissScene:(id)a3
{
  FBScene **p_presentedScene;
  id v5;
  void *v6;
  objc_super v8;

  p_presentedScene = &self->_presentedScene;
  v5 = a3;
  objc_storeWeak((id *)p_presentedScene, 0);
  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationMomentsUIViewProvider;
  -[SBDeviceApplicationSystemUISceneAbstractViewProvider dismissScene:](&v8, sel_dismissScene_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)handledStatusBarTap:(id)a3 type:(int64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v6 = a3;
  if (a4 || !-[SBDeviceApplicationSystemUISceneAbstractViewProvider isActive](self, "isActive"))
  {
    LOBYTE(WeakRetained) = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentedScene);
    if (WeakRetained)
    {
      -[SBDeviceApplicationSceneOverlayViewProvider overlayViewController](self, "overlayViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationInView:", v9);
      v11 = v10;

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA10]), "initWithType:xPosition:", 0, v11);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "sendActions:", v13);

      LOBYTE(WeakRetained) = 1;
    }
  }

  return (char)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedScene);
}

@end
