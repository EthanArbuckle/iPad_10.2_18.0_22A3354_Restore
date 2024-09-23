@implementation PKPassBannerViewController

+ (id)createWithPass:(id)a3 primaryText:(id)a4 secondaryText:(id)a5 trailingViewConfiguration:(id)a6 walletForeground:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id *v15;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[PKPassBannerViewController _initWithPass:primaryText:secondaryText:preferredLabelAxis:trailingViewConfiguration:walletForeground:]((id *)[PKPassBannerViewController alloc], v14, v13, v12, 0, v11, a7);

  return v15;
}

- (id)_initWithPass:(void *)a3 primaryText:(void *)a4 secondaryText:(void *)a5 preferredLabelAxis:(void *)a6 trailingViewConfiguration:(char)a7 walletForeground:
{
  id v14;
  id v15;
  id v16;
  id *result;
  id *v18;
  id *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_super v24;

  v14 = a2;
  v15 = a3;
  v16 = a4;
  result = a6;
  v18 = result;
  if (!a1)
  {
LABEL_15:

    return a1;
  }
  if (v14)
  {
    v24.receiver = a1;
    v24.super_class = (Class)PKPassBannerViewController;
    v19 = (id *)objc_msgSendSuper2(&v24, sel_initWithNibName_bundle_, 0, 0);
    a1 = v19;
    if (v19)
    {
      objc_storeStrong(v19 + 137, a2);
      v20 = objc_msgSend(v15, "length");
      if (v20)
        v21 = (void *)objc_msgSend(v15, "copy");
      else
        v21 = 0;
      objc_storeStrong(a1 + 138, v21);
      if (v20)

      v22 = objc_msgSend(v16, "length");
      if (v22)
        v23 = (void *)objc_msgSend(v16, "copy");
      else
        v23 = 0;
      objc_storeStrong(a1 + 139, v23);
      if (v22)

      a1[140] = a5;
      objc_storeStrong(a1 + 141, a6);
      *((_BYTE *)a1 + 969) = a7;
      a1[123] = (id)SBSIsSystemApertureAvailable();
    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

+ (id)createForTransactionWithPass:(id)a3 primaryText:(id)a4 secondaryText:(id)a5 preferredLabelAxis:(unint64_t)a6 trailingViewConfiguration:(id)a7 walletForeground:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id *v17;

  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[PKPassBannerViewController _initWithPass:primaryText:secondaryText:preferredLabelAxis:trailingViewConfiguration:walletForeground:]((id *)[PKPassBannerViewController alloc], v16, v15, v14, (void *)a6, v13, a8);

  if (v17)
    *((_BYTE *)v17 + 968) = 1;
  return v17;
}

- (PKPassBannerViewController)init
{

  return 0;
}

- (PKPassBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (PKPassBannerViewController)initWithCoder:(id)a3
{

  return 0;
}

- (void)dealloc
{
  NSObject *revokeTimer;
  objc_super v4;

  revokeTimer = self->_revokeTimer;
  if (revokeTimer)
    dispatch_source_cancel(revokeTimer);
  v4.receiver = self;
  v4.super_class = (Class)PKPassBannerViewController;
  -[PKPassBannerViewController dealloc](&v4, sel_dealloc);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassBannerViewController;
  -[PKPassBannerViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[PKPassBannerViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(v4, "preferredContentSizeCategory"),
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "preferredContentSizeCategory"),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v8))
  {
    -[PKPassBannerViewController _updateFonts](self);
  }

}

- (void)_updateFonts
{
  void *v2;
  uint64_t v3;
  UITraitCollection *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  objc_class *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  objc_class *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  _QWORD v62[2];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[5];

  v66[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "viewIfLoaded");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
LABEL_53:

      return;
    }
    objc_msgSend(a1, "traitCollection");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (UITraitCollection *)v3;
    if (!a1[123])
    {
      v5 = (void *)MEMORY[0x1E0DC3E88];
      if (!v3)
      {
        objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
        v4 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
        if (!v4)
          goto LABEL_52;
        goto LABEL_7;
      }
      v62[0] = v3;
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v62[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "traitCollectionWithTraitsFromCollections:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (UITraitCollection *)v8;
    }
    if (!v4)
    {
LABEL_52:

      goto LABEL_53;
    }
LABEL_7:
    if (a1[123])
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 1, v4);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)a1[130];
      a1[130] = v9;

      objc_msgSend(MEMORY[0x1E0DC1350], "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 3, v4);
    }
    else
    {
      v12 = (NSString *)*MEMORY[0x1E0DC13A8];
      v13 = *MEMORY[0x1E0DC1448];
      PKFontForDesign(v4, (NSString *)*MEMORY[0x1E0DC13A8], (NSString *)*MEMORY[0x1E0DC4B58], *MEMORY[0x1E0DC1448]);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)a1[130];
      a1[130] = v14;

      PKFontForDesign(v4, v12, (NSString *)*MEMORY[0x1E0DC4AD0], v13);
    }
    v11 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)a1[131];
    a1[131] = v11;

    v17 = (void *)a1[133];
    if (v17)
      objc_msgSend(v17, "setFont:", a1[130]);
    v18 = (void *)a1[134];
    if (v18)
    {
      objc_msgSend(v18, "setFont:", a1[131]);
      if (a1[123] == 1)
      {
        v19 = (void *)a1[134];
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTextColor:", v20);

      }
    }
    if (a1[133] || a1[134])
      objc_msgSend(v2, "setNeedsLayout");
    if (!a1[132])
      goto LABEL_52;
    objc_msgSend(a1, "viewIfLoaded");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21 || !a1[132])
      goto LABEL_51;
    v22 = a1[138];
    v59 = a1[139];
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v25 = (_QWORD *)MEMORY[0x1E0DC1100];
    v58 = v22;
    if (v22)
    {
      v26 = *MEMORY[0x1E0DC1138];
      v66[0] = a1[130];
      v27 = (uint64_t *)MEMORY[0x1E0DC1140];
      v28 = *MEMORY[0x1E0DC1140];
      v65[0] = v26;
      v65[1] = v28;
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v65[2] = *v25;
      v66[1] = v29;
      v66[2] = v24;
      v30 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = (uint64_t *)MEMORY[0x1E0DC1140];
      v30 = (void *)v23;
      v61 = 0;
    }
    if (v59)
    {
      v31 = *MEMORY[0x1E0DC1138];
      v64[0] = a1[131];
      v32 = *v27;
      v63[0] = v31;
      v63[1] = v32;
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v63[2] = *MEMORY[0x1E0DC1100];
      v64[1] = v33;
      v64[2] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v34 = 0;
    }
    v35 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v36 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (objc_msgSend(v21, "_shouldReverseLayoutDirection"))
      v37 = CFSTR("⁧");
    else
      v37 = CFSTR("⁦");
    if (v61)
      v38 = v61;
    else
      v38 = v34;
    v39 = (void *)objc_msgSend(v36, "initWithString:attributes:", v37, v38);
    objc_msgSend(v35, "appendAttributedString:", v39);

    if (v58)
    {
      v40 = objc_alloc(MEMORY[0x1E0CB3498]);
      v41 = (void *)a1[138];
      if (v41)
      {
        v42 = (objc_class *)MEMORY[0x1E0CB3940];
        v43 = v41;
        v44 = (void *)objc_msgSend([v42 alloc], "initWithFormat:", CFSTR("⁨%@⁩"), v43);

      }
      else
      {
        v44 = 0;
      }
      v45 = (void *)objc_msgSend(v40, "initWithString:attributes:", v44, v61);
      objc_msgSend(v35, "appendAttributedString:", v45);

      if (!v59)
        goto LABEL_47;
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v34);
      objc_msgSend(v35, "appendAttributedString:", v46);

    }
    else if (!v59)
    {
LABEL_47:
      v53 = objc_alloc(MEMORY[0x1E0CB3498]);
      if (v34)
        v54 = v34;
      else
        v54 = v61;
      v55 = (void *)objc_msgSend(v53, "initWithString:attributes:", CFSTR("⁩"), v54);
      objc_msgSend(v35, "appendAttributedString:", v55);

      v56 = (void *)a1[132];
      v57 = (void *)objc_msgSend(v35, "copy");
      objc_msgSend(v56, "setAttributedText:", v57);

      objc_msgSend(v21, "setNeedsLayout");
LABEL_51:

      goto LABEL_52;
    }
    v47 = objc_alloc(MEMORY[0x1E0CB3498]);
    v48 = (void *)a1[139];
    if (v48)
    {
      v49 = (objc_class *)MEMORY[0x1E0CB3940];
      v60 = v30;
      v50 = v48;
      v51 = (void *)objc_msgSend([v49 alloc], "initWithFormat:", CFSTR("⁨%@⁩"), v50);

      v30 = v60;
    }
    else
    {
      v51 = 0;
    }
    v52 = (void *)objc_msgSend(v47, "initWithString:attributes:", v51, v34);
    objc_msgSend(v35, "appendAttributedString:", v52);

    goto LABEL_47;
  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *contentView;
  PKPassBannerLeadingView *v7;
  PKPassBannerLeadingView *leadingView;
  PKPassBannerTrailingView *v9;
  PKPassBannerTrailingView *trailingView;
  PKPassBannerMinimalView *v11;
  PKPassBannerMinimalView *minimalView;
  PKPassBannerMinimalView *v13;
  PKPassBannerMinimalView *v14;
  UILabel *v15;
  UILabel *primaryLabel;
  UILabel *v17;
  UILabel *secondaryLabel;
  void *v19;
  void *v20;
  UILabel *v21;
  UILabel *v22;
  void *v23;
  PKPassBannerTrailingView *v24;
  id v25;
  void *v26;
  void *v27;
  UILabel *v28;
  UILabel *label;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PKPassBannerViewController;
  -[PKPassBannerViewController loadView](&v30, sel_loadView);
  -[PKPassBannerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 0);
  -[PKPassBannerViewController _platterView](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "addSubview:", v4);
    objc_msgSend(v4, "customContentView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  contentView = self->_contentView;
  self->_contentView = v5;

  v7 = (PKPassBannerLeadingView *)-[PKPassBannerLeadingView _initWithStyle:pass:]((id *)[PKPassBannerLeadingView alloc], (void *)self->_style, self->_pass);
  leadingView = self->_leadingView;
  self->_leadingView = v7;

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_leadingView);
  v9 = (PKPassBannerTrailingView *)-[PKPassBannerTrailingView _initWithStyle:configuration:]((uint64_t)[PKPassBannerTrailingView alloc], self->_style, self->_trailingViewConfiguration);
  trailingView = self->_trailingView;
  self->_trailingView = v9;

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_trailingView);
  if (self->_style != 1)
    goto LABEL_37;
  v11 = -[PKPassBannerMinimalView _initWithStyle:leadingView:trailingView:]([PKPassBannerMinimalView alloc], "_initWithStyle:leadingView:trailingView:", self->_style, self->_leadingView, self->_trailingView);
  minimalView = self->_minimalView;
  self->_minimalView = v11;

  v13 = self->_minimalView;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, self);
    v14 = self->_minimalView;
  }
  else
  {
    v14 = 0;
  }
  -[UIView addSubview:](self->_contentView, "addSubview:", v14);
  if (self->_style == 1 && self->_preferredLabelAxis != 2)
  {
    if (self->_primaryText || self->_secondaryText)
    {
      v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      label = self->_label;
      self->_label = v28;

      -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 1);
      -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", 4);
      -[UILabel setMarqueeEnabled:](self->_label, "setMarqueeEnabled:", 1);
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_label);
    }
  }
  else
  {
LABEL_37:
    if (self->_primaryText)
    {
      v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      primaryLabel = self->_primaryLabel;
      self->_primaryLabel = v15;

      -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 1);
      -[UILabel setLineBreakMode:](self->_primaryLabel, "setLineBreakMode:", 4);
      if (self->_style == 1)
        -[UILabel setMarqueeEnabled:](self->_primaryLabel, "setMarqueeEnabled:", 1);
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_primaryLabel);
      -[UILabel setText:](self->_primaryLabel, "setText:", self->_primaryText);
    }
    if (self->_secondaryText)
    {
      v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      secondaryLabel = self->_secondaryLabel;
      self->_secondaryLabel = v17;

      -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 1);
      -[UILabel setLineBreakMode:](self->_secondaryLabel, "setLineBreakMode:", 4);
      if (self->_style == 1)
        -[UILabel setMarqueeEnabled:](self->_secondaryLabel, "setMarqueeEnabled:", 1);
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_secondaryLabel);
      -[UILabel setText:](self->_secondaryLabel, "setText:", self->_secondaryText);
    }
  }
  if (self->_style)
  {
    __38__PKPassBannerViewController_loadView__block_invoke(self->_leadingView);
    __38__PKPassBannerViewController_loadView__block_invoke(self->_trailingView);
    __38__PKPassBannerViewController_loadView__block_invoke(self->_minimalView);
    __38__PKPassBannerViewController_loadView__block_invoke(self->_label);
  }
  else
  {
    objc_msgSend(v4, "visualStylingProviderForCategory:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = self->_primaryLabel;
    if (v21)
      objc_msgSend(v19, "automaticallyUpdateView:withStyle:", v21, 0);
    v22 = self->_secondaryLabel;
    if (v22)
      objc_msgSend(v20, "automaticallyUpdateView:withStyle:", v22, 1);
    if (v4)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__tapped_);
      objc_msgSend(v4, "addGestureRecognizer:", v23);
      v24 = self->_trailingView;
      v25 = v4;
      v26 = v25;
      if (v24 && v24->_imageView && !v24->_imageColor)
      {
        objc_msgSend(v25, "visualStylingProviderForCategory:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "automaticallyUpdateView:withStyle:", v24->_imageView, 0);

      }
    }

  }
  -[PKPassBannerViewController _updateFonts](self);

}

