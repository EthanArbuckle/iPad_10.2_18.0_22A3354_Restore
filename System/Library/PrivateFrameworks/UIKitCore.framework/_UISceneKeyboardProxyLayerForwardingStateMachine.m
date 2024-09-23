@implementation _UISceneKeyboardProxyLayerForwardingStateMachine

- (_UISceneKeyboardProxyLayerForwardingStateMachine)initWithPresentationEnvironment:(id)a3
{
  id v5;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v6;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v7;
  id v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  _UISceneKeyboardProxyLayerForwardingStateMachine *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingStateMachine.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment != nil"));

  }
  v14.receiver = self;
  v14.super_class = (Class)_UISceneKeyboardProxyLayerForwardingStateMachine;
  v6 = -[_UISceneKeyboardProxyLayerForwardingStateMachine init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = objc_storeWeak((id *)&v6->_presentationEnvironment, v5);
    v7->_state = 0;
    v9 = v8;
    objc_msgSend(v5, "addObserver:", v7);

    v10 = initWithPresentationEnvironment____s_category;
    if (!initWithPresentationEnvironment____s_category)
    {
      v10 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&initWithPresentationEnvironment____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v16 = v7;
      v17 = 2048;
      v18 = v5;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Created with presentation environment: <%p:%@>", buf, 0x20u);
    }
  }

  return v7;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  _UISceneKeyboardProxyLayerForwardingStateMachine *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationEnvironment);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  -[UIWindow _removeWindowLevelChangedObserver:](self->_hostingWindow, "_removeWindowLevelChangedObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self->_windowDidMoveToSceneNotificationToken);

  v5 = dealloc___s_category_5;
  if (!dealloc___s_category_5)
  {
    v5 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&dealloc___s_category_5);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Dealloc.", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)_UISceneKeyboardProxyLayerForwardingStateMachine;
  -[_UISceneKeyboardProxyLayerForwardingStateMachine dealloc](&v7, sel_dealloc);
}

