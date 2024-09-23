@implementation _UISceneLifecycleMonitor

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->__scene);
}

- (void)didBecomeActive
{
  UIScene **p_scene;
  _DWORD *WeakRetained;
  int v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  p_scene = &self->__scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  if (WeakRetained)
  {
    v4 = WeakRetained[54];

    if ((v4 & 8) != 0)
    {
      kdebug_trace();
      v5 = objc_loadWeakRetained((id *)p_scene);
      objc_msgSend(v5, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_loadWeakRetained((id *)p_scene);
      objc_msgSend(v6, "sceneDidBecomeActive:", v7);

      kdebug_trace();
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("UISceneDidActivateNotification"), v9);

  v10 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    kdebug_trace();
    v12 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v13, "canvasDidBecomeActive:", v14);

    kdebug_trace();
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("UICanvasDidActivateNotification"), v15);

}

- (void)willEnterForeground
{
  UIScene **p_scene;
  _DWORD *WeakRetained;
  int v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  p_scene = &self->__scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  if (WeakRetained)
  {
    v4 = WeakRetained[54];

    if ((v4 & 0x20) != 0)
    {
      kdebug_trace();
      v5 = objc_loadWeakRetained((id *)p_scene);
      objc_msgSend(v5, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_loadWeakRetained((id *)p_scene);
      objc_msgSend(v6, "sceneWillEnterForeground:", v7);

      kdebug_trace();
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("UISceneWillEnterForegroundNotification"), v9);

  v10 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    kdebug_trace();
    v12 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v13, "canvasWillEnterForeground:", v14);

    kdebug_trace();
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("UICanvasWillEnterForegroundNotification"), v15);

}

- (_UISceneLifecycleMonitor)initWithScene:(id)a3
{
  id v4;
  _UISceneLifecycleMonitor *v5;
  _UISceneLifecycleMonitor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISceneLifecycleMonitor;
  v5 = -[_UISceneLifecycleMonitor init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->__scene, v4);

  return v6;
}

- (void)didConnect
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  objc_msgSend(WeakRetained, "_finishSceneConnection");

}

- (int64_t)currentActivationState
{
  return 0;
}

- (void)transitionToTargetState:(id)a3 fromState:(id)a4 withTransitionContext:(id)a5 preparations:(id)a6
{
  if (a6)
    (*((void (**)(id, void *))a6 + 2))(a6, &__block_literal_global_81);
}

- (void)willResignActive
{
  UIScene **p_scene;
  _DWORD *WeakRetained;
  int v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  p_scene = &self->__scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  if (WeakRetained)
  {
    v4 = WeakRetained[54];

    if ((v4 & 0x10) != 0)
    {
      kdebug_trace();
      v5 = objc_loadWeakRetained((id *)p_scene);
      objc_msgSend(v5, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_loadWeakRetained((id *)p_scene);
      objc_msgSend(v6, "sceneWillResignActive:", v7);

      kdebug_trace();
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("UISceneWillDeactivateNotification"), v9);

  v10 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    kdebug_trace();
    v12 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v13, "canvasWillResignActive:", v14);

    kdebug_trace();
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("UICanvasWillDeactivateNotification"), v15);

}

- (void)didResignActive
{
  UIScene **p_scene;
  id WeakRetained;
  int v4;
  id v5;

  p_scene = &self->__scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  v4 = objc_msgSend(WeakRetained, "_allowsEventUIWindowRouting");

  if (v4)
  {
    v5 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend((id)UIApp, "_cancelAllEventsOfType:onEventRoutingScene:", 11, v5);
    objc_msgSend((id)UIApp, "_cancelAllEventsOfType:onEventRoutingScene:", 10, v5);

  }
}

- (void)didEnterBackground
{
  UIScene **p_scene;
  _DWORD *WeakRetained;
  int v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  int v18;
  id v19;

  p_scene = &self->__scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  if (WeakRetained)
  {
    v4 = WeakRetained[54];

    if ((v4 & 0x40) != 0)
    {
      kdebug_trace();
      v5 = objc_loadWeakRetained((id *)p_scene);
      objc_msgSend(v5, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_loadWeakRetained((id *)p_scene);
      objc_msgSend(v6, "sceneDidEnterBackground:", v7);

      kdebug_trace();
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("UISceneDidEnterBackgroundNotification"), v9);

  v10 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    kdebug_trace();
    v12 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v13, "canvasDidEnterBackground:", v14);

    kdebug_trace();
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v15, "postNotificationName:object:", CFSTR("UICanvasDidEnterBackgroundNotification"), v16);

  v17 = objc_loadWeakRetained((id *)p_scene);
  v18 = objc_msgSend(v17, "_allowsEventUIWindowRouting");

  if (v18)
  {
    v19 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend((id)UIApp, "_cancelAllInputsOnEventRoutingScene:", v19);

  }
}

- (void)set_scene:(id)a3
{
  objc_storeWeak((id *)&self->__scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__scene);
}

@end
