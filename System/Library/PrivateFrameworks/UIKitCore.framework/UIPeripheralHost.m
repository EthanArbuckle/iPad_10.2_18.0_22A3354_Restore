@implementation UIPeripheralHost

+ (id)endPlacementForInputViewSet:(id)a3 windowScene:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  char v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  NSObject *v36;
  void *v37;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t SafeDeviceIdiom;
  unsigned int v57;
  int v59;
  int v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _BYTE *v72;
  id v73;
  char v74;
  char v75;
  void *v76;
  uint8_t v77[4];
  uint64_t v78;
  _BYTE buf[24];
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v65 = a4;
  _UIPeripheralHostLogger();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v65;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "endPlacementForInputViewSet: %@ windowScene: %@", buf, 0x16u);
  }

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v7, "hasLocalMinimumKeyboardHeightForScene:", v65);
  v8 = objc_msgSend(v5, "isCustomInputView");
  if (v66)
    v9 = v8;
  else
    v9 = 1;
  if ((v9 & 1) != 0)
    v61 = 0;
  else
    v61 = objc_msgSend(v66, "isMinimized");
  if (objc_msgSend(v7, "wantsAssistantWhileSuppressingKeyboard"))
    v10 = (id)objc_msgSend(v7, "disableBecomeFirstResponder");
  else
    v10 = 0;
  if (objc_msgSend(v5, "isRemoteKeyboard")
    && !+[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard"))
  {
    if ((objc_msgSend(v62, "snapshotting") & 1) != 0)
    {
      v11 = 1;
      goto LABEL_15;
    }
    if ((objc_msgSend(v62, "keyboardActive") & 1) == 0)
    {
      objc_msgSend(v5, "inputAccessoryView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v31 != 0;

      goto LABEL_15;
    }
  }
  v11 = 0;
LABEL_15:
  SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    || !objc_msgSend(v5, "isRemoteKeyboard"))
  {
    v59 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
  }
  else
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v12, "isFloating");

  }
  objc_msgSend(v64, "systemInputAssistantViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldBeShownForInputDelegate:inputViews:", 0, v5);
  v57 = objc_msgSend(v13, "supportsCompactStyle");
  if (objc_msgSend(v5, "isRemoteKeyboard"))
    v15 = objc_msgSend(v7, "assistantBarVisible");
  else
    v15 = 0;
  objc_msgSend(v5, "inputView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputAssistantView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isInputViewPlaceholder"))
  {
    v17 = v16;
    objc_msgSend(v17, "associatedView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v17, "fallbackView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "associatedView");
      v19 = objc_claimAutoreleasedReturnValue();

      v63 = (void *)v19;
    }
    else
    {
      v16 = v17;
    }

  }
  if (v16)
    v20 = (char)v10;
  else
    v20 = 1;
  if ((v20 & 1) == 0 && (v60 | v61 ^ 1 | v11) == 1)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v80 = __Block_byref_object_copy__134;
    v81 = __Block_byref_object_dispose__134;
    v82 = 0;
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __75__UIPeripheralHost_UIKitInternal__endPlacementForInputViewSet_windowScene___block_invoke;
    v69[3] = &unk_1E16D7280;
    v74 = v59;
    v70 = v62;
    v72 = buf;
    v71 = v66;
    v73 = a1;
    v75 = v57;
    +[UIKeyboardImpl performWithoutFloatingLock:](UIKeyboardImpl, "performWithoutFloatingLock:", v69);
    v21 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    if (v21)
    {
      _UIPeripheralHostLogger();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v77 = 138412290;
        v78 = v23;
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "endPlacementForInputViewSet, early return -> %@", v77, 0xCu);
      }

      v10 = *(id *)(*(_QWORD *)&buf[8] + 40);
      v24 = 0;
    }
    else
    {
      objc_msgSend(v5, "inputAccessoryView");

      v24 = (void *)objc_opt_class();
    }

    _Block_object_dispose(buf, 8);
    if (v21)
      goto LABEL_67;
    goto LABEL_61;
  }
  if ((v14 | v15) == 1 && (objc_msgSend(v66, "_shouldSuppressSoftwareKeyboardAndAssistantView") & 1) == 0)
  {
    if (v63
      || ((objc_msgSend(v5, "inputView"), (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        ? (v26 = v61)
        : (v26 = 0),
          v25,
          v26 | v10))
    {
      if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        v27 = objc_msgSend(v13, "shouldUseCustomBackground:", 0);
        objc_msgSend(v65, "screen");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKeyboardMotionSupport supportForScreen:](UIFlickingAssistantViewSupport, "supportForScreen:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v30 = objc_opt_class();
        }
        else
        {
          objc_msgSend(v29, "remotePlacement");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(v29, "remotePlacement");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_opt_class();

LABEL_60:
LABEL_61:
            if (v24)
            {
LABEL_64:
              _UIPeripheralHostLogger();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v24, "placement");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v37;
                _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_DEFAULT, "endPlacementForInputViewSet, returning -> %@", buf, 0xCu);

              }
              objc_msgSend(v24, "placement");
              v10 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_67;
            }
            goto LABEL_62;
          }
          v30 = objc_msgSend(a1, "floatingAssistantBarPlacementClassSupportingCompactStyle:", v57);
        }
        v24 = (void *)v30;
        goto LABEL_60;
      }
      if (v61 && objc_msgSend(v13, "isVisibleWhenMinimized"))
      {
        v24 = (void *)objc_opt_class();
        goto LABEL_61;
      }
    }
  }
LABEL_62:
  objc_msgSend(v5, "inputAccessoryView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 == 0;

  if (!v35)
  {
    v24 = (void *)objc_opt_class();
    goto LABEL_64;
  }
  if (((v59 ^ 1 | v61) & 1) != 0)
  {
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __75__UIPeripheralHost_UIKitInternal__endPlacementForInputViewSet_windowScene___block_invoke_334;
    v67[3] = &unk_1E16D72A8;
    v68 = v7;
    +[UIInputViewSetPlacement deactivatedKeyboardPlacementWithCurrentPlacement:](UIInputViewSetPlacement, "deactivatedKeyboardPlacementWithCurrentPlacement:", v67);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIKeyboardImpl normalizedPersistentOffset](UIKeyboardImpl, "normalizedPersistentOffset");
    v40 = v39;
    v42 = v41;
    +[UIPeripheralHost floatingChromeBuffer](UIPeripheralHost, "floatingChromeBuffer");
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v50 = v49;
    +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
    +[UIInputViewSetPlacementFloating placementWithUndockedOffset:chromeBuffer:floatingWidth:](UIInputViewSetPlacementFloating, "placementWithUndockedOffset:chromeBuffer:floatingWidth:", v40, v42, v44, v46, v48, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive")
      && +[UIKeyboardImpl isFloatingForced](UIKeyboardImpl, "isFloatingForced")
      && (objc_msgSend(v66, "_shouldSuppressAssistantBar") & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(a1, "floatingAssistantBarPlacementClassSupportingCompactStyle:", v57), "placement");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v53;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setSubPlacements:", v54);

    }
    _UIPeripheralHostLogger();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v52;
      _os_log_impl(&dword_185066000, v55, OS_LOG_TYPE_DEFAULT, "endPlacementForInputViewSet, invisible return -> %@", buf, 0xCu);
    }

    +[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingTransition, "placementWithPlacement:", v52);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_67:

  return v10;
}

+ (id)sharedInstance
{
  void *v2;
  UIPeripheralHost *v3;
  void *v4;

  v2 = (void *)SharedPeripheralHost;
  if (!SharedPeripheralHost)
  {
    v3 = objc_alloc_init(UIPeripheralHost);
    v4 = (void *)SharedPeripheralHost;
    SharedPeripheralHost = (uint64_t)v3;

    v2 = (void *)SharedPeripheralHost;
  }
  return v2;
}

- (void)setAmbiguousControlCenterActivationMargin:(double)a3
{
  objc_msgSend((id)UIApp, "_setAmbiguousControlCenterActivationMargin:");
  self->_ambiguousControlCenterActivationMargin = a3;
}

- (void)textEffectsWindowDidRotate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  double v10;
  void *v11;
  id v12;

  v4 = a3;
  -[UIPeripheralHost view](self, "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[UIPeripheralHost containerWindow](self, "containerWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_isHostedInAnotherProcess");

    if ((v8 & 1) != 0)
      return;
    -[UIPeripheralHost containerWindow](self, "containerWindow");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "interfaceOrientation");
    -[UIPeripheralHost inputViews](self, "inputViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == objc_msgSend(v6, "interfaceOrientation"))
      v10 = 1.0;
    else
      v10 = 0.0;
    -[UIPeripheralHost view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", v10);

  }
}

- (UIView)view
{
  return 0;
}

void __75__UIPeripheralHost_UIKitInternal__endPlacementForInputViewSet_windowScene___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "handlingRemoteEvent")
    || *(_BYTE *)(a1 + 64)
    || (objc_msgSend(*(id *)(a1 + 32), "remoteKeyboardUndocked") & 1) != 0)
  {
    +[UIKeyboardImpl normalizedPersistentOffset](UIKeyboardImpl, "normalizedPersistentOffset");
    v3 = v2;
    v5 = v4;
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  if (*(_BYTE *)(a1 + 64))
  {
    +[UIPeripheralHost floatingChromeBuffer](UIPeripheralHost, "floatingChromeBuffer");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
    +[UIInputViewSetPlacementFloating placementWithUndockedOffset:chromeBuffer:floatingWidth:](UIInputViewSetPlacementFloating, "placementWithUndockedOffset:chromeBuffer:floatingWidth:", v3, v5, v7, v9, v11, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    if (+[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled")
      && +[UIKeyboardImpl isFloatingForced](UIKeyboardImpl, "isFloatingForced")
      && (objc_msgSend(*(id *)(a1 + 40), "_shouldSuppressAssistantBar") & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "floatingAssistantBarPlacementClassSupportingCompactStyle:", *(unsigned __int8 *)(a1 + 65)), "placement");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setSubPlacements:", v19);

    }
  }
  else if ((+[UIKeyboardImpl rivenTranslationPreference](UIKeyboardImpl, "rivenTranslationPreference")
          || objc_msgSend(*(id *)(a1 + 32), "remoteKeyboardUndocked"))
         && (fabs(v5) > 0.01 || +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit")))
  {
    +[UIInputViewSetPlacementUndocked placementWithUndockedOffset:chromeBuffer:](UIInputViewSetPlacementUndocked, "placementWithUndockedOffset:chromeBuffer:", v3, v5, 92.0, 0.0, 0.0, 0.0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
}

- (BOOL)isRotating
{
  void *v2;
  char v3;

  -[UIPeripheralHost containerRootController](self, "containerRootController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRotating");

  return v3;
}

- (id)containerRootController
{
  void *v2;
  void *v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerRootController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (CGRect)visiblePeripheralFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isUndocked"))
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    objc_msgSend(v2, "containerRootController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visibleFrame");
    v3 = v8;
    v4 = v9;
    v5 = v10;
    v6 = v11;

  }
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v15 = v6;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)isOnScreen
{
  return -[UIPeripheralHost currentState](self, "currentState") < 2;
}

- (int)currentState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    objc_msgSend(v2, "containerWindow");
  else
    objc_msgSend(v2, "existingContainerWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isChangingPlacement");
    v7 = objc_msgSend(v5, "isOnScreen");
    if (v6)
      v8 = 2;
    else
      v8 = 3;
    if (v7)
      v9 = v6 ^ 1;
    else
      v9 = v8;
  }
  else
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v9 = 1;
    else
      v9 = 3;

  }
  return v9;
}

- (BOOL)isUndocked
{
  void *v2;
  void *v3;
  void *v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingContainerWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "existingContainerRootController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(v4, "isUndocked");

  }
  return (char)v3;
}

