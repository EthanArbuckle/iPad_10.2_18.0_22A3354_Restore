@implementation VUIOfferView

- (void)prepareForCellReuse
{
  uint64_t v3;
  uint64_t v4;

  __35__VUIOfferView_prepareForCellReuse__block_invoke((uint64_t)self, self->_imageView);
  __35__VUIOfferView_prepareForCellReuse__block_invoke(v3, self->_logoView);
  __35__VUIOfferView_prepareForCellReuse__block_invoke(v4, self->_appIconView);
  -[VUILabel setVuiText:](self->_channelNameLabel, "setVuiText:", 0);
  -[VUILabel setVuiText:](self->_titleLabel, "setVuiText:", 0);
  -[VUILabel setVuiText:](self->_subtitleLabel, "setVuiText:", 0);
  -[VUILabel setVuiText:](self->_textLabel, "setVuiText:", 0);
}

void __35__VUIOfferView_prepareForCellReuse__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "setImage:", 0);

}

- (void)setChannelImageBackgroundView:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  -[VUIOfferView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_channelImageBackgroundView);
  if (self->_channelImageBackgroundView != v5)
    objc_storeStrong((id *)&self->_channelImageBackgroundView, a3);
  -[VUIOfferView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setChannelNameLabel:(id)a3
{
  VUILabel *v5;

  v5 = (VUILabel *)a3;
  -[VUIOfferView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_channelNameLabel);
  if (self->_channelNameLabel != v5)
    objc_storeStrong((id *)&self->_channelNameLabel, a3);
  -[VUIOfferView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setTitleLabel:(id)a3
{
  VUILabel *v5;

  v5 = (VUILabel *)a3;
  -[VUIOfferView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_titleLabel);
  if (self->_titleLabel != v5)
    objc_storeStrong((id *)&self->_titleLabel, a3);
  -[VUIOfferView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setSubtitleLabel:(id)a3
{
  VUILabel *v5;

  v5 = (VUILabel *)a3;
  -[VUIOfferView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_subtitleLabel);
  if (self->_subtitleLabel != v5)
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
  -[VUIOfferView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setTextLabel:(id)a3
{
  VUILabel *v5;

  v5 = (VUILabel *)a3;
  -[VUIOfferView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_textLabel);
  if (self->_textLabel != v5)
    objc_storeStrong((id *)&self->_textLabel, a3);
  -[VUIOfferView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setImageView:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  -[VUIOfferView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_imageView);
  if (self->_imageView != v5)
    objc_storeStrong((id *)&self->_imageView, a3);
  -[VUIOfferView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setLogoView:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  -[VUIOfferView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_logoView);
  if (self->_logoView != v5)
    objc_storeStrong((id *)&self->_logoView, a3);
  -[VUIOfferView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setAppIconView:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  -[VUIOfferView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_appIconView);
  if (self->_appIconView != v5)
    objc_storeStrong((id *)&self->_appIconView, a3);
  -[VUIOfferView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setVersionsButton:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  -[VUIOfferView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_versionsButton);
  if (self->_versionsButton != v5)
    objc_storeStrong((id *)&self->_versionsButton, a3);
  -[VUIOfferView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIOfferView;
  -[VUIOfferView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[VUILabel setSemanticContentAttribute:](self->_textLabel, "setSemanticContentAttribute:", a3);
  -[VUILabel setSemanticContentAttribute:](self->_subtitleLabel, "setSemanticContentAttribute:", a3);
  -[VUILabel setSemanticContentAttribute:](self->_titleLabel, "setSemanticContentAttribute:", a3);
  -[VUILabel setSemanticContentAttribute:](self->_channelNameLabel, "setSemanticContentAttribute:", a3);
  -[UIView setSemanticContentAttribute:](self->_versionsButton, "setSemanticContentAttribute:", a3);
}

- (BOOL)_shouldDisplaySeparator
{
  return self->_channelNameLabel || self->_imageView || self->_logoView || self->_appIconView;
}

- (double)_chinHeightForSize:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  VUILabel *titleLabel;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  VUILabel *v16;
  VUILabel *textLabel;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  VUILabel *v24;
  double v25;
  double v26;
  VUILabel *v27;
  VUILabel *v28;
  VUILabel *subtitleLabel;
  void *v30;
  uint64_t v31;
  void *v32;
  double secondLineBaselineMargin;
  double v34;
  double v35;
  double v36;
  VUILabel *v37;
  VUILabel *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  char isKindOfClass;
  double v45;
  double v46;
  double v47;
  UIView *v48;
  double v49;
  double v50;

  width = a3.width;
  -[VUIOfferView padding](self, "padding", a3.width, a3.height);
  v7 = width - v5 - v6;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UIView vui_sizeThatFits:](titleLabel, "vui_sizeThatFits:", v7, 0.0);
    -[VUILabel textLayout](self->_titleLabel, "textLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "margin");
    v11 = v10;

    -[VUILabel topMarginWithBaselineMargin:](self->_titleLabel, "topMarginWithBaselineMargin:", v11);
    v13 = v12;
    VUIRoundValue();
    v15 = v13 + v14 + 0.0;
    v16 = self->_titleLabel;
  }
  else
  {
    v16 = 0;
    v15 = 0.0;
  }
  textLabel = self->_textLabel;
  if (textLabel)
  {
    -[VUILabel textLayout](textLabel, "textLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "margin");
    v20 = v19;

    -[UIView vui_sizeThatFits:](self->_textLabel, "vui_sizeThatFits:", v7, 0.0);
    -[VUILabel topMarginToLabel:withBaselineMargin:](self->_textLabel, "topMarginToLabel:withBaselineMargin:", v16, v20);
    v22 = v21;
    VUIRoundValue();
    v15 = v15 + v22 + v23;
    v24 = self->_textLabel;

    v16 = v24;
  }
  -[VUIOfferView padding](self, "padding");
  v26 = v25;
  v27 = self->_titleLabel;
  if (v27)
    v28 = v27;
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    -[VUILabel vuiText](subtitleLabel, "vuiText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "length");

    if (v31)
    {
      -[UIView vui_sizeThatFits:](self->_subtitleLabel, "vui_sizeThatFits:", v7, 0.0);
      -[VUILabel textLayout](self->_subtitleLabel, "textLayout");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "margin");
      if (!self->_textLabel)
        secondLineBaselineMargin = self->_secondLineBaselineMargin;
      -[VUILabel topMarginToLabel:withBaselineMargin:](self->_subtitleLabel, "topMarginToLabel:withBaselineMargin:", v16, secondLineBaselineMargin);
      v35 = v34;
      VUIRoundValue();
      v15 = v15 + v35 + v36;
      v37 = self->_subtitleLabel;

      v38 = self->_subtitleLabel;
      v27 = v38;
      v16 = v37;
    }
  }
  if (self->_versionsButton)
  {
    objc_opt_class();
    v39 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIView textContentView](self->_versionsButton, "textContentView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v41 = v40;
        objc_msgSend(v40, "textLayout");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "margin");
        v39 = v43;

      }
    }
    if (v16)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v45 = 0.0;
      if ((isKindOfClass & 1) != 0)
        -[UIView topMarginToLabel:withBaselineMargin:](self->_versionsButton, "topMarginToLabel:withBaselineMargin:", v16, v39);
    }
    else
    {
      -[UIView topMarginWithBaselineMargin:](self->_versionsButton, "topMarginWithBaselineMargin:", v39);
    }
    v46 = v15 + v45;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIView vui_sizeThatFits:](self->_versionsButton, "vui_sizeThatFits:", v7, 0.0);
    VUIRoundValue();
    v15 = v46 + v47;
    v48 = self->_versionsButton;

    v27 = (VUILabel *)v48;
  }
  -[VUILabel bottomMarginWithBaselineMargin:](v27, "bottomMarginWithBaselineMargin:", v26);
  v50 = v15 + v49;

  return v50;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v4;
  double v5;
  CGSize result;

  if (a4)
  {
    -[VUIOfferView computeSizeThatFits:](self, "computeSizeThatFits:", a3.width, a3.height);
  }
  else
  {
    -[VUIOfferView layoutOfferSubviewsWithSize:](self, "layoutOfferSubviewsWithSize:", a3.width, a3.height);
    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutOfferSubviewsWithSize:(CGSize)a3
{
  double width;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *channelImageBackgroundView;
  UIView *v14;
  void *v15;
  double v16;
  VUILabel *channelNameLabel;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  UIView *imageView;
  UIView *appIconView;
  UIView *v26;
  void *v27;
  UIView *v28;
  UIView *logoView;
  double v30;
  double v31;
  VUISeparatorView *separatorView;
  VUISeparatorView *v33;
  VUISeparatorView *v34;
  VUISeparatorView *v35;
  VUILabel *titleLabel;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  VUILabel *v46;
  VUILabel *textLabel;
  void *v48;
  uint64_t v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  VUILabel *v57;
  VUILabel *subtitleLabel;
  void *v59;
  uint64_t v60;
  void *v61;
  double v62;
  double secondLineBaselineMargin;
  VUILabel *v64;
  double v65;
  double v66;
  VUILabel *v67;
  double v68;
  double v69;
  double v70;
  VUILabel *v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  char isKindOfClass;
  double v80;
  double v81;
  UIView *versionsButton;
  double v83;
  double v84;
  double v85;
  VUILabel *v86;
  VUILabel *v87;
  VUILabel *v88;

  width = a3.width;
  v5 = -[VUIOfferView vuiIsRTL](self, "vuiIsRTL", a3.width, a3.height);
  -[VUIOfferView padding](self, "padding");
  v7 = v6;
  v9 = v8;
  v10 = width - v6;
  -[VUIOfferView topPartAspectRatio](self, "topPartAspectRatio");
  VUIRoundValue();
  v12 = v11;
  if (!self->_imageView)
  {
    channelImageBackgroundView = self->_channelImageBackgroundView;
    if (channelImageBackgroundView)
    {
      -[UIView setFrame:](channelImageBackgroundView, "setFrame:", 0.0, 0.0, width, v11);
      v14 = self->_channelImageBackgroundView;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setVuiBackgroundColor:](v14, "setVuiBackgroundColor:", v15);

    }
  }
  v84 = v9;
  v16 = v10 - v9;
  channelNameLabel = self->_channelNameLabel;
  if (channelNameLabel)
  {
    -[UIView vui_sizeThatFits:](channelNameLabel, "vui_sizeThatFits:", v16, 0.0);
    v19 = v18;
    -[VUILabel textLayout](self->_channelNameLabel, "textLayout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "margin");
    v22 = v21;

    -[VUILabel topMarginWithBaselineMargin:](self->_channelNameLabel, "topMarginWithBaselineMargin:", v22);
    -[VUILabel setFrame:](self->_channelNameLabel, "setFrame:", v7, v23, v16, v19);
    -[VUILabel setVuiCenter:](self->_channelNameLabel, "setVuiCenter:", width * 0.5, v12 * 0.5);
    goto LABEL_15;
  }
  imageView = self->_imageView;
  if (imageView)
  {
    -[UIView setFrame:](imageView, "setFrame:", 0.0, 0.0, width, v12);
    goto LABEL_15;
  }
  appIconView = self->_appIconView;
  if (appIconView)
  {
    -[UIView vui_sizeThatFits:](appIconView, "vui_sizeThatFits:", 0.0, v12);
    VUIRoundValue();
    VUIRoundValue();
    -[UIView setFrame:](self->_appIconView, "setFrame:");
    v26 = self->_channelImageBackgroundView;
    if (v26)
    {
      -[UIView setFrame:](v26, "setFrame:", 0.0, 0.0, width, v12);
      objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setVuiBackgroundColor:](self->_channelImageBackgroundView, "setVuiBackgroundColor:", v27);

    }
    v28 = self->_appIconView;
  }
  else
  {
    logoView = self->_logoView;
    if (!logoView)
      goto LABEL_15;
    -[UIView vui_sizeThatFits:](logoView, "vui_sizeThatFits:", 0.0, v12);
    -[UIView setFrame:](self->_logoView, "setFrame:", v7, 0.0, v30, v31);
    -[UIView setVuiCenter:](self->_logoView, "setVuiCenter:", width * 0.5, v12 * 0.5);
    v28 = self->_logoView;
  }
  -[VUIOfferView vui_bringSubviewToFront:](self, "vui_bringSubviewToFront:", v28, *(_QWORD *)&v84);
LABEL_15:
  if (-[VUIOfferView _shouldDisplaySeparator](self, "_shouldDisplaySeparator", *(_QWORD *)&v84))
  {
    separatorView = self->_separatorView;
    if (!separatorView)
    {
      v33 = [VUISeparatorView alloc];
      v34 = -[VUISeparatorView initWithFrame:](v33, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v35 = self->_separatorView;
      self->_separatorView = v34;

      -[VUIOfferView addSubview:](self, "addSubview:", self->_separatorView);
      separatorView = self->_separatorView;
    }
    -[VUIOfferView bringSubviewToFront:](self, "bringSubviewToFront:", separatorView);
    -[VUISeparatorView setFrame:](self->_separatorView, "setFrame:", 0.0, v12, width, 1.0);
    v12 = v12 + 1.0;
  }
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    if (!self->_subtitleLabel && !self->_textLabel && !self->_versionsButton)
      return;
    goto LABEL_25;
  }
  -[VUILabel vuiText](titleLabel, "vuiText");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "length");

  if (!v38)
  {
LABEL_25:
    v46 = 0;
    goto LABEL_26;
  }
  -[UIView vui_sizeThatFits:](self->_titleLabel, "vui_sizeThatFits:", v16, 0.0);
  -[VUILabel textLayout](self->_titleLabel, "textLayout");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "margin");
  v41 = v40;

  -[VUILabel topMarginWithBaselineMargin:](self->_titleLabel, "topMarginWithBaselineMargin:", v41);
  v43 = v12 + v42;
  VUIRoundValue();
  v45 = v44;
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v7, v43, v16, v44);
  v12 = v43 + v45;
  v46 = self->_titleLabel;
LABEL_26:
  textLabel = self->_textLabel;
  if (textLabel)
  {
    v86 = v46;
    -[VUILabel vuiText](textLabel, "vuiText");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "length");

    if (v49)
    {
      -[VUILabel textLayout](self->_textLabel, "textLayout");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "margin");
      v52 = v51;

      -[VUILabel topMarginToLabel:withBaselineMargin:](self->_textLabel, "topMarginToLabel:withBaselineMargin:", v86, v52);
      v54 = v12 + v53;
      -[UIView vui_sizeThatFits:](self->_textLabel, "vui_sizeThatFits:", v16, 0.0);
      VUIRoundValue();
      v56 = v55;
      -[VUILabel setFrame:](self->_textLabel, "setFrame:", v7, v54, v16, v55);
      v12 = v54 + v56;
      v57 = self->_textLabel;

      v46 = v57;
    }
    else
    {
      v46 = v86;
    }
  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    v87 = v46;
    -[VUILabel vuiText](subtitleLabel, "vuiText");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "length");

    if (v60)
    {
      -[UIView vui_sizeThatFits:](self->_subtitleLabel, "vui_sizeThatFits:", v16, 0.0);
      -[VUILabel textLayout](self->_subtitleLabel, "textLayout");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "margin");
      secondLineBaselineMargin = v62;

      if (!self->_textLabel)
        secondLineBaselineMargin = self->_secondLineBaselineMargin;
      v64 = self->_subtitleLabel;
      if (v87)
        -[VUILabel topMarginToLabel:withBaselineMargin:](v64, "topMarginToLabel:withBaselineMargin:", v87, secondLineBaselineMargin);
      else
        -[VUILabel topMarginWithBaselineMargin:](v64, "topMarginWithBaselineMargin:", secondLineBaselineMargin);
      v66 = v65;
      v67 = self->_subtitleLabel;
      v68 = v12 + v65;
      VUIRoundValue();
      -[VUILabel setFrame:](v67, "setFrame:", v7, v68, v16, v69);
      VUIRoundValue();
      v12 = v12 + v66 + v70;
      v71 = self->_subtitleLabel;

      v46 = v71;
    }
    else
    {
      v46 = v87;
    }
  }
  if (self->_versionsButton)
  {
    v88 = v46;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIView vui_sizeThatFits:](self->_versionsButton, "vui_sizeThatFits:", v16, 0.0);
      v73 = v72;
      -[UIView textContentView](self->_versionsButton, "textContentView");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v74 = 0;
      v73 = *MEMORY[0x1E0C9D820];
    }
    if (v5)
      v75 = width - v85 - v73;
    else
      v75 = v7;
    objc_msgSend(v74, "textLayout");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "margin");
    v78 = v77;

    if (v88)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v80 = 0.0;
      if ((isKindOfClass & 1) != 0)
        -[UIView topMarginToLabel:withBaselineMargin:](self->_versionsButton, "topMarginToLabel:withBaselineMargin:", v88, v78);
    }
    else
    {
      -[UIView topMarginWithBaselineMargin:](self->_versionsButton, "topMarginWithBaselineMargin:", v78);
    }
    v81 = v12 + v80;
    versionsButton = self->_versionsButton;
    VUIRoundValue();
    -[UIView setFrame:](versionsButton, "setFrame:", v75, v81, v73, v83);

    v46 = v88;
  }

}