- (_QWORD)_platterView
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[125];
    if (!v2)
    {
      if (a1[123])
      {
        v2 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D7D3F0], "platterViewWithStyle:", *MEMORY[0x1E0D7D408]);
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = (void *)v1[125];
        v1[125] = v3;

        objc_msgSend((id)v1[125], "setMaterialGroupNameBase:", CFSTR("pass-notification"));
        v2 = (void *)v1[125];
      }
    }
    a1 = v2;
  }
  return a1;
}

void __38__PKPassBannerViewController_loadView__block_invoke(void *a1)
{
  void *v1;
  id v2;

  if (a1)
  {
    v2 = a1;
    objc_msgSend(v2, "layer");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setAllowsHitTesting:", 0);

    objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  }
}

- (double)_layoutContentViewWithBounds:(CGFloat)a3 commit:(CGFloat)a4
{
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  char v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _BOOL4 v49;
  uint64_t v50;
  unsigned __int8 v51;
  double v52;
  double v53;
  double v54;
  double v55;
  char v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  void *v69;
  _BOOL4 v70;
  double v71;
  void *v72;
  id v73;
  void (**v74)(_QWORD *__return_ptr);
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void (**v84)(_QWORD, double, double);
  void (**v85)(_QWORD, double, double);
  void *v86;
  double (**v87)(void *, _QWORD);
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  CGFloat v93;
  _BOOL4 v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  BOOL v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  CGFloat v109;
  CGFloat v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  double v122;
  BOOL v123;
  CGFloat v124;
  double x;
  CGFloat y;
  double width;
  CGFloat height;
  double v129;
  double v130;
  double v131;
  double v132;
  CGFloat v133;
  double v134;
  CGFloat v135;
  double v136;
  double v137;
  double v138;
  uint64_t v139;
  void (**v140)(CGFloat *__return_ptr, void *, _QWORD, double);
  _QWORD *v141;
  uint64_t v142;
  void (*v143)(_QWORD *, uint64_t, __int128 *, double, double, double, double);
  uint64_t v144;
  void (*v145)(_QWORD *, uint64_t, _OWORD *, __n128, __n128, __n128, __n128);
  __n128 v146;
  __n128 v147;
  __n128 v148;
  __n128 v149;
  uint64_t v150;
  void (*v151)(_QWORD *, uint64_t, __int128 *, __n128, __n128, __n128, __n128);
  __n128 v152;
  __n128 v153;
  __n128 v154;
  __n128 v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v161;
  CGFloat rect;
  CGFloat v163;
  CGFloat v164;
  double v165;
  double v166;
  double r2;
  double v168;
  double v169;
  double v170;
  _BOOL4 v171;
  int v172;
  double v173;
  CGFloat v174;
  double v175;
  CGFloat v176;
  double v177;
  CGFloat v178;
  double v179;
  CGFloat amount;
  double v181;
  double v182;
  double v183;
  CGFloat v184;
  double v185;
  double v187;
  CGFloat v189;
  double v191;
  _OWORD v193[2];
  uint64_t v194;
  __int128 v195;
  __int128 v196;
  uint64_t v197;
  CGFloat v198[2];
  __int128 v199;
  uint64_t v200;
  _QWORD v201[6];
  CGRect slice;
  id v203;
  double v204;
  BOOL v205;
  CGRect v206;
  CGRect v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  void *v211;
  CGRect v212;
  _OWORD v213[2];
  uint64_t v214;
  CGRect remainder;
  uint64_t v216;
  id v217;
  _BOOL4 v218;
  _QWORD aBlock[6];
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;

  if (!a1)
    return 0.0;
  v12 = *(_QWORD *)(a1 + 984);
  if (v12 == 1)
  {
    v32 = *(_QWORD *)(a1 + 1088);
    v33 = objc_msgSend(*(id *)(a1 + 1008), "_shouldReverseLayoutDirection");
    if (v33)
      v34 = 2;
    else
      v34 = 0x200000000;
    PKFloatRoundToPixel();
    v179 = v35;
    objc_msgSend(*(id *)(a1 + 1008), "SBUISA_systemApertureObstructedAreaLayoutGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutFrame");
    v169 = v37;
    v175 = v39;
    v177 = v38;
    v181 = v40;

    objc_msgSend(*(id *)(a1 + 1008), "SBUISA_standardInteritemPadding");
    amount = v41;
    if (v32 == 4)
      v42 = 1.0;
    else
      v42 = 0.5;
    __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke(*(void **)(a1 + 1016));
    v44 = v43;
    v46 = v45;
    __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke(*(void **)(a1 + 1024));
    v173 = v47;
    v185 = v48;
    v49 = v46 > 0.0 && v44 > 0.0;
    v50 = *(_QWORD *)(a1 + 1024);
    v191 = a3;
    v168 = v42;
    v187 = a4;
    v189 = a6;
    if (v50)
      LOBYTE(v50) = *(_QWORD *)(v50 + 432) != 0;
    if (v47 > 0.0)
      v51 = v50;
    else
      v51 = 0;
    v52 = 0.0;
    r2 = v44;
    if (v49)
      v52 = v44;
    v53 = 0.0;
    v182 = v52;
    PKFloatRoundToPixel();
    v55 = v54;
    PKFloatRoundToPixel();
    v56 = v51 & (v185 > 0.0);
    v170 = fmax(v55, 15.0);
    if (v56)
      v53 = v173;
    PKFloatRoundToPixel();
    v58 = v57;
    PKFloatRoundToPixel();
    v59 = fmax(v58, 15.0);
    v60 = v182 + v170;
    v61 = v53 + v59;
    v62 = a5;
    if (v32 != 4)
      v62 = -[PKPassBannerViewController _maximumSystemApertureWidth]((_QWORD *)a1);
    v183 = v177 + v175;
    v63 = amount;
    v64 = v62 - v60;
    if (v49)
      v65 = amount;
    else
      v65 = 0.0;
    v66 = v64 - v65 - v61;
    if ((v51 & (v185 > 0.0)) != 0)
      v67 = amount;
    else
      v67 = 0.0;
    v68 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e34_____CGSize_dd_BdB_16__0__UILabel_8l;
    *(double *)&aBlock[4] = v66 - v67;
    v69 = _Block_copy(aBlock);
    v70 = *(_QWORD *)(a1 + 984) != 1 || *(_QWORD *)(a1 + 1120) == 2;
    remainder.origin.x = v68;
    *(_QWORD *)&remainder.origin.y = 3221225472;
    *(_QWORD *)&remainder.size.width = __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_3;
    *(_QWORD *)&remainder.size.height = &unk_1E3E75F10;
    v171 = v70;
    v218 = v70;
    v73 = v69;
    v216 = a1;
    v217 = v73;
    v74 = (void (**)(_QWORD *__return_ptr))_Block_copy(&remainder);
    v214 = 0;
    memset(v213, 0, sizeof(v213));
    ((void (**)(_OWORD *__return_ptr))v74)[2](v213);
    v75 = *(double *)v213;
    v172 = v214;
    if ((_BYTE)v214)
      PKFloatRoundToPixel();
    if (a2)
    {
      v166 = v60;
      if (v32 == 4)
      {
        objc_msgSend(*(id *)(a1 + 1032), "setAlpha:", 0.0);
        objc_msgSend(*(id *)(a1 + 1016), "setAlpha:", 1.0);
        objc_msgSend(*(id *)(a1 + 1024), "setAlpha:", 1.0);
      }
      v165 = v75;
      objc_msgSend(*(id *)(a1 + 1056), "setAlpha:", (double)(v32 == 4));
      v76 = fmax(v169, v191);
      v77 = v76 - v191;
      v78 = fmax(v169 + v181, v76);
      v79 = fmax(v191 + a5, v78) - v78;
      if (v33)
        v80 = v78;
      else
        v80 = v191;
      if (v33)
        v81 = v79;
      else
        v81 = v77;
      if (v33)
        v82 = v191;
      else
        v82 = v78;
      if (v33)
        v83 = v77;
      else
        v83 = v79;
      v163 = v82;
      v164 = v83;
      v208 = MEMORY[0x1E0C809B0];
      v209 = 3221225472;
      v210 = __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_4;
      v211 = &__block_descriptor_64_e62__CGSize_dd_56__0_CGSize_dd_8_CGRect__CGPoint_dd__CGSize_dd__24l;
      v212.origin.x = v191 + 15.0;
      v212.origin.y = v187 + v179;
      v212.size.width = a5 + -30.0;
      v212.size.height = a6 - (v179 + v179);
      v84 = (void (**)(_QWORD, double, double))_Block_copy(&v208);
      v85 = v84;
      memset(&v206, 0, sizeof(v206));
      v207.origin.x = v80;
      v207.origin.y = v187;
      v207.size.width = v81;
      v207.size.height = a6;
      v161 = v61;
      if (v49)
        ((void (*)(void (**)(_QWORD, double, double), double, double, double, double, double, CGFloat))v84[2])(v84, r2, v46, v80, v187, v81, a6);
      PKFloatRoundToPixel();
      v103 = v102;
      PKFloatRoundToPixel();
      v221.origin.x = v80;
      v221.origin.y = v187;
      v221.size.width = v81;
      v221.size.height = a6;
      CGRectDivide(v221, &v206, &v207, fmax(v103, 15.0), (CGRectEdge)v34);
      PKSizeAlignedInRect();
      v108 = v104;
      v109 = v105;
      v110 = v106;
      v111 = v107;
      if (v32 == 4)
        objc_msgSend(*(id *)(a1 + 1016), "setFrame:", v104, v105, v106, v107);
      rect = v111;
      v184 = v108;
      v207.origin.x = v163;
      v207.origin.y = v187;
      v207.size.width = v164;
      v207.size.height = v189;
      if ((v56 & 1) != 0)
        v85[2](v85, v173, v185);
      PKFloatRoundToPixel();
      v113 = v112;
      PKFloatRoundToPixel();
      CGRectDivide(v207, &v206, &v207, fmax(v113, 15.0), HIDWORD(v34));
      PKSizeAlignedInRect();
      if (v32 == 4)
      {
        v124 = v116;
        v176 = v115;
        v178 = v114;
        v174 = v117;
        objc_msgSend(*(id *)(a1 + 1024), "setFrame:");
        v222.origin.x = v191;
        v222.size.width = a5;
        v207.origin.x = v191;
        v207.origin.y = v187;
        v207.size.width = a5;
        v207.size.height = v189;
        v222.origin.y = v187;
        v222.size.height = v189;
        v223 = CGRectStandardize(v222);
        x = v223.origin.x;
        y = v223.origin.y;
        width = v223.size.width;
        height = v223.size.height;
        v231.origin.x = v184;
        v231.origin.y = v109;
        v231.size.width = v110;
        v231.size.height = rect;
        v224 = CGRectIntersection(v223, v231);
        v129 = v224.origin.x;
        v130 = v224.size.width;
        v123 = 0;
        if (!CGRectIsNull(v224))
        {
          if ((_DWORD)v34)
          {
            width = fmax(v129 - x, 0.0);
          }
          else
          {
            v131 = x + width;
            x = fmin(v129 + v130, x + width);
            width = v131 - x;
          }
        }
        v122 = v168;
        v207.origin.x = x;
        v207.origin.y = y;
        v207.size.width = width;
        v207.size.height = height;
        if (v49)
        {
          v225.origin.x = x;
          v225.origin.y = y;
          v225.size.width = width;
          v225.size.height = height;
          CGRectDivide(v225, &v206, &v207, amount, (CGRectEdge)v34);
          x = v207.origin.x;
          y = v207.origin.y;
          width = v207.size.width;
          height = v207.size.height;
        }
        v226.origin.x = x;
        v226.origin.y = y;
        v226.size.width = width;
        v226.size.height = height;
        v227 = CGRectStandardize(v226);
        v132 = v227.origin.x;
        v133 = v227.origin.y;
        v134 = v227.size.width;
        v135 = v227.size.height;
        v232.origin.y = v176;
        v232.origin.x = v178;
        v232.size.width = v124;
        v232.size.height = v174;
        v228 = CGRectIntersection(v227, v232);
        v136 = v228.origin.x;
        v137 = v228.size.width;
        if (!CGRectIsNull(v228))
        {
          if (HIDWORD(v34))
          {
            v134 = fmax(v136 - v132, 0.0);
          }
          else
          {
            v138 = v132 + v134;
            v132 = fmin(v136 + v137, v132 + v134);
            v134 = v138 - v132;
          }
        }
        v207.origin.x = v132;
        v207.origin.y = v133;
        v207.size.width = v134;
        v207.size.height = v135;
        v63 = amount;
        v61 = v161;
        if ((v56 & 1) != 0)
        {
          v229.origin.x = v132;
          v229.origin.y = v133;
          v229.size.width = v134;
          v229.size.height = v135;
          CGRectDivide(v229, &v206, &v207, amount, HIDWORD(v34));
          v132 = v207.origin.x;
          v133 = v207.origin.y;
          v134 = v207.size.width;
          v135 = v207.size.height;
        }
        v230.origin.x = v132;
        v230.origin.y = v133;
        v230.size.width = v134;
        v230.size.height = v135;
        CGRectDivide(v230, &v206, &v207, v183, CGRectMinYEdge);
      }
      else
      {
        PKSizeRoundToPixel();
        PKSizeAlignedInRect();
        v207.origin.x = v118;
        v207.origin.y = v119;
        v207.size.width = v120;
        v207.size.height = v121;
        v63 = amount;
        v61 = v161;
        v122 = v168;
        v123 = v32 != 4;
      }
      v139 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&slice.origin.x = MEMORY[0x1E0C809B0];
      *(_QWORD *)&slice.origin.y = 3221225472;
      *(_QWORD *)&slice.size.width = __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_5;
      *(_QWORD *)&slice.size.height = &unk_1E3E75F58;
      v203 = v73;
      v204 = v122;
      v205 = v123;
      v140 = (void (**)(CGFloat *__return_ptr, void *, _QWORD, double))_Block_copy(&slice);
      v201[0] = v139;
      v201[1] = 3221225472;
      v201[2] = __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_6;
      v201[3] = &__block_descriptor_48_e71_v88__0__UILabel_8____CGSize_dd_BdB_16_CGRect__CGPoint_dd__CGSize_dd__56l;
      v201[5] = v34;
      *(double *)&v201[4] = v122;
      v141 = _Block_copy(v201);
      v60 = v166;
      v75 = v165;
      v200 = 0;
      *(_OWORD *)v198 = 0u;
      v199 = 0u;
      if (v171)
      {
        v140[2](v198, v140, *(_QWORD *)(a1 + 1064), v207.size.width);
        CGRectDivide(v207, &v206, &v207, v198[1], CGRectMinYEdge);
        v142 = *(_QWORD *)(a1 + 1064);
        v143 = (void (*)(_QWORD *, uint64_t, __int128 *, double, double, double, double))v141[2];
        v195 = *(_OWORD *)v198;
        v196 = v199;
        v197 = v200;
        v143(v141, v142, &v195, v206.origin.x, v206.origin.y, v206.size.width, v206.size.height);
        v197 = 0;
        v195 = 0u;
        v196 = 0u;
        v140[2]((CGFloat *)&v195, v140, *(_QWORD *)(a1 + 1072), v207.size.width);
        v144 = *(_QWORD *)(a1 + 1072);
        v145 = (void (*)(_QWORD *, uint64_t, _OWORD *, __n128, __n128, __n128, __n128))v141[2];
        v146.n128_u64[1] = *((_QWORD *)&v195 + 1);
        v147.n128_u64[1] = *((_QWORD *)&v196 + 1);
        v193[0] = v195;
        v193[1] = v196;
        v194 = v197;
        v146.n128_u64[0] = *(_QWORD *)&v207.origin.x;
        v147.n128_u64[0] = *(_QWORD *)&v207.origin.y;
        v148.n128_u64[0] = *(_QWORD *)&v207.size.width;
        v149.n128_u64[0] = *(_QWORD *)&v207.size.height;
        v145(v141, v144, v193, v146, v147, v148, v149);
      }
      else
      {
        v140[2](v198, v140, *(_QWORD *)(a1 + 1056), v207.size.width);
        v150 = *(_QWORD *)(a1 + 1056);
        v151 = (void (*)(_QWORD *, uint64_t, __int128 *, __n128, __n128, __n128, __n128))v141[2];
        v152.n128_f64[1] = v198[1];
        v153.n128_u64[1] = *((_QWORD *)&v199 + 1);
        v195 = *(_OWORD *)v198;
        v196 = v199;
        v197 = v200;
        v152.n128_u64[0] = *(_QWORD *)&v207.origin.x;
        v153.n128_u64[0] = *(_QWORD *)&v207.origin.y;
        v154.n128_u64[0] = *(_QWORD *)&v207.size.width;
        v155.n128_u64[0] = *(_QWORD *)&v207.size.height;
        v151(v141, v150, &v195, v152, v153, v154, v155);
      }

    }
    v156 = -0.0;
    if ((v56 & 1) != 0)
      v157 = v63;
    else
      v157 = -0.0;
    if (v49)
      v158 = v63;
    else
      v158 = -0.0;
    v159 = v158 + v60;
    if (v172)
      v156 = v75;
    return fmax(v61 + v157 + v159 + v156, v181 + fmax(v60, v61) * 2.0);
  }
  else
  {
    if (!v12)
    {
      if (objc_msgSend(*(id *)(a1 + 1008), "_shouldReverseLayoutDirection"))
        v13 = 2;
      else
        v13 = 0x200000000;
      v15 = *MEMORY[0x1E0C9D820];
      v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      objc_msgSend(*(id *)(a1 + 1016), "sizeThatFits:", *MEMORY[0x1E0C9D820], v14);
      v17 = v16;
      v19 = v16 > 0.0 && v18 > 0.0;
      PKFloatRoundToPixel();
      v21 = v20;
      PKFloatRoundToPixel();
      v22 = fmax(v21, 20.0);
      objc_msgSend(*(id *)(a1 + 1024), "sizeThatFits:", v15, v14);
      v25 = *(_QWORD *)(a1 + 1024);
      if (v25)
        LOBYTE(v25) = *(_QWORD *)(v25 + 432) != 0;
      if (v23 <= 0.0)
        LOBYTE(v25) = 0;
      v26 = v25 & (v24 > 0.0);
      v27 = v23;
      PKFloatRoundToPixel();
      v29 = v28;
      PKFloatRoundToPixel();
      memset(&slice, 0, sizeof(slice));
      v220.origin.x = a3;
      v30 = a5;
      v220.origin.y = a4;
      v220.size.height = a6;
      remainder.origin.x = a3;
      remainder.origin.y = a4;
      remainder.size.width = a5;
      remainder.size.height = a6;
      v220.size.width = a5;
      CGRectDivide(v220, &slice, &remainder, v22, (CGRectEdge)v13);
      if (v19)
      {
        v31 = 20.0;
        CGRectDivide(remainder, &slice, &remainder, v17, (CGRectEdge)v13);
      }
      else
      {
        slice.origin = remainder.origin;
        slice.size.width = 0.0;
        slice.size.height = remainder.size.height;
        v31 = 20.0;
      }
      v71 = fmax(v29, v31);
      if (a2)
      {
        v72 = *(void **)(a1 + 1016);
        PKSizeAlignedInRect();
        objc_msgSend(v72, "setFrame:");
      }
      CGRectDivide(remainder, &slice, &remainder, v71, HIDWORD(v13));
      if ((v26 & 1) != 0)
      {
        CGRectDivide(remainder, &slice, &remainder, v27, HIDWORD(v13));
        if (!a2)
        {
LABEL_70:
          if (v19)
          {
            CGRectDivide(remainder, &slice, &remainder, 16.0, (CGRectEdge)v13);
            if ((v26 & 1) == 0)
            {
LABEL_73:
              v208 = MEMORY[0x1E0C809B0];
              v209 = 3221225472;
              v210 = __72__PKPassBannerViewController__layoutLegacyContentViewWithBounds_commit___block_invoke;
              v211 = &__block_descriptor_64_e27__CGSize_dd_16__0__UILabel_8l;
              v212 = remainder;
              v87 = (double (**)(void *, _QWORD))_Block_copy(&v208);
              v88 = v87[2](v87, *(_QWORD *)(a1 + 1064));
              v90 = v89;
              v91 = v87[2](v87, *(_QWORD *)(a1 + 1072));
              v93 = v92;
              v94 = v91 > 0.0 && v92 > 0.0;
              PKSizeAlignedInRect();
              remainder.origin.x = v95;
              remainder.origin.y = v96;
              remainder.size.width = v97;
              remainder.size.height = v98;
              if (v94)
              {
                CGRectDivide(*(CGRect *)&v95, &slice, &remainder, v93, CGRectMinYEdge);
              }
              else
              {
                slice.origin = remainder.origin;
                slice.size.width = v97;
                slice.size.height = 0.0;
              }
              v99 = v88 > 0.0 && v90 > 0.0 && v94;
              if (a2)
              {
                v100 = *(void **)(a1 + 1072);
                PKSizeAlignedInRect();
                objc_msgSend(v100, "setFrame:");
                if (!v99)
                {
LABEL_80:
                  if (v88 > 0.0 && v90 > 0.0)
                    goto LABEL_81;
                  goto LABEL_85;
                }
              }
              else if (v88 <= 0.0 || v90 <= 0.0 || !v94)
              {
                goto LABEL_80;
              }
              CGRectDivide(remainder, &slice, &remainder, 0.0, CGRectMinYEdge);
              if (v88 > 0.0 && v90 > 0.0)
              {
LABEL_81:
                CGRectDivide(remainder, &slice, &remainder, v90, CGRectMinYEdge);
                if (!a2)
                  goto LABEL_87;
                goto LABEL_86;
              }
LABEL_85:
              slice.origin = remainder.origin;
              slice.size.width = remainder.size.width;
              slice.size.height = 0.0;
              if (!a2)
              {
LABEL_87:

                return v30;
              }
LABEL_86:
              v101 = *(void **)(a1 + 1064);
              PKSizeAlignedInRect();
              objc_msgSend(v101, "setFrame:");
              goto LABEL_87;
            }
          }
          else if ((v26 & 1) == 0)
          {
            goto LABEL_73;
          }
          CGRectDivide(remainder, &slice, &remainder, 8.0, HIDWORD(v13));
          goto LABEL_73;
        }
      }
      else
      {
        slice.origin = remainder.origin;
        slice.size.width = 0.0;
        slice.size.height = remainder.size.height;
        if (!a2)
          goto LABEL_70;
      }
      v86 = *(void **)(a1 + 1024);
      PKSizeAlignedInRect();
      objc_msgSend(v86, "setFrame:");
      goto LABEL_70;
    }
    return *MEMORY[0x1E0C9D820];
  }
}

