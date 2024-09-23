@implementation _UIBarBackground

- (void)cleanupBackgroundViews
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[UIView bg1Effects](self->_customBackgroundView, "bg1Effects");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    -[UIView removeFromSuperview](self->_effectView1, "removeFromSuperview");
    *(_BYTE *)&self->_backgroundFlags &= ~2u;
  }
  -[UIView bg1Image](self->_customBackgroundView, "bg1Image");
  v3 = objc_claimAutoreleasedReturnValue();
  -[UIView bg1Color](self->_customBackgroundView, "bg1Color");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!(v3 | v4))
  {
    -[UIView removeFromSuperview](self->_topInsetView, "removeFromSuperview");
    *(_BYTE *)&self->_backgroundFlags &= ~1u;
    -[UIView removeFromSuperview](self->_colorAndImageView1, "removeFromSuperview");
    *(_BYTE *)&self->_backgroundFlags &= ~4u;
  }
  if ((-[UIView bg1HasShadow](self->_customBackgroundView, "bg1HasShadow") & 1) == 0)
  {
    -[UIView removeFromSuperview](self->_shadowView1, "removeFromSuperview");
    *(_BYTE *)&self->_backgroundFlags &= ~8u;
  }
  if (-[UIView bg2Enabled](self->_customBackgroundView, "bg2Enabled"))
  {
    -[UIView bg2Effects](self->_customBackgroundView, "bg2Effects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "count"))
    {
      -[UIView removeFromSuperview](self->_effectView2, "removeFromSuperview");
      *(_BYTE *)&self->_backgroundFlags &= ~0x10u;
    }
    -[UIView bg2Image](self->_customBackgroundView, "bg2Image");
    v6 = objc_claimAutoreleasedReturnValue();
    -[UIView bg2Color](self->_customBackgroundView, "bg2Color");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!(v6 | v7))
    {
      -[UIView removeFromSuperview](self->_colorAndImageView2, "removeFromSuperview");
      *(_BYTE *)&self->_backgroundFlags &= ~0x20u;
    }
    if ((-[UIView bg2HasShadow](self->_customBackgroundView, "bg2HasShadow") & 1) == 0)
    {
      -[UIView removeFromSuperview](self->_shadowView2, "removeFromSuperview");
      *(_BYTE *)&self->_backgroundFlags &= ~0x40u;
    }

  }
  else
  {
    -[UIView removeFromSuperview](self->_effectView2, "removeFromSuperview");
    *(_BYTE *)&self->_backgroundFlags &= ~0x10u;
    -[UIView removeFromSuperview](self->_colorAndImageView2, "removeFromSuperview");
    *(_BYTE *)&self->_backgroundFlags &= ~0x20u;
    -[UIView removeFromSuperview](self->_shadowView2, "removeFromSuperview");
    *(_BYTE *)&self->_backgroundFlags &= ~0x40u;
  }

}

