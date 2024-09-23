@implementation UIKeyboardArbiterClient

uint64_t __61___UIKeyboardArbiterClient_queue_keyboardChanged_onComplete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleKeyboardChanged:isLocal:onComplete:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __64___UIKeyboardArbiterClient_queue_keyboardChangedWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "keyboardChangedCompleted");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  char v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (objc_msgSend(WeakRetained, "expectingInitialState"))
  {

  }
  else
  {
    if (!*(_BYTE *)(a1 + 72))
    {
LABEL_9:

      goto LABEL_10;
    }
    v4 = objc_loadWeakRetained(v2);
    v5 = objc_msgSend(v4, "avoidDisableKeyboard");

    if ((v5 & 1) != 0)
      goto LABEL_10;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "_didHandleKeyboardClientChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", *(_QWORD *)(a1 + 32), 0, 0);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "syncKeyboardUIChangeInfo:", *(_QWORD *)(a1 + 40));
    goto LABEL_9;
  }
LABEL_10:
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "setExpectingInitialState:", 0);

  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "_updateEventSource:options:", *(_QWORD *)(a1 + 64), 3);

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      v10 = objc_loadWeakRetained(v2);
      (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v9 + 16))(v9, 1, 1, objc_msgSend(v10, "avoidDisableKeyboard") ^ 1);

    }
    else
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v9 + 16))(*(_QWORD *)(a1 + 48), 1, 1, 0);
    }
  }
  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "setAvoidDisableKeyboard:", 0);

}

uint64_t __39___UIKeyboardArbiterClient_willResume___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "shouldSnapshot")
    && !+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(*(id *)(a1 + 32), "reloadForSnapshotting");
  }
  objc_msgSend(*(id *)(a1 + 32), "startConnection");
  return objc_msgSend(*(id *)(a1 + 32), "setEnqueuedWillEnterForegroundActions:", 0);
}

void __56___UIKeyboardArbiterClient_automaticSharedArbiterClient__block_invoke()
{
  __objc2_class **v0;
  int v1;
  id v2;
  void *v3;

  if (+[_UIKeyboardArbiterClient enabled](_UIKeyboardArbiterClient, "enabled"))
  {
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      v0 = off_1E167C820;
    }
    else
    {
      v1 = objc_msgSend((id)UIApp, "_isSpringBoard");
      v0 = off_1E167C818;
      if (v1)
        v0 = off_1E167C828;
    }
    v2 = objc_alloc_init(*v0);
    v3 = (void *)qword_1ECD7D750;
    qword_1ECD7D750 = (uint64_t)v2;

  }
}

void __39___UIKeyboardArbiterClient_serviceName__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D017A8], "environmentAliases");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveMachService:", CFSTR("com.apple.UIKit.KeyboardManagement.hosted"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7D758;
  qword_1ECD7D758 = v0;

}

void __40___UIKeyboardArbiterClient_arbiterProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  KeyboardArbiterClientLog_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient arbiterProxy]  Failed to access remote service: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint8_t v7[16];

  KeyboardArbiterClientLog_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient startConnectionWithCompletion:]_block_invoke  XPC connection interrupted", v7, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "queue_failedConnection:", v5);

}

void __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke_126(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint8_t v7[16];

  KeyboardArbiterClientLog_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient startConnectionWithCompletion:]_block_invoke  XPC unexpectedly invalidated", v7, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "queue_failedConnection:", v5);

}

void __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke_129(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9;
  id v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20[2];
  char v21;

  v9 = a2;
  v10 = a3;
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    if ((a5 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v11 + 16))(v11, 1, 0, objc_msgSend(WeakRetained, "avoidDisableKeyboard") ^ 1);

    }
    else
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(v11 + 16))(*(_QWORD *)(a1 + 32), 1, 0, 0);
    }
  }
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke_2;
  v16[3] = &unk_1E16C4010;
  objc_copyWeak(v20, (id *)(a1 + 40));
  v21 = a5;
  v14 = v9;
  v17 = v14;
  v15 = v10;
  v18 = v15;
  v20[1] = a4;
  v19 = *(id *)(a1 + 32);
  objc_msgSend(v13, "performAsync:", v16);

  objc_destroyWeak(v20);
}

uint64_t __46___UIKeyboardArbiterClient_isOnScreenRotating__block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v2 = result;
    result = objc_msgSend(a2, "isOnScreenRotating");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) |= result;
  }
  return result;
}

uint64_t __64___UIKeyboardArbiterClient_queue_endInputSessionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __51___UIKeyboardArbiterClient_queue_failedConnection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  dispatch_time_t v4;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 104);
  if (v2 == *(void **)(a1 + 40))
  {
    *(_QWORD *)(v1 + 104) = 0;

    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "didFailArbiterConnection");
    v4 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51___UIKeyboardArbiterClient_queue_failedConnection___block_invoke_2;
    block[3] = &unk_1E16B1B28;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __51___UIKeyboardArbiterClient_queue_failedConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkConnection");
}

