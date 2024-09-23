@implementation _UISceneShortcutItemBSActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  id v39;
  void *v41;
  id v42;
  id v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, int);
  void *v55;
  id v56;
  id v57;
  char v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v45 = objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneShortcutItemBSActionsHandler.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene self]]"));

  }
  v18 = v13;
  if (objc_msgSend(v14, "isUISubclass"))
    v19 = v14;
  else
    v19 = 0;
  v20 = v19;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v21 = v11;
  v22 = (id)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (!v22)
  {

    v23 = 0;
    goto LABEL_25;
  }
  v42 = v20;
  v43 = v12;
  v44 = v18;
  v23 = 0;
  v24 = 0;
  v25 = *(_QWORD *)v49;
  do
  {
    for (i = 0; i != v22; i = (char *)i + 1)
    {
      if (*(_QWORD *)v49 != v25)
        objc_enumerationMutation(v21);
      v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v27, "UIActionType") == 17)
      {
        objc_msgSend(v15, "addObject:", v27);
        v47 = v24;
        __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(&v47, (uint64_t)v27);
        v28 = v47;

        v46 = v23;
        objc_msgSend(v27, "uiShortcutItem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(&v46, (uint64_t)v29);
        v30 = v46;

        v23 = v30;
        v24 = v28;
      }
    }
    v22 = (id)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  }
  while (v22);

  if (v24)
  {
    v22 = v24;
    v23 = v23;
    v18 = v44;
    v31 = v44;
    v32 = objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle");
    objc_msgSend(v31, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_opt_respondsToSelector();

    objc_msgSend(v31, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v34 & 1) != 0)
    {
      objc_msgSend(v23, "anyObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = MEMORY[0x1E0C809B0];
      v53 = 3221225472;
      v54 = ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke;
      v55 = &unk_1E16B7110;
      v58 = v32;
      v56 = v22;
      v57 = v31;
      objc_msgSend(v35, "windowScene:performActionForShortcutItem:completionHandler:", v57, v36, &v52);

    }
    else
    {
      v37 = objc_opt_respondsToSelector();

      if ((v37 & 1) == 0)
      {
LABEL_23:

        v12 = v43;
        goto LABEL_24;
      }
      objc_msgSend(v31, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = MEMORY[0x1E0C809B0];
      v53 = 3221225472;
      v54 = ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke_3;
      v55 = &unk_1E16B7110;
      v58 = v32;
      v56 = v22;
      v57 = v31;
      objc_msgSend(v35, "_canvas:performActionForShortcutItems:completionHandler:", v57, v23, &v52);
    }

    v18 = v44;
    goto LABEL_23;
  }
  v22 = 0;
  v12 = v43;
  v18 = v44;
LABEL_24:
  v20 = v42;
LABEL_25:
  if ((v45 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v21);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "minusSet:", v15);
    v39 = (id)objc_msgSend(v38, "copy");

  }
  else
  {
    v39 = v21;
  }

  return v39;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(void *, void *, const __CFString *);
  _UISceneConnectionOptionsContext *v22;
  id v24;
  _QWORD aBlock[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v24 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = v9;
  v14 = 0;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v18, "UIActionType", v24) == 17)
        {
          v33 = v14;
          objc_msgSend(v18, "uiShortcutItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(&v33, (uint64_t)v19);
          v20 = v33;

          v14 = v20;
        }
        else
        {
          v32 = v12;
          __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(&v32, (uint64_t)v18);
          v19 = v12;
          v12 = v32;
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v15);
  }

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__45;
  v30 = __Block_byref_object_dispose__45;
  v31 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111___UISceneShortcutItemBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_9;
  aBlock[3] = &unk_1E16B61C8;
  aBlock[4] = &v26;
  v21 = (void (**)(void *, void *, const __CFString *))_Block_copy(aBlock);
  v21[2](v21, v14, CFSTR("_UISceneConnectionOptionsShortcutItemKey"));
  v22 = objc_alloc_init(_UISceneConnectionOptionsContext);
  -[_UISceneConnectionOptionsContext setLaunchOptionsDictionary:](v22, "setLaunchOptionsDictionary:", v27[5]);
  -[_UISceneConnectionOptionsContext setUnprocessedActions:](v22, "setUnprocessedActions:", v12);

  _Block_object_dispose(&v26, 8);
  return v22;
}

@end
