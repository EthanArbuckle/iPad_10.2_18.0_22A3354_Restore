@implementation UIRemoteKeyboards

void __44___UIRemoteKeyboards_applicationWillResume___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _UIMainBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "reloadForSnapshotting");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("notification: "), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    v8 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    objc_msgSend(v4, "keyboardWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "wantsToShowKeyboardForWindow:", v9);

    v11 = _resumeConnectionForReason____s_category;
    if (!_resumeConnectionForReason____s_category)
    {
      v11 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&_resumeConnectionForReason____s_category);
    }
    if ((*(_BYTE *)v11 & 1) != 0)
    {
      v20 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = 136315650;
        v22 = "-[_UIRemoteKeyboards _resumeConnectionForReason:]";
        v23 = 2080;
        v24 = v8;
        v25 = 1024;
        v26 = v10;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "%s: Performing resume required scene update for reason: %s; wantsKeyboard: %d",
          (uint8_t *)&v21,
          0x1Cu);
      }
    }
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](v4, v12, 1);
    objc_msgSend(v4, "startConnection");

  }
  objc_msgSend(*(id *)(a1 + 32), "resetSnapshotWithWindowCheck:", 0);
  v13 = *(void **)(a1 + 32);
  objc_msgSend(v13, "keyboardWindow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v13, "wantsToShowKeyboardForWindow:", v14);

  if ((_DWORD)v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "keyboardWindow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "windowLevel");
    objc_msgSend(v15, "setWindowLevel:", v17 + 1.0);

    objc_msgSend(*(id *)(a1 + 32), "keyboardWindow");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = objc_msgSend(v18, "_isHostedInAnotherProcess");

    if ((_DWORD)v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "keyboardWindow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHidden:", 0);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setWindowEnabled:", objc_msgSend(*(id *)(a1 + 32), "allowedToShowKeyboard"));
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 83) = 0;
}

uint64_t __43___UIRemoteKeyboards_peekApplicationEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_clearEligibilityToRequestKeyboardFocusWithoutUserInteraction");
}

uint64_t __52___UIRemoteKeyboards_applicationKeyWindowDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setKeyWindowCandidate:", 0);
}

void __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identityToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "_sceneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) == 0)
      objc_msgSend(v10, "setIgnoresPinning:", 0);
  }

}

void __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identityToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "_sceneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "ignoresPinning"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v7);

    if ((objc_msgSend(v12, "ignoresPinning") & 1) == 0)
      objc_msgSend(v12, "setIgnoresPinning:", 1);
    objc_msgSend(*(id *)(a1 + 40), "sourceSceneIdentityString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v7);

    if (v11)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  dispatch_time_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  int v29;
  void *v30;
  _QWORD block[5];
  id v32;

  v3 = a2;
  objc_msgSend(v3, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "identityToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "_sceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(*(id *)(a1 + 32), "sourceSceneIdentityString");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(*(id *)(a1 + 32), "sourceSceneIdentityString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", v8))
    {

      goto LABEL_26;
    }
    objc_msgSend(*(id *)(a1 + 32), "sourceDisplayIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(*(id *)(a1 + 32), "sourceDisplayIdentifier");
      v30 = v8;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scene");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "screen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "displayConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_nameForDisplayType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v14, "isEqualToString:", v18);

      v8 = v30;
      if (!v29)
        goto LABEL_26;
    }
    else
    {

    }
  }
  v19 = objc_msgSend(*(id *)(a1 + 32), "hostProcessIdentifier");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 216) = v19 == getpid();
  if ((objc_msgSend(*(id *)(a1 + 32), "keyboardOnScreen") & 1) != 0 || !*(_BYTE *)(*(_QWORD *)(a1 + 40) + 216))
  {
    objc_msgSend(*(id *)(a1 + 32), "keyboardPreserveKey");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21
      && (v22 = (void *)v21, v23 = objc_msgSend(*(id *)(a1 + 32), "shouldRestoreKeyboard"), v22, v23))
    {
      objc_msgSend(*(id *)(a1 + 32), "keyboardPreserveKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_restoreInputViewsWithId:animated:", v24, 1);

    }
    else if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      if (!_UIApplicationIsFirstPartyStickers()
        || (+[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v25, "window"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v26,
            v25,
            !v26))
      {
        _UIMainBundleIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.siri")))
        {
          v28 = objc_msgSend(*(id *)(a1 + 32), "keyboardOnScreen");

          if ((v28 & 1) == 0)
            objc_msgSend(v3, "updateLightEffectsBackdropAnimated:", 1);
        }
        else
        {

        }
        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 216) = 1;
        objc_msgSend(v3, "forceReloadInputViews");
        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 216) = 0;
      }
    }
  }
  else
  {
    v20 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_8;
    block[3] = &unk_1E16B1B50;
    block[4] = *(_QWORD *)(a1 + 40);
    v32 = v3;
    dispatch_after(v20, MEMORY[0x1E0C80D38], block);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 216) = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_26:

}

