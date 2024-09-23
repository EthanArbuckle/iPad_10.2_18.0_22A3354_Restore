@implementation _UIKeyWindowSceneObserver

- (id)_settingsDiffActionsForScene:(id)a3
{
  void *v3;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_observerFlags & 1) == 0)
    goto LABEL_5;
  if (qword_1ECD7F778 != -1)
    dispatch_once(&qword_1ECD7F778, &__block_literal_global_433);
  if (!_MergedGlobals_1184)
  {
    v5 = (void *)objc_opt_new();
    v6[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (_UIKeyWindowSceneObserver)initWithScene:(id)a3
{
  void *v5;
  _UIKeyWindowSceneObserver *v6;
  char isKindOfClass;
  id WeakRetained;
  _BYTE *v9;
  void *v10;
  void *v11;
  BKSHIDEventDeliveryPolicyObserver *v12;
  BKSHIDEventDeliveryPolicyObserver *hidPolicyObserver;
  BKSHIDEventDeliveryPolicyObserver *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v19;
  const char *Name;
  const char *v21;
  unint64_t v22;
  const char *v23;
  unint64_t Node;
  NSObject *v25;
  const char *v26;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  +[_UIKeyWindowEvaluator sharedEvaluator](_UIKeyWindowEvaluator, "sharedEvaluator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v27.receiver = self;
    v27.super_class = (Class)_UIKeyWindowSceneObserver;
    v6 = -[_UIKeyWindowSceneObserver init](&v27, sel_init);
    self = v6;
    if (v6)
    {
      objc_storeWeak((id *)&v6->_scene, a3);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      *(_BYTE *)&self->_observerFlags = *(_BYTE *)&self->_observerFlags & 0xFE | isKindOfClass & 1;
      if ((isKindOfClass & 1) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
        v9 = (_BYTE *)qword_1ECD7F750;
        if (!qword_1ECD7F750)
        {
          v9 = (_BYTE *)(__UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
          atomic_store((unint64_t)v9, (unint64_t *)&qword_1ECD7F750);
        }
        if ((*v9 & 1) != 0)
        {
          v19 = (objc_class *)objc_opt_class();
          Name = class_getName(v19);
          v21 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(WeakRetained);
          v22 = qword_1ECD7F758;
          if (!qword_1ECD7F758)
          {
            v23 = v21;
            Node = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode);
            v21 = v23;
            v22 = Node - 16;
            atomic_store(v22, (unint64_t *)&qword_1ECD7F758);
          }
          if ((*(_BYTE *)v22 & 1) != 0)
          {
            v25 = *(NSObject **)(v22 + 8);
            v26 = v21;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v29 = Name;
              v30 = 2050;
              v31 = WeakRetained;
              v32 = 2082;
              v33 = v26;
              _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Scene did connect: %{public}s: %{public}p; scene identity: %{public}s",
                buf,
                0x20u);
            }
          }
        }
        if (qword_1ECD7F778 != -1)
          dispatch_once(&qword_1ECD7F778, &__block_literal_global_433);
        if (_MergedGlobals_1184)
        {
          objc_msgSend(a3, "_FBSScene");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identityToken");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = (BKSHIDEventDeliveryPolicyObserver *)objc_opt_new();
            hidPolicyObserver = self->_hidPolicyObserver;
            self->_hidPolicyObserver = v12;

            -[BKSHIDEventDeliveryPolicyObserver addObserver:](self->_hidPolicyObserver, "addObserver:", self);
            v14 = self->_hidPolicyObserver;
            v15 = (void *)MEMORY[0x1E0D00CB8];
            objc_msgSend(v11, "stringRepresentation");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "tokenForString:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[BKSHIDEventDeliveryPolicyObserver setDeferringToken:](v14, "setDeferringToken:", v17);

          }
        }
        objc_storeStrong((id *)&self->_keyWindowEvaluator, v5);
        -[_UIKeyWindowEvaluator windowSceneDidConnect:]((uint64_t)self->_keyWindowEvaluator, WeakRetained);
        -[_UIKeyWindowSceneObserver evaluateTargetOfEventDeferringEnvironments]((uint64_t)self);

      }
    }
  }

  return self;
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  id WeakRetained;
  _BYTE *v8;
  objc_class *v9;
  const char *Name;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  const char *v15;
  unint64_t v16;
  const char *v17;
  unint64_t Node;
  NSObject *v19;
  const char *v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_observerFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    v8 = (_BYTE *)qword_1ECD7F760;
    if (!qword_1ECD7F760)
    {
      v8 = (_BYTE *)(__UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
      atomic_store((unint64_t)v8, (unint64_t *)&qword_1ECD7F760);
    }
    if ((*v8 & 1) != 0)
    {
      v9 = (objc_class *)objc_opt_class();
      Name = class_getName(v9);
      _NSStringFromUISceneActivationState(objc_msgSend(WeakRetained, "activationState"));
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "UTF8String");

      _NSStringFromUISceneActivationState(a4);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = objc_msgSend(v13, "UTF8String");

      v15 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(WeakRetained);
      v16 = qword_1ECD7F768;
      if (!qword_1ECD7F768)
      {
        v17 = v15;
        Node = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode);
        v15 = v17;
        v16 = Node - 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD7F768);
      }
      if ((*(_BYTE *)v16 & 1) != 0)
      {
        v19 = *(NSObject **)(v16 + 8);
        v20 = v15;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v21 = 136447234;
          v22 = Name;
          v23 = 2050;
          v24 = WeakRetained;
          v25 = 2082;
          v26 = v12;
          v27 = 2082;
          v28 = v14;
          v29 = 2082;
          v30 = v20;
          _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Scene will transition to activation state: %{public}s: %{public}p; from %{public}s to %{public}s; scene iden"
            "tity: %{public}s",
            (uint8_t *)&v21,
            0x34u);
        }
      }
    }
    -[_UIKeyWindowEvaluator windowScene:willTransitionToActivationState:]((uint64_t)self->_keyWindowEvaluator, WeakRetained, a4);

  }
}

