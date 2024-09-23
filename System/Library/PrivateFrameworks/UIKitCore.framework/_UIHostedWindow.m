@implementation _UIHostedWindow

- (_UIHostedWindow)initWithFrame:(CGRect)a3
{
  _UIHostedWindow *v3;
  _UIHostedWindow *v4;
  _UIHostedWindow *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIHostedWindow;
  v3 = -[UIWindow initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_wantsTraitPropagation = 0;
    -[UIWindow setKeepContextInBackground:](v3, "setKeepContextInBackground:", 1);
    -[UIWindow setWindowLevel:](v4, "setWindowLevel:", -1.79769313e308);
    -[UIWindow beginDisablingInterfaceAutorotation](v4, "beginDisablingInterfaceAutorotation");
    if (_UITouchAuthenticationIsEnabledForCurrentProcess())
      -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  _UIHostedWindow *v4;
  objc_super v5;

  -[UIWindow screen](self, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_focusedWindow");
  v4 = (_UIHostedWindow *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    objc_msgSend(v3, "_setFocusedWindow:", 0);
    objc_msgSend(v3, "setNeedsFocusUpdate");
  }

  v5.receiver = self;
  v5.super_class = (Class)_UIHostedWindow;
  -[UIWindow dealloc](&v5, sel_dealloc);
}

- (BOOL)_isWindowServerHostingManaged
{
  return 0;
}

- (BOOL)_canPromoteFromKeyWindowStack
{
  return 0;
}

- (unsigned)contextID
{
  void *v2;
  unsigned int v3;

  -[_UIHostedWindow hostingHandle](self, "hostingHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contextID");

  return v3;
}

- (BOOL)_extendsScreenSceneLifetime
{
  return 1;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  +[UIKeyShortcutHUDService _existingHUDService](UIKeyShortcutHUDService, "_existingHUDService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleTouchEvent:", v7);

  v11.receiver = self;
  v11.super_class = (Class)_UIHostedWindow;
  -[UIView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_updatesSafeAreaInsetsOnRead
{
  return 0;
}

- (BOOL)_preventsRootPresentationController
{
  return 0;
}

- (void)_didCreateRootPresentationController
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIHostedWindow;
  -[UIWindow _didCreateRootPresentationController](&v7, sel__didCreateRootPresentationController);
  -[UIWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE0563E8);

  if (v4)
  {
    -[UIWindow rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _rootPresentationController](self, "_rootPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setClientRemotePresentationDelegate:", v5);

  }
}

- (void)_registerScrollToTopView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_UIHostedWindow;
  v4 = a3;
  -[UIWindow _registerScrollToTopView:](&v7, sel__registerScrollToTopView_, v4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("_UIHostedWindowScrollToTopNotificationView");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("_UIHostedWindowDidRegisterScrollToTopViewNotification"), self, v6);
}

- (void)_unregisterScrollToTopView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_UIHostedWindow;
  v4 = a3;
  -[UIWindow _unregisterScrollToTopView:](&v7, sel__unregisterScrollToTopView_, v4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("_UIHostedWindowScrollToTopNotificationView");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("_UIHostedWindowDidUnregisterScrollToTopViewNotification"), self, v6);
}

- (BOOL)_needsShakesWhenInactive
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

- (void)_setHostTintAdjustmentMode:(int64_t)a3
{
  if (self->_hostTintAdjustmentMode != a3)
  {
    self->_hostTintAdjustmentMode = a3;
    -[UIView _dispatchTintColorVisitorWithReasons:](self, 2);
  }
}

- (void)_setHostTintColor:(id)a3
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  -[_UIHostedWindow _hostTintColor](self, "_hostTintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v8)
  {

  }
  else
  {
    -[_UIHostedWindow _hostTintColor](self, "_hostTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__hostTintColor, a3);
      -[UIView _dispatchTintColorVisitorWithReasons:](self, 1);
    }
  }

}

- (id)_normalInheritedTintColor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIHostedWindow;
  -[UIWindow _normalInheritedTintColor](&v8, sel__normalInheritedTintColor);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_UIHostedWindow _hostTintColor](self, "_hostTintColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (int64_t)_defaultTintAdjustmentMode
{
  objc_super v4;

  if (-[_UIHostedWindow _hostTintAdjustmentMode](self, "_hostTintAdjustmentMode"))
    return -[_UIHostedWindow _hostTintAdjustmentMode](self, "_hostTintAdjustmentMode");
  v4.receiver = self;
  v4.super_class = (Class)_UIHostedWindow;
  return -[UIView _defaultTintAdjustmentMode](&v4, sel__defaultTintAdjustmentMode);
}

- (void)_configureContextOptions:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIHostedWindow;
  -[UIWindow _configureContextOptions:](&v5, sel__configureContextOptions_, v4);
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE40], *MEMORY[0x1E0CD2A28]);
  if (_UITouchAuthenticationIsEnabledForCurrentProcess())
    objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD2A58]);

}

