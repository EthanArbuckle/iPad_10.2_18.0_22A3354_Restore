@implementation SBMainDisplayRootWindowScenePresentationBinder

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_0 != -1)
    dispatch_once(&sharedInstance___onceToken_0, &__block_literal_global_354);
  return (id)sharedInstance___instance_10;
}

void __64__SBMainDisplayRootWindowScenePresentationBinder_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SBMainDisplayRootWindowScenePresentationBinder _init]([SBMainDisplayRootWindowScenePresentationBinder alloc], "_init");
  v1 = (void *)sharedInstance___instance_10;
  sharedInstance___instance_10 = (uint64_t)v0;

}

- (id)_init
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  SBRootSceneWindow *v7;
  void *v8;
  SBRootSceneWindow *v9;
  SBMainDisplayRootWindowScenePresentationBinder *v10;
  SBMainDisplayRootWindowScenePresentationBinder *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SBRootSceneWindow-%@-%p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [SBRootSceneWindow alloc];
  objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIRootSceneWindow initWithDisplayConfiguration:](v7, "initWithDisplayConfiguration:", v8);

  v13.receiver = self;
  v13.super_class = (Class)SBMainDisplayRootWindowScenePresentationBinder;
  v10 = -[SBRootWindowScenePresentationBinder initWithIdentifier:priority:appearanceStyle:rootWindow:](&v13, sel_initWithIdentifier_priority_appearanceStyle_rootWindow_, v6, -10, 0, v9);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_rootWindow, v9);

  return v11;
}

- (id)assertDisconnectionFromRenderServerForReason:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *disconnectionAssertions;
  id v7;
  void *v8;
  NSObject *v9;
  NSMutableArray *v10;
  _QWORD v12[5];
  uint8_t buf[4];
  NSMutableArray *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_disconnectionAssertions)
  {
    v5 = (NSMutableArray *)objc_opt_new();
    disconnectionAssertions = self->_disconnectionAssertions;
    self->_disconnectionAssertions = v5;

  }
  v7 = objc_alloc(MEMORY[0x1E0D01868]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__SBMainDisplayRootWindowScenePresentationBinder_assertDisconnectionFromRenderServerForReason___block_invoke;
  v12[3] = &unk_1E8E9DCD8;
  v12[4] = self;
  v8 = (void *)objc_msgSend(v7, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("RenderServerDisconnect"), v4, MEMORY[0x1E0C80D38], v12);

  -[NSMutableArray addObject:](self->_disconnectionAssertions, "addObject:", v8);
  if (-[NSMutableArray count](self->_disconnectionAssertions, "count") == 1)
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_disconnectionAssertions;
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "disconnect from renderserver:%{public}@", buf, 0xCu);
    }

    -[SBMainDisplayRootWindowScenePresentationBinder _disconnectFromRenderServer](self, "_disconnectFromRenderServer");
  }
  return v8;
}

uint64_t __95__SBMainDisplayRootWindowScenePresentationBinder_assertDisconnectionFromRenderServerForReason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "removeObject:", a2);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "count");
  if (!result)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "reconnect to renderserver", v5, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_reconnectToRenderServer");
  }
  return result;
}

- (void)_disconnectFromRenderServer
{
  UIWindowScene *v3;
  UIWindowScene *disconnectedFromScene;
  void *v6;

  if (self->_disconnectedFromScene)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayRootWindowScenePresentationBinder.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_disconnectedFromScene == nil"));

  }
  -[_UIRootWindow setHidden:](self->_rootWindow, "setHidden:", 1);
  -[SBRootSceneWindow windowScene](self->_rootWindow, "windowScene");
  v3 = (UIWindowScene *)objc_claimAutoreleasedReturnValue();
  disconnectedFromScene = self->_disconnectedFromScene;
  self->_disconnectedFromScene = v3;

  -[SBRootSceneWindow setWindowScene:](self->_rootWindow, "setWindowScene:", 0);
}

- (void)_reconnectToRenderServer
{
  UIWindowScene *disconnectedFromScene;

  if (self->_disconnectedFromScene)
  {
    -[SBRootSceneWindow setWindowScene:](self->_rootWindow, "setWindowScene:");
    disconnectedFromScene = self->_disconnectedFromScene;
    self->_disconnectedFromScene = 0;

  }
  -[_UIRootWindow setHidden:](self->_rootWindow, "setHidden:", 0);
}

- (SBRootSceneWindow)rootWindow
{
  return self->_rootWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disconnectedFromScene, 0);
  objc_storeStrong((id *)&self->_disconnectionAssertions, 0);
  objc_storeStrong((id *)&self->_rootWindow, 0);
}

@end