- (void)noteKeyboardLayersBeingTracked:(id)a3
{
  id v5;
  NSSet *v6;
  unint64_t v7;
  NSObject *v8;
  NSUInteger v9;
  unint64_t state;
  _UISceneKeyboardProxyLayerForwardingHostingEnvironment *hostingEnvironment;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  NSSet *v15;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v16;
  uint64_t v17;
  NSSet *v18;
  void *v19;
  NSSet *v20;
  NSSet *keyboardLayersAddedToHostingEnvironment;
  void *v22;
  void *v23;
  int v24;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_keyboardLayersTracked;
  if ((BSEqualObjects() & 1) == 0)
  {
    v7 = noteKeyboardLayersBeingTracked____s_category;
    if (!noteKeyboardLayersBeingTracked____s_category)
    {
      v7 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&noteKeyboardLayersBeingTracked____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134218242;
      v25 = self;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Keyboard layers being tracked: %@", (uint8_t *)&v24, 0x16u);
    }
    objc_storeStrong((id *)&self->_keyboardLayersTracked, a3);
    v9 = -[NSSet count](self->_keyboardLayersTracked, "count");
    state = self->_state;
    if (v9)
    {
      if (state == 2)
      {
        v19 = (void *)-[NSSet copy](self->_keyboardLayersAddedToHostingEnvironment, "copy");
        v20 = -[_UISceneKeyboardProxyLayerForwardingStateMachine _newProxyLayers](self, "_newProxyLayers");
        keyboardLayersAddedToHostingEnvironment = self->_keyboardLayersAddedToHostingEnvironment;
        self->_keyboardLayersAddedToHostingEnvironment = v20;

        v22 = (void *)-[NSSet mutableCopy](self->_keyboardLayersAddedToHostingEnvironment, "mutableCopy");
        objc_msgSend(v22, "minusSet:", v19);
        v23 = (void *)objc_msgSend(v19, "mutableCopy");
        objc_msgSend(v23, "minusSet:", self->_keyboardLayersAddedToHostingEnvironment);
        -[_UISceneKeyboardProxyLayerForwardingStateMachine _addLayers:toEnvironment:](self, "_addLayers:toEnvironment:", v22, self->_hostingEnvironment);
        -[_UISceneKeyboardProxyLayerForwardingStateMachine _removeLayers:fromEnvironment:](self, "_removeLayers:fromEnvironment:", v23, self->_hostingEnvironment);

        goto LABEL_19;
      }
      if (!state)
      {
        hostingEnvironment = self->_hostingEnvironment;
        if (hostingEnvironment)
          v12 = 2;
        else
          v12 = 1;
        if (hostingEnvironment)
        {
          v13 = -[_UISceneKeyboardProxyLayerForwardingStateMachine _newProxyLayers](self, "_newProxyLayers");
          -[_UISceneKeyboardProxyLayerForwardingStateMachine _addLayers:toEnvironment:](self, "_addLayers:toEnvironment:", v13, self->_hostingEnvironment);
          v14 = (void *)-[NSSet mutableCopy](self->_keyboardLayersAddedToHostingEnvironment, "mutableCopy");
          objc_msgSend(v14, "minusSet:", v13);
          -[_UISceneKeyboardProxyLayerForwardingStateMachine _removeLayers:fromEnvironment:](self, "_removeLayers:fromEnvironment:", v14, self->_hostingEnvironment);
          v15 = self->_keyboardLayersAddedToHostingEnvironment;
          self->_keyboardLayersAddedToHostingEnvironment = v13;

        }
        v16 = self;
        v17 = v12;
        goto LABEL_17;
      }
    }
    else if (state - 1 <= 1)
    {
      -[_UISceneKeyboardProxyLayerForwardingStateMachine _removeLayers:fromEnvironment:](self, "_removeLayers:fromEnvironment:", self->_keyboardLayersAddedToHostingEnvironment, self->_hostingEnvironment);
      v18 = self->_keyboardLayersAddedToHostingEnvironment;
      self->_keyboardLayersAddedToHostingEnvironment = 0;

      v16 = self;
      v17 = 0;
LABEL_17:
      -[_UISceneKeyboardProxyLayerForwardingStateMachine _setState:](v16, "_setState:", v17);
    }
  }
LABEL_19:

}

