@implementation UISearchBarBackground

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchBarBackground;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UISearchBarBackground _updateBackgroundImageIfPossible](self, "_updateBackgroundImageIfPossible");
}

- (id)_backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4
{
  int64_t v5;
  void *v6;
  void *v7;

  if (a3)
    v5 = a3;
  else
    v5 = 2;
  _UIBarAppearanceStorageKeyForBarPositionAndMetrics(v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_customBackgroundImages, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIImage)backgroundImage
{
  return (UIImage *)-[UISearchBarBackground _backgroundImageForBarPosition:barMetrics:](self, "_backgroundImageForBarPosition:barMetrics:", 0, 0);
}

- (int64_t)_barPosition
{
  return self->_barPosition;
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
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)UISearchBarBackground;
  -[UIImageView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  -[UIView frame](self, "frame");
  if (v9 != v13 || v11 != v12)
    -[UISearchBarBackground _updateBackgroundImageIfPossible](self, "_updateBackgroundImageIfPossible");
}

- (void)_updateBackgroundImageIfPossible
{
  double v3;
  double v4;
  void *v5;

  -[UIView bounds](self, "bounds");
  if (v3 != 0.0)
  {
    -[UIView bounds](self, "bounds");
    if (v4 != 0.0)
    {
      -[UIView window](self, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        -[UISearchBarBackground _updateBackgroundImage](self, "_updateBackgroundImage");
    }
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchBarBackground;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[UISearchBarBackground _updateBackgroundImageIfPossible](self, "_updateBackgroundImageIfPossible");
}

- (void)_updateBackgroundImage
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  int64_t barTranslucence;
  UIColor *barTintColor;
  uint64_t v9;
  int64_t barStyle;
  _BOOL4 v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  char v23;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  if (v3 < 75.0)
    v5 = 0;
  else
    v5 = 101;
  -[UISearchBarBackground _backgroundImageForBarPosition:barMetrics:](self, "_backgroundImageForBarPosition:barMetrics:", self->_barPosition, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self, "setBackgroundColor:", 0);
  if (v6)
  {
    v23 = 0;
    objc_msgSend(v6, "_isInvisibleAndGetIsTranslucent:", &v23);
    barTranslucence = self->_barTranslucence;
    if (v23)
    {
      if (barTranslucence == 2)
      {
        barTintColor = self->_barTintColor;
        if (barTintColor)
        {
          -[UIColor colorWithAlphaComponent:](barTintColor, "colorWithAlphaComponent:", 1.0);
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if ((unint64_t)(self->_barStyle - 1) >= 2)
            +[UIColor whiteColor](UIColor, "whiteColor");
          else
            +[UIColor blackColor](UIColor, "blackColor");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        v14 = (void *)v9;
        -[UIImageView setBackgroundColor:](self, "setBackgroundColor:", v9);
        goto LABEL_22;
      }
    }
    else if (barTranslucence == 1)
    {
      _UIBarManufacturedTranslucentImage(v6);
      v14 = v6;
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

    }
    -[_UIBarBackgroundImageView setImage:](self, "setImage:", v6);
    objc_msgSend(v6, "capInsets");
    if (self->_barPosition != 3)
      goto LABEL_28;
    if (v15 != 0.0)
      goto LABEL_28;
    if (v16 != 0.0)
      goto LABEL_28;
    objc_msgSend(v6, "size");
    v18 = v17;
    -[UIView window](self, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "defaultStatusBarHeightInOrientation:", 1);
    v22 = v21;

    if (v18 == v4 - v22)
      -[_UIBarBackgroundImageView updateTopStripViewCreateIfNecessary](self, "updateTopStripViewCreateIfNecessary");
    else
LABEL_28:
      -[_UIBarBackgroundImageView removeTopStripView](self, "removeTopStripView");
    goto LABEL_29;
  }
  if (self->_searchBarStyle > 1)
  {
    v13 = 0;
  }
  else
  {
    barStyle = self->_barStyle;
    v11 = -[UISearchBarBackground isTranslucent](self, "isTranslucent");
    v12 = 0.96;
    if (!v11)
      v12 = 1.0;
    -[UISearchBarBackground _createBackgroundImageForBarStyle:alpha:](self, "_createBackgroundImageForBarStyle:alpha:", barStyle, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "resizableImageWithCapInsets:", 1.0, 0.0, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIBarBackgroundImageView setImage:](self, "setImage:", v6);
LABEL_29:
  -[UIView setOpaque:](self, "setOpaque:", 0);

}

- (void)setSearchBarStyle:(unint64_t)a3
{
  if (self->_searchBarStyle != a3)
  {
    self->_searchBarStyle = a3;
    -[_UIBarBackgroundImageView setImage:](self, "setImage:", 0);
    -[UISearchBarBackground _updateBackgroundImageIfPossible](self, "_updateBackgroundImageIfPossible");
  }
}

- (UISearchBarBackground)initWithFrame:(CGRect)a3
{
  UISearchBarBackground *v3;
  UISearchBarBackground *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISearchBarBackground;
  v3 = -[UIImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_barPosition = 2;
    -[UISearchBarBackground _updateBackgroundImageIfPossible](v3, "_updateBackgroundImageIfPossible");
  }
  return v4;
}

- (void)setTranslucent:(BOOL)a3
{
  int64_t v3;

  v3 = 1;
  if (!a3)
    v3 = 2;
  if (v3 != self->_barTranslucence)
  {
    self->_barTranslucence = v3;
    -[UISearchBarBackground _updateBackgroundImageIfPossible](self, "_updateBackgroundImageIfPossible");
  }
}

- (void)_setBarPosition:(int64_t)a3
{
  if (self->_barPosition != a3)
  {
    self->_barPosition = a3;
    -[UISearchBarBackground _updateBackgroundImageIfPossible](self, "_updateBackgroundImageIfPossible");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBackgroundImages, 0);
  objc_storeStrong((id *)&self->_barTintColor, 0);
}

- (void)setBarTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_barTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_barTintColor, a3);
    -[UISearchBarBackground _updateBackgroundImageIfPossible](self, "_updateBackgroundImageIfPossible");
    v5 = v6;
  }

}

- (BOOL)isTranslucent
{
  unint64_t barStyle;
  UIColor *barTintColor;
  void *v5;
  BOOL IsTranslucentOnScreen;
  int64_t barTranslucence;
  void *v8;
  BOOL v10;

  barStyle = self->_barStyle;
  barTintColor = self->_barTintColor;
  -[UIView _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsTranslucentOnScreen = _UIBarStyleWithTintColorIsTranslucentOnScreen(barStyle, (uint64_t)barTintColor, v5);

  v10 = IsTranslucentOnScreen;
  barTranslucence = self->_barTranslucence;
  if (barTranslucence)
    return barTranslucence == 1;
  if (-[UISearchBarBackground _hasCustomBackgroundImage](self, "_hasCustomBackgroundImage"))
  {
    -[UISearchBarBackground _backgroundImageForBarPosition:barMetrics:](self, "_backgroundImageForBarPosition:barMetrics:", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_isInvisibleAndGetIsTranslucent:", &v10);

    return v10;
  }
  return IsTranslucentOnScreen;
}

- (void)setUsesEmbeddedAppearance:(BOOL)a3
{
  if (self->_usesEmbeddedAppearance != a3)
  {
    self->_usesEmbeddedAppearance = a3;
    -[UISearchBarBackground _updateBackgroundImageIfPossible](self, "_updateBackgroundImageIfPossible");
  }
}

- (BOOL)usesEmbeddedAppearance
{
  return self->_usesEmbeddedAppearance;
}

- (void)setBarStyle:(int64_t)a3
{
  if (self->_barStyle != a3)
  {
    self->_barStyle = a3;
    if (!self->_barTintColor)
      -[UISearchBarBackground _updateBackgroundImageIfPossible](self, "_updateBackgroundImageIfPossible");
  }
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (unint64_t)searchBarStyle
{
  return self->_searchBarStyle;
}

- (id)_createBackgroundImageForBarStyle:(int64_t)a3 alpha:(double)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIColor *v13;
  UIColor *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  int64_t barPosition;
  _BOOL4 usesContiguousBarBackground;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  _UISearchBarBackgroundCacheKey *v30;
  id v31;
  uint64_t v32;
  id v33;
  _UISearchBarBackgroundCacheKey *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _QWORD *ContextStack;
  CGContext *v42;
  NSObject *v44;
  unint64_t v45;
  NSObject *v46;
  CGFloat v47;
  CGFloat v48;
  uint64_t v49;
  double v50;
  double v51;
  uint8_t buf[8];

  if (!_MergedGlobals_23_0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v8 = (void *)_MergedGlobals_23_0;
    _MergedGlobals_23_0 = (uint64_t)v7;

  }
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      __UIFaultDebugAssertLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v44, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }

    }
  }
  else if (!self)
  {
    v45 = qword_1ECD7B718;
    if (!qword_1ECD7B718)
    {
      v45 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v45, (unint64_t *)&qword_1ECD7B718);
    }
    v46 = *(NSObject **)(v45 + 8);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v46, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
    }
  }
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v10);

  v11 = (void *)_UISetCurrentFallbackEnvironment(self);
  _UISearchBarBackgroundFillColor(a3, self->_barTintColor);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_barTintColor;
  v14 = v13;
  if (a3 || v13)
  {
    _UISearchBarBackgroundFillColor(a3, v13);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v51 = 0.0;
      *(_QWORD *)buf = 0;
      v49 = 0;
      v50 = 0.0;
      if ((objc_msgSend(v16, "getHue:saturation:brightness:alpha:", buf, &v51, &v50, &v49) & 1) != 0)
      {
        v50 = v50 * 0.6;
        +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", *(double *)buf, v51);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = v17;
      }
      v15 = v18;
    }
    else
    {
      v15 = 0;
    }

  }
  else if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    +[UIColor separatorColor](UIColor, "separatorColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor _barHairlineShadowColor](UIColor, "_barHairlineShadowColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor _composedColorFromSourceColor:destinationColor:tintColor:alpha:](1.0, (uint64_t)UIColor, v19, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  barPosition = self->_barPosition;
  usesContiguousBarBackground = self->_usesContiguousBarBackground;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v23 = v22;
  -[UIView bounds](self, "bounds");
  v25 = v24;
  v26 = 0.0;
  if (barPosition == 3)
  {
    -[UIView window](self, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "statusBarHeight");
    v26 = v29;

  }
  v30 = [_UISearchBarBackgroundCacheKey alloc];
  v31 = objc_retainAutorelease(v12);
  v32 = objc_msgSend(v31, "CGColor");
  v33 = objc_retainAutorelease(v15);
  v34 = -[_UISearchBarBackgroundCacheKey initWithBarPosition:usesContiguousBarBackground:scale:alpha:height:statusBarHeight:backgroundColor:strokeColor:](v30, "initWithBarPosition:usesContiguousBarBackground:scale:alpha:height:statusBarHeight:backgroundColor:strokeColor:", barPosition, usesContiguousBarBackground, v32, objc_msgSend(v33, "CGColor"), v23, a4, v25, v26);
  objc_msgSend((id)_MergedGlobals_23_0, "objectForKey:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    v36 = *MEMORY[0x1E0C9D648];
    if (barPosition == 3)
      v36 = 0.0;
    v48 = v36;
    if (barPosition == 3)
      v37 = 0.0;
    else
      v37 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    if (barPosition == 3)
      v38 = 1.0 / v23;
    else
      v38 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    if (barPosition == 3)
      v39 = v26;
    else
      v39 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v47 = v39;
    if (barPosition == 3)
    {
      v40 = v25 - v26;
    }
    else
    {
      v26 = 0.0;
      v40 = v25;
    }
    _UIGraphicsBeginImageContextWithOptions(0, 0, 1.0 / v23, v25, v23);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v42 = 0;
    else
      v42 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextSetAlpha(v42, a4);
    objc_msgSend(v31, "set");
    UIRectFillUsingOperation(1, 0.0, v26, 1.0 / v23, v40);
    if (barPosition == 3)
    {
      objc_msgSend(v31, "set");
      UIRectFillUsingOperation(1, v48, v37, v38, v47);
    }
    if (!usesContiguousBarBackground)
    {
      objc_msgSend(v33, "set");
      UIRectFillUsingOperation(1, 0.0, v25 - 1.0 / v23, 1.0 / v23, 1.0 / v23);
    }
    if (barPosition == 2)
    {
      objc_msgSend(v33, "set");
      UIRectFillUsingOperation(1, 0.0, v26, 1.0 / v23, 1.0 / v23);
    }
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    if (v35)
      objc_msgSend((id)_MergedGlobals_23_0, "setObject:forKey:", v35, v34);
  }
  _UIRestorePreviousFallbackEnvironment(v11);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v9);

  return v35;
}

