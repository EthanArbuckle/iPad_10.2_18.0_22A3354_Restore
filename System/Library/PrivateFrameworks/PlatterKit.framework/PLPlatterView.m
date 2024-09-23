@implementation PLPlatterView

- (id)_initWithNavigationBannerStyle
{
  PLPlatterView *v2;
  void *v3;

  v2 = -[PLPlatterView initWithRecipe:](self, "initWithRecipe:", 0);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", 2030);
    -[PLPlatterView setBackgroundView:](v2, "setBackgroundView:", v3);

  }
  return v2;
}

- (id)_initWithCarPlayBannerStyle
{
  PLPlatterView *v2;
  PLPlatterView *v3;
  id v4;
  void *v5;
  int v7;
  __int128 v8;
  uint64_t v9;

  v2 = -[PLPlatterView initWithRecipe:](self, "initWithRecipe:", 15);
  v3 = v2;
  if (v2)
  {
    -[PLPlatterView _setContinuousCornerRadius:](v2, "_setContinuousCornerRadius:", 9.0);
    v7 = 1041865114;
    v8 = xmmword_1D12ABD70;
    v9 = 0x4028000000000000;
    -[PLPlatterView setShadowAttributes:](v3, "setShadowAttributes:", &v7);
    v4 = -[PLPlatterView _newCarPlayBannerStrokeView](v3, "_newCarPlayBannerStrokeView");
    -[PLPlatterView customContentView](v3, "customContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v5, "addSubview:", v4);

  }
  return v3;
}

- (id)_initWithNotificationsBannerStyle
{
  PLPlatterView *v2;
  PLPlatterView *v3;

  v2 = -[PLPlatterView initWithRecipe:](self, "initWithRecipe:", 1);
  v3 = v2;
  if (v2)
  {
    -[PLPlatterView setHasShadow:](v2, "setHasShadow:", 1);
    -[PLPlatterView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 23.5);
  }
  return v3;
}

- (id)_initWithBlurEffectStyle:(int64_t)a3
{
  PLPlatterView *v3;
  PLPlatterView *v4;

  v3 = -[PLPlatterView initWithRecipe:](self, "initWithRecipe:", MTMaterialRecipeForUIBlurEffectStyle());
  v4 = v3;
  if (v3)
  {
    -[PLPlatterView setHasShadow:](v3, "setHasShadow:", 1);
    -[PLPlatterView setRecipeDynamic:](v4, "setRecipeDynamic:", MTIsUIBlurEffectStyleDynamic());
  }
  return v4;
}

- (id)_newCarPlayBannerStrokeView
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v2, "_setContinuousCornerRadius:", 9.0);
  objc_msgSend(v2, "setAutoresizingMask:", 18);
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "_carSystemQuaternaryColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  objc_msgSend(v2, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", 0.5);

  return v2;
}

+ (id)platterViewWithStyle:(id)a3
{
  return (id)objc_msgSend(a1, "platterViewWithStyle:inBundle:", a3, 0);
}

+ (id)platterViewWithBlurEffectStyle:(int64_t)a3
{
  return -[PLPlatterView _initWithBlurEffectStyle:]([PLPlatterView alloc], "_initWithBlurEffectStyle:", a3);
}

