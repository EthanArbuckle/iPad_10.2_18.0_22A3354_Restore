@implementation UIToolbar

- (BOOL)_subclassImplementsDrawRect
{
  uint64_t v3;
  BOOL v4;

  if (!__drawRectUIToolbarIMP)
    __drawRectUIToolbarIMP = +[UIToolbar instanceMethodForSelector:](UIToolbar, "instanceMethodForSelector:", sel_drawRect_);
  v3 = -[UIToolbar methodForSelector:](self, "methodForSelector:", sel_drawRect_);
  if (v3)
    v4 = v3 == __drawRectUIToolbarIMP;
  else
    v4 = 1;
  return !v4;
}

- (BOOL)_hostsLayoutEngineAllowsTAMIC_NO
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UIToolbarVisualProvider defaultSizeForOrientation:](self->_visualProvider, "defaultSizeForOrientation:", -[UIToolbar _expectedInterfaceOrientation](self, "_expectedInterfaceOrientation"));
  v3 = -1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (BOOL)isTranslucent
{
  unint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 IsTranslucentOnScreen;
  int v7;
  BOOL result;
  void *v9;
  uint64_t v10;

  v3 = *(_WORD *)&self->_toolbarFlags & 7;
  -[UIToolbar _effectiveBarTintColor](self, "_effectiveBarTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsTranslucentOnScreen = _UIBarStyleWithTintColorIsTranslucentOnScreen(v3, (uint64_t)v4, v5);

  v7 = (*(_WORD *)&self->_toolbarFlags >> 3) & 7;
  if (v7)
    return v7 == 1;
  -[UIView _screen](self, "_screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_userInterfaceIdiom");

  result = v10 != 3 && IsTranslucentOnScreen;
  if (v10 == 3 && IsTranslucentOnScreen)
    return (*(_WORD *)&self->_toolbarFlags & 7) != 3;
  return result;
}

- (UIColor)barTintColor
{
  return self->_barTintColor;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  -[UIView superview](self, "superview", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    width = v7;
  }
  else if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[_UIToolbarVisualProvider defaultSizeForOrientation:](self->_visualProvider, "defaultSizeForOrientation:", -[UIToolbar _expectedInterfaceOrientation](self, "_expectedInterfaceOrientation"));
    width = v8;
  }
  -[_UIToolbarVisualProvider defaultSizeForOrientation:](self->_visualProvider, "defaultSizeForOrientation:", -[UIToolbar _expectedInterfaceOrientation](self, "_expectedInterfaceOrientation"));
  v10 = v9;

  v11 = width;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int64_t)_expectedInterfaceOrientation
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  id WeakRetained;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  if ((*(_WORD *)&self->_toolbarFlags & 0x200) == 0)
  {
    v3 = 0;
LABEL_8:
    v5 = 1;
    goto LABEL_9;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "_toolbarWindowForInterfaceOrientation:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_8;
LABEL_2:
  v4 = objc_msgSend(v3, "_windowInterfaceOrientation");
  if (!v4)
    v4 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v3);
  v5 = v4;
LABEL_9:

  return v5;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  double v9;
  double v10;
  _BOOL8 v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[UIToolbar isMinibar](self, "isMinibar");
  -[UIView bounds](self, "bounds");
  v11 = height != v10 || width != v9;
  v12.receiver = self;
  v12.super_class = (Class)UIToolbar;
  -[UIView setBounds:](&v12, sel_setBounds_, x, y, width, height);
  -[UIToolbar _frameOrBoundsChangedWithVisibleSizeChange:wasMinibar:](self, "_frameOrBoundsChangedWithVisibleSizeChange:wasMinibar:", v11, v8);
}

- (void)_frameOrBoundsChangedWithVisibleSizeChange:(BOOL)a3 wasMinibar:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (a3)
  {
    -[_UIToolbarVisualProvider updateBarBackgroundSize](self->_visualProvider, "updateBarBackgroundSize");
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
  if (-[UIToolbar isMinibar](self, "isMinibar") != v4)
    -[_UIToolbarVisualProvider updateItemsForNewFrame:](self->_visualProvider, "updateItemsForNewFrame:", self->_items);
}

- (int64_t)barPosition
{
  return self->_barPosition;
}

- (BOOL)isMinibar
{
  return -[_UIToolbarVisualProvider toolbarIsSmall](self->_visualProvider, "toolbarIsSmall");
}

- (void)_setBackgroundTransitionProgress:(double)a3
{
  -[_UIToolbarVisualProvider setBackgroundTransitionProgress:](self->_visualProvider, "setBackgroundTransitionProgress:", a3);
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)_disableBlurTinting
{
  return HIBYTE(*(_WORD *)&self->_toolbarFlags) & 1;
}

- (UIBarStyle)barStyle
{
  return *(_WORD *)&self->_toolbarFlags & 7;
}

- (int64_t)_barPosition
{
  return self->_barPosition;
}

