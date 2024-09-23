@implementation UIRemoteKeyboardWindow

- (BOOL)_isWindowServerHostingManaged
{
  return 0;
}

- (BOOL)_alwaysGetsContexts
{
  return 1;
}

+ (id)remoteKeyboardWindowForScreen:(id)a3 create:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__135;
  v23 = __Block_byref_object_dispose__135;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", &unk_1E1A9B428);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 10000001.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("Level"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__UIRemoteKeyboardWindow_remoteKeyboardWindowForScreen_create___block_invoke;
  v13[3] = &unk_1E16BB1E8;
  v16 = &v19;
  v17 = a1;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v18 = a4;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __63__UIRemoteKeyboardWindow_remoteKeyboardWindowForScreen_create___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  UIInputWindowController *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  +[_UIObjectPerScreen objectOfClass:forScreen:withOptions:createIfNecessary:](_UIObjectPerScreen, "objectOfClass:forScreen:withOptions:createIfNecessary:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v5)
  {
    objc_msgSend(v5, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 64))
    {
      v12 = v6;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setHidden:", 0);
      v6 = v12;
    }
    if (!v6)
    {
      v13 = objc_alloc_init(UIInputWindowController);
      -[UIInputWindowController setShouldNotifyRemoteKeyboards:](v13, "setShouldNotifyRemoteKeyboards:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRootViewController:", v13);
      v6 = v13;
    }
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!*(_BYTE *)(v7 + 1208))
    {
      *(_BYTE *)(v7 + 1208) = 1;
      v14 = v6;
      +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rootViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __63__UIRemoteKeyboardWindow_remoteKeyboardWindowForScreen_create___block_invoke_2;
      v15[3] = &unk_1E16B1B50;
      v16 = v9;
      v17 = v14;
      v10 = v9;
      +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "performOperations:withAnimationStyle:", v15, v11);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_matchDeviceOrientation");
      v6 = v14;
    }

  }
}

- (BOOL)_matchingOptions:(id)a3
{
  return 1;
}

- (UIScreen)_intendedScreen
{
  return (UIScreen *)self->_perScreenOptions;
}

+ (BOOL)_isHostedInAnotherProcess
{
  return 0;
}

- (id)_layerForCoordinateSpaceConversion
{
  return self->super.super.super.super._transformLayer;
}

- (BOOL)_isHostedInAnotherProcess
{
  return objc_msgSend((id)objc_opt_class(), "_isHostedInAnotherProcess");
}

- (void)setWindowLevel:(double)a3
{
  int v5;
  BOOL v6;
  objc_super v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = -10000001.0;
  }
  else
  {
    v5 = dyld_program_sdk_at_least();
    v6 = a3 >= 10000001.0 || v5 == 0;
    if (!v6 && !objc_msgSend((id)UIApp, "_isSpringBoard"))
      a3 = 10000001.0;
  }
  v7.receiver = self;
  v7.super_class = (Class)UIRemoteKeyboardWindow;
  -[UIWindow setWindowLevel:](&v7, sel_setWindowLevel_, a3);
}

- (BOOL)shouldDetachBindable
{
  void *v3;
  UIRemoteKeyboardWindow *v4;
  void *keyboardSceneLayer;
  void *v6;
  void *v7;

  if (objc_msgSend((id)UIApp, "_isSpringBoard")
    && !objc_msgSend((id)UIApp, "disablesFrontBoardImplicitWindowScenes"))
  {
    LOBYTE(keyboardSceneLayer) = 0;
  }
  else
  {
    v3 = (void *)objc_opt_class();
    -[UIWindow screen](self, "screen");
    keyboardSceneLayer = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteKeyboardWindowForScreen:create:", keyboardSceneLayer, 0);
    v4 = (UIRemoteKeyboardWindow *)objc_claimAutoreleasedReturnValue();

    LOBYTE(keyboardSceneLayer) = 1;
    if (v4 != self)
    {
      if (v4)
      {
        keyboardSceneLayer = self->_keyboardSceneLayer;
        if (keyboardSceneLayer)
        {
          +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "requiredScene");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(keyboardSceneLayer) = keyboardSceneLayer != v7;

        }
      }
    }

  }
  return (char)keyboardSceneLayer;
}

