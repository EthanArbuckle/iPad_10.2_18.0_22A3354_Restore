@implementation UIScreen

+ (UIScreen)mainScreen
{
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  if (qword_1ECD79948)
    return (UIScreen *)(id)qword_1ECD79948;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__114;
  v17 = __Block_byref_object_dispose__114;
  v18 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __22__UIScreen_mainScreen__block_invoke;
  v11 = &unk_1E16B14C0;
  v12 = &v13;
  v5 = v9;
  os_unfair_lock_lock((os_unfair_lock_t)&__UIScreenMutableScreensArrayAccessLock);
  v10((uint64_t)v5);

  os_unfair_lock_unlock((os_unfair_lock_t)&__UIScreenMutableScreensArrayAccessLock);
  if (!v14[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScreen.m"), 709, CFSTR("returning nil screen from mainScreen is not allowed!"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScreen.m"), 710, CFSTR("firstObject in screens array (%@) is not a UIScreen object"), v14[5]);

  }
  v6 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (UIScreen *)v6;
}

void __22__UIScreen_mainScreen__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (qword_1ECD799C0 != -1)
    dispatch_once(&qword_1ECD799C0, &__block_literal_global_820);
  v5 = (id)qword_1ECD799C8;
  objc_msgSend(v5, "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)_screenForScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_screenWithFBSDisplayIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    -[UIScreen _boundsForInterfaceOrientation:](self, "_boundsForInterfaceOrientation:", -[UIScreen _interfaceOrientation](self, "_interfaceOrientation"));
  }
  else
  {
    x = self->_referenceBounds.origin.x;
    y = self->_referenceBounds.origin.y;
    width = self->_referenceBounds.size.width;
    height = self->_referenceBounds.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_boundsForInterfaceOrientation:(int64_t)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  x = self->_referenceBounds.origin.x;
  y = self->_referenceBounds.origin.y;
  width = self->_referenceBounds.size.width;
  height = self->_referenceBounds.size.height;
  if (!-[UIScreen _isExternal](self, "_isExternal") || !-[UIScreen _isMainLikeScreen](self, "_isMainLikeScreen"))
  {
    if ((unint64_t)(a3 - 3) > 1)
      goto LABEL_8;
LABEL_7:
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v9 = CGRectGetWidth(v14);
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    width = CGRectGetHeight(v15);
    height = v9;
    goto LABEL_8;
  }
  if ((unint64_t)(a3 - 3) <= 1 && (*(_DWORD *)&self->_screenFlags & 0x10000) != 0)
    goto LABEL_7;
LABEL_8:
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (BOOL)_isEmbeddedScreen
{
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FakeMainScreen, (uint64_t)CFSTR("FakeMainScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD765AC&& self->_isFakeScreen|| !self->_mainScreen)
  {
    return 0;
  }
  else
  {
    return !-[UIScreen _isExternal](self, "_isExternal");
  }
}

- (BOOL)_isExternal
{
  FBSDisplayConfiguration *v3;
  char v4;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  if (v3)
    v4 = -[FBSDisplayConfiguration isExternal](v3, "isExternal");
  else
    v4 = 1;

  return v4;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  FBSDisplayConfiguration *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  return v3;
}

- (unint64_t)_artworkSubtype
{
  return 0;
}

- (int64_t)_interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (UITraitCollection)traitCollection
{
  UITraitCollection *overrideTraitCollection;

  overrideTraitCollection = self->_overrideTraitCollection;
  if (!overrideTraitCollection)
    overrideTraitCollection = self->_defaultTraitCollection;
  return overrideTraitCollection;
}

- (CGRect)_referenceBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceBounds.origin.x;
  y = self->_referenceBounds.origin.y;
  width = self->_referenceBounds.size.width;
  height = self->_referenceBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_unjailedReferenceBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unjailedReferenceBounds.origin.x;
  y = self->_unjailedReferenceBounds.origin.y;
  width = self->_unjailedReferenceBounds.size.width;
  height = self->_unjailedReferenceBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)_userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (id)displayIdentity
{
  FBSDisplayConfiguration *v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  -[FBSDisplayConfiguration identity](v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGFloat)scale
{
  int v3;
  CGFloat result;

  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FakeMainScreen, (uint64_t)CFSTR("FakeMainScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD765AC&& self->_isFakeScreen)
  {
    v3 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD765E8, (uint64_t)CFSTR("FakeMainScreenScale"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
    result = (double)qword_1ECD765F0;
    if (v3)
      return 2.0;
  }
  else if (-[UIScreen _isMainScreen](self, "_isMainScreen"))
  {
    return _UIScreenForcedMainScreenScale(1);
  }
  else
  {
    return self->_scale;
  }
  return result;
}

- (BOOL)_isMainScreen
{
  FBSDisplayConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  if (v3)
  {
    -[FBSDisplayConfiguration identity](v3, "identity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_mainScreen)
    {
      objc_msgSend(v4, "rootIdentity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 == v5;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (double)_scale
{
  return self->_scale;
}

- (BOOL)_wantsWideContentMargins
{
  UIScreen *v3;
  char v4;
  $012B70957C36FBAE3F3275CB0B70138F screenFlags;
  int v6;
  _BOOL4 v7;
  int v8;
  int v9;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (UIScreen *)objc_claimAutoreleasedReturnValue();
  if (v3 != self)
  {

LABEL_7:
    LOBYTE(v7) = 0;
    return v7;
  }
  v4 = dyld_program_sdk_at_least();

  if ((v4 & 1) == 0)
    goto LABEL_7;
  screenFlags = self->_screenFlags;
  if ((*(_WORD *)&screenFlags & 0x800) == 0)
  {
    if (_UIDeviceNativeUserInterfaceIdiom())
    {
      MGGetBoolAnswer();
      v6 = 2048;
    }
    else
    {
      v8 = MGGetBoolAnswer();
      v9 = MGGetBoolAnswer();
      v6 = 2048;
      if (v8 && v9)
      {
        if (self->_referenceBounds.size.width <= 375.0)
          v6 = 2048;
        else
          v6 = 3072;
      }
    }
    screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&self->_screenFlags & 0xFFFFF3FF | v6);
    self->_screenFlags = screenFlags;
  }
  return (*(unsigned int *)&screenFlags >> 10) & 1;
}

- (BOOL)_isCarScreen
{
  FBSDisplayConfiguration *v3;
  char v4;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  v4 = -[FBSDisplayConfiguration isCarDisplay](v3, "isCarDisplay");

  return v4;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  UIScreen *v9;
  UIScreen *v10;
  void *v11;
  UIScreen *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (UIScreen *)a4;
  v10 = v9;
  if (v9 && v9 != self)
  {
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

LABEL_7:
      x = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIScreen _screen](v10, "_screen");
      v12 = (UIScreen *)objc_claimAutoreleasedReturnValue();

      if (v12 != self)
        goto LABEL_7;
    }
    else
    {

    }
    -[UIScreen convertRect:toCoordinateSpace:](v10, "convertRect:toCoordinateSpace:", self, x, y, width, height);
    x = v13;
    y = v14;
    width = v15;
    height = v16;
  }
LABEL_10:

  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (_UIScreenBoundingPathUtilities)_boundingPathUtilities
{
  _UIScreenBoundingPathUtilities *boundingPathUtilities;
  _UIScreenBoundingPathUtilities *v4;
  _UIScreenBoundingPathUtilities *v5;

  boundingPathUtilities = self->_boundingPathUtilities;
  if (!boundingPathUtilities)
  {
    +[_UIScreenBoundingPathUtilities boundingPathUtilitiesForScreen:](_UIScreenBoundingPathUtilities, "boundingPathUtilitiesForScreen:", self);
    v4 = (_UIScreenBoundingPathUtilities *)objc_claimAutoreleasedReturnValue();
    v5 = self->_boundingPathUtilities;
    self->_boundingPathUtilities = v4;

    boundingPathUtilities = self->_boundingPathUtilities;
  }
  return boundingPathUtilities;
}

- (int64_t)_screenType
{
  int64_t result;

  result = self->_screenType;
  if (result == -1)
  {
    result = _UIScreenTypeForScreen(self);
    self->_screenType = result;
  }
  return result;
}

- (id)fixedCoordinateSpace
{
  _UIScreenFixedCoordinateSpace *fixedCoordinateSpace;
  _UIScreenFixedCoordinateSpace *v4;
  _UIScreenFixedCoordinateSpace *v5;

  fixedCoordinateSpace = self->_fixedCoordinateSpace;
  if (!fixedCoordinateSpace)
  {
    v4 = objc_alloc_init(_UIScreenFixedCoordinateSpace);
    v5 = self->_fixedCoordinateSpace;
    self->_fixedCoordinateSpace = v4;

    -[_UIScreenFixedCoordinateSpace _setScreen:](self->_fixedCoordinateSpace, "_setScreen:", self);
    fixedCoordinateSpace = self->_fixedCoordinateSpace;
  }
  return fixedCoordinateSpace;
}

void __68__UIScreen__defaultTraitCollectionForInterfaceOrientation_inBounds___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  double v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "setUserInterfaceIdiom:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[12];
  objc_msgSend(v3, "scale");
  objc_msgSend(v19, "setDisplayScale:");
  objc_msgSend(v19, "setDisplayGamut:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v19, "setHorizontalSizeClass:", _UIUserInterfaceSizeClassForWidthAndUserInterfaceIdiomWithHomeButton(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), +[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton"), *(double *)(a1 + 64)));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v5 <= 8)
    {
      if (((1 << v5) & 0x126) != 0)
      {
        v6 = 2;
LABEL_10:
        objc_msgSend(v19, "setVerticalSizeClass:", v6);
        goto LABEL_11;
      }
      if (!v5)
      {
        v7 = *(double *)(a1 + 72);
        _UIScreenReferenceBoundsSizeForType(1uLL);
        if (v8 > v7)
          v6 = 1;
        else
          v6 = 2;
        goto LABEL_10;
      }
    }
    v6 = 0;
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "_capabilityForKey:", CFSTR("UIScreenCapabilityInteractionModelsKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setNSUIntegerValue:forTraitToken:", objc_msgSend(v9, "integerValue"), 0x1E1A99600);

  objc_msgSend(*(id *)(a1 + 32), "_capabilityForKey:", CFSTR("UIScreenCapabilityTouchLevelsKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setNSIntegerValue:forTraitToken:", objc_msgSend(v10, "integerValue"), 0x1E1A995E8);

  objc_msgSend(*(id *)(a1 + 32), "_capabilityForKey:", CFSTR("UIScreenCapabilityPrimaryInteractionModelKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setNSUIntegerValue:forTraitToken:", objc_msgSend(v11, "integerValue"), 0x1E1A99618);

  objc_msgSend(v19, "_setNSIntegerValue:forTraitToken:", objc_msgSend(*(id *)(a1 + 32), "_artworkSubtype"), 0x1E1A99630);
  objc_msgSend(v19, "setUserInterfaceStyle:", objc_msgSend(*(id *)(a1 + 32), "_effectiveUserInterfaceStyle"));
  objc_msgSend(v19, "setLayoutDirection:", objc_msgSend((id)UIApp, "userInterfaceLayoutDirection"));
  objc_msgSend(v19, "setForceTouchCapability:", objc_msgSend(*(id *)(a1 + 32), "_forceTouchCapability"));
  +[UIContentSizeCategoryPreference system](UIContentSizeCategoryPreference, "system");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 3)
  {
    +[UIContentSizeCategoryPreference system](UIContentSizeCategoryPreference, "system");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferredContentSizeCategoryCarPlay");
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  objc_msgSend(v19, "setPreferredContentSizeCategory:", v13);
  objc_msgSend(*(id *)(a1 + 32), "_traitCollectionDisplayCornerRadius");
  objc_msgSend(v19, "_setCGFloatValue:forTraitToken:", 0x1E1A99648);
  v16 = _AXSEnhanceTextLegibilityEnabled();
  if (v4 == 3)
    v16 = _AXSCarPlayEnhanceTextLegibilityEnabled();
  objc_msgSend(v19, "setLegibilityWeight:", v16 != 0);
  objc_msgSend(v19, "_setNSIntegerValue:forTraitToken:", 1, 0x1E1A99660);
  objc_msgSend(v19, "_setNSIntegerValue:forTraitToken:", 1, 0x1E1A99678);
  objc_msgSend(v19, "_setNSIntegerValue:forTraitToken:", 0, 0x1E1A99690);
  objc_msgSend(v19, "setAccessibilityContrast:", _AXDarkenSystemColors() != 0);
  objc_msgSend(v19, "_setNSIntegerValue:forTraitToken:", 0, 0x1E1A996A8);
  objc_msgSend(v19, "setUserInterfaceLevel:", 0);
  objc_msgSend(v19, "setActiveAppearance:", 1);
  objc_msgSend(v19, "_setNSIntegerValue:forTraitToken:", -1, 0x1E1A99708);
  +[_UIHDRUsageCoordinator sharedInstance]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "potentialEDRHeadroom");
  -[_UIHDRUsageCoordinator applyRangeForHeadroom:toMutableTraits:]((uint64_t)v17, v19, v18);

  objc_msgSend(v19, "_setNSIntegerValue:forTraitToken:", 0, 0x1E1A996D8);
}

- (id)_capabilityForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[UIScreen _capabilities](self, "_capabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_capabilities
{
  return (id)-[NSDictionary copy](self->_capabilities, "copy");
}

- (double)_displayCornerRadius
{
  double result;
  void *v4;
  int v5;

  if (-[UIScreen _isEmbeddedScreen](self, "_isEmbeddedScreen"))
  {
    if (_displayCornerRadius_onceToken != -1)
      dispatch_once(&_displayCornerRadius_onceToken, &__block_literal_global_215_0);
    return *(double *)&_displayCornerRadius_embeddedDisplayCornerRadius;
  }
  else
  {
    -[UIScreen displayIdentity](self, "displayIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isUIKitMainLike");

    result = 0.0;
    if (v5)
      return self->_sceneProvidedCornerRadius;
  }
  return result;
}

- (int64_t)_forceTouchCapability
{
  if (!-[UIScreen _isForceTouchCapable](self, "_isForceTouchCapable"))
    return 1;
  if (_AXSForceTouchEnabled())
    return 2;
  return 1;
}

- (BOOL)isCaptured
{
  return self->_captured;
}

- (id)_exclusionArea
{
  void *v2;
  void *v3;

  -[UIScreen _displayInfoProvider](self, "_displayInfoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exclusionArea");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_displayInfoProvider
{
  _UIDisplayInfoProviding *displayInfoProvider;
  void *v4;
  void *v5;
  _UIDisplayInfoProviding *v6;
  void *v8;
  void *v9;
  id v10;
  FBSDisplayConfiguration *v11;
  _UIDisplayInfoProviding *v12;
  _UIDisplayInfoProviding *v13;

  displayInfoProvider = self->_displayInfoProvider;
  if (!displayInfoProvider)
  {
    if (UIApplicationSceneClassicModeWantsSafeAreaInsets(+[UIApplication _classicMode](UIApplication, "_classicMode")))
    {
      objc_msgSend((id)UIApp, "isFrontBoard");
      if (!-[UIScreen _UIIBAlwaysProvidePeripheryInsets](self, "_UIIBAlwaysProvidePeripheryInsets")
        && ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ForceIOSDeviceInsets, (uint64_t)CFSTR("ForceIOSDeviceInsets"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1ECD75E3C))
      {
        +[_UIScreenInitialDisplayConfigurationLoader sharedLoader](_UIScreenInitialDisplayConfigurationLoader, "sharedLoader");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "initialDisplayContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "displayEdgeInfo");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "exclusionArea");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
          goto LABEL_14;
LABEL_10:
        _UIDisplayInfoNullProvider();
        v6 = (_UIDisplayInfoProviding *)objc_claimAutoreleasedReturnValue();
        v4 = self->_displayInfoProvider;
        self->_displayInfoProvider = v6;
LABEL_11:

        displayInfoProvider = self->_displayInfoProvider;
        return displayInfoProvider;
      }
      if (-[UIScreen _isEmbeddedScreen](self, "_isEmbeddedScreen"))
      {
        objc_msgSend(MEMORY[0x1E0DC5B80], "defaultDisplayEdgeInfoForceInsets:", (byte_1ECD75E3C != 0) & ~_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ForceIOSDeviceInsets, (uint64_t)CFSTR("ForceIOSDeviceInsets"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 0;
        if (!v4)
          goto LABEL_10;
LABEL_14:
        v10 = objc_alloc(MEMORY[0x1E0DC5BB0]);
        os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
        v11 = self->__displayConfiguration;
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
        v12 = (_UIDisplayInfoProviding *)objc_msgSend(v10, "initWithDisplayConfiguration:displayEdgeInfo:exclusionArea:", v11, v4, v5);
        v13 = self->_displayInfoProvider;
        self->_displayInfoProvider = v12;

        goto LABEL_11;
      }
    }
    v5 = 0;
    goto LABEL_10;
  }
  return displayInfoProvider;
}

- (double)_nativeScaleWithLevel:(unint64_t)a3
{
  double result;
  double v5;

  if (-[UIScreen _isMainScreen](self, "_isMainScreen", a3) || self && (*((_BYTE *)&self->_screenFlags + 2) & 1) != 0)
  {
    -[UIScreen _nativeDisplayBounds](self, "_nativeDisplayBounds");
    return v5 / self->_unjailedReferenceBounds.size.width;
  }
  else
  {
    -[UIScreen scale](self, "scale");
  }
  return result;
}

- (CGRect)_nativeDisplayBounds
{
  double v3;
  double v4;
  FBSDisplayConfiguration *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v5 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  -[FBSDisplayConfiguration pixelSize](v5, "pixelSize");
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v4;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (double)_nativeScale
{
  double result;

  -[UIScreen _nativeScaleWithLevel:](self, "_nativeScaleWithLevel:", 2);
  return result;
}

- (BOOL)_UIIBAlwaysProvidePeripheryInsets
{
  return self->__UIIBAlwaysProvidePeripheryInsets;
}

- (id)_defaultTraitCollectionForInterfaceOrientation:(int64_t)a3 inBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[10];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView _defaultInteractionTintColorForIdiom:](UIView, "_defaultInteractionTintColorForIdiom:", objc_msgSend(v10, "userInterfaceIdiom"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[UITraitCollection _traitCollectionWithTintColor:]((uint64_t)UITraitCollection, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__UIScreen__defaultTraitCollectionForInterfaceOrientation_inBounds___block_invoke;
  v15[3] = &unk_1E16CBD90;
  v15[4] = self;
  v15[5] = a3;
  *(CGFloat *)&v15[6] = x;
  *(CGFloat *)&v15[7] = y;
  *(CGFloat *)&v15[8] = width;
  *(CGFloat *)&v15[9] = height;
  objc_msgSend(v12, "traitCollectionByModifyingTraits:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_isForceTouchCapable
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = -[UIScreen _isEmbeddedScreen](self, "_isEmbeddedScreen");
  if (v2)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_supportsForceTouch");

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (id)_screenWithFBSDisplayIdentity:(id)a3
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (unint64_t)a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  _UIScreenAllScreens();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "displayIdentity", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v3))
        {

LABEL_13:
          v13 = v9;
          goto LABEL_14;
        }
        objc_msgSend(v9, "displayIdentity");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v3 | v11;

        if (!v12)
          goto LABEL_13;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v13 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_14:

  return v13;
}

+ (id)_screens
{
  void *v0;
  id v1;
  id v2;
  _QWORD v4[4];
  id v5;

  v0 = (void *)objc_opt_self();
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __20__UIScreen__screens__block_invoke;
  v4[3] = &unk_1E16CBCC8;
  v2 = v1;
  v5 = v2;
  objc_msgSend(v0, "_enumerateScreensWithBlock:", v4);

  return v2;
}

+ (void)_enumerateScreensWithBlock:(id)a3
{
  void (**v3)(id, uint64_t, char *);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t, char *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  _UIScreenAllScreens();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
      v10 = 0;
      v3[2](v3, v9, &v10);
      if (v10)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

uint64_t __20__UIScreen__screens__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (CGRect)_applicationFrameForInterfaceOrientation:(int64_t)a3 usingStatusbarHeight:(double)a4 ignoreStatusBar:(BOOL)a5
{
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  -[UIScreen _applicationFrameWithoutOverscanForInterfaceOrientation:usingStatusbarHeight:ignoreStatusBar:](self, "_applicationFrameWithoutOverscanForInterfaceOrientation:usingStatusbarHeight:ignoreStatusBar:", a3, a5, a4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (-[UIScreen overscanCompensation](self, "overscanCompensation") == UIScreenOverscanCompensationNone
    && _UIDeviceNativeUserInterfaceIdiom() != 2)
  {
    -[UIScreen overscanCompensationInsets](self, "overscanCompensationInsets");
    v7 = v7 + v14;
    v9 = v9 + v15;
    v11 = v11 - (v14 + v16);
    v13 = v13 - (v15 + v17);
  }
  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UIEdgeInsets)overscanCompensationInsets
{
  double v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  FBSDisplayConfiguration *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  int v18;
  double v19;
  int v20;
  double v21;
  int v22;
  double v23;
  double v24;
  double v25;
  UIEdgeInsets result;

  v3 = 0.0;
  if (-[UIScreen overscanCompensation](self, "overscanCompensation"))
  {
    v4 = -[UIScreen _isOverscanned](self, "_isOverscanned");
    v5 = 0.0;
    if (v4)
    {
      -[UIScreen _applicationFrameWithoutOverscanForInterfaceOrientation:usingStatusbarHeight:ignoreStatusBar:](self, "_applicationFrameWithoutOverscanForInterfaceOrientation:usingStatusbarHeight:ignoreStatusBar:", -[UIScreen _interfaceOrientation](self, "_interfaceOrientation"), 0, 0.0);
      v7 = v6;
      v9 = v8;
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
      v10 = self->__displayConfiguration;
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
      -[FBSDisplayConfiguration safeOverscanRatio](v10, "safeOverscanRatio");
      v12 = v11;
      v14 = v13;

      v15 = ceil(v7 * v12);
      v16 = ceil(v9 * v14);
      v17 = vcvtpd_s64_f64(v7 * v12);
      if (v17 >= 0)
        v18 = v17 & 1;
      else
        v18 = -(v17 & 1);
      v19 = (double)v18;
      v20 = vcvtpd_s64_f64(v9 * v14);
      v21 = v15 + v19;
      if (v20 >= 0)
        v22 = v20 & 1;
      else
        v22 = -(v20 & 1);
      v5 = (v7 - v21) * 0.5;
      v3 = (v9 - (v16 + (double)v22)) * 0.5;
    }
  }
  else
  {
    v5 = 0.0;
  }
  v23 = v3;
  v24 = v3;
  v25 = v5;
  result.right = v25;
  result.bottom = v24;
  result.left = v5;
  result.top = v23;
  return result;
}

- (UIScreenOverscanCompensation)overscanCompensation
{
  unint64_t screenFlags;
  FBSDisplayConfiguration *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  UIScreenOverscanCompensation v9;
  FBSDisplayConfiguration *v10;
  uint64_t v11;

  screenFlags = self->_screenFlags;
  if ((screenFlags & 0x80) != 0)
    return (screenFlags >> 8) & 3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v4 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "_screenRequestedOverscanCompensation");
    v8 = v7 == 2;
    if (!v7)
      v8 = 2;
    if (v7 == -1)
      v9 = UIScreenOverscanCompensationNone;
    else
      v9 = v8;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
    v10 = self->__displayConfiguration;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
    v11 = -[FBSDisplayConfiguration overscanCompensation](v10, "overscanCompensation");

    if (v11)
      v9 = (unint64_t)(v11 == 2);
    else
      v9 = UIScreenOverscanCompensationNone;
  }

  return v9;
}

- (BOOL)_isOverscanned
{
  FBSDisplayConfiguration *v3;
  char v4;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  v4 = -[FBSDisplayConfiguration isOverscanned](v3, "isOverscanned");

  return v4;
}

- (CGRect)_applicationFrameWithoutOverscanForInterfaceOrientation:(int64_t)a3 usingStatusbarHeight:(double)a4 ignoreStatusBar:(BOOL)a5
{
  _BOOL4 v5;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  char v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v5 = a5;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
    -[UIScreen _mainSceneBoundsForInterfaceOrientation:](self, "_mainSceneBoundsForInterfaceOrientation:", a3);
  else
    -[UIScreen _referenceBounds](self, "_referenceBounds");
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  if (v5)
    a4 = 0.0;
  if (-[UIScreen _userInterfaceIdiom](self, "_userInterfaceIdiom") == 3
    && +[UIScreen _shouldDisableJail](UIScreen, "_shouldDisableJail"))
  {
    +[UIStatusBar_Base heightForStyle:orientation:inWindow:](UIStatusBar, "heightForStyle:orientation:inWindow:", 400, 1, 0);
    v16 = v16 - v17;
    a4 = 0.0;
  }
  __UIStatusBarManagerForWindow(0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isStatusBarHidden");

  if ((v19 & 1) == 0 && -[UIScreen _isMainLikeScreen](self, "_isMainLikeScreen"))
  {
    if (a4 <= 0.0 && !v5)
    {
      objc_msgSend((id)UIApp, "statusBarHeightForOrientation:", a3);
      a4 = v20;
    }
    if (_UIAppUseModernRotationAndPresentationBehaviors())
    {
LABEL_15:
      v14 = v14 + a4;
LABEL_16:
      v16 = v16 - a4;
    }
    else
    {
      switch(a3)
      {
        case 1:
          goto LABEL_15;
        case 2:
          goto LABEL_16;
        case 3:
          goto LABEL_19;
        case 4:
          v13 = v13 + a4;
LABEL_19:
          v15 = v15 - a4;
          break;
        default:
          break;
      }
    }
  }
  v21 = v13;
  v22 = v14;
  v23 = v15;
  v24 = v16;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)_mainSceneBoundsForInterfaceOrientation:(int64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat Height;
  double v11;
  CGFloat v12;
  CGFloat Width;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  -[UIScreen _mainSceneReferenceBounds](self, "_mainSceneReferenceBounds");
  v6 = v5;
  v8 = v7;
  Height = v9;
  v12 = v11;
  if (!self
    || !-[UIScreen _isExternal](self, "_isExternal")
    || !-[UIScreen _isMainLikeScreen](self, "_isMainLikeScreen"))
  {
    if ((unint64_t)(a3 - 3) > 1)
      goto LABEL_9;
LABEL_8:
    v18.origin.x = v6;
    v18.origin.y = v8;
    v18.size.width = Height;
    v18.size.height = v12;
    Width = CGRectGetWidth(v18);
    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.width = Height;
    v19.size.height = v12;
    Height = CGRectGetHeight(v19);
    v12 = Width;
    goto LABEL_9;
  }
  if ((unint64_t)(a3 - 3) <= 1 && (*(_DWORD *)&self->_screenFlags & 0x10000) != 0)
    goto LABEL_8;
LABEL_9:
  v14 = v6;
  v15 = v8;
  v16 = Height;
  v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_mainSceneReferenceBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
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

  if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0 || -[UIScreen _isExternal](self, "_isExternal"))
  {
    if (qword_1ECD799D0 != -1)
      dispatch_once(&qword_1ECD799D0, &__block_literal_global_821);
    if (byte_1ECD7992A)
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      x = self->_unjailedReferenceBounds.origin.x;
      y = self->_unjailedReferenceBounds.origin.y;
      width = self->_unjailedReferenceBounds.size.width;
      height = self->_unjailedReferenceBounds.size.height;
    }
  }
  else
  {
    objc_msgSend((id)UIApp, "_findUISceneForLegacyInterfaceOrientation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_referenceBounds");
    x = v8;
    y = v9;
    width = v10;
    height = v11;

  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_unjailedReferenceBoundsForInterfaceOrientation:(int64_t)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  x = self->_unjailedReferenceBounds.origin.x;
  y = self->_unjailedReferenceBounds.origin.y;
  width = self->_unjailedReferenceBounds.size.width;
  height = self->_unjailedReferenceBounds.size.height;
  if (!-[UIScreen _isExternal](self, "_isExternal") || !-[UIScreen _isMainLikeScreen](self, "_isMainLikeScreen"))
  {
    if ((unint64_t)(a3 - 3) > 1)
      goto LABEL_8;
LABEL_7:
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v9 = CGRectGetWidth(v14);
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    width = CGRectGetHeight(v15);
    height = v9;
    goto LABEL_8;
  }
  if ((unint64_t)(a3 - 3) <= 1 && (*(_DWORD *)&self->_screenFlags & 0x10000) != 0)
    goto LABEL_7;
LABEL_8:
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (int64_t)_effectiveUserInterfaceStyle
{
  int64_t result;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  int64_t v10;

  if (!-[UIScreen _isMainLikeScreen](self, "_isMainLikeScreen"))
  {
    if (-[UIScreen _isCarScreen](self, "_isCarScreen"))
    {
      if ((_UIInternalPreferenceUsesDefault(&dword_1ECD765C0, (uint64_t)CFSTR("ApplySceneUserInterfaceStyleToCarScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1ECD765C4)
      {
        if (!dyld_program_sdk_at_least())
        {
LABEL_16:
          if (-[UIScreen _isCarPlayNightModeEnabled](self, "_isCarPlayNightModeEnabled"))
            return 2;
          else
            return 1;
        }
        -[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "configuration");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "userInterfaceStyle");

        if (v6 != 1)
        {
          if (v6)
            return 2;
          goto LABEL_16;
        }
        return 1;
      }
    }
    else
    {
      if (!-[UIScreen _isCarInstrumentsScreen](self, "_isCarInstrumentsScreen"))
        return 1;
      v7 = _UIInternalPreferenceUsesDefault(&dword_1ECD765C0, (uint64_t)CFSTR("ApplySceneUserInterfaceStyleToCarScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      result = 2;
      if ((v7 & 1) != 0 || !byte_1ECD765C4)
        return result;
    }
    if (self->_lastUpdatedCanvasUserInterfaceStyle)
      return self->_lastUpdatedCanvasUserInterfaceStyle;
    else
      return 2;
  }
  result = objc_msgSend((id)UIApp, "_effectiveUserInterfaceStyle");
  if (!result
    && ((_UIInternalPreferenceUsesDefault(&dword_1ECD765B8, (uint64_t)CFSTR("ApplySceneUserInterfaceStyleToScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& !byte_1ECD765BC|| (result = self->_lastUpdatedCanvasUserInterfaceStyle) == 0))
  {
    result = -[UISDisplayContext userInterfaceStyle](self->_initialDisplayContext, "userInterfaceStyle");
    if (!result)
    {
      if ((_UIInternalPreferenceUsesDefault(&dword_1ECD765B8, (uint64_t)CFSTR("ApplySceneUserInterfaceStyleToScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& !byte_1ECD765BC)
      {
        return 0;
      }
      if (objc_msgSend((id)UIApp, "isFrontBoard"))
      {
        +[UIUserInterfaceStyleArbiter sharedInstance](UIUserInterfaceStyleArbiter, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = v8;
          v10 = objc_msgSend(v8, "currentStyle");

          return v10;
        }
      }
      return 1;
    }
  }
  return result;
}

- (BOOL)_isMainLikeScreen
{
  FBSDisplayConfiguration *v4;
  char v5;

  if (self->_mainScreen)
    return 1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v4 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  v5 = -[FBSDisplayConfiguration isUIKitMainLike](v4, "isUIKitMainLike");

  return v5;
}

+ (id)_mainScreenThreadSafeTraitCollection
{
  _QWORD *v2;
  void *v3;
  id v4;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_UIMainScreenTraitCollectionLock);
  v3 = (void *)v2[30];
  if (!v3)
    v3 = (void *)v2[29];
  v4 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&_UIMainScreenTraitCollectionLock);

  return v4;
}

- (int64_t)gamut
{
  return self->_gamut;
}

- (void)_setReferenceDisplayModeStatus:(int64_t)a3
{
  int64_t referenceDisplayModeStatus;
  id v6;

  if (-[UIScreen _isEmbeddedScreen](self, "_isEmbeddedScreen"))
  {
    referenceDisplayModeStatus = self->_referenceDisplayModeStatus;
    if (a3 || !referenceDisplayModeStatus)
    {
      self->_referenceDisplayModeStatus = a3;
      if (referenceDisplayModeStatus != a3)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("UIScreenReferenceDisplayModeStatusDidChangeNotification"), self, 0);

      }
    }
  }
}

- (double)_displayCornerRadiusIgnoringZoom
{
  unint64_t v3;
  double result;

  v3 = -[UIScreen _screenType](self, "_screenType");
  if (v3 != -1)
    return _UIScreenCornerRadiusForTypeIgnoringZoom(v3);
  -[UIScreen _displayCornerRadius](self, "_displayCornerRadius");
  return result;
}

- (id)_name
{
  FBSDisplayConfiguration *v3;
  __CFString *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  if (v3)
  {
    -[FBSDisplayConfiguration name](v3, "name");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("LCD");
  }

  return v4;
}

- (double)_touchRadiusScaleFactor
{
  FBSDisplayConfiguration *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  if (os_variant_has_internal_diagnostics())
  {
    if (!v3)
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "displayConfiguration should not be nil", buf, 2u);
      }

    }
  }
  else if (!v3)
  {
    v11 = qword_1ECD79960;
    if (!qword_1ECD79960)
    {
      v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&qword_1ECD79960);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "displayConfiguration should not be nil", v13, 2u);
    }
  }
  -[FBSDisplayConfiguration pixelSize](v3, "pixelSize");
  if (v4 >= v5)
    v6 = v4;
  else
    v6 = v5;
  -[UIScreen scale](self, "scale");
  v8 = v6 / v7;

  return v8;
}

- (CADisplayLink)displayLinkWithTarget:(id)target selector:(SEL)sel
{
  id v6;
  FBSDisplayConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = target;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v7 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CD2730];
    -[FBSDisplayConfiguration CADisplay](v7, "CADisplay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayLinkWithDisplay:target:selector:", v9, v6, sel);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return (CADisplayLink *)v10;
}

+ (void)initialize
{
  int v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  UIScreen *v7;
  id v8;

  if ((id)objc_opt_class() == a1)
  {
    if (qword_1ECD799D0 != -1)
      dispatch_once(&qword_1ECD799D0, &__block_literal_global_821);
    v2 = byte_1ECD7992A;
    if (qword_1ECD799D8 != -1)
      dispatch_once(&qword_1ECD799D8, &__block_literal_global_826);
    v3 = byte_1ECD7992B;
    +[_UIScreenInitialDisplayConfigurationLoader sharedLoader](_UIScreenInitialDisplayConfigurationLoader, "sharedLoader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "initialDisplayContext");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v8;
    if (v8)
    {
      if (v2)
      {
LABEL_13:

        return;
      }
      objc_msgSend(v8, "displayConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIScreen _FBSDisplayConfigurationConnected:forInitialDisplayContext:andNotify:forceMain:](UIScreen, "_FBSDisplayConfigurationConnected:forInitialDisplayContext:andNotify:forceMain:", v6, v8, 0, 1);

      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_99);
    }
    else
    {
      if (v2 && !v3)
        goto LABEL_13;
      v7 = -[UIScreen initWithDisplayConfiguration:forceMainScreen:]([UIScreen alloc], "initWithDisplayConfiguration:forceMainScreen:", 0, 1);
      _UIScreenAddScreen(v7, 1);
      -[UIScreen _connectScreen](v7, "_connectScreen");

    }
    v5 = v8;
    goto LABEL_13;
  }
}

+ (void)_FBSDisplayConfigurationConnected:(id)a3 forInitialDisplayContext:(id)a4 andNotify:(BOOL)a5 forceMain:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  UIScreen *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  UIScreen *v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  int v25;
  void *v26;
  int v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v6 = a6;
  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_screenWithFBSDisplayIdentity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "_updateDisplayConfiguration:", v10);
    _UIScreenAddScreen(v13, v11 != 0);
  }
  else
  {
    v14 = -[UIScreen initWithDisplayConfiguration:forceMainScreen:]([UIScreen alloc], "initWithDisplayConfiguration:forceMainScreen:", v10, v6);
    v13 = v14;
    if (v11)
      -[UIScreen _setInitialDisplayContext:](v14, "_setInitialDisplayContext:", v11);
    _UIScreenAddScreen(v13, v11 != 0);
    objc_msgSend(v13, "_connectScreen");
    if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FakeMainScreen, (uint64_t)CFSTR("FakeMainScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD765AC)
    {
      if (qword_1ECD799D0 != -1)
        dispatch_once(&qword_1ECD799D0, &__block_literal_global_821);
      if (!byte_1ECD7992A
        && (_UIApplicationIsExtension() & 1) == 0
        && objc_msgSend(v13, "_isEmbeddedScreen")
        && (!_UIApplicationMayVendViews()
         || (_UIInternalPreferenceUsesDefault(&_MergedGlobals_912, (uint64_t)CFSTR("FakeMainScreenIncludeViewServices"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD765B4))
      {
        if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD765C8, (uint64_t)CFSTR("FakeMainScreenWidth"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger))v15 = 1920.0;
        else
          v15 = (double)qword_1ECD765D0;
        if (_UIInternalPreferenceUsesDefault((int *)algn_1ECD765D8, (uint64_t)CFSTR("FakeMainScreenHeight"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger))v16 = 1080.0;
        else
          v16 = (double)qword_1ECD765E0;
        objc_msgSend(v10, "currentMode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "_copyWithOverrideSize:", v15, v16);

        v19 = (void *)objc_msgSend(v10, "copyWithOverrideMode:", v18);
        v20 = -[UIScreen initWithDisplayConfiguration:forceMainScreen:]([UIScreen alloc], "initWithDisplayConfiguration:forceMainScreen:", v19, v6);
        v20->_isFakeScreen = 1;
        -[UIScreen _connectScreen](v20, "_connectScreen");
        objc_storeStrong((id *)&qword_1ECD79948, v20);
        v21 = qword_1ECD79950;
        if (!qword_1ECD79950)
        {
          v21 = __UILogCategoryGetNode("UIScreen", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v21, (unint64_t *)&qword_1ECD79950);
        }
        v22 = *(NSObject **)(v21 + 8);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = v22;
          v24 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD765E8, (uint64_t)CFSTR("FakeMainScreenScale"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
          v25 = (__int16)qword_1ECD765F0;
          if (v24)
            v25 = 2;
          v27 = 134218496;
          v28 = v15;
          v29 = 2048;
          v30 = v16;
          v31 = 1024;
          v32 = v25;
          _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Created fake [UIScreen mainScreen] with size %f x %f and scale @%ix", (uint8_t *)&v27, 0x1Cu);

        }
      }
    }
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "postNotificationName:object:userInfo:", CFSTR("_UIScreenDidConnectNotification"), v13, 0);
      objc_msgSend(v26, "postNotificationName:object:userInfo:", CFSTR("UIScreenDidConnectNotification"), v13, 0);

    }
  }

}

- (UIScreen)initWithDisplayConfiguration:(id)a3 forceMainScreen:(BOOL)a4
{
  id v6;
  UIScreen *v7;
  char v8;
  uint64_t v9;
  UITraitCollection *defaultTraitCollection;
  void *v11;
  void *v12;
  uint64_t v13;
  CARSessionStatus *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  CARSessionStatus *carSessionStatus;
  UIScreen *result;
  void *v23;
  void *v24;
  objc_super v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UIScreen;
  v7 = -[UIScreen init](&v25, sel_init);
  if (!v7)
    goto LABEL_20;
  if (a4)
    v8 = 1;
  else
    v8 = objc_msgSend(v6, "isMainDisplay");
  v7->_mainScreen = v8;
  _UIScreenWriteDisplayConfiguration((uint64_t)v7, v6, 1);
  v7->_userInterfaceIdiom = -1;
  v7->_screenType = -1;
  if (dyld_program_sdk_at_least())
  {
    +[UITraitCollection _emptyTraitCollection]();
    v9 = objc_claimAutoreleasedReturnValue();
    defaultTraitCollection = v7->_defaultTraitCollection;
    v7->_defaultTraitCollection = (UITraitCollection *)v9;

    objc_storeStrong((id *)&v7->_lastNotifiedTraitCollection, v7->_defaultTraitCollection);
  }
  -[UIScreen _computeMetrics](v7, "_computeMetrics");
  v7->_screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&v7->_screenFlags & 0xFFFFFFF0 | 8);
  -[UIScreen _beginObservingBacklightLevelNotifications](v7, "_beginObservingBacklightLevelNotifications");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__accessibilityForceTouchEnabledChanged_, CFSTR("UIAccessibilityForceTouchStatusChangedNotification"), 0);
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__accessibilityBoldTextChanged_, CFSTR("UIAccessibilityBoldTextStatusDidChangeNotification"), 0);
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__accessibilityBoldTextChanged_, CFSTR("UIAccessibilityCarPlayBoldTextStatusDidChangeNotification"), 0);
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__handleEffectiveUserInterfaceStyleChanged_, 0x1E1761C20, 0);
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__accessibilityTraitFlagsChanged_, CFSTR("UIAccessibilityDarkerSystemColorsStatusDidChangeNotification"), 0);
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__handleForcedUserInterfaceLayoutDirectionChanged_, 0x1E1761C40, 0);
  if (!-[UIScreen _isCarScreen](v7, "_isCarScreen"))
  {
    if (-[UIScreen _isCarInstrumentsScreen](v7, "_isCarInstrumentsScreen"))
    {
      +[_UICarPlaySession sharedInstance]();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICarPlaySession carSessionStatus]((uint64_t)v19);
      v20 = objc_claimAutoreleasedReturnValue();
      carSessionStatus = v7->_carSessionStatus;
      v7->_carSessionStatus = (CARSessionStatus *)v20;

    }
    goto LABEL_19;
  }
  +[_UICarPlaySession sharedInstance]();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICarPlaySession carSessionStatus]((uint64_t)v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v7->_carSessionStatus;
  v7->_carSessionStatus = (CARSessionStatus *)v13;

  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__clearCarPlayHumanPresenceState, CFSTR("UIApplicationWillResignActiveNotification"), 0);
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__fetchInitialCarPlayHumanPresenceStatusIfNeeded, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v15 = (_QWORD *)qword_1ECD79A10;
  v29 = qword_1ECD79A10;
  if (!qword_1ECD79A10)
  {
    v16 = CarKitLibrary();
    v15 = dlsym(v16, "CARSessionLimitUserInterfacesChangedNotification");
    v27[3] = (uint64_t)v15;
    qword_1ECD79A10 = (uint64_t)v15;
  }
  _Block_object_dispose(&v26, 8);
  if (v15)
  {
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__limitedUIDidChange_, *v15, 0);
    if ((_UIInternalPreferenceUsesDefault(&dword_1ECD765C0, (uint64_t)CFSTR("ApplySceneUserInterfaceStyleToCarScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD765C4)
    {
      goto LABEL_19;
    }
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v17 = (_QWORD *)qword_1ECD79A18;
    v29 = qword_1ECD79A18;
    if (!qword_1ECD79A18)
    {
      v18 = CarKitLibrary();
      v17 = dlsym(v18, "CARSessionNightModeChangedNotification");
      v27[3] = (uint64_t)v17;
      qword_1ECD79A18 = (uint64_t)v17;
    }
    _Block_object_dispose(&v26, 8);
    if (v17)
    {
      objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__externalDeviceNightModeDidChange_, *v17, 0);
LABEL_19:

LABEL_20:
      return v7;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCARSessionNightModeChangedNotification(void)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("UIScreen.m"), 109, CFSTR("%s"), dlerror());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCARSessionLimitUserInterfacesChangedNotification(void)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("UIScreen.m"), 108, CFSTR("%s"), dlerror());
  }

  __break(1u);
  return result;
}

- (void)_updateDisplayConfiguration:(id)a3
{
  FBSDisplayConfiguration *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  _BOOL4 v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _BOOL4 v37;
  _BOOL4 v38;
  int v39;
  double v40;
  char v41;
  _UIDisplayInfoProviding *displayInfoProvider;
  int v43;
  void *v44;
  int v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[5];
  CGRect v52;
  CGRect v53;

  v50 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v4 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  if ((-[FBSDisplayConfiguration isEqual:](v4, "isEqual:", v50) & 1) != 0)
    goto LABEL_33;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSDisplayConfiguration hardwareIdentifier](v4, "hardwareIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "hardwareIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v48 = v6;
  v49 = v5;
  v47 = (void *)v7;
  if (v6 == (void *)v7 || (v8 = v7, (objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0))
  {
    v43 = 0;
    v44 = 0;
  }
  else
  {
    v9 = (void *)objc_opt_new();
    v10 = v9;
    if (v6)
      objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("_UIScreenOldUniqueIdUserInfoKey"));
    if (v8)
      objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("_UIScreenNewUniqueIdUserInfoKey"));
    v44 = v10;
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("_UIScreenUniqueIdWillChangeNotification"), self, v10);
    v43 = 1;
  }
  _UIScreenWriteDisplayConfiguration((uint64_t)self, v50, 0);
  -[FBSDisplayConfiguration availableModes](v4, "availableModes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "availableModes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToSet:", v12);

  -[FBSDisplayConfiguration currentMode](v4, "currentMode");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "currentMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend((id)v14, "isEqual:", v15);

  LODWORD(v14) = -[FBSDisplayConfiguration isOverscanned](v4, "isOverscanned");
  v16 = v14 ^ objc_msgSend(v50, "isOverscanned");
  v17 = -[FBSDisplayConfiguration overscanCompensation](v4, "overscanCompensation");
  v18 = objc_msgSend(v50, "overscanCompensation");
  v45 = -[FBSDisplayConfiguration isCloningSupported](v4, "isCloningSupported");
  v19 = objc_msgSend(v50, "isCloningSupported");
  -[FBSDisplayConfiguration bounds](v4, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  objc_msgSend(v50, "bounds");
  v53.origin.x = v28;
  v53.origin.y = v29;
  v53.size.width = v30;
  v53.size.height = v31;
  v52.origin.x = v21;
  v52.origin.y = v23;
  v52.size.width = v25;
  v52.size.height = v27;
  v32 = CGRectEqualToRect(v52, v53);
  -[FBSDisplayConfiguration scale](v4, "scale");
  v34 = v33;
  objc_msgSend(v50, "scale");
  v36 = v35;
  v37 = -[FBSDisplayConfiguration colorGamut](v4, "colorGamut") == 0;
  v38 = objc_msgSend(v50, "colorGamut") != 0;
  if ((v13 & 1) == 0)
    -[UIScreen _updateAvailableDisplayModes](self, "_updateAvailableDisplayModes");
  v39 = v37 ^ v38;
  v40 = vabdd_f64(v34, v36);
  if (v17 == v18)
    v41 = v16;
  else
    v41 = 1;
  if ((v41 & 1) != 0 || !v32 || v40 >= 2.22044605e-16 || v39 != 1)
    -[UIScreen _computeMetrics](self, "_computeMetrics");
  if (v40 < 2.22044605e-16)
  {
    if ((v39 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __40__UIScreen__updateDisplayConfiguration___block_invoke;
    v51[3] = &unk_1E16B29D0;
    v51[4] = self;
    +[UIScene _enumerateAllWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:withBlock:](UIScene, "_enumerateAllWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:withBlock:", 1, 1, 0, v51);
  }
  -[UIScreen _updateTraits](self, "_updateTraits");
LABEL_24:
  if (((v46 ^ 1 | v16) & 1) != 0 || v17 != v18)
    objc_msgSend(v49, "postNotificationName:object:userInfo:", CFSTR("UIScreenModeDidChangeNotification"), self, 0);
  if (v45 != v19 && !-[UIScreen _hasWindows](self, "_hasWindows"))
    objc_msgSend(v49, "postNotificationName:object:", CFSTR("UIScreenMirroredScreenDidChangeNotification"), self);
  if (v43)
    objc_msgSend(v49, "postNotificationName:object:userInfo:", CFSTR("_UIScreenUniqueIdDidChangeNotification"), self, v44);
  displayInfoProvider = self->_displayInfoProvider;
  self->_displayInfoProvider = 0;

  objc_msgSend(v49, "postNotificationName:object:", CFSTR("_UIScreenDisplayConfigurationUpdatedNotification"), self);
LABEL_33:

}

- (void)_setInitialDisplayContext:(id)a3
{
  objc_storeStrong((id *)&self->_initialDisplayContext, a3);
}

- (BOOL)_isCarInstrumentsScreen
{
  FBSDisplayConfiguration *v3;
  char v4;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  v4 = -[FBSDisplayConfiguration isCarInstrumentsDisplay](v3, "isCarInstrumentsDisplay");

  return v4;
}

+ (void)_FBSDisplayConfigurationConnected:(id)a3 andNotify:(BOOL)a4 forceMain:(BOOL)a5
{
  objc_msgSend(a1, "_FBSDisplayConfigurationConnected:forInitialDisplayContext:andNotify:forceMain:", a3, 0, a4, a5);
}

+ (void)_FBSDisplayConfigurationConnected:(id)a3 andNotify:(BOOL)a4
{
  objc_msgSend(a1, "_FBSDisplayConfigurationConnected:andNotify:forceMain:", a3, a4, 0);
}

- (void)_connectScreen
{
  -[UIScreen _updateUserInterfaceIdiom](self, "_updateUserInterfaceIdiom");
  -[UIScreen _updateCapabilities](self, "_updateCapabilities");
  if (-[UIScreen _isExternal](self, "_isExternal") && -[UIScreen _isMainLikeScreen](self, "_isMainLikeScreen"))
    -[UIScreen _setInterfaceOrientation:andNotify:](self, "_setInterfaceOrientation:andNotify:", 1, 0);
  else
    -[UIScreen _updateTraits](self, "_updateTraits");
  *(_DWORD *)&self->_screenFlags |= 0x20u;
}

- (void)_updateCapabilities
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  _QWORD *v27;
  unint64_t v28;
  NSDictionary *v29;
  unint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  NSDictionary *capabilities;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[3];
  _QWORD v48[3];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[4];

  v57[2] = *MEMORY[0x1E0C80C00];
  if (-[UIScreen _isMainLikeScreen](self, "_isMainLikeScreen"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") == 2)
    {

    }
    else
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "userInterfaceIdiom");

      if (v24 != 8)
      {
        v54[0] = CFSTR("UIScreenCapabilityInteractionModelsKey");
        v54[1] = CFSTR("UIScreenCapabilityTouchLevelsKey");
        v55[0] = &unk_1E1A97EF0;
        v55[1] = &unk_1E1A97ED8;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v55;
        v27 = v54;
        goto LABEL_25;
      }
    }
    v56[0] = CFSTR("UIScreenCapabilityInteractionModelsKey");
    v56[1] = CFSTR("UIScreenCapabilityTouchLevelsKey");
    v57[0] = &unk_1E1A97EC0;
    v57[1] = &unk_1E1A97ED8;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = v57;
    v27 = v56;
LABEL_25:
    objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 2);
    v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  if (-[UIScreen _isCarScreen](self, "_isCarScreen")
    || -[UIScreen _isCarInstrumentsScreen](self, "_isCarInstrumentsScreen"))
  {
    -[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v4, "screens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v44 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIScreen _displayID](self, "_displayID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if (v13)
          {
            v28 = objc_msgSend(v10, "availableInteractionModels");
            v19 = (v28 >> 1) & 2 | v28 & 8;
            if ((v28 & 2) != 0)
            {
              v19 |= 1uLL;
              v21 = objc_msgSend(v10, "supportsHighFidelityTouch") ^ 1;
            }
            else
            {
              v21 = 2;
            }
            v22 = v42;
            v30 = objc_msgSend(v10, "primaryInteractionModel");
            v31 = 8;
            if ((v30 & 8) == 0)
              v31 = (v30 >> 1) & 1;
            if ((v30 & 4) != 0)
              v20 = 2;
            else
              v20 = v31;

            goto LABEL_33;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        if (v7)
          continue;
        break;
      }
    }

    v14 = _updateCapabilities___s_category;
    if (!_updateCapabilities___s_category)
    {
      v14 = __UILogCategoryGetNode("UIScreen", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&_updateCapabilities___s_category);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      -[UIScreen _displayID](self, "_displayID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "screenIDs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v17;
      v51 = 2114;
      v52 = v18;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "Failed to find matching car screen. Expected: %{public}@; Found: %{public}@",
        buf,
        0x16u);

    }
    v19 = 0;
    v20 = 0;
    v21 = -1;
    v22 = v42;
LABEL_33:
    v32 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_CarPlayPrimaryInteractionModel, (uint64_t)CFSTR("CarPlayPrimaryInteractionModel"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
    v33 = qword_1EDDA8118;
    if (v32)
      v33 = 0;
    if (v33)
      v34 = v33;
    else
      v34 = v20;
    v47[0] = CFSTR("UIScreenCapabilityInteractionModelsKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v35;
    v47[1] = CFSTR("UIScreenCapabilityTouchLevelsKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v36;
    v47[2] = CFSTR("UIScreenCapabilityPrimaryInteractionModelKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
    v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "rightHandDrive"))
      v38 = 0x2000;
    else
      v38 = 0;
    self->_screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&self->_screenFlags & 0xFFFFDFFF | v38);
    objc_msgSend(v22, "nightMode");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "BOOLValue"))
      v40 = 0x4000;
    else
      v40 = 0;
    self->_screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&self->_screenFlags & 0xFFFFBFFF | v40);

  }
  else
  {
    v29 = 0;
  }
LABEL_45:
  capabilities = self->_capabilities;
  self->_capabilities = v29;

}

- (void)_setUserInterfaceIdiom:(int64_t)a3
{
  void *v6;

  if ((unint64_t)(a3 - 11) <= 0xFFFFFFFFFFFFFFF3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScreen.m"), 2416, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("UIUserInterfaceIdiomFirst <= idiom && idiom <= UIUserInterfaceIdiomLast"));

  }
  self->_userInterfaceIdiom = a3;
  +[UIView _performInitializationForIdiomIfNeccessary:]((uint64_t)UIView, a3);
  -[UIScreen _computeMetrics](self, "_computeMetrics");
}

- (void)_beginObservingBacklightLevelNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  if (-[UIScreen _isEmbeddedScreen](self, "_isEmbeddedScreen"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_UIScreenBacklightLevelDidChangeCallback, CFSTR("UIBacklightLevelChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_UIScreenAccessibilityInvertColorsDidChangeCallback, (CFStringRef)*MEMORY[0x1E0DDE150], 0, (CFNotificationSuspensionBehavior)0);
  }
}

- (void)_updateUserInterfaceIdiom
{
  void *v3;
  uint64_t v4;

  if (-[UIScreen _isMainLikeScreen](self, "_isMainLikeScreen"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

  }
  else if (-[UIScreen _isCarScreen](self, "_isCarScreen")
         || -[UIScreen _isCarInstrumentsScreen](self, "_isCarInstrumentsScreen"))
  {
    v4 = 3;
  }
  else
  {
    v4 = -1;
  }
  -[UIScreen _setUserInterfaceIdiom:](self, "_setUserInterfaceIdiom:", v4);
}

- (double)_nativePointsPerMillimeter
{
  -[UIScreen _ensureComputedMainScreenDPI](self, "_ensureComputedMainScreenDPI");
  return self->_nativePointsPerMillimeter;
}

- (void)_ensureComputedMainScreenDPI
{
  void *v3;
  void *v4;
  CFTypeID v5;
  float v6;
  double v7;
  double v8;
  double v9;

  if ((*((_BYTE *)&self->_screenFlags + 1) & 0x10) == 0)
  {
    if (-[UIScreen _isEmbeddedScreen](self, "_isEmbeddedScreen"))
    {
      self->_pointsPerInch = 0.0;
      self->_nativePointsPerMillimeter = 0.0;
      v3 = (void *)MGCopyAnswer();
      if (v3)
      {
        v4 = v3;
        v5 = CFGetTypeID(v3);
        if (v5 == CFNumberGetTypeID())
        {
          objc_msgSend(v4, "floatValue");
          v7 = v6;
          -[UIScreen scale](self, "scale");
          self->_pointsPerInch = v7 / v8;
          -[UIScreen nativeScale](self, "nativeScale");
          self->_nativePointsPerMillimeter = v7 / 25.4 / v9;
          *(_DWORD *)&self->_screenFlags |= 0x1000u;
        }
        CFRelease(v4);
      }
    }
  }
}

- (CGFloat)nativeScale
{
  int v3;
  CGFloat result;
  double v5;
  double v6;

  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FakeMainScreen, (uint64_t)CFSTR("FakeMainScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD765AC&& self->_isFakeScreen)
  {
    v3 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD765E8, (uint64_t)CFSTR("FakeMainScreenScale"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
    result = (double)qword_1ECD765F0;
    if (v3)
      return 2.0;
  }
  else
  {
    -[UIScreen _nativeScaleWithLevel:](self, "_nativeScaleWithLevel:", 2);
    v6 = v5;
    -[UIScreen _isMainScreen](self, "_isMainScreen");
    return v6;
  }
  return result;
}

- (NSInteger)maximumFramesPerSecond
{
  if (qword_1ECD79968 != -1)
    dispatch_once(&qword_1ECD79968, &__block_literal_global_175);
  if (byte_1ECD79929)
    return 60;
  else
    return -[UIScreen _maximumFramesPerSecond](self, "_maximumFramesPerSecond");
}

- (int64_t)_maximumFramesPerSecond
{
  double v2;

  -[UIScreen _refreshRate](self, "_refreshRate");
  if (v2 <= 0.0)
    return 60;
  else
    return llround(1.0 / v2);
}

- (double)_refreshRate
{
  FBSDisplayConfiguration *v3;
  double v4;
  double v5;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  -[FBSDisplayConfiguration refreshRate](v3, "refreshRate");
  v5 = v4;

  return 1.0 / v5;
}

- (void)_setInterfaceOrientation:(int64_t)a3 andNotify:(BOOL)a4
{
  int64_t interfaceOrientation;
  $012B70957C36FBAE3F3275CB0B70138F screenFlags;
  _BOOL4 v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation != a3)
  {
    screenFlags = self->_screenFlags;
    if ((*(_WORD *)&screenFlags & 0x8000) != 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "-[UIScreen _setInterfaceOrientation:] re-entry detected.", buf, 2u);
        }

      }
      else
      {
        v13 = _setInterfaceOrientation_andNotify____s_category;
        if (!_setInterfaceOrientation_andNotify____s_category)
        {
          v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v13, (unint64_t *)&_setInterfaceOrientation_andNotify____s_category);
        }
        v14 = *(NSObject **)(v13 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "-[UIScreen _setInterfaceOrientation:] re-entry detected.", v16, 2u);
        }
      }
    }
    else
    {
      v7 = a4;
      self->_screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&screenFlags | 0x8000);
      self->_interfaceOrientation = a3;
      -[UIScreen _updateTraits](self, "_updateTraits");
      -[UIScreen _computeMetrics](self, "_computeMetrics");
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "postNotificationName:object:", CFSTR("_UIScreenInterfaceOrientationDidChangeNotification"), self);
        if ((unint64_t)(interfaceOrientation - 1) < 2 != (unint64_t)(self->_interfaceOrientation - 1) < 2)
        {
          -[UIScreen _displayPeripheryInsets](self, "_displayPeripheryInsets");
          if (v12 != 0.0 || v9 != 0.0 || v11 != 0.0 || v10 != 0.0)
            objc_msgSend(v8, "postNotificationName:object:", CFSTR("_UIScreenDidChangePeripheryInsetsNotification"), self);
        }

      }
      *(_DWORD *)&self->_screenFlags &= ~0x8000u;
    }
  }
}

