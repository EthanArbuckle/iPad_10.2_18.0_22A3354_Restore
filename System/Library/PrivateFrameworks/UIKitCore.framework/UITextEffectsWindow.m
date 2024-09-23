@implementation UITextEffectsWindow

- (int64_t)interfaceOrientation
{
  objc_super v3;

  if (!self->super._unknownOrientation)
    return self->super._interfaceOrientation;
  v3.receiver = self;
  v3.super_class = (Class)UITextEffectsWindow;
  return -[UIWindow interfaceOrientation](&v3, sel_interfaceOrientation);
}

- (CGRect)_sceneReferenceBounds
{
  void *v3;
  void *v4;
  int v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "windowingModeEnabled");

  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)UITextEffectsWindow;
    -[UIWindow _sceneReferenceBounds](&v23, sel__sceneReferenceBounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    -[UIWindow screen](self, "screen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_referenceBounds");
    v7 = v15;
    v9 = v16;
    v11 = v17;
    v13 = v18;

  }
  v19 = v7;
  v20 = v9;
  v21 = v11;
  v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (BOOL)isInternalWindow
{
  return 0;
}

- (id)rootViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITextEffectsWindow;
  -[UIWindow rootViewController](&v3, sel_rootViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_didRemoveSubview:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v4 = a3;
  if (!*(&self->super._unknownOrientation + 1))
  {
    v6.receiver = self;
    v6.super_class = (Class)UITextEffectsWindow;
    -[UIAutoRotatingWindow _didRemoveSubview:](&v6, sel__didRemoveSubview_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      --self->__intendedWindowScene;
      -[UITextEffectsWindow updateLastRemoteView:forView:inContainer:](self, "updateLastRemoteView:forView:inContainer:", 0, v4, self);
    }
    v5 = *(_QWORD *)&self->_inDealloc - 1;
    *(_QWORD *)&self->_inDealloc = v5;
    if (!v5 && !-[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess"))
      -[UITextEffectsWindow performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_delayHideWindow, 0, 0.1);
  }

}

+ (id)sharedTextEffectsWindowForWindowScene:(id)a3 forViewService:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  +[UIWindowScene _keyWindowScene]();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7 == v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "windows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "_isRemoteKeyboardWindow")
      && !objc_msgSend(v10, "_isHostedInAnotherProcess"))
    {
      goto LABEL_8;
    }

  }
  if (!v6)
  {
    +[UIWindowScene _keyWindowScene]();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 1;
  }
  objc_msgSend(a1, "_sharedTextEffectsWindowforWindowScene:allowHosted:forViewService:matchesStatusBarOrientationOnAccess:shouldCreateIfNecessary:", v6, 1, v4, v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v10;
}

- (CGRect)_sceneBounds
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t viewOrientation;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect result;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "windowingModeEnabled");

  if (v5)
  {
    v24.receiver = self;
    v24.super_class = (Class)UITextEffectsWindow;
    -[UIWindow _sceneBounds](&v24, sel__sceneBounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    if (_UIAppUseModernRotationAndPresentationBehaviors())
    {
      viewOrientation = self->super.super.super._viewOrientation;
      if (-[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess"))
        viewOrientation = self->super._interfaceOrientation;
      -[UIWindow screen](self, "screen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_boundsForInterfaceOrientation:", viewOrientation);
    }
    else
    {
      -[UIWindow screen](self, "screen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
    }
    v7 = v16;
    v9 = v17;
    v11 = v18;
    v13 = v19;

  }
  v20 = v7;
  v21 = v9;
  v22 = v11;
  v23 = v13;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)_shouldResizeWithScene
{
  int v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  int v19;
  _BOOL4 v20;
  NSObject *v21;
  objc_super v23;
  uint8_t buf[4];
  _BOOL4 v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  v30 = *MEMORY[0x1E0C80C00];
  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {
    v3 = 1;
  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualModeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "windowingModeEnabled");

  }
  -[UIView frame](self, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIWindow screen](self, "screen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v32.origin.x = v15;
  v32.origin.y = v16;
  v32.size.width = v17;
  v32.size.height = v18;
  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  v19 = (CGRectEqualToRect(v31, v32) | v3) ^ 1;

  if ((v3 & 1) != 0 || v19)
  {
    v23.receiver = self;
    v23.super_class = (Class)UITextEffectsWindow;
    v20 = -[UIWindow _shouldResizeWithScene](&v23, sel__shouldResizeWithScene);
  }
  else
  {
    v20 = 0;
  }
  +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    v25 = v20;
    v26 = 1024;
    v27 = v3;
    v28 = 1024;
    v29 = v19;
    _os_log_debug_impl(&dword_185066000, v21, OS_LOG_TYPE_DEBUG, "TEW _shouldResizeWithScene %d (windowingModeEnabled: %d, resizeFor: %d)", buf, 0x14u);
  }

  return v20;
}

- (BOOL)_shouldInstallRootPresentationController
{
  return 0;
}

- (void)addSubview:(id)a3
{
  id v4;
  UITextEffectsWindow *v5;
  UITextEffectsWindow *v6;
  char isKindOfClass;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (UITextEffectsWindow *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

  }
  else
  {
    v6 = v5;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      ++self->__intendedWindowScene;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UITextEffectsWindow updateLastRemoteView:forView:inContainer:](self, "updateLastRemoteView:forView:inContainer:", 1, v4, self);
  v8.receiver = self;
  v8.super_class = (Class)UITextEffectsWindow;
  -[UIView addSubview:](&v8, sel_addSubview_, v4);

}

+ (id)_sharedTextEffectsWindowforWindowScene:(id)a3 allowHosted:(BOOL)a4 forViewService:(BOOL)a5 matchesStatusBarOrientationOnAccess:(BOOL)a6 shouldCreateIfNecessary:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL8 v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  _QWORD v35[4];
  _BYTE v36[128];
  uint64_t v37;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (!v11)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v11)
    {
      v13 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v12);
          v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v15, "keyboardSceneDelegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v11 = v15;
            goto LABEL_12;
          }
        }
        v11 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

  }
  objc_msgSend(v11, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "role");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive"));

  if ((objc_msgSend((id)objc_opt_class(), "_suppressesTextEffectsWindow") & 1) != 0)
    goto LABEL_23;
  if (v10)
  {
    +[UITextEffectsHostingInfo hostingInfoForWindowScene:](UITextEffectsHostingInfo, "hostingInfoForWindowScene:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "useHostedInstance");

    if ((v21 & 1) != 0)
      v9 = 0;
  }
  v22 = objc_opt_class();
  if (!v22)
  {
LABEL_23:
    v28 = 0;
  }
  else
  {
    v23 = v22;
    v24 = v7 & ~v19;
    v34[0] = CFSTR("Level");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 10.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v25;
    v35[1] = MEMORY[0x1E0C9AAA0];
    v34[1] = CFSTR("Opaque");
    v34[2] = CFSTR("Fullscreen");
    v35[2] = MEMORY[0x1E0C9AAA0];
    v34[3] = CFSTR("ViewService");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIObjectPerCanvas objectOfClass:forCanvas:withOptions:createIfNecessary:](_UIObjectPerCanvas, "objectOfClass:forCanvas:withOptions:createIfNecessary:", v23, v11, v27, v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v28, "setWindowLevel:", -10000003.0);
    if (v8)
      objc_msgSend(v28, "_matchDeviceOrientation");

  }
  return v28;
}