void *__72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke(void *result)
{
  if (result)
  {
    objc_msgSend(result, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    return (void *)PKSizeRoundToPixel();
  }
  return result;
}

- (double)_maximumSystemApertureWidth
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (!a1)
    return 0.0;
  if (a1[123] != 1)
  {
    __break(1u);
    return 0.0;
  }
  objc_msgSend(a1, "viewIfLoaded");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && (objc_msgSend(v1, "window"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    objc_msgSend(v3, "bounds");
    v6 = v5;

  }
  else
  {
    v6 = 1.79769313e308;
  }

  return v6;
}

void __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_2(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
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
  char v22;
  id v23;

  v5 = a2;
  if (v5)
  {
    v23 = v5;
    objc_msgSend(v5, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v8 = v6;
    v9 = fmin(v6, *(double *)(a1 + 32));
    if (v9 <= 0.0 || (v10 = v7, v7 <= 0.0))
    {
      v22 = 0;
      *(_OWORD *)a3 = *MEMORY[0x1E0C9D820];
      *(_BYTE *)(a3 + 16) = 0;
      *(_QWORD *)(a3 + 24) = 0;
      v5 = v23;
    }
    else
    {
      v11 = v9 < v6;
      objc_msgSend(v23, "bounds");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      objc_msgSend(v23, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v8, v10);
      objc_msgSend(v23, "_tightBoundingRectOfFirstLine");
      v21 = v20;
      objc_msgSend(v23, "setBounds:", v13, v15, v17, v19);
      v5 = v23;
      *(double *)a3 = v9;
      *(double *)(a3 + 8) = v10;
      *(_BYTE *)(a3 + 16) = v11;
      *(double *)(a3 + 24) = -v21;
      v22 = 1;
    }
  }
  else
  {
    v22 = 0;
    *(_OWORD *)a3 = *MEMORY[0x1E0C9D820];
    *(_BYTE *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
  }
  *(_BYTE *)(a3 + 32) = v22;

}

_QWORD *__72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *result;
  double v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = *MEMORY[0x1E0C9D820];
  if (!*(_DWORD *)(a1 + 48))
  {
    result = (*(_QWORD *(**)(__int128 *__return_ptr))(*(_QWORD *)(a1 + 40) + 16))(&v10);
    v6 = v11;
    *(_OWORD *)a2 = v10;
    *(_OWORD *)(a2 + 16) = v6;
    *(_QWORD *)(a2 + 32) = v12;
    return result;
  }
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)(a1 + 40) + 16))(&v10);
  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  result = (*(_QWORD *(**)(__int128 *__return_ptr))(*(_QWORD *)(a1 + 40) + 16))(&v7);
  if ((_BYTE)v12)
  {
    *(_OWORD *)a2 = v10;
    *(_BYTE *)(a2 + 16) = v11;
    *(_QWORD *)(a2 + 24) = *((_QWORD *)&v11 + 1);
    *(_BYTE *)(a2 + 32) = 1;
    if (!(_BYTE)v9)
      return result;
    *(_BYTE *)(a2 + 16) = v8;
    v5 = *(double *)(a2 + 8) + *((double *)&v7 + 1) + *((double *)&v8 + 1);
    *(double *)a2 = fmax(*(double *)a2, *(double *)&v7);
    *(double *)(a2 + 8) = v5;
  }
  else
  {
    if (!(_BYTE)v9)
      return result;
    *(_BYTE *)(a2 + 16) = v8;
    *(_OWORD *)a2 = v7;
    *(_QWORD *)(a2 + 24) = *((_QWORD *)&v11 + 1);
  }
  *(_BYTE *)(a2 + 32) = 1;
  return result;
}

