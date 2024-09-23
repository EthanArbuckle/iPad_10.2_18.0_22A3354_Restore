@implementation UIWindowSceneGeometrySettingsDiffAction

void __86___UIWindowSceneGeometrySettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 |= 1u;
}

void __86___UIWindowSceneGeometrySettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_2(uint64_t a1, _BYTE *a2)
{
  *a2 |= 2u;
}

void __86___UIWindowSceneGeometrySettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_3(uint64_t a1, _BYTE *a2)
{
  *a2 |= 4u;
}

void __86___UIWindowSceneGeometrySettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_4(uint64_t a1, _BYTE *a2)
{
  *a2 |= 8u;
}

uint64_t __121___UIWindowSceneGeometrySettingsDiffAction__updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;

  if (*(_BYTE *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      if ((!objc_msgSend(*(id *)(a1 + 32), "activationState") || objc_msgSend(v4, "activationState") == 1)
        && (objc_msgSend(*(id *)(a1 + 32), "_isPerformingSystemSnapshot") & 1) == 0)
      {
        a2 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled") | a2;
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_computeMetricsAndCrossFadeInLiveResize:withTransitionContext:", a2, *(_QWORD *)(a1 + 40));
}

void __121___UIWindowSceneGeometrySettingsDiffAction__updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext___block_invoke_18(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke___s_category;
  if (!_UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke___s_category);
  }
  if ((*(_BYTE *)v2 & 1) != 0)
  {
    v3 = *(id *)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(void **)(a1 + 32);
      if (v4)
      {
        v5 = (void *)MEMORY[0x1E0CB3940];
        v6 = v4;
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v6);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v10 = *(void **)(a1 + 32);
      }
      else
      {
        v10 = 0;
        v9 = CFSTR("(nil)");
      }
      v11 = v9;
      v12 = v9;
      objc_msgSend(v10, "_persistenceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation");
      BSInterfaceOrientationDescription();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v17 = v11;
      v18 = 2114;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "%{public}@ (%{public}@) Scene did change interface orientation: %{public}@; success=%{public}@",
        buf,
        0x2Au);

    }
  }
}

@end
