@implementation _UISceneHostingActivationStateHostComponent

- (void)setScene:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISceneHostingActivationStateHostComponent;
  -[FBSSceneComponent setScene:](&v6, sel_setScene_, a3);
  -[FBSSceneComponent hostScene](self, "hostScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_relationshipManagementHostComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

}

- (id)foregroundAssertionForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id location;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ++self->_foregroundAssertionCount;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[FBSSceneComponent hostScene](self, "hostScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("foregroundAssertion::%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v9 = objc_alloc(MEMORY[0x1E0D01868]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76___UISceneHostingActivationStateHostComponent_foregroundAssertionForReason___block_invoke;
  v14[3] = &unk_1E16B7FF8;
  objc_copyWeak(&v15, &location);
  v10 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", v8, v4, v14);
  v11 = foregroundAssertionForReason____s_category;
  if (!foregroundAssertionForReason____s_category)
  {
    v11 = __UILogCategoryGetNode("UISceneHostingActivationState", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&foregroundAssertionForReason____s_category);
  }
  if ((*(_BYTE *)v11 & 1) != 0)
  {
    v13 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Foreground assertion taken: %@", buf, 0xCu);
    }
  }
  -[_UISceneHostingActivationStateHostComponent evaluateActivationState](self, "evaluateActivationState");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

- (void)evaluateActivationState
{
  _UISceneHostingActivationStateHostComponent *v3;
  uint64_t v4;
  id WeakRetained;

  if (self->_foregroundAssertionCount)
  {
    -[_UISceneHostingActivationStateHostComponent propagateForeground:](self, "propagateForeground:", 0);
    v3 = self;
    v4 = 1;
LABEL_3:
    -[_UISceneHostingActivationStateHostComponent setForeground:](v3, "setForeground:", v4);
    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentEnvironment);

  if (!WeakRetained)
  {
    -[_UISceneHostingActivationStateHostComponent propagateForeground:](self, "propagateForeground:", 0);
    v3 = self;
    v4 = 0;
    goto LABEL_3;
  }
  -[_UISceneHostingActivationStateHostComponent propagateForeground:](self, "propagateForeground:", 1);
}

- (void)setForeground:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61___UISceneHostingActivationStateHostComponent_setForeground___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
  v6 = a3;
  objc_msgSend(v4, "updateSettings:", v5);

}

- (void)propagateForeground:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_isCurrentlyPropagatingForeground != a3)
  {
    self->_isCurrentlyPropagatingForeground = a3;
    -[FBSSceneComponent hostScene](self, "hostScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67___UISceneHostingActivationStateHostComponent_propagateForeground___block_invoke;
    v6[3] = &unk_1E16C1DB0;
    v7 = a3;
    v6[4] = self;
    objc_msgSend(v5, "updateSettings:", v6);

  }
}

- (void)_scene:(id)a3 isMovingToParent:(id)a4
{
  objc_storeWeak((id *)&self->_parentEnvironment, a4);
  -[_UISceneHostingActivationStateHostComponent evaluateActivationState](self, "evaluateActivationState");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentEnvironment);
}

@end