- (_UIKeyWindowSceneObserver)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKeyWindowSceneObserver.m"), 122, CFSTR("%s: init is not allowed on %@"), "-[_UIKeyWindowSceneObserver init]", objc_opt_class());

  return 0;
}

- (void)evaluateTargetOfEventDeferringEnvironments
{
  id *v2;
  id WeakRetained;
  char v4;
  id v5;
  char isKindOfClass;
  _DWORD *v7;
  uint64_t v8;
  id v9;
  objc_class *v10;
  const char *Name;
  const char *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = objc_msgSend(WeakRetained, "_allowsEventUIWindowRouting");

    v5 = objc_loadWeakRetained(v2);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((v4 & 1) != 0 || (isKindOfClass & 1) != 0)
    {
      v7 = objc_loadWeakRetained(v2);
      if (qword_1ECD7F778 != -1)
        dispatch_once(&qword_1ECD7F778, &__block_literal_global_433);
      if (_MergedGlobals_1184)
      {
        v8 = objc_msgSend(*(id *)(a1 + 16), "policyStatus");
        -[UIScene _targetOfKeyboardEventDeferringEnvironmentDidUpdate:](v7, v8 > 0);
        if (v8 >= 1)
          goto LABEL_8;
      }
      else
      {
        v17 = objc_loadWeakRetained(v2);
        objc_msgSend(v17, "_FBSScene");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "settings");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isUISubclass");

        if ((v20 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_loadWeakRetained(v2);
          objc_msgSend(v22, "_FBSScene");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "uiSettings");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "targetOfEventDeferringEnvironments");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v22) = objc_msgSend(v25, "containsObject:", v21);
          -[UIScene _targetOfKeyboardEventDeferringEnvironmentDidUpdate:](v7, (int)v22);
          if ((v22 & 1) != 0)
          {
LABEL_8:
            +[_UIEventDeferringManager targetOfEventDeferringEnvironmentsDidUpdateForScene:]((uint64_t)_UIEventDeferringManager, v7);
            if ((isKindOfClass & 1) != 0)
            {
              v9 = objc_loadWeakRetained(v2);
              v10 = (objc_class *)objc_opt_class();
              Name = class_getName(v10);
              v12 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(v9);
              v13 = qword_1ECD7F770;
              if (!qword_1ECD7F770)
              {
                v13 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v13, (unint64_t *)&qword_1ECD7F770);
              }
              v14 = *(NSObject **)(v13 + 8);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                v26 = 136446722;
                v27 = Name;
                v28 = 2050;
                v29 = v9;
                v30 = 2080;
                v31 = v12;
                _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "Scene became target of keyboard event deferring environment: %{public}s: %{public}p; scene identity: %s",
                  (uint8_t *)&v26,
                  0x20u);
              }
              -[_UIKeyWindowEvaluator windowSceneDidBecomeTargetOfKeyboardEventDeferringEnvironment:](*(char **)(a1 + 8), v9);
              -[UIWindowScene _keyWindow]((id *)v9);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                -[UIWindowScene _keyWindow]((id *)v9);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "_restoreFirstResponder");

              }
            }
          }
        }
        else
        {
          -[UIScene _targetOfKeyboardEventDeferringEnvironmentDidUpdate:](v7, 0);
        }
      }

    }
  }
}

- (void)_sceneWillInvalidate:(id)a3
{
  id WeakRetained;
  objc_class *v5;
  const char *Name;
  const char *v7;
  unint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_observerFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    v7 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(WeakRetained);
    v8 = _sceneWillInvalidate____s_category_0;
    if (!_sceneWillInvalidate____s_category_0)
    {
      v8 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_sceneWillInvalidate____s_category_0);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136446722;
      v11 = Name;
      v12 = 2050;
      v13 = WeakRetained;
      v14 = 2082;
      v15 = v7;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Scene will invalidate: %{public}s: %{public}p; scene identity: %{public}s",
        (uint8_t *)&v10,
        0x20u);
    }
    -[_UIKeyWindowEvaluator windowSceneWillInvalidate:]((uint64_t)self->_keyWindowEvaluator, WeakRetained);

  }
}

- (void)observerDeliveryPolicyDidChange:(id)a3
{
  id v3;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v3, &location);
  BSDispatchMain();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v6 = objc_opt_class();
  v7 = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; windowScene: <%@: %p>>"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_hidPolicyObserver, 0);
  objc_storeStrong((id *)&self->_keyWindowEvaluator, 0);
}

@end