- (UIImage)backgroundImagePrompt
{
  return (UIImage *)-[UISearchBarBackground _backgroundImageForBarPosition:barMetrics:](self, "_backgroundImageForBarPosition:barMetrics:", 0, 101);
}

- (void)_setBackgroundImage:(id)a3 forBarPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
  int64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  uint64_t v15;
  NSMutableDictionary *customBackgroundImages;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  id v19;

  v19 = a3;
  if (a4)
    v8 = a4;
  else
    v8 = 2;
  _UIBarAppearanceStorageKeyForBarPositionAndMetrics(v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v10 = 0;
  }
  else
  {
    _UIBarAppearanceStorageKeyForBarPositionAndMetrics(3, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UISearchBarBackground _backgroundImageForBarPosition:barMetrics:](self, "_backgroundImageForBarPosition:barMetrics:", a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != v19)
  {
    v12 = v19;
    if (v12)
    {
      v13 = v12;
      if ((objc_msgSend(v12, "_isResizable") & 1) != 0 || (objc_msgSend(v13, "size"), v14 <= 1.0))
      {

      }
      else
      {
        objc_msgSend(v13, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);
        v15 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v15;
        if (!v15)
          goto LABEL_12;
      }
      customBackgroundImages = self->_customBackgroundImages;
      if (!customBackgroundImages)
      {
        v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v18 = self->_customBackgroundImages;
        self->_customBackgroundImages = v17;

        customBackgroundImages = self->_customBackgroundImages;
      }
      -[NSMutableDictionary setObject:forKey:](customBackgroundImages, "setObject:forKey:", v13, v9);
      if (v10)
        -[NSMutableDictionary setObject:forKey:](self->_customBackgroundImages, "setObject:forKey:", v13, v10);
      goto LABEL_20;
    }
LABEL_12:
    -[NSMutableDictionary removeObjectForKey:](self->_customBackgroundImages, "removeObjectForKey:", v9);
    if (v10)
      -[NSMutableDictionary removeObjectForKey:](self->_customBackgroundImages, "removeObjectForKey:", v10);
    v13 = 0;
LABEL_20:
    -[UISearchBarBackground _updateBackgroundImageIfPossible](self, "_updateBackgroundImageIfPossible");

  }
}

- (void)setBounds:(CGRect)a3
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
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)UISearchBarBackground;
  -[UIImageView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  -[UIView bounds](self, "bounds");
  if (v9 != v13 || v11 != v12)
    -[UISearchBarBackground _updateBackgroundImageIfPossible](self, "_updateBackgroundImageIfPossible");
}

- (BOOL)_hasCustomBackgroundImage
{
  return -[NSMutableDictionary count](self->_customBackgroundImages, "count") != 0;
}

- (void)setUsesContiguousBarBackground:(BOOL)a3
{
  if (self->_usesContiguousBarBackground != a3)
  {
    self->_usesContiguousBarBackground = a3;
    -[UISearchBarBackground _updateBackgroundImageIfPossible](self, "_updateBackgroundImageIfPossible");
  }
}

- (BOOL)usesContiguousBarBackground
{
  return self->_usesContiguousBarBackground;
}

- (UIColor)barTintColor
{
  return self->_barTintColor;
}

@end
