@implementation UITextEffectsWindowHosted

- (BOOL)_isWindowServerHostingManaged
{
  return 0;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (int64_t)_orientationForViewTransform
{
  return 1;
}

- (int64_t)_orientationForRootTransform
{
  return 1;
}

- (int64_t)_orientationForSceneTransform
{
  return 1;
}

- (CGRect)actualSceneBoundsForLandscape:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  objc_super v12;
  CGRect result;

  v3 = a3;
  -[UITextEffectsWindow hostedViewSize](self, "hostedViewSize");
  v7 = v6;
  v8 = v5;
  if (v6 == *MEMORY[0x1E0C9D820] && v5 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v12.receiver = self;
    v12.super_class = (Class)UITextEffectsWindowHosted;
    -[UITextEffectsWindow actualSceneBoundsForLandscape:](&v12, sel_actualSceneBoundsForLandscape_, v3);
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)actualSceneBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  objc_super v10;
  CGRect result;

  -[UITextEffectsWindow hostedViewSize](self, "hostedViewSize");
  v5 = v4;
  v6 = v3;
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v10.receiver = self;
    v10.super_class = (Class)UITextEffectsWindowHosted;
    -[UITextEffectsWindow actualSceneBounds](&v10, sel_actualSceneBounds);
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (BOOL)_isFullscreen
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  objc_super v13;

  -[UITextEffectsWindow hostedViewSize](self, "hostedViewSize");
  v5 = v4;
  v6 = v3;
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v13.receiver = self;
    v13.super_class = (Class)UITextEffectsWindowHosted;
    return -[UITextEffectsWindow _isFullscreen](&v13, sel__isFullscreen);
  }
  else
  {
    -[UIWindow screen](self, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_boundsForInterfaceOrientation:", -[UIView _keyboardOrientation](self, "_keyboardOrientation"));
    v11 = v6 == v10 && v5 == v9;

  }
  return v11;
}

- (void)adjustTextEffectsWindowSizeIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "windowingModeEnabled");

  -[UITextEffectsWindow hostedViewSize](self, "hostedViewSize");
  if ((*(double *)(MEMORY[0x1E0C9D820] + 8) != v7 || *MEMORY[0x1E0C9D820] != v6) && v5 != 0)
  {
    -[UITextEffectsWindow hostedViewSize](self, "hostedViewSize");
    v11 = v10;
    -[UITextEffectsWindow hostedViewSize](self, "hostedViewSize");
    -[UIWindow setBounds:](self, "setBounds:", 0.0, 0.0, v11, v12);
    -[UITextEffectsWindow hostedViewOrigin](self, "hostedViewOrigin");
    v14 = v13;
    -[UITextEffectsWindow hostedViewOrigin](self, "hostedViewOrigin");
    -[UIView setOrigin:](self, "setOrigin:", v14);
  }
}

- (void)_sceneBoundsDidChange
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  objc_super v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "windowingModeEnabled");

  -[UITextEffectsWindow _sceneBounds](self, "_sceneBounds");
  v7 = v6;
  -[UITextEffectsWindow hostedViewSize](self, "hostedViewSize");
  v9 = v7 - v8;
  if (v9 <= 0.0)
    goto LABEL_5;
  -[UITextEffectsWindow hostedViewSize](self, "hostedViewSize");
  v11 = v10 == *MEMORY[0x1E0C9D820];
  if (v12 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    v11 = 0;
  if ((v11 | v5) == 1)
LABEL_5:
    v9 = 0.0;
  -[UITextEffectsWindow addBottomPadding:](self, "addBottomPadding:", v9);
  -[UITextEffectsWindowHosted adjustTextEffectsWindowSizeIfNecessary](self, "adjustTextEffectsWindowSizeIfNecessary");
  v35 = 0;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 64;
  -[UIView _notifyGeometryObserversWithChangeInfo:]((uint64_t)self, &v20);
  -[UITextEffectsWindow rootViewController](self, "rootViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "conformsToProtocol:", &unk_1EDFA6D50);

  if (v14)
  {
    -[UITextEffectsWindow rootViewController](self, "rootViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hostAppSceneBoundsChanged");

  }
  -[UITextEffectsWindow updateEditingOverlayContainer](self, "updateEditingOverlayContainer");
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "visualModeManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "windowingModeEnabled");

  if (v18)
  {
    v19.receiver = self;
    v19.super_class = (Class)UITextEffectsWindowHosted;
    -[UITextEffectsWindow _sceneBoundsDidChange](&v19, sel__sceneBoundsDidChange);
  }
}

- (BOOL)_isTextEffectsWindowHosting
{
  return 0;
}

- (BOOL)_isTextEffectsWindowNotificationOwner
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  char v8;

  -[UIWindow windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsHostingInfo hostingInfoForWindowScene:](UITextEffectsHostingInfo, "hostingInfoForWindowScene:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useHostedInstance");

  if ((v5 & 1) != 0 || (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    return 1;
  -[UIWindow windowScene](self, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isKeyWindowScene");

  return v8;
}

@end
