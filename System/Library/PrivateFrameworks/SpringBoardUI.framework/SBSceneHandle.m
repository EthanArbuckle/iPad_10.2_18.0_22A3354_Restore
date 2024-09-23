@implementation SBSceneHandle

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (void)sceneMonitor:(id)a3 sceneClientSettingsDidChangeWithDiff:(id)a4 transitionContext:(id)a5
{
  if (a4)
  {
    if (self->_scene)
      -[SBSceneHandle _didUpdateClientSettingsWithDiff:transitionContext:](self, "_didUpdateClientSettingsWithDiff:transitionContext:", a4, a5);
  }
}

- (FBSSceneDefinition)_definition
{
  return self->_definition;
}

- (void)_didCreateScene:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__SBSceneHandle__didCreateScene___block_invoke;
  v3[3] = &unk_24D4D00B8;
  v3[4] = self;
  -[SBSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v3);
}

- (void)_noteSceneCreated:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!self->_manuallyControlsLifecycle)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHandle.m"), 287, CFSTR("Cannot have scene creation/destruction invoked when using a scene monitor for lifecycle events."));

    v5 = v7;
  }
  -[SBSceneHandle _setScene:](self, "_setScene:", v5);

}

- (void)_setScene:(id)a3
{
  FBScene *v4;
  FBScene *scene;
  FBScene *v6;
  FBScene *v7;
  FBScene *v8;
  FBScene *v9;
  FBScene *v10;

  v4 = (FBScene *)a3;
  scene = self->_scene;
  if (scene != v4)
  {
    v10 = v4;
    v6 = v4;
    v7 = self->_scene;
    self->_scene = v6;
    v8 = scene;

    v9 = self->_scene;
    if (v9)
    {
      -[FBScene addObserver:](v9, "addObserver:", self);
      -[SBSceneHandle _didCreateScene:](self, "_didCreateScene:", self->_scene);
    }
    else
    {
      -[FBScene removeObserver:](v8, "removeObserver:", self);
      -[SBSceneHandle _didDestroyScene:](self, "_didDestroyScene:", v8);
    }

    v4 = v10;
  }

}

- (id)_initWithDefinition:(id)a3 scene:(id)a4 displayIdentity:(id)a5
{
  unint64_t v9;
  unint64_t v10;
  id v11;
  SBSceneHandle *v12;
  SBSceneHandle *v13;
  FBSSceneDefinition *v14;
  FBSSceneDefinition *definition;
  uint64_t v16;
  FBSceneMonitor *sceneMonitor;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v23;
  void *v24;
  objc_super v25;

  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  v11 = a5;
  if (!(v9 | v10))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHandle.m"), 70, CFSTR("Scene or definition must be provided."));

  }
  v25.receiver = self;
  v25.super_class = (Class)SBSceneHandle;
  v12 = -[SBSceneHandle init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayIdentity, a5);
    if (v10)
    {
      objc_msgSend((id)v10, "definition");
      v14 = (FBSSceneDefinition *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (FBSSceneDefinition *)(id)v9;
    }
    definition = v13->_definition;
    v13->_definition = v14;

    -[SBSceneHandle _createMonitor](v13, "_createMonitor");
    v16 = objc_claimAutoreleasedReturnValue();
    sceneMonitor = v13->_sceneMonitor;
    v13->_sceneMonitor = (FBSceneMonitor *)v16;

    -[FBSceneMonitor setDelegate:](v13->_sceneMonitor, "setDelegate:", v13);
    -[SBSceneHandle _commonInit](v13, "_commonInit");
    -[FBSceneMonitor scene](v13->_sceneMonitor, "scene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v10)
    {

      if (v19 != (id)v10)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("SBSceneHandle.m"), 85, CFSTR("Given scene and monitor'd scene do not match."));

      }
      -[SBSceneHandle _setScene:](v13, "_setScene:", v10);
    }
    else
    {
      v20 = objc_msgSend(v18, "isValid");

      if (v20)
      {
        -[FBSceneMonitor scene](v13->_sceneMonitor, "scene");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSceneHandle _setScene:](v13, "_setScene:", v21);

      }
    }
  }

  return v13;
}