- (unint64_t)_state
{
  return self->_state;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UISceneKeyboardProxyLayerForwardingStateMachine descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UISceneKeyboardProxyLayerForwardingStateMachine succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78___UISceneKeyboardProxyLayerForwardingStateMachine_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E16B1B50;
  v4 = v3;
  v9 = v4;
  v10 = self;
  v5 = (id)objc_msgSend(v4, "modifyProem:", v8);
  v6 = v4;

  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UISceneKeyboardProxyLayerForwardingStateMachine descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  -[_UISceneKeyboardProxyLayerForwardingStateMachine succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_hostingEnvironment, CFSTR("hostingEnvironment"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_hostingWindow, CFSTR("hostingWindow"));
  -[NSSet allObjects](self->_keyboardLayersTracked, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("keyboardLayersTracked"), 1);

  -[NSSet allObjects](self->_keyboardLayersAddedToHostingEnvironment, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("keyboardLayersForwarded"), 1);

  return v4;
}

- (void)presentationEnvironment:(id)a3 didMoveToWindow:(id)a4
{
  -[_UISceneKeyboardProxyLayerForwardingStateMachine _noteHostedInWindow:](self, "_noteHostedInWindow:", a4);
}

- (void)presentationEnvironmentDidUpdateKeyboardLayers:(id)a3
{
  id v4;

  objc_msgSend(a3, "keyboardLayers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISceneKeyboardProxyLayerForwardingStateMachine noteKeyboardLayersBeingTracked:](self, "noteKeyboardLayersBeingTracked:", v4);

}

- (void)presentationEnvironmentDidInvalidate:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = presentationEnvironmentDidInvalidate____s_category;
  if (!presentationEnvironmentDidInvalidate____s_category)
  {
    v5 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&presentationEnvironmentDidInvalidate____s_category);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Presentation environment invalidated: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)window:(id)a3 changedFromLevel:(double)a4 toLevel:(double)a5
{
  UIWindow *v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = (UIWindow *)a3;
  if (self->_hostingWindow != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingStateMachine.m"), 226, CFSTR("Window changed must match the window being tracked."));

  }
  v10 = window_changedFromLevel_toLevel____s_category;
  if (!window_changedFromLevel_toLevel____s_category)
  {
    v10 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v10, (unint64_t *)&window_changedFromLevel_toLevel____s_category);
  }
  v11 = *(NSObject **)(v10 + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218496;
    v16 = self;
    v17 = 2048;
    v18 = a4;
    v19 = 2048;
    v20 = a5;
    _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Parent window level changed from %f to %f.", (uint8_t *)&v15, 0x20u);
  }
  if (-[NSSet count](self->_keyboardLayersTracked, "count"))
  {
    v12 = -[_UISceneKeyboardProxyLayerForwardingStateMachine _newProxyLayers](self, "_newProxyLayers");
    if ((BSEqualObjects() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingStateMachine.m"), 235, CFSTR("Proxy layers should be equal, but have different levels."));

    }
    -[_UISceneKeyboardProxyLayerForwardingStateMachine _addLayers:toEnvironment:](self, "_addLayers:toEnvironment:", v12, self->_hostingEnvironment);

  }
}

- (id)hostingEnvironmentForWindow:(id)a3
{
  id *v4;
  void *v5;
  uint64_t v6;
  id *v7;
  id *v8;
  id *v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  unint64_t v15;
  NSObject *v16;
  int v18;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v19;
  __int16 v20;
  id *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  -[UIWindow _fbsScene](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id *)v6;
  if (!v5)
  {
    if (!v6)
    {
      v8 = 0;
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (v9 = v4) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v7[43];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = (id *)v10;
          v11 = _MergedGlobals_1011;
          if (!_MergedGlobals_1011)
          {
            v11 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v11, (unint64_t *)&_MergedGlobals_1011);
          }
          v12 = *(NSObject **)(v11 + 8);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v18 = 134218242;
            v19 = self;
            v20 = 2112;
            v21 = v9;
            _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Hosting environment for a view service is the text effects window, falling back to the key window (%@) for layer forwarding", (uint8_t *)&v18, 0x16u);
          }

          if (!v9)
            goto LABEL_19;
          goto LABEL_13;
        }

      }
      v9 = 0;
      goto LABEL_19;
    }
LABEL_13:
    objc_msgSend(v9, "rootViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      v8 = -[_UISceneKeyboardProxyLayerForwardingHostingViewService initWithViewServiceOperator:]((id *)[_UISceneKeyboardProxyLayerForwardingHostingViewService alloc], v14);

LABEL_24:
      goto LABEL_25;
    }

LABEL_19:
    v15 = qword_1ECD7D6A8;
    if (!qword_1ECD7D6A8)
    {
      v15 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&qword_1ECD7D6A8);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = self;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Unable to find an appropriate hosting environment for a scene that appears to be in a view service.", (uint8_t *)&v18, 0xCu);
    }
    v8 = 0;
    goto LABEL_24;
  }
  v8 = -[_UISceneKeyboardProxyLayerForwardingHostingScene initWithScene:]((id *)[_UISceneKeyboardProxyLayerForwardingHostingScene alloc], v5);
LABEL_25:

  return v8;
}

