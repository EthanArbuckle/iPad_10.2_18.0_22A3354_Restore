@implementation VUIAdditionalAdvisoryInfoView

- (VUIAdditionalAdvisoryInfoView)initWithAdvisoryInfoDictionary:(id)a3 reduceMotion:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  VUIAdditionalAdvisoryInfoView *v7;
  os_log_t v8;
  void *v9;
  uint64_t v10;
  VUIAdditionalAdvisoryInfoViewLayout *layout;
  double v12;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIAdditionalAdvisoryInfoView;
  v7 = -[VUIAdditionalAdvisoryInfoView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v7)
  {
    v8 = os_log_create("com.apple.AppleTV.playback", "VUIPhotoSensitivityView");
    v9 = (void *)sLogObject_16;
    sLogObject_16 = (uint64_t)v8;

    v10 = objc_opt_new();
    layout = v7->_layout;
    v7->_layout = (VUIAdditionalAdvisoryInfoViewLayout *)v10;

    -[VUIAdditionalAdvisoryInfoView _configureSubviewsWithDictionary:](v7, "_configureSubviewsWithDictionary:", v6);
    v12 = 100.0;
    if (v4)
      v12 = 0.0;
    v7->_animationDistance = v12;
  }

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
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
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  -[VUIAdditionalAdvisoryInfoView _logoSize](self, "_logoSize", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[VUIAdditionalAdvisoryInfoView _logoMargin](self, "_logoMargin");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[VUIAdditionalAdvisoryInfoView _descriptionMargin](self, "_descriptionMargin");
  v17 = v16;
  v19 = v18;
  -[VUIAdditionalAdvisoryInfoView _dividerSize](self, "_dividerSize");
  if (v20 < v7 + v9 + v13 && v20 == 0.0)
    v22 = v7 + v9 + v13;
  else
    v22 = v20;
  -[VUIAdditionalAdvisoryInfoView _descriptionWidth](self, "_descriptionWidth");
  v24 = v17 + v19 + v5 + v11 + v15 + v23;
  v25 = v22;
  result.height = v25;
  result.width = v24;
  return result;
}

- (double)_descriptionViewYOffset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[VUIAdditionalAdvisoryInfoView descriptionView](self, "descriptionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (!v5)
  {
    -[VUIAdditionalAdvisoryInfoView animationDistance](self, "animationDistance");
    v6 = -v7;
  }

  return v6;
}