uint64_t __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDontDismissReachability:", 0);
}

uint64_t __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDontDismissReachability:", 1);
}

uint64_t __40___UIRemoteKeyboards_isOnScreenRotating__block_invoke(uint64_t result, void *a2)
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

void __43___UIRemoteKeyboards_reloadForSnapshotting__block_invoke(uint64_t a1, void *a2)
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
  if (objc_msgSend(v2, "isSnapshotting"))
  {
    +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pushAnimationStyle:", v3);

    objc_msgSend(v4, "forceReloadInputViews");
    objc_msgSend(v4, "popAnimationStyle");
  }

}

uint64_t __96___UIRemoteKeyboards_prepareToMoveKeyboard_withIAV_isIAVRelevant_showing_notifyRemote_forScene___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_clearPreservedInputViewsWithId:clearKeyboard:", CFSTR("remote-keyboards"), 0);
}

uint64_t __37___UIRemoteKeyboards_startConnection__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEventSource:options:", *(_QWORD *)(a1 + 40), 1);
}

void __33___UIRemoteKeyboards_serviceName__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D017A8], "environmentAliases");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveMachService:", CFSTR("com.apple.UIKit.KeyboardManagement.hosted"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)qword_1ECD7A2F0;
  qword_1ECD7A2F0 = v1;

}

void __43___UIRemoteKeyboards_sharedRemoteKeyboards__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD7A2E0;
  qword_1ECD7A2E0 = v0;

}

void __96___UIRemoteKeyboards_prepareToMoveKeyboard_withIAV_isIAVRelevant_showing_notifyRemote_forScene___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __96___UIRemoteKeyboards_prepareToMoveKeyboard_withIAV_isIAVRelevant_showing_notifyRemote_forScene___block_invoke_2;
  v4[3] = &unk_1E16B1B50;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "performAsync:", v4);

}

void __37___UIRemoteKeyboards_startConnection__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5)
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  char v16;
  _QWORD block[6];

  v8 = a2;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37___UIRemoteKeyboards_startConnection__block_invoke_4;
  block[3] = &unk_1E16B1888;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = a4;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __37___UIRemoteKeyboards_startConnection__block_invoke_5;
  v13[3] = &unk_1E16C07C8;
  v11 = *(_QWORD *)(a1 + 32);
  v16 = a5;
  v13[4] = v11;
  v14 = v8;
  v15 = a4;
  v12 = v8;
  objc_msgSend(v10, "performAsync:", v13);

}

uint64_t __96___UIRemoteKeyboards_prepareToMoveKeyboard_withIAV_isIAVRelevant_showing_notifyRemote_forScene___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __50___UIRemoteKeyboards_controllerDidLayoutSubviews___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  BOOL v29;
  _BYTE *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  uint64_t v44;
  int v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  double v53;
  double v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "focusedSceneIdentityStringOrIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "keyboardWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "keyboardWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "inputViewSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "normalizePlaceholders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "placementIgnoringRotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteIntrinsicContentSizeForInputViewInSet:includingIAV:", v7, 0);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    objc_msgSend(v5, "placementIgnoringRotation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "remoteIntrinsicContentSizeForInputViewInSet:includingIAV:", v7, 1);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    objc_msgSend(*(id *)(a1 + 32), "currentState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "keyboardPosition");
    v29 = v14 == v28 && v16 == v27;
    if (v29)
    {
      objc_msgSend(*(id *)(a1 + 32), "currentState");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "keyboardPositionWithIAV");
      v53 = v32;
      v54 = v21;
      v33 = v19;
      v34 = v12;
      v35 = v10;
      v37 = v36;

      v29 = v23 == v37;
      v10 = v35;
      v12 = v34;
      v19 = v33;
      v21 = v54;
      if (v29 && v25 == v53)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {

    }
    if (v2)
    {
      v30 = *(_BYTE **)(a1 + 32);
      if (v30[215])
        v2 = 0;
      else
        v2 = (void *)objc_msgSend(v30, "allowedToEnableKeyboardWindow");
    }
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate", *(_QWORD *)&v53);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *(void **)(a1 + 32);
    objc_msgSend(v38, "inputViews");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isInputAccessoryViewPlaceholder") ^ 1;
    objc_msgSend(v38, "scene");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "prepareToMoveKeyboard:withIAV:isIAVRelevant:showing:notifyRemote:forScene:", v41, 1, v2, v42, v10, v12, v14, v16, v19, v21, v23, v25);

    goto LABEL_16;
  }
LABEL_17:
  v43 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count", *(_QWORD *)&v53);
  v44 = *(_QWORD *)(a1 + 32);
  v45 = *(_DWORD *)(v44 + 104);
  if (v45 >= v43 * v43)
  {
    NSLog(CFSTR("Warning - input views recursively changing sizes - aborting"));
  }
  else
  {
    *(_DWORD *)(v44 + 104) = v45 + 1;
    v46 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v47 = v46;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v56 != v50)
            objc_enumerationMutation(v47);
          v52 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          if (v52 != *(void **)(a1 + 40))
            objc_msgSend(v52, "checkPlaceholdersForRemoteKeyboards");
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      }
      while (v49);
    }

    --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 104);
  }
}