- (void)_didMoveFromScreen:(id)a3 toScreen:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a4;
  v7.receiver = self;
  v7.super_class = (Class)_UIHostedWindow;
  -[UIWindow _didMoveFromScreen:toScreen:](&v7, sel__didMoveFromScreen_toScreen_, a3, v6);
  if (objc_msgSend(v6, "supportsFocus"))
  {
    objc_msgSend(v6, "_setFocusedWindow:", self);
    objc_msgSend(v6, "setNeedsFocusUpdate");
  }

}

- (void)_setFirstResponder:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIHostedWindow;
  -[UIWindow _setFirstResponder:](&v6, sel__setFirstResponder_, v4);
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->__hostedWindowDelegate);
    objc_msgSend(WeakRetained, "hostedWindow:didSetFirstResponder:", self, v4);

  }
}

- (BOOL)_suppressFirstResponderWhenUserInteractionDisabled
{
  return 1;
}

- (id)_systemReferenceAngleProvider
{
  void *v3;
  int v4;
  void *v5;

  -[UIWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE056158);

  if (v4)
  {
    -[UIWindow rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)_systemReferenceAngleMode
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  -[_UIHostedWindow _systemReferenceAngleProvider](self, "_systemReferenceAngleProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "_systemReferenceAngleModeFromHost");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIHostedWindow;
    v5 = -[UIWindow _systemReferenceAngleMode](&v8, sel__systemReferenceAngleMode);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (double)_systemReferenceAngle
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  -[_UIHostedWindow _systemReferenceAngleProvider](self, "_systemReferenceAngleProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_systemReferenceAngleFromHost");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIHostedWindow;
    -[UIWindow _systemReferenceAngle](&v8, sel__systemReferenceAngle);
  }
  v6 = v5;

  return v6;
}

- (void)_updateStrictTouchVerificationIfNecessary
{
  __int128 v3;
  void *v4;
  id v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSString *hostBundleIdentifier;
  NSString *v11;
  NSString *hostSDKVersion;
  const __CFAllocator *v13;
  __int128 v14;
  __SecTask *v15;
  __SecTask *v16;
  unint64_t v17;
  NSObject *v18;
  NSString *v19;
  NSObject *v20;
  audit_token_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (_UITouchAuthenticationIsEnabledForCurrentProcess())
  {
    if (self)
    {
      v3 = *(_OWORD *)&self->_hostAuditToken.val[4];
      v23 = *(_OWORD *)self->_hostAuditToken.val;
      v24 = v3;
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
    }
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", &v23, &v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v22;
    if (v5)
    {
      v6 = _MergedGlobals_5_15;
      if (!_MergedGlobals_5_15)
      {
        v6 = __UILogCategoryGetNode("UIViewService", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&_MergedGlobals_5_15);
      }
      v7 = *(id *)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "localizedDescription");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (self)
          hostBundleIdentifier = self->__hostBundleIdentifier;
        else
          hostBundleIdentifier = 0;
        *(_DWORD *)buf = 138543618;
        v26 = v8;
        v27 = 2114;
        v28 = hostBundleIdentifier;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Unable to fetch bundle record for host audit token: %{public}@, %{public}@", buf, 0x16u);

      }
    }
    objc_msgSend(v4, "SDKVersion");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    hostSDKVersion = self->_hostSDKVersion;
    self->_hostSDKVersion = v11;

    v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v14 = *(_OWORD *)&self->_hostAuditToken.val[4];
    *(_OWORD *)v21.val = *(_OWORD *)self->_hostAuditToken.val;
    *(_OWORD *)&v21.val[4] = v14;
    v15 = SecTaskCreateWithAuditToken(v13, &v21);
    if (v15)
    {
      v16 = v15;
      self->_hostIsInternal = (SecTaskGetCodeSignStatus(v15) & 0x4000000) != 0;
      CFRelease(v16);
    }
    else
    {
      self->_hostIsInternal = 0;
      v17 = qword_1ECD7AC08;
      if (!qword_1ECD7AC08)
      {
        v17 = __UILogCategoryGetNode("UIViewService", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&qword_1ECD7AC08);
      }
      v18 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = self->__hostBundleIdentifier;
        *(_DWORD *)buf = 138543362;
        v26 = (uint64_t)v19;
        v20 = v18;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Unable to fetch task for host audit token: %{public}@", buf, 0xCu);

      }
    }

  }
}

