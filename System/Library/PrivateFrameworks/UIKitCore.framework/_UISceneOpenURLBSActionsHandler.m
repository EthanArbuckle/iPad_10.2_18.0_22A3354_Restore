@implementation _UISceneOpenURLBSActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;

  v8 = a3;
  v9 = a5;
  v10 = (void *)UIApp;
  v11 = a6;
  v12 = objc_msgSend(v10, "_appAdoptsUISceneLifecycle");
  objc_msgSend(v9, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  _UISceneOpenURLContextsFromActionsSessionAndTransitionContext(v8, v13, v11, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v19;
  if (v14)
    _UISceneSendOpenURLActionCallbackForScene(v14, v9);
  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "minusSet:", v15);
    v17 = (id)objc_msgSend(v16, "copy");

  }
  else
  {
    v17 = v8;
  }

  return v17;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void (**v12)(void *, void *, const __CFString *);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  _UISceneConnectionOptionsContext *v21;
  void *v22;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD aBlock[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  void *v41;
  _BYTE v42[128];
  _QWORD v43[2];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v24 = a4;
  v9 = a5;
  v10 = a6;
  if (objc_msgSend(v10, "isUISubclass"))
  {
    objc_msgSend(v10, "payload", v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v41 = 0;
  v25 = v9;
  v26 = v10;
  _UISceneOpenURLContextsFromActionsSessionAndTransitionContext(v29, v9, v10, &v41);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v41;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__209;
  v39 = __Block_byref_object_dispose__209;
  v40 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106___UISceneOpenURLBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke;
  aBlock[3] = &unk_1E16B61C8;
  aBlock[4] = &v35;
  v12 = (void (**)(void *, void *, const __CFString *))_Block_copy(aBlock);
  v12[2](v12, v28, CFSTR("_UISceneConnectionOptionsURLContextKey"));
  v43[0] = CFSTR("UIApplicationLaunchOptionsSourceApplicationKey");
  v43[1] = CFSTR("UIApplicationLaunchOptionsAppLinkOpenStrategyChangedKey");
  v44[0] = CFSTR("_UISceneConnectionOptionsSourceApplicationKey");
  v44[1] = CFSTR("_UISceneConnectionOptionsAppLinkOpenStrategyChangedKey");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v17, v24, v25, v26);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v17);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12[2](v12, v19, v20);

        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v14);
  }

  v21 = objc_alloc_init(_UISceneConnectionOptionsContext);
  -[_UISceneConnectionOptionsContext setLaunchOptionsDictionary:](v21, "setLaunchOptionsDictionary:", v36[5]);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "minusSet:", v27);
  -[_UISceneConnectionOptionsContext setUnprocessedActions:](v21, "setUnprocessedActions:", v22);

  _Block_object_dispose(&v35, 8);
  return v21;
}

@end