- (PLPlatterView)initWithRecipe:(int64_t)a3
{
  return (PLPlatterView *)-[PLPlatterView _initWithRecipe:orRecipeNamesByTraitCollection:inBundle:](self, "_initWithRecipe:orRecipeNamesByTraitCollection:inBundle:", a3, 0, 0);
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView **p_backgroundView;
  BOOL v7;
  BOOL v8;
  PLPlatterView *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView != v5)
  {
    v10 = v5;
    if (v5)
      v7 = 0;
    else
      v7 = !self->_usesBackgroundView;
    v8 = !v7;
    self->_usesBackgroundView = v8;
    -[UIView superview](*p_backgroundView, "superview");
    v9 = (PLPlatterView *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
      -[UIView removeFromSuperview](*p_backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[PLPlatterView _configureBackgroundView:](self, "_configureBackgroundView:", *p_backgroundView);
    -[PLPlatterView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)setMaterialRecipe:(int64_t)a3
{
  id v4;

  if (self->_materialRecipe != a3)
  {
    self->_materialRecipe = a3;
    -[PLPlatterView backgroundMaterialView](self, "backgroundMaterialView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRecipe:", self->_materialRecipe);

  }
}

- (void)setShadowAttributes:(id *)a3
{
  BOOL v3;
  BOOL v4;
  __int128 v5;

  if (a3->var0 != self->_shadowAttributes.opacity
    || (a3->var1.width == self->_shadowAttributes.offset.width
      ? (v3 = a3->var1.height == self->_shadowAttributes.offset.height)
      : (v3 = 0),
        v3 ? (v4 = a3->var2 == self->_shadowAttributes.radius) : (v4 = 0),
        !v4))
  {
    v5 = *(_OWORD *)&a3->var1.height;
    *(_OWORD *)&self->_shadowAttributes.opacity = *(_OWORD *)&a3->var0;
    *(_OWORD *)&self->_shadowAttributes.offset.height = v5;
    -[PLPlatterView _invalidateShadowView](self, "_invalidateShadowView");
  }
}

- (UIEdgeInsets)shadowOutsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  if (-[PLPlatterView hasShadow](self, "hasShadow"))
  {
    -[PLPlatterView _configureShadowViewIfNecessary](self, "_configureShadowViewIfNecessary");
    -[MTShadowView shadowOutsets](self->_shadowView, "shadowOutsets");
  }
  else
  {
    v3 = *MEMORY[0x1E0CEB4B0];
    v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)startLightEffect
{
  UIVisualEffectView *contentLightView;
  void *v4;
  void *v5;
  UIVisualEffectView *edgeLightView;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  contentLightView = self->_contentLightView;
  -[PLPlatterView _contentLight](self, "_contentLight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundEffects:](contentLightView, "setBackgroundEffects:", v5);

  edgeLightView = self->_edgeLightView;
  -[PLPlatterView _innerEdgeLight](self, "_innerEdgeLight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPlatterView _outerEdgeLight](self, "_outerEdgeLight", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundEffects:](edgeLightView, "setBackgroundEffects:", v9);

  -[PLPlatterView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("platter-intelligence-light"));
}

- (void)stopLightEffect
{
  uint64_t v3;

  v3 = MEMORY[0x1E0C9AA60];
  -[UIVisualEffectView setBackgroundEffects:](self->_contentLightView, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);
  -[UIVisualEffectView setBackgroundEffects:](self->_edgeLightView, "setBackgroundEffects:", v3);
  -[PLPlatterView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
}

- (PLPlatterView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PLPlatterView *v7;
  PLPlatterView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[PLPlatterView initWithRecipe:](self, "initWithRecipe:", 0);
  v8 = v7;
  if (v7)
    -[PLPlatterView setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[PLPlatterView contentSizeForSize:](self, "contentSizeForSize:", a3.width, a3.height);
  -[PLPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPlatterView;
  -[PLPlatterView layoutSubviews](&v3, sel_layoutSubviews);
  -[PLPlatterView _configureShadowViewIfNecessary](self, "_configureShadowViewIfNecessary");
  -[PLPlatterView _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  -[PLPlatterView _configureCustomContentViewIfNecessary](self, "_configureCustomContentViewIfNecessary");
  -[PLPlatterView _configureLightViewsIfNecessary](self, "_configureLightViewsIfNecessary");
  -[PLPlatterView _layoutShadowView](self, "_layoutShadowView");
}

- (double)_continuousCornerRadius
{
  return self->_cornerRadius;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
    -[PLPlatterView _invalidateShadowView](self, "_invalidateShadowView");
    -[PLPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (width > 0.0 && height > 0.0)
  {
    -[PLPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:", width, 0.0);
    v6 = (double)((int)(height - v7) & ~((int)(height - v7) >> 31));
    v5 = width;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (UIView)customContentView
{
  -[PLPlatterView _configureCustomContentViewIfNecessary](self, "_configureCustomContentViewIfNecessary");
  return self->_customContentView;
}

- (BOOL)hasShadow
{
  return self->_shadowAttributes.opacity > 0.0;
}

- (void)setHasShadow:(BOOL)a3
{
  _BYTE v4[20];

  if (!a3)
  {
    self->_shadowAttributes.opacity = 0.0;
    -[PLPlatterView _invalidateShadowView](self, "_invalidateShadowView");
LABEL_6:
    -[PLPlatterView setNeedsLayout](self, "setNeedsLayout");
    return;
  }
  if (!-[PLPlatterView hasShadow](self, "hasShadow"))
  {
    *(_OWORD *)&v4[4] = *MEMORY[0x1E0C9D820];
    self->_shadowAttributes.opacity = 1.0;
    *(_OWORD *)(&self->_shadowAttributes.opacity + 1) = *(_OWORD *)v4;
    HIDWORD(self->_shadowAttributes.offset.height) = *(_DWORD *)&v4[16];
    self->_shadowAttributes.radius = 15.0;
    goto LABEL_6;
  }
}

- (void)_invalidateShadowView
{
  MTShadowView *shadowView;

  -[MTShadowView removeFromSuperview](self->_shadowView, "removeFromSuperview");
  shadowView = self->_shadowView;
  self->_shadowView = 0;

  -[PLPlatterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_configureBackgroundView:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(v5, "setUserInteractionEnabled:", 0);
    -[PLPlatterView _continuousCornerRadius](self, "_continuousCornerRadius");
    if (v4 > 0.0)
      objc_msgSend(v5, "_setContinuousCornerRadius:");
    -[PLPlatterView bounds](self, "bounds");
    objc_msgSend(v5, "setFrame:");
    objc_msgSend(v5, "setAutoresizingMask:", 18);
    if (self->_shadowView)
      -[PLPlatterView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v5);
    else
      -[PLPlatterView insertSubview:atIndex:](self, "insertSubview:atIndex:", v5);
  }

}

- (id)_newDefaultBackgroundView
{
  uint64_t v3;
  int64_t materialRecipe;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *recipeNamesByTraitCollection;
  NSBundle *recipeBundle;
  void *v10;

  if (!-[PLPlatterView _isMaterialViewSufficientlySpecified](self, "_isMaterialViewSufficientlySpecified"))
    return 0;
  v3 = !self->_backgroundBlurred;
  if (-[PLPlatterView hasShadow](self, "hasShadow"))
    v3 |= 8uLL;
  materialRecipe = self->_materialRecipe;
  v5 = (void *)MEMORY[0x1E0D47498];
  if (materialRecipe)
  {
    -[PLPlatterView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "materialViewWithRecipe:options:compatibleWithTraitCollection:", materialRecipe, v3, v6);
  }
  else
  {
    recipeNamesByTraitCollection = self->_recipeNamesByTraitCollection;
    recipeBundle = self->_recipeBundle;
    -[PLPlatterView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "materialViewWithRecipeNamesByTraitCollection:inBundle:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", recipeNamesByTraitCollection, recipeBundle, v3, 0, v6, 1.0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRecipeDynamic:", self->_recipeDynamic);
  -[PLPlatterView materialGroupNameBase](self, "materialGroupNameBase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGroupNameBase:", v10);

  return v7;
}

- (BOOL)_isMaterialViewSufficientlySpecified
{
  return self->_materialRecipe || self->_recipeNamesByTraitCollection != 0;
}

- (void)_configureBackgroundViewIfNecessary
{
  id v3;

  if (!self->_backgroundView && self->_usesBackgroundView)
  {
    if (-[PLPlatterView _isMaterialViewSufficientlySpecified](self, "_isMaterialViewSufficientlySpecified"))
    {
      v3 = -[PLPlatterView _newDefaultBackgroundView](self, "_newDefaultBackgroundView");
      -[PLPlatterView setBackgroundView:](self, "setBackgroundView:", v3);

    }
  }
}

- (void)_configureLightViewsIfNecessary
{
  UIVisualEffectView *v3;
  UIVisualEffectView *contentLightView;
  double v5;
  UIVisualEffectView *v6;
  UIVisualEffectView *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *edgeLightView;
  double v10;
  UIVisualEffectView *v11;
  UIVisualEffectView *v12;

  if (!self->_contentLightView)
  {
    v3 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0CEABE8]);
    contentLightView = self->_contentLightView;
    self->_contentLightView = v3;

    -[UIVisualEffectView setUserInteractionEnabled:](self->_contentLightView, "setUserInteractionEnabled:", 0);
    -[PLPlatterView _continuousCornerRadius](self, "_continuousCornerRadius");
    if (v5 > 0.0)
      -[UIVisualEffectView _setContinuousCornerRadius:](self->_contentLightView, "_setContinuousCornerRadius:");
    -[UIVisualEffectView setAutoresizingMask:](self->_contentLightView, "setAutoresizingMask:", 18);
    v6 = self->_contentLightView;
    -[PLPlatterView bounds](self, "bounds");
    -[UIVisualEffectView setFrame:](v6, "setFrame:");
    if (self->_backgroundView)
    {
      -[PLPlatterView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_contentLightView);
    }
    else
    {
      v7 = self->_contentLightView;
      if (self->_shadowView)
      {
        -[PLPlatterView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v7);
      }
      else
      {
        -[PLPlatterView addSubview:](self, "addSubview:", v7);
        -[PLPlatterView sendSubviewToBack:](self, "sendSubviewToBack:", self->_contentLightView);
      }
    }
  }
  if (!self->_edgeLightView)
  {
    v8 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0CEABE8]);
    edgeLightView = self->_edgeLightView;
    self->_edgeLightView = v8;

    -[UIVisualEffectView setUserInteractionEnabled:](self->_edgeLightView, "setUserInteractionEnabled:", 0);
    -[PLPlatterView _continuousCornerRadius](self, "_continuousCornerRadius");
    if (v10 > 0.0)
      -[UIVisualEffectView _setContinuousCornerRadius:](self->_edgeLightView, "_setContinuousCornerRadius:");
    -[UIVisualEffectView setAutoresizingMask:](self->_edgeLightView, "setAutoresizingMask:", 18);
    v11 = self->_edgeLightView;
    -[PLPlatterView bounds](self, "bounds");
    -[UIVisualEffectView setFrame:](v11, "setFrame:");
    if (self->_backgroundView)
    {
      v12 = self->_edgeLightView;
LABEL_15:
      -[PLPlatterView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v12);
      return;
    }
    v12 = self->_edgeLightView;
    if (self->_shadowView)
      goto LABEL_15;
    -[PLPlatterView addSubview:](self, "addSubview:", v12);
    -[PLPlatterView sendSubviewToBack:](self, "sendSubviewToBack:", self->_edgeLightView);
  }
}

- (void)_configureShadowViewIfNecessary
{
  id v3;
  __int128 v4;
  MTShadowView *v5;
  MTShadowView *shadowView;
  _OWORD v7[2];

  if (-[PLPlatterView hasShadow](self, "hasShadow"))
  {
    if (!self->_shadowView)
    {
      v3 = objc_alloc(MEMORY[0x1E0D474A0]);
      -[PLPlatterView _continuousCornerRadius](self, "_continuousCornerRadius");
      v4 = *(_OWORD *)&self->_shadowAttributes.offset.height;
      v7[0] = *(_OWORD *)&self->_shadowAttributes.opacity;
      v7[1] = v4;
      v5 = (MTShadowView *)objc_msgSend(v3, "initWithShadowAttributes:maskCornerRadius:", v7);
      shadowView = self->_shadowView;
      self->_shadowView = v5;

      -[PLPlatterView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_shadowView, 0);
    }
  }
}

- (void)_layoutShadowView
{
  MTShadowView *shadowView;

  shadowView = self->_shadowView;
  if (shadowView)
  {
    -[PLPlatterView bounds](self, "bounds");
    -[MTShadowView frameWithContentWithFrame:](shadowView, "frameWithContentWithFrame:");
    -[MTShadowView setFrame:](self->_shadowView, "setFrame:");
  }
}

- (id)_innerEdgeLight
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CEAD88]);
  objc_msgSend(MEMORY[0x1E0CEAD90], "sharedShimmeringLight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLightSource:radius:region:", v3, 0, 3.0);

  objc_msgSend(v4, "setActivationTransitionDirection:", 2);
  return v4;
}

- (id)_outerEdgeLight
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CEAD88]);
  objc_msgSend(MEMORY[0x1E0CEAD90], "sharedShimmeringLight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLightSource:radius:region:", v3, 1, 10.0);

  objc_msgSend(v4, "setActivationTransitionDirection:", 2);
  return v4;
}

- (id)_contentLight
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CEAD80]);
  objc_msgSend(MEMORY[0x1E0CEAD90], "sharedLight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLightSource:", v3);

  objc_msgSend(v4, "setActivationTransitionDirection:", 2);
  objc_msgSend(v4, "setDeactivationTransitionDirection:", 0);
  return v4;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  NSMutableDictionary *categoriesToProviders;
  void *v6;
  void *v7;
  void *v8;

  categoriesToProviders = self->_categoriesToProviders;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](categoriesToProviders, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PLPlatterView _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
    -[PLPlatterView backgroundMaterialView](self, "backgroundMaterialView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visualStylingProviderForCategory:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E91E2F28;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *categoriesToProviders;
  void *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  if (!self->_categoriesToProviders)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    categoriesToProviders = self->_categoriesToProviders;
    self->_categoriesToProviders = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_categoriesToProviders;
  if (v10)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v8);
  else
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v8);

}

- (void)setMaterialGroupNameBase:(id)a3
{
  NSString *v4;
  NSString *materialGroupNameBase;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", self->_materialGroupNameBase) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    materialGroupNameBase = self->_materialGroupNameBase;
    self->_materialGroupNameBase = v4;

    -[PLPlatterView backgroundMaterialView](self, "backgroundMaterialView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGroupNameBase:", self->_materialGroupNameBase);

  }
}