- (void)_setInterfaceOrientation:(int64_t)a3
{
  -[UIScreen _setInterfaceOrientation:andNotify:](self, "_setInterfaceOrientation:andNotify:", a3, 1);
}

- (void)_computeMetrics
{
  -[UIScreen _computeMetrics:](self, "_computeMetrics:", 1);
}

- (void)_computeMetrics:(BOOL)a3
{
  FBSDisplayConfiguration *v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  FBSDisplayConfiguration *v10;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v10 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  v4 = v10;
  if (v10)
  {
    -[FBSDisplayConfiguration scale](v10, "scale");
    v4 = v10;
  }
  else
  {
    v5 = 1.0;
  }
  self->_scale = v5;
  self->_gamut = -[FBSDisplayConfiguration colorGamut](v4, "colorGamut") != 0;
  if (objc_msgSend((id)UIApp, "_fakingRequiresHighResolution") && self->_scale == 1.0)
    self->_scale = 2.0;
  -[FBSDisplayConfiguration bounds](v10, "bounds");
  self->_unjailedReferenceBounds.origin.x = v6;
  self->_unjailedReferenceBounds.origin.y = v7;
  self->_unjailedReferenceBounds.size.width = v8;
  self->_unjailedReferenceBounds.size.height = v9;
  self->_referenceBounds.origin = self->_unjailedReferenceBounds.origin;
  self->_referenceBounds.size = self->_unjailedReferenceBounds.size;
  *(_DWORD *)&self->_screenFlags &= ~0x1000u;

}