- (void)detachBindable
{
  void *v3;
  FBSSceneLayer *keyboardSceneLayer;

  if (*(_QWORD *)&self->_arePlaceholdersInitialised)
  {
    -[FBSSceneLayer detachLayer:](self->_keyboardSceneLayer, "detachLayer:");
    objc_setAssociatedObject(self, &kKeyboardSceneLayer, 0, (void *)0x301);
    v3 = *(void **)&self->_arePlaceholdersInitialised;
    *(_QWORD *)&self->_arePlaceholdersInitialised = 0;

  }
  keyboardSceneLayer = self->_keyboardSceneLayer;
  self->_keyboardSceneLayer = 0;

}

- (BOOL)shouldAttachBindable
{
  void *v3;
  void *v4;
  UIRemoteKeyboardWindow *v5;
  BOOL v6;

  if (objc_msgSend((id)UIApp, "_isSpringBoard")
    && !objc_msgSend((id)UIApp, "disablesFrontBoardImplicitWindowScenes"))
  {
    return 0;
  }
  v3 = (void *)objc_opt_class();
  -[UIWindow screen](self, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteKeyboardWindowForScreen:create:", v4, 0);
  v5 = (UIRemoteKeyboardWindow *)objc_claimAutoreleasedReturnValue();

  v6 = v5 == self || LOBYTE(self->_intendedScreen) == 0;
  return v6;
}

- (void)attachBindable
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  FBSSceneLayer *v8;
  FBSSceneLayer **p_keyboardSceneLayer;
  FBSSceneLayer *keyboardSceneLayer;
  BOOL v11;
  void *v12;
  void *v13;
  FBSSceneLayer *obj;

  if (!*(_QWORD *)&self->_arePlaceholdersInitialised)
  {
    v3 = objc_alloc(MEMORY[0x1E0D23110]);
    -[UIWindow _boundContext](self, "_boundContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithTrackingContext:", v4);
    v6 = *(void **)&self->_arePlaceholdersInitialised;
    *(_QWORD *)&self->_arePlaceholdersInitialised = v5;

    objc_setAssociatedObject(self, &kKeyboardSceneLayer, *(id *)&self->_arePlaceholdersInitialised, (void *)0x301);
  }
  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requiredScene");
  obj = (FBSSceneLayer *)objc_claimAutoreleasedReturnValue();

  v8 = obj;
  p_keyboardSceneLayer = &self->_keyboardSceneLayer;
  keyboardSceneLayer = self->_keyboardSceneLayer;
  if (keyboardSceneLayer)
    v11 = obj == keyboardSceneLayer;
  else
    v11 = 1;
  if (!v11)
  {
    -[FBSSceneLayer detachLayer:](keyboardSceneLayer, "detachLayer:", *(_QWORD *)&self->_arePlaceholdersInitialised);
    v8 = obj;
  }
  objc_storeStrong((id *)&self->_keyboardSceneLayer, v8);
  -[FBSSceneLayer detachLayer:](*p_keyboardSceneLayer, "detachLayer:", *(_QWORD *)&self->_arePlaceholdersInitialised);
  if (!+[_UIRemoteKeyboards wantsUnassociatedWindowSceneForKeyboardWindow](_UIRemoteKeyboards, "wantsUnassociatedWindowSceneForKeyboardWindow"))
  {
    +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", *p_keyboardSceneLayer);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow windowScene](self, "windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setSettingsScene:", v12);

  }
  -[FBSSceneLayer attachLayer:](*p_keyboardSceneLayer, "attachLayer:", *(_QWORD *)&self->_arePlaceholdersInitialised);

}

- (int64_t)_orientationInSceneSpace
{
  objc_super v4;

  if (!objc_msgSend((id)UIApp, "isFrontBoard"))
    return self->super.super.super.super._viewOrientation;
  v4.receiver = self;
  v4.super_class = (Class)UIRemoteKeyboardWindow;
  return -[UIWindow _orientationInSceneSpace](&v4, sel__orientationInSceneSpace);
}

