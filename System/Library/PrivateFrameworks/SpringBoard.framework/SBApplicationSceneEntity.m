@implementation SBApplicationSceneEntity

- (void)clearProcessSettings
{
  -[SBProcessSettings clearProcessSettings](self->_processSettings, "clearProcessSettings");
}

- (BOOL)isApplicationSceneEntity
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SBApplicationSceneEntity sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (SBApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (BOOL)_supportsLayoutRole:(int64_t)a3
{
  return a3 == 1;
}

- (SBApplication)application
{
  return -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
}

- (void)_initializeWithSceneHandle:(id)a3
{
  SBProcessSettings *v5;
  SBProcessSettings *processSettings;
  NSMutableSet *v7;
  NSMutableSet *actions;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_sceneHandle, a3);
  v5 = objc_alloc_init(SBProcessSettings);
  processSettings = self->_processSettings;
  self->_processSettings = v5;

  v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  actions = self->_actions;
  self->_actions = v7;

  -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "info");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "wantsLaunchWithoutPNG"))
    -[SBWorkspaceEntity setFlag:forActivationSetting:](self, "setFlag:forActivationSetting:", 1, 7);
  if (objc_msgSend(v10, "shouldLaunchWithLiveContentASAP"))
    -[SBWorkspaceEntity setFlag:forActivationSetting:](self, "setFlag:forActivationSetting:", 1, 10);
  if (objc_msgSend(v10, "shouldLaunchSuspendedAlways"))
    -[SBWorkspaceEntity setFlag:forActivationSetting:](self, "setFlag:forActivationSetting:", 1, 3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processSettings, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

id __43__SBApplicationSceneEntity_entityGenerator__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "_initWithSceneHandle:", *(_QWORD *)(a1 + 32));
}

- (id)_initWithSceneHandle:(id)a3
{
  id v5;
  void *v6;
  SBApplicationSceneEntity *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneEntity.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneHandle"));

  }
  objc_msgSend(v5, "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SBApplicationSceneEntity;
  v7 = -[SBWorkspaceEntity initWithIdentifier:displayChangeSettings:](&v10, sel_initWithIdentifier_displayChangeSettings_, v6, 0);

  if (v7)
    -[SBApplicationSceneEntity _initializeWithSceneHandle:](v7, "_initializeWithSceneHandle:", v5);

  return v7;
}

- (id)entityGenerator
{
  SBApplicationSceneHandle *v2;
  uint64_t v3;
  SBApplicationSceneHandle *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  SBApplicationSceneHandle *v12;
  uint64_t v13;

  v2 = self->_sceneHandle;
  v3 = objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__SBApplicationSceneEntity_entityGenerator__block_invoke;
  v11[3] = &unk_1E8EBDB18;
  v12 = v2;
  v13 = v3;
  v4 = v2;
  v5 = (void *)MEMORY[0x1D17E5550](v11);
  v9 = (void *)MEMORY[0x1D17E5550](v5, v6, v7, v8);

  return v9;
}

- (id)objectForProcessSetting:(int64_t)a3
{
  return -[SBProcessSettings objectForProcessSetting:](self->_processSettings, "objectForProcessSetting:", a3);
}

- (BOOL)BOOLForProcessSetting:(int64_t)a3
{
  return -[SBProcessSettings BOOLForProcessSetting:](self->_processSettings, "BOOLForProcessSetting:", a3);
}

- (void)translateActivationSettingsToActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  -[SBWorkspaceEntity objectForActivationSetting:](self, "objectForActivationSetting:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSceneEntity actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SBApplicationSceneEntity_Actions__translateActivationSettingsToActions__block_invoke;
  v9[3] = &unk_1E8EA3DE8;
  v9[4] = self;
  v6 = v3;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
  if (v6 && !*((_BYTE *)v13 + 24))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7E0]), "initWithURL:", v6);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBApplicationSceneEntity addActions:](self, "addActions:", v8);

    }
  }

  _Block_object_dispose(&v12, 8);
}