- (UIEdgeInsets)_displayPeripheryInsets
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
  UIEdgeInsets result;

  -[UIScreen _displayInfoProvider](self, "_displayInfoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peripheryInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)_updateTraits
{
  id v3;

  -[UIScreen _defaultTraitCollectionForInterfaceOrientation:](self, "_defaultTraitCollectionForInterfaceOrientation:", -[UIScreen _interfaceOrientation](self, "_interfaceOrientation"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIScreen _setDefaultTraitCollection:](self, "_setDefaultTraitCollection:", v3);

}

- (id)_defaultTraitCollectionForInterfaceOrientation:(int64_t)a3
{
  -[UIScreen _boundsForInterfaceOrientation:](self, "_boundsForInterfaceOrientation:");
  return -[UIScreen _defaultTraitCollectionForInterfaceOrientation:inBounds:](self, "_defaultTraitCollectionForInterfaceOrientation:inBounds:", a3);
}

- (void)_setDefaultTraitCollection:(id)a3
{
  UITraitCollection *v5;
  UITraitCollection *defaultTraitCollection;
  BOOL v7;
  UITraitCollection *overrideTraitCollection;
  UITraitCollection *v9;
  void *v10;
  UITraitCollection *v11;

  v5 = (UITraitCollection *)a3;
  defaultTraitCollection = self->_defaultTraitCollection;
  if (defaultTraitCollection != v5)
  {
    v11 = v5;
    v7 = -[UITraitCollection isEqual:](defaultTraitCollection, "isEqual:", v5);
    v5 = v11;
    if (!v7)
    {
      overrideTraitCollection = self->_overrideTraitCollection;
      if (!overrideTraitCollection)
        overrideTraitCollection = v11;
      v9 = overrideTraitCollection;
      if (-[UIScreen _isMainScreen](self, "_isMainScreen"))
      {
        os_unfair_lock_lock((os_unfair_lock_t)&_UIMainScreenTraitCollectionLock);
        objc_storeStrong((id *)&self->_defaultTraitCollection, a3);
        os_unfair_lock_unlock((os_unfair_lock_t)&_UIMainScreenTraitCollectionLock);
      }
      else
      {
        objc_storeStrong((id *)&self->_defaultTraitCollection, a3);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("_UIScreenDefaultTraitCollectionDidChangeNotification"), self, 0);
      -[UIScreen _notifyTraitsChangedAndPropagate](self, "_notifyTraitsChangedAndPropagate");
      v5 = v11;
    }
  }

}

- (void)_notifyTraitsChangedAndPropagate
{
  UITraitCollection *v3;
  UITraitCollection *v4;
  UITraitCollection *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  UIScreen *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  UITraitCollection *v22;
  __int16 v23;
  UITraitCollection *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = self->_lastNotifiedTraitCollection;
  -[UIScreen traitCollection](self, "traitCollection");
  v4 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 != v4 && !-[UITraitCollection isEqual:](v4, "isEqual:", v3))
  {
    if (-[UIScreen _isMainScreen](self, "_isMainScreen"))
      +[UITraitCollection _setBackgroundThreadFallbackTraitCollection:]((uint64_t)UITraitCollection, v5);
    -[UIScreen _setLastNotifiedTraitCollection:](self, "_setLastNotifiedTraitCollection:", v5);
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = _UIShouldLogTraitCollectionChangeForInstanceAndMethod(v6, (uint64_t)self, (uint64_t)sel_traitCollectionDidChange_);

    if (v7)
    {
      v10 = _notifyTraitsChangedAndPropagate___s_category;
      if (!_notifyTraitsChangedAndPropagate___s_category)
      {
        v10 = __UILogCategoryGetNode("TraitCollectionChange", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&_notifyTraitsChangedAndPropagate___s_category);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        NSStringFromSelector(sel_traitCollectionDidChange_);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[UITraitCollection _descriptionForChangeFromTraitCollection:toTraitCollection:](UITraitCollection, "_descriptionForChangeFromTraitCollection:toTraitCollection:", v3, v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138413314;
        v16 = v13;
        v17 = 2112;
        v18 = self;
        v19 = 2112;
        v20 = v14;
        v21 = 2112;
        v22 = v3;
        v23 = 2112;
        v24 = v5;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Sending -%@ to %@\n\t► trait changes: %@\n\t► previous: %@\n\t► current: %@", (uint8_t *)&v15, 0x34u);

      }
    }
    -[UIScreen traitCollectionDidChange:](self, "traitCollectionDidChange:", v3);
    -[UIScreen _updateTraitsForWindowScenesCallingParentWillTransition:](self, "_updateTraitsForWindowScenesCallingParentWillTransition:", 1);
    v8 = -[UITraitCollection userInterfaceStyle](v3, "userInterfaceStyle");
    if (v8 != -[UITraitCollection userInterfaceStyle](v5, "userInterfaceStyle"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("_UIScreenUserInterfaceStyleDidChangeForSmartInvertNotification"), self);

    }
  }

}

- (void)_updateTraitsForWindowScenesCallingParentWillTransition:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  UIScreen *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "_hostsWindows"))
        {
          objc_msgSend(v10, "_screen");
          v11 = (UIScreen *)objc_claimAutoreleasedReturnValue();

          if (v11 == self)
            objc_msgSend(v10, "_updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:", 0, v3);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_setLastNotifiedTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_lastNotifiedTraitCollection, a3);
}

