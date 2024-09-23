@implementation UIAccessibilityHUDView

- (UIAccessibilityHUDView)initWithHUDItem:(id)a3
{
  id v5;
  UIAccessibilityHUDView *v6;
  UIAccessibilityHUDView *v7;
  uint64_t v8;
  UIView *transformContainer;
  uint64_t v10;
  UIBlurEffect *blurEffect;
  UIVisualEffectView *v12;
  UIVisualEffectView *effectView;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  UIImageView *imageView;
  UIVisualEffectView *v19;
  void *v20;
  uint64_t v21;
  UIVisualEffectView *itemEffectView;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  UIView *customView;
  void *v30;
  uint64_t v31;
  UILabel *titleLabel;
  void *v33;
  UIView *v34;
  _OWORD v36[3];
  objc_super v37;

  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)UIAccessibilityHUDView;
  v6 = -[UIView initWithFrame:](&v37, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    objc_storeStrong((id *)&v7->_item, a3);
    -[UIView setOverrideUserInterfaceStyle:](v7, "setOverrideUserInterfaceStyle:", objc_msgSend(v5, "customUserInterfaceStyle"));
    v8 = objc_opt_new();
    transformContainer = v7->_transformContainer;
    v7->_transformContainer = (UIView *)v8;

    -[UIView addSubview:](v7, "addSubview:", v7->_transformContainer);
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1200);
    v10 = objc_claimAutoreleasedReturnValue();
    blurEffect = v7->_blurEffect;
    v7->_blurEffect = (UIBlurEffect *)v10;

    v12 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v7->_blurEffect);
    effectView = v7->_effectView;
    v7->_effectView = v12;

    -[UIView setClipsToBounds:](v7->_effectView, "setClipsToBounds:", 1);
    -[UIView layer](v7->_effectView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 17.0);

    v15 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](v7->_effectView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerCurve:", v15);

    -[UIView addSubview:](v7->_transformContainer, "addSubview:", v7->_effectView);
    v17 = objc_opt_new();
    imageView = v7->_imageView;
    v7->_imageView = (UIImageView *)v17;

    v19 = [UIVisualEffectView alloc];
    -[UIAccessibilityHUDView _contentEffectsForItem:](v7, "_contentEffectsForItem:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[UIVisualEffectView initWithEffect:](v19, "initWithEffect:", v20);
    itemEffectView = v7->_itemEffectView;
    v7->_itemEffectView = (UIVisualEffectView *)v21;

    -[UIVisualEffectView contentView](v7->_effectView, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v7->_itemEffectView);

    -[UIImageView setContentMode:](v7->_imageView, "setContentMode:", 1);
    objc_msgSend(v5, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v7->_imageView, "setImage:", v24);

    -[UIImageView image](v7->_imageView, "image");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[UIVisualEffectView contentView](v7->_itemEffectView, "contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addSubview:", v7->_imageView);

    }
    objc_msgSend(v5, "customView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v5, "customView");
      v28 = objc_claimAutoreleasedReturnValue();
      customView = v7->_customView;
      v7->_customView = (UIView *)v28;

      -[UIVisualEffectView contentView](v7->_itemEffectView, "contentView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addSubview:", v7->_customView);

    }
    v31 = objc_opt_new();
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v31;

    -[UILabel setNumberOfLines:](v7->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v7->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v7->_titleLabel, "setMinimumScaleFactor:", 0.001);
    -[UILabel setBaselineAdjustment:](v7->_titleLabel, "setBaselineAdjustment:", 0);
    -[UILabel setTextAlignment:](v7->_titleLabel, "setTextAlignment:", 1);
    -[UIVisualEffectView contentView](v7->_itemEffectView, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v7->_titleLabel);

    -[UIAccessibilityHUDView _updateLabelForItem](v7, "_updateLabelForItem");
    -[UIView setAlpha:](v7, "setAlpha:", 0.0);
    v34 = v7->_transformContainer;
    v36[0] = UIAccessibilityHUDSmallTransform;
    v36[1] = unk_186678160;
    v36[2] = xmmword_186678170;
    -[UIView setTransform:](v34, "setTransform:", v36);
  }

  return v7;
}