- (void)prepareBackgroundViews
{
  UIVisualEffectView *v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *effectView1;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  UIView *v10;
  UIView *v11;
  UIView *topInsetView;
  void *v13;
  UIImageView *v14;
  UIImageView *v15;
  UIImageView *colorAndImageView1;
  _UIBarBackgroundShadowView *v17;
  _UIBarBackgroundShadowView *v18;
  _UIBarBackgroundShadowView *shadowView1;
  void *v20;
  UIVisualEffectView *v21;
  UIVisualEffectView *v22;
  UIVisualEffectView *effectView2;
  uint64_t v24;
  uint64_t v25;
  UIImageView *v26;
  UIImageView *v27;
  UIImageView *colorAndImageView2;
  _UIBarBackgroundShadowView *v29;
  _UIBarBackgroundShadowView *v30;
  _UIBarBackgroundShadowView *shadowView2;
  id v32;

  -[UIView bg1Effects](self->_customBackgroundView, "bg1Effects");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "count"))
  {
    if (!self->_effectView1)
    {
      v3 = [UIVisualEffectView alloc];
      -[_UIBarBackground frameForYOrigin:height:](self, "frameForYOrigin:height:", 0.0, self->_bg1LastLayoutHeight);
      v4 = -[UIVisualEffectView initWithFrame:](v3, "initWithFrame:");
      effectView1 = self->_effectView1;
      self->_effectView1 = v4;

      -[UIVisualEffectView _setGroupName:](self->_effectView1, "_setGroupName:", self->_layout);
    }
    *(_BYTE *)&self->_backgroundFlags |= 2u;
  }
  -[UIView bg1Image](self->_customBackgroundView, "bg1Image");
  v6 = objc_claimAutoreleasedReturnValue();
  -[UIView bg1Color](self->_customBackgroundView, "bg1Color");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6 | v7)
  {
    if (LOBYTE(self->_groupName))
    {
      -[UIView bgInset](self->_customBackgroundView, "bgInset");
      v9 = v8;
      if (v6 && v8 > 0.0)
      {
        if (!self->_topInsetView)
        {
          v10 = [UIView alloc];
          -[_UIBarBackground frameForYOrigin:height:](self, "frameForYOrigin:height:", 0.0, v9);
          v11 = -[UIView initWithFrame:](v10, "initWithFrame:");
          topInsetView = self->_topInsetView;
          self->_topInsetView = v11;

          +[UIColor blackColor](UIColor, "blackColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](self->_topInsetView, "setBackgroundColor:", v13);

        }
        *(_BYTE *)&self->_backgroundFlags |= 1u;
      }
    }
    else
    {
      v9 = 0.0;
    }
    if (!self->_colorAndImageView1)
    {
      v14 = [UIImageView alloc];
      -[_UIBarBackground frameForYOrigin:height:](self, "frameForYOrigin:height:", v9, self->_bg1LastLayoutHeight - v9);
      v15 = -[UIImageView initWithFrame:](v14, "initWithFrame:");
      colorAndImageView1 = self->_colorAndImageView1;
      self->_colorAndImageView1 = v15;

    }
    *(_BYTE *)&self->_backgroundFlags |= 4u;
  }
  if (-[UIView bg1HasShadow](self->_customBackgroundView, "bg1HasShadow"))
  {
    if (!self->_shadowView1)
    {
      v17 = [_UIBarBackgroundShadowView alloc];
      -[_UIBarBackground frameForYOrigin:height:](self, "frameForYOrigin:height:", self->_bg1LastLayoutHeight, 0.0);
      v18 = -[UIVisualEffectView initWithFrame:](v17, "initWithFrame:");
      shadowView1 = self->_shadowView1;
      self->_shadowView1 = v18;

    }
    *(_BYTE *)&self->_backgroundFlags |= 8u;
  }
  if (-[UIView bg2Enabled](self->_customBackgroundView, "bg2Enabled"))
  {
    -[UIView bg2Effects](self->_customBackgroundView, "bg2Effects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      if (!self->_effectView2)
      {
        v21 = [UIVisualEffectView alloc];
        -[_UIBarBackground frameForYOrigin:height:](self, "frameForYOrigin:height:", self->_bg1LastLayoutHeight, self->_bg2LastLayoutHeight - self->_bg1LastLayoutHeight);
        v22 = -[UIVisualEffectView initWithFrame:](v21, "initWithFrame:");
        effectView2 = self->_effectView2;
        self->_effectView2 = v22;

        -[UIVisualEffectView _setGroupName:](self->_effectView2, "_setGroupName:", self->_layout);
      }
      *(_BYTE *)&self->_backgroundFlags |= 0x10u;
    }
    -[UIView bg2Image](self->_customBackgroundView, "bg2Image");
    v24 = objc_claimAutoreleasedReturnValue();
    -[UIView bg2Color](self->_customBackgroundView, "bg2Color");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v24 | v25)
    {
      if (!self->_colorAndImageView2)
      {
        v26 = [UIImageView alloc];
        -[_UIBarBackground frameForYOrigin:height:](self, "frameForYOrigin:height:", self->_bg1LastLayoutHeight, self->_bg2LastLayoutHeight - self->_bg1LastLayoutHeight);
        v27 = -[UIImageView initWithFrame:](v26, "initWithFrame:");
        colorAndImageView2 = self->_colorAndImageView2;
        self->_colorAndImageView2 = v27;

      }
      *(_BYTE *)&self->_backgroundFlags |= 0x20u;
    }
    if (-[UIView bg2HasShadow](self->_customBackgroundView, "bg2HasShadow"))
    {
      if (!self->_shadowView2)
      {
        v29 = [_UIBarBackgroundShadowView alloc];
        -[_UIBarBackground frameForYOrigin:height:](self, "frameForYOrigin:height:", self->_bg2LastLayoutHeight, 0.0);
        v30 = -[UIVisualEffectView initWithFrame:](v29, "initWithFrame:");
        shadowView2 = self->_shadowView2;
        self->_shadowView2 = v30;

      }
      *(_BYTE *)&self->_backgroundFlags |= 0x40u;
    }

  }
  -[_UIBarBackground _orderSubviews](self, "_orderSubviews");

}

