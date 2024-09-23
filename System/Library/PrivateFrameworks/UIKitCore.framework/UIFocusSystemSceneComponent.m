@implementation UIFocusSystemSceneComponent

void __49___UIFocusSystemSceneComponent__setupFocusSystem__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFocusSystemState");

}

uint64_t __49___UIFocusSystemSceneComponent__setupFocusSystem__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_installFocusIfNeededForFocusSystemSceneComponent:", *(_QWORD *)(a1 + 32));
}

uint64_t __49___UIFocusSystemSceneComponent__setupFocusSystem__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateFocusSystemState");
  return objc_msgSend(*(id *)(a1 + 32), "_delayedSetupFocusDebugWindow");
}

uint64_t __52___UIFocusSystemSceneComponent__tearDownFocusSystem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_removeFocusIfNeededForFocusSystemSceneComponent:", *(_QWORD *)(a1 + 32));
}

void __63___UIFocusSystemSceneComponent__updateDeviceCapabilityObserver__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_adjustFocusSystemAvailability");

}

void __63___UIFocusSystemSceneComponent__updateDeviceCapabilityObserver__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_adjustFocusSystemAvailability");

}

uint64_t __54___UIFocusSystemSceneComponent__windowsForFocusSearch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "windowLevel");
  v7 = v6;
  objc_msgSend(v5, "windowLevel");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "windowLevel");
    v11 = v10;
    objc_msgSend(v5, "windowLevel");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void __58___UIFocusSystemSceneComponent___applicationIsSpringBoard__block_invoke()
{
  void *v0;
  id v1;

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bundleIdentifier");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_1064 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.springboard"));

  }
  else
  {
    _MergedGlobals_1064 = 0;
  }
}

void __47___UIFocusSystemSceneComponent_coordinateSpace__block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Unable to find coordinate space for scene %@. Falling back to screen space.", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v2 = _UIFocusSystemSceneComponentDidFinishInitializationNotification_block_invoke___s_category;
    if (!_UIFocusSystemSceneComponentDidFinishInitializationNotification_block_invoke___s_category)
    {
      v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&_UIFocusSystemSceneComponentDidFinishInitializationNotification_block_invoke___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Unable to find coordinate space for scene %@. Falling back to screen space.", (uint8_t *)&v7, 0xCu);
    }
  }
}

void __70___UIFocusSystemSceneComponent__focusSystem_willUpdateFocusInContext___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "_countOfFocusedAncestorTrackingViewsInSubtree"))
  {
    if (objc_msgSend(v3, "_tracksFocusedAncestors"))
      objc_msgSend(v3, "_ancestorWillUpdateFocusInContext:withAnimationCoordinator:", a1[4], a1[5]);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(v3, "subviews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 16))();
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

void __69___UIFocusSystemSceneComponent__focusSystem_didUpdateFocusInContext___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "nextFocusedItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateFocusEffectForItem:", v2);

}

@end