+ (CGRect)convertRect:(CGRect)a3 fromView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v8, "window");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v8, "convertRect:toView:", 0, x, y, width, height);
  objc_msgSend(v10, "convertRect:toWindow:", 0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_prepareForWindow
{
  $012B70957C36FBAE3F3275CB0B70138F screenFlags;

  screenFlags = self->_screenFlags;
  if ((*(_BYTE *)&screenFlags & 0x10) == 0)
    self->_screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&screenFlags | 0x10);
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  UIScreen *v9;
  UIScreen *v10;
  void *v11;
  UIScreen *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  const __CFString *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  char isKindOfClass;
  const __CFString *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;
  CGRect v40;
  CGRect v41;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = (UIScreen *)a4;
  v10 = v9;
  if (v9 && v9 != self)
  {
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIScreen _screen](v10, "_screen");
      v12 = (UIScreen *)objc_claimAutoreleasedReturnValue();

      if (v12 != self)
      {
LABEL_7:
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            goto LABEL_15;
          v41.origin.x = x;
          v41.origin.y = y;
          v41.size.width = width;
          v41.size.height = height;
          NSStringFromCGRect(v41);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (oriented)"), self);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x1E0CB3940];
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v32 = CFSTR("fixed");
          if ((isKindOfClass & 1) != 0)
            v32 = CFSTR("oriented");
          objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ (%@)"), v10, v32);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v34 = v16;
          v35 = 2112;
          v36 = v17;
          v37 = 2112;
          v38 = v21;
          _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Attempting to convert rect: %@ from %@ to %@, which is not a valid conversion; returning CGRectNull.",
            buf,
            0x20u);
        }
        else
        {
          v13 = convertRect_toCoordinateSpace____s_category;
          if (!convertRect_toCoordinateSpace____s_category)
          {
            v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v13, (unint64_t *)&convertRect_toCoordinateSpace____s_category);
          }
          v14 = *(NSObject **)(v13 + 8);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_16;
          v15 = v14;
          v40.origin.x = x;
          v40.origin.y = y;
          v40.size.width = width;
          v40.size.height = height;
          NSStringFromCGRect(v40);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (oriented)"), self);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x1E0CB3940];
          objc_opt_class();
          v19 = objc_opt_isKindOfClass();
          v20 = CFSTR("fixed");
          if ((v19 & 1) != 0)
            v20 = CFSTR("oriented");
          objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ (%@)"), v10, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v34 = v16;
          v35 = 2112;
          v36 = v17;
          v37 = 2112;
          v38 = v21;
          _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Attempting to convert rect: %@ from %@ to %@, which is not a valid conversion; returning CGRectNull.",
            buf,
            0x20u);
        }

