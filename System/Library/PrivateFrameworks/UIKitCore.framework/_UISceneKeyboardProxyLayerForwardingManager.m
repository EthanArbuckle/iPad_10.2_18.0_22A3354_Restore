@implementation _UISceneKeyboardProxyLayerForwardingManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___UISceneKeyboardProxyLayerForwardingManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7CE20 != -1)
    dispatch_once(&qword_1ECD7CE20, block);
  return (id)qword_1ECD7CE18;
}

- (void)trackPresentationEnvironment:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    if (!objc_msgSend((id)objc_opt_class(), "isRootSystemShellProcess")
      || (v5 = objc_msgSend((id)objc_opt_class(), "forwardsLayersToRootSystemShell"), v4 = v8, v5))
    {
      -[NSMapTable objectForKey:](self->_mapEnvironmentToKeyboardForwardingStateMachine, "objectForKey:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v8;
      if (!v6)
      {
        objc_msgSend(v8, "addObserver:", self);
        v7 = -[_UISceneKeyboardProxyLayerForwardingManager _newStateMachineWithPresentationEnvironment:](self, "_newStateMachineWithPresentationEnvironment:", v8);
        -[NSMapTable setObject:forKey:](self->_mapEnvironmentToKeyboardForwardingStateMachine, "setObject:forKey:", v7, v8);
        -[_UISceneKeyboardProxyLayerForwardingManager _updateKeyboardLayersForPresentationEnvironment:](self, "_updateKeyboardLayersForPresentationEnvironment:", v8);

        v4 = v8;
      }
    }
  }

}

+ (BOOL)isRootSystemShellProcess
{
  if (qword_1ECD7CE28 != -1)
    dispatch_once(&qword_1ECD7CE28, &__block_literal_global_75);
  return _MergedGlobals_971;
}

- (_UISceneKeyboardProxyLayerForwardingManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingManager.m"), 28, CFSTR("-[_UISceneKeyboardProxyLayerForwardingManager init] is unavailable."));

  return (_UISceneKeyboardProxyLayerForwardingManager *)-[_UISceneKeyboardProxyLayerForwardingManager _init](self, "_init");
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UISceneKeyboardProxyLayerForwardingManager.m"), 33, CFSTR("+[_UISceneKeyboardProxyLayerForwardingManager new] is unavailable."));

  return (id)objc_msgSend(objc_alloc((Class)a1), "_init");
}

- (id)_init
{
  _UISceneKeyboardProxyLayerForwardingManager *v2;
  uint64_t v3;
  NSMapTable *mapEnvironmentToKeyboardForwardingStateMachine;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISceneKeyboardProxyLayerForwardingManager;
  v2 = -[_UISceneKeyboardProxyLayerForwardingManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 10);
    mapEnvironmentToKeyboardForwardingStateMachine = v2->_mapEnvironmentToKeyboardForwardingStateMachine;
    v2->_mapEnvironmentToKeyboardForwardingStateMachine = (NSMapTable *)v3;

  }
  return v2;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UISceneKeyboardProxyLayerForwardingManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UISceneKeyboardProxyLayerForwardingManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UISceneKeyboardProxyLayerForwardingManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[_UISceneKeyboardProxyLayerForwardingManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_mapEnvironmentToKeyboardForwardingStateMachine, CFSTR("presentationEnvironmentToStateMachineMap"));
  return v4;
}

- (void)presentationEnvironmentDidInvalidate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_UISceneKeyboardProxyLayerForwardingManager _stateMachineForPresentationEnvironment:](self, "_stateMachineForPresentationEnvironment:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteKeyboardLayersBeingTracked:", 0);

  -[NSMapTable removeObjectForKey:](self->_mapEnvironmentToKeyboardForwardingStateMachine, "removeObjectForKey:", v5);
  objc_msgSend(v5, "removeObserver:", self);

}

- (id)_newStateMachineWithPresentationEnvironment:(id)a3
{
  id v3;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v4;

  v3 = a3;
  v4 = -[_UISceneKeyboardProxyLayerForwardingStateMachine initWithPresentationEnvironment:]([_UISceneKeyboardProxyLayerForwardingStateMachine alloc], "initWithPresentationEnvironment:", v3);

  return v4;
}

- (id)_stateMachineForPresentationEnvironment:(id)a3
{
  return -[NSMapTable objectForKey:](self->_mapEnvironmentToKeyboardForwardingStateMachine, "objectForKey:", a3);
}

- (void)_updateKeyboardLayersForPresentationEnvironment:(id)a3
{
  NSMapTable *mapEnvironmentToKeyboardForwardingStateMachine;
  id v4;
  void *v5;
  id v6;

  mapEnvironmentToKeyboardForwardingStateMachine = self->_mapEnvironmentToKeyboardForwardingStateMachine;
  v4 = a3;
  -[NSMapTable objectForKey:](mapEnvironmentToKeyboardForwardingStateMachine, "objectForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "noteKeyboardLayersBeingTracked:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapEnvironmentToKeyboardForwardingStateMachine, 0);
}

@end
