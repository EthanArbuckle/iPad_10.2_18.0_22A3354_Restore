@implementation UISceneHostingActivationStateHostComponent

void __76___UISceneHostingActivationStateHostComponent_foregroundAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  _DWORD *WeakRetained;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = _UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category;
  if (!_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category)
  {
    v4 = __UILogCategoryGetNode("UISceneHostingActivationState", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category);
  }
  if ((*(_BYTE *)v4 & 1) != 0)
  {
    v7 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Foreground assertion relinquished: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    --WeakRetained[6];
    objc_msgSend(WeakRetained, "evaluateActivationState");
  }

}

uint64_t __61___UISceneHostingActivationStateHostComponent_setForeground___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", *(unsigned __int8 *)(a1 + 32));
}

void __67___UISceneHostingActivationStateHostComponent_propagateForeground___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  v9 = v4;
  if (v3)
  {
    objc_msgSend(v4, "addPropagatedProperty:", sel_isForeground);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(WeakRetained, "_childRemoteContentRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setForeground:", objc_msgSend(v7, "isForeground"));

    v8 = WeakRetained;
  }
  else
  {
    objc_msgSend(v4, "removePropagatedProperty:", sel_isForeground);
    v8 = v9;
  }

}

@end