- (void)_noteHostedInWindow:(id)a3
{
  UIWindow *v5;
  _UISceneKeyboardProxyLayerForwardingHostingEnvironment *v6;
  id *p_hostingWindow;
  UIWindow *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id windowDidMoveToSceneNotificationToken;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSSet *v23;
  NSSet *keyboardLayersAddedToHostingEnvironment;
  NSSet *v25;
  void *v26;
  NSSet *v27;
  NSSet *v28;
  void *v29;
  _UISceneKeyboardProxyLayerForwardingHostingEnvironment *v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  _UISceneKeyboardProxyLayerForwardingStateMachine *v35;
  __int16 v36;
  _UISceneKeyboardProxyLayerForwardingHostingEnvironment *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = (UIWindow *)a3;
  v31 = self->_hostingEnvironment;
  -[_UISceneKeyboardProxyLayerForwardingStateMachine hostingEnvironmentForWindow:](self, "hostingEnvironmentForWindow:", v5);
  v6 = (_UISceneKeyboardProxyLayerForwardingHostingEnvironment *)objc_claimAutoreleasedReturnValue();
  p_hostingWindow = (id *)&self->_hostingWindow;
  v8 = self->_hostingWindow;
  if (BSEqualObjects() && (BSEqualObjects() & 1) != 0)
    goto LABEL_30;
  if (v8 != v5)
  {
    v9 = qword_1ECD7D6B0;
    if (!qword_1ECD7D6B0)
    {
      v9 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&qword_1ECD7D6B0);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v35 = self;
      v36 = 2112;
      v37 = (_UISceneKeyboardProxyLayerForwardingHostingEnvironment *)v5;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Hosting window did change to %@.", buf, 0x16u);
    }
    -[UIWindow _removeWindowLevelChangedObserver:](self->_hostingWindow, "_removeWindowLevelChangedObserver:", self);
    objc_storeStrong((id *)&self->_hostingWindow, a3);
    -[UIWindow _addWindowLevelChangedObserver:](self->_hostingWindow, "_addWindowLevelChangedObserver:", self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:", self->_windowDidMoveToSceneNotificationToken);

    if (!self->_hostingWindow)
    {
      v12 = qword_1ECD7D6B8;
      if (!qword_1ECD7D6B8)
      {
        v12 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD7D6B8);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v35 = self;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Waiting for a hosting window.", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *p_hostingWindow;
      objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __72___UISceneKeyboardProxyLayerForwardingStateMachine__noteHostedInWindow___block_invoke;
      v32[3] = &unk_1E16B22E0;
      objc_copyWeak(&v33, (id *)buf);
      objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", 0x1E1764CC0, v15, v16, v32);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      windowDidMoveToSceneNotificationToken = self->_windowDidMoveToSceneNotificationToken;
      self->_windowDidMoveToSceneNotificationToken = v17;

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
  }
  if (v31 != v6)
  {
    v19 = qword_1ECD7D6C0;
    if (!qword_1ECD7D6C0)
    {
      v19 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v19, (unint64_t *)&qword_1ECD7D6C0);
    }
    v20 = *(NSObject **)(v19 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      -[_UISceneKeyboardProxyLayerForwardingHostingEnvironment description](v6, "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v35 = self;
      v36 = 2048;
      v37 = v6;
      v38 = 2112;
      v39 = v22;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Hosting environment did change to <%p:%@>.", buf, 0x20u);

    }
    objc_storeStrong((id *)&self->_hostingEnvironment, v6);
    if (v5)
    {
      if (self->_state - 1 <= 1)
      {
        v23 = -[_UISceneKeyboardProxyLayerForwardingStateMachine _newProxyLayers](self, "_newProxyLayers");
        -[_UISceneKeyboardProxyLayerForwardingStateMachine _addLayers:toEnvironment:](self, "_addLayers:toEnvironment:", v23, v6);
        -[_UISceneKeyboardProxyLayerForwardingStateMachine _removeLayers:fromEnvironment:](self, "_removeLayers:fromEnvironment:", v23, v31);
        keyboardLayersAddedToHostingEnvironment = self->_keyboardLayersAddedToHostingEnvironment;
        self->_keyboardLayersAddedToHostingEnvironment = v23;

        -[_UISceneKeyboardProxyLayerForwardingStateMachine _setState:](self, "_setState:", 2);
      }
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  if (!v5)
  {
LABEL_28:
    if (self->_state == 2)
    {
      -[_UISceneKeyboardProxyLayerForwardingStateMachine _removeLayers:fromEnvironment:](self, "_removeLayers:fromEnvironment:", self->_keyboardLayersAddedToHostingEnvironment, v31);
      v28 = self->_keyboardLayersAddedToHostingEnvironment;
      self->_keyboardLayersAddedToHostingEnvironment = 0;

      -[_UISceneKeyboardProxyLayerForwardingStateMachine _setState:](self, "_setState:", 1);
    }
    goto LABEL_30;
  }
  if (BSEqualObjects())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingStateMachine.m"), 357, CFSTR("Windows must be different."));

  }
  if (self->_state == 2)
  {
    objc_msgSend(*p_hostingWindow, "windowLevel");
    -[UIWindow windowLevel](v5, "windowLevel");
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      v25 = -[_UISceneKeyboardProxyLayerForwardingStateMachine _newProxyLayers](self, "_newProxyLayers");
      -[_UISceneKeyboardProxyLayerForwardingStateMachine _addLayers:toEnvironment:](self, "_addLayers:toEnvironment:", v25, v31);
      v26 = (void *)-[NSSet mutableCopy](self->_keyboardLayersAddedToHostingEnvironment, "mutableCopy");
      objc_msgSend(v26, "minusSet:", v25);
      -[_UISceneKeyboardProxyLayerForwardingStateMachine _removeLayers:fromEnvironment:](self, "_removeLayers:fromEnvironment:", v26, self->_hostingEnvironment);
      v27 = self->_keyboardLayersAddedToHostingEnvironment;
      self->_keyboardLayersAddedToHostingEnvironment = v25;

    }
  }
LABEL_30:

}

- (void)_setState:(unint64_t)a3
{
  void *v6;
  void *v7;
  const __CFString *v8;
  SEL v9;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  unint64_t state;
  const __CFString *v15;
  const __CFString *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 2uLL:
      if (!self->_keyboardLayersTracked)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingStateMachine.m"), 391, CFSTR("Must have a keyboard layer tracked if we're forwarding kb layers."));

      }
      if (!self->_keyboardLayersAddedToHostingEnvironment)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingStateMachine.m"), 392, CFSTR("Must have a keyboard layer added to a host if we're forwarding kb layers."));

      }
      if (!self->_hostingEnvironment)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("Must have a hosting environment if we're forwarding kb layers.");
        v9 = a2;
        v10 = self;
        v11 = 393;
        goto LABEL_29;
      }
      break;
    case 1uLL:
      if (!self->_keyboardLayersTracked)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingStateMachine.m"), 386, CFSTR("Must have a keyboard layer tracked if we're eligible for forwarding."));

      }
      if (self->_keyboardLayersAddedToHostingEnvironment)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("Cannot have a keyboard layer added to a host if we're eligible for forwarding.");
        v9 = a2;
        v10 = self;
        v11 = 387;
        goto LABEL_29;
      }
      break;
    case 0uLL:
      if (self->_keyboardLayersTracked)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingStateMachine.m"), 381, CFSTR("Cannot have a keyboard layer tracked if we're not eligible for forwarding."));

      }
      if (self->_keyboardLayersAddedToHostingEnvironment)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("Cannot have a keyboard layer added to a host if we're not eligible for forwarding.");
        v9 = a2;
        v10 = self;
        v11 = 382;