- (UIWindowScene)_intendedCanvas
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_perCanvasOptions);
}

- (void)_matchDeviceOrientation
{
  -[UITextEffectsWindow updateForOrientation:](self, "updateForOrientation:", -[UIView _keyboardOrientation](self, "_keyboardOrientation"));
}

- (void)updateForOrientation:(int64_t)a3 forceResetTransform:(BOOL)a4
{
  void *v6;
  objc_super v7;

  if (self->super._interfaceOrientation == a3 && !self->super._unknownOrientation)
  {
    if (a4)
    {
      -[UIWindow setupForOrientation:](self, "setupForOrientation:", a3);
      self->super._unknownOrientation = -[UIWindow inhibitTextEffectsRotation](self, "inhibitTextEffectsRotation");
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextEffectsWindow;
    -[UIAutoRotatingWindow updateForOrientation:](&v7, sel_updateForOrientation_, a3, a4);
    self->super._interfaceOrientation = a3;
    self->super._unknownOrientation = -[UIWindow inhibitTextEffectsRotation](self, "inhibitTextEffectsRotation");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("UITextEffectsWindowDidRotateNotification"), self);

  }
}

- (void)updateForOrientation:(int64_t)a3
{
  -[UITextEffectsWindow updateForOrientation:forceResetTransform:](self, "updateForOrientation:forceResetTransform:", a3, 0);
}

