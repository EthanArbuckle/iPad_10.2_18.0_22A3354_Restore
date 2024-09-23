@implementation _UIHostedFocusSystem

- (id)_initWithHostEnvironment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _UIHostedFocusSystem *v8;
  _UIHostedFocusSystemItemContainer *v9;
  _UIHostedFocusSystemItemContainer *itemContainerProxy;
  _UIHostedFocusSystem *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHostedFocusSystem.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hostEnvironment"));

  }
  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)_UIHostedFocusSystem;
  v8 = -[UIFocusSystem initWithFocusBehavior:enabled:](&v20, sel_initWithFocusBehavior_enabled_, v7, 1);

  if (v8)
  {
    objc_storeWeak((id *)&v8->_hostEnvironment, v5);
    v9 = -[_UIHostedFocusSystemItemContainer initWithHostedFocusSystem:]([_UIHostedFocusSystemItemContainer alloc], "initWithHostedFocusSystem:", v8);
    itemContainerProxy = v8->_itemContainerProxy;
    v8->_itemContainerProxy = v9;

    v11 = v8;
    if (qword_1ECD79E00 != -1)
      dispatch_once(&qword_1ECD79E00, &__block_literal_global_211);
    -[_UIHostedFocusSystem hostEnvironment](v11, "hostEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UIHostedFocusSystemRegister(_UIHostedFocusSystem *__strong)");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_UIHostedFocusSystem.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hostEnvironment"));

    }
    v13 = (id)_MergedGlobals_1_9;
    objc_msgSend(v13, "objectForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = v14;
      objc_msgSend(v14, "addObject:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v11);
      objc_msgSend(v13, "setObject:forKey:", v15, v12);
    }

  }
  return v8;
}

- (_UIHostedFocusSystemDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIHostedFocusSystem;
  -[UIFocusSystem delegate](&v3, sel_delegate);
  return (_UIHostedFocusSystemDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _UIHostedFocusSystemDelegateProxy *v7;
  objc_super v8;

  v4 = a3;
  -[_UIHostedFocusSystem delegateProxy](self, "delegateProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
  {
    v7 = -[_UIHostedFocusSystemDelegateProxy initWithFocusSystem:delegate:]([_UIHostedFocusSystemDelegateProxy alloc], "initWithFocusSystem:delegate:", self, v4);
    -[_UIHostedFocusSystem setDelegateProxy:](self, "setDelegateProxy:", v7);
    v8.receiver = self;
    v8.super_class = (Class)_UIHostedFocusSystem;
    -[UIFocusSystem setDelegate:](&v8, sel_setDelegate_, v7);

  }
}

- (BOOL)containsChildOfHostEnvironment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHostedFocusSystem.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("childEnvironment"));

  }
  -[_UIHostedFocusSystem delegateProxy](self, "delegateProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "_focusSystem:containsChildOfHostEnvironment:", self, v5);
  else
    v8 = 0;

  return v8;
}

- (id)behavior
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[_UIHostedFocusSystem _hostFocusSystem](self, "_hostFocusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIHostedFocusSystem;
    -[UIFocusSystem behavior](&v9, sel_behavior);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_hostFocusSystem
{
  UIFocusEnvironment **p_hostEnvironment;
  id WeakRetained;
  id v4;
  void *v5;

  p_hostEnvironment = &self->_hostEnvironment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostEnvironment);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_hostEnvironment);
    +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_requiresFocusedItemToBeInHierarchy
{
  return 0;
}

- (BOOL)_postsFocusUpdateNotifications
{
  return 0;
}

- (BOOL)_prefersDeferralForFocusUpdateInContext:(id)a3
{
  return 0;
}

- (BOOL)_focusSystemIsValid
{
  void *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIHostedFocusSystem;
  if (!-[UIFocusSystem _focusSystemIsValid](&v6, sel__focusSystemIsValid))
    return 0;
  -[_UIHostedFocusSystem _hostFocusSystem](self, "_hostFocusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_focusSystemIsValid");

  return v4;
}

- (BOOL)_isEligibleForFocusInteraction
{
  UIFocusEnvironment **p_hostEnvironment;
  id WeakRetained;
  id v5;
  char IsEligibleForFocusInteraction;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIHostedFocusSystem;
  if (!-[UIFocusSystem _isEligibleForFocusInteraction](&v8, sel__isEligibleForFocusInteraction))
    return 0;
  p_hostEnvironment = &self->_hostEnvironment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostEnvironment);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_hostEnvironment);
    IsEligibleForFocusInteraction = _UIFocusEnvironmentIsEligibleForFocusInteraction(v5);

  }
  else
  {
    IsEligibleForFocusInteraction = 0;
  }

  return IsEligibleForFocusInteraction;
}

- (BOOL)_isEligibleForFocusOcclusion
{
  UIFocusEnvironment **p_hostEnvironment;
  id WeakRetained;
  id v5;
  char IsEligibleForFocusOcclusion;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIHostedFocusSystem;
  if (!-[UIFocusSystem _isEligibleForFocusOcclusion](&v8, sel__isEligibleForFocusOcclusion))
    return 0;
  p_hostEnvironment = &self->_hostEnvironment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostEnvironment);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_hostEnvironment);
    IsEligibleForFocusOcclusion = _UIFocusEnvironmentIsEligibleForFocusOcclusion(v5, 0);

  }
  else
  {
    IsEligibleForFocusOcclusion = 0;
  }

  return IsEligibleForFocusOcclusion;
}

- (UIFocusEnvironment)hostEnvironment
{
  return (UIFocusEnvironment *)objc_loadWeakRetained((id *)&self->_hostEnvironment);
}

- (_UIHostedFocusSystemItemContainer)itemContainerProxy
{
  return self->_itemContainerProxy;
}

- (_UIHostedFocusSystemDelegateProxy)delegateProxy
{
  return self->_delegateProxy;
}

- (void)setDelegateProxy:(id)a3
{
  objc_storeStrong((id *)&self->_delegateProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_storeStrong((id *)&self->_itemContainerProxy, 0);
  objc_destroyWeak((id *)&self->_hostEnvironment);
}

@end