- (BOOL)_allowsLinkPreviewInteractionInViewServices
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  CGRect v18;
  CGRect v19;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIWindow screen](self, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v19.origin.x = v12;
  v19.origin.y = v13;
  v19.size.width = v14;
  v19.size.height = v15;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v16 = CGRectContainsRect(v18, v19);

  return v16;
}

- (BOOL)_shouldPropagateTraitCollectionChanges
{
  char v2;
  UITraitCollection *hostTraitCollection;
  void *v5;
  UITraitCollection *v6;
  void *v7;

  if (self->_wantsTraitPropagation)
    return 1;
  hostTraitCollection = self->_hostTraitCollection;
  if (!hostTraitCollection)
    return 1;
  +[UITraitCollection _emptyTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITraitCollection isEqual:](hostTraitCollection, "isEqual:", v5))
  {
    v2 = 1;
  }
  else
  {
    v6 = self->_hostTraitCollection;
    +[UITraitCollection _defaultTraitCollection]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[UITraitCollection isEqual:](v6, "isEqual:", v7);

  }
  return v2;
}

- (void)_setHostTraitCollection:(id)a3
{
  id v4;
  UITraitCollection *v5;
  UITraitCollection *v6;
  BOOL v7;
  UITraitCollection *v8;

  v4 = +[_UISceneHostingTraitCollectionPropagationClientComponent modifiedTraitCollectionForHostTraitCollection:](_UISceneHostingTraitCollectionPropagationClientComponent, "modifiedTraitCollectionForHostTraitCollection:", a3);
  v5 = (UITraitCollection *)v4;
  v6 = v5;
  if (v5 != self->_hostTraitCollection)
  {
    v8 = v5;
    v7 = -[UITraitCollection isEqual:](v5, "isEqual:");
    v6 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_hostTraitCollection, v4);
      -[_UIHostedWindow _setWantsTraitPropagation:](self, "_setWantsTraitPropagation:", 1);
      -[UIWindow _updateWindowTraits](self, "_updateWindowTraits");
      -[_UIHostedWindow _setWantsTraitPropagation:](self, "_setWantsTraitPropagation:", 0);
      v6 = v8;
    }
  }

}

