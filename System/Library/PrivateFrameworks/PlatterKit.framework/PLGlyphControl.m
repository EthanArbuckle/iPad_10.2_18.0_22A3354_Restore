@implementation PLGlyphControl

+ (id)dismissControlWithMaterialRecipe:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMaterialRecipe:", a3);
  v4 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("x"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGlyph:", v7);

  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("dismiss-expanded-button"));
  return v3;
}

- (PLGlyphControl)initWithMaterialRecipe:(int64_t)a3
{
  PLGlyphControl *v4;
  PLGlyphControl *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLGlyphControl;
  v4 = -[PLGlyphControl init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_materialRecipe = a3;
    v4->_visualStyle = -1;
    v4->_blurEnabled = 1;
    -[PLGlyphControl layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

  }
  return v5;
}

- (UIImage)glyph
{
  return -[UIImageView image](self->_glyphView, "image");
}

- (void)setGlyph:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLGlyphControl glyph](self, "glyph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
    -[PLGlyphControl _configureGlyphViewIfNecessaryWithImage:](self, "_configureGlyphViewIfNecessaryWithImage:", v6);

}

- (void)setVisualStyle:(int64_t)a3
{
  if (self->_visualStyle != a3)
  {
    -[PLGlyphControl _removeAllVisualStyling](self, "_removeAllVisualStyling");
    self->_visualStyle = a3;
    -[PLGlyphControl _updateAllVisualStyling](self, "_updateAllVisualStyling");
  }
}