void __55___UIRemoteKeyboards_queue_getDebugInfoWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_class *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  objc_class *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  objc_class *v34;
  id v35;
  objc_class *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  objc_class *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  objc_class *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  objc_class *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  objc_class *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  objc_class *v65;
  id v66;
  objc_class *v67;
  id v68;
  objc_class *v69;
  id v70;
  objc_class *v71;
  id v72;
  objc_class *v73;
  id v74;
  objc_class *v75;
  id v76;
  objc_class *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  objc_class *v83;
  id v84;
  objc_class *v85;
  id v86;
  void *v87;
  void *v88;
  const __CFString *v89;
  id *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  const __CFString *v105;
  const __CFString *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  objc_class *v110;
  id v111;
  void *v112;
  void *v113;
  objc_class *v114;
  id v115;
  void *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  objc_class *v120;
  id v121;
  uint64_t v122;
  objc_class *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  int v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id *v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;

  objc_msgSend((id)UIApp, "keyWindow");
  v140 = (id *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "responder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _fbsScene](v140);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v140, "_firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "inputViews");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("keyboardResponder"));

    }
  }
  objc_msgSend(v2, "inputView");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v2, "inputView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("keyboardResponder.inputView"));

    }
  }
  objc_msgSend(v2, "inputViewController");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v2, "inputViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v7, "setObject:forKey:", v19, CFSTR("keyboardResponder.inputViewController"));

    }
  }
  objc_msgSend(v2, "inputAccessoryView");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    objc_msgSend(v2, "inputAccessoryView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v7, "setObject:forKey:", v24, CFSTR("keyboardResponder.inputAccessoryView"));

    }
  }
  objc_msgSend(v2, "inputAccessoryViewController");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    objc_msgSend(v2, "inputAccessoryViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v7, "setObject:forKey:", v29, CFSTR("keyboardResponder.inputAccessoryViewController"));

    }
  }
  if (objc_msgSend(v2, "_disableAutomaticKeyboardBehavior"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v30, CFSTR("keyboardResponderDisableKeyboardBehaviour"));

  }
  if (objc_msgSend(v2, "_disableAutomaticKeyboardUI"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v31, CFSTR("keyboardResponderDisableKeyboardUI"));

  }
  v32 = objc_msgSend(v2, "_requiresKeyboardWhenFirstResponder");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v33, CFSTR("keyboardResponderRequiresKeyboard"));

  }
  if (v140)
  {
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (id)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v7, "setObject:forKey:", v35, CFSTR("keyWindow"));

    }
  }
  if (v5)
  {
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (id)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v7, "setObject:forKey:", v37, CFSTR("keyWindowFirstResponder"));

    }
  }
  objc_msgSend(v5, "inputView");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    objc_msgSend(v5, "inputView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (id)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v7, "setObject:forKey:", v42, CFSTR("keyWindowFirstResponder.inputView"));

    }
  }
  objc_msgSend(v5, "inputViewController");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    objc_msgSend(v5, "inputViewController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v47 = (id)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend(v7, "setObject:forKey:", v47, CFSTR("keyWindowFirstResponder.inputViewController"));

    }
  }
  objc_msgSend(v5, "inputAccessoryView");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    objc_msgSend(v5, "inputAccessoryView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    v52 = (id)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v7, "setObject:forKey:", v52, CFSTR("keyWindowFirstResponder.inputAccessoryView"));

    }
  }
  objc_msgSend(v5, "inputAccessoryViewController");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    objc_msgSend(v5, "inputAccessoryViewController");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (objc_class *)objc_opt_class();
    NSStringFromClass(v56);
    v57 = (id)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v7, "setObject:forKey:", v57, CFSTR("keyWindowFirstResponder.inputAccessoryViewController"));

    }
  }
  if (objc_msgSend(v5, "_disableAutomaticKeyboardBehavior"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v58, CFSTR("keyWindowFirstResponderDisableKeyboardBehaviour"));

  }
  if (objc_msgSend(v5, "_disableAutomaticKeyboardUI"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v59, CFSTR("keyWindowFirstResponderDisableKeyboardUI"));

  }
  v60 = objc_msgSend(v5, "_requiresKeyboardWhenFirstResponder");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v61, CFSTR("keyWindowFirstResponderRequiresKeyboard"));

  }
  objc_msgSend(v6, "keyboard");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    objc_msgSend(v6, "keyboard");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (objc_class *)objc_opt_class();
    NSStringFromClass(v65);
    v66 = (id)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      objc_msgSend(v7, "setObject:forKey:", v66, CFSTR("inputViews.keyboard"));

    }
  }
  if (v6)
  {
    if (v6[7])
    {
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      v68 = (id)objc_claimAutoreleasedReturnValue();

      if (v68)
        objc_msgSend(v7, "setObject:forKey:", v68, CFSTR("inputViews ? inputViews->_inputView : nil"));

    }
    if (v6[10])
    {
      v69 = (objc_class *)objc_opt_class();
      NSStringFromClass(v69);
      v70 = (id)objc_claimAutoreleasedReturnValue();

      if (v70)
        objc_msgSend(v7, "setObject:forKey:", v70, CFSTR("inputViews ? inputViews->_inputViewController : nil"));

    }
    if (v6[8])
    {
      v71 = (objc_class *)objc_opt_class();
      NSStringFromClass(v71);
      v72 = (id)objc_claimAutoreleasedReturnValue();

      if (v72)
        objc_msgSend(v7, "setObject:forKey:", v72, CFSTR("inputViews ? inputViews->_inputAccessoryView : nil"));

    }
    if (v6[11])
    {
      v73 = (objc_class *)objc_opt_class();
      NSStringFromClass(v73);
      v74 = (id)objc_claimAutoreleasedReturnValue();

      if (v74)
        objc_msgSend(v7, "setObject:forKey:", v74, CFSTR("inputViews ? inputViews->_accessoryViewController : nil"));

    }
    if (v6[9])
    {
      v75 = (objc_class *)objc_opt_class();
      NSStringFromClass(v75);
      v76 = (id)objc_claimAutoreleasedReturnValue();

      if (v76)
        objc_msgSend(v7, "setObject:forKey:", v76, CFSTR("inputViews ? inputViews->_inputAssistantView : nil"));

    }
    if (v6[12])
    {
      v77 = (objc_class *)objc_opt_class();
      NSStringFromClass(v77);
      v78 = (id)objc_claimAutoreleasedReturnValue();

      if (v78)
      {
        objc_msgSend(v7, "setObject:forKey:", v78, CFSTR("inputViews ? inputViews->_assistantViewController : nil"));

      }
    }
  }
  v133 = v5;
  objc_msgSend(*(id *)(a1 + 32), "keyboardWindow");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "existingContainerWindow");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "rootViewController");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _windowForAutorotationBelowWindow:](v81, v80);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v81;
  -[UIViewController _primaryViewControllerForAutorotationBelowWindow:](v81, v80);
  v137 = v82;
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (objc_class *)objc_opt_class();
    NSStringFromClass(v83);
    v84 = (id)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      objc_msgSend(v7, "setObject:forKey:", v84, CFSTR("rotateWindow"));

    }
  }
  if (v138)
  {
    v85 = (objc_class *)objc_opt_class();
    NSStringFromClass(v85);
    v86 = (id)objc_claimAutoreleasedReturnValue();

    if (v86)
    {
      objc_msgSend(v7, "setObject:forKey:", v86, CFSTR("rotateVC"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)UIApp, "interfaceOrientation"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v87, CFSTR("UIApp.interfaceOrientation"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v138, "interfaceOrientation"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = CFSTR("rotateVC.interfaceOrientation");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)UIApp, "interfaceOrientation"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = CFSTR("UIApp.interfaceOrientation");
  }
  objc_msgSend(v7, "setObject:forKey:", v88, v89);

  v90 = v140;
  if (v140)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v140, "interfaceOrientation"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v91, CFSTR("keyWindow.interfaceOrientation"));

    v90 = v140;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "interfaceOrientation"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v92, CFSTR("keyWindowSceneSettings.interfaceOrientation"));

    v90 = v140;
  }
  if (v82)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v82, "interfaceOrientation"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v93, CFSTR("rotateWindow.interfaceOrientation"));

    v90 = v140;
  }
  if (v138)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v138, "supportedInterfaceOrientations"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v94, CFSTR("rotateVC.supportedInterfaceOrientations"));

    v90 = v140;
  }
  if (v79)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v79, "interfaceOrientation"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v95, CFSTR("keyboardWindow.interfaceOrientation"));

    objc_msgSend(v79, "frame");
    NSStringFromCGRect(v141);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v96, CFSTR("keyboardWindow.frame"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v79, "isHidden"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v97, CFSTR("keyboardWindow.isHidden"));

    v90 = v140;
  }
  if (v90)
  {
    objc_msgSend(v90, "frame");
    NSStringFromCGRect(v142);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v98, CFSTR("keyWindow.frame"));

  }
  if (v82)
  {
    objc_msgSend(v82, "frame");
    NSStringFromCGRect(v143);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v99, CFSTR("rotateWindow.frame"));

  }
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "_isKeyboardDeactivated");
  if ((_DWORD)v101)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v102, CFSTR("suppressionCount"));

  }
  v135 = v2;
  v136 = v80;
  if (objc_msgSend(*(id *)(a1 + 32), "disableBecomeFirstResponder"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v103, CFSTR("responderDisabled"));

  }
  v132 = v6;
  v104 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(v100, "automaticAppearanceEnabled"))
    v105 = CFSTR("YES");
  else
    v105 = CFSTR("NO");
  if (objc_msgSend(v100, "automaticAppearanceInternalEnabled"))
    v106 = CFSTR("YES");
  else
    v106 = CFSTR("NO");
  objc_msgSend(v104, "stringWithFormat:", CFSTR("en %@ / int %@"), v105, v106);
  v107 = objc_claimAutoreleasedReturnValue();
  if (v107)
    objc_msgSend(v7, "setObject:forKey:", v107, CFSTR("automaticAppearance"));
  v130 = (void *)v107;
  v134 = v4;
  objc_msgSend(v79, "rootViewController");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "placement");
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (v109)
  {
    v110 = (objc_class *)objc_opt_class();
    NSStringFromClass(v110);
    v111 = (id)objc_claimAutoreleasedReturnValue();

    if (v111)
    {
      objc_msgSend(v7, "setObject:forKey:", v111, CFSTR("placementKeyboard"));

    }
  }
  objc_msgSend(v80, "rootViewController");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "placement");
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  if (v113)
  {
    v114 = (objc_class *)objc_opt_class();
    NSStringFromClass(v114);
    v115 = (id)objc_claimAutoreleasedReturnValue();

    if (v115)
    {
      objc_msgSend(v7, "setObject:forKey:", v115, CFSTR("placementEffects"));

    }
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "_getCurrentKeyplaneName");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (v117)
    objc_msgSend(v7, "setObject:forKey:", v117, CFSTR("currentKeyboard"));
  v118 = objc_opt_class();
  v119 = objc_opt_class();
  if (v79)
  {
    if (v118 != v119)
    {
      v120 = (objc_class *)objc_opt_class();
      NSStringFromClass(v120);
      v121 = (id)objc_claimAutoreleasedReturnValue();

      if (v121)
      {
        objc_msgSend(v7, "setObject:forKey:", v121, CFSTR("keyboardWindow"));

      }
    }
  }
  v122 = objc_opt_class();
  if (v122 != objc_opt_class())
  {
    if (v80)
    {
      v123 = (objc_class *)objc_opt_class();
      NSStringFromClass(v123);
      v124 = (id)objc_claimAutoreleasedReturnValue();

      if (v124)
      {
        objc_msgSend(v7, "setObject:forKey:", v124, CFSTR("effectsWindow"));

      }
    }
  }
  v125 = v1;
  objc_msgSend(v1, "scene");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsHostingInfo hostingInfoForWindowScene:](UITextEffectsHostingInfo, "hostingInfoForWindowScene:", v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(v127, "useHostedInstance");

  if (v128)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v129, CFSTR("effectsHosting"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __58___UIRemoteKeyboards_queue_keyboardChangedWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "keyboardChangedCompleted");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __55___UIRemoteKeyboards_queue_keyboardChanged_onComplete___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (*v22)(void);
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sourceSceneIdentityString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 40) + 112);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v39 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "sourceSceneIdentityString");
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)v9;
            objc_msgSend(v8, "sceneIdentityString");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "sourceSceneIdentityString");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqual:", v12);

            if ((v13 & 1) != 0)
            {
              v14 = 1;
              goto LABEL_17;
            }
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v5)
          continue;
        break;
      }
    }
    v14 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceBundleIdentifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    _UIMainBundleIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v15) & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "hostBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _UIMainBundleIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v16, "isEqualToString:", v17);

    }
  }