- (BOOL)_matchingOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  double v10;
  float v11;
  int v12;
  int v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("Level"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("Fullscreen"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ViewService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "floatValue");
  v9 = v8;
  -[UITextEffectsWindow defaultWindowLevel](self, "defaultWindowLevel");
  if (v10 == v9
    && (objc_msgSend(v7, "floatValue"), v11 == (float)-[UITextEffectsWindow isForViewService](self, "isForViewService")))
  {
    v12 = objc_msgSend(v6, "BOOLValue");
    v13 = v12 ^ -[UITextEffectsWindow isFullscreen](self, "isFullscreen") ^ 1;
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)isForViewService
{
  return BYTE1(self->_activeEffectsCount);
}

- (BOOL)isFullscreen
{
  return self->_activeEffectsCount;
}

- (double)defaultWindowLevel
{
  return *(double *)&self->_isFullscreen;
}

- (BOOL)_isTextEffectsWindow
{
  return 1;
}

- (CGSize)keyboardScreenReferenceSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIWindow screen](self, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (id)activeTextEffectsWindowForWindowScene:(id)a3 forViewService:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _BOOL8 v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  +[UIWindowScene _keyWindowScene]();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7 == v6;

  if (!v6)
  {
    +[UIWindowScene _keyWindowScene]();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 1;
  }
  objc_msgSend(a1, "_sharedTextEffectsWindowforWindowScene:allowHosted:forViewService:matchesStatusBarOrientationOnAccess:shouldCreateIfNecessary:", v6, 1, v4, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)activeTextEffectsWindowForWindowScene:(id)a3
{
  return (id)objc_msgSend(a1, "activeTextEffectsWindowForWindowScene:forViewService:", a3, 0);
}

- (CGRect)actualSceneBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UITextEffectsWindow actualSceneFrame](self, "actualSceneFrame");
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)actualSceneFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UITextEffectsWindow actualSceneFrameForOrientation:](self, "actualSceneFrameForOrientation:", -[UITextEffectsWindow actualSceneOrientation](self, "actualSceneOrientation"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)actualSceneOrientation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;

  if (!objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    -[UIWindow _keyboardSceneSettings](self, "_keyboardSceneSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
LABEL_8:
    v8 = objc_msgSend(v6, "interfaceOrientation");
    goto LABEL_10;
  }
  objc_msgSend((id)UIApp, "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UITextEffectsWindow rootViewController](self, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _windowForAutorotationBelowWindow:](v7, self);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v5, "_windowOwnsInterfaceOrientation"))
  {
    v6 = v5;
    goto LABEL_8;
  }
  objc_msgSend(v5, "_keyboardSceneSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "interfaceOrientation");

LABEL_10:
  if (v8)
    return v8;
  else
    return -[UITextEffectsWindow interfaceOrientation](self, "interfaceOrientation");
}

+ (id)sharedTextEffectsWindowForWindowScene:(id)a3
{
  return (id)objc_msgSend(a1, "sharedTextEffectsWindowForWindowScene:forViewService:", a3, 0);
}

- (void)_updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  double v13;
  double MinY;
  double MaxY;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  if ((objc_msgSend((id)UIApp, "_isClassic") & 1) == 0)
  {
    -[UITextEffectsWindow rootViewController](self, "rootViewController");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!-[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess")
      || (objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v16, "isRotating") & 1) == 0)
    {
      -[UITextEffectsWindow actualSceneFrameForOrientation:](self, "actualSceneFrameForOrientation:", -[UITextEffectsWindow interfaceOrientation](self, "interfaceOrientation"));
      x = v17.origin.x;
      y = v17.origin.y;
      width = v17.size.width;
      height = v17.size.height;
      if (!CGRectIsEmpty(v17))
      {
        -[UIWindow _keyboardSceneSettings](self, "_keyboardSceneSettings");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "userInterfaceIdiom");

          if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          {
            +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "visualModeManager");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "shouldShowWithinAppWindow");

            v13 = 0.0;
            if ((v12 & 1) == 0)
            {
              v18.origin.x = x;
              v18.origin.y = y;
              v18.size.width = width;
              v18.size.height = height;
              MinY = CGRectGetMinY(v18);
              -[UITextEffectsWindow _sceneBounds](self, "_sceneBounds");
              MaxY = CGRectGetMaxY(v19);
              v20.origin.x = x;
              v20.origin.y = y;
              v20.size.width = width;
              v20.size.height = height;
              v13 = MinY + MaxY - CGRectGetMaxY(v20);
            }
            -[UITextEffectsWindow addBottomPadding:](self, "addBottomPadding:", v13);
          }
        }
      }
    }

  }
}

- (CGRect)actualSceneFrameForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  BOOL v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect result;

  -[UIWindow _keyboardSceneSettings](self, "_keyboardSceneSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UIWindow screen](self, "screen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_referenceBounds");
    v17 = v16;
    v19 = v18;

    v20 = v8;
    v21 = v12;
    switch(a3)
    {
      case 0:
      case 1:
        break;
      case 2:
        v20 = v17 - (v8 + v12);
        v10 = v19 - (v10 + v14);
        v21 = v12;
        break;
      case 3:
        v20 = v10;
        v10 = v17 - (v8 + v12);
        goto LABEL_14;
      case 4:
        v20 = v19 - (v10 + v14);
        v10 = v8;
LABEL_14:
        v21 = v14;
        v14 = v12;
        break;
      default:
        v20 = *MEMORY[0x1E0C9D628];
        v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v21 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        break;
    }
  }
  else if (!-[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess")
         || ((-[UITextEffectsWindow hostedViewSize](self, "hostedViewSize"), v23 == *MEMORY[0x1E0C9D820])
           ? (v24 = v22 == *(double *)(MEMORY[0x1E0C9D820] + 8))
           : (v24 = 0),
             v24))
  {
    -[UIView bounds](self, "bounds");
    v20 = v29;
    v10 = v30;
    v21 = v31;
    v14 = v32;
  }
  else
  {
    -[UITextEffectsWindow hostedSafeInsets](self, "hostedSafeInsets");
    v20 = v25;
    -[UITextEffectsWindow hostedSafeInsets](self, "hostedSafeInsets");
    v10 = v26;
    -[UITextEffectsWindow hostedViewSize](self, "hostedViewSize");
    v21 = v27;
    -[UITextEffectsWindow hostedViewSize](self, "hostedViewSize");
    v14 = v28;
  }

  v33 = v20;
  v34 = v10;
  v35 = v21;
  v36 = v14;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (id)_initWithCanvas:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id *v9;
  void *v10;
  void *v11;
  id *v12;

  v6 = a3;
  v7 = a4;
  v8 = -[UITextEffectsWindow _initBasicWithCanvas:options:](self, "_initBasicWithCanvas:options:", v6, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(v8 + 123, v6);
    objc_storeStrong(v9 + 122, a4);
    objc_msgSend(v7, "objectForKey:", CFSTR("Fullscreen"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v9 + 944) = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v7, "objectForKey:", CFSTR("ViewService"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v9 + 945) = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v9, "_commonInitWithOptions:", v7);
    v12 = v9;
  }

  return v9;
}

