@implementation UIKeyboardArbiterClientInputDestination

void __74___UIKeyboardArbiterClientInputDestination_startConnectionWithCompletion___block_invoke(uint64_t a1, uint64_t a2, char a3, char a4)
{
  void *v7;
  _QWORD v8[4];
  id v9;
  char v10;
  char v11;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74___UIKeyboardArbiterClientInputDestination_startConnectionWithCompletion___block_invoke_2;
  v8[3] = &unk_1E16C52C0;
  v10 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v11 = a4;
  objc_msgSend(v7, "performAsync:", v8);

  objc_destroyWeak(&v9);
}

void __74___UIKeyboardArbiterClientInputDestination_startConnectionWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "pendingKeyboardGrabs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    if (*(_BYTE *)(a1 + 41))
    {
      v5 = objc_loadWeakRetained(v2);
      objc_msgSend(v5, "setDisableBecomeFirstResponder:", 1);

    }
  }
}

void __67___UIKeyboardArbiterClientInputDestination_currentBundleIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7AE30;
  qword_1ECD7AE30 = v0;

}

uint64_t __55___UIKeyboardArbiterClientInputDestination_willResume___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "shouldSnapshot"))
    objc_msgSend(*(id *)(a1 + 32), "reloadForSnapshotting");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("notification: "), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    v6 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v7 = objc_msgSend(v2, "wantsToShowKeyboard");
    KeyboardArbiterClientLog_3();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315394;
      v12 = v6;
      v13 = 1024;
      v14 = v7;
      _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination resumeConnectionForReason:]  Performing resume required scene update for reason: %s; wantsKeyboard: %d",
        (uint8_t *)&v11,
        0x12u);
    }

    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](v2, v9, 1);
    objc_msgSend(v2, "startConnection");

  }
  if (objc_msgSend(*(id *)(a1 + 32), "wantsToShowKeyboard")
    && (objc_msgSend(*(id *)(a1 + 32), "isHostedInAnotherProcess") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setWindowEnabled:", objc_msgSend(*(id *)(a1 + 32), "allowedToShowKeyboard"));
  }
  objc_msgSend(*(id *)(a1 + 32), "setEnqueuedWillEnterForegroundActions:", 0);
  result = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
  if ((_DWORD)result)
    return +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_200_4);
  return result;
}

uint64_t __55___UIKeyboardArbiterClientInputDestination_willResume___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "keyboardUIDidChange");
}

uint64_t __55___UIKeyboardArbiterClientInputDestination_didSuspend___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "keyboardUIDidChange");
}

uint64_t __76___UIKeyboardArbiterClientInputDestination_setSuppressingKeyboard_forScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSuppressingKeyboard:forScene:", 0, 0);
}

uint64_t __76___UIKeyboardArbiterClientInputDestination_setSuppressingKeyboard_forScene___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeactivatedKeyboard:forScene:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __120___UIKeyboardArbiterClientInputDestination_inputDestinationDidChange_withIAVHeight_isIAVRelevant_notifyRemote_forScene___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __120___UIKeyboardArbiterClientInputDestination_inputDestinationDidChange_withIAVHeight_isIAVRelevant_notifyRemote_forScene___block_invoke_2;
  v3[3] = &unk_1E16B1500;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "performAsync:", v3);

  objc_destroyWeak(&v5);
}

void __120___UIKeyboardArbiterClientInputDestination_inputDestinationDidChange_withIAVHeight_isIAVRelevant_notifyRemote_forScene___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pendingKeyboardGrabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

}

uint64_t __120___UIKeyboardArbiterClientInputDestination_inputDestinationDidChange_withIAVHeight_isIAVRelevant_notifyRemote_forScene___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_clearPreservedInputViewsWithId:clearKeyboard:", 0x1E171C5E0, 0);
}

void __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v3 = (void *)objc_opt_class();
  objc_msgSend(v10, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "ignoresPinning"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v5);

    if ((objc_msgSend(v10, "ignoresPinning") & 1) == 0)
      objc_msgSend(v10, "setIgnoresPinning:", 1);
    objc_msgSend(*(id *)(a1 + 48), "sourceSceneIdentityString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v5);

    if (v9)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

uint64_t __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDontDismissReachability:", 1);
}