- (void)setKeyboardOnScreenNotifyKey:(BOOL)a3
{
  objc_msgSend((id)objc_opt_class(), "setKeyboardOnScreenNotifyKey:", a3);
  +[UIDictationController keyboardDidUpdateOnScreenStatus](UIDictationController, "keyboardDidUpdateOnScreenStatus");
}

+ (void)setKeyboardOnScreenNotifyKey:(BOOL)a3
{
  int v3;
  _QWORD handler[4];
  id v5;

  _MergedGlobals_1138 = a3;
  v3 = dword_1ECD7F03C;
  if (!dword_1ECD7F03C)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__UIPeripheralHost_setKeyboardOnScreenNotifyKey___block_invoke_2;
    handler[3] = &unk_1E16D72F0;
    v5 = &__block_literal_global_354;
    notify_register_dispatch("com.apple.keyboard.isOnScreen", &dword_1ECD7F03C, MEMORY[0x1E0C80D38], handler);

    v3 = dword_1ECD7F03C;
  }
  __49__UIPeripheralHost_setKeyboardOnScreenNotifyKey___block_invoke((int)a1, v3);
}

uint64_t __49__UIPeripheralHost_setKeyboardOnScreenNotifyKey___block_invoke(int a1, int token)
{
  uint64_t result;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(token, &state64);
  if ((_DWORD)result || (state64 & 1) != _MergedGlobals_1138)
  {
    state64 = _MergedGlobals_1138;
    notify_set_state(token, _MergedGlobals_1138);
    return notify_post("com.apple.keyboard.isOnScreen");
  }
  return result;
}

void __49__UIPeripheralHost_setKeyboardOnScreenNotifyKey___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  if (_MergedGlobals_1138)
  {
    if (!objc_msgSend((id)UIApp, "isSuspended")
      || (+[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "window"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "_isHostedInAnotherProcess"),
          v3,
          v2,
          v4))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
}

- (id)transformedContainerView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UIPeripheralHost existingContainerRootController](self, "existingContainerRootController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIPeripheralHost containerWindow](self, "containerWindow");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)existingContainerRootController
{
  void *v2;
  void *v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingContainerRootController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIInputViewSet)loadAwareInputViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientInputViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIPeripheralHost inputViews](self, "inputViews");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (UIInputViewSet *)v7;
}

- (UIInputViewSet)inputViews
{
  void *v2;
  void *v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIInputViewSet *)v3;
}

- (BOOL)automaticAppearanceEnabled
{
  return self->_automaticAppearanceEnabled;
}

- (BOOL)automaticAppearanceInternalEnabled
{
  return self->_automaticAppearanceEnabledInternal;
}

- (int)_isKeyboardDeactivated
{
  void *v2;
  int v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deactivationCount");

  return v3;
}

+ (id)activeInstance
{
  return (id)SharedPeripheralHost;
}

- (UIPeripheralHost)init
{
  char *v2;
  UIPeripheralHost *v3;
  __int128 v4;
  __int128 v5;
  NSMutableArray *v6;
  NSMutableArray *targetStateStack;
  NSMutableDictionary *v8;
  NSMutableDictionary *deferredTransitionTasks;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIPeripheralHost;
  v2 = -[UIPeripheralHost init](&v13, sel_init);
  v3 = (UIPeripheralHost *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 8) = 257;
    *((_DWORD *)v2 + 6) = 0;
    v4 = *MEMORY[0x1E0C9D648];
    v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v2 + 152) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(v2 + 168) = v5;
    *(_OWORD *)(v2 + 184) = v4;
    *(_OWORD *)(v2 + 200) = v5;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    targetStateStack = v3->_targetStateStack;
    v3->_targetStateStack = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deferredTransitionTasks = v3->_deferredTransitionTasks;
    v3->_deferredTransitionTasks = v8;

    v3->_animationFencingEnabled = 1;
    +[UIInputViewSet emptyInputSet](UIInputViewSet, "emptyInputSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPeripheralHost set_inputViews:](v3, "set_inputViews:", v10);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel_peripheralHostWillResume_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel_textEffectsWindowDidRotate_, CFSTR("UITextEffectsWindowDidRotateNotification"), 0);

  }
  return v3;
}

- (void)set_inputViews:(id)a3
{
  objc_storeStrong((id *)&self->_inputViewSet, a3);
}

- (void)flushDelayedTasks
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPeripheralHost flushDelayedTasksForKey:](self, "flushDelayedTasksForKey:", v3);

}

- (void)flushDelayedTasksForKey:(id)a3
{
  void (**v4)(_QWORD);
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_deferredTransitionTasks, "objectForKey:");
  v4 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_deferredTransitionTasks, "removeObjectForKey:", v5);
    v4[2](v4);
  }

}

- (id)containerWindow
{
  void *v2;
  void *v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)queueDelayedTask:(id)a3 forKey:(id)a4 delay:(double)a5
{
  void (**v8)(_QWORD);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSMutableDictionary *deferredTransitionTasks;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  dispatch_time_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  void (**v28)(_QWORD);
  _QWORD block[5];
  id v30;

  v8 = (void (**)(_QWORD))a3;
  v9 = a4;
  -[NSMutableDictionary objectForKey:](self->_deferredTransitionTasks, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    v12 = _Block_copy(v10);
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __65__UIPeripheralHost_UIKitInternal__queueDelayedTask_forKey_delay___block_invoke_2;
    v26 = &unk_1E16B6740;
    v27 = v12;
    v28 = v8;
    v13 = v12;
    v14 = (void *)objc_msgSend(&v23, "copy");

    deferredTransitionTasks = self->_deferredTransitionTasks;
    v16 = _Block_copy(v14);
    -[NSMutableDictionary setObject:forKey:](deferredTransitionTasks, "setObject:forKey:", v16, v9, v23, v24, v25, v26);

  }
  else
  {
    -[UIPeripheralHost existingContainerRootController](self, "existingContainerRootController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isTransitionStarted");

    if (v18)
    {
      v8[2](v8);
    }
    else
    {
      v19 = (void *)objc_msgSend(v8, "copy");
      v20 = self->_deferredTransitionTasks;
      v21 = _Block_copy(v19);
      -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v21, v9);

      v22 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__UIPeripheralHost_UIKitInternal__queueDelayedTask_forKey_delay___block_invoke;
      block[3] = &unk_1E16B1B50;
      block[4] = self;
      v30 = v9;
      dispatch_after(v22, MEMORY[0x1E0C80D38], block);

    }
  }

}

- (void)queueDelayedTask:(id)a3 forKey:(id)a4
{
  -[UIPeripheralHost queueDelayedTask:forKey:delay:](self, "queueDelayedTask:forKey:delay:", a3, a4, 0.2);
}

- (void)peripheralHostWillResume:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[UIPeripheralHost responder](self, "responder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_requiresKeyboardWhenFirstResponder");

  if (v5)
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPeripheralHost responder](self, "responder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_keyboardResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v8);

    objc_msgSend(v6, "geometryDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setGeometryDelegate:", v10);

    }
    -[UIPeripheralHost inputViews](self, "inputViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_compatibilityController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentInputMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInputMode:", v15);

  }
  -[UIPeripheralHost flushDelayedTasks](self, "flushDelayedTasks");
}

- (UIResponder)responder
{
  return self->_responder;
}

void __65__UIPeripheralHost_UIKitInternal__queueDelayedTask_forKey_delay___block_invoke(uint64_t a1)
{
  void (**v2)(void);
  void *v3;
  void *v4;
  int v5;
  void (**v6)(void);
  void (**v7)(void);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "existingContainerRootController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isTransitioning") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "existingContainerRootController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isTransitionStarted");

      v6 = v7;
      if (!v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "queueDelayedTask:forKey:", v7, *(_QWORD *)(a1 + 40));
LABEL_7:
        v2 = v7;
        goto LABEL_8;
      }
    }
    else
    {

      v6 = v7;
    }
    v6[2]();
    goto LABEL_7;
  }
LABEL_8:

}

- (void)queueDelayedTask:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  v5 = a3;
  objc_msgSend(v4, "valueWithPointer:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPeripheralHost queueDelayedTask:forKey:](self, "queueDelayedTask:forKey:", v5, v6);

}