- (void)layoutSubviews
{
  int v3;
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
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  objc_super v67;

  v67.receiver = self;
  v67.super_class = (Class)VUIAdditionalAdvisoryInfoView;
  -[VUIAdditionalAdvisoryInfoView layoutSubviews](&v67, sel_layoutSubviews);
  v3 = -[VUIAdditionalAdvisoryInfoView vuiIsRTL](self, "vuiIsRTL");
  -[VUIAdditionalAdvisoryInfoView bounds](self, "bounds");
  v63 = v4;
  v59 = v5;
  v7 = v6;
  -[VUIAdditionalAdvisoryInfoView _logoSize](self, "_logoSize");
  v9 = v8;
  v11 = v10;
  -[VUIAdditionalAdvisoryInfoView _logoMargin](self, "_logoMargin");
  v13 = v12;
  v15 = v14;
  -[VUIAdditionalAdvisoryInfoView _dividerSize](self, "_dividerSize");
  v17 = v16;
  v66 = v18;
  -[VUIAdditionalAdvisoryInfoView _dividerMargin](self, "_dividerMargin");
  v58 = v19;
  v21 = v20;
  v61 = v22;
  -[VUIAdditionalAdvisoryInfoView _descriptionMargin](self, "_descriptionMargin");
  v60 = v23;
  -[VUIAdditionalAdvisoryInfoView _descriptionWidth](self, "_descriptionWidth");
  v62 = v24;
  v54 = v13;
  v56 = v7;
  v25 = v7 - v15 - v9;
  v26 = v63 + v13;
  if (v3)
    v27 = v25;
  else
    v27 = v63 + v13;
  v64 = v27;
  v28 = v11;
  VUIRoundValue();
  v30 = v29;
  -[VUIAdditionalAdvisoryInfoView logoImageView](self, "logoImageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v28;
  v33 = v26;
  objc_msgSend(v31, "setFrame:", v64, v30, v9, v32);

  v65 = v21;
  v34 = v26 + v9 + v15 + v21;
  v35 = v15 + v21;
  v36 = v15;
  v37 = v17;
  v38 = v25 - (v35 - v17);
  if (v3)
    v39 = v38;
  else
    v39 = v34;
  -[VUIAdditionalAdvisoryInfoView dividerView](self, "dividerView", *(_QWORD *)&v54, *(_QWORD *)&v56);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[VUIAdditionalAdvisoryInfoView dividerView](self, "dividerView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "frame");
    v43 = v42;

    if (v43 > 0.0)
      v43 = v66;
    -[VUIAdditionalAdvisoryInfoView dividerView](self, "dividerView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFrame:", v39, v59 + v58, v37, v43);

    v45 = v37;
    v46 = v66;
  }
  else
  {
    v45 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v46 = v66;
  }
  -[VUIAdditionalAdvisoryInfoView _descriptionViewYOffset](self, "_descriptionViewYOffset");
  v48 = v47;
  if (v3)
  {
    v49 = v62;
    v50 = v57 - v55 - v9 - v36 - v65 - v37 - v61 - v60 - v62;
  }
  else
  {
    v50 = v33 + v65 + v36 + v9 + v33 + v60 + v61 + v45;
    v49 = v62;
  }
  -[VUILabel setFrame:](self->_descriptionView, "setFrame:", v50, v48, v49, v46);
  -[VUILabel layer](self->_descriptionView, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAdditionalAdvisoryInfoView layout](self, "layout");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "descriptionCornerRadius");
  objc_msgSend(v51, "setCornerRadius:");

  -[VUILabel layer](self->_descriptionView, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setCompositingFilter:", *MEMORY[0x1E0CD2F28]);

}

- (BOOL)_isPortrait
{
  void *v2;
  uint64_t v3;
  _BOOL4 v4;

  -[VUIAdditionalAdvisoryInfoView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (!v3 && (unint64_t)(objc_msgSend(MEMORY[0x1E0DC3F98], "vui_interfaceOrientation") - 1) < 2
    || (v4 = +[VUIUtilities isIpadPortrait](VUIUtilities, "isIpadPortrait")))
  {
    LOBYTE(v4) = 1;
  }
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

  v3 = -[VUIAdditionalAdvisoryInfoView _isPortrait](self, "_isPortrait");
  -[VUIAdditionalAdvisoryInfoView layout](self, "layout");
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

  v3 = -[VUIAdditionalAdvisoryInfoView _isPortrait](self, "_isPortrait");
  -[VUIAdditionalAdvisoryInfoView layout](self, "layout");
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

  -[VUIAdditionalAdvisoryInfoView bounds](self, "bounds");
  v4 = v3;
  v5 = -[VUIAdditionalAdvisoryInfoView _isPortrait](self, "_isPortrait");
  -[VUIAdditionalAdvisoryInfoView layout](self, "layout");
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

  v3 = -[VUIAdditionalAdvisoryInfoView _isPortrait](self, "_isPortrait");
  -[VUIAdditionalAdvisoryInfoView layout](self, "layout");
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

  v3 = -[VUIAdditionalAdvisoryInfoView _isPortrait](self, "_isPortrait");
  -[VUIAdditionalAdvisoryInfoView layout](self, "layout");
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

- (double)_descriptionWidth
{
  void *v2;
  double v3;
  double v4;

  -[VUIAdditionalAdvisoryInfoView layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionWidth");
  v4 = v3;

  return v4;
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

  v3 = -[VUIAdditionalAdvisoryInfoView _isPortrait](self, "_isPortrait");
  -[VUIAdditionalAdvisoryInfoView layout](self, "layout");
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("VUIAdditionalAdvisoryInfoViewImageKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "setImage:", v5);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v6);

  }
  objc_msgSend(v4, "setAlpha:", 0.0);
  -[VUIAdditionalAdvisoryInfoView addSubview:](self, "addSubview:", v4);
  -[VUIAdditionalAdvisoryInfoView setLogoImageView:](self, "setLogoImageView:", v4);
  -[VUIAdditionalAdvisoryInfoView _dividerSize](self, "_dividerSize");
  v8 = v7;
  v9 = (void *)objc_opt_new();
  -[VUIAdditionalAdvisoryInfoView layout](self, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dividerColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v11);

  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v8, 0.0);
  -[VUIAdditionalAdvisoryInfoView addSubview:](self, "addSubview:", v9);
  -[VUIAdditionalAdvisoryInfoView setDividerView:](self, "setDividerView:", v9);
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("VUIIAdditionalAdvisoryInfoViewDescriptionKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAdditionalAdvisoryInfoView description](self, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAdditionalAdvisoryInfoView layout](self, "layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptionLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v13, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setText:", v12);
  -[VUIAdditionalAdvisoryInfoView addSubview:](self, "addSubview:", v16);
  -[VUIAdditionalAdvisoryInfoView setDescriptionView:](self, "setDescriptionView:", v16);
  -[VUILabel layer](self->_descriptionView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAdditionalAdvisoryInfoView layout](self, "layout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "descriptionCornerRadius");
  objc_msgSend(v17, "setCornerRadius:");

  -[VUIAdditionalAdvisoryInfoView layoutSubviews](self, "layoutSubviews");
}

- (VUIAdditionalAdvisoryInfoViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (VUIImageView)logoImageView
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

- (VUILabel)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionView, a3);
}

- (VUITextLayout)descriptionLayout
{
  return self->_descriptionLayout;
}

- (double)animationDistance
{
  return self->_animationDistance;
}

- (void)setAnimationDistance:(double)a3
{
  self->_animationDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLayout, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)showWithAnimatedLogoAndText:(BOOL)a3 animateDivider:(BOOL)a4 platterView:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  v7 = a4;
  v8 = a3;
  v30 = a5;
  v10 = (void (**)(_QWORD))a6;
  if (v8)
  {
    -[VUIAdditionalAdvisoryInfoView _showAnimatedLogoAndTextWithCompletion:platterView:animateDivider:](self, "_showAnimatedLogoAndTextWithCompletion:platterView:animateDivider:", v10, v30, v7);
  }
  else
  {
    -[VUIAdditionalAdvisoryInfoView dividerView](self, "dividerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[VUIAdditionalAdvisoryInfoView dividerView](self, "dividerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;
      v16 = v15;
      v18 = v17;

      -[VUIAdditionalAdvisoryInfoView _dividerSize](self, "_dividerSize");
      v20 = v19;
      -[VUIAdditionalAdvisoryInfoView dividerView](self, "dividerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    }
    -[VUIAdditionalAdvisoryInfoView logoImageView](self, "logoImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAlpha:", 1.0);

    -[VUIAdditionalAdvisoryInfoView descriptionView](self, "descriptionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAlpha:", 1.0);

    if (v30)
    {
      -[VUIAdditionalAdvisoryInfoView frame](self, "frame");
      v25 = v24 + -15.0;
      objc_msgSend(v30, "frame");
      v27 = v26;
      -[VUIAdditionalAdvisoryInfoView frame](self, "frame");
      v29 = v28 + 30.0;
      objc_msgSend(v30, "frame");
      objc_msgSend(v30, "setFrame:", v25, v27, v29);
    }
    v10[2](v10);
  }

}

- (void)_showAnimatedLogoAndTextWithCompletion:(id)a3 platterView:(id)a4 animateDivider:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  void *v64;
  uint64_t v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  id v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  _QWORD v95[4];
  id v96;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v10 = (void *)MEMORY[0x1E0CD28B0];
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __109__VUIAdditionalAdvisoryInfoView_Animator___showAnimatedLogoAndTextWithCompletion_platterView_animateDivider___block_invoke;
  v95[3] = &unk_1E9F98E68;
  v94 = v8;
  v96 = v94;
  objc_msgSend(v10, "setCompletionBlock:", v95);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("bounds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMass:", 1.0);
  objc_msgSend(v11, "setStiffness:", 60.0);
  objc_msgSend(v11, "setDamping:", 16.0);
  objc_msgSend(v11, "setInitialVelocity:", 0.0);
  objc_msgSend(v11, "settlingDuration");
  objc_msgSend(v11, "setDuration:");
  -[VUIAdditionalAdvisoryInfoView dividerView](self, "dividerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[VUIAdditionalAdvisoryInfoView bounds](self, "bounds");
    v21 = v20;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v15, v17, v19, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFromValue:", v22);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v15, v17, v19, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setToValue:", v23);

    objc_msgSend(v13, "addAnimation:forKey:", v11, CFSTR("bounds"));
  }
  else
  {
    -[VUIAdditionalAdvisoryInfoView bounds](self, "bounds");
    v15 = v24;
    v17 = v25;
    v19 = v26;
    v21 = v27;
  }
  v93 = v13;
  objc_msgSend(v13, "setBounds:", v15, v17, v19, v21);
  if (v9)
  {
    objc_msgSend(v9, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[VUIAdditionalAdvisoryInfoView bounds](self, "bounds");
    v38 = v37 + 30.0;
    if (v34 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v30, v32, v34, v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFromValue:", v39);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v30, v32, v38, v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setToValue:", v40);

      objc_msgSend(v28, "addAnimation:forKey:", v11, CFSTR("bounds"));
      objc_msgSend(v28, "setBounds:", v30, v32, v38, v36);
    }
    else if (v34 < v38)
    {
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setMass:", 1.0);
      objc_msgSend(v41, "setStiffness:", 60.0);
      objc_msgSend(v41, "setDamping:", 16.0);
      objc_msgSend(v41, "setInitialVelocity:", 0.0);
      objc_msgSend(v41, "settlingDuration");
      objc_msgSend(v41, "setDuration:");
      objc_msgSend(v28, "position");
      v43 = v42;
      v45 = v44;
      -[VUIAdditionalAdvisoryInfoView layer](self, "layer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "position");
      v48 = v47;

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v43, v45);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setFromValue:", v49);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v48, v45);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setToValue:", v50);

      objc_msgSend(v28, "addAnimation:forKey:", v41, CFSTR("position"));
      objc_msgSend(v28, "setPosition:", v48, v45);
      -[VUIAdditionalAdvisoryInfoView bounds](self, "bounds");
      v52 = v51 + 30.0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v30, v32, v34, v36);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFromValue:", v53);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v30, v32, v52, v36);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setToValue:", v54);

      objc_msgSend(v28, "addAnimation:forKey:", v11, CFSTR("bounds"));
      objc_msgSend(v28, "setBounds:", v30, v32, v52, v36);

    }
  }
  v55 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v56) = 0;
  LODWORD(v57) = 1.0;
  LODWORD(v58) = 1051260355;
  LODWORD(v59) = 1059816735;
  v91 = (void *)objc_msgSend(v55, "initWithControlPoints::::", v58, v56, v59, v57);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v92 = v9;
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setTimingFunction:", v91);
  objc_msgSend(v60, "setBeginTime:", CACurrentMediaTime() + 0.8);
  LODWORD(v61) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFromValue:", v62);

  LODWORD(v63) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setToValue:", v64);

  objc_msgSend(v60, "setDuration:", 0.88);
  objc_msgSend(v60, "setRemovedOnCompletion:", 0);
  v65 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v60, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  -[VUIAdditionalAdvisoryInfoView logoImageView](self, "logoImageView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "layer");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v90, "addAnimation:forKey:", v60, CFSTR("opacity"));
  LODWORD(v67) = 0;
  objc_msgSend(v90, "setOpacity:", v67);
  -[VUILabel layer](self->_descriptionView, "layer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setMass:", 1.0);
  objc_msgSend(v69, "setStiffness:", 24.0);
  objc_msgSend(v69, "setDamping:", 15.0);
  objc_msgSend(v69, "setInitialVelocity:", 0.0);
  objc_msgSend(v69, "settlingDuration");
  objc_msgSend(v69, "setDuration:");
  objc_msgSend(v68, "position");
  v71 = v70;
  v73 = v72;
  -[VUIAdditionalAdvisoryInfoView animationDistance](self, "animationDistance");
  v75 = v73 + v74;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v71, v73);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setFromValue:", v76);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v71, v75);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setToValue:", v77);

  objc_msgSend(v69, "setRemovedOnCompletion:", 0);
  objc_msgSend(v69, "setFillMode:", v65);
  objc_msgSend(v68, "addAnimation:forKey:", v69, CFSTR("position"));
  objc_msgSend(v68, "setPosition:", v71, v73);
  v78 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v79) = 0;
  LODWORD(v80) = 1.0;
  LODWORD(v81) = 1051260355;
  LODWORD(v82) = 1059816735;
  v83 = (void *)objc_msgSend(v78, "initWithControlPoints::::", v81, v79, v82, v80);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setTimingFunction:", v83);
  LODWORD(v85) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setFromValue:", v86);

  LODWORD(v87) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setToValue:", v88);

  objc_msgSend(v84, "setRemovedOnCompletion:", 0);
  objc_msgSend(v84, "setFillMode:", v65);
  objc_msgSend(v68, "addAnimation:forKey:", v84, CFSTR("opacity"));
  objc_msgSend(v84, "setBeginTime:", CACurrentMediaTime() + 0.349999994);
  objc_msgSend(v84, "setDuration:", 3.0);
  LODWORD(v89) = 0;
  objc_msgSend(v68, "setOpacity:", v89);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __109__VUIAdditionalAdvisoryInfoView_Animator___showAnimatedLogoAndTextWithCompletion_platterView_animateDivider___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)hideAnimated:(BOOL)a3 platterView:(id)a4 hidePlatterView:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL4 v8;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(void);

  v6 = a5;
  v8 = a3;
  v21 = (void (**)(void))a6;
  if (v8)
  {
    -[VUIAdditionalAdvisoryInfoView _hideWithAnimationWithPlatterView:hidePlatterView:completion:](self, "_hideWithAnimationWithPlatterView:hidePlatterView:completion:", a4, v6, v21);
  }
  else
  {
    -[VUIAdditionalAdvisoryInfoView dividerView](self, "dividerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[VUIAdditionalAdvisoryInfoView dividerView](self, "dividerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v13 = v12;
      v15 = v14;
      v17 = v16;

      -[VUIAdditionalAdvisoryInfoView dividerView](self, "dividerView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", v13, v15, v17, 0.0);

    }
    -[VUIAdditionalAdvisoryInfoView logoImageView](self, "logoImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlpha:", 0.0);

    -[VUIAdditionalAdvisoryInfoView descriptionView](self, "descriptionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", 0.0);

    v21[2]();
  }

}