- (void)updateBackground
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  _UIBarBackgroundShadowView *shadowView1;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  _UIBarBackgroundShadowView *v32;
  _UIBarBackgroundShadowView *shadowView2;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  -[UIView bg1Alpha](self->_customBackgroundView, "bg1Alpha");
  v4 = v3;
  -[UIView bg1Effects](self->_customBackgroundView, "bg1Effects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundEffects:](self->_effectView1, "setBackgroundEffects:", v5);

  -[UIView setAlpha:](self->_effectView1, "setAlpha:", v4);
  -[UIView bg1Color](self->_customBackgroundView, "bg1Color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self->_colorAndImageView1, "setBackgroundColor:", v6);

  -[UIView bg1Image](self->_customBackgroundView, "bg1Image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_colorAndImageView1, "setImage:", v7);

  -[UIImageView setContentMode:](self->_colorAndImageView1, "setContentMode:", -[UIView bg1ImageMode](self->_customBackgroundView, "bg1ImageMode"));
  -[UIView bg1ImageAlpha](self->_customBackgroundView, "bg1ImageAlpha");
  -[UIView setAlpha:](self->_colorAndImageView1, "setAlpha:", v4 * v8);
  shadowView1 = self->_shadowView1;
  -[UIView bg1ShadowEffect](self->_customBackgroundView, "bg1ShadowEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bg1ShadowImage](self->_customBackgroundView, "bg1ShadowImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bg1ShadowColor](self->_customBackgroundView, "bg1ShadowColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bg1ShadowTint](self->_customBackgroundView, "bg1ShadowTint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bg1ShadowAlpha](self->_customBackgroundView, "bg1ShadowAlpha");
  -[_UIBarBackground _setupShadowView:effect:image:shadowColor:shadowTint:alpha:](self, "_setupShadowView:effect:image:shadowColor:shadowTint:alpha:", shadowView1, v10, v11, v12, v13);

  if (-[UIView bg2Enabled](self->_customBackgroundView, "bg2Enabled"))
  {
    -[UIView bg2Alpha](self->_customBackgroundView, "bg2Alpha");
    v15 = v14;
    -[UIView bg2Effects](self->_customBackgroundView, "bg2Effects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](self->_effectView2, "setBackgroundEffects:", v16);

    -[UIView setAlpha:](self->_effectView2, "setAlpha:", v15);
    -[UIView bg2Color](self->_customBackgroundView, "bg2Color");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](self->_colorAndImageView2, "setBackgroundColor:", v17);

    -[UIView bg2Image](self->_customBackgroundView, "bg2Image");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_colorAndImageView2, "setImage:", v18);

    -[UIImageView setContentMode:](self->_colorAndImageView2, "setContentMode:", -[UIView bg2ImageMode](self->_customBackgroundView, "bg2ImageMode"));
    -[UIView setAlpha:](self->_colorAndImageView2, "setAlpha:", v15);
    -[UIView bg1Color](self->_customBackgroundView, "bg1Color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self->_colorAndImageView1, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resolvedColorWithTraitCollection:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "alphaComponent");
    v23 = v22;

    -[UIView bg2Color](self->_customBackgroundView, "bg2Color");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self->_colorAndImageView2, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "resolvedColorWithTraitCollection:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "alphaComponent");
    v28 = v27;

    v30 = v15 * v28;
    if (v30 == 1.0)
    {
      v29 = v4 * v23;
      if (v4 * v23 == 1.0)
        v31 = 1;
      else
        v31 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled", v29) ^ 1;
    }
    else
    {
      v31 = 0;
    }
    -[UIView setHidden:](self->_effectView1, "setHidden:", v31, v29);
    -[UIView setHidden:](self->_effectView2, "setHidden:", v30 == 1.0);
    shadowView2 = self->_shadowView2;
    -[UIView bg2ShadowEffect](self->_customBackgroundView, "bg2ShadowEffect");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView bg2ShadowImage](self->_customBackgroundView, "bg2ShadowImage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bg2ShadowColor](self->_customBackgroundView, "bg2ShadowColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bg2ShadowTint](self->_customBackgroundView, "bg2ShadowTint");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bg2ShadowAlpha](self->_customBackgroundView, "bg2ShadowAlpha");
    -[_UIBarBackground _setupShadowView:effect:image:shadowColor:shadowTint:alpha:](self, "_setupShadowView:effect:image:shadowColor:shadowTint:alpha:", shadowView2, v37, v34, v35, v36);

  }
  else
  {
    -[UIView setHidden:](self->_effectView1, "setHidden:", 0);
    -[UIView setHidden:](self->_effectView2, "setHidden:", 0);
    -[UIVisualEffectView setBackgroundEffects:](self->_effectView2, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);
    -[UIImageView setBackgroundColor:](self->_colorAndImageView2, "setBackgroundColor:", 0);
    -[UIImageView setImage:](self->_colorAndImageView2, "setImage:", 0);
    v32 = self->_shadowView2;
    -[UIVisualEffectView contentView](v32, "contentView");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "alpha");
    -[_UIBarBackground _setupShadowView:effect:image:shadowColor:shadowTint:alpha:](self, "_setupShadowView:effect:image:shadowColor:shadowTint:alpha:", v32, 0, 0, 0, 0);
  }

}