LABEL_17:

  v18 = objc_msgSend((id)UIApp, "systemIsAnimatingApplicationLifecycleEvent");
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hardwareKeyboardExclusivityIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 81)
    || objc_msgSend((id)UIApp, "_isSpringBoard")
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "count"))
  {
    goto LABEL_18;
  }
  _UIMainBundleIdentifier();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.Spotlight"));
  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 32), "hostBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.Spotlight")) & 1) != 0)
    {
      v36 = v25;
    }
    else
    {
      if ((v20 == 0) != objc_msgSend(*(id *)(a1 + 32), "isOneness"))
      {

        goto LABEL_18;
      }
      v36 = v25;
    }
  }
  _UIMainBundleIdentifier();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.CoreAuthUI"));
  if (v27)
  {
    objc_msgSend(*(id *)(a1 + 32), "hostBundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.CoreAuthUI")))
    {
      v33 = 1;
      goto LABEL_41;
    }
    v37 = v28;
  }
  v29 = v14;
  _UIMainBundleIdentifier();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.siri")))
  {

    v33 = 0;
    v14 = v29;
    v28 = v37;
    if (v27)
      goto LABEL_41;
LABEL_37:

    if (v24)
      goto LABEL_42;
    goto LABEL_38;
  }
  objc_msgSend(*(id *)(a1 + 32), "hostBundleIdentifier");
  v31 = v23;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.siri")) ^ 1;

  v23 = v31;
  v14 = v29;
  v28 = v37;
  if ((v27 & 1) == 0)
    goto LABEL_37;