+ (CGRect)screenBoundsInAppOrientation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation");
  if ((unint64_t)(v11 - 3) >= 2)
    v12 = v10;
  else
    v12 = v8;
  if ((unint64_t)(v11 - 3) >= 2)
    v13 = v8;
  else
    v13 = v10;
  v14 = v4;
  v15 = v6;
  result.size.height = v12;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)automaticAppearanceReallyEnabled
{
  return self->_automaticAppearanceEnabled && self->_automaticAppearanceEnabledInternal;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIApplicationWillEnterForegroundNotification");
  v6[1] = CFSTR("UITextEffectsWindowDidRotateNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[UIPeripheralHost set_inputViews:](self, "set_inputViews:", 0);
  -[UIPeripheralHost set_transientInputViews:](self, "set_transientInputViews:", 0);
  -[UIPeripheralHost setResponder:](self, "setResponder:", 0);
  v5.receiver = self;
  v5.super_class = (Class)UIPeripheralHost;
  -[UIPeripheralHost dealloc](&v5, sel_dealloc);
}

- (BOOL)hasDictationKeyboard
{
  void *v2;
  void *v3;
  char isKindOfClass;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CGSize)sizeOfInputViewForInputViewSet:(id)a3 withInterfaceOrientation:(int64_t)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v5 = a3;
  if ((objc_msgSend(v5, "isEmpty") & 1) != 0
    || (objc_msgSend(v5, "keyboard"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    +[UIKeyboardImpl sizeForInterfaceOrientation:](UIKeyboardImpl, "sizeForInterfaceOrientation:", a4);
  }
  else
  {
    +[UIKeyboardImpl defaultSizeForInterfaceOrientation:](UIKeyboardImpl, "defaultSizeForInterfaceOrientation:", a4);
  }
  v9 = v7;
  v10 = v8;

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_renderConfigForCurrentResponder
{
  void *v3;
  void *v4;

  -[UIPeripheralHost responder](self, "responder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPeripheralHost _renderConfigForResponder:](self, "_renderConfigForResponder:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_renderConfigForResponder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  +[UITextInputTraits traitEnvironmentFromTraits:](UITextInputTraits, "traitEnvironmentFromTraits:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v3, "keyboardAppearance");
  else
    v5 = 0;
  v6 = +[UITextInputTraits configuredAppearanceForAppearance:withTraitEnvironment:](UITextInputTraits, "configuredAppearanceForAppearance:withTraitEnvironment:", v5, v4);
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentInputMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderConfig configForAppearance:inputMode:traitEnvironment:](UIKBRenderConfig, "configForAppearance:inputMode:traitEnvironment:", v6, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)_releaseSharedInstance
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)SharedPeripheralHost, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  v4 = (void *)SharedPeripheralHost;
  SharedPeripheralHost = 0;

}

- (void)setKeyboardFencingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldFence:", v3);

}

- (BOOL)isOffScreen
{
  return -[UIPeripheralHost currentState](self, "currentState") == 3;
}

- (UIPeripheralHostState)targetState
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->_targetStateStack, "count");
  if (v3)
  {
    -[NSMutableArray lastObject](self->_targetStateStack, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIPeripheralHostState *)v3;
}

- (void)setTargetState:(id)a3
{
  NSMutableArray *targetStateStack;

  targetStateStack = self->_targetStateStack;
  if (a3)
  {
    -[NSMutableArray addObject:](targetStateStack, "addObject:");
  }
  else if (-[NSMutableArray count](targetStateStack, "count"))
  {
    -[NSMutableArray removeLastObject](self->_targetStateStack, "removeLastObject");
  }
}

- (void)postKeyboardFrameChangeNotification:(id)a3 withInfo:(id)a4
{
  id v6;
  __CFString **v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!self->_isTranslating || (objc_msgSend(v11, "_containsSubstring:", CFSTR("ChangeFrameNotification")) & 1) == 0)
  {
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UIKeyboardWillChangeFrameNotification")) & 1) != 0)
    {
      v7 = UIKeyboardPrivateWillChangeFrameNotification;
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("UIKeyboardDidChangeFrameNotification")))
      {
        v8 = 0;
        goto LABEL_9;
      }
      v7 = UIKeyboardPrivateDidChangeFrameNotification;
    }
    v8 = *v7;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPeripheralHost _screenForFirstResponder:](self, "_screenForFirstResponder:", self->_responder);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", v8, v10, v6);

    objc_msgSend(v9, "postNotificationName:object:userInfo:", v11, 0, v6);
  }

}

- (void)disableInterfaceAutorotation:(BOOL)a3
{
  BOOL v4;
  char **v5;
  void *v6;

  if (a3)
  {
    if (self->_interfaceAutorotationDisabled)
      return;
    v4 = 1;
    v5 = &selRef_beginDisablingInterfaceAutorotation;
  }
  else
  {
    if (!self->_interfaceAutorotationDisabled)
      return;
    v4 = 0;
    v5 = &selRef_endDisablingInterfaceAutorotation;
  }
  objc_msgSend((id)UIApp, "windows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeObjectsPerformSelector:", *v5);

  self->_interfaceAutorotationDisabled = v4;
}

- (void)prepareForRotationToOrientation:(int64_t)a3
{
  void *v5;
  id v6;

  -[UIPeripheralHost inputViews](self, "inputViews");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPeripheralHost prepareForRotationOfKeyboard:toOrientation:](self, "prepareForRotationOfKeyboard:toOrientation:", v5, a3);

}

- (void)rotateToOrientation:(int64_t)a3
{
  void *v5;
  id v6;

  -[UIPeripheralHost inputViews](self, "inputViews");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPeripheralHost rotateKeyboard:toOrientation:](self, "rotateKeyboard:toOrientation:", v5, a3);

}

- (void)finishRotation
{
  void *v3;
  id v4;

  -[UIPeripheralHost inputViews](self, "inputViews");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPeripheralHost finishRotationOfKeyboard:](self, "finishRotationOfKeyboard:", v3);

}

- (void)prepareForRotationOfKeyboard:(id)a3 toOrientation:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  CGRect v32;
  CGRect v33;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v31 = v6;
    objc_msgSend(v6, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_isTextEffectsWindow");

    v7 = v31;
    if ((v9 & 1) == 0)
    {
      if (objc_msgSend((id)UIApp, "_isSpringBoard"))
      {
        objc_msgSend(v31, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bounds");
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        objc_msgSend(v31, "bounds");
        objc_msgSend(v31, "convertRect:toView:", 0);
        v33.origin.x = v19;
        v33.origin.y = v20;
        v33.size.width = v21;
        v33.size.height = v22;
        v32.origin.x = v12;
        v32.origin.y = v14;
        v32.size.width = v16;
        v32.size.height = v18;
        v23 = CGRectContainsRect(v32, v33);

        if (!v23)
          objc_msgSend(v31, "setHidden:", 1);
      }
      objc_msgSend(v31, "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_rotationDuration");
      v26 = v25;

      -[UIPeripheralHost containerRootController](self, "containerRootController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_prepareForRotationToOrientation:duration:", a4, v26);

      v28 = +[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled");
      v7 = v31;
      if (v28)
      {
        +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "inputWindowRootViewController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "_prepareForRotationToOrientation:duration:", a4, v26);
        v7 = v31;
      }
    }
  }

}

- (void)rotateKeyboard:(id)a3 toOrientation:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v17 = v6;
    objc_msgSend(v6, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_isTextEffectsWindow");

    v7 = v17;
    if ((v9 & 1) == 0)
    {
      objc_msgSend(v17, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_rotationDuration");
      v12 = v11;

      -[UIPeripheralHost containerRootController](self, "containerRootController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_rotateToOrientation:duration:", a4, v12);

      v14 = +[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled");
      v7 = v17;
      if (v14)
      {
        +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "inputWindowRootViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "_rotateToOrientation:duration:", a4, v12);
        v7 = v17;
      }
    }
  }

}

- (void)finishRotationOfKeyboard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = v4;
    objc_msgSend(v4, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_isTextEffectsWindow");

    v5 = v12;
    if ((v7 & 1) == 0)
    {
      if (objc_msgSend((id)UIApp, "_isSpringBoard"))
        objc_msgSend(v12, "setHidden:", 0);
      -[UIPeripheralHost containerRootController](self, "containerRootController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_finishRotationFromInterfaceOrientation:", 0);

      v9 = +[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled");
      v5 = v12;
      if (v9)
      {
        +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "inputWindowRootViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "_finishRotationFromInterfaceOrientation:", 0);
        v5 = v12;
      }
    }
  }

}

- (id)_sceneForFirstResponder:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "_responderWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)animationsEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  BOOL v9;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPeripheralHost _sceneForFirstResponder:](self, "_sceneForFirstResponder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsHostingInfo hostingInfoForWindowScene:](UITextEffectsHostingInfo, "hostingInfoForWindowScene:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "useHostedInstance");

  v8 = (v7 & 1) != 0 || objc_msgSend((id)UIApp, "applicationState") != 2;
  v9 = self->_disableAnimationsCount < 1 && v8;

  return v9;
}

- (void)forceOrderInAutomatic
{
  id v2;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceOrderInAutomaticAnimated:", 1);

}

- (void)forceOrderOutAutomatic
{
  id v2;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceOrderOutAutomaticAnimated:", 1);

}

- (void)forceOrderInAutomaticAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceOrderInAutomaticAnimated:", v3);

}

- (void)forceOrderOutAutomaticAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceOrderOutAutomaticAnimated:", v3);

}

- (void)forceOrderInAutomaticFromDirection:(int)a3 withDuration:(double)a4
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)&a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceOrderInAutomaticFromDirection:withDuration:", v5, a4);

}

- (void)forceOrderOutAutomaticToDirection:(int)a3 withDuration:(double)a4
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)&a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceOrderOutAutomaticToDirection:withDuration:", v5, a4);

}

- (void)orderInAutomatic
{
  void *v2;
  void *v3;
  id v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "automaticAppearanceReallyEnabled"))
  {
    objc_msgSend(v4, "nextAnimationStyle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "legacyAnimationCopy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "orderInWithAnimationStyle:", v3);
  }

}

- (void)orderInAutomaticSkippingAnimation
{
  void *v2;
  void *v3;
  id v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "automaticAppearanceReallyEnabled"))
  {
    objc_msgSend(v4, "nextAnimationStyle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "legacyAnimationCopy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setAnimated:", 0);
    objc_msgSend(v4, "orderInWithAnimationStyle:", v3);

  }
}

- (void)orderInAutomaticFromDirection:(int)a3 withDuration:(double)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = *(_QWORD *)&a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "automaticAppearanceReallyEnabled"))
  {
    +[UIInputViewAnimationStyleDirectional animationStyleAnimated:duration:outDirection:](UIInputViewAnimationStyleDirectional, "animationStyleAnimated:duration:outDirection:", a4 > 0.0, v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderInWithAnimationStyle:", v6);

  }
}

- (void)orderOutAutomatic
{
  void *v2;
  void *v3;
  id v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "automaticAppearanceReallyEnabled"))
  {
    objc_msgSend(v4, "nextAnimationStyle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "legacyAnimationCopy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "orderOutWithAnimationStyle:", v3);
  }

}

- (void)orderOutAutomaticSkippingAnimation
{
  void *v2;
  void *v3;
  id v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "automaticAppearanceReallyEnabled"))
  {
    objc_msgSend(v4, "nextAnimationStyle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "legacyAnimationCopy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setAnimated:", 0);
    objc_msgSend(v4, "orderOutWithAnimationStyle:", v3);

  }
}

- (void)orderOutAutomaticToDirection:(int)a3 withDuration:(double)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = *(_QWORD *)&a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "automaticAppearanceReallyEnabled"))
  {
    +[UIInputViewAnimationStyleDirectional animationStyleAnimated:duration:outDirection:](UIInputViewAnimationStyleDirectional, "animationStyleAnimated:duration:outDirection:", a4 > 0.0, v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderOutWithAnimationStyle:", v6);

  }
}

