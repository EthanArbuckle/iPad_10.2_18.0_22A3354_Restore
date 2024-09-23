@implementation SBAccessibilityUIServerUISceneController

+ (id)_setupInfo
{
  void *v2;
  void *v3;
  _QWORD v5[8];
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("class");
  v6[0] = objc_opt_class();
  v5[1] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  v6[2] = MEMORY[0x1E0C9AAB0];
  v5[2] = CFSTR("isDaemon");
  v5[3] = CFSTR("jobLabel");
  v6[3] = CFSTR("com.apple.AccessibilityUIServer");
  v6[4] = &unk_1E91CF618;
  v5[4] = CFSTR("hostLevel");
  v5[5] = CFSTR("traitsRole");
  v6[5] = CFSTR("SBTraitsParticipantRoleAXUIServer");
  v6[6] = &unk_1E91CFBE8;
  v5[6] = CFSTR("vendingStrategy");
  v5[7] = CFSTR("workspaceID");
  v6[7] = CFSTR("com.apple.SpringBoard.SceneWorkspace.AccessibilityUIServerUI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_setupInfoForSceneSpecification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_setupInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v3, "uiSceneSessionRole");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogSystemUIScene();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[SBAccessibilityUIServerUISceneController _setupInfoForSceneSpecification:].cold.1();

  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DAC840]))
  {
    objc_msgSend(v5, "setObject:forKey:", &unk_1E91CFC00, CFSTR("presentationStyle"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEBBD0] + 30.0 + -1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("hostLevel"));

  }
  return v5;
}

- (void)_evaluateAvailablePresenters:(id)a3 forSceneControllers:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  SBSystemUISceneDefaultPresenter *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SEL v29;
  void *v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v29 = a2;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)SBAccessibilityUIServerUISceneController;
  -[SBSystemUISceneController _evaluateAvailablePresenters:forSceneControllers:](&v37, sel__evaluateAvailablePresenters_forSceneControllers_, a3, v6);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v8)
  {
    v9 = v8;
    v32 = *(_QWORD *)v34;
    v31 = v7;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v32)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "sceneOptions", v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "specification");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_setupInfoForSceneSpecification:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("presentationStyle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");

        if (v16 == 2)
        {
          SBLogSystemUIScene();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            -[SBAccessibilityUIServerUISceneController activeWindowScenePresenter](self, "activeWindowScenePresenter");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v39 = v27;
            v40 = 2114;
            v41 = v11;
            _os_log_debug_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEBUG, "AXUIServer activeWindowScenePresenter: %{public}@ for sceneController: %{public}@", buf, 0x16u);

          }
          -[SBAccessibilityUIServerUISceneController activeWindowScenePresenter](self, "activeWindowScenePresenter");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend((id)SBApp, "windowSceneManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "activeDisplayWindowScene");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = -[SBSystemUISceneDefaultPresenter initWithWindowHostingPresentationOnWindowScene:]([SBSystemUISceneDefaultPresenter alloc], "initWithWindowHostingPresentationOnWindowScene:", v20);
            -[SBAccessibilityUIServerUISceneController setActiveWindowScenePresenter:](self, "setActiveWindowScenePresenter:", v21);

            objc_msgSend(v14, "objectForKey:", CFSTR("hostLevel"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBAccessibilityUIServerUISceneController activeWindowScenePresenter](self, "activeWindowScenePresenter");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setPreferredWindowLevel:", v22);

            SBLogSystemUIScene();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              -[SBAccessibilityUIServerUISceneController activeWindowScenePresenter](self, "activeWindowScenePresenter");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v39 = v30;
              v40 = 2114;
              v41 = v11;
              _os_log_debug_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEBUG, "AXUIServer Created activeWindowScenePresenter: %{public}@ for sceneController: %{public}@", buf, 0x16u);

            }
            v7 = v31;
          }
          -[SBAccessibilityUIServerUISceneController activeWindowScenePresenter](self, "activeWindowScenePresenter");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v29, self, CFSTR("SBAccessibilityDaemonUISceneControllers.m"), 156, CFSTR("AXUIServer client needs to set ActiveWindowScene for scene controller, but it's nil"));

          }
          -[SBAccessibilityUIServerUISceneController activeWindowScenePresenter](self, "activeWindowScenePresenter");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setPresenter:", v26);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v9);
  }

}

