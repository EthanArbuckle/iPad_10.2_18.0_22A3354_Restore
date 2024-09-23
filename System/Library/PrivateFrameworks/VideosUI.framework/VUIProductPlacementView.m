@implementation VUIProductPlacementView

- (VUIProductPlacementView)initWithAdvisoryInfoDictionary:(id)a3
{
  id v4;
  VUIProductPlacementView *v5;
  uint64_t v6;
  VUIVideoAdvisoryViewLayout *layout;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIProductPlacementView;
  v5 = -[VUIProductPlacementView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = objc_opt_new();
    layout = v5->_layout;
    v5->_layout = (VUIVideoAdvisoryViewLayout *)v6;

    -[VUIProductPlacementView _configureSubviewsWithDictionary:](v5, "_configureSubviewsWithDictionary:", v4);
  }

  return v5;
}

- (void)show:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (a3)
    -[VUIProductPlacementView _showAnimated:completion:](self, "_showAnimated:completion:", a4, a5);
  else
    -[VUIProductPlacementView _hideAnimated:completion:](self, "_hideAnimated:completion:", a4, a5);
}

- (BOOL)_isPortrait
{
  void *v2;
  uint64_t v3;
  _BOOL4 v4;

  -[VUIProductPlacementView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (!v3 || (v4 = +[VUIUtilities isIpadPortrait](VUIUtilities, "isIpadPortrait")))
    LOBYTE(v4) = 1;
  return v4;
}

- (UIEdgeInsets)_margin
{
  BOOL v3;
  void *v4;
  void *v5;
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
  UIEdgeInsets result;

  v3 = -[VUIProductPlacementView _isPortrait](self, "_isPortrait");
  -[VUIProductPlacementView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "portraitMargin");
  else
    objc_msgSend(v4, "margin");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)_logoSize
{
  BOOL v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = -[VUIProductPlacementView _isPortrait](self, "_isPortrait");
  -[VUIProductPlacementView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "portraitLogoSize");
  else
    objc_msgSend(v4, "logoSize");
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_dividerSize
{
  double v3;
  double v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[VUIProductPlacementView bounds](self, "bounds");
  v4 = v3;
  v5 = -[VUIProductPlacementView _isPortrait](self, "_isPortrait");
  -[VUIProductPlacementView layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "portraitDividerSize");
  else
    objc_msgSend(v6, "dividerSize");
  v9 = v8;

  v10 = v9;
  v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)_logoMargin
{
  BOOL v3;
  void *v4;
  void *v5;
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
  UIEdgeInsets result;

  v3 = -[VUIProductPlacementView _isPortrait](self, "_isPortrait");
  -[VUIProductPlacementView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "portraitLogoMargin");
  else
    objc_msgSend(v4, "logoMargin");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)_dividerMargin
{
  BOOL v3;
  void *v4;
  void *v5;
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
  UIEdgeInsets result;

  v3 = -[VUIProductPlacementView _isPortrait](self, "_isPortrait");
  -[VUIProductPlacementView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "portraitDividerMargin");
  else
    objc_msgSend(v4, "dividerMargin");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)_descriptionMargin
{
  BOOL v3;
  void *v4;
  void *v5;
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
  UIEdgeInsets result;

  v3 = -[VUIProductPlacementView _isPortrait](self, "_isPortrait");
  -[VUIProductPlacementView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "portraitDescriptionMargin");
  else
    objc_msgSend(v4, "descriptionMargin");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)_descriptionSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;

  -[VUIProductPlacementView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionMaxWidth");
  v5 = v4;

  -[VUIProductPlacementView blockDescriptionLabel](self, "blockDescriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIProductPlacementView bounds](self, "bounds");
  objc_msgSend(v6, "sizeThatFits:", v5, CGRectGetHeight(v14));
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_configureSubviewsWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("VUIAdvisoryViewLogoImageKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setImage:", v5);
  objc_msgSend(v4, "setAlpha:", 0.0);
  -[VUIProductPlacementView addSubview:](self, "addSubview:", v4);
  -[VUIProductPlacementView setLogoImageView:](self, "setLogoImageView:", v4);
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("VUIAdvisoryViewBlockDescriptionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    if (v5)
    {
      -[VUIProductPlacementView _dividerSize](self, "_dividerSize");
      v8 = v7;
      v9 = (void *)objc_opt_new();
      -[VUIProductPlacementView layout](self, "layout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dividerColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v11);

      objc_msgSend(v9, "setFrame:", 0.0, 0.0, v8, 0.0);
      -[VUIProductPlacementView addSubview:](self, "addSubview:", v9);
      -[VUIProductPlacementView setDividerView:](self, "setDividerView:", v9);

    }
    -[VUIProductPlacementView layout](self, "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "descriptionLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v6, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setAlpha:", 0.0);
    -[VUIProductPlacementView addSubview:](self, "addSubview:", v14);
    -[VUIProductPlacementView setBlockDescriptionLabel:](self, "setBlockDescriptionLabel:", v14);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[VUIProductPlacementView _logoSize](self, "_logoSize");
  v7 = v6;
  -[VUIProductPlacementView _margin](self, "_margin");
  v9 = v8;
  -[VUIProductPlacementView _logoMargin](self, "_logoMargin");
  v11 = v10;
  v13 = v12;
  v14 = width + v9 * -2.0;
  -[VUIProductPlacementView blockDescriptionLabel](self, "blockDescriptionLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeThatFits:", width, height);
  v17 = v16 + 0.0;

  if (v17 >= v7 + v11 + v13)
    v18 = v17;
  else
    v18 = v7 + v11 + v13;
  v19 = v14;
  result.height = v18;
  result.width = v19;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)VUIProductPlacementView;
  -[VUIProductPlacementView layoutSubviews](&v52, sel_layoutSubviews);
  v3 = -[VUIProductPlacementView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[VUIProductPlacementView bounds](self, "bounds");
  v5 = v4;
  v45 = v6;
  v8 = v7;
  -[VUIProductPlacementView _logoSize](self, "_logoSize");
  v10 = v9;
  v12 = v11;
  -[VUIProductPlacementView _logoMargin](self, "_logoMargin");
  v14 = v13;
  v48 = v15;
  -[VUIProductPlacementView _dividerSize](self, "_dividerSize");
  v49 = v16;
  v44 = v17;
  -[VUIProductPlacementView _dividerMargin](self, "_dividerMargin");
  v43 = v18;
  v20 = v19;
  v47 = v21;
  -[VUIProductPlacementView _descriptionMargin](self, "_descriptionMargin");
  v46 = v22;
  -[VUIProductPlacementView _descriptionSize](self, "_descriptionSize");
  v51 = v24;
  v25 = v8 - v14 - v10;
  v26 = v5 + v14;
  if (v3 == 1)
    v27 = v25;
  else
    v27 = v26;
  v28 = v23;
  VUIRoundValue();
  v30 = v29;
  -[VUIProductPlacementView logoImageView](self, "logoImageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v30;
  objc_msgSend(v31, "setFrame:", v27, v30, v10, v12);

  -[VUIProductPlacementView dividerView](self, "dividerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = v49;
    if (v3 == 1)
      v34 = v25 - (v48 + v20 - v49);
    else
      v34 = v26 + v20 + v48 + v10 + v26;
    -[VUIProductPlacementView dividerView](self, "dividerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[VUIProductPlacementView dividerView](self, "dividerView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "frame");
      v37 = v28;
      v39 = v38;

      if (v39 > 0.0)
        v39 = v44;
      -[VUIProductPlacementView dividerView](self, "dividerView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v39;
      v28 = v37;
      objc_msgSend(v40, "setFrame:", v34, v45 + v43, v49, v41);

    }
    else
    {
      v33 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    }
    if (v3 == 1)
      v27 = v34 - (v46 + v47 + v28);
    else
      v27 = v34 + v46 + v47 + v33;
  }
  -[VUIProductPlacementView blockDescriptionLabel](self, "blockDescriptionLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFrame:", v27, v50, v28, v51);

}

- (void)_showAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  if (a3)
  {
    -[VUIProductPlacementView _showWithAnimationWithCompletion:](self, "_showWithAnimationWithCompletion:", a4);
  }
  else
  {
    -[VUIProductPlacementView dividerView](self, "dividerView", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[VUIProductPlacementView dividerView](self, "dividerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      v8 = v7;
      v10 = v9;
      v12 = v11;

      -[VUIProductPlacementView _dividerSize](self, "_dividerSize");
      v14 = v13;
      -[VUIProductPlacementView dividerView](self, "dividerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    }
    -[VUIProductPlacementView logoImageView](self, "logoImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAlpha:", 1.0);

    -[VUIProductPlacementView blockDescriptionLabel](self, "blockDescriptionLabel");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlpha:", 1.0);

  }
}

- (void)_showWithAnimationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  CGAffineTransform v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[VUIProductPlacementView dividerView](self, "dividerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0DC3F10];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke;
    v24[3] = &unk_1E9F99C98;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0, v24, 0, 0.5, 0.0);
    objc_destroyWeak(&v25);
  }
  v8 = (void *)MEMORY[0x1E0DC3F10];
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke_2;
  v22[3] = &unk_1E9F99C98;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 0, v22, 0, 0.5, 0.3);
  v9 = -[VUIProductPlacementView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[VUIProductPlacementView blockDescriptionLabel](self, "blockDescriptionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIProductPlacementView dividerView](self, "dividerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = -20.0;
    if (v9 == 1)
      v12 = 20.0;
    CGAffineTransformMakeTranslation(&v21, v12, 0.0);
    objc_msgSend(v10, "setTransform:", &v21);
  }
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke_3;
  v18[3] = &unk_1E9F9B6C0;
  v14 = v10;
  v19 = v14;
  objc_copyWeak(&v20, &location);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke_4;
  v16[3] = &unk_1E9F98E18;
  v15 = v4;
  v17 = v15;
  objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 0, v18, v16, 0.5, 0.0);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dividerView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;

  objc_msgSend(WeakRetained, "bounds");
  v9 = v8;
  objc_msgSend(WeakRetained, "dividerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

}

void __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "logoImageView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  __int128 v5;
  _OWORD v6[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dividerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v6[0] = *MEMORY[0x1E0C9BAA8];
    v6[1] = v5;
    v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v4, "setTransform:", v6);
  }

}

uint64_t __60__VUIProductPlacementView__showWithAnimationWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_hideAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  if (a3)
  {
    -[VUIProductPlacementView _hideWithAnimationWithCompletion:](self, "_hideWithAnimationWithCompletion:", a4);
  }
  else
  {
    -[VUIProductPlacementView dividerView](self, "dividerView", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[VUIProductPlacementView dividerView](self, "dividerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      v8 = v7;
      v10 = v9;
      v12 = v11;

      -[VUIProductPlacementView dividerView](self, "dividerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFrame:", v8, v10, v12, 0.0);

    }
    -[VUIProductPlacementView logoImageView](self, "logoImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", 0.0);

    -[VUIProductPlacementView blockDescriptionLabel](self, "blockDescriptionLabel");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 0.0);

  }
}

- (void)_hideWithAnimationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke;
  v16[3] = &unk_1E9F99C98;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 0, v16, 0, 2.0, 0.0);
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke_2;
  v14[3] = &unk_1E9F99C98;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0, v14, 0, 2.0, 0.0);
  -[VUIProductPlacementView dividerView](self, "dividerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke_3;
    v12[3] = &unk_1E9F99C98;
    objc_copyWeak(&v13, &location);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke_4;
    v10[3] = &unk_1E9F98E18;
    v11 = v4;
    objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 0, v12, v10, 2.0, 0.4);

    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "logoImageView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "blockDescriptionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(WeakRetained, "blockDescriptionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v5);

}

void __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dividerView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;

  objc_msgSend(WeakRetained, "dividerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", v3, v5, v7, 0.0);

}

uint64_t __60__VUIProductPlacementView__hideWithAnimationWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (VUIVideoAdvisoryViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (_TVImageView)logoImageView
{
  return self->_logoImageView;
}

- (void)setLogoImageView:(id)a3
{
  objc_storeStrong((id *)&self->_logoImageView, a3);
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_dividerView, a3);
}

- (VUILabel)blockDescriptionLabel
{
  return self->_blockDescriptionLabel;
}

- (void)setBlockDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_blockDescriptionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