LABEL_41:

  if ((v24 & 1) == 0)
  {
LABEL_38:

    if (!v33)
      goto LABEL_43;
LABEL_18:
    v21 = *(_QWORD *)(a1 + 48);
    if (!v21)
      return;
    v22 = *(void (**)(void))(v21 + 16);
    goto LABEL_20;
  }
LABEL_42:

  if ((v33 & 1) != 0)
    goto LABEL_18;
LABEL_43:
  if (v18 && (objc_msgSend(*(id *)(a1 + 32), "keyboardPosition"), CGRectGetHeight(v44) != 0.0))
  {
    v35 = *(_QWORD *)(a1 + 48);
    if (v35)
    {
LABEL_49:
      v22 = *(void (**)(void))(v35 + 16);
LABEL_20:
      v22();
    }
  }
  else
  {
    v34 = objc_msgSend(*(id *)(a1 + 40), "didHandleKeyboardChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "shouldTakeSnapshot", v36), v14);
    v35 = *(_QWORD *)(a1 + 48);
    if (v35)
    {
      if (v34)
      {
        objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:");
        return;
      }
      goto LABEL_49;
    }
  }
}

uint64_t __37___UIRemoteKeyboards_startConnection__block_invoke_5(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeAllObjects");
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[64] || *(_BYTE *)(a1 + 56))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      objc_msgSend(v2, "didHandleKeyboardChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", v3, 0, 0);
  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend((id)UIApp, "_setDisableBecomeFirstResponder:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setDisableBecomeFirstResponder:", 1);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_updateEventSource:options:", *(_QWORD *)(a1 + 48), 19);
}

