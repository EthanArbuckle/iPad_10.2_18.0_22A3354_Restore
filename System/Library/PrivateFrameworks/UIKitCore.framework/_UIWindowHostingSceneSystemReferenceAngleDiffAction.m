@implementation _UIWindowHostingSceneSystemReferenceAngleDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  id v30;
  objc_class *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  NSObject *v35;
  id v36;
  void *v37;
  id v38;
  objc_class *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  char v53;
  uint8_t buf[4];
  __CFString *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v14 = a5;
  if ((objc_msgSend(v12, "_hostsWindows") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowHostingSceneSystemReferenceAngleDiffAction.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene _hostsWindows]"));

  }
  v15 = v12;
  v53 = 0;
  -[_UIWindowHostingSceneSystemReferenceAngleDiffAction diffInspector](self, "diffInspector");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "inspectDiff:withContext:", v14, &v53);

  if ((v53 & 3) != 0)
  {
    objc_msgSend(v15, "_effectiveUISettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "angleFromHostReferenceUprightDirection");
    v19 = v18;

    objc_msgSend(v15, "_effectiveUISettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hostReferenceAngleMode");

    objc_msgSend(v15, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v53 & 2) != 0)
    {
      v23 = _MergedGlobals_1178;
      if (!_MergedGlobals_1178)
      {
        v23 = __UILogCategoryGetNode("SystemReferenceAngle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&_MergedGlobals_1178);
      }
      if ((*(_BYTE *)v23 & 1) != 0)
      {
        v27 = *(id *)(v23 + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = v15;
          if (v28)
          {
            v29 = (void *)MEMORY[0x1E0CB3940];
            v30 = v28;
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v30;
            objc_msgSend(v29, "stringWithFormat:", CFSTR("<%@: %p>"), v32, v30);
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v33 = 0;
            v34 = CFSTR("(nil)");
          }

          v43 = v34;
          objc_msgSend(v33, "_persistenceIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          _UISStringForSystemReferenceAngleMode();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v55 = v34;
          v56 = 2114;
          v57 = v44;
          v58 = 2114;
          v59 = v45;
          _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "%{public}@ (%{public}@) Scene hostReferenceAngleMode did change: %{public}@", buf, 0x20u);

        }
      }
    }
    if ((v53 & 1) != 0)
    {
      v24 = qword_1ECD7F698;
      if (!qword_1ECD7F698)
      {
        v24 = __UILogCategoryGetNode("SystemReferenceAngle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v24, (unint64_t *)&qword_1ECD7F698);
      }
      if ((*(_BYTE *)v24 & 1) != 0)
      {
        v35 = *(id *)(v24 + 8);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = v15;
          if (v36)
          {
            v37 = (void *)MEMORY[0x1E0CB3940];
            v38 = v36;
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v38;
            objc_msgSend(v37, "stringWithFormat:", CFSTR("<%@: %p>"), v40, v38);
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v41 = 0;
            v42 = CFSTR("(nil)");
          }

          v46 = v42;
          objc_msgSend(v41, "_persistenceIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v55 = v42;
          v56 = 2114;
          v57 = v47;
          v58 = 2048;
          v59 = v19;
          _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "%{public}@ (%{public}@) Scene angleFromHostReferenceUprightDirection did change: %.0f", buf, 0x20u);

        }
      }
    }
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __165___UIWindowHostingSceneSystemReferenceAngleDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
    v48[3] = &unk_1E16B80A8;
    v51 = v19;
    v52 = v21;
    v49 = v13;
    v50 = v22;
    v25 = v22;
    objc_msgSend(v15, "_enqueuePostSettingsUpdateResponseBlock:inPhase:", v48, 0x1E16F0C60);

  }
}

- (UIApplicationSceneSettingsDiffInspector)diffInspector
{
  UIApplicationSceneSettingsDiffInspector *diffInspector;
  UIApplicationSceneSettingsDiffInspector *v4;
  UIApplicationSceneSettingsDiffInspector *v5;

  diffInspector = self->_diffInspector;
  if (!diffInspector)
  {
    v4 = objc_alloc_init(UIApplicationSceneSettingsDiffInspector);
    v5 = self->_diffInspector;
    self->_diffInspector = v4;

    -[UIApplicationSceneSettingsDiffInspector observeAngleFromHostReferenceUprightDirectionWithBlock:](self->_diffInspector, "observeAngleFromHostReferenceUprightDirectionWithBlock:", &__block_literal_global_419);
    -[UIApplicationSceneSettingsDiffInspector observeHostReferenceAngleModeWithBlock:](self->_diffInspector, "observeHostReferenceAngleModeWithBlock:", &__block_literal_global_1_15);
    diffInspector = self->_diffInspector;
  }
  return diffInspector;
}

- (void)setDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_diffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffInspector, 0);
}

@end
