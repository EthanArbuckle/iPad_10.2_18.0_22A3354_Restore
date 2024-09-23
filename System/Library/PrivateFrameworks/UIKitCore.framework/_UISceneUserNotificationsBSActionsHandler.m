@implementation _UISceneUserNotificationsBSActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle") & 1) != 0
    || objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
  {
    v55 = v12;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v70 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          if (objc_msgSend(v20, "UIActionType") == 26)
          {
            objc_msgSend(v13, "addObject:", v20);
            if (v17)
            {
              objc_msgSend(v17, "addObject:", v20);
              v21 = v17;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v20);
              v21 = (id)objc_claimAutoreleasedReturnValue();
            }
            v22 = v21;

            v17 = v22;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
      }
      while (v16);
    }
    else
    {
      v17 = 0;
    }

    if (objc_msgSend(v13, "count") && v17)
    {
      v53 = v10;
      v54 = v9;
      v23 = v17;
      v52 = v11;
      v24 = v11;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      obj = v23;
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v77;
        v28 = 0x1E0CEC000uLL;
        v57 = v24;
        v58 = v13;
        v56 = *(_QWORD *)v77;
        do
        {
          v29 = 0;
          v59 = v26;
          do
          {
            if (*(_QWORD *)v77 != v27)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v29);
            objc_msgSend(*(id *)(v28 + 1952), "currentNotificationCenter");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "delegate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v30, "response");
              v33 = (id)objc_claimAutoreleasedReturnValue();
              if (v33)
              {
                v63 = v30;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v65 = (void *)MEMORY[0x1E0CEC788];
                  objc_msgSend(v33, "notification");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "actionIdentifier");
                  v34 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "originIdentifier");
                  v35 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "targetConnectionEndpoint");
                  v61 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "session");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "persistentIdentifier");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "userText");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = v65;
                  v64 = (void *)v35;
                  v66 = (void *)v34;
                  v40 = v35;
                  v41 = (void *)v61;
                  objc_msgSend(v39, "responseWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:userText:", v67, v34, v40, v61, v37, v38);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v68 = (void *)MEMORY[0x1E0CEC750];
                  objc_msgSend(v33, "notification");
                  v43 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "actionIdentifier");
                  v44 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "originIdentifier");
                  v45 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "targetConnectionEndpoint");
                  v62 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "session");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "persistentIdentifier");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = v68;
                  v66 = (void *)v44;
                  v67 = (void *)v43;
                  v64 = (void *)v45;
                  v47 = v45;
                  v41 = (void *)v62;
                  objc_msgSend(v46, "responseWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:", v43, v44, v47, v62, v37);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = v33;
                }

                v27 = v56;
                v24 = v57;
                v28 = 0x1E0CEC000;
                v30 = v63;
              }
              else
              {
                v42 = 0;
              }
              v73[0] = MEMORY[0x1E0C809B0];
              v73[1] = 3221225472;
              v73[2] = ___UISceneSendNotificationResponseActionCallbackForScene_block_invoke;
              v73[3] = &unk_1E16B1B50;
              v74 = v24;
              v75 = v30;
              _UIAutologgingVoidBlock(CFSTR("Warning: UNUserNotificationCenter delegate received call to -userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler: but the completion handler was never called."), v73);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:", v31, v42, v48);

              v13 = v58;
              v26 = v59;
            }

            ++v29;
          }
          while (v26 != v29);
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
        }
        while (v26);
      }

      v10 = v53;
      v9 = v54;
      v11 = v52;
    }

    v12 = v55;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v9);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "minusSet:", v13);
  v50 = (void *)objc_msgSend(v49, "copy");

  return v50;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void **v22;
  void (**v23)(void *, void *, const __CFString *);
  _UISceneConnectionOptionsContext *v24;
  id v26;
  id v27;
  id v28;
  _QWORD aBlock[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v11 = v9;
  v12 = 0;
  v13 = 0;
  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v40;
    do
    {
      v16 = 0;
      v17 = v12;
      v18 = v10;
      do
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v16);
        if (objc_msgSend(v19, "UIActionType") == 26)
        {
          v12 = v19;

          if (objc_msgSend(v12, "isDefaultAction"))
          {
            objc_msgSend(v12, "response");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v13;
            __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(&v38, (uint64_t)v20);
            v21 = v38;

            v13 = v21;
          }
          v37 = v18;
          v22 = &v37;
        }
        else
        {
          v36 = v18;
          v22 = &v36;
          v12 = v17;
        }
        __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(v22, (uint64_t)v19);
        v10 = *v22;

        ++v16;
        v17 = v12;
        v18 = v10;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v14);
  }

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__20;
  v34 = __Block_byref_object_dispose__20;
  v35 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __116___UISceneUserNotificationsBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_2;
  aBlock[3] = &unk_1E16B61C8;
  aBlock[4] = &v30;
  v23 = (void (**)(void *, void *, const __CFString *))_Block_copy(aBlock);
  v23[2](v23, v13, CFSTR("_UISceneConnectionOptionsNotificationResponsesKey"));
  v24 = objc_alloc_init(_UISceneConnectionOptionsContext);
  -[_UISceneConnectionOptionsContext setLaunchOptionsDictionary:](v24, "setLaunchOptionsDictionary:", v31[5]);
  -[_UISceneConnectionOptionsContext setUnprocessedActions:](v24, "setUnprocessedActions:", v10);

  _Block_object_dispose(&v30, 8);
  return v24;
}

@end