- (id)__appearanceStorage
{
  return self->__appearanceStorage;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (BOOL)_hidesShadow
{
  return objc_msgSend(self->__appearanceStorage, "hidesShadow");
}

- (UIToolbarAppearance)standardAppearance
{
  UIToolbarAppearance *standardAppearance;

  standardAppearance = self->_standardAppearance;
  if (!standardAppearance)
  {
    -[UIToolbar _installDefaultAppearance](self, "_installDefaultAppearance");
    standardAppearance = self->_standardAppearance;
  }
  return standardAppearance;
}

- (UIToolbarAppearance)scrollEdgeAppearance
{
  return self->_scrollEdgeAppearance;
}

- (void)setStandardAppearance:(UIToolbarAppearance *)standardAppearance
{
  UIToolbarAppearance *v4;
  UIToolbarAppearance *v5;
  UIToolbarAppearance *v6;
  BOOL v7;
  void *v8;
  UIToolbarAppearance *v9;
  UIToolbarAppearance *v10;
  UIToolbarAppearance *v11;
  UIToolbarAppearance *v12;
  UIToolbarAppearance *v13;

  v4 = standardAppearance;
  v5 = self->_standardAppearance;
  v6 = v4;
  v13 = v6;
  if (v5 == v6)
  {

    v8 = v13;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_13;
    }
    else
    {

    }
    v9 = self->_standardAppearance;
    if (v9)
      objc_storeWeak((id *)&v9->super._changeObserver, 0);
    v10 = -[UIBarAppearance copy](v13, "copy");
    v11 = self->_standardAppearance;
    self->_standardAppearance = v10;

    -[UIToolbar _installDefaultAppearance](self, "_installDefaultAppearance");
    -[_UIToolbarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_standardAppearance;
    if (v12)
      objc_storeWeak((id *)&v12->super._changeObserver, v8);
  }

LABEL_13:
  -[_UIToolbarVisualProvider setUseModernAppearance:](self->_visualProvider, "setUseModernAppearance:", 1);

}

- (UIToolbar)initWithFrame:(CGRect)a3
{
  UIToolbar *v3;
  UIToolbar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIToolbar;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_barPosition = 1;
    -[UIToolbar _doCommonToolbarInit](v3, "_doCommonToolbarInit");
  }
  return v4;
}

- (void)_doCommonToolbarInit
{
  id WeakRetained;
  __int16 v4;
  _UIToolbarVisualProvider *v5;
  _UIToolbarVisualProvider *visualProvider;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 512;
  else
    v4 = 0;
  *(_WORD *)&self->_toolbarFlags = *(_WORD *)&self->_toolbarFlags & 0xFDFF | v4;

  objc_msgSend((id)objc_opt_class(), "_visualProviderForToolbar:", self);
  v5 = (_UIToolbarVisualProvider *)objc_claimAutoreleasedReturnValue();
  visualProvider = self->_visualProvider;
  self->_visualProvider = v5;

  if (!self->_standardAppearance)
  {
    if (_UIBarAppearanceAPIVersion() < 2)
      goto LABEL_8;
    -[UIToolbar _installDefaultAppearance](self, "_installDefaultAppearance");
  }
  -[_UIToolbarVisualProvider setUseModernAppearance:](self->_visualProvider, "setUseModernAppearance:", 1);
LABEL_8:
  -[UIToolbar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");
  if (-[UIView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints"))
    -[UIView _setHostsLayoutEngine:](self, "_setHostsLayoutEngine:", 1);
  -[_UIToolbarVisualProvider prepare](self->_visualProvider, "prepare");
  -[UIToolbar _setupAXHUDGestureIfNecessary](self, "_setupAXHUDGestureIfNecessary");
  v10[0] = 0x1E1A99498;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIView _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v7, self, sel__setupAXHUDGestureIfNecessary);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__largeContentViewerEnabledStatusDidChange_, CFSTR("UILargeContentViewerInteractionEnabledStatusDidChangeNotification"), 0);

}

- (void)_setupAXHUDGestureIfNecessary
{
  void *v3;
  int v4;
  UIAccessibilityHUDGestureManager *v5;
  UIAccessibilityHUDGestureManager *axHUDGestureManager;

  if (!self->_axHUDGestureManager && dyld_program_sdk_at_least())
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_isLargeContentViewerEnabled");

    if (v4)
    {
      v5 = -[UIAccessibilityHUDGestureManager initWithView:delegate:]([UIAccessibilityHUDGestureManager alloc], "initWithView:delegate:", self, self);
      axHUDGestureManager = self->_axHUDGestureManager;
      self->_axHUDGestureManager = v5;

    }
  }
}

+ (id)_visualProviderForToolbar:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_visualProviderClassForToolbar:", v4)), "initWithToolbar:", v4);

  return v5;
}

+ (Class)_visualProviderClassForToolbar:(id)a3
{
  objc_msgSend((id)objc_opt_class(), "_forceLegacyVisualProvider");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)_forceLegacyVisualProvider
{
  return _UIUseModernBars() ^ 1;
}