uint64_t __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_4(CGRect *a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGRect v8;
  CGRect v9;

  v8.origin.x = a4;
  v8.origin.y = a5;
  v8.size.width = a6;
  v8.size.height = a7;
  v9 = CGRectIntersection(v8, a1[1]);
  CGRectIsNull(v9);
  return PKSizeAspectFit();
}

_QWORD *__72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_5@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  _QWORD *result;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  result = (*(_QWORD *(**)(__int128 *__return_ptr))(*(_QWORD *)(a1 + 32) + 16))(&v15);
  if (a2 && (_BYTE)v17)
  {
    v9 = *(double *)(a1 + 40);
    *(double *)&v15 = v9 * *(double *)&v15;
    *((double *)&v15 + 1) = v9 * *((double *)&v15 + 1);
    *((double *)&v16 + 1) = v9 * *((double *)&v16 + 1);
    if (*(double *)&v15 > a4)
    {
      *(double *)&v15 = a4;
      LOBYTE(v16) = 1;
    }
    PKSizeRoundToPixel();
    *(_QWORD *)&v15 = v10;
    *((_QWORD *)&v15 + 1) = v11;
    result = (_QWORD *)PKFloatRoundToPixel();
    *((_QWORD *)&v16 + 1) = v12;
    v13 = v16;
    if ((_BYTE)v16)
      v13 = *(_BYTE *)(a1 + 48) == 0;
    LOBYTE(v16) = v13;
    *(_QWORD *)(a3 + 32) = v17;
    v14 = v16;
    *(_OWORD *)a3 = v15;
    *(_OWORD *)(a3 + 16) = v14;
  }
  else
  {
    *(_OWORD *)a3 = *MEMORY[0x1E0C9D820];
    *(_BYTE *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    *(_BYTE *)(a3 + 32) = 0;
  }
  return result;
}