- (void)_setupShadowView:(id)a3 effect:(id)a4 image:(id)a5 shadowColor:(id)a6 shadowTint:(id)a7 alpha:(double)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a5;
  objc_msgSend(v13, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setImage:", v17);

  objc_msgSend(v18, "setAlpha:", a8);
  if (v14)
  {
    v20[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentEffects:", v19);

    if (v17)
    {
      objc_msgSend(v18, "setApplyTintColorToBackgroundColor:", 0);
      objc_msgSend(v18, "setBackgroundColor:", 0);
    }
    else
    {
      objc_msgSend(v18, "setApplyTintColorToBackgroundColor:", 1);
    }
  }
  else
  {
    objc_msgSend(v13, "setContentEffects:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v18, "setApplyTintColorToBackgroundColor:", 0);
    objc_msgSend(v18, "setBackgroundColor:", v15);
    objc_msgSend(v18, "setTintColor:", v16);
  }

}

- (void)_orderSubviews
{
  char v3;
  _UIBarBackgroundShadowView *shadowView1;
  char backgroundFlags;
  UIVisualEffectView *effectView1;
  UIImageView *colorAndImageView1;
  UIView *topInsetView;
  char v9;
  _UIBarBackgroundShadowView *shadowView2;
  UIVisualEffectView *effectView2;
  UIImageView *colorAndImageView2;
  _UIBarBackgroundShadowView *v13;
  char v14;
  _UIBarBackgroundShadowView *v15;
  _QWORD v16[10];

  v16[9] = *MEMORY[0x1E0C80C00];
  v3 = dyld_program_sdk_at_least();
  shadowView1 = 0;
  backgroundFlags = (char)self->_backgroundFlags;
  if ((backgroundFlags & 8) != 0 && (v3 & 1) == 0)
    shadowView1 = self->_shadowView1;
  v16[0] = shadowView1;
  if ((backgroundFlags & 2) != 0)
    effectView1 = self->_effectView1;
  else
    effectView1 = 0;
  v16[1] = effectView1;
  if ((backgroundFlags & 4) != 0)
    colorAndImageView1 = self->_colorAndImageView1;
  else
    colorAndImageView1 = 0;
  v16[2] = colorAndImageView1;
  if ((backgroundFlags & 1) != 0)
    topInsetView = self->_topInsetView;
  else
    topInsetView = 0;
  v16[3] = topInsetView;
  if ((backgroundFlags & 0x40) != 0)
    v9 = v3;
  else
    v9 = 1;
  if ((v9 & 1) != 0)
    shadowView2 = 0;
  else
    shadowView2 = self->_shadowView2;
  v16[4] = shadowView2;
  if ((backgroundFlags & 0x10) != 0)
    effectView2 = self->_effectView2;
  else
    effectView2 = 0;
  v16[5] = effectView2;
  if ((backgroundFlags & 0x20) != 0)
    colorAndImageView2 = self->_colorAndImageView2;
  else
    colorAndImageView2 = 0;
  v13 = 0;
  v16[6] = colorAndImageView2;
  if ((backgroundFlags & 8) != 0 && ((v3 ^ 1) & 1) == 0)
    v13 = self->_shadowView1;
  v16[7] = v13;
  if ((backgroundFlags & 0x40) != 0)
    v14 = v3 ^ 1;
  else
    v14 = 1;
  if ((v14 & 1) != 0)
    v15 = 0;
  else
    v15 = self->_shadowView2;
  v16[8] = v15;
  -[UIView _ensureViewsAreInstalledInRelativeOrder:viewCount:insertionStartIndex:](self, "_ensureViewsAreInstalledInRelativeOrder:viewCount:insertionStartIndex:", v16, 9, 0);
}

- (CGRect)frameForYOrigin:(double)a3 height:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v10 = v9 - a4 - a3;
  if (LOBYTE(self->_groupName))
    v10 = a3;
  v11 = a4;
  result.size.height = v11;
  result.size.width = v8;
  result.origin.y = v10;
  result.origin.x = v7;
  return result;
}

- (void)setTopAligned:(BOOL)a3
{
  LOBYTE(self->_groupName) = a3;
}

- (_UIBarBackground)initWithFrame:(CGRect)a3
{
  _UIBarBackground *v3;
  _UIBarBackground *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBarBackground;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UIBarBackground _setupBackgroundValues](v3, "_setupBackgroundValues");
  return v4;
}