- (BOOL)isBackgroundBlurred
{
  return self->_backgroundBlurred;
}

- (void)setBackgroundBlurred:(BOOL)a3
{
  self->_backgroundBlurred = a3;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (BOOL)usesBackgroundView
{
  return self->_usesBackgroundView;
}

- (void)setUsesBackgroundView:(BOOL)a3
{
  self->_usesBackgroundView = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- ($2162B30EF87954972E631D01CBA5CFD1)shadowAttributes
{
  __int128 v3;

  v3 = *(_OWORD *)&self[16].var2;
  *(CGSize *)&retstr->var0 = self[16].var1;
  *(_OWORD *)&retstr->var1.height = v3;
  return self;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_recipeBundle, 0);
  objc_storeStrong((id *)&self->_recipeNamesByTraitCollection, 0);
  objc_storeStrong((id *)&self->_categoriesToProviders, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_storeStrong((id *)&self->_edgeLightView, 0);
  objc_storeStrong((id *)&self->_contentLightView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

+ (id)platterViewWithStyle:(id)a3 inBundle:(id)a4
{
  id v4;
  PLPlatterView *v5;
  PLPlatterView *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("navigationBanner")))
  {
    v5 = -[PLPlatterView _initWithNavigationBannerStyle]([PLPlatterView alloc], "_initWithNavigationBannerStyle");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("carPlayBanner")))
  {
    v5 = -[PLPlatterView _initWithCarPlayBannerStyle]([PLPlatterView alloc], "_initWithCarPlayBannerStyle");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("notificationBanner")))
  {
    v5 = -[PLPlatterView _initWithNotificationsBannerStyle]([PLPlatterView alloc], "_initWithNotificationsBannerStyle");
  }
  else
  {
    v5 = objc_alloc_init(PLPlatterView);
  }
  v6 = v5;

  return v6;
}