LABEL_15:
LABEL_16:
        x = *MEMORY[0x1E0C9D628];
        y = *(double *)(MEMORY[0x1E0C9D628] + 8);
        width = *(double *)(MEMORY[0x1E0C9D628] + 16);
        height = *(double *)(MEMORY[0x1E0C9D628] + 24);
        goto LABEL_19;
      }
    }
    else
    {

    }
    -[UIScreen convertRect:fromCoordinateSpace:](v10, "convertRect:fromCoordinateSpace:", self, x, y, width, height);
    x = v22;
    y = v23;
    width = v24;
    height = v25;
  }
LABEL_19:

  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (UIScreen)mirroredScreen
{
  FBSDisplayConfiguration *v3;
  int v4;
  void *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  v4 = -[FBSDisplayConfiguration isCloningSupported](v3, "isCloningSupported");

  if (v4 && !-[UIScreen _hasWindows](self, "_hasWindows"))
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (UIScreen *)v5;
}

- (CGRect)_applicationFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIScreen _applicationFrameForInterfaceOrientation:](self, "_applicationFrameForInterfaceOrientation:", -[UIScreen _interfaceOrientation](self, "_interfaceOrientation"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_applicationFrameForInterfaceOrientation:(int64_t)a3 usingStatusbarHeight:(double)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UIScreen _applicationFrameForInterfaceOrientation:usingStatusbarHeight:ignoreStatusBar:](self, "_applicationFrameForInterfaceOrientation:usingStatusbarHeight:ignoreStatusBar:", a3, 0, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_applicationFrameForInterfaceOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIScreen _applicationFrameForInterfaceOrientation:usingStatusbarHeight:](self, "_applicationFrameForInterfaceOrientation:usingStatusbarHeight:", a3, 0.0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t __34__UIScreen_maximumFramesPerSecond__block_invoke()
{
  uint64_t result;
  char v1;

  result = _UIVariableFrameDurationEnabled();
  if ((_DWORD)result)
  {
    result = dyld_program_sdk_at_least();
    v1 = result ^ 1;
  }
  else
  {
    v1 = 0;
  }
  byte_1ECD79929 = v1;
  return result;
}

- (id)_displayID
{
  FBSDisplayConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v10;
  int v11;
  UIScreen *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  -[FBSDisplayConfiguration hardwareIdentifier](v3, "hardwareIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (!-[FBSDisplayConfiguration isExternal](v3, "isExternal"))
    {
LABEL_10:
      v4 = 0;
      goto LABEL_11;
    }
    -[FBSDisplayConfiguration CADisplay](v3, "CADisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "update");

    -[FBSDisplayConfiguration CADisplay](v3, "CADisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (os_variant_has_internal_diagnostics())
      {
        if (v4)
          goto LABEL_11;
        __UIFaultDebugAssertLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          v11 = 138412290;
          v12 = self;
          _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Could not obtain unique identifier for attached screen %@", (uint8_t *)&v11, 0xCu);
        }

        goto LABEL_10;
      }
      if (!v4)
      {
        v7 = qword_1ECD79998;
        if (!qword_1ECD79998)
        {
          v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v7, (unint64_t *)&qword_1ECD79998);
        }
        v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v11 = 138412290;
          v12 = self;
          _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Could not obtain unique identifier for attached screen %@", (uint8_t *)&v11, 0xCu);
        }
        goto LABEL_10;
      }
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_isUserInterfaceLimited:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (-[UIScreen _userInterfaceIdiom](self, "_userInterfaceIdiom") != 3)
    return 0;
  -[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "limitUserInterfaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (!v7)
    return 0;
  -[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "limitableUserInterfaces");

  return (v10 & a3) != 0;
}

- (BOOL)_areListsLimited
{
  return -[UIScreen _isUserInterfaceLimited:](self, "_isUserInterfaceLimited:", 4);
}

void __32__UIScreen__displayCornerRadius__block_invoke()
{
  int v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  float v7;
  double v8;
  void *v9;

  v0 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_DisplayCornerRadiusOverride, (uint64_t)CFSTR("DisplayCornerRadiusOverride"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v1 = qword_1ECD765A0;
  if (v0)
    *(double *)&v1 = -1.0;
  _displayCornerRadius_embeddedDisplayCornerRadius = v1;
  if (*(double *)&v1 < 0.0)
  {
    +[_UIDeviceInitialDeviceConfigurationLoader sharedLoader](_UIDeviceInitialDeviceConfigurationLoader, "sharedLoader");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "initialDeviceContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "deviceInfoFloatValueForKey:", *MEMORY[0x1E0DC5CC0]);
      _displayCornerRadius_embeddedDisplayCornerRadius = v5;
    }

    v1 = _displayCornerRadius_embeddedDisplayCornerRadius;
  }
  if (*(double *)&v1 < 0.0)
  {
    v6 = (void *)MGCopyAnswer();
    if (v6)
    {
      v9 = v6;
      objc_msgSend(v6, "floatValue");
      v6 = v9;
      v8 = v7;
    }
    else
    {
      v8 = 0.0;
    }
    _displayCornerRadius_embeddedDisplayCornerRadius = *(_QWORD *)&v8;

  }
}

+ (id)_carScreen
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__114;
  v10 = __Block_byref_object_dispose__114;
  v11 = 0;
  _UIScreenAllScreens();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__UIScreen__carScreen__block_invoke;
  v5[3] = &unk_1E16CBCF0;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_setExternalDeviceShouldInputText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (-[UIScreen _userInterfaceIdiom](self, "_userInterfaceIdiom") == 3)
  {
    -[UIScreen traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "primaryInteractionModel");

    if (v6 != 8)
    {
      -[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "inputDeviceManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v8, "inputDevices", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v15;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(v7, "setInputMode:forInputDevice:", v3, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v11);
      }

    }
  }
}

- (UIEdgeInsets)_peripheryInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t interfaceOrientation;
  double v10;
  UIEdgeInsets result;

  -[UIScreen _displayPeripheryInsets](self, "_displayPeripheryInsets");
  v6 = v5;
  v7 = v3;
  v8 = v4;
  interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation == 2)
  {
    v4 = v3;
    v10 = v6;
    v3 = v8;
LABEL_8:
    v7 = v6;
    goto LABEL_9;
  }
  if (interfaceOrientation == 3)
  {
    v4 = v6;
    v10 = v3;
    v3 = v6;
    v7 = v8;
    goto LABEL_9;
  }
  if (interfaceOrientation != 4)
  {
    v10 = v6;
    goto LABEL_8;
  }
  v4 = v6;
  v10 = v8;
  v3 = v6;
LABEL_9:
  result.right = v4;
  result.bottom = v10;
  result.left = v3;
  result.top = v7;
  return result;
}