void __72__PKPassBannerViewController__layoutModernContentViewWithBounds_commit___block_invoke_6(uint64_t a1, void *a2, double *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
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
  CATransform3D v25;
  CGRect slice;
  CGRect remainder;
  CGRect v28;

  remainder.origin.x = a4;
  remainder.origin.y = a5;
  remainder.size.width = a6;
  remainder.size.height = a7;
  v13 = a2;
  memset(&slice, 0, sizeof(slice));
  v28.origin.x = a4;
  v28.origin.y = a5;
  v28.size.width = a6;
  v28.size.height = a7;
  CGRectDivide(v28, &slice, &remainder, *a3, *(CGRectEdge *)(a1 + 40));
  v14 = a3[3];
  slice.origin.x = slice.origin.x + 0.0;
  slice.origin.y = v14 + slice.origin.y;
  slice.size.height = slice.size.height - (v14 + 0.0);
  CATransform3DMakeScale(&v25, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 32), 1.0);
  objc_msgSend(v13, "setTransform3D:", &v25);
  objc_msgSend(v13, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *a3, a3[1]);
  PKSizeAlignedInRect();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v13, "anchorPoint");
  objc_msgSend(v13, "setCenter:", v16 + v23 * v20, v18 + v24 * v22);
  if (objc_msgSend(v13, "marqueeRunning") != (*((_BYTE *)a3 + 16) != 0))
    objc_msgSend(v13, "setMarqueeRunning:", *((unsigned __int8 *)a3 + 16) != 0);

}

