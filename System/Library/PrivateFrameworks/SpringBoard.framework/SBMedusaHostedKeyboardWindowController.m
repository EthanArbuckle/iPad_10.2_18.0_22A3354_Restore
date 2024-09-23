@implementation SBMedusaHostedKeyboardWindowController

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  char v11;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) == 0)
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D42708]);

    if (v8)
    {
      objc_msgSend(v6, "settings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isForeground");

      v11 = v10;
      -[SBMedusaHostedKeyboardWindowController updateMedusaHostedKeyboardWindowForScene:isForeground:](self, "updateMedusaHostedKeyboardWindowForScene:isForeground:", v6, &v11);
    }
  }

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  SBKeyboardClientSettingObserverContext *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) == 0)
  {
    objc_msgSend(v17, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isForeground");

    if (v14)
    {
      v15 = objc_alloc_init(SBKeyboardClientSettingObserverContext);
      -[SBKeyboardClientSettingObserverContext setScene:]((uint64_t)v15, v17);
      -[SBKeyboardClientSettingObserverContext setOldClientSettings:]((uint64_t)v15, v11);
      -[SBCameraHardwareButton setDispatchingRuleAssertion:]((uint64_t)v15, v12);
      -[SBMedusaHostedKeyboardWindowController _keyboardLayersClientSettingsDiffInspector](self, "_keyboardLayersClientSettingsDiffInspector");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "evaluateWithInspector:context:", v16, v15);

    }
  }

}

- (id)_keyboardLayersClientSettingsDiffInspector
{
  FBSSceneClientSettingsDiffInspector *v3;
  FBSSceneClientSettingsDiffInspector *keyboardLayersClientSettingsDiffInspector;
  FBSSceneClientSettingsDiffInspector *v5;
  FBSSceneClientSettingsDiffInspector *v6;
  FBSSceneClientSettingsDiffInspector *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  FBSSceneClientSettingsDiffInspector *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;

  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    keyboardLayersClientSettingsDiffInspector = self->_keyboardLayersClientSettingsDiffInspector;
    if (!keyboardLayersClientSettingsDiffInspector)
    {
      v5 = (FBSSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0D231D0]);
      v6 = self->_keyboardLayersClientSettingsDiffInspector;
      self->_keyboardLayersClientSettingsDiffInspector = v5;

      v7 = self->_keyboardLayersClientSettingsDiffInspector;
      v8 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_4;
      v14[3] = &unk_1E8EADE48;
      v14[4] = self;
      v15 = &__block_literal_global_6_3;
      __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke(v9, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBSSceneClientSettingsDiffInspector observeLayersWithBlock:](v7, "observeLayersWithBlock:", v10);

      v11 = self->_keyboardLayersClientSettingsDiffInspector;
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_6;
      v13[3] = &unk_1E8EADE70;
      v13[4] = self;
      -[FBSSceneClientSettingsDiffInspector observePreferredSceneHostIdentityWithBlock:](v11, "observePreferredSceneHostIdentityWithBlock:", v13);

      keyboardLayersClientSettingsDiffInspector = self->_keyboardLayersClientSettingsDiffInspector;
    }
    v3 = keyboardLayersClientSettingsDiffInspector;
  }
  return v3;
}

uint64_t __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_4(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD *v13;

  v3 = a2;
  if (v3)
    v4 = v3[2];
  else
    v4 = 0;
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  if (v3)
    v7 = (void *)v3[1];
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(v8, "clientSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((BSEqualObjects() & 1) == 0)
  {
    v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_5;
    v12[3] = &unk_1E8EADE20;
    v13 = v3;
    objc_msgSend(v11, "_doObserverCalloutWithBlock:", v12);
    objc_msgSend(*(id *)(a1 + 32), "updateMedusaHostedKeyboardWindow");

  }
}

id __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v2, "layers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isKeyboardLayer") & 1) != 0 || objc_msgSend(v9, "isKeyboardProxyLayer"))
        {
          if (!v6)
            v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
          objc_msgSend(v6, "addObject:", v9);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_doObserverCalloutWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
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
  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
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
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isUsingMedusaHostedKeyboardWindow
{
  return self->_isUsingMedusaHostedKeyboardWindow;
}

uint64_t __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateMedusaHostedKeyboardWindow");
}

- (void)updateMedusaHostedKeyboardWindow
{
  void *v3;
  void *v4;
  id v5;

  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sceneWithIdentifier:", *MEMORY[0x1E0D42708]);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v5;
    if (v5)
    {
      -[SBMedusaHostedKeyboardWindowController updateMedusaHostedKeyboardWindowForScene:isForeground:](self, "updateMedusaHostedKeyboardWindowForScene:isForeground:", v5, 0);
      v4 = v5;
    }

  }
}