- (void)setBlurEnabled:(BOOL)a3
{
  if (self->_blurEnabled != a3)
  {
    self->_blurEnabled = a3;
    -[MTMaterialView setBlurEnabled:](self->_backgroundMaterialView, "setBlurEnabled:");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  unsigned int v6;
  char v7;
  MTMaterialView *backgroundMaterialView;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  char v13;
  id location;
  objc_super v15;
  objc_super v16;
  objc_super v17;

  v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLGlyphControl;
  v5 = -[PLGlyphControl isHighlighted](&v17, sel_isHighlighted);
  v16.receiver = self;
  v16.super_class = (Class)PLGlyphControl;
  -[PLGlyphControl setHighlighted:](&v16, sel_setHighlighted_, v3);
  v15.receiver = self;
  v15.super_class = (Class)PLGlyphControl;
  v6 = -[PLGlyphControl isHighlighted](&v15, sel_isHighlighted);
  if (v5 != v6)
  {
    v7 = v6;
    -[PLGlyphControl _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
    backgroundMaterialView = self->_backgroundMaterialView;
    v9 = objc_initWeak(&location, backgroundMaterialView);
    v10 = (void *)objc_msgSend((id)objc_opt_class(), "newDefaultHighlightAnimator");

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__PLGlyphControl_setHighlighted___block_invoke;
    v11[3] = &unk_1E91D30D8;
    objc_copyWeak(&v12, &location);
    v13 = v7;
    objc_msgSend(v10, "addAnimations:", v11);
    objc_msgSend(v10, "startAnimation");
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
}

void __33__PLGlyphControl_setHighlighted___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHighlighted:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a4;
  v7.receiver = self;
  v7.super_class = (Class)PLGlyphControl;
  -[PLGlyphControl _sendActionsForEvents:withEvent:](&v7, sel__sendActionsForEvents_withEvent_, a3, v6);
  if ((a3 & 0x40) != 0)
    -[PLGlyphControl _handleTouchUpInsideWithEvent:](self, "_handleTouchUpInsideWithEvent:", v6);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  PLGlyphControl *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (PLGlyphControl *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1
    || objc_msgSend(v4, "numberOfTapsRequired") != 1;

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 34.0;
  v4 = 34.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_cornerRadius
{
  CGRect v3;

  -[PLGlyphControl bounds](self, "bounds");
  return CGRectGetHeight(v3) * 0.5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PLGlyphControl;
  -[PLGlyphControl layoutSubviews](&v13, sel_layoutSubviews);
  -[PLGlyphControl _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
  -[PLGlyphControl _cornerRadius](self, "_cornerRadius");
  -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundMaterialView, "_setContinuousCornerRadius:");
  -[PLGlyphControl bounds](self, "bounds");
  -[MTMaterialView setFrame:](self->_backgroundMaterialView, "setFrame:");
  -[UIImageView image](self->_glyphView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  BSRectWithSize();
  v12 = PLMainScreenScale();
  UIRectCenteredIntegralRectScale();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIImageView setFrame:](self->_glyphView, "setFrame:", v5, v7, v9, v11, *(_QWORD *)&v12);
}

- (NSString)materialGroupNameBase
{
  return (NSString *)-[MTMaterialView groupNameBase](self->_backgroundMaterialView, "groupNameBase");
}

- (void)setMaterialGroupNameBase:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLGlyphControl materialGroupNameBase](self, "materialGroupNameBase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
  {
    -[PLGlyphControl _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
    -[MTMaterialView setGroupNameBase:](self->_backgroundMaterialView, "setGroupNameBase:", v6);
  }

}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  return self->_visualStylingProvider;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v6;
  MTVisualStylingProvider *v7;

  v6 = (MTVisualStylingProvider *)a3;
  if (self->_visualStylingProvider != v6)
  {
    v7 = v6;
    -[PLGlyphControl _removeAllVisualStyling](self, "_removeAllVisualStyling");
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    -[PLGlyphControl _updateAllVisualStyling](self, "_updateAllVisualStyling");
    v6 = v7;
  }

}

- (void)_updateGlyphViewVisualStyling
{
  -[PLGlyphControl _updateVisualStylingOfView:](self, "_updateVisualStylingOfView:", self->_glyphView);
}

- (void)_configureGlyphViewIfNecessaryWithImage:(id)a3
{
  objc_class *v4;
  id v5;
  UIImageView *v6;
  UIImageView *glyphView;

  if (a3)
  {
    if (!self->_glyphView)
    {
      v4 = (objc_class *)MEMORY[0x1E0CEA658];
      v5 = a3;
      v6 = (UIImageView *)objc_msgSend([v4 alloc], "initWithImage:", v5);

      glyphView = self->_glyphView;
      self->_glyphView = v6;

      -[UIImageView setContentMode:](self->_glyphView, "setContentMode:", 1);
      -[PLGlyphControl _updateGlyphViewVisualStyling](self, "_updateGlyphViewVisualStyling");
      -[PLGlyphControl addSubview:](self, "addSubview:", self->_glyphView);
      -[PLGlyphControl setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)_configureMaterialViewIfNecessary:(id *)a3 positioningAtIndex:(unint64_t)a4
{
  id v7;

  if (a3 && !*a3)
  {
    if (self->_materialRecipe)
    {
      objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      *a3 = v7;
      -[PLGlyphControl insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, a4);
      -[PLGlyphControl setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)_configureBackgroundMaterialViewIfNecessary
{
  MTMaterialView *v3;
  MTMaterialView *v4;
  MTMaterialView *v5;
  MTMaterialView *backgroundMaterialView;

  backgroundMaterialView = self->_backgroundMaterialView;
  v3 = backgroundMaterialView;
  -[PLGlyphControl _configureMaterialViewIfNecessary:positioningAtIndex:](self, "_configureMaterialViewIfNecessary:positioningAtIndex:", &backgroundMaterialView, 0);
  v4 = backgroundMaterialView;

  -[MTMaterialView setBlurEnabled:](v4, "setBlurEnabled:", self->_blurEnabled);
  v5 = self->_backgroundMaterialView;
  self->_backgroundMaterialView = v4;

}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (int64_t)visualStyle
{
  return self->_visualStyle;
}

- (BOOL)isBlurEnabled
{
  return self->_blurEnabled;
}

- (UIImageView)_glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphView, a3);
}

- (MTMaterialView)_backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (void)setBackgroundMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMaterialView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

- (void)_updateVisualStylingOfView:(id)a3
{
  id v4;
  MTVisualStylingProvider *visualStylingProvider;
  MTVisualStylingProvider *v6;
  MTVisualStylingProvider *v7;
  int64_t visualStyle;
  id v9;

  v4 = a3;
  if (v4 && self->_materialRecipe)
  {
    v9 = v4;
    -[PLGlyphControl _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
    visualStylingProvider = self->_visualStylingProvider;
    if (visualStylingProvider)
    {
      v6 = visualStylingProvider;
    }
    else
    {
      -[MTMaterialView visualStylingProviderForCategory:](self->_backgroundMaterialView, "visualStylingProviderForCategory:", 1);
      v6 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (self->_visualStyle == -1)
      visualStyle = 1;
    else
      visualStyle = self->_visualStyle;
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:andObserverBlock:](v6, "automaticallyUpdateView:withStyle:andObserverBlock:", v9, visualStyle, &__block_literal_global);

    v4 = v9;
  }

}

id __64__PLGlyphControl_SubclassUtilities___updateVisualStylingOfView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD v5[5];

  objc_msgSend(a3, "alpha");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PLGlyphControl_SubclassUtilities___updateVisualStylingOfView___block_invoke_2;
  v5[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  v5[4] = v3;
  return (id)MEMORY[0x1D17E5ED8](v5);
}

uint64_t __64__PLGlyphControl_SubclassUtilities___updateVisualStylingOfView___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setAlpha:", *(double *)(a1 + 32));
}

- (void)_removeVisualStylingOfView:(id)a3
{
  -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_visualStylingProvider, "stopAutomaticallyUpdatingView:", a3);
}

- (void)_removeAllVisualStyling
{
  -[PLGlyphControl _removeVisualStylingOfView:](self, "_removeVisualStylingOfView:", self->_glyphView);
}

- (void)_handleTouchUpInsideWithEvent:(id)a3
{
  -[PLGlyphControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000);
}

@end