void __22__UIScreen_initialize__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (!UIApp)
  {
    v0 = objc_alloc_init(MEMORY[0x1E0D23100]);
    v1 = (void *)_UIInternalPreference_FakeMainScreenScale_block_invoke_liveForeverMonitor;
    _UIInternalPreference_FakeMainScreenScale_block_invoke_liveForeverMonitor = (uint64_t)v0;

    v2 = (void *)_UIInternalPreference_FakeMainScreenScale_block_invoke_liveForeverMonitor;
    +[_UIDisplayObserver sharedObserver](_UIDisplayObserver, "sharedObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:", v3);

    +[_UIDisplayObserver sharedObserver](_UIDisplayObserver, "sharedObserver");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = _UIInternalPreference_FakeMainScreenScale_block_invoke_liveForeverMonitor;
    objc_msgSend((id)_UIInternalPreference_FakeMainScreenScale_block_invoke_liveForeverMonitor, "mainIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_UIInternalPreference_FakeMainScreenScale_block_invoke_liveForeverMonitor, "mainConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayMonitor:didUpdateIdentity:withConfiguration:", v4, v5, v6);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  objc_super v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  char v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 == &__UIScreenCapturedKey)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    objc_initWeak(&location, self);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __59__UIScreen_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v20 = &unk_1E16BFC68;
    objc_copyWeak(&v21, &location);
    v22 = v15;
    BSDispatchMain();
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)UIScreen;
    -[UIScreen observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)setWantsSoftwareDimming:(BOOL)wantsSoftwareDimming
{
  self->_wantsSoftwareDimming = wantsSoftwareDimming;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIScreen descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  UIScreen *v14;

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", v4);

  -[UIScreen bounds](self, "bounds");
  v7 = (id)objc_msgSend(v6, "appendRect:withName:", CFSTR("bounds"));
  -[UIScreen currentMode](self, "currentMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = (id)objc_msgSend(v6, "appendObject:withName:", v8, CFSTR("mode"));
  if (has_internal_diagnostics)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke;
    v12[3] = &unk_1E16B1B50;
    v13 = v6;
    v14 = self;
    v10 = (id)objc_msgSend(v13, "modifyBody:", v12);

  }
  return v6;
}

- (UIScreenMode)currentMode
{
  FBSDisplayConfiguration *v3;
  void *v4;
  void *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  if (v3)
  {
    -[FBSDisplayConfiguration currentMode](v3, "currentMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreenMode _screenModeForDisplayMode:mainScreen:actualDisplayScale:](UIScreenMode, "_screenModeForDisplayMode:mainScreen:actualDisplayScale:", v4, -[UIScreen _isMainScreen](self, "_isMainScreen"), self->_scale);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (UIScreenMode *)v5;
}

- (void)_setUserInterfaceStyleIfNecessary:(int64_t)a3 firstTimeOnly:(BOOL)a4
{
  _BOOL4 v4;
  int v7;
  int v8;
  BOOL v9;

  v4 = a4;
  if (!-[UIScreen _isMainLikeScreen](self, "_isMainLikeScreen")
    || ((v7 = _UIInternalPreferenceUsesDefault(&dword_1ECD765B8, (uint64_t)CFSTR("ApplySceneUserInterfaceStyleToScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool), byte_1ECD765BC)? (v8 = 1): (v8 = v7), !a3 || !v8))
  {
    if ((_UIInternalPreferenceUsesDefault(&dword_1ECD765C0, (uint64_t)CFSTR("ApplySceneUserInterfaceStyleToCarScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1ECD765C4)
    {
      return;
    }
    if (-[UIScreen _isCarScreen](self, "_isCarScreen"))
    {
      if (!a3)
        return;
    }
    else
    {
      v9 = -[UIScreen _isCarInstrumentsScreen](self, "_isCarInstrumentsScreen");
      if (!a3 || !v9)
        return;
    }
  }
  if (!v4 || !self->_lastUpdatedCanvasUserInterfaceStyle)
  {
    self->_lastUpdatedCanvasUserInterfaceStyle = a3;
    -[UIScreen _updateTraits](self, "_updateTraits");
  }
}

- (UITraitCollection)_defaultTraitCollection
{
  return self->_defaultTraitCollection;
}

- (CGFloat)brightness
{
  _BOOL4 wantsSoftwareDimming;
  void *v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  double v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  if (-[UIScreen _supportsBrightness](self, "_supportsBrightness"))
  {
    wantsSoftwareDimming = self->_wantsSoftwareDimming;
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_backlightLevel");
    if (wantsSoftwareDimming)
    {
      -[UIScreen rawBrightnessForBacklightLevel:](self, "rawBrightnessForBacklightLevel:");
      v7 = v6;
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_softwareDimmingAlpha");
      v10 = (float)(v7 + v9) / (v9 + 1.0);
      v11 = v10;

    }
    else
    {
      v11 = v5;
    }

  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "The brightness property is only supported by the main screen.", buf, 2u);
    }

    return -1.0;
  }
  else
  {
    v12 = brightness___s_category;
    if (!brightness___s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&brightness___s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    v11 = -1.0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "The brightness property is only supported by the main screen.", v16, 2u);
    }
  }
  return v11;
}

void __22__UIScreen__carScreen__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;

  objc_msgSend(a2, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCarDisplay");

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __59__UIScreen_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  id v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[24];
    v7 = v3;
    if (!*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v4, "invalidate");
      v5 = 0;
      goto LABEL_6;
    }
    if (!v4)
    {
      -[UIScreen _capturingAssertionForReason:](v3, CFSTR("CADisplay KVO"));
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v6 = v7[24];
      v7[24] = (id)v5;

      v3 = v7;
    }
  }

}

- (UIView)focusedView
{
  void *v2;
  void *v3;
  void *v4;

  -[UIScreen _preferredFocusedWindowScene](self, "_preferredFocusedWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_focusedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (UIWindow)_preferredFocusedWindow
{
  UIFocusEnvironment *focusedWindow;

  focusedWindow = self->__focusedWindow;
  if (focusedWindow)
    return (UIWindow *)focusedWindow;
  objc_msgSend((id)UIApp, "_keyWindowForScreen:", self);
  return (UIWindow *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_preferredFocusedWindowScene
{
  void *v2;
  void *v3;

  -[UIScreen _preferredFocusedWindow](self, "_preferredFocusedWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)_isProbablyBeingRecorded
{
  id v2;
  void *v3;
  char v4;
  unsigned int (*v5)(void);
  BOOL result;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  if (qword_1ECD79A20 != -1)
    dispatch_once(&qword_1ECD79A20, &__block_literal_global_860);
  v2 = (id)qword_1ECD79A28;
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
LABEL_9:

    return v4;
  }
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v5 = (unsigned int (*)(void))off_1ECD79A30;
  v13 = off_1ECD79A30;
  if (!off_1ECD79A30)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getFigOutputMonitorIsScreenProbablyBeingRecordedSymbolLoc_block_invoke;
    v9[3] = &unk_1E16B14C0;
    v9[4] = &v10;
    __getFigOutputMonitorIsScreenProbablyBeingRecordedSymbolLoc_block_invoke(v9);
    v5 = (unsigned int (*)(void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v5)
  {
    v4 = v5() != 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean __FigOutputMonitorIsScreenProbablyBeingRecorded(void)");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("UIScreen.m"), 134, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (CGAffineTransform)transformForScreenOriginRotation:(SEL)a3
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");
  v8 = v7;
  v10 = v9;

  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v13, v8 * 0.5, v10 * 0.5);
  CGAffineTransformRotate(&v14, &v13, a4);
  v12 = v14;
  return CGAffineTransformTranslate(retstr, &v12, v8 * -0.5, v10 * -0.5);
}

+ (CGAffineTransform)transformToRotateScreen:(SEL)a3
{
  void *v5;
  double x;
  double y;
  CGAffineTransform v9;
  CGAffineTransform t1;
  CGAffineTransform v11;
  CGRect v12;
  CGRect v13;

  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeRotation(&v11, -a4);
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  t1 = v11;
  v13 = CGRectApplyAffineTransform(v12, &t1);
  x = v13.origin.x;
  y = v13.origin.y;

  CGAffineTransformMakeTranslation(&v9, -x, -y);
  t1 = v11;
  return CGAffineTransformConcat(retstr, &t1, &v9);
}

+ (id)_screenWithDisplayName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  id v10;
  void *v11;
  id *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  _UIScreenAllScreens();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
        v10 = v9[20];
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
        objc_msgSend(v10, "name", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v10) = objc_msgSend(v11, "isEqualToString:", v3);
        if ((v10 & 1) != 0)
        {
          v12 = v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)_screenWithEventDisplay:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    _UIScreenAllScreens();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "_eventDisplay", (_QWORD)v14);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (v10 == v3)
          {
            v11 = v3;
LABEL_14:
            v12 = v9;

            goto LABEL_15;
          }
          v11 = v10;
          if ((objc_msgSend(v10, "isEqual:", v3) & 1) != 0)
            goto LABEL_14;

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }

    v12 = 0;
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  return v12;
}

+ (id)_screenWithIntegerDisplayID:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  _UIScreenAllScreens();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "displayIdentity", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "displayID");

        if (v11 == a3)
        {
          v12 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)_embeddedScreen
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  _UIScreenAllScreens();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "_isEmbeddedScreen", (_QWORD)v8) & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (void)_prepareScreensForAppResume
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  +[UIScreen _screens]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_computeMetrics", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (void)_FBSDisplayDidPossiblyConnect:(id)a3
{
  objc_msgSend(a1, "_FBSDisplayDidPossiblyConnect:withScene:", a3, 0);
}

+ (void)_FBSDisplayDidPossiblyConnect:(id)a3 withScene:(id)a4
{
  objc_msgSend(a1, "_FBSDisplayDidPossiblyConnect:withScene:andPost:", a3, a4, 1);
}

+ (void)_FBSDisplayDidPossiblyConnect:(id)a3 withScene:(id)a4 andPost:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a5;
  objc_msgSend(a4, "settings", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FBSDisplayConfigurationConnected:andNotify:", v7, v5);

}

+ (void)_FBSDisplayDidPossiblyDisconnect:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_FBSDisplayDidPossiblyDisconnect:forSceneDestruction:", v3, 0);

}

+ (void)_FBSDisplayDidPossiblyDisconnect:(id)a3 forSceneDestruction:(id)a4
{
  id v5;

  objc_msgSend(a3, "identity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FBSDisplayIdentityDisconnected:", v5);

}

+ (void)_FBSDisplayIdentityDisconnected:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t *v8;
  BOOL v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = ___UIScreenRemoveScreen_block_invoke;
    v23 = &unk_1E16BC3A0;
    v7 = v6;
    v24 = v7;
    v25 = &v26;
    v8 = &v20;
    os_unfair_lock_lock((os_unfair_lock_t)&__UIScreenMutableScreensArrayAccessLock);
    v22((uint64_t)v8);

    os_unfair_lock_unlock((os_unfair_lock_t)&__UIScreenMutableScreensArrayAccessLock);
    if (qword_1ECD799D0 != -1)
      dispatch_once(&qword_1ECD799D0, &__block_literal_global_821);
    if (byte_1ECD7992A && os_variant_has_internal_diagnostics())
    {
      v10 = qword_1ECD79A08;
      if (!qword_1ECD79A08)
      {
        v10 = __UILogCategoryGetNode("UIWindowSceneTraitCollection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1ECD79A08);
      }
      v11 = *(id *)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v7;
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v12, v20, v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v16;
        +[UIScreen _shortScreensDescription](UIScreen, "_shortScreensDescription");
        v18 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v17;
        v32 = 2112;
        v19 = (void *)v18;
        v33 = v18;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "Removing screen %@, now we have %@", buf, 0x16u);

      }
    }
    v9 = *((_BYTE *)v27 + 24) == 0;

    _Block_object_dispose(&v26, 8);
    if (!v9)
    {
      if (*((_QWORD *)v7 + 33))
        *((_DWORD *)v7 + 52) |= 0x40u;
      else
        objc_msgSend(v7, "_disconnectScreen");
    }
  }

}

- (UIScreen)initWithDisplayConfiguration:(id)a3
{
  id v4;
  UIScreen *v5;

  v4 = a3;
  v5 = -[UIScreen initWithDisplayConfiguration:forceMainScreen:](self, "initWithDisplayConfiguration:forceMainScreen:", v4, objc_msgSend(v4, "isMainDisplay"));

  return v5;
}

- (void)_invalidate
{
  void *v3;
  BSInvalidatable *caDisplayCaptureAssertion;

  *(_DWORD *)&self->_screenFlags &= 0xFFFFFFCF;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UIScreen _endObservingBacklightLevelNotifications](self, "_endObservingBacklightLevelNotifications");
  -[UIScreen _setSoftwareDimmingWindow:](self, "_setSoftwareDimmingWindow:", 0);
  -[_UIScreenFixedCoordinateSpace _setScreen:](self->_fixedCoordinateSpace, "_setScreen:", 0);
  -[BSInvalidatable invalidate](self->_caDisplayCaptureAssertion, "invalidate");
  caDisplayCaptureAssertion = self->_caDisplayCaptureAssertion;
  self->_caDisplayCaptureAssertion = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[UIScreen _invalidate](self, "_invalidate");
  _UIScreenWriteDisplayConfiguration((uint64_t)self, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)UIScreen;
  -[UIScreen dealloc](&v3, sel_dealloc);
}

- (id)_capturingAssertionForReason:(id *)a1
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  NSObject *v16;
  id *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id location;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if (!a1[32])
    {
      v4 = objc_opt_new();
      v5 = a1[32];
      a1[32] = (id)v4;

    }
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("UIScreen::capturing::%@::%@"), v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, a1);
    v10 = objc_alloc(MEMORY[0x1E0D01868]);
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __41__UIScreen__capturingAssertionForReason___block_invoke;
    v27 = &unk_1E16B7FF8;
    objc_copyWeak(&v28, &location);
    v11 = (void *)objc_msgSend(v10, "initWithIdentifier:forReason:invalidationBlock:", v9, v3, &v24);
    v12 = a1[32];
    objc_msgSend(v11, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    v14 = _capturingAssertionForReason____s_category;
    if (!_capturingAssertionForReason____s_category)
    {
      v14 = __UILogCategoryGetNode("UIScreen", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&_capturingAssertionForReason____s_category);
    }
    if ((*(_BYTE *)v14 & 1) != 0)
    {
      v16 = *(id *)(v14 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = a1;
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v17, v24, v25, v26, v27);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v21;
        v23 = objc_msgSend(a1[32], "count");
        *(_DWORD *)buf = 138543874;
        v31 = v22;
        v32 = 2048;
        v33 = v23;
        v34 = 2114;
        v35 = v11;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Screen %{public}@ is being captured, assertionCount:%lu; assertion:%{public}@",
          buf,
          0x20u);

      }
    }
    if (objc_msgSend(a1[32], "count") == 1)
      objc_msgSend(a1, "_evaluateCapturedState");
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_evaluateCapturedState
{
  uint64_t v3;
  void *v4;

  v3 = -[NSMutableSet count](self->_capturingAssertionIdentifiers, "count");
  if ((v3 != 0) != -[UIScreen isCaptured](self, "isCaptured"))
  {
    -[UIScreen _setCaptured:](self, "_setCaptured:", v3 != 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("UIScreenCapturedDidChangeNotification"), self, 0);

    -[UIScreen _updateTraitsForWindowScenesCallingParentWillTransition:](self, "_updateTraitsForWindowScenesCallingParentWillTransition:", 0);
  }
}

void __41__UIScreen__capturingAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_removeCapturingAssertion:", v3);

}

- (void)_removeCapturingAssertion:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  UIScreen *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  UIScreen *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  NSMutableSet *capturingAssertionIdentifiers;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScreen.m"), 1105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

  }
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_capturingAssertionIdentifiers, "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = self;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("UIScreen.m"), 1107, CFSTR("The provided capturing assertion %@ is not being tracked by %@"), v5, v14);
  }
  -[NSMutableSet removeObject:](self->_capturingAssertionIdentifiers, "removeObject:", v6);
  v7 = _removeCapturingAssertion____s_category;
  if (!_removeCapturingAssertion____s_category)
  {
    v7 = __UILogCategoryGetNode("UIScreen", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&_removeCapturingAssertion____s_category);
  }
  if ((*(_BYTE *)v7 & 1) != 0)
  {
    v15 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = self;
      v18 = v15;
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      capturingAssertionIdentifiers = self->_capturingAssertionIdentifiers;
      v23 = v21;
      *(_DWORD *)buf = 138543874;
      v25 = v21;
      v26 = 2048;
      v27 = -[NSMutableSet count](capturingAssertionIdentifiers, "count");
      v28 = 2114;
      v29 = v5;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Screen %{public}@ is no longer being captured, assertionCount:%lu; assertion:%{public}@",
        buf,
        0x20u);

    }
  }
  if (!-[NSMutableSet count](self->_capturingAssertionIdentifiers, "count"))
    -[UIScreen _evaluateCapturedState](self, "_evaluateCapturedState");

}

- (void)_updateAvailableDisplayModes
{
  FBSDisplayConfiguration *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  double v13;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *availableDisplayModes;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  -[FBSDisplayConfiguration availableModes](v3, "availableModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v11, "hdrMode") == 1)
        {
          objc_msgSend(v11, "pixelSize");
LABEL_12:
          if (!dyld_program_sdk_at_least())
            continue;
          goto LABEL_13;
        }
        v12 = objc_msgSend(v11, "hdrMode");
        objc_msgSend(v11, "pixelSize");
        if (v12 == 2 || v13 > 1920.0)
          goto LABEL_12;
LABEL_13:
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __40__UIScreen__updateAvailableDisplayModes__block_invoke;
        v20[3] = &unk_1E16CBD20;
        v20[4] = v11;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "filteredArrayUsingPredicate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v16, "count"))
        {
          +[UIScreenMode _screenModeForDisplayMode:mainScreen:actualDisplayScale:](UIScreenMode, "_screenModeForDisplayMode:mainScreen:actualDisplayScale:", v11, -[UIScreen _isMainScreen](self, "_isMainScreen"), self->_scale);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v17);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_158_1);
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  availableDisplayModes = self->_availableDisplayModes;
  self->_availableDisplayModes = v18;

}

BOOL __40__UIScreen__updateAvailableDisplayModes__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  _BOOL8 v11;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "pixelSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "_displayMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "pixelSize");
  v11 = v7 == v10 && v5 == v9;

  return v11;
}

uint64_t __40__UIScreen__updateAvailableDisplayModes__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
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

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "size");
  v7 = v6;
  objc_msgSend(v5, "size");
  v9 = v8;

  v10 = v7 * v9;
  objc_msgSend(v4, "size");
  v12 = v11;
  objc_msgSend(v4, "size");
  v14 = v13;

  v15 = -1;
  if (v10 >= v12 * v14)
    v15 = 1;
  if (v10 == v12 * v14)
    return 0;
  else
    return v15;
}

- (void)setDisplayConfiguration:(id)a3
{
  _UIScreenWriteDisplayConfiguration((uint64_t)self, a3, 0);
}

void __40__UIScreen__updateDisplayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
    objc_msgSend(v5, "_updateTransformLayer");

}

- (BOOL)_hasWindows
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  UIScreen *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "screen");
        v8 = (UIScreen *)objc_claimAutoreleasedReturnValue();

        if (v8 == self)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

+ (BOOL)_shouldDisableJail
{
  if (qword_1ECD79958 != -1)
    dispatch_once(&qword_1ECD79958, &__block_literal_global_162_0);
  return _MergedGlobals_47;
}

void __30__UIScreen__shouldDisableJail__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("UIApplicationShouldDisableScreenJail"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_47 = objc_msgSend(v1, "BOOLValue");

}

- (CGRect)_unjailedReferenceBoundsInPixels
{
  double scale;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  scale = self->_scale;
  v3 = self->_unjailedReferenceBounds.origin.x * scale;
  v4 = scale * self->_unjailedReferenceBounds.origin.y;
  v5 = scale * self->_unjailedReferenceBounds.size.width;
  v6 = scale * self->_unjailedReferenceBounds.size.height;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_interfaceOrientedMainSceneBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIScreen _mainSceneBoundsForInterfaceOrientation:](self, "_mainSceneBoundsForInterfaceOrientation:", -[UIScreen _interfaceOrientation](self, "_interfaceOrientation"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)_rotation
{
  FBSDisplayConfiguration *v3;
  double v4;
  double v5;
  double result;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  -[FBSDisplayConfiguration nativeOrientation](v3, "nativeOrientation");
  v5 = v4;

  result = 6.28318531 - v5;
  if (v5 == 0.0)
    return 0.0;
  return result;
}

- (int64_t)_imageOrientation
{
  double v3;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  -[UIScreen _rotation](self, "_rotation");
  if (v3 == 0.0)
    return 0;
  -[UIScreen _rotation](self, "_rotation");
  *(float *)&v5 = v5;
  if (fabsf(*(float *)&v5 + -1.5708) < 0.00000011921)
    return 3;
  -[UIScreen _rotation](self, "_rotation");
  *(float *)&v6 = v6;
  if (fabsf(*(float *)&v6 + -4.7124) >= 0.00000011921)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99750];
    -[UIScreen _rotation](self, "_rotation");
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Unsupported screen orientation: %f"), v9);
    return 0;
  }
  return 2;
}

- (CFTimeInterval)calibratedLatency
{
  FBSDisplayConfiguration *v3;
  double v4;
  double v5;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  -[FBSDisplayConfiguration latency](v3, "latency");
  v5 = v4;

  return v5;
}

- (UIScreenMode)preferredMode
{
  FBSDisplayConfiguration *v3;
  void *v4;
  void *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  if (v3)
  {
    -[FBSDisplayConfiguration preferredMode](v3, "preferredMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreenMode _screenModeForDisplayMode:mainScreen:actualDisplayScale:](UIScreenMode, "_screenModeForDisplayMode:mainScreen:actualDisplayScale:", v4, -[UIScreen _isMainScreen](self, "_isMainScreen"), self->_scale);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (UIScreenMode *)v5;
}

- (int)bitsPerComponent
{
  return *(_DWORD *)&self->_screenFlags & 0xF;
}

- (void)setBitsPerComponent:(int)a3
{
  self->_screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&self->_screenFlags & 0xFFFFFFF0 | a3 & 0xF);
}

- (void)setCurrentMode:(UIScreenMode *)currentMode
{
  FBSDisplayConfiguration *v4;
  void *v5;
  void *v6;
  UIScreenMode *v7;

  v7 = currentMode;
  *(_DWORD *)&self->_screenFlags |= 0x10u;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v4 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  if (v7 && v4)
  {
    +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScreenMode _displayMode](v7, "_displayMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nativePixelSize");
    objc_msgSend(v5, "_setScreenRequestedDisplayNativePixelSize:");

  }
}

- (NSArray)availableModes
{
  FBSDisplayConfiguration *displayConfiguration;
  NSArray *availableDisplayModes;
  void *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  displayConfiguration = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  if (displayConfiguration)
  {
    availableDisplayModes = self->_availableDisplayModes;
    if (!availableDisplayModes)
    {
      -[UIScreen _updateAvailableDisplayModes](self, "_updateAvailableDisplayModes");
      availableDisplayModes = self->_availableDisplayModes;
    }
    v5 = (void *)-[NSArray copy](availableDisplayModes, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v5;
}

- (void)setOverscanCompensation:(UIScreenOverscanCompensation)overscanCompensation
{
  FBSDisplayConfiguration *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  self->_screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&self->_screenFlags & 0xFFFFFC7F | ((overscanCompensation & 3) << 8) | 0x80);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v5 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = 1;
    if (overscanCompensation == UIScreenOverscanCompensationInsetBounds)
      v8 = 2;
    if (overscanCompensation == UIScreenOverscanCompensationNone)
      v9 = 0;
    else
      v9 = v8;
    objc_msgSend(v6, "_setScreenRequestedOverscanCompensation:", v9);
  }
  else
  {
    v10 = qword_1ECD79970;
    if (!qword_1ECD79970)
    {
      v10 = __UILogCategoryGetNode("OverscanCompensation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&qword_1ECD79970);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Requesting to set overscan compensation when we do not have a window scene", v12, 2u);
    }
  }

}

