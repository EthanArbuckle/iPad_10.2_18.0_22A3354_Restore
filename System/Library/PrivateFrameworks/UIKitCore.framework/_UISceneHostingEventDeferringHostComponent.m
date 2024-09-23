@implementation _UISceneHostingEventDeferringHostComponent

- (void)setScene:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISceneHostingEventDeferringHostComponent;
  -[FBSSceneComponent setScene:](&v4, sel_setScene_, a3);
  -[_UISceneHostingEventDeferringHostComponent beginObservingNotifications](self, "beginObservingNotifications");
}

- (void)setMaintainHostFirstResponderWhenClientWantsKeyboard:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  BOOL v11;

  v3 = a3;
  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneComponent hostScene](self, "hostScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v5, "addIgnoredSceneIdentityTokenString:", v8);
  else
    objc_msgSend(v5, "removeIgnoredSceneIdentityTokenString:", v8);

  -[FBSSceneComponent hostScene](self, "hostScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99___UISceneHostingEventDeferringHostComponent_setMaintainHostFirstResponderWhenClientWantsKeyboard___block_invoke;
  v10[3] = &__block_descriptor_33_e72_v16__0__FBSMutableSceneSettings__UISceneHostingEventDeferringSettings__8l;
  v11 = v3;
  objc_msgSend(v9, "updateSettingsWithBlock:", v10);

}

- (BOOL)maintainHostFirstResponderWhenClientWantsKeyboard
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maintainHostFirstResponderWhenClientWantsKeyboard");

  return v4;
}

- (void)configureEventDeferringRulesWithParentScene:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _UIEventDeferringOwnershipToken *v25;
  _UIEventDeferringOwnershipToken *eventDeferringOwnershipToken;
  unint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _UIEventDeferringOwnershipToken *v31;
  void *v32;
  id v33;
  NSObject *log;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  _UISceneHostingEventDeferringHostComponent *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventDeferringParentScene);
  if (WeakRetained == v5)
  {

  }
  else
  {
    v7 = WeakRetained;
    v8 = -[_UISceneHostingEventDeferringHostComponent clientIsEligibleForEventDeferring](self, "clientIsEligibleForEventDeferring");

    if (v8)
    {
      -[_UISceneHostingEventDeferringHostComponent tearDownEventDeferringRulesIfNecessaryWithReason:](self, "tearDownEventDeferringRulesIfNecessaryWithReason:", CFSTR("scene hosting view is moving to a new scene"));
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneHostingEventDeferringHostComponent.m"), 90, CFSTR("A valid parent scene is required to configure event deferring"));

      }
      if (!-[_UISceneHostingEventDeferringHostComponent maintainHostFirstResponderWhenClientWantsKeyboard](self, "maintainHostFirstResponderWhenClientWantsKeyboard"))
      {
        -[FBSSceneComponent hostScene](self, "hostScene");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_uiHostingController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sceneView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "becomeFirstResponder");
      }
      v12 = objc_alloc_init(MEMORY[0x1E0D00D90]);
      -[FBSSceneComponent hostScene](self, "hostScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "clientHandle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "processHandle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "pid");

      objc_msgSend(v12, "setPid:", v15);
      v38 = v13;
      objc_msgSend(v13, "identityToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringRepresentation");
      v17 = objc_claimAutoreleasedReturnValue();

      v36 = (void *)v17;
      objc_msgSend(MEMORY[0x1E0D00CB8], "tokenForString:", v17);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setToken:");
      objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: begin deferring to hosted scene in %@"), objc_opt_class(), self, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBSSceneComponent hostScene](self, "hostScene");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_uiHostingController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sceneViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "_eventDeferringManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEventDeferringManager beginRemoteEventDeferringInEnvironments:forOwningInterfaceElement:toTarget:withReason:]((uint64_t)v24, v19, v23, v12, v20);
      v25 = (_UIEventDeferringOwnershipToken *)objc_claimAutoreleasedReturnValue();
      eventDeferringOwnershipToken = self->_eventDeferringOwnershipToken;
      self->_eventDeferringOwnershipToken = v25;

      v27 = configureEventDeferringRulesWithParentScene____s_category;
      if (!configureEventDeferringRulesWithParentScene____s_category)
      {
        v27 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v27, (unint64_t *)&configureEventDeferringRulesWithParentScene____s_category);
      }
      if ((*(_BYTE *)v27 & 1) != 0)
      {
        v29 = *(NSObject **)(v27 + 8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          log = v29;
          v30 = (void *)objc_opt_class();
          v31 = self->_eventDeferringOwnershipToken;
          v33 = v30;
          -[_UIEventDeferringOwnershipToken description](v31, "description");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v40 = v30;
          v41 = 2048;
          v42 = self;
          v43 = 2112;
          v44 = v32;
          _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "<%@: %p> Deferring events with token %@", buf, 0x20u);

        }
      }
      objc_storeWeak((id *)&self->_eventDeferringParentScene, v5);

    }
  }

}