- (void)_setupBackgroundValues
{
  double v3;

  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[UIView bounds](self, "bounds");
  self->_bg2LastLayoutHeight = v3;
  self->_bg1LastLayoutHeight = v3;
}

- (void)transitionBackgroundViewsAnimated:(BOOL)a3
{
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];

  v4 = MEMORY[0x1E0C809B0];
  if (a3
    && (v7[0] = MEMORY[0x1E0C809B0],
        v7[1] = 3221225472,
        v7[2] = __54___UIBarBackground_transitionBackgroundViewsAnimated___block_invoke,
        v7[3] = &unk_1E16B3FD8,
        v7[4] = self,
        +[UIView _addCompletion:](UIView, "_addCompletion:", v7)))
  {
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __54___UIBarBackground_transitionBackgroundViewsAnimated___block_invoke_2;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);
    -[_UIBarBackground updateBackground](self, "updateBackground");
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  }
  else
  {
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __54___UIBarBackground_transitionBackgroundViewsAnimated___block_invoke_3;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
  }
}

- (void)transitionBackgroundViews
{
  -[_UIBarBackground transitionBackgroundViewsAnimated:](self, "transitionBackgroundViewsAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
}

- (void)setGroupName:(id)a3
{
  id v4;
  _UIBarBackgroundLayout *v5;
  _UIBarBackgroundLayout *v6;
  char v7;
  _UIBarBackgroundLayout *v8;
  _UIBarBackgroundLayout *layout;
  _UIBarBackgroundLayout *v10;

  v4 = a3;
  v5 = self->_layout;
  v6 = (_UIBarBackgroundLayout *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[_UIBarBackgroundLayout isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (_UIBarBackgroundLayout *)-[_UIBarBackgroundLayout copy](v10, "copy");
    layout = self->_layout;
    self->_layout = v8;

    -[UIVisualEffectView _setGroupName:](self->_effectView1, "_setGroupName:", self->_layout);
    -[UIVisualEffectView _setGroupName:](self->_effectView2, "_setGroupName:", self->_layout);
  }
LABEL_9:

}

- (void)setLayout:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_customBackgroundView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customBackgroundView, a3);
    v5 = v6;
  }

}

- (_UIBarBackgroundLayout)layout
{
  return (_UIBarBackgroundLayout *)self->_customBackgroundView;
}

- (void)setCustomBackgroundView:(id)a3
{
  Class v5;
  _UIBarBackground *v6;
  Class isa;
  Class v8;

  v5 = (Class)a3;
  v6 = self + 1;
  isa = self[1].super.super.super.isa;
  if (isa != v5)
  {
    v8 = v5;
    -[objc_class removeFromSuperview](isa, "removeFromSuperview");
    objc_storeStrong((id *)&self[1].super.super.super.isa, a3);
    if (v6->super.super.super.isa)
    {
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v6->super.super.super.isa, 0);
      -[UIView bounds](self, "bounds");
      -[objc_class setFrame:](v6->super.super.super.isa, "setFrame:");
    }
    -[_UIBarBackground _updateBackgroundViewVisiblity](self, "_updateBackgroundViewVisiblity");
    v5 = v8;
  }

}