- (NSSet)actions
{
  return &self->_actions->super;
}

- (void)removeAllActions
{
  -[NSMutableSet removeAllObjects](self->_actions, "removeAllObjects");
}

- (void)applyProcessSettings:(id)a3
{
  id v4;
  SBProcessSettings *v5;
  SBProcessSettings *processSettings;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4 && !self->_processSettings)
  {
    v5 = objc_alloc_init(SBProcessSettings);
    processSettings = self->_processSettings;
    self->_processSettings = v5;

    v4 = v7;
  }
  -[SBProcessSettings applyProcessSettings:](self->_processSettings, "applyProcessSettings:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBApplicationSceneEntity;
  v4 = -[SBWorkspaceEntity copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "_initializeWithSceneHandle:", self->_sceneHandle);
  objc_msgSend(v4, "applyProcessSettings:", self->_processSettings);
  objc_msgSend(v4, "addActions:", self->_actions);
  return v4;
}

- (void)addActions:(id)a3
{
  if (a3)
    -[NSMutableSet unionSet:](self->_actions, "unionSet:");
}

- (void)setObject:(id)a3 forProcessSetting:(int64_t)a4
{
  id v6;
  SBProcessSettings *v7;
  SBProcessSettings *processSettings;
  id v9;

  v6 = a3;
  v9 = v6;
  if (v6 && !self->_processSettings)
  {
    v7 = objc_alloc_init(SBProcessSettings);
    processSettings = self->_processSettings;
    self->_processSettings = v7;

    v6 = v9;
  }
  -[SBProcessSettings setObject:forProcessSetting:](self->_processSettings, "setObject:forProcessSetting:", v6, a4);

}

- (void)setFlag:(int64_t)a3 forProcessSetting:(int64_t)a4
{
  SBProcessSettings *v7;
  SBProcessSettings *processSettings;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL && !self->_processSettings)
  {
    v7 = objc_alloc_init(SBProcessSettings);
    processSettings = self->_processSettings;
    self->_processSettings = v7;

  }
  -[SBProcessSettings setFlag:forProcessSetting:](self->_processSettings, "setFlag:forProcessSetting:", a3, a4);
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
    -[SBApplicationSceneEntity sceneHandle](self, "sceneHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __73__SBApplicationSceneEntity_Actions__translateActivationSettingsToActions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "UIActionType") == 6)
    objc_msgSend(*(id *)(a1 + 32), "setFlag:forActivationSetting:", 1, 40);
  if (*(_QWORD *)(a1 + 40) && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "url");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
  }

}

- (int64_t)flagForProcessSetting:(int64_t)a3
{
  SBProcessSettings *processSettings;

  processSettings = self->_processSettings;
  if (processSettings)
    return -[SBProcessSettings flagForProcessSetting:](processSettings, "flagForProcessSetting:", a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)copyProcessSettings
{
  return (id)-[SBProcessSettings copy](self->_processSettings, "copy");
}

- (void)removeActions:(id)a3
{
  if (a3)
    -[NSMutableSet minusSet:](self->_actions, "minusSet:");
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  SBProcessSettings *processSettings;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBApplicationSceneEntity;
  -[SBWorkspaceEntity descriptionBuilderWithMultilinePrefix:](&v10, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  processSettings = self->_processSettings;
  if (processSettings && !-[SBProcessSettings isEmpty](processSettings, "isEmpty")
    || -[NSMutableSet count](self->_actions, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__SBApplicationSceneEntity_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_1E8E9E820;
    v8[4] = self;
    v9 = v5;
    objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v8);

  }
  return v5;
}

id __66__SBApplicationSceneEntity_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "isEmpty") & 1) == 0)
    v2 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), CFSTR("processSettings"), 1);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("actions"), 1);

  return (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), CFSTR("sceneHandle"));
}

- (SBProcessSettings)processSettings
{
  return self->_processSettings;
}

- (Class)viewControllerClass
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
