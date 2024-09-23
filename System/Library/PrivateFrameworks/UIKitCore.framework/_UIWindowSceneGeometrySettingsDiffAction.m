@implementation _UIWindowSceneGeometrySettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  unint64_t v30;
  NSObject *v31;
  id v32;
  void *v33;
  objc_class *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  NSObject *v44;
  id v45;
  void *v46;
  objc_class *v47;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  id v53;
  unsigned __int8 v54;
  uint8_t buf[4];
  __CFString *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowSceneGeometrySettingsDiffAction.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene class]]"));

  }
  v17 = v13;
  v54 = 0;
  -[_UIWindowSceneGeometrySettingsDiffAction sceneSettingsGeometryMutationDiffInspector](self, "sceneSettingsGeometryMutationDiffInspector");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "inspectDiff:withContext:", v16, &v54);

  v19 = v54;
  if ((v54 & 4) != 0)
  {
    objc_msgSend(v14, "otherSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForSetting:", 35);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    objc_msgSend(v17, "_effectiveUISettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "interfaceOrientationMode");

    if (v22 && v22 != v24 && (v22 == 100 || v24 == 100 || !v24))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UIAssertIsValidOrientationModeChange(UIApplicationSceneInterfaceOrientationMode, UIApplicationSceneInterfaceOrientationMode)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      UIApplicationSceneStringForInterfaceOrientationMode(v22);
      v27 = v14;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      UIApplicationSceneStringForInterfaceOrientationMode(v24);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("_UIWindowSceneGeometrySettingsDiffAction.m"), 40, CFSTR("Unsupported change of scene orientation mode %@ -> %@"), v28, v29);

      v14 = v27;
    }
    v30 = _MergedGlobals_978;
    if (!_MergedGlobals_978)
    {
      v30 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v30, (unint64_t *)&_MergedGlobals_978);
    }
    v31 = *(id *)(v30 + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v53 = v14;
      v32 = v17;
      if (v32)
      {
        v33 = (void *)MEMORY[0x1E0CB3940];
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("<%@: %p>"), v35, v32);
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v36 = CFSTR("(nil)");
      }

      v37 = v36;
      objc_msgSend(v32, "_persistenceIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      UIApplicationSceneStringForInterfaceOrientationMode(v22);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      UIApplicationSceneStringForInterfaceOrientationMode(v24);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v56 = v36;
      v57 = 2114;
      v58 = v38;
      v59 = 2114;
      v60 = v39;
      v61 = 2114;
      v62 = v40;
      _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ (%{public}@) Scene did update orientation mode: %{public}@ -> %{public}@", buf, 0x2Au);

      v14 = v53;
    }

    v19 = v54;
  }
  if ((v19 & 2) != 0)
  {
    if (-[UIScene _systemShellOwnsInterfaceOrientation](v17))
    {
      objc_msgSend(v17, "_effectiveUISettings");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "interfaceOrientation");

      if (!v42)
      {
        v43 = qword_1ECD7CEC8;
        if (!qword_1ECD7CEC8)
        {
          v43 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v43, (unint64_t *)&qword_1ECD7CEC8);
        }
        v44 = *(id *)(v43 + 8);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          v45 = v17;
          if (v45)
          {
            v46 = (void *)MEMORY[0x1E0CB3940];
            v47 = (objc_class *)objc_opt_class();
            NSStringFromClass(v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "stringWithFormat:", CFSTR("<%@: %p>"), v48, v45);
            v49 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v49 = CFSTR("(nil)");
          }

          v50 = v49;
          objc_msgSend(v45, "_persistenceIdentifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v56 = v49;
          v57 = 2114;
          v58 = v51;
          _os_log_impl(&dword_185066000, v44, OS_LOG_TYPE_FAULT, "%{public}@ (%{public}@) The scene is being updated with an unknown interface orientation!", buf, 0x16u);

        }
      }
    }
  }
  -[_UIWindowSceneGeometrySettingsDiffAction _updateSceneGeometryWithSettingObserverContext:windowScene:transitionContext:](self, "_updateSceneGeometryWithSettingObserverContext:windowScene:transitionContext:", v54, v17, v15);
  objc_msgSend(v17, "_completeGeometryUpdatesWithTransitionContext:", v15);

}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsGeometryMutationDiffInspector
{
  UIApplicationSceneSettingsDiffInspector *sceneSettingsGeometryMutationDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  sceneSettingsGeometryMutationDiffInspector = self->_sceneSettingsGeometryMutationDiffInspector;
  if (!sceneSettingsGeometryMutationDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsGeometryMutationDiffInspector;
    self->_sceneSettingsGeometryMutationDiffInspector = v4;

    -[FBSSceneSettingsDiffInspector observeFrameWithBlock:](self->_sceneSettingsGeometryMutationDiffInspector, "observeFrameWithBlock:", &__block_literal_global_87);
    -[FBSSceneSettingsDiffInspector observeInterfaceOrientationWithBlock:](self->_sceneSettingsGeometryMutationDiffInspector, "observeInterfaceOrientationWithBlock:", &__block_literal_global_1_3);
    -[UIApplicationSceneSettingsDiffInspector observeInterfaceOrientationModeWithBlock:](self->_sceneSettingsGeometryMutationDiffInspector, "observeInterfaceOrientationModeWithBlock:", &__block_literal_global_2_1);
    -[UIApplicationSceneSettingsDiffInspector observeInterfaceOrientationMapResolverWithBlock:](self->_sceneSettingsGeometryMutationDiffInspector, "observeInterfaceOrientationMapResolverWithBlock:", &__block_literal_global_3_0);
    sceneSettingsGeometryMutationDiffInspector = self->_sceneSettingsGeometryMutationDiffInspector;
  }
  return sceneSettingsGeometryMutationDiffInspector;
}