- (void)_updateWindowTraitsAndNotify:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[_UIHostedWindow _shouldPropagateTraitCollectionChanges](self, "_shouldPropagateTraitCollectionChanges"))
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIHostedWindow;
    -[UIWindow _updateWindowTraitsAndNotify:](&v5, sel__updateWindowTraitsAndNotify_, v3);
  }
}

- (id)_traitCollectionForSize:(CGSize)a3 parentCollection:(id)a4
{
  UITraitCollection *v4;
  uint64_t v5;
  double height;
  double width;
  id v9;
  UITraitCollection *hostTraitCollection;
  void *v11;
  UITraitCollection *v12;
  UITraitCollection *v13;
  int v14;
  UITraitCollection *v15;
  void *v16;
  UITraitCollection *v17;
  BOOL v18;
  UITraitCollection *v19;
  objc_super v21;

  height = a3.height;
  width = a3.width;
  v9 = a4;
  hostTraitCollection = self->_hostTraitCollection;
  if (!hostTraitCollection)
  {
    v14 = 0;
    goto LABEL_16;
  }
  +[UITraitCollection _emptyTraitCollection]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = hostTraitCollection;
  v13 = v11;
  if (v12 == v13)
  {
    v14 = 0;
    v4 = v12;
  }
  else
  {
    v4 = v13;
    if (v13)
    {
      v5 = -[UITraitCollection isEqual:](v12, "isEqual:", v13);

      if ((v5 & 1) != 0)
      {
        v14 = 0;
        goto LABEL_16;
      }
    }
    else
    {

    }
    v15 = self->_hostTraitCollection;
    +[UITraitCollection _defaultTraitCollection]();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;
    v17 = v16;
    if (v12 != v17)
    {
      v5 = (uint64_t)v17;
      if (v12 && v17)
      {
        v18 = -[UITraitCollection isEqual:](v12, "isEqual:", v17);

        if (v18)
        {
          v14 = 1;
          goto LABEL_16;
        }
      }
      else
      {

      }
      v19 = self->_hostTraitCollection;

LABEL_19:
      goto LABEL_20;
    }
    v14 = 1;
  }

  v5 = (uint64_t)v12;
LABEL_16:
  v21.receiver = self;
  v21.super_class = (Class)_UIHostedWindow;
  -[UIWindow _traitCollectionForSize:parentCollection:](&v21, sel__traitCollectionForSize_parentCollection_, v9, width, height);
  v19 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  if (v14)

  if (hostTraitCollection)
    goto LABEL_19;
LABEL_20:

  return v19;
}

- (id)_remoteContentParent
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[UIWindow rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (int64_t)_hostTintAdjustmentMode
{
  return self->_hostTintAdjustmentMode;
}

- (UIColor)_hostTintColor
{
  return self->__hostTintColor;
}

- (UITraitCollection)_hostTraitCollection
{
  return self->_hostTraitCollection;
}

- (BOOL)_wantsTraitPropagation
{
  return self->_wantsTraitPropagation;
}

- (void)_setWantsTraitPropagation:(BOOL)a3
{
  self->_wantsTraitPropagation = a3;
}

- (BOOL)__hostViewUnderlapsStatusBar
{
  return self->__hostViewUnderlapsStatusBar;
}

- (void)__setHostViewUnderlapsStatusBar:(BOOL)a3
{
  self->__hostViewUnderlapsStatusBar = a3;
}

- (_UIHostedWindowDelegate)_hostedWindowDelegate
{
  return (_UIHostedWindowDelegate *)objc_loadWeakRetained((id *)&self->__hostedWindowDelegate);
}

- (void)set_hostedWindowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__hostedWindowDelegate, a3);
}

- (void)_setHostBundleIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 952), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__hostBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->__hostedWindowDelegate);
  objc_storeStrong((id *)&self->_hostSDKVersion, 0);
  objc_storeStrong((id *)&self->_hostTraitCollection, 0);
  objc_storeStrong((id *)&self->__hostTintColor, 0);
}

@end