- (void)setDocumentInputMode:(id)a3
{
  UITextInputMode *v4;
  UITextInputMode *documentInputMode;
  id v6;

  objc_msgSend(a3, "primaryLanguage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v6);
  v4 = (UITextInputMode *)objc_claimAutoreleasedReturnValue();
  documentInputMode = self->_documentInputMode;
  self->_documentInputMode = v4;

}

- (void)setAutomaticAppearanceEnabled:(BOOL)a3
{
  self->_automaticAppearanceEnabled = a3;
}

- (UIKeyboardRotationState)rotationState
{
  return self->_rotationState;
}

- (void)setRotationState:(id)a3
{
  objc_storeStrong((id *)&self->_rotationState, a3);
}

- (void)setResponder:(id)a3
{
  objc_storeStrong((id *)&self->_responder, a3);
}

- (BOOL)animationFencingEnabled
{
  return self->_animationFencingEnabled;
}

- (void)setAnimationFencingEnabled:(BOOL)a3
{
  self->_animationFencingEnabled = a3;
}

- (UIInputViewSet)_inputViews
{
  return self->_inputViewSet;
}

- (UIInputViewSet)_transientInputViews
{
  return self->_transientInputViewSet;
}

- (void)set_transientInputViews:(id)a3
{
  objc_storeStrong((id *)&self->_transientInputViewSet, a3);
}

- (UITextInputMode)documentInputMode
{
  return self->_documentInputMode;
}

- (void)setCurrentState:(int)a3
{
  self->_currentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentInputMode, 0);
  objc_storeStrong((id *)&self->_transientInputViewSet, 0);
  objc_storeStrong((id *)&self->_rotationState, 0);
  objc_storeStrong((id *)&self->_deferredTransitionTasks, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_inputViewSet, 0);
  objc_storeStrong((id *)&self->_targetStateStack, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
}

- (BOOL)hasCustomInputView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[UIPeripheralHost inputViews](self, "inputViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIPeripheralHost inputViews](self, "inputViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CGSize)totalPeripheralSizeForOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  CGSize result;

  -[UIPeripheralHost inputViews](self, "inputViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPeripheralHost sizeOfInputViewForInputViewSet:withInterfaceOrientation:](self, "sizeOfInputViewForInputViewSet:withInterfaceOrientation:", v5, a3);
  v7 = v6;
  v9 = v8;

  if (-[UIPeripheralHost hasCustomInputView](self, "hasCustomInputView"))
  {
    -[UIPeripheralHost inputViews](self, "inputViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputViewBounds");
    v9 = v11;

  }
  -[UIPeripheralHost inputViews](self, "inputViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputAccessoryView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UIPeripheralHost inputViews](self, "inputViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      v9 = 0.0;
    -[UIPeripheralHost inputViews](self, "inputViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputAccessoryViewBounds");
    v9 = v9 + v17;

  }
  -[UIPeripheralHost inputViews](self, "inputViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "keyboard");

  v19 = v7;
  v20 = v9;
  result.height = v20;
  result.width = v19;
  return result;
}

- (BOOL)userInfoContainsActualGeometryChange:(id)a3
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGRect v23;
  CGRect v24;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("UIKeyboardFrameBeginUserInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "objectForKey:", CFSTR("UIKeyboardFrameEndUserInfoKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "CGRectValue");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  v24.origin.x = v15;
  v24.origin.y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  return !CGRectEqualToRect(v23, v24);
}

- (CGRect)screenRectFromBounds:(CGRect)a3 atCenter:(CGPoint)a4 applyingSourceHeightDelta:(double)a5
{
  double x;
  double width;
  double y;
  double v8;
  CGFloat v10;
  CGFloat v11;
  void *v12;
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
  CGRect result;

  x = a4.x;
  width = a3.size.width;
  y = a3.origin.y;
  v8 = a3.origin.x;
  v10 = a3.size.height + a5;
  v11 = a4.y + a5 * 0.5;
  -[UIPeripheralHost containerWindow](self, "containerWindow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:toWindow:", 0, v8, y, width, v10);
  v14 = v13;
  v16 = v15;

  -[UIPeripheralHost containerWindow](self, "containerWindow");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertPoint:toWindow:", 0, x, v11);
  v19 = v18;
  v21 = v20;

  v22 = v19 - v14 * 0.5;
  v23 = v21 - v16 * 0.5;
  v24 = v14;
  v25 = v16;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)userInfoFromGeometry:(UIPeripheralAnimationGeometry *)a3 duration:(double)a4 forWill:(BOOL)a5 forShow:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double y;
  double x;
  void *v16;
  int v17;
  uint64_t v18;
  UIPeripheralAnimationGeometry *p_inPosition;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double tx;
  double ty;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v80;
  double v81;
  double v82;
  double v83;

  v6 = a6;
  v7 = a5;
  v10 = 24;
  if (a6)
    v10 = 8;
  v11 = 16;
  if (a6)
    v11 = 0;
  v12 = *(double *)((char *)&a3->outPosition.x + v11);
  v13 = *(double *)((char *)&a3->outPosition.x + v10);
  if (a6 && !-[UIPeripheralHost isUndocked](self, "isUndocked"))
  {
    -[UIPeripheralHost inputViews](self, "inputViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isSplit");
    v18 = 16;
    if (v17)
    {
      v18 = 0;
      p_inPosition = a3;
    }
    else
    {
      p_inPosition = (UIPeripheralAnimationGeometry *)&a3->inPosition;
    }
    x = *(double *)((char *)&a3->outPosition.x + v18);
    y = p_inPosition->outPosition.y;

  }
  else
  {
    x = a3->outPosition.x;
    y = a3->outPosition.y;
  }
  if (v7)
  {
    -[UIPeripheralHost screenRectFromBounds:atCenter:applyingSourceHeightDelta:](self, "screenRectFromBounds:atCenter:applyingSourceHeightDelta:", a3->bounds.origin.x, a3->bounds.origin.y, a3->bounds.size.width, a3->bounds.size.height, v12, v13, -a3->targetFrameHeightDelta);
    v82 = v21;
    v83 = v20;
    v80 = v23;
    v81 = v22;
    -[UIPeripheralHost screenRectFromBounds:atCenter:applyingSourceHeightDelta:](self, "screenRectFromBounds:atCenter:applyingSourceHeightDelta:", a3->bounds.origin.x, a3->bounds.origin.y, a3->bounds.size.width, a3->bounds.size.height, x, y, 0.0);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v32 = 7;
  }
  else
  {
    -[UIPeripheralHost targetState](self, "targetState");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "screenGeometry");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKey:", CFSTR("UIKeyboardFrameBeginUserInfoKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "CGRectValue");
    v82 = v37;
    v83 = v36;
    v80 = v39;
    v81 = v38;

    -[UIPeripheralHost targetState](self, "targetState");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "screenGeometry");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKey:", CFSTR("UIKeyboardFrameEndUserInfoKey"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "CGRectValue");
    v25 = v43;
    v27 = v44;
    v29 = v45;
    v31 = v46;

    v32 = 5;
  }
  if (-[UIPeripheralHost isUndocked](self, "isUndocked"))
  {
    -[UIPeripheralHost inputViews](self, "inputViews");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "inputView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      if (v6)
      {
        tx = a3->transform.tx;
        ty = a3->transform.ty;
        v51 = x + tx;
        v52 = y + ty;
        -[UIPeripheralHost screenRectFromBounds:atCenter:applyingSourceHeightDelta:](self, "screenRectFromBounds:atCenter:applyingSourceHeightDelta:", a3->bounds.origin.x, a3->bounds.origin.y, a3->bounds.size.width, a3->bounds.size.height, v12 + tx, v13 + ty, -a3->targetFrameHeightDelta);
        v82 = v54;
        v83 = v53;
        v80 = v56;
        v81 = v55;
        -[UIPeripheralHost screenRectFromBounds:atCenter:applyingSourceHeightDelta:](self, "screenRectFromBounds:atCenter:applyingSourceHeightDelta:", a3->bounds.origin.x, a3->bounds.origin.y, a3->bounds.size.width, a3->bounds.size.height, v51, v52, -a3->targetFrameHeightDelta);
        v25 = v57;
        v27 = v58;
        v29 = v59;
        v31 = v60;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v32);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v83, v82, v81, v80);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKey:", v62, CFSTR("UIKeyboardFrameBeginUserInfoKey"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v25, v27, v29, v31);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKey:", v63, CFSTR("UIKeyboardFrameEndUserInfoKey"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v12, v13);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKey:", v64, CFSTR("UIKeyboardCenterBeginUserInfoKey"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKey:", v65, CFSTR("UIKeyboardCenterEndUserInfoKey"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a3->bounds.origin.x, a3->bounds.origin.y, a3->bounds.size.width, a3->bounds.size.height);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKey:", v66, CFSTR("UIKeyboardBoundsUserInfoKey"));

  v67 = (void *)MEMORY[0x1E0CB37E8];
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "numberWithBool:", objc_msgSend(v68, "splitTransitionInProgress"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKey:", v69, CFSTR("UIKeyboardFrameChangedByUserInteraction"));

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKey:", v70, CFSTR("UIKeyboardAnimationDurationUserInfoKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 7);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKey:", v71, CFSTR("UIKeyboardAnimationCurveUserInfoKey"));

    -[UIPeripheralHost targetState](self, "targetState");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
    {
      v73 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v83, v82, v81, v80);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v25, v27, v29, v31);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "dictionaryWithObjectsAndKeys:", v74, CFSTR("UIKeyboardFrameBeginUserInfoKey"), v75, CFSTR("UIKeyboardFrameEndUserInfoKey"), 0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPeripheralHost targetState](self, "targetState");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setScreenGeometry:", v76);

    }
  }
  return v61;
}

- (id)transitioningView
{
  void *v2;
  void *v3;

  -[UIPeripheralHost view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)transitioningFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[UIPeripheralHost containerRootController](self, "containerRootController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitioningFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)updateToPlacement:(id)a3 withNormalAnimationsAndNotifications:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UIPeripheralHost containerRootController](self, "containerRootController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateToPlacement:withNormalAnimationsAndNotifications:", v6, v4);

}

- (void)setInputViewsHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIPeripheralHost containerRootController](self, "containerRootController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInputViewsHidden:", v3);

}

