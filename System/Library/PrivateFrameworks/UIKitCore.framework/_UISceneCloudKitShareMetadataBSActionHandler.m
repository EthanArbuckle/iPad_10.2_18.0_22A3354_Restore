@implementation _UISceneCloudKitShareMetadataBSActionHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v38;
  char v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v41 = a4;
  v12 = a5;
  v40 = a6;
  v13 = objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneCloudKitShareMetadataBSActionHandler.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uiScene isKindOfClass:[UIWindowScene self]]"));

  }
  v17 = v12;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v19)
  {
    v20 = v19;
    v39 = v13;
    v21 = 0;
    v22 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (objc_msgSend(v24, "UIActionType") == 23)
        {
          objc_msgSend(v14, "addObject:", v24);
          objc_msgSend(v24, "shareMetadata");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v21, "addObject:", v25);
            v26 = v21;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v25);
            v26 = (id)objc_claimAutoreleasedReturnValue();
          }
          v27 = v26;

          v21 = v27;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v20);

    if (!v21)
    {
      v34 = 0;
      if ((v39 & 1) != 0)
        goto LABEL_21;
LABEL_23:
      v36 = v18;
      goto LABEL_24;
    }
    v28 = v21;
    v29 = v17;
    objc_msgSend(v29, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_opt_respondsToSelector();

    v13 = v39;
    if ((v31 & 1) != 0)
    {
      objc_msgSend(v29, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "anyObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "windowScene:userDidAcceptCloudKitShareWithMetadata:", v29, v33);

    }
    v34 = v28;
  }
  else
  {
    v34 = 0;
    v28 = v18;
  }

  if ((v13 & 1) == 0)
    goto LABEL_23;
LABEL_21:
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v18);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "minusSet:", v14);
  v36 = (id)objc_msgSend(v35, "copy");

LABEL_24:
  return v36;
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
        if (objc_msgSend(v18, "UIActionType", v24) == 23)
        {
          v33 = v14;
          objc_msgSend(v18, "shareMetadata");
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
  v29 = __Block_byref_object_copy__17;
  v30 = __Block_byref_object_dispose__17;
  v31 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_9;
  aBlock[3] = &unk_1E16B61C8;
  aBlock[4] = &v26;
  v21 = (void (**)(void *, void *, const __CFString *))_Block_copy(aBlock);
  v21[2](v21, v14, CFSTR("_UISceneConnectionOptionsCloudKitShareMetadataKey"));
  v22 = objc_alloc_init(_UISceneConnectionOptionsContext);
  -[_UISceneConnectionOptionsContext setLaunchOptionsDictionary:](v22, "setLaunchOptionsDictionary:", v27[5]);
  -[_UISceneConnectionOptionsContext setUnprocessedActions:](v22, "setUnprocessedActions:", v12);

  _Block_object_dispose(&v26, 8);
  return v22;
}

@end