- (void)tearDownEventDeferringRulesIfNecessaryWithReason:(id)a3
{
  _UISceneUIWindowHosting **p_eventDeferringParentScene;
  id v5;
  id WeakRetained;
  void *v7;
  unint64_t v8;
  _UIEventDeferringOwnershipToken *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _UIEventDeferringOwnershipToken *eventDeferringOwnershipToken;
  id v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  _UISceneHostingEventDeferringHostComponent *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_eventDeferringOwnershipToken)
  {
    p_eventDeferringParentScene = &self->_eventDeferringParentScene;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_eventDeferringParentScene);
    objc_msgSend(WeakRetained, "_eventDeferringManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEventDeferringManager endRemoteEventDeferringForToken:withReason:]((uint64_t)v7, (uint64_t)self->_eventDeferringOwnershipToken, v5);

    v8 = tearDownEventDeferringRulesIfNecessaryWithReason____s_category;
    if (!tearDownEventDeferringRulesIfNecessaryWithReason____s_category)
    {
      v8 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&tearDownEventDeferringRulesIfNecessaryWithReason____s_category);
    }
    if ((*(_BYTE *)v8 & 1) != 0)
    {
      v10 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = (void *)objc_opt_class();
        eventDeferringOwnershipToken = self->_eventDeferringOwnershipToken;
        v14 = v12;
        -[_UIEventDeferringOwnershipToken description](eventDeferringOwnershipToken, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412802;
        v17 = v12;
        v18 = 2048;
        v19 = self;
        v20 = 2112;
        v21 = v15;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "<%@: %p> Stopped deferring events with token %@", (uint8_t *)&v16, 0x20u);

      }
    }
    v9 = self->_eventDeferringOwnershipToken;
    self->_eventDeferringOwnershipToken = 0;

    objc_storeWeak((id *)p_eventDeferringParentScene, 0);
  }
}

- (BOOL)clientIsEligibleForEventDeferring
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = 0;
  if (objc_msgSend(v2, "isActive") && v3)
  {
    objc_msgSend(v3, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isLocal") ^ 1;

  }
  return v4;
}

- (void)configurePendingEventDeferringIfNecessary
{
  _UISceneUIWindowHosting **p_parentScenePendingEventDeferringRules;
  id WeakRetained;
  id v5;

  if (!self->_eventDeferringOwnershipToken)
  {
    p_parentScenePendingEventDeferringRules = &self->_parentScenePendingEventDeferringRules;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentScenePendingEventDeferringRules);

    if (WeakRetained)
    {
      v5 = objc_loadWeakRetained((id *)p_parentScenePendingEventDeferringRules);
      -[_UISceneHostingEventDeferringHostComponent configureEventDeferringRulesWithParentScene:](self, "configureEventDeferringRulesWithParentScene:", v5);

      objc_storeWeak((id *)p_parentScenePendingEventDeferringRules, 0);
    }
    else
    {
      *(_BYTE *)&self->_flags |= 1u;
    }
  }
}