double __72__PKPassBannerViewController__layoutLegacyContentViewWithBounds_commit___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  if (!a2)
    return *MEMORY[0x1E0C9D820];
  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  return fmin(v3, *(double *)(a1 + 48));
}

- (void)viewWillLayoutSubviews
{
  UIView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  PLPlatterView *platter;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPassBannerViewController;
  -[PKPassBannerViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  -[PKPassBannerViewController view](self, "view");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](v3, "bounds");
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  platter = self->_platter;
  if (platter)
    -[PLPlatterView setFrame:](platter, "setFrame:", v4, v5, v6, v7);
  v13 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v3 == self->_contentView)
  {
    v13 = v8;
    v14 = v9;
  }
  -[PKPassBannerViewController _layoutContentViewWithBounds:commit:]((uint64_t)self, 1, v13, v14, v10, v11);

}

void __47__PKPassBannerViewController__startRevokeTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[PKPassBannerViewController _revoke]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

- (void)_revoke
{
  id WeakRetained;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 971))
    {
      -[PKPassBannerViewController _revoked](a1);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1080));
      objc_msgSend(WeakRetained, "revoke");

    }
  }
}

- (void)_revoked
{
  NSObject *v2;
  void *v3;

  if (a1 && !*(_BYTE *)(a1 + 971))
  {
    *(_BYTE *)(a1 + 971) = 1;
    v2 = *(NSObject **)(a1 + 976);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 976);
      *(_QWORD *)(a1 + 976) = 0;

    }
  }
}

