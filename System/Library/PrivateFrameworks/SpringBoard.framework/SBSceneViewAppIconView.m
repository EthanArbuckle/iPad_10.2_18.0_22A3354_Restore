@implementation SBSceneViewAppIconView

- (SBSceneViewAppIconView)initWithIcon:(id)a3
{
  id v4;
  SBSceneViewAppIconView *v5;
  SBIconImageView *v6;
  SBIconImageView *imageView;
  SBIconImageView *v8;
  void *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *label;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  uint64_t v18;
  PLPlatterView *shadowView;
  PLPlatterView *v20;
  double v21;
  PLPlatterView *v22;
  int v24;
  __int128 v25;
  int v26;
  uint64_t v27;
  _BYTE v28[20];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBSceneViewAppIconView init](self, "init");
  if (v5)
  {
    v6 = (SBIconImageView *)objc_alloc_init(MEMORY[0x1E0DAA5D8]);
    imageView = v5->_imageView;
    v5->_imageView = v6;

    v8 = v5->_imageView;
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iconImageCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconImageView setIconImageCache:](v8, "setIconImageCache:", v11);

    -[SBIconImageView setIcon:location:animated:](v5->_imageView, "setIcon:location:animated:", v4, *MEMORY[0x1E0DAA9E8], 0);
    -[SBSceneViewAppIconView addSubview:](v5, "addSubview:", v5->_imageView);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    label = v5->_label;
    v5->_label = v12;

    -[UILabel setTextAlignment:](v5->_label, "setTextAlignment:", 1);
    v14 = v5->_label;
    objc_msgSend(v4, "displayNameForLocation:", *MEMORY[0x1E0DAA9E0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v14, "setText:", v15);

    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_label, "setAdjustsFontSizeToFitWidth:", 1);
    v16 = v5->_label;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16, "setFont:", v17);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_label, "setAdjustsFontForContentSizeCategory:", 1);
    -[SBSceneViewAppIconView addSubview:](v5, "addSubview:", v5->_label);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3F0]), "initWithRecipe:", 1);
    shadowView = v5->_shadowView;
    v5->_shadowView = (PLPlatterView *)v18;

    v20 = v5->_shadowView;
    -[SBIconImageView iconImageInfo](v5->_imageView, "iconImageInfo");
    -[PLPlatterView _setContinuousCornerRadius:](v20, "_setContinuousCornerRadius:", v21);
    -[PLPlatterView setUsesBackgroundView:](v5->_shadowView, "setUsesBackgroundView:", 0);
    v22 = v5->_shadowView;
    *(_OWORD *)&v28[4] = *MEMORY[0x1E0C9D820];
    v24 = 1053609165;
    v25 = *(_OWORD *)v28;
    v26 = *(_DWORD *)&v28[16];
    v27 = 0x403E000000000000;
    -[PLPlatterView setShadowAttributes:](v22, "setShadowAttributes:", &v24);
    -[SBSceneViewAppIconView addSubview:](v5, "addSubview:", v5->_shadowView);
    -[SBSceneViewAppIconView sendSubviewToBack:](v5, "sendSubviewToBack:", v5->_shadowView);
    -[SBSceneViewAppIconView sizeToFit](v5, "sizeToFit");
  }

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SBSceneViewAppIconView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  -[SBSceneViewAppIconView label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", width, height);
  v13 = v12;
  v15 = v14;

  if (width >= v13 || width <= 0.0)
    v17 = v13;
  else
    v17 = width;
  if (v13 <= v8)
    v17 = v8;
  v18 = v10 + 4.0 + v15;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MidX;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double Width;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v24.receiver = self;
  v24.super_class = (Class)SBSceneViewAppIconView;
  -[SBSceneViewAppIconView layoutSubviews](&v24, sel_layoutSubviews);
  -[SBSceneViewAppIconView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBSceneViewAppIconView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  v13 = v12;
  v15 = v14;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  MidX = CGRectGetMidX(v25);
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.width = v13;
  v26.size.height = v15;
  v17 = MidX + CGRectGetWidth(v26) * -0.5;
  -[SBSceneViewAppIconView imageView](self, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v17, 0.0, v13, v15);

  -[SBSceneViewAppIconView shadowView](self, "shadowView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v17, 0.0, v13, v15);

  -[SBSceneViewAppIconView label](self, "label");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFits:", v8, v10);
  v22 = v21;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  Width = CGRectGetWidth(v27);
  v28.origin.y = 0.0;
  v28.origin.x = v17;
  v28.size.width = v13;
  v28.size.height = v15;
  objc_msgSend(v20, "setFrame:", 0.0, CGRectGetMaxY(v28) + 4.0, Width, v22);

}

- (SBIconImageView)imageView
{
  return self->_imageView;
}

- (UILabel)label
{
  return self->_label;
}

- (PLPlatterView)shadowView
{
  return self->_shadowView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