- (void)_commonInitWithOptions:(id)a3
{
  void *v4;
  float v5;
  double v6;
  void *v7;
  UIInputWindowController *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  UIEditingOverlayViewController *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "objectForKey:", CFSTR("Level"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  objc_msgSend(v19, "objectForKey:", CFSTR("Opaque"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  -[UIWindow setWindowLevel:](self, "setWindowLevel:", v6);
  -[UITextEffectsWindow setDefaultWindowLevel:](self, "setDefaultWindowLevel:", v6);
  if (v7)
    -[UIView setOpaque:](self, "setOpaque:", objc_msgSend(v7, "BOOLValue"));
  -[UIWindow setHidden:](self, "setHidden:", 0);
  v8 = objc_alloc_init(UIInputWindowController);
  objc_msgSend(v19, "objectForKey:", CFSTR("Notify"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    -[UIInputWindowController setShouldNotifyRemoteKeyboards:](v8, "setShouldNotifyRemoteKeyboards:", objc_msgSend(v9, "BOOLValue"));
  -[UIWindow setRootViewController:](self, "setRootViewController:", v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_perCanvasOptions);
  objc_msgSend(WeakRetained, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_userInterfaceIdiom");

  if (v13 != 3 && !BYTE1(self->_activeEffectsCount))
  {
    v14 = (void *)objc_opt_class();
    if ((objc_msgSend(v14, "isEqual:", objc_opt_class()) & 1) != 0
      || (v15 = (void *)objc_opt_class(), objc_msgSend(v15, "isEqual:", objc_opt_class())))
    {
      v16 = objc_alloc_init(UIEditingOverlayViewController);
      v17 = *(void **)&self->_manualHostingOverride;
      *(_QWORD *)&self->_manualHostingOverride = v16;

      -[UITextEffectsWindow rootViewController](self, "rootViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "presentViewController:", *(_QWORD *)&self->_manualHostingOverride);

    }
  }

}

- (void)setDefaultWindowLevel:(double)a3
{
  *(double *)&self->_isFullscreen = a3;
}

- (id)_initBasicWithCanvas:(id)a3 options:(id)a4
{
  double v5;
  double v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;

  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v7 = a3;
  objc_msgSend(v7, "coordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  v13 = -[UITextEffectsWindow _initWithFrame:debugName:windowScene:](self, "_initWithFrame:debugName:windowScene:", 0, v7, v5, v6, v10, v12);
  v14 = v13;
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setPriorityLevel:", 5);
    objc_msgSend(v15, "_adjustFramePositionIfNecessary");
  }

  return v15;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 windowScene:(id)a5
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITextEffectsWindow;
  v5 = -[UIAutoRotatingWindow _initWithFrame:debugName:windowScene:](&v8, sel__initWithFrame_debugName_windowScene_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "_commonTextEffectsInit");
  return v6;
}

- (void)_commonTextEffectsInit
{
  *(_QWORD *)&self->_inDealloc = 0;
  *(_QWORD *)&self->_isFullscreen = 0x4024000000000000;
  -[UIApplicationRotationFollowingWindow setLimitToWindowLevel:](self, "setLimitToWindowLevel:", 1);
}

- (void)_configureContextOptions:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UITextEffectsWindow;
  -[UIWindow _configureContextOptions:](&v5, sel__configureContextOptions_, v4);
  if (-[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess"))
    objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE40], *MEMORY[0x1E0CD2A28]);

}

- (void)didAddSubview:(id)a3
{
  objc_super v4;

  if (!*(&self->super._unknownOrientation + 1))
  {
    v4.receiver = self;
    v4.super_class = (Class)UITextEffectsWindow;
    -[UIView didAddSubview:](&v4, sel_didAddSubview_, a3);
    if (!*(_QWORD *)&self->_inDealloc || -[UIView isHidden](self, "isHidden"))
    {
      -[UIWindow setBecomeKeyOnOrderFront:](self, "setBecomeKeyOnOrderFront:", 0);
      -[UIWindow orderFront:](self, "orderFront:", 0);
    }
    -[UITextEffectsWindow sortSubviews](self, "sortSubviews");
    ++*(_QWORD *)&self->_inDealloc;
  }
}

- (void)_sortSubviewsOfView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "sortUsingSelector:", sel_compareTextEffectsOrdering_);
  objc_msgSend(v6, "setSublayers:", v5);
  objc_msgSend(v3, "_invalidateSubviewCache");

}

- (void)sortSubviews
{
  -[UITextEffectsWindow _sortSubviewsOfView:](self, "_sortSubviewsOfView:", self);
}

- (BOOL)_isRemoteKeyboardWindow
{
  return 0;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  objc_super v6;

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UITextEffectsWindow;
  return -[UIApplicationRotationFollowingWindow _shouldAutorotateToInterfaceOrientation:](&v6, sel__shouldAutorotateToInterfaceOrientation_, a3);
}

+ (BOOL)_isSecure
{
  return 1;
}

- (void)_sceneBoundsDidChange
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v12;

  LOBYTE(self->_bottomConstraint) = 1;
  v12.receiver = self;
  v12.super_class = (Class)UITextEffectsWindow;
  -[UIWindow _sceneBoundsDidChange](&v12, sel__sceneBoundsDidChange);
  -[UITextEffectsWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UITextEffectsWindow rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostAppSceneBoundsChanged");

  }
  -[UITextEffectsWindow _updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight](self, "_updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight");
  -[UITextEffectsWindow updateEditingOverlayContainer](self, "updateEditingOverlayContainer");
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visualModeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "windowingModeEnabled");

  if (v8)
  {
    -[UITextEffectsWindow rootViewController](self, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[UITextEffectsWindow rootViewController](self, "rootViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hostAppSceneBoundsChanged");

    }
  }
  LOBYTE(self->_bottomConstraint) = 0;
}

- (void)_updateTransformLayer
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  char v16;
  void *v17;
  objc_super v18;

  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v18.receiver = self;
  v18.super_class = (Class)UITextEffectsWindow;
  -[UIWindow _updateTransformLayer](&v18, sel__updateTransformLayer);
  -[UIView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  if (v6 != v12 || v8 != v14)
  {
    -[UITextEffectsWindow rootViewController](self, "rootViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[UITextEffectsWindow rootViewController](self, "rootViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hostAppSceneBoundsChanged");

    }
  }
  -[UITextEffectsWindow updateEditingOverlayContainer](self, "updateEditingOverlayContainer");
}

- (void)updateEditingOverlayContainer
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[UIWindow traitCollection](self, "traitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInterfaceIdiom") == 3)
  {

    return;
  }
  v3 = (void *)objc_opt_class();
  if ((objc_msgSend(v3, "isEqual:", objc_opt_class()) & 1) != 0)
  {

  }
  else
  {
    v4 = objc_opt_class();
    LOBYTE(v4) = objc_msgSend((id)v4, "isEqual:", objc_opt_class());

    if ((v4 & 1) == 0)
      return;
  }
  v5 = *(void **)&self->_manualHostingOverride;
  if (v5)
    objc_msgSend(v5, "updateEditingOverlayContainer");
}