- (void)_activeSceneControllersAfterRemoving:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogSystemUIScene();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBAccessibilityUIServerUISceneController _activeSceneControllersAfterRemoving:].cold.3(self, (uint64_t)v4, v5);

  -[SBAccessibilityUIServerUISceneController activeWindowScenePresenter](self, "activeWindowScenePresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      v11 = *MEMORY[0x1E0DAC840];
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "sceneOptions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "specification");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "uiSceneSessionRole");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqualToString:", v11))
          {
            SBLogSystemUIScene();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              -[SBAccessibilityUIServerUISceneController _activeSceneControllersAfterRemoving:].cold.2();

            goto LABEL_18;
          }

          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
    }

    SBLogSystemUIScene();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[SBAccessibilityUIServerUISceneController _activeSceneControllersAfterRemoving:].cold.1(self, v16);

    -[SBAccessibilityUIServerUISceneController setActiveWindowScenePresenter:](self, "setActiveWindowScenePresenter:", 0);
LABEL_18:
    v4 = v18;
  }

}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBAccessibilityUIServerUISceneController;
  -[SBSystemUISceneController windowSceneDidDisconnect:](&v10, sel_windowSceneDidDisconnect_, v4);
  SBLogSystemUIScene();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBAccessibilityUIServerUISceneController windowSceneDidDisconnect:].cold.2();

  -[SBAccessibilityUIServerUISceneController activeWindowScenePresenter](self, "activeWindowScenePresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if (v8)
  {
    SBLogSystemUIScene();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SBAccessibilityUIServerUISceneController _activeSceneControllersAfterRemoving:].cold.1(self, v9);

    -[SBAccessibilityUIServerUISceneController setActiveWindowScenePresenter:](self, "setActiveWindowScenePresenter:", 0);
  }

}

- (void)_invalidateSceneControllersForWindowScene:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBAccessibilityUIServerUISceneController;
  -[SBSystemUISceneController _invalidateSceneControllersForWindowScene:](&v10, sel__invalidateSceneControllersForWindowScene_, v4);
  SBLogSystemUIScene();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBAccessibilityUIServerUISceneController _invalidateSceneControllersForWindowScene:].cold.2();

  -[SBAccessibilityUIServerUISceneController activeWindowScenePresenter](self, "activeWindowScenePresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if (v8)
  {
    SBLogSystemUIScene();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SBAccessibilityUIServerUISceneController _activeSceneControllersAfterRemoving:].cold.1(self, v9);

    -[SBAccessibilityUIServerUISceneController setActiveWindowScenePresenter:](self, "setActiveWindowScenePresenter:", 0);
  }

}

- (void)_invalidateAllSceneControllers
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activeWindowScenePresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, v4, "AXUIServer _invalidateAllSceneControllers Cleanup activeWindowScenePresenter: %{public}@", v5);

  OUTLINED_FUNCTION_2_2();
}

- (SBSystemUISceneDefaultPresenter)activeWindowScenePresenter
{
  return self->_activeWindowScenePresenter;
}

- (void)setActiveWindowScenePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_activeWindowScenePresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeWindowScenePresenter, 0);
}

+ (void)_setupInfoForSceneSpecification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v0, v1, "AXUIServer sessionRole: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_activeSceneControllersAfterRemoving:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activeWindowScenePresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, v4, "AXUIServer Cleanup activeWindowScenePresenter: %{public}@", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)_activeSceneControllersAfterRemoving:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, v1, (uint64_t)v1, "AXUIServer sessionRole: %{public}@ Active sceneController: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_activeSceneControllersAfterRemoving:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activeWindowScenePresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v8 = 2112;
  v9 = a2;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a3, v6, "AXUIServer activeWindowScenePresenter %{public}@ _activeSceneControllersAfterRemoving %@{public}", v7);

}

- (void)windowSceneDidDisconnect:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v0, v1, "AXUIServer windowSceneDidDisconnect: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_invalidateSceneControllersForWindowScene:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v0, v1, "AXUIServer _invalidateSceneControllersForWindowScene: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

@end