- (id)_screenForFirstResponder:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "_responderWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "_userInterfaceIdiom") == 3)
  {
    v5 = v4;
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

uint64_t __65__UIPeripheralHost_UIKitInternal__queueDelayedTask_forKey_delay___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)hasDelayedTasksForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_deferredTransitionTasks, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)containerTextEffectsWindow
{
  void *v2;
  id v3;

  -[UIPeripheralHost containerWindow](self, "containerWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_isTextEffectsWindow"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)containerTextEffectsWindowAboveStatusBar
{
  void *v2;
  void *v3;

  -[UIPeripheralHost containerTextEffectsWindow](self, "containerTextEffectsWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aboveStatusBarWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateContainerWindowLevel
{
  void *v3;
  id v4;

  -[UIPeripheralHost inputViews](self, "inputViews");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPeripheralHost responder](self, "responder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPeripheralHost setTextEffectsWindowLevelForInputView:responder:](self, "setTextEffectsWindowLevelForInputView:responder:", v4, v3);

}

- (void)setTextEffectsWindowLevelForInputView:(id)a3 responder:(id)a4
{
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  double v15;
  double v16;
  id *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a4;
  if (!objc_msgSend(a3, "isEmpty")
    || (+[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "hasAnyHostedViews"), v6, v7))
  {
    objc_msgSend(v24, "_responderWindow");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v24, "_responderWindow");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPeripheralHost containerTextEffectsWindow](self, "containerTextEffectsWindow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v11)
      {
        -[UIPeripheralHost containerTextEffectsWindow](self, "containerTextEffectsWindow");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "_isHostedInAnotherProcess");

        if ((v13 & 1) == 0)
        {
          objc_msgSend(v24, "_responderWindow");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "level");
          v16 = v15;

          objc_msgSend(v24, "_responderWindow");
          v17 = (id *)objc_claimAutoreleasedReturnValue();
          -[UIWindow _fbsScene](v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "settings");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "level");
          v21 = v20;

          -[UIPeripheralHost containerTextEffectsWindow](self, "containerTextEffectsWindow");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_setWindowLevel:", v16 + 1.0);

          +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setWindowLevel:sceneLevel:forResponder:", v24, v16 + 2.0, v21 + 2.0);

        }
      }
    }
  }

}

- (void)forceReloadInputViews
{
  void *v2;
  id v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_reloadInputViewsForResponder:", v2);

}

- (void)setDeactivatedKeyboard:(BOOL)a3 forScene:(id)a4
{
  -[UIPeripheralHost setDeactivatedKeyboard:forScene:forSuppressionAssertion:](self, "setDeactivatedKeyboard:forScene:forSuppressionAssertion:", a3, a4, 0);
}

- (void)setDeactivatedKeyboard:(BOOL)a3 forScene:(id)a4 forSuppressionAssertion:(BOOL)a5
{
  -[UIPeripheralHost setDeactivatedKeyboard:forScene:forSuppressionAssertion:updatePlacement:](self, "setDeactivatedKeyboard:forScene:forSuppressionAssertion:updatePlacement:", a3, a4, a5, 1);
}

- (void)setDeactivatedKeyboard:(BOOL)a3 forScene:(id)a4 forSuppressionAssertion:(BOOL)a5 updatePlacement:(BOOL)a6
{
  -[UIPeripheralHost setDeactivatedKeyboard:forScene:forSuppressionAssertion:updatePlacement:wantsAssistant:](self, "setDeactivatedKeyboard:forScene:forSuppressionAssertion:updatePlacement:wantsAssistant:", a3, a4, a5, a6, 0);
}

- (void)setDeactivatedKeyboard:(BOOL)a3 forScene:(id)a4 forSuppressionAssertion:(BOOL)a5 updatePlacement:(BOOL)a6 wantsAssistant:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  _QWORD v30[4];
  BOOL v31;
  _QWORD v32[4];
  id v33;
  uint8_t *v34;
  uint8_t v35[4];
  _BOOL4 v36;
  uint8_t buf[8];
  __int128 v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v29 = a7;
  v7 = a6;
  v8 = a5;
  v9 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  _UIPeripheralHostLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v9;
    LOWORD(v38) = 2112;
    *(_QWORD *)((char *)&v38 + 2) = v11;
    WORD5(v38) = 1024;
    HIDWORD(v38) = v8;
    _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "setDeactivatedKeyboard: %d forScene: %@ forSuppressionAssertion: %d", buf, 0x18u);
  }

  if (!v11)
  {
    -[UIPeripheralHost containerWindow](self, "containerWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "screen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", v14);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[UIPeripheralHost containerWindow](self, "containerWindow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "windowScene");
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v38 = buf;
  *((_QWORD *)&v38 + 1) = 0x3032000000;
  v39 = __Block_byref_object_copy__134;
  v40 = __Block_byref_object_dispose__134;
  v41 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __122__UIPeripheralHost_UIKitInternal__setDeactivatedKeyboard_forScene_forSuppressionAssertion_updatePlacement_wantsAssistant___block_invoke;
  v32[3] = &unk_1E16D71C8;
  v17 = v11;
  v33 = v17;
  v34 = buf;
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v32);
  v18 = *(void **)(v38 + 40);
  if (v18 || !v9)
  {
    objc_msgSend(v18, "containerRootController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v38 + 40), "nextAnimationStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(v38 + 40);
    if (v9)
    {
      v22 = objc_msgSend(*(id *)(v38 + 40), "deactivationCount");
      objc_msgSend(v21, "setDeactivationCount:", v22 + 1);
      if (v22)
      {
        v23 = 0;
      }
      else
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "showsCandidateBar");

        if (v25)
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "candidateController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "collapse");

        }
        v23 = 1;
      }
    }
    else
    {
      if (objc_msgSend(*(id *)(v38 + 40), "deactivationCount"))
        objc_msgSend(*(id *)(v38 + 40), "setDeactivationCount:", objc_msgSend(*(id *)(v38 + 40), "deactivationCount") - 1);
      v23 = objc_msgSend(*(id *)(v38 + 40), "deactivationCount") == 0;
    }
    _UIPeripheralHostLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v35 = 67109120;
      v36 = v23;
      _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_DEFAULT, "setDeactivatedKeyboard, shouldUpdatePlacement: %d", v35, 8u);
    }

    if (v23)
    {
      if (v7)
      {
        -[UIPeripheralHost updatePlacementForDeactivatedKeyboard:forSuppressionAssertion:wantsAssistant:animationStyle:](self, "updatePlacementForDeactivatedKeyboard:forSuppressionAssertion:wantsAssistant:animationStyle:", v9, v8, v29, v20);
      }
      else
      {
        v30[0] = v16;
        v30[1] = 3221225472;
        v30[2] = __122__UIPeripheralHost_UIKitInternal__setDeactivatedKeyboard_forScene_forSuppressionAssertion_updatePlacement_wantsAssistant___block_invoke_302;
        v30[3] = &__block_descriptor_33_e33_v16__0__UIInputWindowController_8l;
        v31 = v9;
        -[UIPeripheralHost performMultipleOperations:withAnimationStyle:](self, "performMultipleOperations:withAnimationStyle:", v30, v20);
      }
    }

  }
  _Block_object_dispose(buf, 8);

}

void __122__UIPeripheralHost_UIKitInternal__setDeactivatedKeyboard_forScene_forSuppressionAssertion_updatePlacement_wantsAssistant___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

void __122__UIPeripheralHost_UIKitInternal__setDeactivatedKeyboard_forScene_forSuppressionAssertion_updatePlacement_wantsAssistant___block_invoke_302(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "placement");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlacementChangeDisabled:withPlacement:", v2, v4);

}

- (void)updatePlacementForDeactivatedKeyboard:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 wantsAssistant:(BOOL)a5 animationStyle:(id)a6
{
  _QWORD v6[4];
  BOOL v7;
  BOOL v8;
  BOOL v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __127__UIPeripheralHost_UIKitInternal__updatePlacementForDeactivatedKeyboard_forSuppressionAssertion_wantsAssistant_animationStyle___block_invoke;
  v6[3] = &__block_descriptor_35_e33_v16__0__UIInputWindowController_8l;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  -[UIPeripheralHost performMultipleOperations:withAnimationStyle:](self, "performMultipleOperations:withAnimationStyle:", v6, a6);
}

void __127__UIPeripheralHost_UIKitInternal__updatePlacementForDeactivatedKeyboard_forSuppressionAssertion_wantsAssistant_animationStyle___block_invoke(unsigned __int8 *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = a1[32];
  objc_msgSend(v3, "placement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_placementForDeactivatedKeyboard:currentPlacement:forSuppressionAssertion:wantsAssistant:", v4, v5, a1[33], a1[34]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setPlacementChangeDisabled:withPlacement:", a1[32], v6);
}

- (void)performWithoutDeactivation:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deactivationCount");
  if (v5)
  {
    objc_msgSend(v4, "setDeactivationCount:", 1);
    objc_msgSend(v4, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPeripheralHost setDeactivatedKeyboard:forScene:](self, "setDeactivatedKeyboard:forScene:", 0, v6);

    v8[2]();
    objc_msgSend(v4, "scene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPeripheralHost setDeactivatedKeyboard:forScene:](self, "setDeactivatedKeyboard:forScene:", 1, v7);

    objc_msgSend(v4, "setDeactivationCount:", objc_msgSend(v4, "deactivationCount") + v5 - 1);
  }
  else
  {
    v8[2]();
  }

}

- (id)lastUsedInputModeForCurrentContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "textInputContextIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textInputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastUsedInputModeForTextInputMode:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (Class)hostViewClass
{
  return (Class)objc_opt_class();
}

- (void)setAutomaticAppearanceInternalEnabled:(BOOL)a3
{
  self->_automaticAppearanceEnabledInternal = a3;
}

- (CGRect)visiblePeripheralFrame:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v51;
  double v52;
  double v53;
  double v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGRect v67;
  CGRect v68;
  CGRect result;
  CGRect v70;

  v3 = a3;
  -[UIPeripheralHost targetState](self, "targetState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v3)
  {
    -[UIPeripheralHost targetState](self, "targetState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "geometry");
      v8 = v66;
      v9 = v65;
    }
    else
    {
      v8 = 0.0;
      v9 = 0.0;
    }

    -[UIPeripheralHost targetState](self, "targetState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "inPositionIsDestination");
    -[UIPeripheralHost targetState](self, "targetState");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v31)
    {
      if (v32)
      {
        objc_msgSend(v32, "geometry");
        v34 = v64;
        v35 = v63;
      }
      else
      {
        v35 = 0.0;
        v34 = 0.0;
      }
    }
    else if (v32)
    {
      objc_msgSend(v32, "geometry");
      v34 = *((double *)&v55 + 1);
      v35 = *(double *)&v55;
    }
    else
    {
      v62 = 0;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v35 = 0.0;
      v34 = 0.0;
      v55 = 0u;
    }

    -[UIPeripheralHost view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "window");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreen convertRect:fromView:](UIScreen, "convertRect:fromView:", v37, v35 - v9 * 0.5, v34 - v8 * 0.5, v9, v8);
    v23 = v38;
    v25 = v39;
    v27 = v40;
    v29 = v41;

  }
  else
  {
    -[UIPeripheralHost view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[UIPeripheralHost view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[UIPeripheralHost view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIScreen convertRect:fromView:](UIScreen, "convertRect:fromView:", v21, v14, v16, v18, v20);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;

    }
    else
    {
      v23 = *MEMORY[0x1E0C9D628];
      v25 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v27 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v29 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
  }
  +[UIScreen mainScreen](UIScreen, "mainScreen", v55, v56, v57, v58, v59, v60, v61, v62);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bounds");
  v70.origin.x = v43;
  v70.origin.y = v44;
  v70.size.width = v45;
  v70.size.height = v46;
  v67.origin.x = v23;
  v67.origin.y = v25;
  v67.size.width = v27;
  v67.size.height = v29;
  v68 = CGRectIntersection(v67, v70);
  x = v68.origin.x;
  y = v68.origin.y;
  width = v68.size.width;
  height = v68.size.height;

  v51 = x;
  v52 = y;
  v53 = width;
  v54 = height;
  result.size.height = v54;
  result.size.width = v53;
  result.origin.y = v52;
  result.origin.x = v51;
  return result;
}

+ (BOOL)inputViewSetContainsView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerRootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "inputViewSetContainsView:", v3);

  return v6;
}