void __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  dispatch_time_t v19;
  dispatch_time_t v20;
  void *v21;
  _QWORD v22[5];
  _QWORD block[4];
  id v24;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "sourceSceneIdentityString");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(*(id *)(a1 + 40), "sourceSceneIdentityString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", v6))
    {

      goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 40), "sourceDisplayIdentifier");
    v21 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_nameForDisplayType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "isEqualToString:", v14);

    v6 = v21;
    if (!v15)
      goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 40), "hostBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _UIMainBundleIdentifier();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToString:", v17);

  if ((objc_msgSend(*(id *)(a1 + 40), "keyboardOnScreen") & 1) != 0 || !v18)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "keyboardOnScreen") & v18) == 1)
    {
      v20 = dispatch_time(0, 300000000);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_5;
      v22[3] = &unk_1E16B1B28;
      v22[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v20, MEMORY[0x1E0C80D38], v22);
    }
  }
  else
  {
    v19 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_4;
    block[3] = &unk_1E16B1B28;
    v24 = v3;
    dispatch_after(v19, MEMORY[0x1E0C80D38], block);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_11:

}

uint64_t __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceReloadInputViews");
}

uint64_t __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeMoveKeyboard");
}

uint64_t __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDontDismissReachability:", 0);
}

void __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_opt_class();
  objc_msgSend(v8, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) == 0)
      objc_msgSend(v8, "setIgnoresPinning:", 0);
  }

}

uint64_t __74___UIKeyboardArbiterClientInputDestination_applicationKeyWindowDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setKeyWindowCandidate:", 0);
}

uint64_t __65___UIKeyboardArbiterClientInputDestination_peekApplicationEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_clearEligibilityToRequestKeyboardFocusWithoutUserInteraction");
}

uint64_t __80___UIKeyboardArbiterClientInputDestination_queue_endInputSessionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteTextInputPartner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endInputSessionOnSwitchingApps");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __77___UIKeyboardArbiterClientInputDestination_queue_keyboardChanged_onComplete___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 208));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 200))
  {
    KeyboardArbiterClientLog_3();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138412290;
      v8 = v6;
      _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination queue_keyboardChanged:onComplete:]_block_invoke  releasing os transaction for client changed task on timeout for info: %@", (uint8_t *)&v7, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 200);
    *(_QWORD *)(v4 + 200) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 208));
}

void __77___UIKeyboardArbiterClientInputDestination_queue_keyboardChanged_onComplete___block_invoke_241(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  int v20;
  id v21;
  void *v22;
  char v23;
  uint64_t v24;
  id v25;
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sourceSceneIdentityString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "pendingKeyboardGrabs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v7)
    {
      v8 = v7;
      v2 = *(void **)v28;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(void **)v28 != v2)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
          objc_msgSend(*(id *)(a1 + 32), "sourceSceneIdentityString");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            objc_msgSend(v10, "sceneIdentityString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "sourceSceneIdentityString");
            v1 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqual:", v1);

            if ((v14 & 1) != 0)
            {
              v15 = 1;
              goto LABEL_17;
            }
          }
          ++v9;
        }
        while (v8 != v9);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v8)
          continue;
        break;
      }
    }
    v15 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "currentBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v16) & 1) != 0)
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "hostBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "currentBundleIdentifier");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v17, "isEqualToString:", v1);

    }
  }
LABEL_17:

  v18 = objc_msgSend((id)UIApp, "systemIsAnimatingApplicationLifecycleEvent");
  v19 = objc_loadWeakRetained((id *)(a1 + 56));
  if ((objc_msgSend(v19, "deactivatedByControlCenter") & 1) != 0)
    goto LABEL_21;
  v20 = objc_msgSend((id)UIApp, "_isSpringBoard");
  if (v20)
  {
    v1 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v1, "pendingKeyboardGrabs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count"))
    {

LABEL_21:
      goto LABEL_26;
    }
  }
  v26 = v15;
  v21 = objc_loadWeakRetained((id *)(a1 + 56));
  +[_UIKeyboardArbiterClientInputDestination currentBundleIdentifier](_UIKeyboardArbiterClientInputDestination, "currentBundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "isSpotlight:", v22);

  if (v20)
  {

  }
  if ((v23 & 1) == 0 && (v18 & 1) == 0)
  {
    v25 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v25, "_handleKeyboardChanged:isLocal:onComplete:", *(_QWORD *)(a1 + 32), v26, *(_QWORD *)(a1 + 48));

    return;
  }