- (void)setTintColor:(UIColor *)tintColor
{
  UIColor *v4;
  void *v5;
  objc_super v6;

  v4 = tintColor;
  -[UIToolbar _effectiveBarTintColor](self, "_effectiveBarTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)UIToolbar;
  -[UIView setTintColor:](&v6, sel_setTintColor_, v4);

  -[UIToolbar _effectiveBarTintColorDidChangeWithPreviousColor:](self, "_effectiveBarTintColorDidChangeWithPreviousColor:", v5);
}

- (void)_effectiveBarTintColorDidChangeWithPreviousColor:(id)a3
{
  -[UIView setNeedsDisplay](self, "setNeedsDisplay", a3);
  -[UIToolbar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");
}

- (void)setItems:(NSArray *)items animated:(BOOL)animated
{
  _BOOL8 v4;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  BOOL v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  void *v14;
  void (**v15)(void);
  NSArray *v16;

  v4 = animated;
  v6 = items;
  v7 = v6;
  v8 = self->_items;
  if (v6 || !v8)
  {
    if (!v6)
      goto LABEL_10;
    v16 = v6;
    v9 = -[NSArray isEqualToArray:](v6, "isEqualToArray:", v8);
    v7 = v16;
    if (v9)
      goto LABEL_10;
    v8 = self->_items;
  }
  else
  {
    v16 = 0;
  }
  v10 = (void *)-[NSArray copy](v8, "copy");
  v11 = (NSArray *)-[NSArray copy](v16, "copy");
  v12 = self->_items;
  self->_items = v11;

  -[_UIToolbarVisualProvider updateItemsForNewFrame:](self->_visualProvider, "updateItemsForNewFrame:", self->_items);
  -[UIToolbar _updateBarForStyle](self, "_updateBarForStyle");
  -[UIToolbar _effectiveBarTintColor](self, "_effectiveBarTintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIToolbar _effectiveBarTintColorDidChangeWithPreviousColor:](self, "_effectiveBarTintColorDidChangeWithPreviousColor:", v13);

  -[_UIToolbarVisualProvider updateWithItems:fromOldItems:animate:](self->_visualProvider, "updateWithItems:fromOldItems:animate:", self->_items, v10, v4);
  -[UIToolbar _itemsDidChangeBlock](self, "_itemsDidChangeBlock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UIToolbar _itemsDidChangeBlock](self, "_itemsDidChangeBlock");
    v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v15[2]();

  }
  v7 = v16;
LABEL_10:

}

- (void)_setNeedsBackgroundViewUpdate
{
  if (!-[UIView _isInLayoutSubviews](self, "_isInLayoutSubviews"))
    -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateBarForStyle
{
  uint64_t v3;

  if ((*(_WORD *)&self->_toolbarFlags & 0x3F) == 9)
    v3 = 2;
  else
    v3 = *(_WORD *)&self->_toolbarFlags & 7;
  -[_UIToolbarVisualProvider updateBarForStyle:](self->_visualProvider, "updateBarForStyle:", v3);
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  -[UIToolbar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIToolbar;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIToolbarVisualProvider layoutSubviews](self->_visualProvider, "layoutSubviews");
}

- (BOOL)centerTextButtons
{
  return self->_centerTextButtons;
}

- (void)setItems:(NSArray *)items
{
  -[UIToolbar setItems:animated:](self, "setItems:animated:", items, 0);
}

- (void)setDelegate:(id)delegate
{
  id v4;
  __int16 v5;
  id obj;

  obj = delegate;
  if ((*(_WORD *)&self->_toolbarFlags & 0x40) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot manually set the delegate on a UIToolbar managed by a controller."));
  v4 = objc_storeWeak((id *)&self->_delegate, obj);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 512;
  else
    v5 = 0;
  *(_WORD *)&self->_toolbarFlags = *(_WORD *)&self->_toolbarFlags & 0xFDFF | v5;

}

- (void)_setLocked:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_toolbarFlags = *(_WORD *)&self->_toolbarFlags & 0xFFBF | v3;
}

- (void)_setBarPosition:(int64_t)a3
{
  int64_t v3;

  if ((unint64_t)a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  if (v3 != self->_barPosition)
  {
    self->_barPosition = v3;
    -[UIToolbar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");
  }
}

- (void)_setBackdropViewLayerGroupName:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  -[UIView traitOverrides](self, "traitOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "setObject:forTrait:", v7, v5);
LABEL_5:

    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, "containsTrait:", v5);

  if (v6)
  {
    -[UIView traitOverrides](self, "traitOverrides");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeTrait:", v5);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  double v9;
  double v10;
  _BOOL8 v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[UIToolbar isMinibar](self, "isMinibar");
  -[UIView frame](self, "frame");
  v11 = height != v10 || width != v9;
  v12.receiver = self;
  v12.super_class = (Class)UIToolbar;
  -[UIView setFrame:](&v12, sel_setFrame_, x, y, width, height);
  -[UIToolbar _frameOrBoundsChangedWithVisibleSizeChange:wasMinibar:](self, "_frameOrBoundsChangedWithVisibleSizeChange:wasMinibar:", v11, v8);
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forToolbarPosition:(UIBarPosition)topOrBottom barMetrics:(UIBarMetrics)barMetrics
{
  UIImage *v8;
  UIImage *v9;
  id appearanceStorage;
  _UIToolbarAppearanceStorage *v11;
  id v12;
  double v13;
  uint64_t v14;
  UIImage *v15;
  UIImage *v16;

  v8 = backgroundImage;
  v9 = v8;
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    appearanceStorage = self->__appearanceStorage;
    if (v8)
    {
      v16 = v8;
      if (!appearanceStorage)
      {
        v11 = objc_alloc_init(_UIToolbarAppearanceStorage);
        v12 = self->__appearanceStorage;
        self->__appearanceStorage = v11;

        v9 = v16;
      }
      if (-[UIImage _isResizable](v9, "_isResizable") || (-[UIImage size](v16, "size"), v13 <= 1.0))
      {
        v9 = v16;
      }
      else
      {
        -[UIImage resizableImageWithCapInsets:](v16, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);
        v14 = objc_claimAutoreleasedReturnValue();

        v9 = (UIImage *)v14;
      }
    }
    else if (!appearanceStorage)
    {
      goto LABEL_16;
    }
    v15 = v9;
    objc_msgSend(self->__appearanceStorage, "setBackgroundImage:forBarPosition:barMetrics:");
    if (topOrBottom == UIBarPositionAny)
    {
      objc_msgSend(self->__appearanceStorage, "setBackgroundImage:forBarPosition:barMetrics:", v15, 1, barMetrics);
      objc_msgSend(self->__appearanceStorage, "setBackgroundImage:forBarPosition:barMetrics:", v15, 3, barMetrics);
      objc_msgSend(self->__appearanceStorage, "setBackgroundImage:forBarPosition:barMetrics:", v15, 2, barMetrics);
      objc_msgSend(self->__appearanceStorage, "setBackgroundImage:forBarPosition:barMetrics:", v15, 4, barMetrics);
    }
    -[UIToolbar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");
    goto LABEL_15;
  }
  if ((setBackgroundImage_forToolbarPosition_barMetrics__didWarn & 1) == 0)
  {
    setBackgroundImage_forToolbarPosition_barMetrics__didWarn = 1;
    v15 = v8;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), "UIToolbar", CFSTR("background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
LABEL_15:
    v9 = v15;
  }
LABEL_16:

}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  _UIToolbarVisualProvider *visualProvider;
  id v5;
  void *v6;
  void *v7;

  visualProvider = self->_visualProvider;
  v5 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIToolbarVisualProvider traitCollectionForChild:baseTraitCollection:](visualProvider, "traitCollectionForChild:baseTraitCollection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIToolbarAppearance)compactAppearance
{
  return self->_compactAppearance;
}

- (UIToolbarAppearance)compactScrollEdgeAppearance
{
  return self->_compactScrollEdgeAppearance;
}

- (void)setBarStyle:(UIBarStyle)barStyle
{
  __int16 toolbarFlags;

  toolbarFlags = (__int16)self->_toolbarFlags;
  if ((toolbarFlags & 7) != barStyle)
  {
    *(_WORD *)&self->_toolbarFlags = toolbarFlags & 0xFFF8 | barStyle & 7;
    -[UIToolbar _updateBarForStyle](self, "_updateBarForStyle");
  }
}

- (void)setTranslucent:(BOOL)translucent
{
  uint64_t v3;
  unint64_t toolbarFlags;

  v3 = 1;
  if (!translucent)
    v3 = 2;
  toolbarFlags = (unint64_t)self->_toolbarFlags;
  if (v3 != ((toolbarFlags >> 3) & 7))
  {
    *(_WORD *)&self->_toolbarFlags = toolbarFlags & 0xFFC7 | (8 * v3);
    -[UIToolbar _updateBarForStyle](self, "_updateBarForStyle");
  }
}

- (void)_setHidesShadow:(BOOL)a3
{
  _BOOL8 v3;
  id appearanceStorage;
  _UIToolbarAppearanceStorage *v6;
  id v7;

  v3 = a3;
  appearanceStorage = self->__appearanceStorage;
  if (!appearanceStorage)
  {
    v6 = objc_alloc_init(_UIToolbarAppearanceStorage);
    v7 = self->__appearanceStorage;
    self->__appearanceStorage = v6;

    appearanceStorage = self->__appearanceStorage;
  }
  if (objc_msgSend(appearanceStorage, "hidesShadow") != v3)
  {
    objc_msgSend(self->__appearanceStorage, "setHidesShadow:", v3);
    -[UIToolbar _updateBackgroundView](self, "_updateBackgroundView");
  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIToolbar;
  -[UIView _didMoveFromWindow:toWindow:](&v10, sel__didMoveFromWindow_toWindow_, a3, v6);
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIToolbar _setBarPosition:](self, "_setBarPosition:", objc_msgSend(WeakRetained, "positionForBar:", self));
    if (!self->_barPosition)
      -[UIToolbar _setBarPosition:](self, "_setBarPosition:", 1);
    -[UIView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    objc_msgSend(v8, "setRasterizationScale:");

    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateBackgroundView
{
  -[_UIToolbarVisualProvider updateBarBackground](self->_visualProvider, "updateBarBackground");
}

- (void)_setItemDistribution:(int64_t)a3
{
  -[_UIToolbarVisualProvider setItemDistribution:](self->_visualProvider, "setItemDistribution:", a3);
}

- (void)_setBackgroundView:(id)a3
{
  -[_UIToolbarVisualProvider setCustomBackgroundView:](self->_visualProvider, "setCustomBackgroundView:", a3);
}

- (void)setCompactScrollEdgeAppearance:(UIToolbarAppearance *)compactScrollEdgeAppearance
{
  UIToolbarAppearance *v4;
  UIToolbarAppearance *v5;
  UIToolbarAppearance *v6;
  BOOL v7;
  void *v8;
  UIToolbarAppearance *v9;
  UIToolbarAppearance *v10;
  UIToolbarAppearance *v11;
  UIToolbarAppearance *v12;
  UIToolbarAppearance *v13;

  v4 = compactScrollEdgeAppearance;
  v5 = self->_compactScrollEdgeAppearance;
  v6 = v4;
  v13 = v6;
  if (v5 == v6)
  {

    v8 = v13;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_13;
    }
    else
    {

    }
    v9 = self->_compactScrollEdgeAppearance;
    if (v9)
      objc_storeWeak((id *)&v9->super._changeObserver, 0);
    v10 = -[UIBarAppearance copy](v13, "copy");
    v11 = self->_compactScrollEdgeAppearance;
    self->_compactScrollEdgeAppearance = v10;

    -[UIToolbar _installDefaultAppearance](self, "_installDefaultAppearance");
    -[_UIToolbarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_compactScrollEdgeAppearance;
    if (v12)
      objc_storeWeak((id *)&v12->super._changeObserver, v8);
  }

LABEL_13:
  -[_UIToolbarVisualProvider setUseModernAppearance:](self->_visualProvider, "setUseModernAppearance:", 1);

}

- (void)setCompactAppearance:(UIToolbarAppearance *)compactAppearance
{
  UIToolbarAppearance *v4;
  UIToolbarAppearance *v5;
  UIToolbarAppearance *v6;
  BOOL v7;
  void *v8;
  UIToolbarAppearance *v9;
  UIToolbarAppearance *v10;
  UIToolbarAppearance *v11;
  UIToolbarAppearance *v12;
  UIToolbarAppearance *v13;

  v4 = compactAppearance;
  v5 = self->_compactAppearance;
  v6 = v4;
  v13 = v6;
  if (v5 == v6)
  {

    v8 = v13;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_13;
    }
    else
    {

    }
    v9 = self->_compactAppearance;
    if (v9)
      objc_storeWeak((id *)&v9->super._changeObserver, 0);
    v10 = -[UIBarAppearance copy](v13, "copy");
    v11 = self->_compactAppearance;
    self->_compactAppearance = v10;

    -[UIToolbar _installDefaultAppearance](self, "_installDefaultAppearance");
    -[_UIToolbarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_compactAppearance;
    if (v12)
      objc_storeWeak((id *)&v12->super._changeObserver, v8);
  }

LABEL_13:
  -[_UIToolbarVisualProvider setUseModernAppearance:](self->_visualProvider, "setUseModernAppearance:", 1);

}

- (void)setScrollEdgeAppearance:(UIToolbarAppearance *)scrollEdgeAppearance
{
  UIToolbarAppearance *v4;
  UIToolbarAppearance *v5;
  UIToolbarAppearance *v6;
  BOOL v7;
  void *v8;
  UIToolbarAppearance *v9;
  UIToolbarAppearance *v10;
  UIToolbarAppearance *v11;
  UIToolbarAppearance *v12;
  UIToolbarAppearance *v13;

  v4 = scrollEdgeAppearance;
  v5 = self->_scrollEdgeAppearance;
  v6 = v4;
  v13 = v6;
  if (v5 == v6)
  {

    v8 = v13;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_13;
    }
    else
    {

    }
    v9 = self->_scrollEdgeAppearance;
    if (v9)
      objc_storeWeak((id *)&v9->super._changeObserver, 0);
    v10 = -[UIBarAppearance copy](v13, "copy");
    v11 = self->_scrollEdgeAppearance;
    self->_scrollEdgeAppearance = v10;

    -[UIToolbar _installDefaultAppearance](self, "_installDefaultAppearance");
    -[_UIToolbarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_scrollEdgeAppearance;
    if (v12)
      objc_storeWeak((id *)&v12->super._changeObserver, v8);
  }

LABEL_13:
  -[_UIToolbarVisualProvider setUseModernAppearance:](self->_visualProvider, "setUseModernAppearance:", 1);

}

- (void)_installDefaultAppearance
{
  UIToolbarAppearance *v3;
  UIToolbarAppearance *standardAppearance;
  void *v5;
  UIToolbarAppearance *v6;
  void *v7;

  if (!self->_standardAppearance)
  {
    v3 = (UIToolbarAppearance *)objc_opt_new();
    standardAppearance = self->_standardAppearance;
    self->_standardAppearance = v3;

    -[_UIToolbarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_standardAppearance;
    if (v6)
    {
      v7 = v5;
      objc_storeWeak((id *)&v6->super._changeObserver, v5);
      v5 = v7;
    }

  }
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if ((*(_WORD *)&self->_toolbarFlags & 0x40) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot manually set translatesAutoResizingMaskIntoConstraints on a UIToolbar managed by a controller."));
  v5.receiver = self;
  v5.super_class = (Class)UIToolbar;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](&v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, v3);
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
  UIColor *v4;
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;

  v4 = barTintColor;
  v5 = self->_barTintColor;
  if (v5 != v4)
  {
    v9 = v4;
    v6 = v4;
    v7 = self->_barTintColor;
    self->_barTintColor = v6;
    v8 = v5;

    -[UIToolbar _effectiveBarTintColorDidChangeWithPreviousColor:](self, "_effectiveBarTintColorDidChangeWithPreviousColor:", v8);
    v4 = v9;
  }

}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIToolbar;
  -[UIView description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (objc_msgSend((id)objc_opt_class(), "_forceLegacyVisualProvider"))
    objc_msgSend(v4, "appendFormat:", CFSTR(" forcedLegacyProvider"));
  if (self->_standardAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" standardAppearance=%p"), self->_standardAppearance);
  if (self->_compactAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" compactAppearance=%p"), self->_compactAppearance);
  if (self->_scrollEdgeAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" scrollEdgeAppearance=%p"), self->_scrollEdgeAppearance);
  if (self->_compactScrollEdgeAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" compactScrollEdgeAppearance=%p"), self->_compactScrollEdgeAppearance);
  return (NSString *)v4;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  objc_super v8;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)UIToolbar;
  if (-[UIView pointInside:withEvent:](&v8, sel_pointInside_withEvent_, a4))
    return 1;
  -[_UIToolbarVisualProvider backgroundFrame](self->_visualProvider, "backgroundFrame");
  v9.x = x;
  v9.y = y;
  return CGRectContainsPoint(v10, v9);
}

- (UIToolbar)initWithCoder:(id)a3
{
  id v4;
  UIToolbar *v5;
  UIToolbar *v6;
  void *v7;
  uint64_t v8;
  UIColor *barTintColor;
  uint64_t v10;
  UIToolbarAppearance *standardAppearance;
  uint64_t v12;
  UIToolbarAppearance *compactAppearance;
  uint64_t v14;
  UIToolbarAppearance *scrollEdgeAppearance;
  uint64_t v16;
  UIToolbarAppearance *compactScrollEdgeAppearance;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIToolbar;
  v5 = -[UIView initWithCoder:](&v20, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_toolbarFlags &= 0xFFF8u;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBarStyle")))
      *(_WORD *)&v6->_toolbarFlags = *(_WORD *)&v6->_toolbarFlags & 0xFFF8 | objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIBarStyle")) & 7;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_delegate, v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIBarTintColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    barTintColor = v6->_barTintColor;
    v6->_barTintColor = (UIColor *)v8;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBarPosition")))
      v6->_barPosition = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIBarPosition"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBarTranslucence")))
      *(_WORD *)&v6->_toolbarFlags = (8 * (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIBarTranslucence")) & 7)) | *(_WORD *)&v6->_toolbarFlags & 0xFFC7;
    if ((dyld_program_sdk_at_least() & 1) == 0)
      *(_WORD *)&v6->_toolbarFlags |= 0x80u;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIToolbarStandardAppearance"));
    v10 = objc_claimAutoreleasedReturnValue();
    standardAppearance = v6->_standardAppearance;
    v6->_standardAppearance = (UIToolbarAppearance *)v10;

    if (v6->_standardAppearance)
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIToolbarCompactAppearance"));
      v12 = objc_claimAutoreleasedReturnValue();
      compactAppearance = v6->_compactAppearance;
      v6->_compactAppearance = (UIToolbarAppearance *)v12;

      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIToolbarScrollEdgeAppearance"));
      v14 = objc_claimAutoreleasedReturnValue();
      scrollEdgeAppearance = v6->_scrollEdgeAppearance;
      v6->_scrollEdgeAppearance = (UIToolbarAppearance *)v14;

      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIToolbarCompactScrollEdgeAppearance"));
      v16 = objc_claimAutoreleasedReturnValue();
      compactScrollEdgeAppearance = v6->_compactScrollEdgeAppearance;
      v6->_compactScrollEdgeAppearance = (UIToolbarAppearance *)v16;

    }
    -[UIToolbar _doCommonToolbarInit](v6, "_doCommonToolbarInit");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIItems"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      -[UIToolbar setItems:animated:](v6, "setItems:animated:", v18, 0);

  }
  return v6;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIToolbar;
  -[UIView _populateArchivedSubviews:](&v19, sel__populateArchivedSubviews_, v4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_items;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "view", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "removeObject:", v12);

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v7);
  }

  -[_UIToolbarVisualProvider currentBackgroundView](self->_visualProvider, "currentBackgroundView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_UIToolbarVisualProvider currentBackgroundView](self->_visualProvider, "currentBackgroundView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v14);

  }
  if (self->_shadowView)
    objc_msgSend(v4, "removeObject:");
  -[_UIToolbarVisualProvider updateArchivedSubviews:](self->_visualProvider, "updateArchivedSubviews:", v4, (_QWORD)v15);

}