- (CGRect)convertRect:(CGRect)a3 toWindow:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
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
  objc_super v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
  {
    objc_msgSend(v9, "_hostingWindow");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v9;
    v13 = v12;

  }
  else
  {
    v13 = v9;
  }
  -[UITextEffectsWindow _forHostedProcessConvertRect:forWindow:wasFromWindow:](self, "_forHostedProcessConvertRect:forWindow:wasFromWindow:", v13, 0, x, y, width, height);
  v26.receiver = self;
  v26.super_class = (Class)UITextEffectsWindow;
  -[UIWindow convertRect:toWindow:](&v26, sel_convertRect_toWindow_, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)_forHostedProcessConvertRect:(CGRect)a3 forWindow:(id)a4 wasFromWindow:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  -[UITextEffectsWindow _forHostedProcessConvertPoint:forWindow:wasFromWindow:](self, "_forHostedProcessConvertPoint:forWindow:wasFromWindow:", a4, a5, a3.origin.x, a3.origin.y);
  v9 = width;
  v10 = height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGPoint)_forHostedProcessConvertPoint:(CGPoint)a3 forWindow:(id)a4 wasFromWindow:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  if ((objc_msgSend(a4, "_isTextEffectsWindow") & 1) == 0)
  {
    -[UITextEffectsWindow hostedViewOrigin](self, "hostedViewOrigin");
    v10 = v9;
    -[UITextEffectsWindow hostedViewOrigin](self, "hostedViewOrigin");
    v12 = -v11;
    v13 = -v10;
    if (v5)
      v13 = v10;
    x = x + v13;
    if (v5)
      v12 = v11;
    y = y + v12;
  }
  v14 = x;
  v15 = y;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)hostedViewOrigin
{
  double defaultWindowLevel;
  double x;
  CGPoint result;

  defaultWindowLevel = self->_defaultWindowLevel;
  x = self->_hostedViewOrigin.x;
  result.y = x;
  result.x = defaultWindowLevel;
  return result;
}

- (void)_setWindowLevel:(double)a3
{
  double v5;
  unint64_t v6;
  unint64_t activeRemoteViewCount;
  unint64_t v8;

  -[UIWindow windowLevel](self, "windowLevel");
  if (v5 != a3)
  {
    if (self->__intendedWindowScene && (v6 = self->_activeRemoteViewCount, v6 != 5))
    {
      if (v6 <= 4)
      {
        -[UIWindow windowLevel](self, "windowLevel");
        activeRemoteViewCount = self->_activeRemoteViewCount;
        self->_activeRemoteViewCount = activeRemoteViewCount + 1;
        *(&self->_windowLevelCount + activeRemoteViewCount) = v8;
      }
    }
    else
    {
      self->_activeRemoteViewCount = 0;
    }
    -[UIWindow setWindowLevel:](self, "setWindowLevel:", a3);
  }
}

- (CGRect)convertRect:(CGRect)a3 fromWindow:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
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
  objc_super v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
  {
    objc_msgSend(v9, "_hostingWindow");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v9;
    v13 = v12;

  }
  else
  {
    v13 = v9;
  }
  -[UITextEffectsWindow _forHostedProcessConvertRect:forWindow:wasFromWindow:](self, "_forHostedProcessConvertRect:forWindow:wasFromWindow:", v13, 1, x, y, width, height);
  v26.receiver = self;
  v26.super_class = (Class)UITextEffectsWindow;
  -[UIWindow convertRect:fromWindow:](&v26, sel_convertRect_fromWindow_, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (BOOL)_shouldSoftAssertOnSetScreen
{
  return 0;
}

- (void)dealloc
{
  objc_super v2;

  *(&self->super._unknownOrientation + 1) = 1;
  v2.receiver = self;
  v2.super_class = (Class)UITextEffectsWindow;
  -[UIWindow dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingOverlayViewController, 0);
  objc_storeStrong((id *)&self->_manualHostingOverride, 0);
  objc_destroyWeak((id *)&self->_perCanvasOptions);
  objc_storeStrong((id *)&self->_hostedViewOrigin.y, 0);
}

- (NSDictionary)_options
{
  return (NSDictionary *)*(id *)&self->_hostedViewOrigin.y;
}

- (CGPoint)hostedWindowOffset
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  CGPoint result;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "windowingModeEnabled");

  if (v5)
  {
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[UITextEffectsWindow hostedViewOrigin](self, "hostedViewOrigin");
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)setHostedSafeInsets:(UIEdgeInsets)a3
{
  id v4;

  *(UIEdgeInsets *)&self->_hostedSceneSize.height = a3;
  -[UIView _updateSafeAreaInsets](self, "_updateSafeAreaInsets");
  -[UITextEffectsWindow rootViewController](self, "rootViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateContentOverlayInsetsForSelfAndChildren");

}

