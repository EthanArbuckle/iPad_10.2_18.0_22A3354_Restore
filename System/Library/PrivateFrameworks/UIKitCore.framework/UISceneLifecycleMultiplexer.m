@implementation UISceneLifecycleMultiplexer

uint64_t __75___UISceneLifecycleMultiplexer__mostActiveSceneIncludingInternal_withTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  if (!objc_msgSend(v3, "_hasLifecycle") || objc_msgSend(v3, "activationState") < 0)
  {
    v5 = 0;
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3);
    else
      v5 = 1;
  }

  return v5;
}

uint64_t __62___UISceneLifecycleMultiplexer_mostActiveWindowSceneOnScreen___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __67___UISceneLifecycleMultiplexer__mostActiveSceneForApplicationState__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "_isInternal"))
    v3 = objc_msgSend(v2, "_affectsAppLifecycleIfInternal");
  else
    v3 = 0;

  return v3;
}

uint64_t __78___UISceneLifecycleMultiplexer_lifecycleWantsUnnecessaryDelayForSceneDelivery__block_invoke()
{
  void *v0;
  char v1;
  void *v2;
  char v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  uint64_t result;

  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("UIRequireCrimsonLifecycle"));

  objc_msgSend((id)UIApp, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend((id)UIApp, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend((id)UIApp, "_appSupportsMultipleScenes");

  }
  v5 = objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle");
  v6 = (void *)objc_opt_class();
  v7 = _UIApplicationWantsExtensionBehavior(v6);
  result = objc_msgSend((id)UIApp, "isFrontBoard");
  lifecycleWantsUnnecessaryDelayForSceneDelivery__lifecycleWantsUnnecessaryDelayForSceneDelivery = (v1 | v3 | v5 | v7 | result) ^ 1;
  return result;
}

void __46___UISceneLifecycleMultiplexer_sharedInstance__block_invoke()
{
  _UISceneLifecycleMultiplexer *v0;
  uint64_t v1;
  void *v2;

  v0 = [_UISceneLifecycleMultiplexer alloc];
  v1 = -[_UISceneLifecycleMultiplexer initForAppSingleton:](v0, "initForAppSingleton:", UIApp);
  v2 = (void *)_MergedGlobals_977;
  _MergedGlobals_977 = v1;

}