- (BOOL)_shouldDecodeSubviews
{
  return objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_visualProviderClassForToolbar:", self), "shouldDecodeSubviews");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id WeakRetained;
  UIColor *barTintColor;
  NSArray *items;
  int64_t barPosition;
  unint64_t v9;
  UIToolbarAppearance *standardAppearance;
  UIToolbarAppearance *compactAppearance;
  UIToolbarAppearance *scrollEdgeAppearance;
  UIToolbarAppearance *compactScrollEdgeAppearance;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIToolbar;
  -[UIView encodeWithCoder:](&v14, sel_encodeWithCoder_, v4);
  if ((*(_WORD *)&self->_toolbarFlags & 7) != 0)
    objc_msgSend(v4, "encodeInteger:forKey:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
    objc_msgSend(v4, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("UIDelegate"));
  barTintColor = self->_barTintColor;
  if (barTintColor)
    objc_msgSend(v4, "encodeObject:forKey:", barTintColor, CFSTR("UIBarTintColor"));
  items = self->_items;
  if (items)
    objc_msgSend(v4, "encodeObject:forKey:", items, CFSTR("UIItems"));
  barPosition = self->_barPosition;
  if (barPosition)
    objc_msgSend(v4, "encodeInteger:forKey:", barPosition, CFSTR("UIBarPosition"));
  v9 = ((unint64_t)*(_WORD *)&self->_toolbarFlags >> 3) & 7;
  if ((_DWORD)v9)
    objc_msgSend(v4, "encodeInteger:forKey:", v9, CFSTR("UIBarTranslucence"));
  if (-[_UIToolbarVisualProvider useModernAppearance](self->_visualProvider, "useModernAppearance"))
  {
    standardAppearance = self->_standardAppearance;
    if (standardAppearance)
      objc_msgSend(v4, "encodeObject:forKey:", standardAppearance, CFSTR("UIToolbarStandardAppearance"));
    compactAppearance = self->_compactAppearance;
    if (compactAppearance)
      objc_msgSend(v4, "encodeObject:forKey:", compactAppearance, CFSTR("UIToolbarCompactAppearance"));
    scrollEdgeAppearance = self->_scrollEdgeAppearance;
    if (scrollEdgeAppearance)
      objc_msgSend(v4, "encodeObject:forKey:", scrollEdgeAppearance, CFSTR("UIToolbarScrollEdgeAppearance"));
    compactScrollEdgeAppearance = self->_compactScrollEdgeAppearance;
    if (compactScrollEdgeAppearance)
      objc_msgSend(v4, "encodeObject:forKey:", compactScrollEdgeAppearance, CFSTR("UIToolbarCompactScrollEdgeAppearance"));
  }

}

- (BOOL)_linkedBeforeWhitetailAndInitializedFromCoder
{
  return (*(_WORD *)&self->_toolbarFlags >> 7) & 1;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)_barTranslucence
{
  return ((unint64_t)*(_WORD *)&self->_toolbarFlags >> 3) & 7;
}

- (NSString)_backdropViewLayerGroupName
{
  void *v2;
  void *v3;
  void *v4;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForTrait:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)backdropView:(id)a3 didChangeToGraphicsQuality:(int64_t)a4
{
  id v5;

  -[UIView subviews](self, "subviews", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _UINavigationButtonUpdateAccessibilityBackgrounds(v5, a4 == 100, 0);

}

- (BOOL)_shouldStretchDuringCrossfadeTransition
{
  return 0;
}

- (int64_t)_itemDistribution
{
  return -[_UIToolbarVisualProvider itemDistribution](self->_visualProvider, "itemDistribution");
}

- (UIView)currentBackgroundView
{
  return -[_UIToolbarVisualProvider currentBackgroundView](self->_visualProvider, "currentBackgroundView");
}

- (double)_backgroundTransitionProgress
{
  double result;

  -[_UIToolbarVisualProvider backgroundTransitionProgress](self->_visualProvider, "backgroundTransitionProgress");
  return result;
}

- (int64_t)_hintFromCurrentAppearance
{
  double v2;

  -[UIToolbar _backgroundTransitionProgress](self, "_backgroundTransitionProgress");
  if (v2 == 0.0)
    return 1;
  else
    return 2;
}

- (void)_setAppearanceHint:(int64_t)a3
{
  *(_WORD *)&self->_toolbarFlags = *(_WORD *)&self->_toolbarFlags & 0xF3FF | ((a3 & 3) << 10);
}

- (int64_t)_appearanceHint
{
  return ((unint64_t)*(_WORD *)&self->_toolbarFlags >> 10) & 3;
}

- (void)setCenterTextButtons:(BOOL)a3
{
  self->_centerTextButtons = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_sendAction:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_items;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "view", (_QWORD)v18);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 == v6)
        {
          if (objc_msgSend(v13, "action"))
          {
            v15 = (void *)UIApp;
            v16 = objc_msgSend(v13, "action");
            objc_msgSend(v13, "target");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "sendAction:toTarget:fromSender:forEvent:", v16, v17, v13, v7);

          }
          goto LABEL_12;
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)_customViewChangedForButtonItem:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSArray containsObject:](self->_items, "containsObject:"))
    -[_UIToolbarVisualProvider customViewChangedForButtonItem:](self->_visualProvider, "customViewChangedForButtonItem:", v4);

}

