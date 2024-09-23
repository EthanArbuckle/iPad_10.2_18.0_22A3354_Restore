@implementation _UIKeyboardWindowScene

- (id)_fixupInheritedSettings:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  CGRect v16;
  CGRect v17;

  -[_UIScreenBasedWindowScene screen](self, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(a3, "frame");
  v17.origin.x = v6;
  v17.origin.y = v8;
  v17.size.width = v10;
  v17.size.height = v12;
  if (CGRectEqualToRect(v16, v17))
  {
    v13 = a3;
  }
  else
  {
    v14 = (void *)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);
    v13 = (id)objc_msgSend(v14, "copy");

  }
  return v13;
}

- (BOOL)_affectsScreenOrientation
{
  return 0;
}

+ (BOOL)alwaysKeepContexts
{
  return 0;
}

- (_UIKeyboardWindowScene)initWithScreen:(id)a3 session:(id)a4 lookupKey:(id)a5
{
  _UIKeyboardWindowScene *v5;
  _UIFocusSystemKeyboardSceneComponent *v6;
  _UIHomeAffordanceSceneNotifierProxy *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIKeyboardWindowScene;
  v5 = -[_UIScreenBasedWindowScene initWithScreen:session:lookupKey:](&v9, sel_initWithScreen_session_lookupKey_, a3, a4, a5);
  if (v5)
  {
    v6 = -[_UIFocusSystemSceneComponent initWithScene:]([_UIFocusSystemKeyboardSceneComponent alloc], "initWithScene:", v5);
    -[UIWindowScene _registerSceneComponent:forKey:](v5, "_registerSceneComponent:forKey:", v6, _UIFocusSystemSceneComponentKey);
    v7 = -[_UIHomeAffordanceSceneNotifierProxy initWithScene:]([_UIHomeAffordanceSceneNotifierProxy alloc], "initWithScene:", v5);
    -[UIWindowScene _registerSceneComponent:forKey:](v5, "_registerSceneComponent:forKey:", v7, CFSTR("_UIHomeAffordanceSceneNotifierComponentKey"));

  }
  return v5;
}

+ (BOOL)shouldAllowComponents
{
  return 0;
}

+ (BOOL)autoInvalidates
{
  return 0;
}

- (id)_homeAffordanceSceneNotifier
{
  int v3;
  _UIHomeAffordanceSceneNotifierProxy *v4;

  if (!_os_feature_enabled_impl())
    goto LABEL_6;
  v3 = _UIDeviceSupportsGlobalEdgeSwipeTouches();
  v4 = 0;
  if (self && v3)
  {
    if (!-[UIScene _hostsWindows](self, "_hostsWindows") || -[UIScene _hasInvalidated](self, "_hasInvalidated"))
    {
LABEL_6:
      v4 = 0;
      return v4;
    }
    -[UIScene _existingHomeAffordanceSceneNotifier](self, "_existingHomeAffordanceSceneNotifier");
    v4 = (_UIHomeAffordanceSceneNotifierProxy *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = -[_UIHomeAffordanceSceneNotifierProxy initWithScene:]([_UIHomeAffordanceSceneNotifierProxy alloc], "initWithScene:", self);
      -[UIWindowScene _registerSceneComponent:forKey:](self, "_registerSceneComponent:forKey:", v4, CFSTR("_UIHomeAffordanceSceneNotifierComponentKey"));
    }
  }
  return v4;
}

- (void)_setSettingsScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;

  v5 = a3;
  if (-[UIScene _hasSettingsScene](self, "_hasSettingsScene"))
  {
    -[UIScene _settingsScene](self, "_settingsScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)_UIKeyboardWindowScene;
  -[UIScene _setSettingsScene:](&v15, sel__setSettingsScene_, v5);
  if (-[UIScene _hasSettingsScene](self, "_hasSettingsScene"))
  {
    -[UIScene _settingsScene](self, "_settingsScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (_os_feature_enabled_impl() && _UIDeviceSupportsGlobalEdgeSwipeTouches())
  {
    v8 = v6;
    v9 = v7;
    if (v8 != v9)
    {
      v10 = v9;
      if (v8 && v9)
      {
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if ((v11 & 1) != 0)
          goto LABEL_22;
      }
      else
      {

      }
      -[_UIKeyboardWindowScene _homeAffordanceSceneNotifier](self, "_homeAffordanceSceneNotifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScreenBasedWindowScene.m"), 573, CFSTR("Invalid home affordance notifier class for scene: %@; notifier: %@"),
          self,
          v12);
        goto LABEL_19;
      }
      v13 = v12;
      if (!v13)
      {
        v12 = 0;
        goto LABEL_21;
      }
      v8 = v13;
      objc_msgSend(v10, "_homeAffordanceSceneNotifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIHomeAffordanceSceneNotifierProxy setTargetHomeAffordanceNotifier:](v8, v14);

    }
    v12 = v8;
LABEL_19:

LABEL_21:
  }
LABEL_22:

}

@end