+ (CGRect)visibleInputViewFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isUndocked"))
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    objc_msgSend(v2, "containerRootController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visibleInputViewFrame");
    v3 = v8;
    v4 = v9;
    v5 = v10;
    v6 = v11;

  }
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v15 = v6;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (id)allVisiblePeripheralFrames
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD aBlock[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerRootController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v18 = v2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__UIPeripheralHost_UIKitInternal__allVisiblePeripheralFrames__block_invoke;
    aBlock[3] = &unk_1E16D7230;
    v17 = v4;
    v26 = v17;
    v6 = _Block_copy(aBlock);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v3, "hosting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allHostingItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v19[0] = v5;
          v19[1] = 3221225472;
          v19[2] = __61__UIPeripheralHost_UIKitInternal__allVisiblePeripheralFrames__block_invoke_2;
          v19[3] = &unk_1E16D7258;
          v14 = v6;
          v19[4] = v13;
          v20 = v14;
          objc_msgSend(v13, "enumerateBoundingRects:", v19, v17);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v10);
    }

    v15 = v17;
    v2 = v18;
  }
  else
  {
    v15 = (id)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

void __61__UIPeripheralHost_UIKitInternal__allVisiblePeripheralFrames__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double x;
  double y;
  double width;
  double height;
  void *v37;
  void *v38;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  objc_msgSend(a2, "hostView");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "convertRect:toView:", 0, a3, a4, a5, a6);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v39, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertRect:toWindow:", 0, v12, v14, v16, v18);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v43.origin.x = v29;
  v43.origin.y = v30;
  v43.size.width = v31;
  v43.size.height = v32;
  v40.origin.x = v21;
  v40.origin.y = v23;
  v40.size.width = v25;
  v40.size.height = v27;
  v41 = CGRectIntersection(v40, v43);
  x = v41.origin.x;
  y = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;

  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  if (!CGRectIsEmpty(v42))
  {
    v37 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v38);

  }
}

uint64_t __61__UIPeripheralHost_UIKitInternal__allVisiblePeripheralFrames__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BOOL)pointIsWithinKeyboardContent:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fixedCoordinateSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerRootController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "inputViewSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "visibleFrame");
    objc_msgSend(v7, "convertRect:fromCoordinateSpace:", v6);
    v14.x = x;
    v14.y = y;
    v12 = CGRectContainsPoint(v15, v14);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)minimumOffsetForBuffer:(double)a3
{
  double v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v3 = a3;
  if (a3 == 0.0)
  {
    -[UIPeripheralHost containerWindow](self, "containerWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusBarHeight");
    v3 = v7;

  }
  -[UIPeripheralHost containerWindow](self, "containerWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  -[UIPeripheralHost totalPeripheralSizeForOrientation:](self, "totalPeripheralSizeForOrientation:", +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation"));
  return -(v10 - v11 - v3);
}

- (CGPoint)adjustedPersistentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  if (+[UIKeyboardImpl rivenTranslationPreference](UIKeyboardImpl, "rivenTranslationPreference"))
  {
    +[UIKeyboardImpl persistentOffset](UIKeyboardImpl, "persistentOffset");
    v4 = v3;
    -[UIPeripheralHost minimumOffsetForBuffer:](self, "minimumOffsetForBuffer:", 92.0);
    if (v4 >= v5)
      v6 = v4;
    else
      v6 = v5;
    v7 = 0.0;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)setUndockedWithOffset:(CGPoint)a3 animated:(BOOL)a4
{
  uint64_t v4;
  double y;
  double x;
  int v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  LODWORD(v4) = a4;
  y = a3.y;
  x = a3.x;
  v8 = 1;
  if (!+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    -[UIPeripheralHost inputViews](self, "inputViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_inputViewIsSplit");
    if (y < 0.0)
      v8 = 1;
    else
      v8 = v10;

  }
  +[UIKeyboardImpl persistentOffset](UIKeyboardImpl, "persistentOffset");
  if (y == v11)
    v4 = 0;
  else
    v4 = v4;
  self->_isTranslating = 1;
  +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", x, y);
  -[UIPeripheralHost containerWindow](self, "containerWindow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  -[UIPeripheralHost containerWindow](self, "containerWindow");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;

  if (v8)
  {
    v18 = x / v14;
    v19 = -y / v17;
    if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    {
      +[UIPeripheralHost floatingChromeBuffer](UIPeripheralHost, "floatingChromeBuffer");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
      +[UIInputViewSetPlacementFloating placementWithUndockedOffset:chromeBuffer:floatingWidth:](UIInputViewSetPlacementFloating, "placementWithUndockedOffset:chromeBuffer:floatingWidth:", v18, v19, v21, v23, v25, v27, v28);
    }
    else
    {
      +[UIInputViewSetPlacementUndocked placementWithUndockedOffset:chromeBuffer:](UIInputViewSetPlacementUndocked, "placementWithUndockedOffset:chromeBuffer:", v18, v19, 92.0, 0.0, 0.0, 0.0);
    }
    v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIPeripheralHost inputViews](self, "inputViews");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPeripheralHost endPlacementForInputViewSet:windowScene:](UIPeripheralHost, "endPlacementForInputViewSet:windowScene:", v29, 0);
    v36 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[UIPeripheralHost containerWindow](self, "containerWindow");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "screen");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardMotionSupport supportForScreen:](UISplitKeyboardSupport, "supportForScreen:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "translateToPlacement:animated:", v36, v4);

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "currentInputMode");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v34, "isExtensionInputMode") && (objc_msgSend(v34, "isDisplayed") & 1) == 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "postInputViewControllerShouldUpdateNotification:", v34);

  }
}

+ (UIEdgeInsets)floatingChromeBuffer
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIEdgeInsets result;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputAccessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  objc_msgSend(v2, "containerWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visualModeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "windowingModeEnabled");

  if ((v10 & 1) != 0)
  {
    v11 = 140.0;
  }
  else
  {
    objc_msgSend(v7, "slideOverWindowVerticalOffset");
    v6 = v6 + v12;
    v11 = 30.0;
  }
  v13 = fmax(v11, v6);
  +[UIKeyboardImpl requestedFloatingInsets](UIKeyboardImpl, "requestedFloatingInsets");
  v15 = fmax(v14, 92.0);
  v17 = fmax(v16, 0.0);
  v19 = fmax(v13, v18);
  v21 = fmax(v20, 0.0);

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

+ (void)adjustFloatingPersistentOffsetForKeyboardSize:(CGSize)a3
{
  +[UIPeripheralHost adjustedFloatingOffsetForKeyboardSize:](UIPeripheralHost, "adjustedFloatingOffsetForKeyboardSize:", a3.width, a3.height);
  +[UIKeyboardImpl setFloatingPersistentOffset:](UIKeyboardImpl, "setFloatingPersistentOffset:");
}

+ (CGPoint)adjustedFloatingOffsetForKeyboardSize:(CGSize)a3
{
  double height;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGPoint result;

  height = a3.height;
  +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth", a3.width);
  v5 = v4;
  +[UIKeyboardImpl floatingPersistentOffset](UIKeyboardImpl, "floatingPersistentOffset");
  v7 = v6;
  v43 = v8;
  v44 = v6;
  v9 = v8;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  +[UIInputViewSetPlacementFloating frameAtOffset:keyboardSize:screenSize:](UIInputViewSetPlacementFloating, "frameAtOffset:keyboardSize:screenSize:", v7, v9, v5, height, v12, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  +[UIPeripheralHost floatingChromeBuffer](UIPeripheralHost, "floatingChromeBuffer");
  v33 = v25 + v32;
  v35 = v27 + v34;
  v37 = v29 - (v32 + v36);
  v39 = v31 - (v34 + v38);

  v41 = v44 + UIRectContainInRect(v16, v18, v20, v22, v33, v35, v37, v39) - v16;
  v42 = v43 + v40 - v18;
  result.y = v42;
  result.x = v41;
  return result;
}

+ (CGPoint)defaultUndockedOffset
{
  double v2;
  double v3;
  CGPoint result;

  +[UIKeyboardImpl defaultUndockedOffsetForFloating:](UIKeyboardImpl, "defaultUndockedOffsetForFloating:", +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"));
  result.y = v3;
  result.x = v2;
  return result;
}

+ (void)setFloating:(BOOL)a3 onCompletion:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  v5 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating") ^ v4;
  if ((_DWORD)v5 == 1)
  {
    +[UIKeyboardImpl setFloating:](UIKeyboardImpl, "setFloating:", v4);
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadPlacement");

  }
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, v5);
    v7 = v8;
  }

}

- (void)moveToPersistentOffset
{
  void *v3;
  void *v4;
  char v5;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[UIPeripheralHost inputViews](self, "inputViews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyboard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMinimized");

    if ((v5 & 1) == 0)
    {
      +[UIKeyboardImpl persistentOffset](UIKeyboardImpl, "persistentOffset");
      -[UIPeripheralHost setUndockedWithOffset:animated:](self, "setUndockedWithOffset:animated:", 0);
    }
  }
}

- (unint64_t)_clipCornersOfView:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  unint64_t v11;
  double v12;

  -[UIPeripheralHost _transientInputViews](self, "_transientInputViews", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIPeripheralHost inputViews](self, "inputViews");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "_splittableInputAccessoryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputAccessoryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v8)
    {
      objc_msgSend(v8, "leftContentViewSize");
      if (v10 == 0.0)
        v11 = 14;
      else
        v11 = 12;
      objc_msgSend(v8, "rightContentViewSize");
      if (v12 == 0.0)
        v11 |= 1uLL;
    }
    else
    {
      v11 = 12;
    }
  }
  else
  {
    v11 = 15;
  }

  return v11;
}