- (CGSize)computeSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  VUIRoundValue();
  v7 = v6;
  if (-[VUIOfferView _shouldDisplaySeparator](self, "_shouldDisplaySeparator"))
    v7 = v7 + 1.0;
  if (self->_titleLabel || self->_subtitleLabel || self->_textLabel)
  {
    -[VUIOfferView _chinHeightForSize:](self, "_chinHeightForSize:", width, height);
    v7 = v7 + v8;
  }
  v9 = width;
  v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a5;
  -[VUIOfferView subviews](self, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__VUIOfferView_setSelected_animated_withAnimationCoordinator___block_invoke;
  v11[3] = &unk_1E9F9B2E0;
  v13 = a3;
  v14 = a4;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

}

uint64_t __62__VUIOfferView_setSelected_animated_withAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelected:animated:withAnimationCoordinator:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), *(_QWORD *)(a1 + 32));
}

- (UIView)imageView
{
  return self->_imageView;
}

- (UIView)logoView
{
  return self->_logoView;
}

- (UIView)appIconView
{
  return self->_appIconView;
}

- (VUILabel)channelNameLabel
{
  return self->_channelNameLabel;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (VUILabel)textLabel
{
  return self->_textLabel;
}

- (UIView)versionsButton
{
  return self->_versionsButton;
}

- (UIView)channelImageBackgroundView
{
  return self->_channelImageBackgroundView;
}

- (BOOL)isEntitled
{
  return self->_isEntitled;
}

- (void)setIsEntitled:(BOOL)a3
{
  self->_isEntitled = a3;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (double)topPartAspectRatio
{
  return self->_topPartAspectRatio;
}

- (void)setTopPartAspectRatio:(double)a3
{
  self->_topPartAspectRatio = a3;
}

- (double)secondLineBaselineMargin
{
  return self->_secondLineBaselineMargin;
}

- (void)setSecondLineBaselineMargin:(double)a3
{
  self->_secondLineBaselineMargin = a3;
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_channelImageBackgroundView, 0);
  objc_storeStrong((id *)&self->_versionsButton, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_channelNameLabel, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