- (unsigned)_integerDisplayID
{
  void *v2;
  unsigned int v3;

  -[UIScreen displayIdentity](self, "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayID");

  return v3;
}

- (unsigned)_seed
{
  FBSDisplayConfiguration *v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  -[FBSDisplayConfiguration CADisplay](v3, "CADisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v4, "seed");
  return v3;
}

- (void)_limitedUIDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__UIScreen__limitedUIDidChange___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __32__UIScreen__limitedUIDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("UIScreenCarScreenLimitedUIDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);

}

- (void)_externalDeviceNightModeDidChange:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  _QWORD v7[5];
  char v8;

  -[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nightMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__UIScreen__externalDeviceNightModeDidChange___block_invoke;
  v7[3] = &unk_1E16B1B78;
  v7[4] = self;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v7);
}

uint64_t __46__UIScreen__externalDeviceNightModeDidChange___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 208) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 208) & 0xFFFFBFFF | (*(unsigned __int8 *)(a1 + 40) << 14);
  return objc_msgSend(*(id *)(a1 + 32), "_updateTraits");
}

- (void)_clearCarPlayHumanPresenceState
{
  *(_BYTE *)&self->_carPlayHumanPresenceStatus &= ~1u;
}

- (void)_fetchInitialCarPlayHumanPresenceStatusIfNeeded
{
  FBSDisplayConfiguration *v3;
  void *v4;
  uint64_t v5;

  if (-[UIScreen _isCarScreen](self, "_isCarScreen"))
  {
    if ((*(_BYTE *)&self->_carPlayHumanPresenceStatus & 1) == 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
      v3 = self->__displayConfiguration;
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
      -[FBSDisplayConfiguration hardwareIdentifier](v3, "hardwareIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      HIBYTE(v5) = 0;
      LODWORD(v5) = 0;
      BKSHIDServicesGetHumanPresenceStatus();
      *(_BYTE *)&self->_carPlayHumanPresenceStatus = *(_BYTE *)&self->_carPlayHumanPresenceStatus & 0xFC | 1;
      -[UIScreen _setCarPlayHumanPresenceInRange:](self, "_setCarPlayHumanPresenceInRange:", 0, v5);

    }
  }
}

- (BOOL)_supportsCarPlayHumanPresence
{
  -[UIScreen _fetchInitialCarPlayHumanPresenceStatusIfNeeded](self, "_fetchInitialCarPlayHumanPresenceStatusIfNeeded");
  return (*(_BYTE *)&self->_carPlayHumanPresenceStatus >> 1) & 1;
}

- (BOOL)_isCarPlayHumanPresenceInRange
{
  -[UIScreen _fetchInitialCarPlayHumanPresenceStatusIfNeeded](self, "_fetchInitialCarPlayHumanPresenceStatusIfNeeded");
  return (*(_BYTE *)&self->_carPlayHumanPresenceStatus >> 2) & 1;
}

- (void)_setCarPlayHumanPresenceInRange:(BOOL)a3
{
  char carPlayHumanPresenceStatus;
  _BOOL8 v4;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  carPlayHumanPresenceStatus = (char)self->_carPlayHumanPresenceStatus;
  if (((((carPlayHumanPresenceStatus & 4) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    if (a3)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->_carPlayHumanPresenceStatus = carPlayHumanPresenceStatus & 0xFB | v6;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("IsCarPlayHumanPresenceInRange");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("UIScreenCarPlayHumanPresenceDidChangeNotification"), self, v9);

  }
}

- (BOOL)_expectsSecureRendering
{
  FBSDisplayConfiguration *v3;
  char v4;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  v4 = -[FBSDisplayConfiguration expectsSecureRendering](v3, "expectsSecureRendering");

  return v4;
}

- (CGFloat)currentEDRHeadroom
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  -[UIScreen displayIdentity](self, "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "displayID");
    CADisplayGetCurrentHeadroom();
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (CGFloat)potentialEDRHeadroom
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  -[UIScreen displayIdentity](self, "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "displayID");
    CADisplayGetPotentialHeadroom();
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (void)_setScale:(double)a3
{
  self->_scale = a3;
}

- (double)_pointsPerInch
{
  -[UIScreen _ensureComputedMainScreenDPI](self, "_ensureComputedMainScreenDPI");
  return self->_pointsPerInch;
}

- (BOOL)_isValidInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)_disconnectScreen
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  UIScreen *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)&self->_screenFlags &= ~0x40u;
  v3 = _disconnectScreen___s_category;
  if (!_disconnectScreen___s_category)
  {
    v3 = __UILogCategoryGetNode("UIScreen", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&_disconnectScreen___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = self;
    v7 = v4;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138543362;
    v13 = v10;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Disconnecting screen: %{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("_UIScreenDidDisconnectNotification"), self, 0);
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("UIScreenDidDisconnectNotification"), self, 0);
  -[UIScreen _invalidate](self, "_invalidate");

}

- (id)_preventDisconnectionForReason:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && (*(_DWORD *)(a1 + 208) & 0x60) == 0x20)
  {
    if (!*(_QWORD *)(a1 + 264))
    {
      v4 = objc_opt_new();
      v5 = *(void **)(a1 + 264);
      *(_QWORD *)(a1 + 264) = v4;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIScreen-%p-%lu"), a1, ++qword_1ECD79978);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0D01868]);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __43__UIScreen__preventDisconnectionForReason___block_invoke;
    v21[3] = &unk_1E16CBD68;
    v21[4] = a1;
    v8 = (void *)objc_msgSend(v7, "initWithIdentifier:forReason:queue:invalidationBlock:", v6, v3, MEMORY[0x1E0C80D38], v21);
    objc_msgSend(*(id *)(a1 + 264), "addObject:", v8);
    v9 = qword_1ECD79980;
    if (!qword_1ECD79980)
    {
      v9 = __UILogCategoryGetNode("UIScreen", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&qword_1ECD79980);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = (id)a1;
      v13 = v10;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = *(void **)(a1 + 264);
      v18 = v16;
      v19 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 138543874;
      v23 = v16;
      v24 = 2048;
      v25 = v19;
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "Preventing disconnection of screen: %{public}@; assertionsCount: %lu; assertion: %{public}@",
        buf,
        0x20u);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __43__UIScreen__preventDisconnectionForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  if (v2)
  {
    if ((objc_msgSend(*(id *)(v2 + 264), "containsObject:", v3) & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          v19 = *(_QWORD *)(v2 + 264);
          *(_DWORD *)buf = 138412546;
          v21 = v3;
          v22 = 2112;
          v23 = v19;
          _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Attempting to remove untracked disconnectionPreventionAssertion: %@; _disconnectionPreventionAssertions: %@",
            buf,
            0x16u);
        }

      }
      else
      {
        v15 = qword_1ECD79988;
        if (!qword_1ECD79988)
        {
          v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v15, (unint64_t *)&qword_1ECD79988);
        }
        v16 = *(NSObject **)(v15 + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = *(_QWORD *)(v2 + 264);
          *(_DWORD *)buf = 138412546;
          v21 = v3;
          v22 = 2112;
          v23 = v17;
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Attempting to remove untracked disconnectionPreventionAssertion: %@; _disconnectionPreventionAssertions: %@",
            buf,
            0x16u);
        }
      }
    }
    v4 = qword_1ECD79990;
    if (!qword_1ECD79990)
    {
      v4 = __UILogCategoryGetNode("UIScreen", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&qword_1ECD79990);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (id)v2;
      v8 = v5;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v10, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = *(void **)(v2 + 264);
      v13 = v11;
      v14 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 138543874;
      v21 = v11;
      v22 = 2048;
      v23 = v14;
      v24 = 2114;
      v25 = v3;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "Removing disconnectionPreventionAssertion from screen: %{public}@; assertionsCount: %lu; assertion: %{public}@; ",
        buf,
        0x20u);

    }
    objc_msgSend(*(id *)(v2 + 264), "removeObject:", v3);
    if (!objc_msgSend(*(id *)(v2 + 264), "count") && (*(_BYTE *)(v2 + 208) & 0x40) != 0)
      objc_msgSend((id)v2, "_disconnectScreen");
  }

}

- (void)_resetUserInterfaceIdiom
{
  -[UIScreen _updateUserInterfaceIdiom](self, "_updateUserInterfaceIdiom");
  -[UIScreen _updateTraits](self, "_updateTraits");
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[UIScreen convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[UIScreen convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)_traitTrace:(id)a3
{
  return _UITraitTraceForTraitEnvironmentAndQueryString(self, a3);
}

- (id)_traitTrace
{
  return -[UIScreen _traitTrace:](self, "_traitTrace:", 0);
}

- (void)_setOverrideTraitCollection:(id)a3
{
  UITraitCollection *v5;
  UITraitCollection *overrideTraitCollection;
  BOOL v7;
  UITraitCollection *defaultTraitCollection;
  UITraitCollection *v9;
  UITraitCollection *v10;

  v5 = (UITraitCollection *)a3;
  overrideTraitCollection = self->_overrideTraitCollection;
  if (overrideTraitCollection != v5)
  {
    v10 = v5;
    v7 = -[UITraitCollection isEqual:](overrideTraitCollection, "isEqual:", v5);
    v5 = v10;
    if (!v7)
    {
      defaultTraitCollection = v10;
      if (!v10)
        defaultTraitCollection = self->_defaultTraitCollection;
      v9 = defaultTraitCollection;
      if (-[UIScreen _isMainScreen](self, "_isMainScreen"))
      {
        os_unfair_lock_lock((os_unfair_lock_t)&_UIMainScreenTraitCollectionLock);
        objc_storeStrong((id *)&self->_overrideTraitCollection, a3);
        os_unfair_lock_unlock((os_unfair_lock_t)&_UIMainScreenTraitCollectionLock);
      }
      else
      {
        objc_storeStrong((id *)&self->_overrideTraitCollection, a3);
      }
      -[UIScreen _notifyTraitsChangedAndPropagate](self, "_notifyTraitsChangedAndPropagate");

      v5 = v10;
    }
  }

}

- (void)_setCapability:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  NSDictionary *capabilities;
  id v12;

  if (a3 && a4)
  {
    v6 = a4;
    v7 = a3;
    -[UIScreen _capabilities](self, "_capabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    if (v8)
      v9 = (NSDictionary *)objc_msgSend(v8, "mutableCopy");
    else
      v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = v9;
    -[NSDictionary setObject:forKey:](v9, "setObject:forKey:", v7, v6);

    capabilities = self->_capabilities;
    self->_capabilities = v10;

    -[UIScreen _computeMetrics](self, "_computeMetrics");
  }
}

- (void)_setSceneProvidedDisplayCornerRadius:(double)a3
{
  self->_sceneProvidedCornerRadius = a3;
}

+ (id)__displayConfigurationsForViewService
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[UIScreen _screens]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v8, "_isMainScreen", (_QWORD)v12) & 1) == 0
          && (!objc_msgSend((id)UIApp, "_isSpringBoard") || (objc_msgSend(v8, "_isCarScreen") & 1) == 0))
        {
          objc_msgSend(v8, "displayConfiguration");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_msgSend(v2, "copy");
  return v10;
}

- (id)fbsDisplay
{
  FBSDisplayConfiguration *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  return v3;
}

- (id)_eventDisplay
{
  BKSHIDEventDisplay *eventDisplay;
  void *v4;
  BKSHIDEventDisplay *v5;
  BKSHIDEventDisplay *v6;

  eventDisplay = self->__eventDisplay;
  if (!eventDisplay)
  {
    -[UIScreen _displayID](self, "_displayID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(MEMORY[0x1E0D00CF8], "displayWithHardwareIdentifier:", v4);
    else
      objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
    v5 = (BKSHIDEventDisplay *)objc_claimAutoreleasedReturnValue();
    v6 = self->__eventDisplay;
    self->__eventDisplay = v5;

    eventDisplay = self->__eventDisplay;
  }
  return eventDisplay;
}

- (BOOL)_isWorkspaceCapable
{
  FBSDisplayConfiguration *v4;
  char v5;

  if (-[UIScreen _isMainLikeScreen](self, "_isMainLikeScreen"))
    return 1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v4 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  v5 = -[FBSDisplayConfiguration isCarDisplay](v4, "isCarDisplay");

  return v5;
}

- (BOOL)_isSoftKeyboardLimited
{
  return -[UIScreen _isUserInterfaceLimited:](self, "_isUserInterfaceLimited:", 1);
}

- (BOOL)_areMusicListsLimited
{
  return -[UIScreen _isUserInterfaceLimited:](self, "_isUserInterfaceLimited:", 8);
}

- (BOOL)_isCarPlayNightModeEnabled
{
  _BOOL4 v3;

  if (-[UIScreen _userInterfaceIdiom](self, "_userInterfaceIdiom") == 3)
    return (*((unsigned __int8 *)&self->_screenFlags + 1) >> 6) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)_isRightHandDrive
{
  _BOOL4 v3;

  if (-[UIScreen _userInterfaceIdiom](self, "_userInterfaceIdiom") == 3)
    return (*((unsigned __int8 *)&self->_screenFlags + 1) >> 5) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (id)_display
{
  FBSDisplayConfiguration *v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD79930);
  v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD79930);
  -[FBSDisplayConfiguration CADisplay](v3, "CADisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)_mainSceneFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  double v17;
  double v18;
  CGRect result;

  if (-[UIScreen _isMainScreen](self, "_isMainScreen")
    && !+[UIApplication _isClassic](UIApplication, "_isClassic"))
  {
    objc_msgSend((id)UIApp, "_mainScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[UIScreen _referenceBounds](self, "_referenceBounds");
    v3 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(-[UIScreen _interfaceOrientation](self, "_interfaceOrientation"), v10, v12, v14, v16, v17, v18);
  }
  else if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    -[UIScreen _interfaceOrientedMainSceneBounds](self, "_interfaceOrientedMainSceneBounds");
  }
  else
  {
    -[UIScreen _mainSceneReferenceBounds](self, "_mainSceneReferenceBounds");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_lazySoftwareDimmingWindow
{
  UISoftwareDimmingWindow *v3;
  UISoftwareDimmingWindow *v4;
  void *v5;

  -[UIScreen _softwareDimmingWindow](self, "_softwareDimmingWindow");
  v3 = (UISoftwareDimmingWindow *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [UISoftwareDimmingWindow alloc];
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v3 = -[UISoftwareDimmingWindow initWithFrame:](v4, "initWithFrame:");

    -[UIScreen _setSoftwareDimmingWindow:](self, "_setSoftwareDimmingWindow:", v3);
    -[UIWindow setHidden:](v3, "setHidden:", 0);
  }
  return v3;
}

- (float)rawBrightnessForBacklightLevel:(float)a3
{
  void *v4;
  float v5;
  float v6;

  -[UIScreen _softwareDimmingWindow](self, "_softwareDimmingWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayLevel");
  v6 = v5 + a3;

  return v6;
}

- (void)_postBrightnessDidChangeNotificationIfAppropriate
{
  void *v3;
  float v4;
  float v5;
  double v6;
  void *v7;
  id v8;

  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("UIScreenBrightnessDidChangeNotification"), self);

  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_backlightLevel");
    v5 = v4;

    -[UIScreen _lastNotifiedBacklightLevel](self, "_lastNotifiedBacklightLevel");
    if (*(float *)&v6 != v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("UIScreenBrightnessDidChangeNotification"), self);

    }
    *(float *)&v6 = v5;
    -[UIScreen _setLastNotifiedBacklightLevel:](self, "_setLastNotifiedBacklightLevel:", v6);
  }
}

- (void)_endObservingBacklightLevelNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  if (-[UIScreen _isEmbeddedScreen](self, "_isEmbeddedScreen"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("UIBacklightLevelChangedNotification"), 0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x1E0DDE150], 0);
  }
}

