@implementation SearchUIBackgroundColorView

- (void)setColor:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    -[SearchUIBackgroundColorView updateAppearance:withColors:](self, "updateAppearance:withColors:", 0, 0);
    v5 = 0;
  }
  if ((objc_msgSend(v5, "isEqual:", self->_color) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    -[SearchUIBackgroundColorView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }

}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  void *v21;
  char v22;
  _QWORD v23[4];
  dispatch_semaphore_t v24;
  id v25;
  SearchUIBackgroundColorView *v26;
  BOOL v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SearchUIBackgroundColorView;
  -[SearchUIBackgroundColorView tlk_updateForAppearance:](&v28, sel_tlk_updateForAppearance_, v4);
  -[SearchUIBackgroundColorView prominenceView](self, "prominenceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomColorAlpha:", 0.0);

  v6 = (double)-[SearchUIBackgroundColorView showsPlaceholderPlatterView](self, "showsPlaceholderPlatterView");
  -[SearchUIBackgroundColorView platterView](self, "platterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  -[SearchUIBackgroundColorView colorBlendView](self, "colorBlendView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

  -[SearchUIBackgroundColorView gradientView](self, "gradientView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 0.0);

  -[SearchUIBackgroundColorView color](self, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "gradientType") == 0;
  -[SearchUIBackgroundColorView gradientView](self, "gradientView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v14 = 0.0;
  else
    v14 = 0.5;
  if (v11)
    v15 = 0.5;
  else
    v15 = 0.0;
  if (v11)
    v16 = 1.0;
  else
    v16 = 0.5;
  if (v11)
    v17 = 0.5;
  else
    v17 = 1.0;
  objc_msgSend(v13, "setStartPoint:", v14, v15);
  objc_msgSend(v13, "setEndPoint:", v16, v17);
  if (v10)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setSfColor:", v10);
    objc_msgSend(v18, "setAppearance:", v4);
    v19 = dispatch_semaphore_create(0);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke;
    v23[3] = &unk_1EA1F8B38;
    v24 = v19;
    v25 = v10;
    v26 = self;
    v27 = v11;
    v20 = v19;
    +[SearchUIBackgroundColorUtilities resolvedColoringForColorRequest:completionHandler:](SearchUIBackgroundColorUtilities, "resolvedColoringForColorRequest:completionHandler:", v18, v23);
    dispatch_semaphore_signal(v20);

LABEL_20:
    goto LABEL_21;
  }
  -[SearchUIBackgroundColorView updateAppearance:withColors:](self, "updateAppearance:withColors:", 0, 0);
  -[SearchUIBackgroundColorView delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    -[SearchUIBackgroundColorView delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "backgroundColorView:didFinishColorUpdate:", self, 0);
    goto LABEL_20;
  }
LABEL_21:

}

- (SearchUIGradientView)gradientView
{
  return (SearchUIGradientView *)objc_getProperty(self, a2, 464, 1);
}

- (id)viewsToOverrideAppearance
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIBackgroundColorView gradientView](self, "gradientView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend((id)v4, "mutableCopy");

  -[SearchUIBackgroundColorView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SearchUIBackgroundColorView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewContainingContent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  return v5;
}

- (SearchUIBackgroundColorViewProtocol)delegate
{
  return (SearchUIBackgroundColorViewProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)platterView
{
  return (UIView *)objc_getProperty(self, a2, 448, 1);
}

- (BOOL)showsPlaceholderPlatterView
{
  return self->_showsPlaceholderPlatterView;
}

- (TLKProminenceView)prominenceView
{
  return (TLKProminenceView *)objc_getProperty(self, a2, 456, 1);
}

- (SFColor)color
{
  return self->_color;
}

- (void)tlks_setCornerRadius:(double)a3 withStyle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchUIBackgroundColorView;
  v6 = a4;
  -[SearchUIBackgroundColorView tlks_setCornerRadius:withStyle:](&v10, sel_tlks_setCornerRadius_withStyle_, v6, a3);
  -[SearchUIBackgroundColorView platterView](self, "platterView", v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tlks_setCornerRadius:withStyle:", v6, a3);

  -[SearchUIBackgroundColorView gradientView](self, "gradientView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tlks_setCornerRadius:withStyle:", v6, a3);

  -[SearchUIBackgroundColorView colorBlendView](self, "colorBlendView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tlks_setCornerRadius:withStyle:", v6, a3);

}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[SearchUIBackgroundColorView tlks_setCornerRadius:withStyle:](self, "tlks_setCornerRadius:withStyle:", *MEMORY[0x1E0CD2A68], a3);
}

- (void)setShowsPlaceholderPlatterView:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (self->_showsPlaceholderPlatterView != a3)
  {
    self->_showsPlaceholderPlatterView = a3;
    if (a3
      || (v3 = (void *)0x1E0DBD000, (objc_msgSend(MEMORY[0x1E0DBDA48], "isSiri") & 1) != 0)
      || (objc_msgSend(MEMORY[0x1E0DBDA48], "isIpad") & 1) == 0
      && !objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v3;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
    }
    -[SearchUIBackgroundColorView colorBlendView](self, "colorBlendView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setColors:", v7);

    if ((v8 & 1) != 0)
    {

      -[SearchUIBackgroundColorView gradientViewMaskView](self, "gradientViewMaskView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

      v10 = 0;
    }
    -[SearchUIBackgroundColorView colorBlendView](self, "colorBlendView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLocations:", v10);

    if (v8)
    {

      -[SearchUIBackgroundColorView gradientViewMaskView](self, "gradientViewMaskView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    -[SearchUIBackgroundColorView gradientView](self, "gradientView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMaskView:", v13);

    if (v8)
  }
}

- (SearchUIGradientView)colorBlendView
{
  return (SearchUIGradientView *)objc_getProperty(self, a2, 480, 1);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SearchUIBackgroundColorView)initWithFrame:(CGRect)a3
{
  SearchUIBackgroundColorView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)SearchUIBackgroundColorView;
  v3 = -[SearchUIBackgroundColorView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DBD9D0], "viewWithProminence:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIBackgroundColorView setProminenceView:](v3, "setProminenceView:", v4);
    -[SearchUIBackgroundColorView setPlatterView:](v3, "setPlatterView:", v4);
    -[SearchUIBackgroundColorView addSubview:](v3, "addSubview:", v4);
    +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v4);
    v5 = (void *)objc_opt_new();
    v6 = *MEMORY[0x1E0CD2BB0];
    objc_msgSend(v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompositingFilter:", v6);

    -[SearchUIBackgroundColorView setColorBlendView:](v3, "setColorBlendView:", v5);
    -[SearchUIBackgroundColorView colorBlendView](v3, "colorBlendView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIBackgroundColorView addSubview:](v3, "addSubview:", v8);

    -[SearchUIBackgroundColorView colorBlendView](v3, "colorBlendView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v9);

    v10 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColors:", v13);

    objc_msgSend(v10, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLocations:", &unk_1EA228D50);

    -[SearchUIBackgroundColorView setGradientViewMaskView:](v3, "setGradientViewMaskView:", v10);
    v15 = (void *)objc_opt_new();
    -[SearchUIBackgroundColorView setGradientView:](v3, "setGradientView:", v15);

    -[SearchUIBackgroundColorView gradientView](v3, "gradientView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIBackgroundColorView addSubview:](v3, "addSubview:", v16);

    -[SearchUIBackgroundColorView gradientView](v3, "gradientView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v17);

    -[SearchUIBackgroundColorView layer](v3, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowsGroupOpacity:", 0);

    -[SearchUIBackgroundColorView layer](v3, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsGroupBlending:", 0);

    -[SearchUIBackgroundColorView setShowsPlaceholderPlatterView:](v3, "setShowsPlaceholderPlatterView:", 1);
  }
  return v3;
}

- (void)setProminenceView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (void)setPlatterView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (void)setGradientViewMaskView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (void)setGradientView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (void)setColorBlendView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)SearchUIBackgroundColorView;
  -[SearchUIBackgroundColorView layoutSubviews](&v20, sel_layoutSubviews);
  -[SearchUIBackgroundColorView gradientView](self, "gradientView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SearchUIBackgroundColorView gradientViewMaskView](self, "gradientViewMaskView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[SearchUIBackgroundColorView backgroundImageView](self, "backgroundImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "intrinsicContentSize");
  v15 = v14;
  v17 = v16;

  v18 = 0.0;
  if (objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR"))
  {
    -[SearchUIBackgroundColorView bounds](self, "bounds");
    v18 = CGRectGetWidth(v21) - v15;
  }
  -[SearchUIBackgroundColorView backgroundImageView](self, "backgroundImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v18, 0.0, v15, v17);

}

- (SearchUIGradientView)gradientViewMaskView
{
  return (SearchUIGradientView *)objc_getProperty(self, a2, 472, 1);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIBackgroundColorView;
  -[SearchUIBackgroundColorView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUIBackgroundColorView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIBackgroundColorView;
  -[SearchUIBackgroundColorView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUIBackgroundColorView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUIBackgroundColorView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUIBackgroundColorView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)updateAppearance:(id)a3 withColors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SearchUIBackgroundColorView viewsToOverrideAppearance](self, "viewsToOverrideAppearance", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        if (objc_msgSend(v7, "count"))
          +[SearchUIBackgroundColorUtilities overrideAppearance:onView:](SearchUIBackgroundColorUtilities, "overrideAppearance:onView:", v6, v13);
        else
          objc_msgSend(MEMORY[0x1E0DBD910], "disableAppearanceOverrideForView:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  -[SearchUIBackgroundColorView delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[SearchUIBackgroundColorView delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "backgroundColorView:updatedAppearance:", self, v6);

  }
}

- (void)updateWithSFCard:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "backgroundImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIBackgroundColorView setBackgroundImage:](self, "setBackgroundImage:", v5);

  objc_msgSend(v4, "backgroundColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUIBackgroundColorView setColor:](self, "setColor:", v6);
}

- (void)setBackgroundImage:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SFImage *v12;

  v12 = (SFImage *)a3;
  if (self->_backgroundImage != v12)
  {
    objc_storeStrong((id *)&self->_backgroundImage, a3);
    -[SearchUIBackgroundColorView backgroundImageView](self, "backgroundImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(v6, "setShadowDisabled:", 1);
      -[SearchUIBackgroundColorView setBackgroundImageView:](self, "setBackgroundImageView:", v6);
      -[SearchUIBackgroundColorView gradientView](self, "gradientView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v6);

    }
    -[SearchUIBackgroundColorView backgroundImageView](self, "backgroundImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateWithImage:", v12);

    -[SearchUIBackgroundColorView backgroundImageView](self, "backgroundImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v12 == 0);

    -[SearchUIBackgroundColorView gradientView](self, "gradientView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMasksToBounds:", v12 != 0);

    if (v12)
      -[SearchUIBackgroundColorView setNeedsLayout](self, "setNeedsLayout");
  }

}

void __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  char v12;
  BOOL v13;

  v3 = a2;
  v4 = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0) == 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke_2;
  v8[3] = &unk_1EA1F8B10;
  v9 = v3;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v12 = *(_BYTE *)(a1 + 56);
  v13 = v4;
  v7 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v8);

}

void __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  char v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tintedUIColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqual:", v4))
  {

    goto LABEL_17;
  }
  v5 = objc_msgSend(v2, "count");

  if (!v5)
  {
LABEL_17:
    if (!objc_msgSend(v2, "count"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "applicationBundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke_4;
          v24[3] = &unk_1EA1F62F0;
          v24[4] = *(_QWORD *)(a1 + 48);
          +[SearchUIUtilities performAnimatableChanges:](SearchUIUtilities, "performAnimatableChanges:", v24);
        }
      }
    }
    goto LABEL_25;
  }
  if (*(_BYTE *)(a1 + 56) && (objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR") & 1) == 0)
  {
    objc_msgSend(v2, "reverseObjectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v7;
  }
  objc_msgSend(*(id *)(a1 + 48), "gradientView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColors:", v2);

  v9 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "bestForegroundAppearanceForBackgroundColors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateAppearance:withColors:", v10, v2);

  if (objc_msgSend(*(id *)(a1 + 32), "tintStyle") == 3)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "originalUIColors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v27 = 0.0;
          objc_msgSend(v16, "getHue:saturation:brightness:alpha:", 0, &v27, 0, 0);
          if (v27 > 0.1)
          {
            v17 = 1;
            goto LABEL_23;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16, v27);
        if (v13)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_23:

  }
  else
  {
    v17 = 1;
  }
  v19 = *(void **)(a1 + 40);
  +[SearchUIBackgroundColorUtilities disambiguationInnerPlatterColor](SearchUIBackgroundColorUtilities, "disambiguationInnerPlatterColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_msgSend(v19, "isEqual:", v20);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke_3;
  v25[3] = &unk_1EA1F6318;
  v25[4] = *(_QWORD *)(a1 + 48);
  v26 = v17 & (v19 ^ 1);
  +[SearchUIUtilities performAnimatableChanges:animated:](SearchUIUtilities, "performAnimatableChanges:animated:", v25, *(unsigned __int8 *)(a1 + 57));
LABEL_25:
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "backgroundColorView:didFinishColorUpdate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

void __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke_3(uint64_t a1, double a2)
{
  double v3;
  void *v4;
  void *v5;
  id v6;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v3 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(a1 + 32), "colorBlendView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  objc_msgSend(*(id *)(a1 + 32), "gradientView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

}

void __55__SearchUIBackgroundColorView_tlk_updateForAppearance___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "prominenceView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCustomColorAlpha:", 0.13);

}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[SearchUIBackgroundColorView isHidden](self, "isHidden") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SearchUIBackgroundColorView;
    -[SearchUIBackgroundColorView setHidden:](&v5, sel_setHidden_, v3);
    if (v3)
      -[SearchUIBackgroundColorView updateAppearance:withColors:](self, "updateAppearance:withColors:", 0, 0);
    else
      -[SearchUIBackgroundColorView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
}

- (void)setMaskedCorners:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = a3;
  self->_maskedCorners = a3;
  v5 = +[SearchUIUtilities flippedCornerMaskFromCornerMask:](SearchUIUtilities, "flippedCornerMaskFromCornerMask:");
  -[SearchUIBackgroundColorView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaskedCorners:", v3);

  -[SearchUIBackgroundColorView platterView](self, "platterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isGeometryFlipped");
  -[SearchUIBackgroundColorView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != objc_msgSend(v10, "isGeometryFlipped"))
    v11 = v5;
  else
    v11 = v3;
  -[SearchUIBackgroundColorView platterView](self, "platterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMaskedCorners:", v11);

  -[SearchUIBackgroundColorView gradientView](self, "gradientView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isGeometryFlipped");
  -[SearchUIBackgroundColorView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 != objc_msgSend(v17, "isGeometryFlipped"))
    v18 = v5;
  else
    v18 = v3;
  -[SearchUIBackgroundColorView gradientView](self, "gradientView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMaskedCorners:", v18);

  -[SearchUIBackgroundColorView colorBlendView](self, "colorBlendView");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isGeometryFlipped");
  -[SearchUIBackgroundColorView layer](self, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 != objc_msgSend(v23, "isGeometryFlipped"))
    v3 = v5;
  -[SearchUIBackgroundColorView colorBlendView](self, "colorBlendView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setMaskedCorners:", v3);

}

- (SFImage)backgroundImage
{
  return self->_backgroundImage;
}

- (SearchUIImageView)backgroundImageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 488, 1);
}

- (void)setBackgroundImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_colorBlendView, 0);
  objc_storeStrong((id *)&self->_gradientViewMaskView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_prominenceView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
