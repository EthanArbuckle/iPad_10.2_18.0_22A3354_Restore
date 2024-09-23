@implementation SBSystemApertureZStackPolicyAssistant

- (void)_resolveProposedPolicies
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  id v11;
  int v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  id v25;
  id WeakRetained;

  if (a1)
  {
    v2 = *(unsigned __int8 *)(a1 + 8);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(WeakRetained, "sceneIfExists");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

    v9 = objc_msgSend(v8, "statusBarHidden");
    v10 = objc_msgSend(v8, "homeIndicatorAutoHidden");

    if (v10)
    {
      v11 = objc_loadWeakRetained((id *)(a1 + 32));
      v12 = objc_msgSend(v11, "isHidden");

      v9 |= v12;
    }
    v13 = v2 != v9;
    if (v2 != v9)
      *(_BYTE *)(a1 + 8) = v9;
    objc_msgSend(WeakRetained, "application");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = BSEqualStrings();

    if ((v17 & 1) == 0)
    {
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      v19 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v18;

      v13 = 1;
    }
    objc_msgSend(WeakRetained, "sceneIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "anyObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = BSEqualStrings();

    if ((v22 & 1) != 0)
    {
      if (!v13)
        goto LABEL_24;
    }
    else
    {
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v20);
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
      v24 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v23;

    }
    v25 = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(v25, "systemApertureZStackPolicyAssistantDidChange:", a1);

LABEL_24:
  }
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  SBDeviceApplicationSceneHandle **p_foregroundExclusiveSceneHandle;
  id v7;
  id WeakRetained;

  p_foregroundExclusiveSceneHandle = &self->_foregroundExclusiveSceneHandle;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_foregroundExclusiveSceneHandle);

  if (WeakRetained == v7)
    -[SBSystemApertureZStackPolicyAssistant _resolveProposedPolicies]((uint64_t)self);
}

- (void)setForegroundExclusiveSceneHandle:(void *)a3 homeGrabberView:
{
  id v5;
  id WeakRetained;
  id *v7;
  id v8;
  void *v9;
  id obj;

  obj = a2;
  v5 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    if (WeakRetained == obj)
    {
      v7 = (id *)(a1 + 32);
      v8 = objc_loadWeakRetained((id *)(a1 + 32));
      v9 = v5;
      if (v8 == v5)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "removeObserver:", a1);
      objc_storeWeak((id *)(a1 + 24), obj);
      objc_msgSend(obj, "addObserver:", a1);
      v7 = (id *)(a1 + 32);
      v8 = objc_loadWeakRetained((id *)(a1 + 32));
      v9 = v5;
      if (v8 == v5)
        goto LABEL_7;
    }
    v9 = v8;
    objc_msgSend(v8, "removeObserver:", a1);
    objc_storeWeak(v7, v5);
    objc_msgSend(v5, "addObserver:", a1);
LABEL_7:
    -[SBSystemApertureZStackPolicyAssistant _resolveProposedPolicies](a1);
    goto LABEL_8;
  }
LABEL_9:

}

- (id)initWithDelegate:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)SBSystemApertureZStackPolicyAssistant;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 2, v3);
  }

  return a1;
}

- (void)homeGrabberViewDidUpdateHidden:(id)a3
{
  SBHomeGrabberView **p_foregroundExclusiveHomeGrabberView;
  id v5;
  id WeakRetained;

  p_foregroundExclusiveHomeGrabberView = &self->_foregroundExclusiveHomeGrabberView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_foregroundExclusiveHomeGrabberView);

  if (WeakRetained == v5)
    -[SBSystemApertureZStackPolicyAssistant _resolveProposedPolicies]((uint64_t)self);
}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 2);
  return WeakRetained;
}

- (id)setDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 2, a2);
  return result;
}

- (id)foregroundExclusiveSceneHandle
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedSceneIdentifiersToSuppressInSystemAperture, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifiersToSuppressInSystemAperture, 0);
  objc_destroyWeak((id *)&self->_foregroundExclusiveHomeGrabberView);
  objc_destroyWeak((id *)&self->_foregroundExclusiveSceneHandle);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