- (void)updateMedusaHostedKeyboardWindowForScene:(id)a3 isForeground:(BOOL *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  char v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  int v49;
  NSObject *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  char v76;
  NSObject *v77;
  void *v78;
  SBMedusaHostedKeyboardWindow *v79;
  UIWindow *medusaHostedKeyboardWindow;
  NSObject *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  BOOL *v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  BOOL v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint8_t buf[4];
  uint64_t v109;
  __int16 v110;
  const char *v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(v6, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_fbsDisplayIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
    {
LABEL_90:

      goto LABEL_91;
    }
    objc_msgSend(v6, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isForeground");

    objc_msgSend(v6, "clientSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferredSceneHostIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "clientSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredSceneHostIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sceneManagerForDisplayIdentity:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v96 = v9;
    v94 = v19;
    v95 = v15;
    v99 = v13;
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sceneFromIdentityToken:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        goto LABEL_30;
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      objc_msgSend(v19, "externalForegroundApplicationSceneHandles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
      if (v92)
      {
        v23 = *(_QWORD *)v105;
        v88 = a4;
        v89 = WeakRetained;
        v90 = v22;
        v87 = *(_QWORD *)v105;
        do
        {
          for (i = 0; i != v92; ++i)
          {
            if (*(_QWORD *)v105 != v23)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * i), "sceneIfExists");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v102 = 0u;
              v103 = 0u;
              v100 = 0u;
              v101 = 0u;
              v97 = v25;
              objc_msgSend(v25, "clientSettings");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "layers");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
              if (v28)
              {
                v29 = v28;
                v30 = *(_QWORD *)v101;
                while (2)
                {
                  for (j = 0; j != v29; ++j)
                  {
                    if (*(_QWORD *)v101 != v30)
                      objc_enumerationMutation(v27);
                    v32 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
                    if (objc_msgSend(v32, "isKeyboardProxyLayer"))
                    {
                      objc_msgSend(v32, "keyboardOwner");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      v34 = BSEqualObjects();

                      if ((v34 & 1) != 0)
                      {

                        a4 = v88;
                        WeakRetained = v89;
                        v19 = v94;
                        v21 = v97;
                        v22 = v90;
                        goto LABEL_29;
                      }
                    }
                  }
                  v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
                  if (v29)
                    continue;
                  break;
                }
              }

              a4 = v88;
              WeakRetained = v89;
              v19 = v94;
              v22 = v90;
              v23 = v87;
            }
          }
          v21 = 0;
          v92 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
        }
        while (v92);
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      if (!objc_msgSend(v15, "length"))
      {
        v98 = 0;
        LODWORD(v21) = 0;
        goto LABEL_61;
      }
      objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sceneWithIdentifier:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_29:

    if (v21)
    {
LABEL_30:
      objc_msgSend(v19, "existingSceneHandleForScene:", v21);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "externalForegroundApplicationSceneHandles");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "containsObject:", v35);

      v91 = v35;
      if ((v37 & 1) != 0)
      {
        v38 = 1;
      }
      else
      {
        objc_msgSend(v35, "sceneIfExists");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "workspaceIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend(v35, "scene");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "settings");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v42, "isForeground");

        }
        else
        {
          v38 = 0;
        }
      }
      objc_msgSend(v21, "clientProcess");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v43, "isApplicationProcess"))
      {
        +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "bundleIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "applicationWithBundleIdentifier:", v45);
        v93 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v93 = 0;
      }
      v98 = v21;
      objc_msgSend(v21, "uiPresentationManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "defaultPresentationContext");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "presentedLayerTypes");

      if ((v48 & 0xFFFFFFFFFFFFFFFDLL) != 0)
        v49 = 0;
      else
        v49 = v38;
      if (v49 == 1)
      {
        SBLogMedusaKeyboard();
        v50 = objc_claimAutoreleasedReturnValue();
        LODWORD(v21) = 1;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          _SBFLoggingMethodProem();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v109 = (uint64_t)v51;
          _os_log_impl(&dword_1D0540000, v50, OS_LOG_TYPE_INFO, "%{public}@ keyboardIsForMedusa is YES because the scene is foreground and can't present the keyboard itself", buf, 0xCu);

        }
        v99 = 1;
LABEL_60:

        goto LABEL_61;
      }
      FBSystemAppBundleID();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v95, "isEqualToString:", v52);

      if (v53)
      {
        SBLogMedusaKeyboard();
        v50 = objc_claimAutoreleasedReturnValue();
        v99 = 1;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          _SBFLoggingMethodProem();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v109 = (uint64_t)v54;
          _os_log_impl(&dword_1D0540000, v50, OS_LOG_TYPE_INFO, "%{public}@ preferredHostIdentifier is SpringBoard so keyboardIsForMedusa is NO", buf, 0xCu);

        }
        LODWORD(v21) = 0;
        goto LABEL_60;
      }
      objc_msgSend(WeakRetained, "switcherController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v55, "isChamoisWindowingUIEnabled"))
      {
        objc_msgSend(v98, "uiSettings");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v56, "enhancedWindowingEnabled") & 1) != 0)
        {
          v57 = objc_msgSend(v93, "supportsChamoisSceneResizing");

          if (v57)
          {
            SBLogMedusaKeyboard();
            v50 = objc_claimAutoreleasedReturnValue();
            LODWORD(v21) = 1;
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              _SBFLoggingMethodProem();
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v109 = (uint64_t)v58;
              _os_log_impl(&dword_1D0540000, v50, OS_LOG_TYPE_INFO, "%{public}@ Chamois window UI is enabled so keyboardIsForMedusa is YES", buf, 0xCu);

            }
            goto LABEL_60;
          }
