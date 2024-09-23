@implementation _UISceneUserActivityBSActionsHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasUserActivityManager, 0);
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _UISceneConnectionOptionsContext *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  _UISceneConnectionOptionsContext *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(_UISceneConnectionOptionsContext);
  -[_UISceneConnectionOptionsContext setUnprocessedActions:](v13, "setUnprocessedActions:", v9);
  v33 = v13;
  -[_UISceneConnectionOptionsContext setLaunchOptionsDictionary:](v13, "setLaunchOptionsDictionary:", MEMORY[0x1E0C9AA70]);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (!v15)
  {

    v17 = 0;
LABEL_25:
    -[_UISceneConnectionOptionsContext setUnprocessedActions:](v33, "setUnprocessedActions:", v14);
    v29 = 0;
    goto LABEL_26;
  }
  v16 = v15;
  v31 = v11;
  v32 = v10;
  v34 = 0;
  v17 = 0;
  v18 = *(_QWORD *)v36;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v36 != v18)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      if (objc_msgSend(v20, "UIActionType", v31, v32) == 6)
      {
        if (objc_msgSend(v12, "isUISubclass"))
        {
          objc_msgSend(v12, "payload");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("UIApplicationLaunchOptionsSourceApplicationKey"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v22 = 0;
        }
        objc_msgSend(v12, "originatingProcess");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UICanvasUserActivityManager _activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:](_UICanvasUserActivityManager, "_activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:", v20, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          if (v17)
          {
            objc_msgSend(v17, "addObject:", v24);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v24);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v39[0] = CFSTR("UICanvasConnectionOptionsUserActivityDictionariesKey");
            v39[1] = CFSTR("_UISceneConnectionOptionsUserActivityDictionariesKey");
            v40[0] = v17;
            v40[1] = v17;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UISceneConnectionOptionsContext setLaunchOptionsDictionary:](v33, "setLaunchOptionsDictionary:", v25);

          }
          objc_msgSend(v24, "objectForKey:", CFSTR("UICanvasConnectionOptionsUserActivityKey"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            v27 = v34;
            if (!v34)
              v27 = (void *)objc_msgSend(v14, "mutableCopy");
            v34 = v27;
            objc_msgSend(v27, "removeObject:", v20);
          }
        }

      }
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  }
  while (v16);

  if (!v34)
  {
    v11 = v31;
    v10 = v32;
    goto LABEL_25;
  }
  v28 = (void *)objc_msgSend(v34, "copy");
  -[_UISceneConnectionOptionsContext setUnprocessedActions:](v33, "setUnprocessedActions:", v28);

  v29 = v34;
  v11 = v31;
  v10 = v32;
LABEL_26:

  return v33;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _UICanvasUserActivityManager *v15;
  _UICanvasUserActivityManager *canvasUserActivityManager;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _UICanvasUserActivityManager *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  if (!self->_canvasUserActivityManager)
  {
    +[_UICanvasUserActivityManager _userActivityManagerForScene:](_UICanvasUserActivityManager, "_userActivityManagerForScene:", v12);
    v15 = (_UICanvasUserActivityManager *)objc_claimAutoreleasedReturnValue();
    canvasUserActivityManager = self->_canvasUserActivityManager;
    self->_canvasUserActivityManager = v15;

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  v19 = v17;
  if (!v18)
    goto LABEL_25;
  v20 = v18;
  v21 = *(_QWORD *)v38;
  while (2)
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v38 != v21)
        objc_enumerationMutation(v17);
      v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      if (objc_msgSend(v23, "UIActionType") == 6)
      {
        if (objc_msgSend(v13, "isUISubclass"))
        {
          objc_msgSend(v13, "payload");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("UIApplicationLaunchOptionsSourceApplicationKey"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v25 = 0;
        }
        objc_msgSend(v13, "originatingProcess");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UICanvasUserActivityManager _activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:](_UICanvasUserActivityManager, "_activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:", v23, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
          goto LABEL_24;
        if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0)
          goto LABEL_19;
        objc_msgSend(v12, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "delegate");
          v36 = v11;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v29, "_handleUserActivityForCanvas:", v12);

          v11 = v36;
          if (v35)
          {
LABEL_19:
            v30 = self->_canvasUserActivityManager;
            if (!v30)
            {
LABEL_24:
              v33 = (void *)objc_msgSend(v17, "mutableCopy");
              objc_msgSend(v33, "removeObject:", v23);
              v19 = (void *)objc_msgSend(v33, "copy");

              goto LABEL_25;
            }
            -[_UICanvasUserActivityManager _activityContinuationManager](v30, "_activityContinuationManager");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v12, "activationState") == 2;
LABEL_23:
            objc_msgSend(v31, "handleActivityContinuation:isSuspended:", v27, v32);

            goto LABEL_24;
          }
        }
        else
        {

        }
        objc_msgSend((id)UIApp, "_getActivityContinuationManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend((id)UIApp, "isSuspended");
        goto LABEL_23;
      }
    }
    v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v20)
      continue;
    break;
  }
  v19 = v17;
LABEL_25:

  return v19;
}

@end