uint64_t __63__UIRemoteKeyboardWindow_remoteKeyboardWindowForScreen_create___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transferPlacementStateToInputWindowController:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_isRemoteKeyboardWindow
{
  return 1;
}

- (BOOL)_isTextEffectsWindowNotificationOwner
{
  return 0;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  char v6;

  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)UIApp, "isFrontBoard"))
    v5 = objc_msgSend(v4, "_overriddenInterfaceOrientation");
  else
    v5 = objc_msgSend(v4, "interfaceOrientation");
  if (v5 == a3)
    v6 = 1;
  else
    v6 = objc_msgSend(v4, "_shouldAutorotateToInterfaceOrientation:", a3);

  return v6;
}

- (id)_initBasicWithScreen:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  +[_UIRemoteKeyboards keyboardWindowSceneForScreen:create:](_UIRemoteKeyboards, "keyboardWindowSceneForScreen:create:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[_UIRemoteKeyboards wantsUnassociatedWindowSceneForKeyboardWindow](_UIRemoteKeyboards, "wantsUnassociatedWindowSceneForKeyboardWindow"))
  {
    objc_msgSend((id)UIApp, "_keyWindowForScreen:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      +[UIWindowScene _keyWindowScene]();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "screen");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 != v5)
      {

LABEL_6:
        +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      if (!v8)
        goto LABEL_6;
    }
LABEL_7:
    objc_msgSend(v6, "_setSettingsScene:", v8);

  }
  v10 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v5, "bounds");
  v15.receiver = self;
  v15.super_class = (Class)UIRemoteKeyboardWindow;
  v12 = -[UITextEffectsWindow _initWithFrame:debugName:windowScene:](&v15, sel__initWithFrame_debugName_windowScene_, 0, v6, v10, v11);
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "setPriorityLevel:", 10);

  return v13;
}

- (void)_setRotatableClient:(id)a3 toOrientation:(int64_t)a4 updateStatusBar:(BOOL)a5 duration:(double)a6 force:(BOOL)a7 isRotating:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v11;
  id v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  double v19;
  objc_super v20;

  v8 = a8;
  v9 = a7;
  v11 = a5;
  v14 = a3;
  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "snapshotting");

  if ((v16 & 1) == 0)
  {
    -[UITextEffectsWindow rootViewController](self, "rootViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "inhibitRotationAnimation");
    v19 = 0.0;
    if (!v18)
      v19 = a6;
    v20.receiver = self;
    v20.super_class = (Class)UIRemoteKeyboardWindow;
    -[UIWindow _setRotatableClient:toOrientation:updateStatusBar:duration:force:isRotating:](&v20, sel__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating_, v14, a4, v11, v9, v8, v19);

  }
}

- (id)_initWithScreen:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  id *v9;
  id *v10;
  void *v11;
  id *v12;

  v7 = a3;
  v8 = a4;
  v9 = -[UIRemoteKeyboardWindow _initBasicWithScreen:options:](self, "_initBasicWithScreen:options:", v7, v8);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setScreen:", v7);
    objc_storeStrong(v10 + 150, a3);
    objc_storeStrong(v10 + 149, a4);
    objc_msgSend(v8, "objectForKey:", 0x1E174F620);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v10 + 944) = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v10, "_commonInitWithOptions:", v8);
    objc_msgSend(v10, "_configureAlphaIfNecessary");
    v12 = v10;
  }

  return v10;
}

- (BOOL)_wantsSceneAssociation
{
  return 1;
}

- (void)_configureAlphaIfNecessary
{
  if (qword_1ECD7A2C0 != -1)
    dispatch_once(&qword_1ECD7A2C0, &__block_literal_global_77_0);
  if (byte_1ECD7A2B1)
    -[UIView setAlpha:](self, "setAlpha:", 0.8);
}