LABEL_29:
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("_UISceneKeyboardProxyLayerForwardingStateMachine.m"), v11, v8);

      }
      break;
  }
  v12 = _setState____s_category;
  if (!_setState____s_category)
  {
    v12 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v12, (unint64_t *)&_setState____s_category);
  }
  v13 = *(NSObject **)(v12 + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    state = self->_state;
    if (state > 2)
      v15 = CFSTR("(unknown)");
    else
      v15 = off_1E16C34F0[state];
    if (a3 > 2)
      v16 = CFSTR("(unknown)");
    else
      v16 = off_1E16C34F0[a3];
    v22 = 134218498;
    v23 = self;
    v24 = 2112;
    v25 = v15;
    v26 = 2112;
    v27 = v16;
    v17 = v13;

  }
  self->_state = a3;
}

- (void)_addLayers:(id)a3 toEnvironment:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _addLayers_toEnvironment____s_category;
  if (!_addLayers_toEnvironment____s_category)
  {
    v8 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&_addLayers_toEnvironment____s_category);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v7, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218754;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    v16 = 2048;
    v17 = v7;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Add layers %@ to environment: <%p: %@>.", (uint8_t *)&v12, 0x2Au);

  }
  objc_msgSend(v7, "addLayers:", v6);

}

- (void)_removeLayers:(id)a3 fromEnvironment:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _removeLayers_fromEnvironment____s_category;
  if (!_removeLayers_fromEnvironment____s_category)
  {
    v8 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&_removeLayers_fromEnvironment____s_category);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v7, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218754;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    v16 = 2048;
    v17 = v7;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Remove layers %@ from environment: <%p: %@>.", (uint8_t *)&v12, 0x2Au);

  }
  objc_msgSend(v7, "removeLayers:", v6);

}