- (void)setBrightness:(CGFloat)brightness
{
  float v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  double v18;
  float v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  NSObject *v30;
  unint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint8_t v35[8];
  _QWORD v36[3];
  _QWORD v37[4];

  v37[3] = *MEMORY[0x1E0C80C00];
  if (-[UIScreen _supportsBrightness](self, "_supportsBrightness"))
  {
    v5 = brightness;
    v6 = 0.0;
    if (v5 < 0.0)
      v5 = 0.0;
    if (v5 <= 1.0)
      v7 = v5;
    else
      v7 = 1.0;
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_backlightLevel");
    v10 = v9;

    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_softwareDimmingAlpha");
    v13 = v12;

    *(float *)&v14 = v10;
    -[UIScreen rawBrightnessForBacklightLevel:](self, "rawBrightnessForBacklightLevel:", v14);
    v16 = v13 + 1.0;
    v17 = (float)(v13 + v15) / v16;
    if (v7 != v17)
    {
      v18 = v16 * v7 - v13;
      *(float *)&v18 = v18;
      if (self->_wantsSoftwareDimming)
        v19 = *(float *)&v18;
      else
        v19 = v7;
      if (v19 >= 0.0)
        v6 = v19;
      if (v6 != v10)
      {
        *(float *)&v18 = v6;
        -[UIScreen _setLastNotifiedBacklightLevel:](self, "_setLastNotifiedBacklightLevel:", v18);
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v21 = v6;
        objc_msgSend(v20, "_setBacklightLevel:", v21);

        v36[0] = CFSTR("CurrLevel");
        *(float *)&v22 = v6;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v23;
        v36[1] = CFSTR("PrevLevel");
        *(float *)&v24 = v10;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v25;
        v36[2] = CFSTR("Timestamp");
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v37[2] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        PLLogRegisteredEvent();
      }
      if (v19 < 0.0)
      {
        -[UIScreen _lazySoftwareDimmingWindow](self, "_lazySoftwareDimmingWindow");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v29 = v19;
        objc_msgSend(v28, "setOverlayLevel:", v29);

        -[UIScreen _lazySoftwareDimmingWindow](self, "_lazySoftwareDimmingWindow");
        v30 = objc_claimAutoreleasedReturnValue();
        -[NSObject setHidden:](v30, "setHidden:", 0);
LABEL_17:

        return;
      }
      -[UIScreen _softwareDimmingWindow](self, "_softwareDimmingWindow");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        -[UIScreen _softwareDimmingWindow](self, "_softwareDimmingWindow");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setHidden:", 1);

        -[UIScreen _setSoftwareDimmingWindow:](self, "_setSoftwareDimmingWindow:", 0);
      }
    }
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_fault_impl(&dword_185066000, v30, OS_LOG_TYPE_FAULT, "The brightness property is only supported by the main screen.", v35, 2u);
      }
      goto LABEL_17;
    }
    v31 = setBrightness____s_category;
    if (!setBrightness____s_category)
    {
      v31 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v31, (unint64_t *)&setBrightness____s_category);
    }
    v32 = *(NSObject **)(v31 + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "The brightness property is only supported by the main screen.", v35, 2u);
    }
  }
}

- (NSString)debugDescription
{
  return (NSString *)-[UIScreen debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIScreen succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScreen bounds](self, "bounds");
  v4 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("bounds"));
  -[UIScreen currentMode](self, "currentMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("mode"));
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FakeMainScreen, (uint64_t)CFSTR("FakeMainScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD765AC)
  {
    v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[UIScreen _isMainScreen](self, "_isMainScreen"), CFSTR("isMainScreen"));
    v8 = (id)objc_msgSend(v3, "appendBool:withName:", self->_isFakeScreen, CFSTR("isFakeScreen"));
  }

  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIScreen descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _BYTE *v14;
  _BOOL8 v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  int8x16_t v26;
  int8x16_t v27;
  _QWORD v28[4];
  int8x16_t v29;
  _QWORD v30[4];
  int8x16_t v31;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "displayIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("displayIdentity"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "_isMainLikeScreen"), CFSTR("isMainLikeScreen"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "_isExternal"), CFSTR("isExternal"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 208) >> 5) & 1, CFSTR("connected"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 208) >> 6) & 1, CFSTR("needsDisconnection"));
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FakeMainScreen, (uint64_t)CFSTR("FakeMainScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1ECD765AC)
  {
    v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 216), CFSTR("isFakeScreen"));
  }
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendReferenceDisplayModeStatus:withName:skipIfNotSupported:", objc_msgSend(*(id *)(a1 + 40), "referenceDisplayModeStatus"), CFSTR("referenceDisplayModeStatus"), 1);
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendUserInterfaceIdiom:withName:", objc_msgSend(*(id *)(a1 + 40), "_userInterfaceIdiom"), CFSTR("userInterfaceIdiom"));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "_interfaceOrientation"), CFSTR("interfaceOrientation"));
  v13 = *(void **)(a1 + 32);
  v14 = *(_BYTE **)(a1 + 40);
  v15 = v14
     && objc_msgSend(*(id *)(a1 + 40), "_isExternal")
     && objc_msgSend(v14, "_isMainLikeScreen")
     && (v14[210] & 1) == 0;
  v16 = (id)objc_msgSend(v13, "appendBool:withName:", v15, CFSTR("ignoresOrientationForBounds"));
  v17 = *(_QWORD *)(a1 + 40);
  v18 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(v17 + 264))
  {
    v19 = *(void **)(a1 + 32);
    objc_msgSend(v19, "activeMultilinePrefix");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v18;
    v30[1] = 3221225472;
    v30[2] = __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v30[3] = &unk_1E16B1B50;
    v26 = *(int8x16_t *)(a1 + 32);
    v21 = (id)v26.i64[0];
    v31 = vextq_s8(v26, v26, 8uLL);
    objc_msgSend(v19, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("disconnectionPreventionAssertions"), v20, v30);

    v17 = *(_QWORD *)(a1 + 40);
  }
  v22 = *(void **)(v17 + 256);
  if (v22)
  {
    if (objc_msgSend(v22, "count"))
    {
      v23 = *(void **)(a1 + 32);
      objc_msgSend(v23, "activeMultilinePrefix");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v18;
      v28[1] = 3221225472;
      v28[2] = __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke_4;
      v28[3] = &unk_1E16B1B50;
      v27 = *(int8x16_t *)(a1 + 32);
      v25 = (id)v27.i64[0];
      v29 = vextq_s8(v27, v27, 8uLL);
      objc_msgSend(v23, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("capturingAssertions"), v24, v28);

    }
  }
}

void __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 264);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), 0, (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 256);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), 0, (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (id)_shortScreensDescription
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  int v16;
  const __CFString *v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize v27;

  v26 = *MEMORY[0x1E0C80C00];
  +[UIScreen _screens]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v19 = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu screen(s): "), objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[UIScreen _screens]();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v12 = objc_opt_class();
        objc_msgSend(v11, "bounds");
        v27.width = v13;
        v27.height = v14;
        NSStringFromCGSize(v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v11, "_isMainLikeScreen");
        v17 = CFSTR("NO");
        if (v16)
          v17 = CFSTR("YES");
        objc_msgSend(v6, "appendFormat:", CFSTR("<%@: %p; bounds = %@; mainLike=%@> "), v12, a1, v15, v17);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  return v6;
}

+ (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4
{
  double y;
  double x;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v6, "window");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v7, "convertPoint:fromWindow:", 0, x, y);
  objc_msgSend(v6, "convertPoint:fromView:", 0);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

+ (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4
{
  double y;
  double x;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v6, "window");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  objc_msgSend(v8, "convertPoint:toWindow:", 0);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

+ (CGRect)convertRect:(CGRect)a3 toView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v8, "window");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v9, "convertRect:fromWindow:", 0, x, y, width, height);
  objc_msgSend(v8, "convertRect:fromView:", 0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)_snapshotExcludingWindows:(id)a3 withRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = (void *)MEMORY[0x1E0C99DE8];
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:", 1, 1, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "count"))
    objc_msgSend(v12, "removeObjectsInArray:", v9);
  _UISnapshotWindowsCompatibilityRect(v12, self, x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (UIFocusSystem)_focusSystem
{
  void *v2;
  void *v3;

  -[UIScreen _preferredFocusedWindowScene](self, "_preferredFocusedWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFocusSystem *)v3;
}

- (BOOL)_isFocusSystemLoaded
{
  void *v2;
  void *v3;

  -[UIScreen _preferredFocusedWindowScene](self, "_preferredFocusedWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (void)setFocusEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[UIScreen _preferredFocusedWindowScene](self, "_preferredFocusedWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusSystem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_setEnabled:", v3);
}

- (id)focusedItem
{
  void *v2;
  void *v3;
  void *v4;

  -[UIScreen _preferredFocusedWindowScene](self, "_preferredFocusedWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "focusedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)supportsFocus
{
  void *v3;
  void *v4;
  char v5;

  -[UIScreen _preferredFocusedWindowScene](self, "_preferredFocusedWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _UIFocusBehaviorForScene(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wantsFocusSystemForScene:", v3);

  return v5;
}

- (BOOL)_supportsDeferredFocus
{
  void *v2;
  BOOL v3;

  -[UIScreen traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "primaryInteractionModel") == 1;

  return v3;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  __UIFocusEnvironmentPreferredFocusedView(self, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

- (void)setNeedsFocusUpdate
{
  void *v3;
  _UIFocusUpdateRequest *v4;

  v4 = -[_UIFocusUpdateRequest initWithEnvironment:]([_UIFocusUpdateRequest alloc], "initWithEnvironment:", self);
  -[UIScreen _focusSystem](self, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_requestFocusUpdate:", v4);

}

- (void)updateFocusIfNeeded
{
  id v2;

  -[UIScreen _focusSystem](self, "_focusSystem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFocusIfNeeded");

}

- (void)_setNeedsNonDeferredFocusUpdate
{
  _UIFocusUpdateRequest *v3;
  void *v4;
  void *v5;
  _UIFocusUpdateRequest *v6;

  v3 = [_UIFocusUpdateRequest alloc];
  -[UIScreen _focusSystem](self, "_focusSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIFocusUpdateRequest initWithEnvironment:](v3, "initWithEnvironment:", v4);

  -[_UIFocusUpdateRequest setAllowsDeferral:](v6, "setAllowsDeferral:", 0);
  -[UIScreen _focusSystem](self, "_focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_requestFocusUpdate:", v6);

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  UIScreen *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIScreen _userInterfaceIdiom](self, "_userInterfaceIdiom") == 3)
  {
    -[UIScreen _preferredFocusedWindow](self, "_preferredFocusedWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v8, "addObject:", v9);

  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "screen");
          v16 = (UIScreen *)objc_claimAutoreleasedReturnValue();

          if (v16 == self)
          {
            objc_msgSend(v15, "_focusSystemSceneComponent");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              objc_msgSend(v17, "focusSystem");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "focusItemContainer");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "focusItemsInRect:", x, y, width, height);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObjectsFromArray:", v21);

            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

  }
  return v8;
}

- (_UIDragManager)_dragManager
{
  _UIDragManager *v3;
  _UIDragManager *dragManager;

  if (!self->_dragManager && -[UIScreen _supportsDragging](self, "_supportsDragging"))
  {
    v3 = -[_UIDragManager initWithScreen:]([_UIDragManager alloc], "initWithScreen:", self);
    dragManager = self->_dragManager;
    self->_dragManager = v3;

  }
  return self->_dragManager;
}

- (BOOL)_supportsDragging
{
  unint64_t v3;

  v3 = -[UIScreen _userInterfaceIdiom](self, "_userInterfaceIdiom");
  if (v3 - 5 < 2)
    return 1;
  if (v3 > 1)
    return 0;
  return -[UIScreen _isMainLikeScreen](self, "_isMainLikeScreen");
}

- (_UIInteractiveHighlightEnvironment)_interactiveHighlightEnvironment
{
  _UIInteractiveHighlightEnvironment *interactiveHighlightEnvironment;
  _UIInteractiveHighlightEnvironment *v4;
  _UIInteractiveHighlightEnvironment *v5;

  interactiveHighlightEnvironment = self->_interactiveHighlightEnvironment;
  if (!interactiveHighlightEnvironment)
  {
    v4 = -[_UIInteractiveHighlightEnvironment initWithContainerScreen:]([_UIInteractiveHighlightEnvironment alloc], "initWithContainerScreen:", self);
    v5 = self->_interactiveHighlightEnvironment;
    self->_interactiveHighlightEnvironment = v4;

    interactiveHighlightEnvironment = self->_interactiveHighlightEnvironment;
  }
  return interactiveHighlightEnvironment;
}

- (UITraitCollection)_overrideTraitCollection
{
  return self->_overrideTraitCollection;
}

- (UITraitCollection)_lastNotifiedTraitCollection
{
  return self->_lastNotifiedTraitCollection;
}

- (BOOL)_isPerformingSystemSnapshot
{
  return self->_performingSystemSnapshot;
}

- (void)_setPerformingSystemSnapshot:(BOOL)a3
{
  self->_performingSystemSnapshot = a3;
}

- (BOOL)wantsSoftwareDimming
{
  return self->_wantsSoftwareDimming;
}

- (UISoftwareDimmingWindow)_softwareDimmingWindow
{
  return self->_softwareDimmingWindow;
}

- (void)_setSoftwareDimmingWindow:(id)a3
{
  objc_storeStrong((id *)&self->_softwareDimmingWindow, a3);
}

- (float)_lastNotifiedBacklightLevel
{
  return self->_lastNotifiedBacklightLevel;
}

- (void)_setLastNotifiedBacklightLevel:(float)a3
{
  self->_lastNotifiedBacklightLevel = a3;
}

- (void)_setCaptured:(BOOL)a3
{
  self->_captured = a3;
}

- (UIScreenReferenceDisplayModeStatus)referenceDisplayModeStatus
{
  return self->_referenceDisplayModeStatus;
}

- (void)_setUIIBAlwaysProvidePeripheryInsets:(BOOL)a3
{
  self->__UIIBAlwaysProvidePeripheryInsets = a3;
}

- (CARSessionStatus)_carSessionStatus
{
  return self->_carSessionStatus;
}

- (void)setCarSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_carSessionStatus, a3);
}

- (void)_setBoundingPathUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_boundingPathUtilities, a3);
}

- (void)_setMainScreen:(BOOL)a3
{
  self->_mainScreen = a3;
}

- (UIFocusEnvironment)_focusedWindow
{
  return self->__focusedWindow;
}

- (void)_setFocusedWindow:(id)a3
{
  self->__focusedWindow = (UIFocusEnvironment *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingPathUtilities, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_interactiveHighlightEnvironment, 0);
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_softwareDimmingWindow, 0);
  objc_storeStrong((id *)&self->_disconnectionPreventionAssertions, 0);
  objc_storeStrong((id *)&self->_capturingAssertionIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastNotifiedTraitCollection, 0);
  objc_storeStrong((id *)&self->_overrideTraitCollection, 0);
  objc_storeStrong((id *)&self->_defaultTraitCollection, 0);
  objc_storeStrong((id *)&self->_caDisplayCaptureAssertion, 0);
  objc_storeStrong((id *)&self->__eventDisplay, 0);
  objc_storeStrong((id *)&self->__displayConfiguration, 0);
  objc_storeStrong((id *)&self->_displayInfoProvider, 0);
  objc_storeStrong((id *)&self->_fixedCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_availableDisplayModes, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_initialDisplayContext, 0);
}

- (UIView)snapshotViewAfterScreenUpdates:(BOOL)afterUpdates
{
  return (UIView *)_UISnapshotScreenCompatibilityRectAfterCommit(self, afterUpdates, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
}

- (id)snapshotView
{
  return _UISnapshotScreenCompatibilityRectAfterCommit(self, 0, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
}

- (id)_orientationDebugDescriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

  v7 = (id)objc_msgSend(v6, "ui_appendInterfaceOrientation:withName:", -[UIScreen _interfaceOrientation](self, "_interfaceOrientation"), CFSTR("orientation"));
  -[UIScreen applicationFrame](self, "applicationFrame");
  v8 = (id)objc_msgSend(v6, "appendRect:withName:", CFSTR("applicationFrame"));
  return v6;
}

- (id)_orientationDebugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIScreen _orientationDebugDescriptionBuilderWithMultilinePrefix:](self, "_orientationDebugDescriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_orientationDebugDescription
{
  return -[UIScreen _orientationDebugDescriptionWithMultilinePrefix:](self, "_orientationDebugDescriptionWithMultilinePrefix:", 0);
}

- (id)_appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__UIScreen_SnapshottingSupport___snapshotDisplaySystemIdentifier__block_invoke;
    v12[3] = &unk_1E16B79A8;
    v12[4] = a1;
    +[_UISceneLifecycleMultiplexer mostActiveSceneWithTest:](_UISceneLifecycleMultiplexer, "mostActiveSceneWithTest:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "renderingEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemDisplayIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = *MEMORY[0x1E0CD30B8];
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD30B8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v13 = v7;
        v14[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "bs_dictionaryByAddingEntriesFromDictionary:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v3 = (id)v10;
      }
    }
    v3 = v3;

    a1 = v3;
  }

  return a1;
}

BOOL __65__UIScreen_SnapshottingSupport___snapshotDisplaySystemIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(v3, "_hostsWindows"))
  {
    objc_msgSend(v3, "_screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == *(void **)(a1 + 32);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