- (void)setItem:(id)a3
{
  BOOL v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  UIAccessibilityHUDItem *v9;
  UIAccessibilityHUDItem *item;
  void *v11;
  UIVisualEffectView *itemEffectView;
  void *v13;
  id v14;

  v14 = a3;
  v4 = -[UIAccessibilityHUDItem isEqual:](self->_item, "isEqual:", v14);
  v5 = v14;
  if (!v4)
  {
    v6 = objc_msgSend(v14, "flattenImage");
    if (v6 == -[UIAccessibilityHUDItem flattenImage](self->_item, "flattenImage"))
    {
      v8 = objc_msgSend(v14, "disabledAppearance");
      v7 = v8 ^ -[UIAccessibilityHUDItem disabledAppearance](self->_item, "disabledAppearance");
    }
    else
    {
      v7 = 1;
    }
    v9 = (UIAccessibilityHUDItem *)objc_msgSend(v14, "copy");
    item = self->_item;
    self->_item = v9;

    objc_msgSend(v14, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v11);

    -[UIView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", objc_msgSend(v14, "customUserInterfaceStyle"));
    -[UIAccessibilityHUDView _updateLabelForItem](self, "_updateLabelForItem");
    if (v7)
    {
      itemEffectView = self->_itemEffectView;
      -[UIAccessibilityHUDView _contentEffectsForItem:](self, "_contentEffectsForItem:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setEffect:](itemEffectView, "setEffect:", v13);

    }
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v5 = v14;
  }

}

- (id)_contentEffectsForItem:(id)a3
{
  id v4;
  UIBlurEffect *blurEffect;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "flattenImage"))
  {
    blurEffect = self->_blurEffect;
    if (objc_msgSend(v4, "disabledAppearance"))
      v6 = 5;
    else
      v6 = 4;
    +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", blurEffect, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updateLabelForItem
{
  void *v3;
  void *v4;
  id v5;

  -[UIAccessibilityHUDItem title](self->_item, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v3);

  -[UIAccessibilityHUDView layoutManager](self, "layoutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelFontForHUD:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);

}

- (id)layoutManager
{
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (_MergedGlobals_5 != -1)
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_4);
  -[UIAccessibilityHUDItem customView](self->_item, "customView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[UIAccessibilityHUDItem image](self->_item, "image");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[UIAccessibilityHUDItem title](self->_item, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (!v8)
      {
        v4 = &qword_1ECD7A860;
        return (id)*v4;
      }
    }
    -[UIAccessibilityHUDItem title](self->_item, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      -[UIAccessibilityHUDItem image](self->_item, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v4 = &qword_1ECD7A858;
        return (id)*v4;
      }
    }
    else
    {

    }
    v4 = &qword_1ECD7A850;
    return (id)*v4;
  }
  v4 = &qword_1ECD7A868;
  return (id)*v4;
}

void __39__UIAccessibilityHUDView_layoutManager__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD7A850;
  qword_1ECD7A850 = v0;

  v2 = objc_opt_new();
  v3 = (void *)qword_1ECD7A858;
  qword_1ECD7A858 = v2;

  v4 = objc_opt_new();
  v5 = (void *)qword_1ECD7A860;
  qword_1ECD7A860 = v4;

  v6 = objc_opt_new();
  v7 = (void *)qword_1ECD7A868;
  qword_1ECD7A868 = v6;

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
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIAccessibilityHUDView layoutManager](self, "layoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unscaledSizeForHUD:containingSize:", self, width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIAccessibilityHUDView;
  -[UIView layoutSubviews](&v9, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView setBounds:](self->_transformContainer, "setBounds:");
  -[UIView bounds](self, "bounds");
  -[UIView setCenter:](self->_transformContainer, "setCenter:", v4 + v3 * 0.5, v6 + v5 * 0.5);
  -[UIView bounds](self->_transformContainer, "bounds");
  -[UIView setFrame:](self->_effectView, "setFrame:");
  -[UIVisualEffectView contentView](self->_effectView, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[UIView setFrame:](self->_itemEffectView, "setFrame:");

  -[UIAccessibilityHUDView layoutManager](self, "layoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutSubviewsOfHUD:", self);

}

- (void)_show:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD aBlock[5];
  BOOL v15;

  v5 = a4;
  v8 = (void (**)(_QWORD))a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__UIAccessibilityHUDView__show_animated_completion___block_invoke;
  aBlock[3] = &unk_1E16B1B78;
  aBlock[4] = self;
  v15 = a3;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  if (v5)
  {
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __52__UIAccessibilityHUDView__show_animated_completion___block_invoke_2;
    v12[3] = &unk_1E16B1BA0;
    v13 = v8;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v11, v12, 0.1);

  }
  else
  {
    (*((void (**)(void *))v10 + 2))(v10);
    if (v8)
      v8[2](v8);
  }

}

uint64_t __52__UIAccessibilityHUDView__show_animated_completion___block_invoke(uint64_t a1)
{
  double v2;
  __int128 *v3;
  __int128 v4;
  void *v5;
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v2);
  if (*(_BYTE *)(a1 + 40))
    v3 = (__int128 *)MEMORY[0x1E0C9BAA8];
  else
    v3 = &UIAccessibilityHUDSmallTransform;
  v4 = v3[1];
  v8 = *v3;
  v9 = v4;
  v10 = v3[2];
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  v7[0] = v8;
  v7[1] = v4;
  v7[2] = v10;
  return objc_msgSend(v5, "setTransform:", v7);
}

uint64_t __52__UIAccessibilityHUDView__show_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)showAnimated:(BOOL)a3 completion:(id)a4
{
  -[UIAccessibilityHUDView _show:animated:completion:](self, "_show:animated:completion:", 1, a3, a4);
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  -[UIAccessibilityHUDView _show:animated:completion:](self, "_show:animated:completion:", 0, a3, a4);
}

+ (CGSize)preferredHUDSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 220.0;
  v3 = 220.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)containerViewForLayout
{
  return -[UIVisualEffectView contentView](self->_effectView, "contentView");
}

- (id)itemContainerViewForLayout
{
  return -[UIVisualEffectView contentView](self->_itemEffectView, "contentView");
}

- (UIEdgeInsets)imageInsetsForLayout
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIAccessibilityHUDItem imageInsets](self->_item, "imageInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)titleLabel
{
  return self->_titleLabel;
}

- (id)imageView
{
  return self->_imageView;
}

- (id)customView
{
  return self->_customView;
}

- (UIAccessibilityHUDItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_itemEffectView, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_transformContainer, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