- (void)_updateBackgroundViewVisiblity
{
  Class isa;
  int v4;
  BOOL v5;
  _BOOL8 v6;
  uint64_t v7;

  isa = self[1].super.super.super.isa;
  v4 = -[UIView bg2Enabled](self->_customBackgroundView, "bg2Enabled");
  v5 = isa == 0;
  v6 = isa != 0;
  if (v5)
    v7 = v4 ^ 1u;
  else
    v7 = 1;
  -[UIView setHidden:](self->_effectView1, "setHidden:", v6);
  -[UIImageView setHidden:](self->_colorAndImageView1, "setHidden:", v6);
  -[UIView setHidden:](self->_shadowView1, "setHidden:", v6);
  -[UIView setHidden:](self->_effectView2, "setHidden:", v7);
  -[UIImageView setHidden:](self->_colorAndImageView2, "setHidden:", v7);
  -[UIView setHidden:](self->_shadowView2, "setHidden:", v7);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double bg1LastLayoutHeight;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double bg2LastLayoutHeight;
  void *v30;
  void *v31;
  double v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)_UIBarBackground;
  -[UIView layoutSubviews](&v33, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[objc_class setFrame:](self[1].super.super.super.isa, "setFrame:");
  if (-[UIView shouldUseExplicitGeometry](self->_customBackgroundView, "shouldUseExplicitGeometry"))
  {
    -[UIView backgroundHeight1](self->_customBackgroundView, "backgroundHeight1");
    self->_bg1LastLayoutHeight = v7;
    v8 = -[UIView bg2Enabled](self->_customBackgroundView, "bg2Enabled");
    v9 = 0.0;
    if (v8)
    {
      bg1LastLayoutHeight = self->_bg1LastLayoutHeight;
      -[UIView backgroundHeight2](self->_customBackgroundView, "backgroundHeight2", 0.0);
      v9 = bg1LastLayoutHeight + v11;
    }
  }
  else
  {
    self->_bg1LastLayoutHeight = v6;
    v9 = v6;
  }
  self->_bg2LastLayoutHeight = v9;
  -[UIView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  v14 = v13;

  if (LOBYTE(self->_groupName))
  {
    -[UIView bgInset](self->_customBackgroundView, "bgInset");
    v16 = v15;
    v17 = 0.0;
    -[UIView setFrame:](self->_topInsetView, "setFrame:", 0.0, 0.0, v4, v15);
    -[UIView setFrame:](self->_effectView1, "setFrame:", 0.0, 0.0, v4, self->_bg1LastLayoutHeight);
    -[UIImageView setFrame:](self->_colorAndImageView1, "setFrame:", 0.0, v16, v4, self->_bg1LastLayoutHeight - v16);
    v18 = 0.0;
    if (-[UIView bg1HasShadow](self->_customBackgroundView, "bg1HasShadow"))
    {
      -[UIView bg1ShadowImage](self->_customBackgroundView, "bg1ShadowImage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "size");
        v18 = v21;
      }
      else if (v14 <= 1.0)
      {
        v18 = 1.0;
      }
      else
      {
        v18 = 1.0 / v14;
      }

    }
    -[UIView setFrame:](self->_shadowView1, "setFrame:", 0.0, self->_bg1LastLayoutHeight, v4, v18);
    -[UIView setFrame:](self->_effectView2, "setFrame:", 0.0, 0.0, v4, self->_bg2LastLayoutHeight);
    -[UIImageView setFrame:](self->_colorAndImageView2, "setFrame:", 0.0, 0.0, v4, self->_bg2LastLayoutHeight);
    if (-[UIView bg2HasShadow](self->_customBackgroundView, "bg2HasShadow"))
    {
      -[UIView bg2ShadowImage](self->_customBackgroundView, "bg2ShadowImage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "size");
        v17 = v28;
      }
      else if (v14 <= 1.0)
      {
        v17 = 1.0;
      }
      else
      {
        v17 = 1.0 / v14;
      }

    }
    bg2LastLayoutHeight = self->_bg2LastLayoutHeight;
  }
  else
  {
    v17 = 0.0;
    -[UIView setFrame:](self->_topInsetView, "setFrame:", 0.0, v6, v4, 0.0);
    -[UIView setFrame:](self->_effectView1, "setFrame:", 0.0, v6 - self->_bg1LastLayoutHeight, v4);
    -[UIImageView setFrame:](self->_colorAndImageView1, "setFrame:", 0.0, v6 - self->_bg1LastLayoutHeight, v4);
    v22 = 0.0;
    if (-[UIView bg1HasShadow](self->_customBackgroundView, "bg1HasShadow"))
    {
      -[UIView bg1ShadowImage](self->_customBackgroundView, "bg1ShadowImage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        objc_msgSend(v23, "size");
        v22 = v25;
      }
      else if (v14 > 1.0)
      {
        v22 = 1.0 / v14;
      }
      else
      {
        v22 = 1.0;
      }

    }
    -[UIView setFrame:](self->_shadowView1, "setFrame:", 0.0, v6 - self->_bg1LastLayoutHeight - v22, v4, v22);
    -[UIView setFrame:](self->_effectView2, "setFrame:", 0.0, v6 - self->_bg2LastLayoutHeight, v4);
    -[UIImageView setFrame:](self->_colorAndImageView2, "setFrame:", 0.0, v6 - self->_bg2LastLayoutHeight, v4);
    if (-[UIView bg2HasShadow](self->_customBackgroundView, "bg2HasShadow"))
    {
      -[UIView bg2ShadowImage](self->_customBackgroundView, "bg2ShadowImage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        objc_msgSend(v30, "size");
        v17 = v32;
      }
      else if (v14 > 1.0)
      {
        v17 = 1.0 / v14;
      }
      else
      {
        v17 = 1.0;
      }

    }
    bg2LastLayoutHeight = v6 - self->_bg2LastLayoutHeight - v17;
  }
  -[UIView setFrame:](self->_shadowView2, "setFrame:", 0.0, bg2LastLayoutHeight, v4, v17);
}

- (UIView)customBackgroundView
{
  return (UIView *)self[1].super.super.super.isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.super.super.isa, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_topInsetView, 0);
  objc_storeStrong((id *)&self->_shadowView2, 0);
  objc_storeStrong((id *)&self->_colorAndImageView2, 0);
  objc_storeStrong((id *)&self->_effectView2, 0);
  objc_storeStrong((id *)&self->_shadowView1, 0);
  objc_storeStrong((id *)&self->_colorAndImageView1, 0);
  objc_storeStrong((id *)&self->_effectView1, 0);
}