- (id)_createMonitor
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE38108]);
  -[SBSceneHandle sceneIdentifier](self, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSceneID:", v4);

  return v5;
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!self->_scene)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHandle.m"), 384, CFSTR("A scene is required for the content host manager state to change."));

    v5 = v7;
  }
  -[SBSceneHandle _didUpdateContentState:](self, "_didUpdateContentState:", objc_msgSend(v5, "contentState"));

}

- (void)_didUpdateContentState:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__SBSceneHandle__didUpdateContentState___block_invoke;
  v3[3] = &unk_24D4D0108;
  v3[4] = self;
  v3[5] = a3;
  -[SBSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v3);
}

- (void)_didUpdateSettingsWithDiff:(id)a3 previousSettings:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__SBSceneHandle__didUpdateSettingsWithDiff_previousSettings___block_invoke;
  v10[3] = &unk_24D4D0130;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v10);

}

- (void)_didUpdateClientSettingsWithDiff:(id)a3 transitionContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__SBSceneHandle__didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
  v10[3] = &unk_24D4D0130;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v10);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SBSceneHandle sceneIdentifier](self, "sceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SBSceneHandle sceneIdentifier](self, "sceneIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)sceneIdentifier
{
  void *v2;
  void *v3;

  -[FBSSceneDefinition identity](self->_definition, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        -[NSMapTable objectForKey:](self->_observersToObserverBehaviors, "objectForKey:", v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          v4[2](v4, v12, v8);
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);

  }
}

void __68__SBSceneHandle__didUpdateClientSettingsWithDiff_transitionContext___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "didUpdateClientSettingsWithDiff"))
    objc_msgSend(v5, "sceneHandle:didUpdateClientSettingsWithDiff:transitionContext:", a1[4], a1[5], a1[6]);

}

void __61__SBSceneHandle__didUpdateSettingsWithDiff_previousSettings___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "didUpdateSettingsWithDiff"))
    objc_msgSend(v5, "sceneHandle:didUpdateSettingsWithDiff:previousSettings:", a1[4], a1[5], a1[6]);

}

void __40__SBSceneHandle__didUpdateContentState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "didUpdateContentState"))
    objc_msgSend(v5, "sceneHandle:didUpdateContentState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __33__SBSceneHandle__didCreateScene___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "didCreateScene"))
    objc_msgSend(v5, "sceneHandle:didCreateScene:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

}

- (BOOL)isContentReady
{
  return -[SBSceneHandle contentState](self, "contentState") == 2;
}

- (int64_t)contentState
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBSceneHandle sceneIfExists](self, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "contentState");
  else
    v4 = 0;

  return v4;
}

- (FBScene)sceneIfExists
{
  return self->_scene;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  NSMapTable *v8;
  NSMapTable *observersToObserverBehaviors;
  NSMapTable *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v12 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 517, 0);
      v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      observersToObserverBehaviors = self->_observersToObserverBehaviors;
      self->_observersToObserverBehaviors = v8;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v12);
    v10 = self->_observersToObserverBehaviors;
    +[_SBSceneHandleObserverBehavior behaviorFromObserver:](_SBSceneHandleObserverBehavior, "behaviorFromObserver:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v10, "setObject:forKey:", v11, v12);

    v4 = v12;
  }

}

- (void)sceneMonitor:(id)a3 sceneSettingsDidChangeWithDiff:(id)a4 previousSettings:(id)a5
{
  if (a4)
  {
    if (self->_scene)
      -[SBSceneHandle _didUpdateSettingsWithDiff:previousSettings:](self, "_didUpdateSettingsWithDiff:previousSettings:", a4, a5);
  }
}

- (FBScene)scene
{
  FBScene *scene;
  void *v6;

  scene = self->_scene;
  if (!scene)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHandle.m"), 109, CFSTR("Required scene wasn't found from scene handle: %@"), self);

    scene = self->_scene;
  }
  return scene;
}