- (void)_updateSceneGeometryWithSettingObserverContext:(id)a3 windowScene:(id)a4 transitionContext:(id)a5
{
  char v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  _BOOL4 v14;
  BOOL v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  objc_class *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  BOOL v35;
  uint8_t buf[4];
  __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v6 = (char)a3;
  v42 = *MEMORY[0x1E0C80C00];
  v7 = (char)a3;
  v8 = a4;
  v9 = a5;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v8, "_effectiveUISettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "inLiveResize"))
    {
      objc_msgSend(v9, "animationSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:", 3.0, 1000.0, 500.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAnimationSettings:", v10);
    }

    if ((v7 & 8) == 0)
      goto LABEL_5;
    goto LABEL_8;
  }
LABEL_4:
  if ((v7 & 8) == 0)
  {
LABEL_5:
    LOBYTE(v12) = 0;
    v13 = (v6 & 1) == 0;
    v14 = (v7 & 2) == 0;
    goto LABEL_12;
  }
LABEL_8:
  v12 = objc_msgSend(v8, "_canDynamicallySpecifySupportedInterfaceOrientations");
  v13 = (v6 & 1) == 0;
  v14 = (v7 & 2) == 0;
  if (!v12 || (v6 & 1) != 0 || (v7 & 2) != 0)
  {
LABEL_12:
    v15 = 0;
    if ((v12 & 1) == 0 && v13 && v14 && (v7 & 4) == 0)
      goto LABEL_27;
    goto LABEL_16;
  }
  v15 = (v7 & 4) == 0;
  LOBYTE(v14) = 1;
LABEL_16:
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __121___UIWindowSceneGeometrySettingsDiffAction__updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext___block_invoke;
  aBlock[3] = &unk_1E16B7110;
  v35 = v15;
  v17 = v8;
  v33 = v17;
  v18 = v9;
  v34 = v18;
  v19 = _Block_copy(aBlock);
  if (v14)
  {
    _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v18, v19, 0);
  }
  else
  {
    v20 = _updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext____s_category[0];
    if (!_updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext____s_category[0])
    {
      v20 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v20, _updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext____s_category);
    }
    v21 = *(id *)(v20 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v17;
      if (v22)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p>"), v25, v22);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = CFSTR("(nil)");
      }

      v27 = v26;
      objc_msgSend(v22, "_persistenceIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "interfaceOrientation");
      BSInterfaceOrientationDescription();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v26;
      v38 = 2114;
      v39 = v28;
      v40 = 2114;
      v41 = v29;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ (%{public}@) Scene will change interface orientation: %{public}@", buf, 0x20u);

      v16 = MEMORY[0x1E0C809B0];
    }

    v30[0] = v16;
    v30[1] = 3221225472;
    v30[2] = __121___UIWindowSceneGeometrySettingsDiffAction__updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext___block_invoke_18;
    v30[3] = &unk_1E16B3FD8;
    v31 = v17;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v18, v19, v30);

  }
LABEL_27:

}

- (void)setSceneSettingsGeometryMutationDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSettingsGeometryMutationDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsGeometryMutationDiffInspector, 0);
}

@end
