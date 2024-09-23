@implementation UIWindowSceneFBSSceneLifecycleMonitor

uint64_t __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_prepareForResume");
}

uint64_t __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_5(uint64_t result, int a2)
{
  uint64_t v2;

  v2 = result;
  switch(a2)
  {
    case 1:
      objc_msgSend(*(id *)(result + 32), "willBecomeActive");
      (*(void (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
      result = objc_msgSend(*(id *)(v2 + 32), "didBecomeActive");
      break;
    case 2:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 40), "_enqueuePostSettingsUpdateResponseBlock:inPhase:", *(_QWORD *)(result + 48), 0x1E16F0C60);
      objc_msgSend(*(id *)(v2 + 32), "willEnterForeground");
      (*(void (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
      result = objc_msgSend(*(id *)(v2 + 32), "didEnterForeground");
      break;
    case 3:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 40), "_enqueuePostSettingsUpdateResponseBlock:inPhase:", *(_QWORD *)(result + 56), 0x1E16F0C60);
      objc_msgSend(*(id *)(v2 + 32), "willEnterBackground");
      (*(void (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
      result = objc_msgSend(*(id *)(v2 + 32), "didEnterBackground");
      break;
    case 4:
      objc_msgSend(*(id *)(result + 32), "willResignActive");
      (*(void (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
      result = objc_msgSend(*(id *)(v2 + 32), "didResignActive");
      break;
    case 5:
      objc_msgSend(*(id *)(result + 32), "willConnect");
      *(_BYTE *)(*(_QWORD *)(v2 + 32) + 25) = 1;
      (*(void (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
      result = objc_msgSend(*(id *)(v2 + 32), "didConnect");
      break;
    case 6:
      objc_msgSend(*(id *)(result + 32), "willDisonnect");
      (*(void (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
      *(_BYTE *)(*(_QWORD *)(v2 + 32) + 25) = 0;
      result = objc_msgSend(*(id *)(v2 + 32), "didDisonnect");
      break;
    default:
      return result;
  }
  return result;
}

void __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_3(uint64_t a1, uint64_t a2, char a3)
{
  void *v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = a3 ^ 1;
  if ((a3 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v5);
  if ((a3 & 1) == 0)

}

void __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_4(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v2 = *(_DWORD *)(a1 + 80);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_5;
  v10[3] = &unk_1E16B77A8;
  v3 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 64);
  v11 = v4;
  v14 = v5;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  _UIScenePerformActionsWithLifecycleActionMask(v2, v10);
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("_UISceneLifecycleMonitor.m"), 269, CFSTR("reached end of scene transition block but still preserving transitioning state!"));

    v6 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v6 + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("_UISceneLifecycleMonitor.m"), 270, CFSTR("reached end of scene transition block but still preserving false transition state!"));

  }
  if (*(_DWORD *)(a1 + 80))
  {
    __cachedMostActiveWindowScene = 0;
    +[_UIApplicationIntelligenceSupport sharedInstance](_UIApplicationIntelligenceSupport, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connectedScenesUpdated");

  }
}

uint64_t __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_prepareForSuspend");
}

void __60___UIWindowSceneFBSSceneLifecycleMonitor_didEnterBackground__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60___UIWindowSceneFBSSceneLifecycleMonitor_didEnterBackground__block_invoke_2;
  v2[3] = &unk_1E16B2A58;
  v3 = v1;
  objc_msgSend(v3, "_updateUIClientSettingsWithBlock:", v2);

}

void __60___UIWindowSceneFBSSceneLifecycleMonitor_didEnterBackground__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setSupportedInterfaceOrientations:", objc_msgSend(v2, "_currentlySupportedInterfaceOrientations"));

}

uint64_t __58___UIWindowSceneFBSSceneLifecycleMonitor_willBecomeActive__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUIClientSettingsWithBlock:", &__block_literal_global_58);
}

uint64_t __58___UIWindowSceneFBSSceneLifecycleMonitor_willBecomeActive__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportedInterfaceOrientations:", 0);
}

@end