- (CGRect)_frameOfBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
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
  double v19;
  double v20;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSArray containsObject:](self->_items, "containsObject:", v4);

  if (!v6 || v5 == 0)
  {
    v10 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    objc_msgSend(v5, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v8, "convertRect:toView:", self);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_positionToolbarButtonsAndResetFontScaleAdjustment:(BOOL)a3
{
  -[_UIToolbarVisualProvider positionToolbarButtonsAndResetFontScaleAdjustment:](self->_visualProvider, "positionToolbarButtonsAndResetFontScaleAdjustment:", a3);
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIToolbar items](self, "items", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v5, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isDescendantOfView:", v12);

        if ((v13 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_accessibilityHUDGestureManager:(id)a3 gestureLiftedAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v12 = a3;
  -[UIToolbar _itemAtPoint:](self, "_itemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_accessibilityShouldActivateOnHUDLift");

  if (v10)
  {
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:fromView:", v11, x, y);
    objc_msgSend(v8, "_activateForAccessibilityHUDLiftAtPoint:");

LABEL_4:
  }

}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;

  y = a4.y;
  x = a4.x;
  -[UIToolbar _itemAtPoint:](self, "_itemAtPoint:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[UIAccessibilityHUDItem HUDItemForBarButtonItem:atPoint:inView:isBackButton:](UIAccessibilityHUDItem, "HUDItemForBarButtonItem:atPoint:inView:isBackButton:", v7, self, 0, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_itemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_items;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "view", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
        v14 = objc_msgSend(v12, "pointInside:withEvent:", 0);

        if ((v14 & 1) != 0)
        {
          v15 = v11;
          goto LABEL_11;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (CGSize)defaultSizeForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_UIToolbarVisualProvider defaultSizeForOrientation:](self->_visualProvider, "defaultSizeForOrientation:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)UIToolbar;
  -[UIView invalidateIntrinsicContentSize](&v12, sel_invalidateIntrinsicContentSize);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[UIView subviews](self, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidateIntrinsicContentSize");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)dealloc
{
  objc_super v2;

  self->_disableAutolayoutWarnings = 1;
  v2.receiver = self;
  v2.super_class = (Class)UIToolbar;
  -[UIView dealloc](&v2, sel_dealloc);
}

- (UIView)_backgroundView
{
  return -[_UIToolbarVisualProvider currentBackgroundView](self->_visualProvider, "currentBackgroundView");
}

- (UIImage)backgroundImageForToolbarPosition:(UIBarPosition)topOrBottom barMetrics:(UIBarMetrics)barMetrics
{
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    objc_msgSend(self->__appearanceStorage, "backgroundImageForBarPosition:barMetrics:", topOrBottom);
    return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((backgroundImageForToolbarPosition_barMetrics__didWarn & 1) == 0)
    {
      backgroundImageForToolbarPosition_barMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, topOrBottom, "UIToolbar", CFSTR("background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return (UIImage *)0;
  }
}

- (void)setBackgroundEffects:(id)a3
{
  NSArray *v4;
  NSArray *backgroundEffects;
  BOOL v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)a3;
  backgroundEffects = self->_backgroundEffects;
  if (backgroundEffects != v4)
  {
    v9 = v4;
    v6 = -[NSArray isEqualToArray:](backgroundEffects, "isEqualToArray:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSArray *)-[NSArray copy](v9, "copy");
      v8 = self->_backgroundEffects;
      self->_backgroundEffects = v7;

      -[UIToolbar _updateBackgroundView](self, "_updateBackgroundView");
      v4 = v9;
    }
  }

}

- (void)_setVisualAltitude:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIToolbar;
  -[UIView _setVisualAltitude:](&v4, sel__setVisualAltitude_, a3);
  -[UIToolbar _updateBackgroundView](self, "_updateBackgroundView");
}

- (void)_setVisualAltitudeBias:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIToolbar;
  -[UIView _setVisualAltitudeBias:](&v4, sel__setVisualAltitudeBias_, a3.width, a3.height);
  -[UIToolbar _updateBackgroundView](self, "_updateBackgroundView");
}

- (void)setShadowImage:(UIImage *)shadowImage forToolbarPosition:(UIBarPosition)topOrBottom
{
  UIImage *v6;
  id appearanceStorage;
  UIImage *v8;
  _UIToolbarAppearanceStorage *v9;
  id v10;
  double v11;
  uint64_t v12;
  id v13;
  id v14;
  UIImage *v15;
  id v16;

  v6 = shadowImage;
  appearanceStorage = self->__appearanceStorage;
  if (v6)
  {
    v8 = v6;
    v15 = v6;
    if (!appearanceStorage)
    {
      v9 = objc_alloc_init(_UIToolbarAppearanceStorage);
      v10 = self->__appearanceStorage;
      self->__appearanceStorage = v9;

      v8 = v15;
    }
    if (-[UIImage _isResizable](v8, "_isResizable") || (-[UIImage size](v15, "size"), v11 <= 1.0))
    {
      v13 = v15;
    }
    else
    {
      -[UIImage resizableImageWithCapInsets:](v15, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v12;
    }
  }
  else
  {
    if (!appearanceStorage)
      return;
    v13 = 0;
  }
  v14 = self->__appearanceStorage;
  v16 = v13;
  if (topOrBottom == UIBarPositionBottom)
    goto LABEL_13;
  objc_msgSend(v14, "setTopShadowImage:", v13);
  if (topOrBottom != UIBarPositionTop)
  {
    v14 = self->__appearanceStorage;
    v13 = v16;
LABEL_13:
    objc_msgSend(v14, "setShadowImage:", v13);
  }
  -[UIToolbar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");

}

- (UIImage)shadowImageForToolbarPosition:(UIBarPosition)topOrBottom
{
  id appearanceStorage;

  appearanceStorage = self->__appearanceStorage;
  if (topOrBottom == UIBarPositionTop)
    objc_msgSend(appearanceStorage, "topShadowImage");
  else
    objc_msgSend(appearanceStorage, "shadowImage");
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setDisableBlurTinting:(BOOL)a3
{
  __int16 toolbarFlags;
  __int16 v4;

  toolbarFlags = (__int16)self->_toolbarFlags;
  if (((((toolbarFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 256;
    else
      v4 = 0;
    *(_WORD *)&self->_toolbarFlags = toolbarFlags & 0xFEFF | v4;
    -[UIToolbar _updateBackgroundView](self, "_updateBackgroundView");
  }
}

- (void)drawRect:(CGRect)a3
{
  -[_UIToolbarVisualProvider drawBackgroundViewInRect:](self->_visualProvider, "drawBackgroundViewInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)defaultButtonFont
{
  return +[UIToolbarButton defaultButtonFont](UIToolbarButton, "defaultButtonFont");
}

+ (double)defaultHeight
{
  return 44.0;
}

- (BOOL)_isLocked
{
  return (*(_WORD *)&self->_toolbarFlags >> 6) & 1;
}

- (void)_setForceTopBarAppearance:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  -[UIToolbar _setBarPosition:](self, "_setBarPosition:", v3);
}

+ (double)defaultHeightForBarSize:(int)a3
{
  double result;

  NSLog(CFSTR("Please stop using %s"), a2, "+[UIToolbar defaultHeightForBarSize:]");
  result = 44.0;
  if (a3 == 2)
    return 32.0;
  return result;
}

- (id)initInView:(id)a3 withFrame:(CGRect)a4 withItemList:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  UIToolbar *v11;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  NSLog(CFSTR("Please stop using %s"), "-[UIToolbar initInView:withFrame:withItemList:]");
  v13.receiver = self;
  v13.super_class = (Class)UIToolbar;
  v11 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    objc_msgSend(v10, "addSubview:", v11);
    -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 8);
    -[UIToolbar _setNeedsBackgroundViewUpdate](v11, "_setNeedsBackgroundViewUpdate");
  }

  return v11;
}

- (void)_setButtonBackgroundImage:(id)a3 mini:(id)a4 forStates:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a3;
  NSLog(CFSTR("Please stop using %s"), "-[UIToolbar _setButtonBackgroundImage:mini:forStates:]");
  if (a5 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIToolbar.m"), 1091, CFSTR("Normal and Highlighted (pressed) states are the only supported states."));

  }
  v14[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceWhenContainedInInstancesOfClasses:](UIToolbarButton, "appearanceWhenContainedInInstancesOfClasses:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_setBackgroundImage:forState:barMetrics:", v10, a5, 0);
  objc_msgSend(v12, "_setBackgroundImage:forState:barMetrics:", v9, a5, 1);

}

- (UIView)_shadowView
{
  return self->_shadowView;
}

- (void)_setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (id)_itemsDidChangeBlock
{
  return self->__itemsDidChangeBlock;
}

- (void)_setItemsDidChangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (UIBarButtonItem)centerItem
{
  return self->_centerItem;
}

- (void)setCenterItem:(id)a3
{
  objc_storeStrong((id *)&self->_centerItem, a3);
}

- (BOOL)autoHidesToolbarInFullscreen
{
  return self->_autoHidesToolbarInFullscreen;
}

- (void)setAutoHidesToolbarInFullscreen:(BOOL)a3
{
  self->_autoHidesToolbarInFullscreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_centerItem, 0);
  objc_storeStrong(&self->__itemsDidChangeBlock, 0);
  objc_storeStrong((id *)&self->_compactAppearance, 0);
  objc_storeStrong((id *)&self->_compactScrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_scrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_standardAppearance, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_axHUDGestureManager, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong(&self->__appearanceStorage, 0);
  objc_storeStrong((id *)&self->_barTintColor, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return 1;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  double result;
  objc_super v7;

  result = 0.0;
  if (a6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIToolbar;
    -[UIView _autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:](&v7, sel__autolayoutSpacingAtEdge_forAttribute_inContainer_isGuide_, *(_QWORD *)&a3, a4, a5, 1, 0.0);
  }
  return result;
}

- (double)_defaultAutolayoutSpacing
{
  return 0.0;
}

@end