void __52__UIRemoteKeyboardWindow__configureAlphaIfNecessary__block_invoke()
{
  void *v0;
  id v1;

  if (qword_1ECD7A370 != -1)
    dispatch_once(&qword_1ECD7A370, &__block_literal_global_952);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForPreferenceKey:", CFSTR("TranslucentKeyboard"));
  v1 = (id)objc_claimAutoreleasedReturnValue();

  byte_1ECD7A2B1 = objc_msgSend(v1, "BOOLValue");
}

void __42__UIRemoteKeyboardWindow_isInternalWindow__block_invoke()
{
  void *v0;
  id v1;

  if (dyld_program_sdk_at_least())
  {
    _MergedGlobals_49 = 1;
  }
  else
  {
    if (qword_1ECD7A368 != -1)
      dispatch_once(&qword_1ECD7A368, &__block_literal_global_945);
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "valueForPreferenceKey:", CFSTR("HideRemoteKeyboardWindow"));
    v1 = (id)objc_claimAutoreleasedReturnValue();

    _MergedGlobals_49 = objc_msgSend(v1, "BOOLValue");
  }
}

- (BOOL)isInternalWindow
{
  if (qword_1ECD7A2B8 != -1)
    dispatch_once(&qword_1ECD7A2B8, &__block_literal_global_363);
  return _MergedGlobals_49;
}

- (void)invalidate
{
  +[_UIObjectPerScreen removeObject:](_UIObjectPerScreen, "removeObject:", self);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  UIRemoteKeyboardWindow *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_lostWindow:", self);

  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardWindow");
  v5 = (UIRemoteKeyboardWindow *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    v6 = (void *)objc_opt_class();
    -[UIWindow screen](self, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteKeyboardWindowForScreen:create:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_5;
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWindowEnabled:", 0);
  }
  else
  {

  }
LABEL_5:
  v9.receiver = self;
  v9.super_class = (Class)UIRemoteKeyboardWindow;
  -[UITextEffectsWindow dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardSceneLayer, 0);
  objc_storeStrong((id *)&self->_arePlaceholdersInitialised, 0);
  objc_storeStrong((id *)&self->_perScreenOptions, 0);
  objc_storeStrong((id *)&self->super._hostedViewReference.size.height, 0);
}

- (NSDictionary)_options
{
  return (NSDictionary *)*(id *)&self->super._hostedViewReference.size.height;
}

- (BOOL)_isAlwaysKeyboardWindow
{
  return 1;
}

- (BOOL)_canIgnoreInteractionEvents
{
  return 0;
}

- (BOOL)_isFullscreen
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("%@ is in a separate scene, and cannot deduce this value"), v5);

  return 1;
}

- (FBSSceneIdentityToken)activeSceneIdentity
{
  return (FBSSceneIdentityToken *)-[FBSSceneLayer identityToken](self->_keyboardSceneLayer, "identityToken");
}

- (void)_resetScene
{
  if (-[UIRemoteKeyboardWindow shouldDetachBindable](self, "shouldDetachBindable"))
    -[UIRemoteKeyboardWindow detachBindable](self, "detachBindable");
  if (-[UIRemoteKeyboardWindow shouldAttachBindable](self, "shouldAttachBindable"))
    -[UIRemoteKeyboardWindow attachBindable](self, "attachBindable");
  LOBYTE(self->_activeScene) = 0;
}

- (void)resetScene
{
  if (-[UIWindow isRotating](self, "isRotating"))
    LOBYTE(self->_activeScene) = 1;
  else
    -[UIRemoteKeyboardWindow _resetScene](self, "_resetScene");
}

- (void)endDisablingInterfaceAutorotation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIRemoteKeyboardWindow;
  -[UIWindow endDisablingInterfaceAutorotation](&v3, sel_endDisablingInterfaceAutorotation);
  if (LOBYTE(self->_activeScene))
    -[UIRemoteKeyboardWindow _resetScene](self, "_resetScene");
}

- (int64_t)_orientationForClassicPresentation
{
  return self->super.super.super.super._viewOrientation;
}

- (BOOL)isTransparentFocusItem
{
  return 1;
}

- (BOOL)_isEligibleForFocusOcclusion
{
  return 0;
}

@end