LABEL_57:
          SBLogMedusaKeyboard();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            _SBFLoggingMethodProem();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v109 = (uint64_t)v59;
            _os_log_impl(&dword_1D0540000, v50, OS_LOG_TYPE_INFO, "%{public}@ preferredHostIdentifier's scene can host keyboard itself so keyboardIsForMedusa is NO", buf, 0xCu);

          }
          LODWORD(v21) = 0;
          v99 = 0;
          goto LABEL_60;
        }

      }
      goto LABEL_57;
    }
    v98 = 0;
LABEL_61:
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "pipCoordinator");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "isPresentingPictureInPictureRequiringMedusaKeyboard");

    if (v62)
    {
      SBLogMedusaKeyboard();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        _SBFLoggingMethodProem();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v109 = (uint64_t)v64;
        _os_log_impl(&dword_1D0540000, v63, OS_LOG_TYPE_INFO, "%{public}@ pipRequiresMedusaKeyboard is YES so keyboardIsForMedusa is YES", buf, 0xCu);

      }
      LODWORD(v21) = 1;
      v99 = 1;
    }
    if (v17)
    {
      objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "overlayUISceneController");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "sceneFromIdentityToken:", v17);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (v67)
      {
        SBLogMedusaKeyboard();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          _SBFLoggingMethodProem();
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v109 = (uint64_t)v69;
          _os_log_impl(&dword_1D0540000, v68, OS_LOG_TYPE_INFO, "%{public}@ host is OverlayUI scene so keyboardIsForMedusa is YES", buf, 0xCu);

        }
        LODWORD(v21) = 1;
        v99 = 1;
      }
    }
    objc_msgSend((id)SBApp, "windowSceneManager");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "windowSceneForDisplayIdentity:", v96);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "stringRepresentation");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      objc_msgSend((id)SBApp, "remoteTransientOverlaySessionManager");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "hasActiveSessionWithSceneIdentityTokenString:options:", v72, 0);

      if (v74)
      {
        objc_msgSend(v71, "transientOverlayPresenter");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v75, "isTopmostPresentationFromSceneWithIdentityTokenString:", v72);

        if ((v76 & 1) == 0)
        {
          SBLogMedusaKeyboard();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            _SBFLoggingMethodProem();
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v109 = (uint64_t)v78;
            _os_log_impl(&dword_1D0540000, v77, OS_LOG_TYPE_INFO, "%{public}@ host is embedded remote transient overlay scene so keyboardIsForMedusa is YES", buf, 0xCu);

          }
          LODWORD(v21) = 1;
          v99 = 1;
        }
      }
    }
    if (!self->_medusaHostedKeyboardWindow)
    {
      v79 = -[SBMedusaHostedKeyboardWindow initWithWindowScene:keyboardScene:]([SBMedusaHostedKeyboardWindow alloc], "initWithWindowScene:keyboardScene:", v71, v6);
      medusaHostedKeyboardWindow = self->_medusaHostedKeyboardWindow;
      self->_medusaHostedKeyboardWindow = &v79->super.super.super;

    }
    SBLogMedusaKeyboard();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      _SBFLoggingMethodProem();
      v82 = objc_claimAutoreleasedReturnValue();
      v83 = (void *)v82;
      v84 = "HIDING";
      if ((_DWORD)v21)
        v84 = "SHOWING";
      *(_DWORD *)buf = 138543618;
      v109 = v82;
      v110 = 2082;
      v111 = v84;
      _os_log_impl(&dword_1D0540000, v81, OS_LOG_TYPE_INFO, "%{public}@ %{public}s the medusa keyboard window", buf, 0x16u);

    }
    -[UIWindow setHidden:](self->_medusaHostedKeyboardWindow, "setHidden:", v21 ^ 1);
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v85;
    if (((v21 ^ 1) & 1) != 0)
      objc_msgSend(v85, "noteKeyboardIsNotForMedusa");
    else
      objc_msgSend(v85, "noteKeyboardIsForMedusaWithOwningScene:", v98);

    if (self->_isUsingMedusaHostedKeyboardWindow != (_DWORD)v21)
    {
      self->_isUsingMedusaHostedKeyboardWindow = (char)v21;
      -[SBMedusaHostedKeyboardWindowController _doObserverCalloutWithBlock:](self, "_doObserverCalloutWithBlock:", &__block_literal_global_20_0);
    }
    if (a4)
      *a4 = v99;

    v9 = v96;
    goto LABEL_90;
  }