void __52___UIRemoteKeyboards_completeMoveKeyboardForWindow___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "signalKeyboardChangeComplete");

}

void __27___UIRemoteKeyboards_proxy__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s Failed to access remote service: %@"), "-[_UIRemoteKeyboards proxy]_block_invoke", a2);
}

uint64_t __62___UIRemoteKeyboards_queue_activeProcessResignWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "keyboardWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "applicationDidBecomeActive:forceSignalToProxy:", 0, 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __45___UIRemoteKeyboards_queue_failedConnection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 232);
  if (v2 == *(void **)(a1 + 40))
  {
    *(_QWORD *)(v1 + 232) = 0;

    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    v4 = *(void **)(a1 + 32);
    +[_UIKeyboardChangedInformation informationForKeyboardDown](_UIKeyboardChangedInformation, "informationForKeyboardDown");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didHandleKeyboardChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", v5, 0, 1);

    objc_msgSend(*(id *)(a1 + 32), "cleanSuppression");
    objc_msgSend(*(id *)(a1 + 32), "setDisableBecomeFirstResponder:", 0);
    v6 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45___UIRemoteKeyboards_queue_failedConnection___block_invoke_2;
    block[3] = &unk_1E16B1B28;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __45___UIRemoteKeyboards_queue_failedConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkConnection");
}

void __37___UIRemoteKeyboards_startConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  NSLog(CFSTR("XPC connection interrupted"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "queue_failedConnection:", WeakRetained);

}

void __37___UIRemoteKeyboards_startConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  NSLog(CFSTR("XPC unexpectedly invalidated"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "queue_failedConnection:", WeakRetained);

}

void __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "resetSnapshotWithWindowCheck:", 0);
  objc_msgSend(*(id *)(a1 + 32), "keyboardWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotView");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsHitTesting:", 0);

  if ((*(_BYTE *)(a1 + 40) || *(_BYTE *)(a1 + 41)) && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));

    v8 = 500000000;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "keyboardWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    v8 = 100000000;
  }

  v10 = dispatch_time(0, v8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_3;
  block[3] = &unk_1E16B1B28;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);
}

uint64_t __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetSnapshotWithWindowCheck:", 0);
}

void __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_4(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_5;
  v1[3] = &unk_1E16C1E50;
  v2 = *(id *)(a1 + 32);
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v1);

}

void __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __CFString *v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identityToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "_sceneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(*(id *)(a1 + 32), "sourceSceneIdentityString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", v7))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceDisplayIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "screen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_nameForDisplayType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
    {
      v15 = CFSTR("remote-keyboards");
LABEL_10:
      objc_msgSend(*(id *)(a1 + 32), "keyboardPreserveKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_preserveInputViewsWithId:", v16);

      goto LABEL_11;
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldRestoreKeyboard") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "keyboardPreserveKey");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_10;
  }
LABEL_11:

}

uint64_t __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 1;
  result = objc_msgSend(*(id *)(a1 + 40), "forceReloadInputViews");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 0;
  return result;
}

uint64_t __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateRemoteKeyboardChanged:", *(_QWORD *)(a1 + 32));
}