- (void)_appeared
{
  SystemSoundID v2;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 970))
    {
      *(_BYTE *)(a1 + 970) = 1;
      if (!*(_BYTE *)(a1 + 971))
      {
        if (*(_BYTE *)(a1 + 968))
        {
          v2 = 1394;
          if (objc_msgSend(*(id *)(a1 + 1096), "passType") == 1)
          {
            if (objc_msgSend(*(id *)(a1 + 1096), "isAccessPass"))
              v2 = 1163;
            else
              v2 = 1394;
          }
        }
        else
        {
          v2 = 1400;
        }
        AudioServicesPlaySystemSound(v2);
      }
    }
  }
}

- (void)_tapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  -[PKPass passURL](self->_pass, "passURL", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D22D28]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D88]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D22D78]);
    v5 = (void *)*MEMORY[0x1E0D6B590];
    objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKOpenApplication(v5, v6);

  }
  -[PKPassBannerViewController _revoke]((uint64_t)self);

}

void __57__PKPassBannerViewController__updatePreferredContentSize__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  double v3;
  _BYTE *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !WeakRetained[971])
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "loadViewIfNeeded");
    v3 = -[PKPassBannerViewController _maximumSystemApertureWidth](*(_QWORD **)(a1 + 32));
    objc_msgSend(v4, "setPreferredContentSize:", -[PKPassBannerViewController _layoutContentViewWithBounds:commit:]((uint64_t)v4, 0, *MEMORY[0x1E0C9D538], *(CGFloat *)(MEMORY[0x1E0C9D538] + 8), v3, 1.79769313e308));
    WeakRetained = v4;
    v4[992] = 0;
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPresentable:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_storeWeak((id *)&self->_presentable, v5);
  v4 = v5;
  if (v5 && self->_revoked)
  {
    objc_msgSend(v5, "revoke");
    v4 = v5;
  }

}