LABEL_26:
  v24 = *(_QWORD *)(a1 + 48);
  if (v24)
    (*(void (**)(void))(v24 + 16))();
}

uint64_t __75___UIKeyboardArbiterClientInputDestination_handleKeyboardUITrackingChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTrackingElementsForSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __75___UIKeyboardArbiterClientInputDestination_handleKeyboardUITrackingChange___block_invoke_2(double *a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  _BOOL4 v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat x;
  double y;
  double width;
  double height;
  double MaxY;
  double v35;
  double v36;
  void *v37;
  double MinX;
  double v39;
  void *v40;
  id v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v41 = a2;
  if (objc_msgSend(v41, "isTrackingKeyboard"))
  {
    objc_msgSend(v41, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v3, objc_msgSend(v41, "_isHostedInAnotherProcess"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "convertRect:fromWindow:", v4, a1[4], a1[5], a1[6], a1[7]);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "actualSceneFrame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v41, "bounds");
    v22 = v18 == v21;
    v24 = v20 == v23;
    v25 = 0.0;
    if (v22 && v24)
      v26 = v16;
    else
      v26 = 0.0;
    v27 = v8 - v26;
    if (v22 && v24)
      v28 = v14;
    else
      v28 = 0.0;
    v29 = v6 - v28;
    objc_msgSend(v41, "frame");
    v48.origin.x = v29;
    v48.origin.y = v27;
    v48.size.width = v10;
    v48.size.height = v12;
    v43 = CGRectIntersection(v42, v48);
    x = v43.origin.x;
    y = v43.origin.y;
    width = v43.size.width;
    height = v43.size.height;
    if (CGRectIsEmpty(v43))
    {
      objc_msgSend(v41, "frame");
      MaxY = CGRectGetMaxY(v44);
      objc_msgSend(v41, "insetForDismissedKeyboardGuide");
      y = MaxY - v35;
      objc_msgSend(v41, "insetForDismissedKeyboardGuide");
      height = v36;
      width = v18;
    }
    else
    {
      v25 = x;
    }
    objc_msgSend(v41, "_primaryKeyboardTrackingGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v45.origin.x = v25;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    MinX = CGRectGetMinX(v45);
    objc_msgSend(v41, "frame");
    v39 = CGRectGetMaxY(v46);
    v47.origin.x = v25;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    objc_msgSend(v37, "changeOffsetConstants:", MinX, v39 - CGRectGetMaxY(v47));

    objc_msgSend(v41, "_primaryKeyboardTrackingGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "changeSizingConstants:", width, height);

  }
}

void __70___UIKeyboardArbiterClientInputDestination_handleKeyboardUIDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double x;
  double y;
  double width;
  double height;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  const __CFString *v52;
  void *v53;
  __CFString *v54;
  const __CFString *v55;
  NSObject *v56;
  char v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  uint64_t v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  NSObject *v70;
  int v71;
  id v72;
  char v73;
  int v74;
  const __CFString *v75;
  void *v76;
  __CFString *v77;
  int v78;
  void *v79;
  char v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  NSObject *v89;
  __CFString *v90;
  int v91;
  const __CFString *v92;
  const __CFString *v93;
  id v94;
  void (**v95)(_QWORD);
  void *v96;
  char v97;
  void *v98;
  int v99;
  uint64_t v100;
  _QWORD aBlock[4];
  id v102;
  char v103;
  const __CFString *v104;
  uint8_t buf[4];
  const __CFString *v106;
  __int16 v107;
  const __CFString *v108;
  __int16 v109;
  const __CFString *v110;
  uint64_t v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v111 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasValidNotification"))
  {
    objc_msgSend(*(id *)(a1 + 32), "notificationInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "shouldSendInClient") & 1) == 0)
    {
      objc_msgSend(v3, "existingContainerRootController");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        objc_msgSend(v3, "existingContainerRootController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isRotating");

        if ((v8 & 1) == 0)
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = objc_msgSend(*(id *)(a1 + 32), "isStartNotification");
          v11 = CFSTR("is end");
          if (v10)
            v11 = CFSTR("is start");
          objc_msgSend(v9, "stringWithFormat:", CFSTR("handleKeyboardUIDidChange: notification from keyboard %@"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addKeyboardNotificationDebuggingInfo:", v12);

          objc_msgSend(v3, "existingContainerRootController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "inputViewSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "inputAccessoryView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            objc_msgSend(v3, "containerWindow");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "_isHostedInAnotherProcess");

            if (v17)
            {
              objc_msgSend(v3, "containerWindow");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "hostedViewReference");
              v20 = v19;
              v22 = v21;
              v24 = v23;
              v26 = v25;

              objc_msgSend(v4, "beginFrame");
              v117.origin.x = v20;
              v117.origin.y = v22;
              v117.size.width = v24;
              v117.size.height = v26;
              v113 = CGRectIntersection(v112, v117);
              x = v113.origin.x;
              y = v113.origin.y;
              width = v113.size.width;
              height = v113.size.height;
              if (!CGRectIsEmpty(v113))
                objc_msgSend(v4, "populateStartInfoWithFrame:", x - v20, y - v22, width, height);
              objc_msgSend(v4, "endFrame");
              v118.origin.x = v20;
              v118.origin.y = v22;
              v118.size.width = v24;
              v118.size.height = v26;
              v115 = CGRectIntersection(v114, v118);
              v31 = v115.origin.x;
              v32 = v115.origin.y;
              v33 = v115.size.width;
              v34 = v115.size.height;
              if (!CGRectIsEmpty(v115))
                objc_msgSend(v4, "populateEndInfoWithFrame:", v31 - v20, v32 - v22, v33, v34);
              objc_msgSend(v4, "addKeyboardNotificationDebuggingInfo:", CFSTR(" is hosted"));
            }
            objc_msgSend(v4, "setShouldSendInClient:", 1);
            objc_msgSend(v4, "duration");
            if (v35 > 0.0)
            {
              objc_msgSend(*(id *)(a1 + 32), "animationFence");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "isUsable");

              if (v37)
              {
                objc_msgSend(v3, "scene");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "animationFence");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "_synchronizeDrawingWithFence:", v39);

              }
            }
            v40 = objc_msgSend(*(id *)(a1 + 32), "isStartNotification");
            objc_msgSend(v3, "existingContainerRootController");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v4, "type");
            if (v40)
              objc_msgSend(v41, "postStartNotifications:withInfo:", v42, v4);
            else
              objc_msgSend(v41, "postEndNotifications:withInfo:", v42, v4);

          }
        }
      }
    }

    goto LABEL_90;
  }
  if (objc_msgSend(v3, "isOnScreen")
    && (objc_msgSend(v3, "responder"), v43 = (void *)objc_claimAutoreleasedReturnValue(), v43, v43))
  {
    objc_msgSend(v3, "scene");
    v44 = objc_claimAutoreleasedReturnValue();
    -[NSObject keyboardSceneDelegate](v44, "keyboardSceneDelegate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "responder");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "_window");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47 && (objc_msgSend(v47, "_requiresKeyboardPresentationFence") & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "nextAnimationStyle");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "canTakeSnapshot");

      if (v50)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }

  }
  else
  {
    KeyboardArbiterClientLog_3();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v51 = objc_msgSend(v3, "isOnScreen");
      v52 = CFSTR(" not");
      if (v51)
        v52 = &stru_1E16EDF20;
      *(_DWORD *)buf = 138412290;
      v106 = v52;
      _os_log_impl(&dword_185066000, v44, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination handleKeyboardUIDidChange:]_block_invoke  Keyboard destination responder is%@ on screen", buf, 0xCu);
    }
  }

  v104 = 0;
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (__CFString *)CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
  LODWORD(v55) = (_DWORD)v54 != 0;

  if ((_DWORD)v54)
  {
    +[UIApplication displayIdentifier](UIApplication, "displayIdentifier");
    v56 = objc_claimAutoreleasedReturnValue();
    v54 = (__CFString *)-[NSObject isEqualToString:](v56, "isEqualToString:", v104);

    if (!(_DWORD)v54)
    {
      LODWORD(v55) = 0;
      goto LABEL_41;
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "keyboardOnScreen"))
    {
      LODWORD(v55) = 1;
      goto LABEL_41;
    }
    objc_msgSend(v3, "containerRootController");
    v56 = objc_claimAutoreleasedReturnValue();
    -[NSObject clearKeyboardSnapshot](v56, "clearKeyboardSnapshot");
  }
  else
  {
    KeyboardArbiterClientLog_3();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v106 = v104;
      v107 = 2112;
      v108 = v54;
      _os_log_impl(&dword_185066000, v56, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination handleKeyboardUIDidChange:]_block_invoke  Unexpected bundleIdentifier: %@ for applicationIdentifier: %@", buf, 0x16u);

    }
  }

