@implementation SBPrototypeController

- (id)rootSettings
{
  SBRootSettings *rootSettings;
  SBRootSettings *v4;
  SBRootSettings *v5;

  rootSettings = self->_rootSettings;
  if (!rootSettings)
  {
    v4 = -[_UISettings initWithDefaultValues]([SBRootSettings alloc], "initWithDefaultValues");
    v5 = self->_rootSettings;
    self->_rootSettings = v4;

    rootSettings = self->_rootSettings;
  }
  return rootSettings;
}

+ (SBPrototypeController)sharedInstance
{
  if (sharedInstance___once_11 != -1)
    dispatch_once(&sharedInstance___once_11, &__block_literal_global_389);
  return (SBPrototypeController *)(id)sharedInstance___instance_11;
}

void __39__SBPrototypeController_sharedInstance__block_invoke()
{
  SBPrototypeController *v0;
  void *v1;

  v0 = objc_alloc_init(SBPrototypeController);
  v1 = (void *)sharedInstance___instance_11;
  sharedInstance___instance_11 = (uint64_t)v0;

}

- (SBPrototypeController)init
{
  SBPrototypeController *v2;
  SBPrototypeController *v3;
  void *v4;
  SBPrototypeController *v5;
  id v6;
  SBPrototypeDumpingGround *v7;
  SBPrototypeDumpingGround *dumpingGround;
  _QWORD v10[4];
  SBPrototypeController *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBPrototypeController;
  v2 = -[SBPrototypeController init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SBPrototypeController _updateKeyHIDEventRouters](v2, "_updateKeyHIDEventRouters");
    -[SBPrototypeController _updateRemoteEditingState](v3, "_updateRemoteEditingState");
    objc_msgSend(MEMORY[0x1E0D83028], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __29__SBPrototypeController_init__block_invoke;
    v10[3] = &unk_1E8E9DED8;
    v5 = v3;
    v11 = v5;
    v6 = (id)objc_msgSend(v4, "observeEventDefaultsOnQueue:withBlock:", MEMORY[0x1E0C80D38], v10);

    +[SBTestRecipeRegistrar registerAllTestRecipes](SBTestRecipeRegistrar, "registerAllTestRecipes");
    v7 = objc_alloc_init(SBPrototypeDumpingGround);
    dumpingGround = v5->_dumpingGround;
    v5->_dumpingGround = v7;

  }
  return v3;
}

uint64_t __29__SBPrototypeController_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateKeyHIDEventRouters");
  return objc_msgSend(*(id *)(a1 + 32), "_updateRemoteEditingState");
}

- (void)setWindowScene:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_windowScene, obj);
    +[SBTestRecipeRegistrar registerWindowScene:](SBTestRecipeRegistrar, "registerWindowScene:", obj);
    -[SBPrototypeDumpingGround setWindowScene:](self->_dumpingGround, "setWindowScene:", obj);
  }

}

- (BOOL)handleVolumeIncreaseEvent
{
  return -[SBPrototypeController _handlePrototypingEvent:](self, "_handlePrototypingEvent:", 1);
}

- (BOOL)handleVolumeDecreaseEvent
{
  return -[SBPrototypeController _handlePrototypingEvent:](self, "_handlePrototypingEvent:", 2);
}

- (BOOL)handleRingerSwitchEvent
{
  return -[SBPrototypeController _handlePrototypingEvent:](self, "_handlePrototypingEvent:", 3);
}

- (void)restartSpringBoard
{
  void *v3;
  SBRestartTransitionRequest *v4;

  v4 = -[SBRestartTransitionRequest initWithRequester:reason:]([SBRestartTransitionRequest alloc], "initWithRequester:reason:", CFSTR("SBPrototypeController"), CFSTR("Prototyping"));
  -[SBPrototypeController restartManager](self, "restartManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restartWithTransitionRequest:", v4);

}

- (void)killSpringBoard
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SBPrototypeController_killSpringBoard__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __40__SBPrototypeController_killSpringBoard__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "restartSpringBoard");
}

- (BOOL)_handlePrototypingEvent:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[SBPrototypeController _shouldSendEvent:](self, "_shouldSendEvent:");
  if (v5)
    -[SBPrototypeController _sendEvent:](self, "_sendEvent:", a3);
  return v5;
}