- (BOOL)isPairedWithExternalSceneWithIdentifier:(id)a3
{
  return -[FBSceneMonitor isPairedWithExternalSceneID:](self->_sceneMonitor, "isPairedWithExternalSceneID:", a3);
}

- (void)sceneMonitor:(id)a3 sceneWasCreated:(id)a4
{
  if (!self->_manuallyControlsLifecycle)
    -[SBSceneHandle _setScene:](self, "_setScene:", a4);
}

- (void)removeObserver:(id)a3
{
  NSMapTable *observersToObserverBehaviors;
  id v5;

  if (a3)
  {
    observersToObserverBehaviors = self->_observersToObserverBehaviors;
    v5 = a3;
    -[NSMapTable removeObjectForKey:](observersToObserverBehaviors, "removeObjectForKey:", v5);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  }
}

- (void)_setManuallyControlsLifecycle:(BOOL)a3
{
  self->_manuallyControlsLifecycle = a3;
}

- (id)_initWithDefinition:(id)a3 displayIdentity:(id)a4
{
  return -[SBSceneHandle _initWithDefinition:scene:displayIdentity:](self, "_initWithDefinition:scene:displayIdentity:", a3, 0, a4);
}

- (SBSceneHandle)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHandle.m"), 57, CFSTR("init is unavailable for SBSceneHandle."));

  return 0;
}

- (id)_initWithScene:(id)a3 displayIdentity:(id)a4
{
  return -[SBSceneHandle _initWithDefinition:scene:displayIdentity:](self, "_initWithDefinition:scene:displayIdentity:", 0, a3, a4);
}

- (void)dealloc
{
  FBSceneMonitor *v3;
  FBSceneMonitor *v4;
  objc_super v5;
  _QWORD block[4];
  FBSceneMonitor *v7;

  -[FBScene removeObserver:](self->_scene, "removeObserver:", self);
  v3 = self->_sceneMonitor;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__SBSceneHandle_dealloc__block_invoke;
  block[3] = &unk_24D4CFFF8;
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  v5.receiver = self;
  v5.super_class = (Class)SBSceneHandle;
  -[SBSceneHandle dealloc](&v5, sel_dealloc);
}

uint64_t __24__SBSceneHandle_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)addActionConsumer:(id)a3
{
  id v4;
  NSHashTable *actionConsumers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    actionConsumers = self->_actionConsumers;
    v8 = v4;
    if (!actionConsumers)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_actionConsumers;
      self->_actionConsumers = v6;

      actionConsumers = self->_actionConsumers;
    }
    -[NSHashTable addObject:](actionConsumers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeActionConsumer:(id)a3
{
  id v4;
  NSUInteger v5;
  NSHashTable *actionConsumers;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSHashTable removeObject:](self->_actionConsumers, "removeObject:", v4);
    v5 = -[NSHashTable count](self->_actionConsumers, "count");
    v4 = v7;
    if (!v5)
    {
      actionConsumers = self->_actionConsumers;
      self->_actionConsumers = 0;

      v4 = v7;
    }
  }

}

- (NSString)description
{
  return (NSString *)-[SBSceneHandle descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)_didDestroyScene:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__SBSceneHandle__didDestroyScene___block_invoke;
  v6[3] = &unk_24D4D00E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v6);

}

void __34__SBSceneHandle__didDestroyScene___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "didDestroyScene"))
    objc_msgSend(v5, "sceneHandle:didDestroyScene:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_didUpdatePairingStatusForExternalSceneIdentifiers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__SBSceneHandle__didUpdatePairingStatusForExternalSceneIdentifiers___block_invoke;
  v6[3] = &unk_24D4D00E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v6);

}