- (void)handleEventDeferringRequestFromClient
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_keyboardHostComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "suppressKeyboardFocusRequests");

  if (v5)
  {
    -[_UISceneHostingEventDeferringHostComponent severEventDeferringRules](self, "severEventDeferringRules");
  }
  else
  {
    -[_UISceneHostingEventDeferringHostComponent configurePendingEventDeferringIfNecessary](self, "configurePendingEventDeferringIfNecessary");
    -[FBSSceneComponent hostScene](self, "hostScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_uiHostingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sceneView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_window");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        -[_UIRemoteKeyboards performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:servicePID:](v9, v11, 0);

    }
  }
}

- (void)severEventDeferringRules
{
  id WeakRetained;

  if (self->_eventDeferringOwnershipToken)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_eventDeferringParentScene);
    objc_storeWeak((id *)&self->_parentScenePendingEventDeferringRules, WeakRetained);

    -[_UISceneHostingEventDeferringHostComponent tearDownEventDeferringRulesIfNecessaryWithReason:](self, "tearDownEventDeferringRulesIfNecessaryWithReason:", CFSTR("host requested severance"));
  }
}

- (void)beginObservingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_firstResponderDidChange_, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);

}

- (void)stopObservingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);

}

- (void)firstResponderDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id WeakRetained;
  int v9;
  id v10;

  objc_msgSend(a3, "object");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_windowHostingScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "handlingRemoteEvent");

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_eventDeferringParentScene);
    v9 = BSEqualObjects();

    if (((v9 ^ 1 | v7) & 1) == 0)
      -[_UISceneHostingEventDeferringHostComponent severEventDeferringRules](self, "severEventDeferringRules");
  }

}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "UIActionType", (_QWORD)v15) == 58)
        {
          objc_msgSend(v6, "addObject:", v12);
          -[_UISceneHostingEventDeferringHostComponent handleEventDeferringRequestFromClient](self, "handleEventDeferringRequestFromClient");
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  return v13;
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[_UISceneHostingEventDeferringHostComponent configurePendingEventDeferringIfNecessary](self, "configurePendingEventDeferringIfNecessary", a3, a4);
    *(_BYTE *)&self->_flags &= ~1u;
  }
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id WeakRetained;

  if (self->_eventDeferringOwnershipToken)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_eventDeferringParentScene);
    objc_storeWeak((id *)&self->_parentScenePendingEventDeferringRules, WeakRetained);

    -[_UISceneHostingEventDeferringHostComponent tearDownEventDeferringRulesIfNecessaryWithReason:](self, "tearDownEventDeferringRulesIfNecessaryWithReason:", CFSTR("scene is deactivating"));
    *(_BYTE *)&self->_flags |= 1u;
  }
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (-[_UISceneHostingEventDeferringHostComponent maintainHostFirstResponderWhenClientWantsKeyboard](self, "maintainHostFirstResponderWhenClientWantsKeyboard"))
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneComponent hostScene](self, "hostScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identityToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeIgnoredSceneIdentityTokenString:", v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)_UISceneHostingEventDeferringHostComponent;
  -[FBSSceneComponent invalidate](&v7, sel_invalidate);
  -[_UISceneHostingEventDeferringHostComponent stopObservingNotifications](self, "stopObservingNotifications");
}

- (void)_scene:(id)a3 isMovingToParent:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a4, "_windowHostingScene", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (!v5)
  {
    -[_UISceneHostingEventDeferringHostComponent tearDownEventDeferringRulesIfNecessaryWithReason:](self, "tearDownEventDeferringRulesIfNecessaryWithReason:", CFSTR("scene hosting view was removed from the hierarchy"));
    goto LABEL_7;
  }
  if (!self->_eventDeferringOwnershipToken && (*(_BYTE *)&self->_flags & 1) == 0)
  {
    objc_storeWeak((id *)&self->_parentScenePendingEventDeferringRules, v5);
LABEL_7:
    v6 = v7;
    goto LABEL_8;
  }
  -[_UISceneHostingEventDeferringHostComponent configureEventDeferringRulesWithParentScene:](self, "configureEventDeferringRulesWithParentScene:", v5);
  v6 = v7;
  *(_BYTE *)&self->_flags &= ~1u;
LABEL_8:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentScenePendingEventDeferringRules);
  objc_destroyWeak((id *)&self->_eventDeferringParentScene);
  objc_storeStrong((id *)&self->_eventDeferringOwnershipToken, 0);
}

@end