uint64_t __68___UIKeyboardArbiterClient_queue_setLastEventSource_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateEventSource:options:", *(_QWORD *)(a1 + 48), 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __68___UIKeyboardArbiterClient_queue_keyboardSuppressed_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 12);
  if (*(_BYTE *)(a1 + 48))
    v4 = v3 + 1;
  else
    v4 = v3 - 1;
  *(_DWORD *)(v2 + 12) = v4;
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeactivatedKeyboard:forScene:", *(unsigned __int8 *)(a1 + 48), 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  float v7;
  char isKindOfClass;
  double v9;

  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(CFSTR("_UIScrollKeyboardDuration"), "isEqual:", v4) & 1) != 0
    || objc_msgSend(CFSTR("_UIScrollKeyboardIAVOffset"), "isEqual:", v4))
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      isKindOfClass = v7 <= 1.0 && v7 >= 0.0;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if ((objc_msgSend(CFSTR("_UIScrollKeyboardCancelInfo"), "isEqual:", v4) & 1) == 0
    && (objc_msgSend(CFSTR("_UIKeyboardContextID"), "isEqual:", v4) & 1) == 0
    && !objc_msgSend(CFSTR("_UIKeyboardLayerID"), "isEqual:", v4)
    && !objc_msgSend(CFSTR("_UIScrollKeyboardPlacementFrom"), "isEqual:", v4)
    && !objc_msgSend(CFSTR("_UIScrollKeyboardPlacementTo"), "isEqual:", v4))
  {
    if (!objc_msgSend(CFSTR("Origin"), "isEqual:", v4))
    {
      isKindOfClass = 0;
      goto LABEL_19;
    }
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "pointValue");
      if (v9 == 0.0)
      {
        isKindOfClass = 1;
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_17:
    isKindOfClass = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
LABEL_19:

  return isKindOfClass & 1;
}

uint64_t __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startTransition:withInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTransition:withInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "completeTransition:withInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "objectForKey:", CFSTR("Quiet"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v10, "BOOLValue");
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("Animated"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("Notify"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlacement:quietly:animated:generateSplitNotification:", v3, v6, v8, objc_msgSend(v9, "BOOLValue"));

}

uint64_t __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 42);
  *(_BYTE *)(v2 + 42) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 55) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_performOnDistributedControllersExceptSelf:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 55) = 0;
  result = *(_QWORD *)(a1 + 48);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 42) = v3;
  return result;
}

uint64_t __114___UIKeyboardArbiterClient_setDisableBecomeFirstResponder_forSuppressionAssertion_updatePlacement_wantsAssistant___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:wantsAssistant:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 42), *(unsigned __int8 *)(a1 + 43));
}

uint64_t __43___UIKeyboardArbiterClient_verifyPlacement__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadPlacement");
}

uint64_t __44___UIKeyboardArbiterClient_cleanSuppression__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cleanDeactivation");
}

void __71___UIKeyboardArbiterClient__performOnDistributedControllersExceptSelf___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDE7F278))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __65___UIKeyboardArbiterClient_restorePreservedInputViewsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_restoreInputViewsWithId:animated:", CFSTR("inputui-keyboard-inputviews-preservation-key"), 1);
}

void __56___UIKeyboardArbiterClient_controllerDidLayoutSubviews___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "keyboardActive"))
    objc_msgSend(*(id *)(a1 + 32), "_layoutKeyboardViews:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v3 + 24);
  if (v4 >= v2 * v2)
  {
    KeyboardArbiterClientLog_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient controllerDidLayoutSubviews:]  Warning - input views recursively changing sizes - aborting", buf, 2u);
    }
  }
  else
  {
    *(_DWORD *)(v3 + 24) = v4 + 1;
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if (v11 != *(void **)(a1 + 40))
            objc_msgSend(v11, "checkPlaceholdersForRemoteKeyboards", (_QWORD)v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

    --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  }

}

void __49___UIKeyboardArbiterClient_reloadForSnapshotting__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    objc_msgSend(v4, "containerRootController");
  else
    objc_msgSend(v4, "existingContainerRootController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushAnimationStyle:", v3);

  objc_msgSend(v4, "forceReloadInputViews");
  objc_msgSend(v4, "popAnimationStyle");

}

uint64_t __39___UIKeyboardArbiterClient_didSuspend___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDisableBecomeFirstResponder:", 0);
  return objc_msgSend((id)UIApp, "_endBackgroundTask:", *(_QWORD *)(a1 + 40));
}

void __39___UIKeyboardArbiterClient_didSuspend___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAsync:", *(_QWORD *)(a1 + 32));

}

uint64_t __39___UIKeyboardArbiterClient_didSuspend___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldSnapshot");
  if ((_DWORD)result)
  {
    result = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
    if ((result & 1) == 0)
      result = objc_msgSend(*(id *)(a1 + 32), "reloadForSnapshotting");
  }
  if (!*(_BYTE *)(a1 + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __48___UIKeyboardArbiterClient_mainBundleIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7D770;
  qword_1ECD7D770 = v0;

}

@end