- (id)_initWithFrame:(CGRect)a3 attached:(BOOL)a4
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITextEffectsWindow;
  v4 = -[UIAutoRotatingWindow _initWithFrame:attached:](&v7, sel__initWithFrame_attached_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "_commonTextEffectsInit");
  return v5;
}

- (UITextEffectsWindow)initWithFrame:(CGRect)a3
{
  UITextEffectsWindow *v3;
  UITextEffectsWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextEffectsWindow;
  v3 = -[UIWindow initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UITextEffectsWindow _commonTextEffectsInit](v3, "_commonTextEffectsInit");
  return v4;
}

- (BOOL)enableRemoteHosting
{
  return LOBYTE(self->_hostedViewSize.height)
      || -[UIWindow _isHostedInAnotherProcess](self, "_isHostedInAnotherProcess");
}

- (void)setEnableRemoteHosting:(BOOL)a3
{
  LOBYTE(self->_hostedViewSize.height) = a3;
}

- (void)_restoreWindowLevel
{
  double v2;
  unint64_t activeRemoteViewCount;
  unint64_t v4;

  v2 = 10.0;
  if (self->__intendedWindowScene)
  {
    activeRemoteViewCount = self->_activeRemoteViewCount;
    if (activeRemoteViewCount)
    {
      v4 = activeRemoteViewCount - 1;
      self->_activeRemoteViewCount = v4;
      v2 = *((double *)&self->_windowLevelCount + v4);
    }
  }
  -[UIWindow setWindowLevel:](self, "setWindowLevel:", v2);
}

- (void)addBottomPadding:(double)a3
{
  UIEditingOverlayViewController **p_editingOverlayViewController;
  UIEditingOverlayViewController *editingOverlayViewController;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_editingOverlayViewController = &self->_editingOverlayViewController;
  editingOverlayViewController = self->_editingOverlayViewController;
  if (!editingOverlayViewController)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[UIView constraints](self, "constraints", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v11, "firstAttribute") == 4)
            objc_storeStrong((id *)p_editingOverlayViewController, v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    editingOverlayViewController = *p_editingOverlayViewController;
  }
  -[UIEditingOverlayViewController setConstant:](editingOverlayViewController, "setConstant:", -a3);
}