- (CGRect)_inputViewRectToAvoid
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect result;
  CGRect v42;

  if (-[UIPeripheralHost _isSuppressedByManualKeyboard](self, "_isSuppressedByManualKeyboard"))
  {
    +[UIPeripheralHost visiblePeripheralFrame](UIPeripheralHost, "visiblePeripheralFrame");
    x = v3;
    y = v5;
    width = v7;
    height = v9;
  }
  else
  {
    -[UIPeripheralHost inputViews](self, "inputViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputViewBounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[UIPeripheralHost inputViews](self, "inputViews");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "inputView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreen convertRect:fromView:](UIScreen, "convertRect:fromView:", v21, v13, v15, v17, v19);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    -[UIPeripheralHost containerWindow](self, "containerWindow");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "hostedFrame");
    v42.origin.x = v31;
    v42.origin.y = v32;
    v42.size.width = v33;
    v42.size.height = v34;
    v39.origin.x = v23;
    v39.origin.y = v25;
    v39.size.width = v27;
    v39.size.height = v29;
    v40 = CGRectIntersection(v39, v42);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;

  }
  v35 = x;
  v36 = y;
  v37 = width;
  v38 = height;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (double)ambiguousControlCenterActivationMargin
{
  return self->_ambiguousControlCenterActivationMargin;
}

- (BOOL)_isCoordinatingWithSystemGestures
{
  void *v3;
  void *v4;
  double v5;

  if (_UIApplicationIsExtension())
  {
    +[UIWindowScene _keyWindowScene]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_topVisibleWindowPassingTest:", &__block_literal_global_314);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return 0;
  }
  -[UIPeripheralHost ambiguousControlCenterActivationMargin](self, "ambiguousControlCenterActivationMargin");
  return v5 > 0.0 && -[UIPeripheralHost isOnScreen](self, "isOnScreen");
}

uint64_t __68__UIPeripheralHost_UIKitInternal___isCoordinatingWithSystemGestures__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "rootViewController");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v2, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v2) = objc_opt_isKindOfClass();

  return v2 & 1;
}

- (CGPoint)offHostPointForPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  int v24;
  void *v25;
  double Width;
  void *v27;
  double v28;
  double MaxY;
  double v30;
  double v31;
  CGPoint result;
  CGPoint v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  y = a3.y;
  x = a3.x;
  if (-[UIPeripheralHost isOnScreen](self, "isOnScreen"))
  {
    -[UIPeripheralHost _inputViewRectToAvoid](self, "_inputViewRectToAvoid");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIPeripheralHost transformedContainerView](self, "transformedContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreen convertRect:toView:](UIScreen, "convertRect:toView:", v14, v7, v9, v11, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v34.origin.x = v16;
    v34.origin.y = v18;
    v34.size.width = v20;
    v34.size.height = v22;
    v33.x = x;
    v33.y = y;
    if (CGRectContainsPoint(v34, v33))
    {
      -[UIPeripheralHost inputViews](self, "inputViews");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isSplit");

      if (v24)
      {
        -[UIPeripheralHost inputViews](self, "inputViews");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_leftInputViewSetFrame");
        if (x <= CGRectGetWidth(v35))
        {

        }
        else
        {
          v36.origin.x = v16;
          v36.origin.y = v18;
          v36.size.width = v20;
          v36.size.height = v22;
          Width = CGRectGetWidth(v36);
          -[UIPeripheralHost inputViews](self, "inputViews");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "_rightInputViewSetFrame");
          v28 = Width - CGRectGetWidth(v37);

          if (x < v28)
            goto LABEL_13;
        }
      }
      if (-[UIPeripheralHost isUndocked](self, "isUndocked")
        && (v38.origin.x = v16, v38.origin.y = v18, v38.size.width = v20, v38.size.height = v22, y >= CGRectGetMidY(v38)))
      {
        v40.origin.x = v16;
        v40.origin.y = v18;
        v40.size.width = v20;
        v40.size.height = v22;
        MaxY = CGRectGetMaxY(v40);
      }
      else
      {
        v39.origin.x = v16;
        v39.origin.y = v18;
        v39.size.width = v20;
        v39.size.height = v22;
        MaxY = CGRectGetMinY(v39);
      }
      y = MaxY;
    }
  }
LABEL_13:
  v30 = x;
  v31 = y;
  result.y = v31;
  result.x = v30;
  return result;
}

- (double)getVerticalOverlapForView:(id)a3 usingKeyboardInfo:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double MaxY;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v6 = a3;
  v7 = a4;
  v8 = 0.0;
  if (-[UIPeripheralHost isOnScreen](self, "isOnScreen") && !-[UIPeripheralHost isUndocked](self, "isUndocked"))
  {
    -[UIPeripheralHost inputViews](self, "inputViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "_inputViewIsSplit"))
      goto LABEL_7;
    objc_msgSend(v6, "window");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_7;
    v11 = (void *)v10;
    -[UIPeripheralHost inputViews](self, "inputViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isDescendantOfView:", v13) & 1) != 0)
    {

LABEL_7:
      goto LABEL_8;
    }
    -[UIPeripheralHost inputViews](self, "inputViews");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputAccessoryView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v6, "isDescendantOfView:", v16);

    if ((v17 & 1) == 0)
    {
      if (v7)
      {
        objc_msgSend(v7, "objectForKey:", CFSTR("UIKeyboardFrameEndUserInfoKey"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "CGRectValue");
      }
      else
      {
        -[UIPeripheralHost containerRootController](self, "containerRootController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "visibleFrame");
      }
      +[UIScreen convertRect:toView:](UIScreen, "convertRect:toView:", v6);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      v28.origin.x = v20;
      v28.origin.y = v22;
      v28.size.width = v24;
      v28.size.height = v26;
      if (!CGRectIsEmpty(v28))
      {
        objc_msgSend(v6, "bounds");
        MaxY = CGRectGetMaxY(v29);
        v30.origin.x = v20;
        v30.origin.y = v22;
        v30.size.width = v24;
        v30.size.height = v26;
        v8 = fmax(MaxY - CGRectGetMinY(v30), 0.0);
      }
    }
  }
LABEL_8:

  return v8;
}

- (BOOL)shouldUseHideNotificationForGeometry:(UIPeripheralAnimationGeometry *)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[UIPeripheralHost containerWindow](self, "containerWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[UIPeripheralHost inputViews](self, "inputViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputAccessoryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = 0;
  else
    v10 = a3->inPosition.y + a3->bounds.size.height * -0.5 >= v7;

  return v10;
}

- (void)postWillShowNotificationForGeometry:(UIPeripheralAnimationGeometry *)a3 duration:(double)a4
{
  __int128 v7;
  CGPoint inPosition;
  CGSize size;
  void *v10;
  __int128 v11;
  CGPoint v12;
  CGSize v13;
  void *v14;
  _BOOL4 v15;
  __CFString *v16;
  __CFString *v17;
  __int128 v18;
  CGPoint v19;
  CGSize v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  CGPoint outPosition;
  CGPoint v26;
  CGPoint origin;
  CGSize v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  double targetFrameHeightDelta;

  v7 = *(_OWORD *)&a3->transform.c;
  v29 = *(_OWORD *)&a3->transform.a;
  v30 = v7;
  v31 = *(_OWORD *)&a3->transform.tx;
  targetFrameHeightDelta = a3->targetFrameHeightDelta;
  inPosition = a3->inPosition;
  outPosition = a3->outPosition;
  v26 = inPosition;
  size = a3->bounds.size;
  origin = a3->bounds.origin;
  v28 = size;
  +[UIPeripheralHostState stateWithGeometry:inPositionIsDestination:](UIPeripheralHostState, "stateWithGeometry:inPositionIsDestination:", &outPosition, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPeripheralHost setTargetState:](self, "setTargetState:", v10);

  v11 = *(_OWORD *)&a3->transform.c;
  v29 = *(_OWORD *)&a3->transform.a;
  v30 = v11;
  v31 = *(_OWORD *)&a3->transform.tx;
  targetFrameHeightDelta = a3->targetFrameHeightDelta;
  v12 = a3->inPosition;
  outPosition = a3->outPosition;
  v26 = v12;
  v13 = a3->bounds.size;
  origin = a3->bounds.origin;
  v28 = v13;
  -[UIPeripheralHost userInfoFromGeometry:duration:forWill:forShow:](self, "userInfoFromGeometry:duration:forWill:forShow:", &outPosition, 1, 1, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[UIPeripheralHost userInfoContainsActualGeometryChange:](self, "userInfoContainsActualGeometryChange:", v14);
  v16 = CFSTR("UIKeyboardPrivateWillShowNotification");
  v17 = CFSTR("UIKeyboardWillShowNotification");
  v18 = *(_OWORD *)&a3->transform.c;
  v29 = *(_OWORD *)&a3->transform.a;
  v30 = v18;
  v31 = *(_OWORD *)&a3->transform.tx;
  targetFrameHeightDelta = a3->targetFrameHeightDelta;
  v19 = a3->inPosition;
  outPosition = a3->outPosition;
  v26 = v19;
  v20 = a3->bounds.size;
  origin = a3->bounds.origin;
  v28 = v20;
  if (-[UIPeripheralHost shouldUseHideNotificationForGeometry:](self, "shouldUseHideNotificationForGeometry:", &outPosition))
  {
    v21 = CFSTR("UIKeyboardPrivateWillHideNotification");

    v22 = CFSTR("UIKeyboardWillHideNotification");
    v16 = v21;
    v17 = v22;
  }
  -[UIPeripheralHost postKeyboardFrameChangeNotification:withInfo:](self, "postKeyboardFrameChangeNotification:withInfo:", CFSTR("UIKeyboardWillChangeFrameNotification"), v14);
  if (v15 && !-[UIPeripheralHost isUndocked](self, "isUndocked"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPeripheralHost _screenForFirstResponder:](self, "_screenForFirstResponder:", self->_responder);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "postNotificationName:object:userInfo:", v16, v24, v14);

    objc_msgSend(v23, "postNotificationName:object:userInfo:", v17, 0, v14);
  }

}