void __68__SBSceneHandle__didUpdatePairingStatusForExternalSceneIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "didUpdatePairingStatusForExternalSceneIdentifiers"))
    objc_msgSend(v5, "sceneHandle:didUpdatePairingStatusForExternalSceneIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (FBSSceneIdentity)_sceneIdentity
{
  return (FBSSceneIdentity *)-[FBSSceneDefinition identity](self->_definition, "identity");
}

- (void)_setSceneMonitor:(id)a3
{
  FBSceneMonitor *v5;
  FBSceneMonitor *sceneMonitor;
  FBSceneMonitor **p_sceneMonitor;
  FBSceneMonitor *v8;

  v5 = (FBSceneMonitor *)a3;
  p_sceneMonitor = &self->_sceneMonitor;
  sceneMonitor = self->_sceneMonitor;
  v8 = v5;
  if (sceneMonitor != v5)
  {
    -[FBSceneMonitor setDelegate:](sceneMonitor, "setDelegate:", 0);
    -[FBSceneMonitor invalidate](*p_sceneMonitor, "invalidate");
    objc_storeStrong((id *)&self->_sceneMonitor, a3);
    if (*p_sceneMonitor)
      -[FBSceneMonitor setDelegate:](*p_sceneMonitor, "setDelegate:", self);
  }

}

- (void)_noteSceneDestroyed:(id)a3
{
  FBScene *v5;
  FBScene *scene;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v5 = (FBScene *)a3;
  if (!self->_manuallyControlsLifecycle)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHandle.m"), 292, CFSTR("Cannot have scene creation/destruction invoked when using a scene monitor for lifecycle events."));

  }
  scene = self->_scene;
  if (scene)
    v7 = scene == v5;
  else
    v7 = 1;
  if (!v7)
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBSceneHandle _noteSceneDestroyed:].cold.1((uint64_t *)&self->_scene, (uint64_t)v5, v8);

    scene = self->_scene;
  }
  if (scene && scene != v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHandle.m"), 296, CFSTR("Scene destroyed did not match the scene being tracked."));

  }
  -[SBSceneHandle _setScene:](self, "_setScene:", 0);

}

- (void)_noteReplacedWithSceneHandle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__SBSceneHandle__noteReplacedWithSceneHandle___block_invoke;
  v6[3] = &unk_24D4D00E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v6);

}

void __46__SBSceneHandle__noteReplacedWithSceneHandle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "replacedWithSceneHandle"))
    objc_msgSend(v5, "sceneHandle:replacedWithSceneHandle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)_handleSceneAction:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSHashTable allObjects](self->_actionConsumers, "allObjects");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "sceneHandle:didReceiveAction:", self, v4, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSceneHandle succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneHandle sceneIdentifier](self, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("sceneID"));

  v6 = (id)objc_msgSend(v3, "appendPointer:withName:", self->_scene, CFSTR("scenePointer"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSceneHandle descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[SBSceneHandle succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_scene, CFSTR("scene"));
  return v4;
}

- (void)sceneMonitor:(id)a3 sceneWasDestroyed:(id)a4
{
  FBScene *v7;
  FBScene *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = (FBScene *)a4;
  v8 = v7;
  if (!self->_manuallyControlsLifecycle)
  {
    if (self->_scene != v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHandle.m"), 354, CFSTR("Scene destroyed did not match the scene being tracked."));

    }
    -[SBSceneHandle _setScene:](self, "_setScene:", 0);
  }

}

- (void)sceneMonitor:(id)a3 pairingStatusDidChangeForExternalSceneIDs:(id)a4
{
  if (self->_scene)
    -[SBSceneHandle _didUpdatePairingStatusForExternalSceneIdentifiers:](self, "_didUpdatePairingStatusForExternalSceneIdentifiers:", a4);
}

- (void)_setDisplayIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_displayIdentity, a3);
}

- (FBSceneMonitor)_sceneMonitor
{
  return self->_sceneMonitor;
}

- (BOOL)_manuallyControlsLifecycle
{
  return self->_manuallyControlsLifecycle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionConsumers, 0);
  objc_storeStrong((id *)&self->_observersToObserverBehaviors, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sceneMonitor, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_definition, 0);
}

- (void)_noteSceneDestroyed:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_215F8C000, log, OS_LOG_TYPE_ERROR, "*** _noteSceneDestroyed will assert: _scene %{public}@ does not match scene being destroyed %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