- (MTMaterialView)backgroundMaterialView
{
  UIView *backgroundView;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    backgroundView = self->_backgroundView;
  else
    backgroundView = 0;
  return (MTMaterialView *)backgroundView;
}

- (PLPlatterView)initWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4
{
  return (PLPlatterView *)-[PLPlatterView _initWithRecipe:orRecipeNamesByTraitCollection:inBundle:](self, "_initWithRecipe:orRecipeNamesByTraitCollection:inBundle:", 0, a3, a4);
}

- (BOOL)isHighlighted
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIView isHighlighted](self->_backgroundView, "isHighlighted");
  else
    return 0;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView setHighlighted:](self->_backgroundView, "setHighlighted:", v3);
}

- (BOOL)isRecipeDynamic
{
  return self->_recipeDynamic;
}

- (void)setRecipeDynamic:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_recipeDynamic != a3)
  {
    v3 = a3;
    self->_recipeDynamic = a3;
    -[PLPlatterView backgroundMaterialView](self, "backgroundMaterialView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRecipeDynamic:", v3);

  }
}

- (void)_configureCustomContentViewIfNecessary
{
  if (!self->_customContentView)
    -[PLPlatterView _configureCustomContentView](self, "_configureCustomContentView");
}

- (id)_initWithRecipe:(int64_t)a3 orRecipeNamesByTraitCollection:(id)a4 inBundle:(id)a5
{
  id v9;
  id v10;
  PLPlatterView *v11;
  uint64_t v12;
  NSDictionary **p_recipeNamesByTraitCollection;
  NSObject *v14;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLPlatterView;
  v11 = -[PLPlatterView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = (uint64_t)v11;
  if (v11)
  {
    v11->_materialRecipe = a3;
    p_recipeNamesByTraitCollection = &v11->_recipeNamesByTraitCollection;
    objc_storeStrong((id *)&v11->_recipeNamesByTraitCollection, a4);
    if (*(_QWORD *)(v12 + 512))
    {
      if (*p_recipeNamesByTraitCollection)
      {
        v14 = PLLogGeneral;
        if (os_log_type_enabled((os_log_t)PLLogGeneral, OS_LOG_TYPE_ERROR))
          -[PLPlatterView(SubclassOverrides) _initWithRecipe:orRecipeNamesByTraitCollection:inBundle:].cold.1(v12, v14);
      }
    }
    objc_storeStrong((id *)(v12 + 472), a5);
    *(_BYTE *)(v12 + 489) = 1;
    objc_msgSend((id)v12, "_setContinuousCornerRadius:", 13.0);
    *(_BYTE *)(v12 + 488) = 1;
    *(_BYTE *)(v12 + 448) = 1;
    objc_msgSend((id)v12, "setPreservesSuperviewLayoutMargins:", 1);
  }

  return (id)v12;
}

- (void)_configureCustomContentView
{
  PLPlatterCustomContentView *v3;
  UIView *customContentView;

  v3 = -[PLPlatterCustomContentView initWithAncestorPlatterView:]([PLPlatterCustomContentView alloc], "initWithAncestorPlatterView:", self);
  customContentView = self->_customContentView;
  self->_customContentView = &v3->super;

  -[UIView setAutoresizingMask:](self->_customContentView, "setAutoresizingMask:", 18);
  -[PLPlatterView addSubview:](self, "addSubview:", self->_customContentView);
  -[PLPlatterView bringSubviewToFront:](self, "bringSubviewToFront:", self->_customContentView);
}

- (MTMaterialShadowView)backgroundMaterialShadowView
{
  return 0;
}

@end