uint64_t __58___UIRemoteKeyboards_queue_keyboardIAVChanged_onComplete___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  void *v4;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(a1 + 48);
  if (*(double *)(v2 + 152) != v3)
  {
    *(double *)(v2 + 152) = v3;
    if ((objc_msgSend(*(id *)(a1 + 32), "keyboardVisible") & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 208) = 1;
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "forceReloadInputViews");

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 208) = 0;
    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62___UIRemoteKeyboards_queue_sceneBecameFocused_withCompletion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  id v3;
  id *v4;
  uint64_t v5;
  id *i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = qword_1ECD7A300;
  if (!qword_1ECD7A300)
  {
    v2 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&qword_1ECD7A300);
  }
  if ((*(_BYTE *)v2 & 1) != 0)
  {
    v19 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = *(void **)(a1 + 32);
      v21 = v19;
      objc_msgSend(v20, "stringRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v33 = "-[_UIRemoteKeyboards queue_sceneBecameFocused:withCompletion:]_block_invoke";
      v34 = 2112;
      v35 = v22;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "%s: Scene became focused: %@", buf, 0x16u);

    }
  }
  if (*(_QWORD *)(a1 + 32))
  {
    +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v4; i = (id *)((char *)i + 1))
        {
          if (*(_QWORD *)v29 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v7, "_FBSScene", (_QWORD)v28);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identityToken");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = BSEqualObjects();

          if (v10)
          {
            v4 = v7;
            goto LABEL_15;
          }
        }
        v4 = (id *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_15:

    -[UIWindowScene _keyWindow](v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_msgSend(v4, "_isTargetOfKeyboardEventDeferringEnvironment") & 1) == 0)
    {
      v12 = qword_1ECD7A308;
      if (!qword_1ECD7A308)
      {
        v12 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD7A308);
      }
      if ((*(_BYTE *)v12 & 1) != 0)
      {
        v24 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = *(void **)(a1 + 32);
          v26 = v24;
          objc_msgSend(v25, "stringRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v33 = "-[_UIRemoteKeyboards queue_sceneBecameFocused:withCompletion:]_block_invoke";
          v34 = 2048;
          v35 = v11;
          v36 = 2112;
          v37 = v27;
          _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "%s: Performing required scene update because it was focused in the arbiter: %p; scene: %@",
            buf,
            0x20u);

        }
      }
      -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](*(void **)(a1 + 40), v11, 65537);
    }

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "focusedSceneIdentityStringOrIdentifier", (_QWORD)v28);
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
        v17 = qword_1ECD7A310;
        if (!qword_1ECD7A310)
        {
          v17 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v17, (unint64_t *)&qword_1ECD7A310);
        }
        if ((*(_BYTE *)v17 & 1) != 0)
        {
          v23 = *(NSObject **)(v17 + 8);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v33 = "-[_UIRemoteKeyboards queue_sceneBecameFocused:withCompletion:]_block_invoke";
            _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "%s: Setting focused scene identity or identifier to nil because a scene from another application was focused", buf, 0xCu);
          }
        }
        objc_msgSend(*(id *)(a1 + 40), "setFocusedSceneIdentityStringOrIdentifier:", 0);
      }
    }
  }
  v18 = *(_QWORD *)(a1 + 48);
  if (v18)
    (*(void (**)(void))(v18 + 16))();

}

uint64_t __38___UIRemoteKeyboards_cleanSuppression__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cleanDeactivation");
}

uint64_t __44___UIRemoteKeyboards_applicationDidSuspend___block_invoke(uint64_t a1)
{
  objc_msgSend((id)UIApp, "_setDisableBecomeFirstResponder:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setDisableBecomeFirstResponder:", 0);
  return objc_msgSend((id)UIApp, "_endBackgroundTask:", *(_QWORD *)(a1 + 40));
}

void __44___UIRemoteKeyboards_applicationDidSuspend___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAsync:", *(_QWORD *)(a1 + 32));

}

void __44___UIRemoteKeyboards_applicationDidSuspend___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;

  _UIMainBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "reloadForSnapshotting");
  if (!*(_BYTE *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __53___UIRemoteKeyboards_applicationKeyWindowWillChange___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2)
    v4 = objc_msgSend(v3, "_overriddenInterfaceOrientation");
  else
    v4 = objc_msgSend(v3, "interfaceOrientation");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "keyboardWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation");

  if (v7 != v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "keyboardWindow");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "keyboardWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setRotatableClient:toOrientation:updateStatusBar:duration:force:isRotating:", v9, v5, 0, 0, 1, 0.0);

  }
}