- (_UIBarBackground)initWithCoder:(id)a3
{
  _UIBarBackground *v3;
  _UIBarBackground *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBarBackground;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_UIBarBackground _setupBackgroundValues](v3, "_setupBackgroundValues");
  return v4;
}

- (id)_encodableSubviews
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)transition:(unint64_t)a3 toLayout:(id)a4
{
  id v6;
  void *v7;
  UIView *v8;
  id v9;
  UIView *v10;
  _QWORD v11[5];
  id v12;
  UIView *v13;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBarBackground.m"), 264, CFSTR("Not yet implemented"));

  v8 = self->_customBackgroundView;
  v9 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40___UIBarBackground_transition_toLayout___block_invoke;
  v11[3] = &unk_1E16B2B40;
  v11[4] = self;
  v12 = v9;
  v10 = v8;
  v13 = v10;
  if (!+[UIView _addCompletion:](UIView, "_addCompletion:", v11))
    -[_UIBarBackground setLayout:](self, "setLayout:", v9);

}

- (id)_backgroundEffectView
{
  UIKVCAccessProhibited((uint64_t)CFSTR("_backgroundEffectView"), (uint64_t)CFSTR("_UIBarBackground"));
  return 0;
}

- (void)set_backgroundEffectView:(id)a3
{
  UIKVCAccessProhibited((uint64_t)CFSTR("_backgroundEffectView"), (uint64_t)CFSTR("_UIBarBackground"));
}

- (id)_shadowView
{
  UIKVCAccessProhibited((uint64_t)CFSTR("_shadowView"), (uint64_t)CFSTR("_UIBarBackground"));
  return 0;
}

- (void)set_shadowView:(id)a3
{
  UIKVCAccessProhibited((uint64_t)CFSTR("_shadowView"), (uint64_t)CFSTR("_UIBarBackground"));
}

- (NSString)groupName
{
  return (NSString *)&self->_layout->super.isa;
}

- (BOOL)topAligned
{
  return (BOOL)self->_groupName;
}

@end