LABEL_91:

}

- (SBMedusaHostedKeyboardWindowController)initWithWindowScene:(id)a3
{
  id v4;
  SBMedusaHostedKeyboardWindowController *v5;
  SBMedusaHostedKeyboardWindowController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBMedusaHostedKeyboardWindowController;
  v5 = -[SBMedusaHostedKeyboardWindowController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_windowScene, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SBMedusaHostedKeyboardWindowController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBMedusaHostedKeyboardWindowController;
  -[SBMedusaHostedKeyboardWindowController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  UIWindow *medusaHostedKeyboardWindow;

  -[UIWindow invalidate](self->_medusaHostedKeyboardWindow, "invalidate");
  medusaHostedKeyboardWindow = self->_medusaHostedKeyboardWindow;
  self->_medusaHostedKeyboardWindow = 0;

  -[FBSSceneClientSettingsDiffInspector removeAllObservers](self->_keyboardLayersClientSettingsDiffInspector, "removeAllObservers");
}

id __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_2;
  v6[3] = &unk_1E8E9E1D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)objc_msgSend(v6, "copy");

  return v4;
}

void __84__SBMedusaHostedKeyboardWindowController__keyboardLayersClientSettingsDiffInspector__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(_QWORD *)(v3 + 8);
    else
      v4 = 0;
    objc_msgSend(v5, "keyboardLayersDidChange:", v4);
  }

}

- (id)newMedusaHostedKeyboardWindowLevelAssertionWithPriority:(unint64_t)a3 windowLevel:(double)a4
{
  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) != 0)
    return 0;
  else
    return (id)-[UIWindow newWindowLevelAssertionWithPriority:windowLevel:](self->_medusaHostedKeyboardWindow, "newWindowLevelAssertionWithPriority:windowLevel:", a3, a4);
}

- (BOOL)isKeyboardVisibleForSpringBoard
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if (!objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sceneWithIdentifier:", *MEMORY[0x1E0D42708]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clientSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredSceneHostIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "clientSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredSceneHostIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v2, "sceneFromIdentityToken:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v7, "length"))
      {
        v4 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v2, "sceneWithIdentifier:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v10;
LABEL_8:
    objc_msgSend(v4, "clientProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v11, "isCurrentProcess");

    goto LABEL_9;
  }
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardFocusController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputUISceneController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isVisibleForSpringBoard");
LABEL_9:

  return v5;
}

- (BOOL)shouldKeyboardBeWindowSizedForHostWithIdentity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneFromIdentityToken:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "clientProcess");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isApplicationProcess"))
      {
        +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "applicationWithBundleIdentifier:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "uiSettings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "enhancedWindowingEnabled"))
        {
          v11 = objc_msgSend(v9, "supportsChamoisSceneResizing");

          v12 = v11 - 1;
        }
        else
        {

          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12 & 1;
}

void __96__SBMedusaHostedKeyboardWindowController_updateMedusaHostedKeyboardWindowForScene_isForeground___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "usingMedusaHostedKeyboardWindowDidChange");

}

- (void)addObserver:(id)a3
{
  void *v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v8 = a3;
  BSDispatchQueueAssertMain();
  v4 = v8;
  if (v8)
  {
    observers = self->_observers;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  BSDispatchQueueAssertMain();
  v4 = v5;
  if (v5)
  {
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
    v4 = v5;
  }

}

- (UIWindow)medusaHostedKeyboardWindow
{
  return self->_medusaHostedKeyboardWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medusaHostedKeyboardWindow, 0);
  objc_storeStrong((id *)&self->_keyboardLayersClientSettingsDiffInspector, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