- (BOOL)_shouldSendEvent:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0D83028], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "prototypingServerWantsEvent:", a3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_sendEvent:(int64_t)a3
{
  NSXPCConnection *prototypingUIServerConnection;
  id v6;

  prototypingUIServerConnection = self->_prototypingUIServerConnection;
  if (!prototypingUIServerConnection)
  {
    -[SBPrototypeController _createConnection](self, "_createConnection");
    prototypingUIServerConnection = self->_prototypingUIServerConnection;
  }
  -[NSXPCConnection remoteObjectProxy](prototypingUIServerConnection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handlePrototypingEvent:", a3);

}

- (void)_createConnection
{
  id v3;
  NSXPCConnection *v4;
  NSXPCConnection *prototypingUIServerConnection;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v4 = (NSXPCConnection *)objc_msgSend(v3, "initWithMachServiceName:options:", *MEMORY[0x1E0D83130], 4096);
  prototypingUIServerConnection = self->_prototypingUIServerConnection;
  self->_prototypingUIServerConnection = v4;

  v6 = self->_prototypingUIServerConnection;
  PTUIServerInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

  v8 = self->_prototypingUIServerConnection;
  PTUIClientInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

  -[NSXPCConnection setExportedObject:](self->_prototypingUIServerConnection, "setExportedObject:", self);
  -[NSXPCConnection resume](self->_prototypingUIServerConnection, "resume");
}

- (BOOL)_handleKeyHIDEvent:(__IOHIDEvent *)a3
{
  return 0;
}

- (void)_updateRemoteEditingState
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  NSXPCConnection *prototypingUIServerConnection;
  void *v8;

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalInstall");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D83028], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "remotePrototypingEnabled");

    if (v6)
    {
      prototypingUIServerConnection = self->_prototypingUIServerConnection;
      if (!prototypingUIServerConnection)
      {
        -[SBPrototypeController _createConnection](self, "_createConnection");
        prototypingUIServerConnection = self->_prototypingUIServerConnection;
      }
      -[NSXPCConnection remoteObjectProxy](prototypingUIServerConnection, "remoteObjectProxy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "launchForRemoteEditing");

      -[SBPrototypeController _acquireRemotePrototypingAssertion](self, "_acquireRemotePrototypingAssertion");
    }
    else
    {
      -[SBPrototypeController _invalidateRemotePrototypingAssertion](self, "_invalidateRemotePrototypingAssertion");
    }
  }
}

- (void)_acquireRemotePrototypingAssertion
{
  SBSBackgroundActivityAssertion *v3;
  SBSBackgroundActivityAssertion *remotePrototypingAssertion;
  SBSBackgroundActivityAssertion *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->_remotePrototypingAssertion)
  {
    objc_msgSend(MEMORY[0x1E0DAADE8], "assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:", *MEMORY[0x1E0DB0B28], getpid(), 1, 0);
    v3 = (SBSBackgroundActivityAssertion *)objc_claimAutoreleasedReturnValue();
    remotePrototypingAssertion = self->_remotePrototypingAssertion;
    self->_remotePrototypingAssertion = v3;

    -[SBSBackgroundActivityAssertion setStatusString:](self->_remotePrototypingAssertion, "setStatusString:", CFSTR("Remote Prototyping"));
    objc_initWeak(&location, self);
    v5 = self->_remotePrototypingAssertion;
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__SBPrototypeController__acquireRemotePrototypingAssertion__block_invoke;
    v9[3] = &unk_1E8EA1F50;
    objc_copyWeak(&v10, &location);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __59__SBPrototypeController__acquireRemotePrototypingAssertion__block_invoke_2;
    v7[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v8, &location);
    -[SBSBackgroundActivityAssertion acquireWithHandler:invalidationHandler:](v5, "acquireWithHandler:invalidationHandler:", v9, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __59__SBPrototypeController__acquireRemotePrototypingAssertion__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_invalidateRemotePrototypingAssertion");

  }
}

void __59__SBPrototypeController__acquireRemotePrototypingAssertion__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateRemotePrototypingAssertion");

}

- (void)_invalidateRemotePrototypingAssertion
{
  SBSBackgroundActivityAssertion *remotePrototypingAssertion;
  SBSBackgroundActivityAssertion *v4;

  remotePrototypingAssertion = self->_remotePrototypingAssertion;
  if (remotePrototypingAssertion)
  {
    -[SBSBackgroundActivityAssertion invalidate](remotePrototypingAssertion, "invalidate");
    v4 = self->_remotePrototypingAssertion;
    self->_remotePrototypingAssertion = 0;

  }
}

- (SBRestartManager)restartManager
{
  return (SBRestartManager *)objc_loadWeakRetained((id *)&self->_restartManager);
}

- (void)setRestartManager:(id)a3
{
  objc_storeWeak((id *)&self->_restartManager, a3);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_restartManager);
  objc_storeStrong((id *)&self->_remotePrototypingAssertion, 0);
  objc_storeStrong((id *)&self->_rootSettings, 0);
  objc_storeStrong((id *)&self->_dumpingGround, 0);
  objc_storeStrong((id *)&self->_routingKeysAssertion, 0);
  objc_storeStrong((id *)&self->_prototypingUIServerConnection, 0);
}

@end