- (CGRect)hostedFrame
{
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
  double v15;
  CGRect result;

  -[UIView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[UITextEffectsWindow enableRemoteHosting](self, "enableRemoteHosting"))
  {
    -[UITextEffectsWindow hostedViewOrigin](self, "hostedViewOrigin");
    v10 = v10 - v11;
  }
  v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromWindow:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UITextEffectsWindow _forHostedProcessConvertPoint:forWindow:wasFromWindow:](self, "_forHostedProcessConvertPoint:forWindow:wasFromWindow:", v7, 1, x, y);
  v14.receiver = self;
  v14.super_class = (Class)UITextEffectsWindow;
  -[UIWindow convertPoint:fromWindow:](&v14, sel_convertPoint_fromWindow_, v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toWindow:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UITextEffectsWindow _forHostedProcessConvertPoint:forWindow:wasFromWindow:](self, "_forHostedProcessConvertPoint:forWindow:wasFromWindow:", v7, 0, x, y);
  v14.receiver = self;
  v14.super_class = (Class)UITextEffectsWindow;
  -[UIWindow convertPoint:toWindow:](&v14, sel_convertPoint_toWindow_, v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4
{
  double y;
  double x;
  id v7;
  UITextEffectsWindow *v8;
  UITextEffectsWindow *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UITextEffectsWindow *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend(v7, "_window");
  v8 = (UITextEffectsWindow *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7 || v8 == self)
  {
    v22.receiver = self;
    v22.super_class = (Class)UITextEffectsWindow;
    -[UIView convertPoint:toView:](&v22, sel_convertPoint_toView_, v7, x, y);
    v15 = v14;
    v17 = v16;
  }
  else
  {
    if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    {
      -[UIWindow _hostingWindow](v9, "_hostingWindow");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (void *)v10;
      else
        v12 = v9;
      v13 = v12;

    }
    else
    {
      v13 = v9;
    }
    -[UITextEffectsWindow convertPoint:toWindow:](self, "convertPoint:toWindow:", v9, x, y);
    -[UITextEffectsWindow convertPoint:toView:](v13, "convertPoint:toView:", v7);
    v15 = v18;
    v17 = v19;

  }
  v20 = v15;
  v21 = v17;
  result.y = v21;
  result.x = v20;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4
{
  double y;
  double x;
  id v7;
  UITextEffectsWindow *v8;
  UITextEffectsWindow *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UITextEffectsWindow *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend(v7, "_window");
  v8 = (UITextEffectsWindow *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7 || v8 == self)
  {
    v22.receiver = self;
    v22.super_class = (Class)UITextEffectsWindow;
    -[UIView convertPoint:fromView:](&v22, sel_convertPoint_fromView_, v7, x, y);
    v15 = v14;
    v17 = v16;
  }
  else
  {
    if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    {
      -[UIWindow _hostingWindow](v9, "_hostingWindow");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (void *)v10;
      else
        v12 = v9;
      v13 = v12;

    }
    else
    {
      v13 = v9;
    }
    -[UITextEffectsWindow convertPoint:fromView:](v9, "convertPoint:fromView:", v7, x, y);
    -[UITextEffectsWindow convertPoint:fromWindow:](self, "convertPoint:fromWindow:", v13);
    v15 = v18;
    v17 = v19;

  }
  v20 = v15;
  v21 = v17;
  result.y = v21;
  result.x = v20;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UITextEffectsWindow *v10;
  UITextEffectsWindow *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  UITextEffectsWindow *v15;
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
  double v29;
  double v30;
  double v31;
  objc_super v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  objc_msgSend(v9, "_window");
  v10 = (UITextEffectsWindow *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9 || v10 == self)
  {
    v32.receiver = self;
    v32.super_class = (Class)UITextEffectsWindow;
    -[UIView convertRect:toView:](&v32, sel_convertRect_toView_, v9, x, y, width, height);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
  }
  else
  {
    if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    {
      -[UIWindow _hostingWindow](v11, "_hostingWindow");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (void *)v12;
      else
        v14 = v11;
      v15 = v14;

    }
    else
    {
      v15 = v11;
    }
    -[UITextEffectsWindow convertRect:toWindow:](self, "convertRect:toWindow:", v15, x, y, width, height);
    -[UITextEffectsWindow convertRect:toView:](v11, "convertRect:toView:", v9);
    v17 = v24;
    v19 = v25;
    v21 = v26;
    v23 = v27;

  }
  v28 = v17;
  v29 = v19;
  v30 = v21;
  v31 = v23;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UITextEffectsWindow *v10;
  UITextEffectsWindow *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  UITextEffectsWindow *v15;
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
  double v29;
  double v30;
  double v31;
  objc_super v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  objc_msgSend(v9, "_window");
  v10 = (UITextEffectsWindow *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9 || v10 == self)
  {
    v32.receiver = self;
    v32.super_class = (Class)UITextEffectsWindow;
    -[UIView convertRect:fromView:](&v32, sel_convertRect_fromView_, v9, x, y, width, height);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
  }
  else
  {
    if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    {
      -[UIWindow _hostingWindow](v11, "_hostingWindow");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (void *)v12;
      else
        v14 = v11;
      v15 = v14;

    }
    else
    {
      v15 = v11;
    }
    -[UITextEffectsWindow convertRect:fromView:](v11, "convertRect:fromView:", v9, x, y, width, height);
    -[UITextEffectsWindow convertRect:fromWindow:](self, "convertRect:fromWindow:", v15);
    v17 = v24;
    v19 = v25;
    v21 = v26;
    v23 = v27;

  }
  v28 = v17;
  v29 = v19;
  v30 = v21;
  v31 = v23;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (double)keyboardWidthForCurrentDevice
{
  double v2;

  -[UIView bounds](self, "bounds");
  return v2;
}

- (void)becomeKeyWindow
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "UITextEffectsWindow should not become key. Please file a bug to Keyboard | iOS with this call stack: %@", buf, 0xCu);
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  v3 = becomeKeyWindow___s_category;
  if (!becomeKeyWindow___s_category)
  {
    v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&becomeKeyWindow___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)MEMORY[0x1E0CB3978];
    v6 = v4;
    objc_msgSend(v5, "callStackSymbols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "UITextEffectsWindow should not become key. Please file a bug to Keyboard | iOS with this call stack: %@", buf, 0xCu);
    goto LABEL_6;
  }
LABEL_8:
  v8.receiver = self;
  v8.super_class = (Class)UITextEffectsWindow;
  -[UIWindow becomeKeyWindow](&v8, sel_becomeKeyWindow);
}

- (void)delayHideWindow
{
  if (!*(_QWORD *)&self->_inDealloc)
    -[UIWindow setHidden:](self, "setHidden:", 1);
}

- (void)updateLastRemoteView:(BOOL)a3 forView:(id)a4 inContainer:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v6 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v8, "subviews", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reverseObjectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (v15 != v7)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v15, "setHidden:", v6);
              goto LABEL_13;
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UITextEffectsWindow;
  -[UIView layoutSubviews](&v2, sel_layoutSubviews);
}

- (void)resetTransform
{
  -[UITextEffectsWindow updateForOrientation:forceResetTransform:](self, "updateForOrientation:forceResetTransform:", -[UIView _keyboardOrientation](self, "_keyboardOrientation"), 1);
}

+ (id)sharedTextEffectsWindow
{
  return (id)objc_msgSend(a1, "sharedTextEffectsWindowForScreen:", 0);
}

+ (id)_canvasForScreen:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "screen");
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9 == v3)
        {
          v5 = v8;
          goto LABEL_13;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

+ (id)sharedTextEffectsWindowForScreen:(id)a3
{
  id v4;
  id v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5 == v4;

  if (!v4)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  objc_msgSend(a1, "_canvasForScreen:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sharedTextEffectsWindowforWindowScene:allowHosted:forViewService:matchesStatusBarOrientationOnAccess:shouldCreateIfNecessary:", v7, 1, 0, v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)activeTextEffectsWindowForScreen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "_canvasForScreen:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_sharedTextEffectsWindowforWindowScene:allowHosted:forViewService:matchesStatusBarOrientationOnAccess:shouldCreateIfNecessary:", v6, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22[2] = *MEMORY[0x1E0C80C00];
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)UITextEffectsWindow;
  -[UIWindow setFrame:](&v20, sel_setFrame_, x, y, width, height);
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  if (!CGRectEqualToRect(v23, v24))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = CFSTR("UITextEffectsWindowFrameDidChangeNotificationFromFrame");
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v9, v11, v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = CFSTR("UITextEffectsWindowFrameDidChangeNotificationToFrame");
    v22[0] = v17;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("UITextEffectsWindowFrameDidChangeNotification"), self, v19);

  }
}