- (void)_hideWithAnimationWithPlatterView:(id)a3 hidePlatterView:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  id v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  _QWORD v64[4];
  id v65;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v10 = (void *)MEMORY[0x1E0CD28B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __104__VUIAdditionalAdvisoryInfoView_Animator___hideWithAnimationWithPlatterView_hidePlatterView_completion___block_invoke;
  v64[3] = &unk_1E9F98E68;
  v63 = v9;
  v65 = v63;
  objc_msgSend(v10, "setCompletionBlock:", v64);
  v11 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v12) = 0;
  LODWORD(v13) = 1.0;
  LODWORD(v14) = 1051260355;
  LODWORD(v15) = 1059816735;
  v16 = objc_msgSend(v11, "initWithControlPoints::::", v14, v12, v15, v13);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)v16;
  objc_msgSend(v17, "setTimingFunction:", v16);
  objc_msgSend(v17, "setBeginTime:", CACurrentMediaTime());
  LODWORD(v18) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", v19);

  LODWORD(v20) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setToValue:", v21);

  objc_msgSend(v17, "setDuration:", 0.88);
  objc_msgSend(v17, "setRemovedOnCompletion:", 0);
  v22 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v17, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  -[VUIAdditionalAdvisoryInfoView logoImageView](self, "logoImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "addAnimation:forKey:", v17, CFSTR("opacity"));
  LODWORD(v25) = 0;
  objc_msgSend(v24, "setOpacity:", v25);
  if (v8 && v6)
  {
    objc_msgSend(v8, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addAnimation:forKey:", v17, CFSTR("opacity"));
    LODWORD(v27) = 0;
    objc_msgSend(v26, "setOpacity:", v27);

  }
  v28 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v29) = 0;
  LODWORD(v30) = 1.0;
  LODWORD(v31) = 1051260355;
  LODWORD(v32) = 1059816735;
  v60 = (void *)objc_msgSend(v28, "initWithControlPoints::::", v31, v29, v32, v30);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v61 = v8;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTimingFunction:", v60);
  LODWORD(v34) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFromValue:", v35);

  LODWORD(v36) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setToValue:", v37);

  objc_msgSend(v33, "setDuration:", 0.810000002);
  objc_msgSend(v33, "setRemovedOnCompletion:", 0);
  objc_msgSend(v33, "setFillMode:", v22);
  -[VUIAdditionalAdvisoryInfoView descriptionView](self, "descriptionView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "addAnimation:forKey:", v33, CFSTR("opacity"));
  objc_msgSend(v33, "setBeginTime:", CACurrentMediaTime() + 0.349999994);
  LODWORD(v40) = 0;
  objc_msgSend(v39, "setOpacity:", v40);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDuration:", 0.88);
  v42 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v43) = 1062501089;
  LODWORD(v44) = 0;
  LODWORD(v45) = 0;
  LODWORD(v46) = 1051260355;
  v47 = (void *)objc_msgSend(v42, "initWithControlPoints::::", v46, v44, v43, v45);
  objc_msgSend(v41, "setTimingFunction:", v47);
  -[VUIAdditionalAdvisoryInfoView dividerView](self, "dividerView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "bounds");
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFromValue:", v58);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v51, v53, v55, 0.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setToValue:", v59);

  objc_msgSend(v41, "setRemovedOnCompletion:", 0);
  objc_msgSend(v41, "setFillMode:", v22);
  objc_msgSend(v49, "addAnimation:forKey:", v41, CFSTR("bounds"));
  objc_msgSend(v49, "setBounds:", v51, v53, v55, v57);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __104__VUIAdditionalAdvisoryInfoView_Animator___hideWithAnimationWithPlatterView_hidePlatterView_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
