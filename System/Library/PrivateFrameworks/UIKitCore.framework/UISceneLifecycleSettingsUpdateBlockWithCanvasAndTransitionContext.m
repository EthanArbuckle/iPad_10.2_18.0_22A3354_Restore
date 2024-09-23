@implementation UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext

uint64_t ___UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  id v24;
  int64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isRespondingToLifecycleEvent");
  v3 = +[UIScene _activationStateFromSceneSettings:](UIScene, "_activationStateFromSceneSettings:", *(_QWORD *)(a1 + 40));
  v4 = +[UIScene _activationStateFromSceneSettings:](UIScene, "_activationStateFromSceneSettings:", *(_QWORD *)(a1 + 48));
  if (_UISceneLifecycleCompositeActionMaskHighestLifecycleActionType(_UISceneLifecycleCompositeActionMaskFromStateToState__staticStateMap[4 * v3 + 5 + v4])
    || (v5 = objc_msgSend(*(id *)(a1 + 40), "deactivationReasons"),
        v5 != objc_msgSend(*(id *)(a1 + 48), "deactivationReasons")))
  {
    v17 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_lifecycleMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = ___UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext_block_invoke_2;
    v22[3] = &unk_1E16B7EA8;
    v9 = *(_QWORD *)(a1 + 40);
    v23 = *(id *)(a1 + 32);
    v25 = v4;
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v6, "transitionToTargetState:fromState:withTransitionContext:preparations:", v7, v9, v8, v22);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_sceneComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "_scene:didTransitionFromActivationState:withReasonsMask:", *(_QWORD *)(a1 + 32), v3, objc_msgSend(*(id *)(a1 + 40), "deactivationReasons"));
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v12);
    }

    v2 = v17;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_setIsRespondingToLifecycleEvent:", v2);
}

void ___UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(id, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_setIsRespondingToLifecycleEvent:", 1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_sceneComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "_scene:willTransitionToActivationState:withReasonsMask:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "deactivationReasons"));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9[2](v9, 0);
}

@end