- (UIEdgeInsets)bannerContentOutsets
{
  void *v2;
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
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[PKPassBannerViewController _platterView](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "shadowOutsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = *MEMORY[0x1E0DC49E8];
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  double v5;
  double v6;
  CGFloat height;
  CGFloat width;
  CGSize result;

  if (self->_style)
  {
    -[PKPassBannerViewController preferredContentSize](self, "preferredContentSize", a3.width, a3.height, a4.width, a4.height);
  }
  else
  {
    height = a3.height;
    width = a3.width;
    -[PKPassBannerViewController loadViewIfNeeded](self, "loadViewIfNeeded", a3.width, a3.height, a4.width, a4.height);
    v5 = -[PKPassBannerViewController _layoutContentViewWithBounds:commit:]((uint64_t)self, 0, *MEMORY[0x1E0C9D538], *(CGFloat *)(MEMORY[0x1E0C9D538] + 8), width, height);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  if (!self->_style)
    SBSUndimScreen();
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  NSObject *revokeTimer;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (!self->_style)
  {
    if (!self->_revoked)
    {
      revokeTimer = self->_revokeTimer;
      if (revokeTimer)
      {
        dispatch_source_cancel(revokeTimer);
        v5 = self->_revokeTimer;
        self->_revokeTimer = 0;

      }
      objc_initWeak(&location, self);
      v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      v7 = self->_revokeTimer;
      self->_revokeTimer = v6;

      v8 = self->_revokeTimer;
      v9 = dispatch_time(0, 6000000000);
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      v10 = self->_revokeTimer;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __47__PKPassBannerViewController__startRevokeTimer__block_invoke;
      v11[3] = &unk_1E3E61310;
      objc_copyWeak(&v12, &location);
      dispatch_source_set_event_handler(v10, v11);
      dispatch_resume((dispatch_object_t)self->_revokeTimer);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    -[PKPassBannerViewController _appeared]((uint64_t)self);
  }
}

- (int64_t)contentRole
{
  return 1;
}

- (int64_t)preferredLayoutMode
{
  return 3;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (NSString)associatedAppBundleIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0D6B590];
}

- (NSURL)launchURL
{
  return -[PKPass passURL](self->_pass, "passURL");
}

- (unint64_t)presentationBehaviors
{
  if (self->_walletForeground)
    return 74;
  else
    return 72;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id location;

  if (self->_activeLayoutMode != a3)
  {
    -[PKPassBannerViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      objc_msgSend(v5, "layoutIfNeeded");
      v5 = v7;
    }
    self->_activeLayoutMode = a3;
    if (a3 == 4)
    {
      if (self->_style != 1)
      {
        __break(1u);
        return;
      }
      if (!self->_updatingPreferredContentSize)
      {
        self->_updatingPreferredContentSize = 1;
        objc_initWeak(&location, self);
        -[PKPassBannerViewController systemApertureElementContext](self, "systemApertureElementContext");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __57__PKPassBannerViewController__updatePreferredContentSize__block_invoke;
        v8[3] = &unk_1E3E61B68;
        objc_copyWeak(&v9, &location);
        v8[4] = self;
        objc_msgSend(v6, "setElementNeedsUpdateWithCoordinatedAnimations:", v8);

        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
        v5 = v7;
      }
    }
    if (v5)
    {
      objc_msgSend(v7, "setNeedsLayout");
      v5 = v7;
    }

  }
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  id v4;
  PKPassBannerMinimalView *minimalView;
  id v6;

  v4 = a3;
  if (!*(_WORD *)&self->_appeared)
  {
    minimalView = self->_minimalView;
    v6 = v4;
    -[UIView SBUISA_standardInteritemPadding](self->_contentView, "SBUISA_standardInteritemPadding");
    -[PKPassBannerMinimalView _setInteritemPadding:](minimalView, "_setInteritemPadding:");
    -[PKPassBannerViewController _appeared]((uint64_t)self);
    v4 = v6;
  }

}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)self->_leadingView;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)self->_trailingView;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)self->_minimalView;
}

- (void)passBannerMinimalViewDidChangeSize:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (self->_style == 1 && self->_activeLayoutMode != 4)
  {
    v6 = v4;
    -[PKPassBannerViewController systemApertureElementContext](self, "systemApertureElementContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setElementNeedsUpdate");

    v4 = v6;
  }

}

- (PKBannerViewControllerPresentable)presentable
{
  return (PKBannerViewControllerPresentable *)objc_loadWeakRetained((id *)&self->_presentable);
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (PKPass)pass
{
  return self->_pass;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (unint64_t)preferredLabelAxis
{
  return self->_preferredLabelAxis;
}

- (PKPassBannerTrailingViewConfiguration)trailingViewConfiguration
{
  return self->_trailingViewConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingViewConfiguration, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_presentable);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_minimalView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_platter, 0);
  objc_storeStrong((id *)&self->_revokeTimer, 0);
}

@end