LABEL_41:
  v57 = objc_msgSend(*(id *)(a1 + 32), "keyboardOnScreen");
  if ((v57 & 1) == 0)
  {
    objc_msgSend(v3, "containerRootController");
    v56 = objc_claimAutoreleasedReturnValue();
    -[NSObject placement](v56, "placement");
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString showsInputOrAssistantViews](v54, "showsInputOrAssistantViews"))
    {
      v58 = 0;
      goto LABEL_49;
    }
  }
  if ((_DWORD)v55)
  {
    v58 = objc_msgSend(*(id *)(a1 + 40), "disableBecomeFirstResponder") ^ 1;
    if ((v57 & 1) != 0)
      goto LABEL_50;
LABEL_49:

    goto LABEL_50;
  }
  v58 = 1;
  if ((v57 & 1) == 0)
    goto LABEL_49;
LABEL_50:
  objc_msgSend(v3, "containerRootController");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "inputViewSet");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "inputAccessoryView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v62 = 1;
  }
  else
  {
    objc_msgSend(v3, "containerRootController");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "placement");
    v64 = a1;
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v65, "accessoryViewWillAppear");

    a1 = v64;
  }

  v66 = objc_msgSend(*(id *)(a1 + 32), "keyboardOnScreen");
  objc_msgSend(v3, "containerRootController");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "placement");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "showsInputOrAssistantViews");

  KeyboardArbiterClientLog_3();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    v99 = v69;
    v71 = v66;
    v72 = v3;
    v73 = (char)v55;
    if (v58)
      v55 = &stru_1E16EDF20;
    else
      v55 = CFSTR("not ");
    v74 = v62;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v75 = &stru_1E16EDF20;
    else
      v75 = CFSTR("not ");
    objc_msgSend(*(id *)(a1 + 40), "currentUIState");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "animationFence");
    v100 = a1;
    v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v106 = v55;
    LOBYTE(v55) = v73;
    v3 = v72;
    v66 = v71;
    v69 = v99;
    v107 = 2112;
    v108 = v75;
    v62 = v74;
    v109 = 2112;
    v110 = v77;
    _os_log_impl(&dword_185066000, v70, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination handleKeyboardUIDidChange:]_block_invoke  Keyboard destination should %@update UI and should %@skip fencing: %@", buf, 0x20u);

    a1 = v100;
  }

  objc_msgSend(v3, "cleanUpWaitingForInputUI");
  if (v58)
  {
    if (v62)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v78 = v66 ^ v69;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(v3, "containerRootController");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "isRotating");

      if ((v80 & 1) == 0)
      {
        objc_msgSend(v3, "scene");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "currentUIState");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "animationFence");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "_synchronizeDrawingWithFence:", v83);

      }
    }
    if ((v55 & 1) != 0)
      goto LABEL_75;
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v84 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v84, "isEqualToString:", CFSTR("com.apple.Spotlight"))
      && objc_msgSend(*(id *)(a1 + 32), "keyboardOnScreen")
      && objc_msgSend(v3, "showingKeyboard"))
    {
      objc_msgSend(v3, "scene");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "activationState");

      if (v86)
      {
LABEL_75:
        KeyboardArbiterClientLog_3();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "keyboardPosition");
          NSStringFromCGRect(v116);
          v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(*(id *)(a1 + 32), "animated");
          v92 = CFSTR("unanimated");
          if (v91)
            v92 = CFSTR("animated");
          *(_DWORD *)buf = 138412802;
          v106 = v90;
          v107 = 2112;
          v108 = v92;
          if (v78)
            v93 = CFSTR("keyboardUIDidChange");
          else
            v93 = CFSTR("updateSizingFromRemoteChange");
          v109 = 2112;
          v110 = v93;
          _os_log_impl(&dword_185066000, v89, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination handleKeyboardUIDidChange:]_block_invoke  Keyboard destination updating keyboardPosition %@ for %@ transition using %@", buf, 0x20u);

        }
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __70___UIKeyboardArbiterClientInputDestination_handleKeyboardUIDidChange___block_invoke_271;
        aBlock[3] = &unk_1E16B1B78;
        v103 = v78 ^ 1;
        v94 = v3;
        v102 = v94;
        v95 = (void (**)(_QWORD))_Block_copy(aBlock);
        if (objc_msgSend(*(id *)(a1 + 32), "animated")
          && (objc_msgSend(v94, "containerRootController"),
              v96 = (void *)objc_claimAutoreleasedReturnValue(),
              v97 = objc_msgSend(v96, "isRotating"),
              v96,
              (v97 & 1) == 0))
        {
          v95[2](v95);
        }
        else
        {
          +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "pushAnimationStyle:", v98);

          v95[2](v95);
          objc_msgSend(v94, "popAnimationStyle");
        }

        goto LABEL_90;
      }
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "responder");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "resignFirstResponder");

      KeyboardArbiterClientLog_3();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v84, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination handleKeyboardUIDidChange:]_block_invoke  ResignFirstResponder, due to Spotlight grab InputUI in background", buf, 2u);
      }
    }

    goto LABEL_75;
  }