- (void)postDidShowNotificationForGeometry:(UIPeripheralAnimationGeometry *)a3
{
  __int128 v5;
  CGPoint inPosition;
  CGSize size;
  void *v8;
  _BOOL4 v9;
  __CFString *v10;
  __CFString *v11;
  __int128 v12;
  CGPoint v13;
  CGSize v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  CGPoint outPosition;
  CGPoint v20;
  CGPoint origin;
  CGSize v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  double targetFrameHeightDelta;

  v5 = *(_OWORD *)&a3->transform.c;
  v23 = *(_OWORD *)&a3->transform.a;
  v24 = v5;
  v25 = *(_OWORD *)&a3->transform.tx;
  targetFrameHeightDelta = a3->targetFrameHeightDelta;
  inPosition = a3->inPosition;
  outPosition = a3->outPosition;
  v20 = inPosition;
  size = a3->bounds.size;
  origin = a3->bounds.origin;
  v22 = size;
  -[UIPeripheralHost userInfoFromGeometry:duration:forWill:forShow:](self, "userInfoFromGeometry:duration:forWill:forShow:", &outPosition, 0, 1, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIPeripheralHost userInfoContainsActualGeometryChange:](self, "userInfoContainsActualGeometryChange:", v8);
  v10 = CFSTR("UIKeyboardDidShowNotification");
  v11 = CFSTR("UIKeyboardPrivateDidShowNotification");
  v12 = *(_OWORD *)&a3->transform.c;
  v23 = *(_OWORD *)&a3->transform.a;
  v24 = v12;
  v25 = *(_OWORD *)&a3->transform.tx;
  targetFrameHeightDelta = a3->targetFrameHeightDelta;
  v13 = a3->inPosition;
  outPosition = a3->outPosition;
  v20 = v13;
  v14 = a3->bounds.size;
  origin = a3->bounds.origin;
  v22 = v14;
  if (-[UIPeripheralHost shouldUseHideNotificationForGeometry:](self, "shouldUseHideNotificationForGeometry:", &outPosition))
  {
    v15 = CFSTR("UIKeyboardDidHideNotification");

    v16 = CFSTR("UIKeyboardPrivateDidHideNotification");
    v10 = v15;
    v11 = v16;
  }
  -[UIPeripheralHost postKeyboardFrameChangeNotification:withInfo:](self, "postKeyboardFrameChangeNotification:withInfo:", CFSTR("UIKeyboardDidChangeFrameNotification"), v8);
  if (v9 && !-[UIPeripheralHost isUndocked](self, "isUndocked"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPeripheralHost _screenForFirstResponder:](self, "_screenForFirstResponder:", self->_responder);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:userInfo:", v11, v18, v8);

    objc_msgSend(v17, "postNotificationName:object:userInfo:", v10, 0, v8);
  }
  -[UIPeripheralHost setTargetState:](self, "setTargetState:", 0);

}

- (void)performMultipleOperations:(id)a3 withAnimationStyle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v17 = a3;
  v6 = a4;
  if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __80__UIPeripheralHost_UIKitInternal__performMultipleOperations_withAnimationStyle___block_invoke;
    v20[3] = &unk_1E16C61C0;
    v21 = v7;
    v23 = v17;
    v22 = v6;
    v9 = v7;
    objc_msgSend(v8, "performOnControllers:", v20);

LABEL_7:
    goto LABEL_8;
  }
  -[UIPeripheralHost containerRootController](self, "containerRootController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputViewSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputView");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {

    goto LABEL_7;
  }
  v12 = (void *)v11;
  -[UIPeripheralHost containerRootController](self, "containerRootController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputViewSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isCustomInputView");

  if ((v15 & 1) == 0)
  {
    -[UIPeripheralHost containerRootController](self, "containerRootController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__UIPeripheralHost_UIKitInternal__performMultipleOperations_withAnimationStyle___block_invoke_3;
    v18[3] = &unk_1E16B2F48;
    v18[4] = self;
    v19 = v17;
    objc_msgSend(v16, "performOperations:withAnimationStyle:", v18, v6);

    v9 = v19;
    goto LABEL_7;
  }
LABEL_8:

}

void __80__UIPeripheralHost_UIKitInternal__performMultipleOperations_withAnimationStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v5, "owner");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  if (v3 && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__UIPeripheralHost_UIKitInternal__performMultipleOperations_withAnimationStyle___block_invoke_2;
    v6[3] = &unk_1E16B2F48;
    v8 = *(id *)(a1 + 48);
    v4 = v4;
    v7 = v4;
    objc_msgSend(v4, "performOperations:withAnimationStyle:", v6, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
LABEL_9:

}

uint64_t __80__UIPeripheralHost_UIKitInternal__performMultipleOperations_withAnimationStyle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__UIPeripheralHost_UIKitInternal__performMultipleOperations_withAnimationStyle___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "containerRootController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)minimize
{
  void *v2;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimize");

  return 1;
}

- (BOOL)maximize
{
  return -[UIPeripheralHost maximizeWithAnimation:](self, "maximizeWithAnimation:", 1);
}

- (BOOL)maximizeWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximizeWithAnimation:", v3);

  return 1;
}

- (void)enableKeyboardTyping
{
  void *v2;
  id v3;

  -[UIPeripheralHost inputViews](self, "inputViews");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTypingEnabled:", 1);

}

- (id)_currentInputView
{
  void *v2;
  void *v3;

  -[UIPeripheralHost inputViews](self, "inputViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isSuppressedByManualKeyboard
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;

  -[UIPeripheralHost view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[UIPeripheralHost view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isHidden");

    if (!v7)
    {
      LOBYTE(v8) = 0;
      return v8;
    }
  }
  else
  {

  }
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v8 = objc_msgSend(v9, "_isAutomaticKeyboard") ^ 1;
  else
    LOBYTE(v8) = 0;

  return v8;
}

- (BOOL)keyClicksEnabled
{
  void *v3;
  void *v4;
  char v5;

  if (_UIApplicationIsExtension())
  {
    +[UIWindowScene _keyWindowScene]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_topVisibleWindowPassingTest:", &__block_literal_global_319);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v4 != 0;
  }
  else
  {
    if (!-[UIPeripheralHost isOnScreen](self, "isOnScreen"))
      return 0;
    -[UIPeripheralHost inputViews](self, "inputViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "usesKeyClicks");
  }

  return v5;
}

uint64_t __51__UIPeripheralHost_UIKitInternal__keyClicksEnabled__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _DWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();

  if (v4 && ((v4[92] >> 1) & 3u) - 1 <= 1)
  {
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "enableInputClicksWhenVisible");

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_preserveInputViewsWithId:(id)a3 animated:(BOOL)a4 reset:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  if (!-[UIPeripheralHost _isKeyboardDeactivated](self, "_isKeyboardDeactivated"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_preserveInputViewsWithId:animated:reset:", v9, v6, v5);

  }
}

- (void)_preserveInputViewsWithId:(id)a3
{
  -[UIPeripheralHost _preserveInputViewsWithId:animated:reset:](self, "_preserveInputViewsWithId:animated:reset:", a3, 0, 0);
}

- (void)_preserveInputViewsWithId:(id)a3 animated:(BOOL)a4
{
  -[UIPeripheralHost _preserveInputViewsWithId:animated:reset:](self, "_preserveInputViewsWithId:animated:reset:", a3, a4, 1);
}

- (void)_restoreInputAccessoryViewOverrideWithId:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_restoreInputAccessoryViewOverrideWithId:", v3);

}

- (BOOL)_restoreInputViewsWithId:(id)a3 animated:(BOOL)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "_restoreInputViewsWithId:animated:", v5, v4);

  return v4;
}

- (void)_clearPreservedInputViewsWithId:(id)a3 clearKeyboard:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a4;
  v5 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_clearPreservedInputViewsWithId:clearKeyboard:", v5, v4);

}

- (void)_clearPreservedInputViewsWithRestorableResponder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_clearPreservedInputViewsWithRestorableResponder:", v3);

}

- (void)removePreservedInputViewSetForInputView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_removePreservedInputViewSetForInputView:", v3);

}

- (void)_beginDisablingAnimations
{
  void *v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_beginDisablingAnimations");

  ++self->_disableAnimationsCount;
}

- (void)_endDisablingAnimations
{
  id v2;

  --self->_disableAnimationsCount;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_endDisablingAnimations");

}

- (BOOL)isTranslating
{
  void *v2;
  char v3;

  -[UIPeripheralHost containerRootController](self, "containerRootController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTranslating");

  return v3;
}

- (void)extendKeyboardBackdropHeight:(double)a3 withDuration:(double)a4
{
  id v6;

  -[UIPeripheralHost containerRootController](self, "containerRootController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendKeyboardBackdropHeight:withDuration:", a3, a4);

}

- (void)updateInputAccessoryViewVisibility:(BOOL)a3 withDuration:(double)a4
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  -[UIPeripheralHost containerRootController](self, "containerRootController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animateAccessoryViewVisibility:withDuration:", v5, a4);

}

+ (double)gridViewRubberBandValueForValue:(double)result target:(double)a4 timeInterval:(double)a5 velocity:(double *)a6
{
  uint64_t v6;
  double v7;

  v6 = (uint64_t)a5;
  v7 = *a6;
  if (v6 >= 1)
  {
    do
    {
      v7 = (v7 + (a4 - result) * 0.00014) * 0.98;
      result = result + v7;
      --v6;
    }
    while (v6);
  }
  *a6 = v7;
  return result;
}

+ (id)passthroughViews
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inputViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "inputViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;

  }
  else
  {
    objc_msgSend(v3, "inputView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_5;
    }
  }
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v7;
}

- (id)_inheritedRenderConfig
{
  return 0;
}

- (BOOL)_isTransitioning
{
  void *v2;
  char v3;

  -[UIPeripheralHost existingContainerRootController](self, "existingContainerRootController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTransitioning");

  return v3;
}

- (BOOL)_shouldDelayRotationForWindow:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  v4 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingContainerWindow");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v6 == v4
    && -[UIPeripheralHost currentState](self, "currentState") == 2
    && -[UIPeripheralHost isRotating](self, "isRotating");

  return v7;
}

- (void)scrollView:(id)a3 didPanWithGesture:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "window");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardMotionSupport supportForScreen:](UIScrollToDismissSupport, "supportForScreen:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollView:didPanWithGesture:", v6, v5);

}

- (void)scrollView:(id)a3 didFinishPanGesture:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "window");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardMotionSupport supportForScreen:](UIScrollToDismissSupport, "supportForScreen:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollView:didFinishPanGesture:", v6, v5);

}

+ (Class)floatingAssistantBarPlacementClassSupportingCompactStyle:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  if (v3)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferencesActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "compactAssistantBarPersistentLocation");

    if (v7 == 4)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textInputView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_shouldReverseLayoutDirection");
      v4 = (void *)objc_opt_class();

    }
    else if (v7 == 5 || v7 == 6)
    {
      v4 = (void *)objc_opt_class();
    }
  }
  return (Class)v4;
}

id __75__UIPeripheralHost_UIKitInternal__endPlacementForInputViewSet_windowScene___block_invoke_334(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "keyboardWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerRootController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _UIPeripheralHostLogger();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "placement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "endPlacementForInputViewSet, deactivated return -> %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(v2, "placement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