- (CGRect)actualSceneBoundsForLandscape:(BOOL)a3
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if (a3)
    v3 = 4;
  else
    v3 = 1;
  -[UITextEffectsWindow actualSceneFrameForOrientation:](self, "actualSceneFrameForOrientation:", v3);
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)slideOverWindowVerticalOffset
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  v3 = 0.0;
  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    if (-[UITextEffectsWindow _isTextEffectsWindow](self, "_isTextEffectsWindow"))
    {
      -[UIWindow _fbsScene]((id *)&self->super.super.super.super.super.super.isa);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[UITextEffectsWindow actualSceneFrame](self, "actualSceneFrame");
        v6 = v5;
        v8 = v7;
        if (UIRectIsDiscrete(v9, v5, v10, v7))
        {
          -[UIWindow screen](self, "screen");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_boundsForInterfaceOrientation:", -[UITextEffectsWindow actualSceneOrientation](self, "actualSceneOrientation"));
          v13 = v12;

          return v13 - (v6 + v8);
        }
      }
    }
  }
  return v3;
}

- (BOOL)_extendsScreenSceneLifetime
{
  return 0;
}

- (BOOL)_automaticContainerBackgroundIsGlass
{
  return 0;
}

+ (void)releaseSharedInstances
{
  +[_UIObjectPerCanvas removeObjectsOfClass:](_UIObjectPerCanvas, "removeObjectsOfClass:", a1);
}

+ (void)raiseTextEffectsWindowsForShowNotificationCenter
{
  id v2;

  objc_msgSend(a1, "sharedTextEffectsWindowForWindowScene:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWindowLevel:", 1060.0);

}

+ (void)lowerTextEffectsWindowsForHideNotificationCenter
{
  id v2;

  objc_msgSend(a1, "sharedTextEffectsWindowForWindowScene:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWindowLevel:", 10.0);

}

- (BOOL)_shouldTextEffectsWindowBeHostedForView:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[UITextEffectsWindow enableRemoteHosting](self, "enableRemoteHosting"))
  {
    v5 = 1;
  }
  else if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    objc_msgSend(v4, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_hostingWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_canActAsKeyWindowForScreen:(id)a3
{
  return 0;
}

- (BOOL)_isFullscreen
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;

  -[UIWindow _fbsScene]((id *)&self->super.super.super.super.super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    -[UIWindow screen](self, "screen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_referenceBounds");
    v12 = v8 == v11 && v6 == v10;

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)_willSnapshot
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  -[UITextEffectsWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EDFA6D50);

  if (v4)
  {
    -[UITextEffectsWindow rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willSnapshot");

  }
  v6.receiver = self;
  v6.super_class = (Class)UITextEffectsWindow;
  -[UIWindow _willSnapshot](&v6, sel__willSnapshot);
}

- (void)_didSnapshot
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextEffectsWindow;
  -[UIWindow _didSnapshot](&v6, sel__didSnapshot);
  -[UITextEffectsWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EDFA6D50);

  if (v4)
  {
    -[UITextEffectsWindow rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didSnapshot");

  }
}

- (void)setHostedViewOrigin:(CGPoint)a3
{
  *(CGPoint *)&self->_defaultWindowLevel = a3;
}

- (CGSize)hostedViewSize
{
  double v2;
  double width;
  CGSize result;

  v2 = self->_windowLevelStack[4];
  width = self->_hostedViewSize.width;
  result.height = width;
  result.width = v2;
  return result;
}

- (void)setHostedViewSize:(CGSize)a3
{
  *(CGSize *)&self->_windowLevelStack[4] = a3;
}

- (UIEdgeInsets)hostedSafeInsets
{
  double height;
  double top;
  double left;
  double bottom;
  UIEdgeInsets result;

  height = self->_hostedSceneSize.height;
  top = self->_hostedSafeInsets.top;
  left = self->_hostedSafeInsets.left;
  bottom = self->_hostedSafeInsets.bottom;
  result.right = bottom;
  result.bottom = left;
  result.left = top;
  result.top = height;
  return result;
}

- (CGRect)hostedViewReference
{
  double right;
  double x;
  double y;
  double width;
  CGRect result;

  right = self->_hostedSafeInsets.right;
  x = self->_hostedViewReference.origin.x;
  y = self->_hostedViewReference.origin.y;
  width = self->_hostedViewReference.size.width;
  result.size.height = width;
  result.size.width = y;
  result.origin.y = x;
  result.origin.x = right;
  return result;
}

- (void)setHostedViewReference:(CGRect)a3
{
  *(CGRect *)&self->_hostedSafeInsets.right = a3;
}

- (void)setHostedWindowOffset:(CGPoint)a3
{
  *(CGPoint *)&self->_sceneIsResizing = a3;
}

- (void)setHostedSceneSize:(CGSize)a3
{
  *(CGSize *)&self->_hostedWindowOffset.y = a3;
}

- (BOOL)sceneIsResizing
{
  return (BOOL)self->_bottomConstraint;
}

- (UIEditingOverlayViewController)editingOverlayViewController
{
  return *(UIEditingOverlayViewController **)&self->_manualHostingOverride;
}

@end