- (id)_newProxyLayers
{
  double v3;
  double v4;
  unint64_t v5;
  double v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _UISceneKeyboardProxyLayerForwardingPresentationEnvironment **p_presentationEnvironment;
  uint64_t i;
  void *v15;
  id v16;
  void *WeakRetained;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  void *v23;
  uint64_t v25;
  _UISceneKeyboardProxyLayerForwardingStateMachine *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  _UISceneKeyboardProxyLayerForwardingStateMachine *v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!self->_hostingWindow)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneKeyboardProxyLayerForwardingStateMachine.m"), 412, CFSTR("Must have a hosting window to fetch new proxy layers."));

  }
  if (!-[NSSet count](self->_keyboardLayersTracked, "count", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v25, self, CFSTR("_UISceneKeyboardProxyLayerForwardingStateMachine.m"), 413, CFSTR("Must have a keyboard layer tracked."));

  }
  -[UIWindow windowLevel](self->_hostingWindow, "windowLevel");
  v4 = v3;
  v5 = _newProxyLayers___s_category;
  if (!_newProxyLayers___s_category)
  {
    v5 = __UILogCategoryGetNode("KBProxyForwarding", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_newProxyLayers___s_category);
  }
  v6 = v4 + 1.0;
  v7 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v33 = self;
    v34 = 2048;
    v35 = v6;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Current level is %f", buf, 0x16u);
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = self;
  v9 = (void *)-[NSSet copy](self->_keyboardLayersTracked, "copy");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    p_presentationEnvironment = &self->_presentationEnvironment;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v15, "isKeyboardLayer"))
        {
          v16 = objc_alloc(MEMORY[0x1E0D23118]);
          WeakRetained = objc_loadWeakRetained((id *)p_presentationEnvironment);
          objc_msgSend(WeakRetained, "keyboardOwnerIdentityToken");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v16, "initWithLevel:keyboardOwner:", v18, v6);
          objc_msgSend(v8, "addObject:", v19);

LABEL_18:
          goto LABEL_20;
        }
        if (objc_msgSend(v15, "isKeyboardProxyLayer"))
        {
          v20 = objc_alloc(MEMORY[0x1E0D23118]);
          objc_msgSend(v15, "keyboardOwner");
          WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v20, "initWithLevel:keyboardOwner:", WeakRetained, v6);
          objc_msgSend(v8, "addObject:", v18);
          goto LABEL_18;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, CFSTR("_UISceneKeyboardProxyLayerForwardingStateMachine.m"), 425, CFSTR("Layers other than a keyboard should not be in this data structure."));
LABEL_20:

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardLayersAddedToHostingEnvironment, 0);
  objc_storeStrong((id *)&self->_keyboardLayersTracked, 0);
  objc_storeStrong((id *)&self->_hostingWindow, 0);
  objc_storeStrong(&self->_windowDidMoveToSceneNotificationToken, 0);
  objc_storeStrong((id *)&self->_hostingEnvironment, 0);
  objc_destroyWeak((id *)&self->_presentationEnvironment);
}

@end