void __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  void *v17;
  __int16 v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  char v32;
  char v33;
  char v34;
  _QWORD v35[5];

  switch(a2)
  {
    case 1:
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
      objc_msgSend((id)UIApp, "_stopDeactivatingForReason:", 12);
      if (!*(_BYTE *)(a1 + 104))
      {
        objc_msgSend((id)UIApp, "applicationDidResume");
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "postNotificationName:object:userInfo:", CFSTR("UIApplicationResumedNotification"), UIApp, 0);

      }
      return;
    case 2:
      v3 = objc_msgSend(*(id *)(a1 + 56), "deviceOrientation");
      if (!objc_msgSend(*(id *)(a1 + 56), "deviceOrientationEventsEnabled"))
        goto LABEL_16;
      if ((unint64_t)(v3 - 1) >= 4)
      {
        v4 = objc_msgSend(*(id *)(a1 + 56), "interfaceOrientation");
      }
      else if ((objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle") & 1) != 0
             || objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
      {
        v4 = objc_msgSend(*(id *)(a1 + 56), "interfaceOrientation");
        if (v3 != objc_msgSend(*(id *)(a1 + 56), "interfaceOrientation"))
        {
          _UIMainBundleIdentifier();
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(CFSTR("com.apple.MobileSMS"), "isEqualToString:", v5);

          if ((v6 & 1) == 0)
          {
            v7 = *(void **)(a1 + 64);
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_3;
            v35[3] = &__block_descriptor_40_e5_v8__0l;
            v35[4] = v3;
            objc_msgSend(v7, "_enqueuePostSettingsUpdateResponseBlock:inPhase:", v35, 0x1E16F0C20);
          }
        }
      }
      else
      {
LABEL_16:
        v4 = v3;
      }
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setOrientation:animated:", v4, objc_msgSend(*(id *)(a1 + 72), "isForeground"));

      objc_msgSend(*(id *)(a1 + 32), "_scheduleFirstCommit");
      BSSetMainThreadPriorityFixedForUI();
      objc_msgSend((id)UIApp, "_deactivateForReason:", 12);
      if (!*(_BYTE *)(a1 + 104)
        || (objc_msgSend(*(id *)(a1 + 32), "lifecycleWantsUnnecessaryDelayForSceneDelivery") & 1) == 0)
      {
        if (!objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle")
          || (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0)
        {
          objc_msgSend((id)UIApp, "_checkActivityContinuationAndBecomeCurrentIfNeeded");
        }
        objc_msgSend((id)UIApp, "_sendWillEnterForegroundCallbacks");
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
      }
      objc_msgSend((id)UIApp, "_stopDeactivatingForReason:", 11);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("UIApplicationResumedEventsOnlyNotification"), UIApp, 0);

      return;
    case 3:
      objc_msgSend((id)UIApp, "_updateAppPriorityForSuspendedState");
      v8 = (void *)UIApp;
      *(_QWORD *)(UIApp + 176) &= ~0x100000000uLL;
      objc_msgSend(v8, "_deactivateForReason:", 11);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
      objc_msgSend((id)UIApp, "_cancelAllInputs");
      objc_msgSend((id)UIApp, "applicationWillSuspend");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("UIApplicationSuspendedNotification"), UIApp, 0);

      objc_msgSend((id)UIApp, "_applicationDidEnterBackground");
      LOBYTE(v9) = objc_msgSend(*(id *)(a1 + 32), "_prepareForClientSuspensionWithScene:", *(_QWORD *)(a1 + 88));
      v10 = *(unsigned __int8 *)(a1 + 105);
      if (*(_BYTE *)(a1 + 105))
      {
        objc_msgSend((id)UIApp, "_handleSuspensionActions");
        v11 = (void *)UIApp;
      }
      else
      {
        v13 = *(_QWORD *)(UIApp + 184);
        objc_msgSend((id)UIApp, "_handleSuspensionActions");
        v11 = (void *)UIApp;
        if ((v13 & 0x4000) == 0)
          LODWORD(v9) = (*(unsigned __int8 *)(UIApp + 185) >> 6) & 1;
      }
      v14 = objc_msgSend(v11, "reportApplicationSuspended");
      if (v10)
        v15 = 1;
      else
        v15 = (char)v9;
      v16 = v15 | v14;
      objc_msgSend(*(id *)(a1 + 88), "uiSettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "deactivationReasons");

      if ((v18 & 0x100) != 0)
      {
        +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setSuppressingKeyboard:forScene:", 1, *(_QWORD *)(a1 + 80));

      }
      v20 = *(void **)(a1 + 64);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3254779904;
      v26[2] = __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_4;
      v26[3] = &unk_1E168B890;
      v32 = HIBYTE(v18) & 1;
      v27 = *(id *)(a1 + 80);
      v33 = (char)v9;
      v21 = *(id *)(a1 + 40);
      v34 = v16;
      v22 = *(_QWORD *)(a1 + 32);
      v28 = v21;
      v29 = v22;
      v30 = *(id *)(a1 + 88);
      v31 = *(id *)(a1 + 96);
      objc_msgSend(v20, "_enqueuePostSettingsUpdateResponseBlock:inPhase:", v26, 0x1E16F0C20);

      return;
    case 4:
      objc_msgSend((id)UIApp, "_deactivateForReason:", 12);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("UIApplicationSuspendedEventsOnlyNotification"), UIApp, 0);

      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
      return;
    case 5:
      if (objc_msgSend(*(id *)(a1 + 32), "lifecycleWantsUnnecessaryDelayForSceneDelivery"))
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 32), "completeApplicationLaunchWithFBSScene:transitionContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 96));
      }
      return;
    default:
      return;
  }
}