LABEL_90:

}

void __70___UIKeyboardArbiterClientInputDestination_handleKeyboardUIDidChange___block_invoke_271(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  if (*(_BYTE *)(a1 + 40)
    && (objc_msgSend(*(id *)(a1 + 32), "containerRootController"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isRotating"),
        v2,
        (v3 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "containerRootController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateSizingFromRemoteChange");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "keyboardUIDidChange");
  }
}

uint64_t __81___UIKeyboardArbiterClientInputDestination_queue_keyboardUIDidChange_onComplete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keyboardUIDidChange:onComplete:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __84___UIKeyboardArbiterClientInputDestination_queue_activeProcessResignWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentInputDestination:", 1);
  objc_msgSend(*(id *)(a1 + 32), "didBecomeActive:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __85___UIKeyboardArbiterClientInputDestination_queue_setKeyboardDisabled_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:", *(unsigned __int8 *)(a1 + 48), 0, 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __84___UIKeyboardArbiterClientInputDestination_queue_sceneBecameFocused_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  KeyboardArbiterClientLog_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "stringRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v19;
    _os_log_debug_impl(&dword_185066000, v2, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination queue_sceneBecameFocused:withCompletion:]_block_invoke  Scene became focused: %@", buf, 0xCu);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v7, "_FBSScene", (_QWORD)v21);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identityToken");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = BSEqualObjects();

          if (v10)
          {
            v4 = v7;
            goto LABEL_14;
          }
        }
        v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_14:

    objc_msgSend(v4, "keyWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_msgSend(v4, "_isTargetOfKeyboardEventDeferringEnvironment") & 1) == 0)
    {
      KeyboardArbiterClientLog_3();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "stringRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v26 = v11;
        v27 = 2112;
        v28 = v20;
        _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination queue_sceneBecameFocused:withCompletion:]_block_invoke  Performing required scene update because it was focused in the arbiter: %p; scene: %@",
          buf,
          0x16u);

      }
      -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](*(void **)(a1 + 40), v11, 65537);
    }

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "focusedSceneIdentityStringOrIdentifier", (_QWORD)v21);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v4)
  {
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "stringRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = BSEqualStrings();

      if ((v16 & 1) == 0)
      {
        KeyboardArbiterClientLog_3();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_185066000, v17, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination queue_sceneBecameFocused:withCompletion:]_block_invoke  Setting focused scene identity or identifier to nil because a scene from another application was focused", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "setFocusedSceneIdentityStringOrIdentifier:", 0);
      }
    }
  }
  v18 = *(_QWORD *)(a1 + 48);
  if (v18)
    (*(void (**)(void))(v18 + 16))();

}

@end
