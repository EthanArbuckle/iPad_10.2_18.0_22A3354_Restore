@implementation SBUILegibilityView

- (BOOL)_updateShadow
{
  uint64_t v3;
  void *v4;
  void *v5;
  UIImage *v6;
  NSObject *v7;
  _BOOL4 v8;
  double Current;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  double v14;
  void *v15;
  NSMutableArray *runningAsyncOperations;
  NSMutableArray *v17;
  NSMutableArray *v18;
  NSObject *v19;
  _BOOL4 v20;
  double v21;
  NSObject *v22;
  void *v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[SBUILegibilityView superview](self, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[SBUILegibilityView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !self->_needsUpdateShadow)
    return 0;
  v6 = self->_image;
  if (v6 && self->_legibilitySettings)
  {
    if (self->_strength <= 0.0)
    {
      -[SBUILegibilityContainerView setImage:](self->_shadowImageView, "setImage:", 0);
    }
    else
    {
      SBLogLegibility();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

      Current = 0.0;
      if (v8)
        Current = CFAbsoluteTimeGetCurrent();
      v25 = 0;
      -[SBUILegibilityView legibilityEngine](self, "legibilityEngine");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "executeLegibilityUpdateForContainer:forImage:settings:strength:engineResult:", self, v6, self->_legibilitySettings, &self->_strength, &v25);
      -[SBUILegibilityView _screen](self, "_screen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        -[SBUILegibilityView _screen](self, "_screen");
      else
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scale");
      self->_appliedScale = v14;

      if (v25 && self->_backfillTemplateResults)
      {
        objc_msgSend(v10, "executeAsyncLegibilityUpdateForContainer:image:settings:strength:completion:", self, v6, self->_legibilitySettings, &self->_strength, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        runningAsyncOperations = self->_runningAsyncOperations;
        if (!runningAsyncOperations)
        {
          v17 = (NSMutableArray *)objc_opt_new();
          v18 = self->_runningAsyncOperations;
          self->_runningAsyncOperations = v17;

          runningAsyncOperations = self->_runningAsyncOperations;
        }
        -[NSMutableArray addObject:](runningAsyncOperations, "addObject:", v15);

      }
      SBLogLegibility();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

      if (v20)
      {
        v21 = CFAbsoluteTimeGetCurrent();
        SBLogLegibility();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          -[SBUILegibilityView userInfo](self, "userInfo");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v27 = v24;
          v28 = 2048;
          v29 = v21 - Current;
          _os_log_debug_impl(&dword_1A471F000, v22, OS_LOG_TYPE_DEBUG, "Legibility generation time (%@): %f", buf, 0x16u);

        }
      }

    }
    self->_needsUpdateShadow = 0;
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)updateForChangedSettings:(id)a3 options:(int64_t)a4 image:(id)a5 strength:(double)a6
{
  SBUILegibilitySettings *v10;
  id v11;
  int v12;
  BOOL *p_needsUpdateShadow;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  _DWORD v28[2];
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = (SBUILegibilitySettings *)a3;
  v11 = a5;
  v12 = BSEqualObjects();
  p_needsUpdateShadow = &self->_needsUpdateShadow;
  if (self->_needsUpdateShadow || v12 == 0)
  {
    *p_needsUpdateShadow = 1;
  }
  else
  {
    -[SBUILegibilityContainerView image](self->_shadowImageView, "image");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
    {
      -[SBUILegibilityContainerView image](self->_imageView, "image");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        v18 = self->_legibilitySettings != v10;
      else
        v18 = 1;
      *p_needsUpdateShadow = v18;

    }
    else
    {
      *p_needsUpdateShadow = 1;
    }

  }
  v19 = -[SBUILegibilityView _updateSettings:](self, "_updateSettings:", v10);
  v20 = -[SBUILegibilityView _updateOptions:](self, "_updateOptions:", a4);
  v21 = -[SBUILegibilityView _updateContentImageView:](self, "_updateContentImageView:", v11);

  if (v19 || v20 || v21 || *p_needsUpdateShadow)
  {
    -[SBUILegibilityView _cancelOperations](self, "_cancelOperations");
    self->_strength = a6;
    self->_appliedScale = 0.0;
    v22 = -[SBUILegibilityView _updateShadow](self, "_updateShadow");
    v23 = -[SBUILegibilityView _updateStrength:](self, "_updateStrength:", a6);
    v24 = -[SBUILegibilityView _updateFilters](self, "_updateFilters");
    SBLogLegibility();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      -[SBUILegibilityView userInfo](self, "userInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = 67109890;
      v28[1] = v22;
      v29 = 1024;
      v30 = v23;
      v31 = 1024;
      v32 = v24;
      v33 = 2112;
      v34 = v27;
      _os_log_debug_impl(&dword_1A471F000, v25, OS_LOG_TYPE_DEBUG, "updateForChangedSettings committed! didUpdateShadow: %{BOOL}u -- didUpdateStrength: %{BOOL}u -- didUpdateFilters: %{BOOL}u -- userInfo: %@", (uint8_t *)v28, 0x1Eu);

    }
    -[SBUILegibilityView setNeedsLayout](self, "setNeedsLayout");
    -[SBUILegibilityView layoutIfNeeded](self, "layoutIfNeeded");
    -[SBUILegibilityView updateImage](self, "updateImage");
  }
  else
  {
    SBLogLegibility();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[SBUILegibilityView updateForChangedSettings:options:image:strength:].cold.1((unsigned __int8 *)&self->_needsUpdateShadow, self, v26);

  }
}

- (BOOL)_updateOptions:(int64_t)a3
{
  unint64_t options;
  int v4;
  _BOOL4 v6;
  char v7;
  BOOL v8;

  options = self->_options;
  if (options == a3)
    return 0;
  v4 = a3;
  self->_options = a3;
  v6 = -[SBUILegibilityView usesColorFilters](self, "usesColorFilters");
  v7 = options ^ v4;
  if (((options ^ v4) & 1) == 0 && ((options >> 1) & 1) == v6)
    return 0;
  v8 = -[SBUILegibilityView _updateFilters](self, "_updateFilters");
  if ((v7 & 1) != 0)
    -[SBUILegibilityView updateImage](self, "updateImage");
  return v8;
}

- (BOOL)_updateContentImageView:(id)a3
{
  id v5;
  SBUILegibilityContainerView *imageView;
  UIImage **p_image;
  BOOL v8;
  UIImage *image;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v5 = a3;
  -[SBUILegibilityContainerView setHidden:](self->_imageView, "setHidden:", -[SBUILegibilityView _hideImageView](self, "_hideImageView"));
  imageView = self->_imageView;
  -[SBUILegibilityView _imageViewAlpha](self, "_imageViewAlpha");
  -[SBUILegibilityContainerView setAlpha:](imageView, "setAlpha:");
  if (!v5)
  {
    -[SBUILegibilityContainerView setImage:](self->_imageView, "setImage:", 0);
    -[SBUILegibilityContainerView setImage:](self->_shadowImageView, "setImage:", 0);
    self->_appliedScale = 0.0;
    image = self->_image;
    self->_image = 0;

LABEL_11:
    v8 = 1;
    goto LABEL_12;
  }
  p_image = &self->_image;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[UIImage size](*p_image, "size");
    v11 = v10;
    v13 = v12;
    -[SBUILegibilityContainerView setImage:](self->_imageView, "setImage:", *p_image);
    -[SBUILegibilityContainerView image](self->_imageView, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "size");
    v16 = v15;
    v18 = v17;

    if (v16 != v11 || v18 != v13)
      -[SBUILegibilityView layoutImageView](self, "layoutImageView");
    -[SBUILegibilityView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_11;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (void)layoutImageView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  CGRect v21;
  CGRect v22;

  -[SBUILegibilityView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");

  -[SBUILegibilityView bounds](self, "bounds");
  -[SBUILegibilityView image](self, "image");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityContainerView frame](self->_imageView, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (v20)
  {
    objc_msgSend(v20, "size");
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
  }
  else
  {
    v13 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  v22.origin.x = v13;
  v22.origin.y = v15;
  v22.size.width = v17;
  v22.size.height = v19;
  if (!CGRectEqualToRect(v21, v22))
    -[SBUILegibilityContainerView setFrame:](self->_imageView, "setFrame:", v13, v15, v17, v19);

}

- (UIImage)image
{
  return self->_image;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  SBUILegibilitySettings *legibilitySettings;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  void *v15;
  void *v16;
  double x;
  double y;
  double width;
  double height;
  SBUILegibilityContainerView *imageView;
  SBUILegibilityShadowView *shadowImageView;
  uint64_t v23;
  CGFloat rect2;
  CGFloat v25;
  CGFloat v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;

  v27.receiver = self;
  v27.super_class = (Class)SBUILegibilityView;
  -[SBUILegibilityView layoutSubviews](&v27, sel_layoutSubviews);
  -[SBUILegibilityView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  -[SBUILegibilityView bounds](self, "bounds");
  -[SBUILegibilityView image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityView layoutImageView](self, "layoutImageView");
  if ((-[SBUILegibilityShadowView isHidden](self->_shadowImageView, "isHidden") & 1) == 0)
  {
    -[SBUILegibilityContainerView image](self->_shadowImageView, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {

    }
    else
    {
      legibilitySettings = self->_legibilitySettings;

      if (legibilitySettings)
      {
        -[SBUILegibilityShadowView frame](self->_shadowImageView, "frame");
        v25 = v11;
        v26 = v10;
        v13 = v12;
        rect2 = v14;
        -[SBUILegibilityView legibilityEngine](self, "legibilityEngine");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBUILegibilityContainerView image](self->_shadowImageView, "image");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "calculateShadowImageViewSizeForOriginalImage:shadowImage:settings:", v6, v16, self->_legibilitySettings);

        v23 = v5;
        UIRectCenteredIntegralRectScale();
        x = v28.origin.x;
        y = v28.origin.y;
        width = v28.size.width;
        height = v28.size.height;
        v29.origin.y = v25;
        v29.origin.x = v26;
        v29.size.width = v13;
        v29.size.height = rect2;
        if (!CGRectEqualToRect(v28, v29))
          -[SBUILegibilityShadowView setFrame:](self->_shadowImageView, "setFrame:", x, y, width, height, v23);
      }
    }
  }
  -[SBUILegibilityContainerView setHidden:](self->_imageView, "setHidden:", -[SBUILegibilityView _hideImageView](self, "_hideImageView", v23));
  imageView = self->_imageView;
  -[SBUILegibilityView _imageViewAlpha](self, "_imageViewAlpha");
  -[SBUILegibilityContainerView setAlpha:](imageView, "setAlpha:");
  -[SBUILegibilityShadowView setHidden:](self->_shadowImageView, "setHidden:", -[SBUILegibilityView _hideShadowImageViewForStrength:](self, "_hideShadowImageViewForStrength:", 0));
  shadowImageView = self->_shadowImageView;
  -[SBUILegibilityView _shadowImageViewAlphaForStrength:](self, "_shadowImageViewAlphaForStrength:", 0);
  -[SBUILegibilityShadowView setAlpha:](shadowImageView, "setAlpha:");

}

- (BOOL)_hideShadowImageViewForStrength:(double *)a3
{
  double *p_strength;
  double v5;
  char v6;
  BOOL result;
  double v8;

  p_strength = &self->_strength;
  if (a3)
    p_strength = a3;
  v5 = *p_strength;
  v6 = -[SBUILegibilityView isHidden](self, "isHidden");
  result = 1;
  if ((v6 & 1) == 0 && v5 > 0.0)
  {
    -[SBUILegibilityView alpha](self, "alpha");
    return v8 <= 0.0;
  }
  return result;
}

- (BOOL)_hideImageView
{
  double v4;

  if ((-[SBUILegibilityView isHidden](self, "isHidden") & 1) != 0 || self->_hidesImage)
    return 1;
  -[SBUILegibilityView alpha](self, "alpha");
  return v4 <= 0.0;
}

- (double)_imageViewAlpha
{
  return (double)(-[SBUILegibilityView _hideImageView](self, "_hideImageView") ^ 1);
}

- (double)_shadowImageViewAlphaForStrength:(double *)a3
{
  return (double)(-[SBUILegibilityView _hideShadowImageViewForStrength:](self, "_hideShadowImageViewForStrength:", a3) ^ 1);
}

- (SBUILegibilityEngine)legibilityEngine
{
  SBUILegibilityEngine *legibilityEngine;
  SBUILegibilityEngine *v4;
  SBUILegibilityEngine *v5;

  legibilityEngine = self->_legibilityEngine;
  if (!legibilityEngine)
  {
    +[SBUILegibilityDefaultEngine defaultEngine](SBUILegibilityDefaultEngine, "defaultEngine");
    v4 = (SBUILegibilityEngine *)objc_claimAutoreleasedReturnValue();
    v5 = self->_legibilityEngine;
    self->_legibilityEngine = v4;

    -[SBUILegibilityView _cancelOperations](self, "_cancelOperations");
    legibilityEngine = self->_legibilityEngine;
  }
  return legibilityEngine;
}

- (void)updateOrigImage:(id)a3 shadowImage:(id)a4 strengthenedShadowImage:(id)a5 settings:(id)a6 engine:(id)a7 isTemplate:(BOOL)a8 withStrength:(double *)a9 context:(id)a10
{
  id v15;
  id v16;
  SBUILegibilitySettings *v17;
  id v18;
  id v19;
  NSMutableArray *runningAsyncOperations;
  UIImage *image;
  SBUILegibilitySettings *legibilitySettings;
  id v23;
  SBUILegibilityShadowView *shadowImageView;
  UIImage *v27;

  v27 = (UIImage *)a3;
  v15 = a4;
  v16 = a5;
  v17 = (SBUILegibilitySettings *)a6;
  v18 = a7;
  v19 = a10;
  if (v19)
  {
    if (-[NSMutableArray containsObject:](self->_runningAsyncOperations, "containsObject:", v19))
    {
      -[NSMutableArray removeObject:](self->_runningAsyncOperations, "removeObject:", v19);
      if (!-[NSMutableArray count](self->_runningAsyncOperations, "count"))
      {
        runningAsyncOperations = self->_runningAsyncOperations;
        self->_runningAsyncOperations = 0;

      }
    }
  }
  image = self->_image;
  legibilitySettings = self->_legibilitySettings;
  -[SBUILegibilityView legibilityEngine](self, "legibilityEngine");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (image == v27 && legibilitySettings == v17 && v23 == v18)
  {
    -[SBUILegibilityContainerView setLegibilitySettings:](self->_shadowImageView, "setLegibilitySettings:", v17);
    -[SBUILegibilityContainerView setLegibilityEngine:](self->_shadowImageView, "setLegibilityEngine:", v18);
    shadowImageView = self->_shadowImageView;
    if (v16 && a9)
    {
      -[SBUILegibilityShadowView setImage:strengthenedImage:strength:](shadowImageView, "setImage:strengthenedImage:strength:", v15, v16, *a9);
    }
    else
    {
      -[SBUILegibilityContainerView setImage:](shadowImageView, "setImage:", v15);
      -[SBUILegibilityContainerView setStrength:](self->_shadowImageView, "setStrength:", self->_strength);
    }
    -[SBUILegibilityView setNeedsLayout](self, "setNeedsLayout");
    -[SBUILegibilityView layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUILegibilityView;
  -[SBUILegibilityView setHidden:](&v4, sel_setHidden_, a3);
  -[SBUILegibilityView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAlpha:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUILegibilityView;
  -[SBUILegibilityView setAlpha:](&v4, sel_setAlpha_, a3);
  -[SBUILegibilityView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_updateSettings:(id)a3
{
  id v5;
  char v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = SBUILegibilitySettingsAreEqual(v5, self->_legibilitySettings);
  if ((v6 & 1) == 0)
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
  -[SBUILegibilityContainerView legibilitySettings](self->_imageView, "legibilitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SBUILegibilitySettingsAreEqual(v5, v7);

  if ((v8 & 1) != 0)
  {
    v9 = v6 ^ 1;
  }
  else
  {
    -[SBUILegibilityContainerView setLegibilitySettings:](self->_imageView, "setLegibilitySettings:", v5);
    v9 = 1;
  }
  -[SBUILegibilityContainerView legibilitySettings](self->_shadowImageView, "legibilitySettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = SBUILegibilitySettingsAreEqual(v5, v10);

  if ((v11 & 1) == 0)
  {
    -[SBUILegibilityContainerView setLegibilitySettings:](self->_shadowImageView, "setLegibilitySettings:", v5);
    v9 = 1;
  }

  return v9;
}

- (NSMutableDictionary)userInfo
{
  NSMutableDictionary *userInfo;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  void *v7;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_userInfo;
    self->_userInfo = v4;

    v6 = self->_userInfo;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v7, CFSTR("UUID"));

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (BOOL)_updateStrength:(double)a3
{
  double v5;
  double v6;
  NSObject *v8;
  _BOOL4 v9;
  double Current;
  SBUILegibilityShadowView *shadowImageView;
  NSObject *v12;
  _BOOL4 v13;
  double v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[SBUILegibilityContainerView strength](self->_shadowImageView, "strength");
  v6 = v5;
  if (self->_strength == v5)
    return 0;
  self->_strength = a3;
  SBLogLegibility();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  Current = 0.0;
  if (v9)
    Current = CFAbsoluteTimeGetCurrent();
  -[SBUILegibilityContainerView setStrength:](self->_shadowImageView, "setStrength:", self->_strength);
  -[SBUILegibilityShadowView setHidden:](self->_shadowImageView, "setHidden:", -[SBUILegibilityView _hideShadowImageViewForStrength:](self, "_hideShadowImageViewForStrength:", 0));
  shadowImageView = self->_shadowImageView;
  -[SBUILegibilityView _shadowImageViewAlphaForStrength:](self, "_shadowImageViewAlphaForStrength:", 0);
  -[SBUILegibilityShadowView setAlpha:](shadowImageView, "setAlpha:");
  SBLogLegibility();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

  if (v13)
  {
    v14 = CFAbsoluteTimeGetCurrent();
    SBLogLegibility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[SBUILegibilityView userInfo](self, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v16;
      v19 = 2048;
      v20 = v14 - Current;
      _os_log_debug_impl(&dword_1A471F000, v15, OS_LOG_TYPE_DEBUG, "(%@) legibility strength application time: %f", (uint8_t *)&v17, 0x16u);

    }
  }
  return v6 != a3;
}

- (BOOL)_updateFilters
{
  BOOL v3;

  v3 = -[SBUILegibilityContainerView updateOptions:](self->_imageView, "updateOptions:", self->_options);
  return v3 | -[SBUILegibilityContainerView updateOptions:](self->_shadowImageView, "updateOptions:", self->_options);
}

- (void)_cancelOperations
{
  NSMutableArray *runningAsyncOperations;

  if (-[NSMutableArray count](self->_runningAsyncOperations, "count"))
  {
    -[NSMutableArray makeObjectsPerformSelector:](self->_runningAsyncOperations, "makeObjectsPerformSelector:", sel_cancel);
    -[NSMutableArray removeAllObjects](self->_runningAsyncOperations, "removeAllObjects");
    runningAsyncOperations = self->_runningAsyncOperations;
    self->_runningAsyncOperations = 0;

  }
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUILegibilityView;
  -[SBUILegibilityView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[SBUILegibilityView _redrawShadowForNewContainer](self, "_redrawShadowForNewContainer");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUILegibilityView;
  -[SBUILegibilityView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SBUILegibilityView _redrawShadowForNewContainer](self, "_redrawShadowForNewContainer");
}

- (void)setBackfillTemplateResults:(BOOL)a3
{
  self->_backfillTemplateResults = a3;
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double appliedScale;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBUILegibilityView;
  -[SBUILegibilityView willMoveToSuperview:](&v10, sel_willMoveToSuperview_, v4);
  if (v4)
  {
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = v7;
    appliedScale = self->_appliedScale;

    if (v8 != appliedScale)
      -[SBUILegibilityView _clearShadowAndMarkNeedsNew:](self, "_clearShadowAndMarkNeedsNew:", 0);
  }

}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double appliedScale;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBUILegibilityView;
  -[SBUILegibilityView willMoveToWindow:](&v9, sel_willMoveToWindow_, v4);
  if (v4)
  {
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;
    appliedScale = self->_appliedScale;

    if (v7 != appliedScale)
      -[SBUILegibilityView _clearShadowAndMarkNeedsNew:](self, "_clearShadowAndMarkNeedsNew:", 0);
  }

}

- (void)_clearShadowAndMarkNeedsNew:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  -[SBUILegibilityContainerView image](self->_shadowImageView, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SBUILegibilityContainerView setImage:](self->_shadowImageView, "setImage:", 0);
  }
  else if (!v3)
  {
    return;
  }
  self->_needsUpdateShadow = 1;
}

- (SBUILegibilityView)initWithFrame:(CGRect)a3
{
  SBUILegibilityView *v3;
  SBUILegibilityView *v4;
  void *v5;
  uint64_t v6;
  SBUILegibilityContainerView *imageView;
  uint64_t v8;
  SBUILegibilityShadowView *shadowImageView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBUILegibilityView;
  v3 = -[SBUILegibilityView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBUILegibilityView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    v4->_options = 2;
    v6 = objc_opt_new();
    imageView = v4->_imageView;
    v4->_imageView = (SBUILegibilityContainerView *)v6;

    -[SBUILegibilityContainerView updateOptions:](v4->_imageView, "updateOptions:", v4->_options);
    v8 = objc_opt_new();
    shadowImageView = v4->_shadowImageView;
    v4->_shadowImageView = (SBUILegibilityShadowView *)v8;

    -[SBUILegibilityContainerView updateOptions:](v4->_shadowImageView, "updateOptions:", v4->_options);
    -[SBUILegibilityView addSubview:](v4, "addSubview:", v4->_shadowImageView);
    -[SBUILegibilityView addSubview:](v4, "addSubview:", v4->_imageView);
  }
  return v4;
}

- (void)setLegibilityEngine:(id)a3
{
  SBUILegibilityEngine *v5;
  id v6;

  v6 = a3;
  v5 = self->_legibilityEngine;
  if ((-[SBUILegibilityEngine isEqual:](v5, "isEqual:", v6) & 1) == 0)
  {
    if (v5)
    {
      -[SBUILegibilityView _cancelOperations](self, "_cancelOperations");
      objc_storeStrong((id *)&self->_legibilityEngine, a3);
      -[SBUILegibilityView _clearShadowAndMarkNeedsNew:](self, "_clearShadowAndMarkNeedsNew:", 0);
      -[SBUILegibilityView _updateShadow](self, "_updateShadow");
    }
    else
    {
      objc_storeStrong((id *)&self->_legibilityEngine, a3);
    }
  }

}

- (SBUILegibilityView)initWithSettings:(id)a3 strength:(double)a4 image:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  SBUILegibilityView *v12;
  SBUILegibilityView *v13;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "size");
  v12 = -[SBUILegibilityView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v10, v11);
  v13 = v12;
  if (v12)
    -[SBUILegibilityView updateForChangedSettings:options:image:strength:](v12, "updateForChangedSettings:options:image:strength:", v8, 2, v9, a4);

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[SBUILegibilityView _cancelOperations](self, "_cancelOperations");
  v3.receiver = self;
  v3.super_class = (Class)SBUILegibilityView;
  -[SBUILegibilityView dealloc](&v3, sel_dealloc);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  BOOL v29;
  BOOL v30;
  objc_super v32;
  CGPoint v33;
  CGRect v34;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SBUILegibilityView hitTestEdgeInsets](self, "hitTestEdgeInsets");
  if (v11 == *(double *)(MEMORY[0x1E0CEB4B0] + 8)
    && v8 == *MEMORY[0x1E0CEB4B0]
    && v10 == *(double *)(MEMORY[0x1E0CEB4B0] + 24)
    && v9 == *(double *)(MEMORY[0x1E0CEB4B0] + 16))
  {
    v32.receiver = self;
    v32.super_class = (Class)SBUILegibilityView;
    v29 = -[SBUILegibilityView pointInside:withEvent:](&v32, sel_pointInside_withEvent_, v7, x, y);
  }
  else
  {
    -[SBUILegibilityView bounds](self, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[SBUILegibilityView hitTestEdgeInsets](self, "hitTestEdgeInsets");
    v24 = v18 + v23;
    v27 = v20 - (v25 + v26);
    v34.size.height = v22 - (v23 + v28);
    v34.origin.x = v16 + v25;
    v34.origin.y = v24;
    v34.size.width = v27;
    v33.x = x;
    v33.y = y;
    v29 = CGRectContainsPoint(v34, v33);
  }
  v30 = v29;

  return v30;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SBUILegibilityView image](self, "image", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setImage:(id)a3
{
  -[SBUILegibilityView updateForChangedSettings:options:image:strength:](self, "updateForChangedSettings:options:image:strength:", self->_legibilitySettings, self->_options, a3, self->_strength);
}

- (void)setStrength:(double)a3
{
  -[SBUILegibilityView updateForChangedSettings:options:image:strength:](self, "updateForChangedSettings:options:image:strength:", self->_legibilitySettings, self->_options, self->_image, a3);
}

- (void)updateForChangedSettings:(id)a3
{
  -[SBUILegibilityView updateForChangedSettings:options:image:strength:](self, "updateForChangedSettings:options:image:strength:", a3, self->_options, self->_image, self->_strength);
}

- (void)updateForChangedSettings:(id)a3 options:(int64_t)a4
{
  -[SBUILegibilityView updateForChangedSettings:options:image:strength:](self, "updateForChangedSettings:options:image:strength:", a3, a4, self->_image, self->_strength);
}

- (void)setHidesImage:(BOOL)a3
{
  self->_hidesImage = a3;
  -[SBUILegibilityView _updateContentImageView:](self, "_updateContentImageView:", self->_image);
}

- (BOOL)usesColorFilters
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)usesSecondaryColor
{
  return self->_options & 1;
}

- (id)drawingColor
{
  BOOL v3;
  SBUILegibilitySettings *legibilitySettings;

  v3 = -[SBUILegibilityView usesSecondaryColor](self, "usesSecondaryColor");
  legibilitySettings = self->_legibilitySettings;
  if (v3)
    -[SBUILegibilitySettings secondaryColor](legibilitySettings, "secondaryColor");
  else
    -[SBUILegibilitySettings primaryColor](legibilitySettings, "primaryColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)shadowColor
{
  return -[SBUILegibilitySettings shadowColor](self->_legibilitySettings, "shadowColor");
}

- (UIImage)shadowImage
{
  return -[SBUILegibilityContainerView image](self->_shadowImageView, "image");
}

- (UIImage)strengthenedImage
{
  return -[SBUILegibilityContainerView strengthenedImage](self->_shadowImageView, "strengthenedImage");
}

- (UIImage)origImage
{
  return self->_image;
}

- (int64_t)options
{
  return self->_options;
}

- (double)strength
{
  return self->_strength;
}

- (BOOL)hidesImage
{
  return self->_hidesImage;
}

- (void)setUsesColorFilters:(BOOL)a3
{
  self->_usesColorFilters = a3;
}

- (BOOL)backfillTemplateResults
{
  return self->_backfillTemplateResults;
}

- (SBUILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIEdgeInsets)hitTestEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestEdgeInsets.top;
  left = self->_hitTestEdgeInsets.left;
  bottom = self->_hitTestEdgeInsets.bottom;
  right = self->_hitTestEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3
{
  self->_hitTestEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_legibilityEngine, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_runningAsyncOperations, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

- (void)updateForChangedSettings:(NSObject *)a3 options:image:strength:.cold.1(unsigned __int8 *a1, void *a2, NSObject *a3)
{
  int v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(a2, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67110146;
  v6[1] = 0;
  v7 = 1024;
  v8 = 0;
  v9 = 1024;
  v10 = 0;
  v11 = 1024;
  v12 = v4;
  v13 = 2112;
  v14 = v5;
  _os_log_debug_impl(&dword_1A471F000, a3, OS_LOG_TYPE_DEBUG, "updateForChangedSettings abandoned! settingsWereUpdated: %{BOOL}u -- optionsWereUpdated: %{BOOL}u -- contentWasUpdated: %{BOOL}u -- _needsUpdateShadow: %{BOOL}u -- userInfo: %@", (uint8_t *)v6, 0x24u);

}

@end