void __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, int);
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __int16 v19;

  v2 = *(_DWORD *)(a1 + 104);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3254779904;
  v8 = __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_2;
  v9 = &unk_1E168B6D8;
  v3 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 88);
  v18 = *(id *)(a1 + 96);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 72);
  v19 = *(_WORD *)(a1 + 108);
  v16 = *(id *)(a1 + 80);
  _UIScenePerformActionsWithLifecycleActionMask(v2, &v6);
  if (*(_DWORD *)(a1 + 104))
  {
    __cachedMostActiveWindowScene = 0;
    v4 = objc_msgSend((id)UIApp, "applicationState", v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
    +[_UIApplicationIntelligenceSupport sharedInstance](_UIApplicationIntelligenceSupport, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setApplicationState:", v4);

  }
  if (*(_BYTE *)(a1 + 110))
    objc_msgSend(*(id *)(a1 + 64), "_enqueuePostSettingsUpdateResponseBlock:inPhase:", &__block_literal_global_28, 0x1E16F0C20);

}

void __75___UISceneLifecycleMultiplexer__mostActiveSceneIncludingInternal_withTest___block_invoke_9(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(_QWORD *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (!v9)
    {
      objc_storeStrong(v8, a2);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "activationState");
    }
    if (objc_msgSend(*(id *)(a1 + 56), "_compareLifecycleStateOfScene:toScene:") == -1)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "activationState");
    }
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "activationState"))
      *a4 = 1;
  }

}

uint64_t __52___UISceneLifecycleMultiplexer_collectBackingStores__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)UIApp, "_endBackgroundTask:", *(_QWORD *)(a1 + 32));
}

void __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_3(uint64_t a1)
{
  id v2;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOrientation:animated:", *(_QWORD *)(a1 + 32), 0);

}

void __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_4(uint64_t a1)
{
  void (**v2)(_QWORD);
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  _QWORD aBlock[4];
  id v7;
  id v8;
  char v9;
  char v10;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_5;
  aBlock[3] = &unk_1E16B4E20;
  v9 = *(_BYTE *)(a1 + 72);
  v7 = *(id *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 73);
  v8 = *(id *)(a1 + 40);
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  v3 = v2;
  if (*(_BYTE *)(a1 + 74))
  {
    v2[2](v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("UIApplicationWantsViewsToDisappearNotification"), *(_QWORD *)(a1 + 48));

    objc_msgSend((id)UIApp, "_handleTaskCompletionAndTerminate:", *(_QWORD *)(a1 + 64));
  }
  else if ((objc_msgSend(*(id *)(a1 + 40), "isForeground") & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSuppressingKeyboard:forScene:", 0, *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    v3[2](v3);
  }

}

void __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_BYTE *)(a1 + 48))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSuppressingKeyboard:forScene:", 0, *(_QWORD *)(a1 + 32));

  }
  if (!*(_BYTE *)(a1 + 49) && (_UISceneLifecycleStateIsSEO(*(void **)(a1 + 40)) & 1) == 0)
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_deactivateForBackgrounding");

    objc_msgSend((id)UIApp, "_purgeSharedInstances");
    CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronize");

  }
}

uint64_t __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_27()
{
  return objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", &__block_literal_global_30);
}

uint64_t __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_2_29()
{
  void *v0;
  unint64_t *v1;
  uint64_t v2;
  uint64_t result;
  unint64_t v4;

  v0 = (void *)UIApp;
  v1 = (unint64_t *)(UIApp + 176);
  v2 = *(_QWORD *)(UIApp + 176);
  if ((v2 & 0x80000) == 0)
    return objc_msgSend((id)UIApp, "_reportMainSceneUpdateFinished:", 0);
  v4 = *(_QWORD *)(UIApp + 184);
  *v1 = v2 & 0xFFFFFFFFFFF7FFFFLL;
  v1[1] = v4;
  result = objc_msgSend(v0, "_reportMainSceneUpdateFinished:", 0);
  *(_QWORD *)(UIApp + 176) |= 0x80000uLL;
  return result;
}

void __69___UISceneLifecycleMultiplexer__prepareForClientSuspensionWithScene___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("UISuspendedStatusBarStyleKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_msgSend(v3, "integerValue");
      objc_msgSend(v7, "setStatusBarStyle:", v4);
      objc_msgSend(v7, "setDefaultStatusBarStyle:", v4);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("UISuspendedStatusBarHiddenKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "BOOLValue");
      objc_msgSend(v7, "setStatusBarHidden:", v6);
      objc_msgSend(v7, "setDefaultStatusBarHidden:", v6);
    }
  }
  objc_msgSend(v7, "setDefaultPNGName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setDefaultPNGExpirationTime:", *(double *)(a1 + 48));

}

@end
