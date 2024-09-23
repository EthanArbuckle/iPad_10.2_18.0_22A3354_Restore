@implementation SBControlSystemAction

- (id)newSimplePreviewElement
{
  return -[SBSystemActionSimpleControlPreviewElement initWithSystemAction:]([SBSystemActionSimpleControlPreviewElement alloc], "initWithSystemAction:", self);
}

- (SBControlSystemAction)initWithConfiguredAction:(id)a3 instanceIdentity:(id)a4
{
  id v6;
  id v7;
  SBControlSystemAction *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  CHUISControlInstance *controlInstance;
  id v27;
  uint64_t v28;
  id actionBlock;
  uint64_t v30;
  SBControlSystemActionProperties *properties;
  _QWORD v33[4];
  id v34;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)SBControlSystemAction;
  v8 = -[SBSystemAction initWithConfiguredAction:instanceIdentity:](&v35, sel_initWithConfiguredAction_instanceIdentity_, v6, v7);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D10038]);
    objc_msgSend(v6, "extensionBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v10, v11, 0);

    v13 = objc_alloc(MEMORY[0x1E0D10000]);
    objc_msgSend(v6, "kind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithExtensionIdentity:kind:intent:", v12, v14, v15);

    v17 = objc_alloc(MEMORY[0x1E0D10010]);
    objc_msgSend(v7, "hostIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithControl:contentType:hostIdentifier:configurationIdentifier:", v16, 0, v18, v19);

    objc_msgSend(v6, "controlType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0D102E8], "instanceOfType:instanceIdentity:", v22, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "modifyConfiguration:", &__block_literal_global_221);
    objc_msgSend(v23, "registerObserver:", v8);
    objc_msgSend(v23, "activate");
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __67__SBControlSystemAction_initWithConfiguredAction_instanceIdentity___block_invoke_2;
    v33[3] = &unk_1E8EB3448;
    v24 = v23;
    v34 = v24;
    v25 = (void *)MEMORY[0x1D17E5550](v33);
    controlInstance = v8->_controlInstance;
    v8->_controlInstance = (CHUISControlInstance *)v24;
    v27 = v24;

    v28 = MEMORY[0x1D17E5550](v25);
    actionBlock = v8->_actionBlock;
    v8->_actionBlock = (id)v28;

    +[SBControlSystemActionProperties propertiesForControlInstance:]((uint64_t)SBControlSystemActionProperties, v27);
    v30 = objc_claimAutoreleasedReturnValue();
    properties = v8->_properties;
    v8->_properties = (SBControlSystemActionProperties *)v30;

  }
  return v8;
}

void __67__SBControlSystemAction_initWithConfiguredAction_instanceIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setCanAppearInSecureEnvironment:", 1);
  objc_msgSend(v2, "setPreferredColorScheme:", 2);
  objc_msgSend(v2, "setLaunchOrigin:", *MEMORY[0x1E0DAB800]);

}

void __67__SBControlSystemAction_initWithConfiguredAction_instanceIdentity___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SBControlSystemAction_initWithConfiguredAction_instanceIdentity___block_invoke_3;
  v7[3] = &unk_1E8E9F598;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performControlActionWithCompletion:", v7);

}

uint64_t __67__SBControlSystemAction_initWithConfiguredAction_instanceIdentity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  objc_super v3;

  -[BSCompoundAssertion invalidate](self->_contentVisibilityAssertions, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBControlSystemAction;
  -[SBControlSystemAction dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)removeObserver:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 72), "removeObject:", a2);
  return result;
}

- (void)type
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    objc_msgSend(result, "configuredAction");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "controlType");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "unsignedIntegerValue");

    return (void *)v3;
  }
  return result;
}

- (id)iconView
{
  if (a1)
  {
    objc_msgSend(a1[7], "iconView");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)acquireContentVisibilityAssertionForReason:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    if (!v4)
    {
      v5 = *(id *)(a1 + 56);
      v6 = (void *)MEMORY[0x1E0D01718];
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __68__SBControlSystemAction_acquireContentVisibilityAssertionForReason___block_invoke;
      v13[3] = &unk_1E8EB3470;
      v14 = v5;
      v9 = v5;
      objc_msgSend(v6, "assertionWithIdentifier:stateDidChangeHandler:", v8, v13);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v10;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "acquireForReason:", v3);
    a1 = objc_claimAutoreleasedReturnValue();
  }

  return (id)a1;
}

uint64_t __68__SBControlSystemAction_acquireContentVisibilityAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (objc_msgSend(a2, "isActive"))
    v3 = 2;
  else
    v3 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setVisibility:", v3);
}

- (id)newExecutor
{
  return -[SBBlockSystemActionExecutor initWithSystemAction:]([SBBlockSystemActionExecutor alloc], "initWithSystemAction:", self);
}

- (void)controlInstanceDescriptorDidChange:(id)a3
{
  id v4;

  +[SBControlSystemActionProperties propertiesForControlInstance:]((uint64_t)SBControlSystemActionProperties, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBControlSystemAction setProperties:]((uint64_t)self, v4);

}

- (void)setProperties:(uint64_t)a1
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v5 = *(id *)(a1 + 88);
    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)(a1 + 88), a2);
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = (void *)objc_msgSend(*(id *)(a1 + 72), "copy", 0);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "controlSystemAction:propertiesDidChange:", a1, v5);
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }

}

- (void)controlInstanceViewModelDidChange:(id)a3
{
  id v4;

  +[SBControlSystemActionProperties propertiesForControlInstance:]((uint64_t)SBControlSystemActionProperties, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBControlSystemAction setProperties:]((uint64_t)self, v4);

}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (uint64_t)properties
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_contentVisibilityAssertions, 0);
  objc_storeStrong((id *)&self->_controlInstance, 0);
}

- (id)controlIdentity
{
  return (id)-[CHUISControlInstance control](self->_controlInstance, "control");
}

@end