void __65___UIRemoteKeyboards__performOnDistributedControllersExceptSelf___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDE7F278))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __68___UIRemoteKeyboards_addHostedWindowView_fromPID_forScene_callerID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectAtIndex:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "indexOfObject:", *(_QWORD *)(a1 + 40)));
  if (!*(_BYTE *)(a1 + 76))
  {
    objc_msgSend(*(id *)(a1 + 32), "currentState");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "keyboardOnScreen")
      && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 32), "currentState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "processIdentifier");
      v9 = *(_DWORD *)(a1 + 72);

      if (v8 == v9)
        objc_msgSend(*(id *)(a1 + 32), "setWindowEnabled:", 0);
    }
    else
    {

    }
  }
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectAtIndex:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "indexOfObject:"));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "proxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWindowHostingPID:active:", *(unsigned int *)(a1 + 72), 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ((objc_msgSend(WeakRetained, "hasHostedViews") & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completeMoveKeyboardForWindow:", v5);

  }
  objc_msgSend(WeakRetained, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateLastRemoteView:forView:inContainer:", 0, *(_QWORD *)(a1 + 56), WeakRetained);

}

uint64_t __54___UIRemoteKeyboards_setSuppressingKeyboard_forScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSuppressingKeyboard:forScene:", 0, 0);
}

uint64_t __54___UIRemoteKeyboards_setSuppressingKeyboard_forScene___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeactivatedKeyboard:forScene:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __62___UIRemoteKeyboards_queue_keyboardSuppressed_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 100);
  if (*(_BYTE *)(a1 + 48))
    v4 = v3 + 1;
  else
    v4 = v3 - 1;
  *(_DWORD *)(v2 + 100) = v4;
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeactivatedKeyboard:forScene:", *(unsigned __int8 *)(a1 + 48), 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startTransition:withInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTransition:withInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "completeTransition:withInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_4(uint64_t a1, void *a2)
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

uint64_t __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 215);
  *(_BYTE *)(v2 + 215) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_performOnDistributedControllersExceptSelf:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 215) = v3;
  return result;
}

void __64___UIRemoteKeyboards_setStickerPrewarmingViewControllerEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD block[6];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v2 = (void *)qword_1ECD7A398;
  v10 = qword_1ECD7A398;
  v3 = MEMORY[0x1E0C809B0];
  if (!qword_1ECD7A398)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getSTKPrewarmingViewControllerClass_block_invoke;
    v6[3] = &unk_1E16B14C0;
    v6[4] = &v7;
    __getSTKPrewarmingViewControllerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v7, 8);
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __64___UIRemoteKeyboards_setStickerPrewarmingViewControllerEnabled___block_invoke_2;
  block[3] = &unk_1E16BD8B0;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __64___UIRemoteKeyboards_setStickerPrewarmingViewControllerEnabled___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(*(Class *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 256);
  *(_QWORD *)(v3 + 256) = v2;

  objc_msgSend(*(id *)(a1 + 32), "keyboardWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
  {

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "keyboardWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 != v12)
    {
      objc_msgSend(v6, "addChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));
      objc_msgSend(v6, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", v14);
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v14, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v13;
      objc_msgSend(v13, "bottomAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v23;
      objc_msgSend(v14, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "trailingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v16;
      objc_msgSend(v14, "widthAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToConstant:", 1.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v18;
      objc_msgSend(v14, "heightAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToConstant:", 1.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v21);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "didMoveToParentViewController:", v6);

    }
  }

}

uint64_t __63___UIRemoteKeyboards_queue_setKeyboardDisabled_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend((id)UIApp, "_setDisableBecomeFirstResponder:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:", *(unsigned __int8 *)(a1 + 48), 0, 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __39___UIRemoteKeyboards_forceKeyboardAway__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39___UIRemoteKeyboards_forceKeyboardAway__block_invoke_2;
  v4[3] = &unk_1E16B1B50;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "performAsync:", v4);

}

uint64_t __39___UIRemoteKeyboards_forceKeyboardAway__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didHandleKeyboardChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", *(_QWORD *)(a1 + 40), 0, 1);
}

void __45___UIRemoteKeyboards_preserveKeyboardWithId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45___UIRemoteKeyboards_preserveKeyboardWithId___block_invoke_2;
  v4[3] = &unk_1E16B1B50;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "performAsync:", v4);

}

uint64_t __45___UIRemoteKeyboards_preserveKeyboardWithId___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didHandleKeyboardChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", *(_QWORD *)(a1 + 40), 0, 1);
}

void __44___UIRemoteKeyboards_restoreKeyboardWithId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44___UIRemoteKeyboards_restoreKeyboardWithId___block_invoke_2;
  v4[3] = &unk_1E16B1B50;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "performAsync:", v4);

}

uint64_t __44___UIRemoteKeyboards_restoreKeyboardWithId___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didHandleKeyboardChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", *(_QWORD *)(a1 + 40), 0, 1);
}

uint64_t __62___UIRemoteKeyboards_queue_setLastEventSource_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 215);
  *(_BYTE *)(v2 + 215) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_updateEventSource:options:", *(_QWORD *)(a1 + 48), 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 215) = v3;
  return result;
}

uint64_t __59___UIRemoteKeyboards_restorePreservedInputViewsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_restoreInputViewsWithId:animated:", CFSTR("remote-keyboards"), 1);
}

@end
