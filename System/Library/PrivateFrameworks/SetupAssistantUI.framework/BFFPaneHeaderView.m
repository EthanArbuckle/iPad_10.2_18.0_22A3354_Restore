@implementation BFFPaneHeaderView

- (BFFPaneHeaderView)initWithFrame:(CGRect)a3
{
  BFFPaneHeaderView *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UILabel *textLabel;
  void *v12;
  uint64_t v13;
  UILabel *detailTextLabel;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UILabel *subLabel;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)BFFPaneHeaderView;
  v3 = -[BFFPaneHeaderView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "edgeInsetsForHeaderView:", v3);
    -[BFFPaneHeaderView setLayoutMargins:](v3, "setLayoutMargins:");

    v5 = objc_alloc(MEMORY[0x24BEBD708]);
    v6 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
    textLabel = v3->_textLabel;
    v3->_textLabel = (UILabel *)v10;

    -[UILabel setNumberOfLines:](v3->_textLabel, "setNumberOfLines:", 0);
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applyThemeToTitleLabel:", v3->_textLabel);

    -[BFFPaneHeaderView addSubview:](v3, "addSubview:", v3->_textLabel);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v6, v7, v8, v9);
    detailTextLabel = v3->_detailTextLabel;
    v3->_detailTextLabel = (UILabel *)v13;

    -[UILabel setNumberOfLines:](v3->_detailTextLabel, "setNumberOfLines:", 0);
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applyThemeToLabel:", v3->_detailTextLabel);

    -[UILabel setTextAlignment:](v3->_detailTextLabel, "setTextAlignment:", 1);
    v16 = (void *)MEMORY[0x24BEBD5E0];
    objc_msgSend(MEMORY[0x24BEBD5E8], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fontWithDescriptor:size:", v18, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_detailTextLabel, "setFont:", v19);

    -[BFFPaneHeaderView addSubview:](v3, "addSubview:", v3->_detailTextLabel);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v6, v7, v8, v9);
    subLabel = v3->_subLabel;
    v3->_subLabel = (UILabel *)v20;

    -[UILabel setNumberOfLines:](v3->_subLabel, "setNumberOfLines:", 0);
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "applyThemeToLabel:", v3->_subLabel);

    -[UILabel setTextAlignment:](v3->_subLabel, "setTextAlignment:", 1);
    -[UILabel font](v3->_detailTextLabel, "font");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_subLabel, "setFont:", v23);

    -[BFFPaneHeaderView addSubview:](v3, "addSubview:", v3->_subLabel);
    -[BFFPaneHeaderView setCustomTopPadding:](v3, "setCustomTopPadding:", -1.0);
  }
  return v3;
}

- (void)setIcon:(id)a3
{
  UIImage *v4;
  UIImage **p_icon;
  void *v6;
  void *v7;
  uint64_t v8;
  UIImage *v9;
  UIImageView *iconView;
  UIImageView *v11;
  UIImageView *v12;
  UIImageView *v14;
  UIImage *obj;
  UIImage *obja;

  v4 = (UIImage *)a3;
  p_icon = &self->_icon;
  if (self->_icon != v4)
  {
    obj = v4;
    if (-[BFFPaneHeaderView iconInheritsTint](self, "iconInheritsTint")
      && (-[BFFPaneHeaderView tintColor](self, "tintColor"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      -[BFFPaneHeaderView tintColor](self, "tintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImage _flatImageWithColor:](obj, "_flatImageWithColor:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v9 = (UIImage *)v8;
    }
    else
    {
      v9 = obj;
    }
    obja = v9;
    objc_storeStrong((id *)&self->_icon, v9);
    iconView = self->_iconView;
    if (*p_icon)
    {
      if (!iconView)
      {
        v11 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", *p_icon);
        v12 = self->_iconView;
        self->_iconView = v11;

        if (self->_iconSize.width != *MEMORY[0x24BDBF148]
          || self->_iconSize.height != *(double *)(MEMORY[0x24BDBF148] + 8))
        {
          -[UIImageView frame](self->_iconView, "frame");
          -[UIImageView setFrame:](self->_iconView, "setFrame:");
        }
        -[BFFPaneHeaderView addSubview:](self, "addSubview:", self->_iconView);
        goto LABEL_17;
      }
    }
    else if (iconView)
    {
      -[UIImageView removeFromSuperview](iconView, "removeFromSuperview");
      v14 = self->_iconView;
      self->_iconView = 0;

LABEL_17:
      -[BFFPaneHeaderView setNeedsLayout](self, "setNeedsLayout");
      v4 = obja;
      goto LABEL_18;
    }
    -[UIImageView setImage:](iconView, "setImage:");
    goto LABEL_17;
  }
LABEL_18:

}

- (void)setIconAccessibilityLabel:(id)a3
{
  UIImageView *iconView;
  _BOOL8 v5;
  id v6;

  iconView = self->_iconView;
  v5 = a3 != 0;
  v6 = a3;
  -[UIImageView setIsAccessibilityElement:](iconView, "setIsAccessibilityElement:", v5);
  -[UIImageView setAccessibilityLabel:](self->_iconView, "setAccessibilityLabel:", v6);

}

- (NSString)iconAccessibilityLabel
{
  return (NSString *)-[UIImageView accessibilityLabel](self->_iconView, "accessibilityLabel");
}

- (void)setIconSize:(CGSize)a3
{
  CGSize *p_iconSize;
  double v6;
  double v7;
  double v8;
  double v9;
  double width;
  double height;
  double v12;
  double v14;
  double v15;

  p_iconSize = &self->_iconSize;
  if (a3.width != self->_iconSize.width || a3.height != self->_iconSize.height)
  {
    p_iconSize->width = a3.width;
    self->_iconSize.height = a3.height;
    -[UIImageView frame](self->_iconView, "frame");
    v7 = v6;
    v9 = v8;
    width = p_iconSize->width;
    height = p_iconSize->height;
    v12 = *(double *)(MEMORY[0x24BDBF148] + 8);
    if (p_iconSize->width == *MEMORY[0x24BDBF148] && height == v12)
    {
      -[UIImage size](self->_icon, "size", *MEMORY[0x24BDBF148], v12, width, height);
      width = v14;
      height = v15;
    }
    -[UIImageView setFrame:](self->_iconView, "setFrame:", v7, v9, width, height);
  }
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
    -[UIImage size](self->_icon, "size");
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIconInheritsTint:(BOOL)a3
{
  if (self->_iconInheritsTint != a3)
  {
    self->_iconInheritsTint = a3;
    -[BFFPaneHeaderView tintColorDidChange](self, "tintColorDidChange");
  }
}

- (void)tintColorDidChange
{
  void *v3;
  UIImageView *iconView;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BFFPaneHeaderView;
  -[BFFPaneHeaderView tintColorDidChange](&v8, sel_tintColorDidChange);
  if (-[BFFPaneHeaderView iconInheritsTint](self, "iconInheritsTint"))
  {
    -[BFFPaneHeaderView tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      iconView = self->_iconView;
      -[UIImageView image](iconView, "image");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[BFFPaneHeaderView tintColor](self, "tintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_flatImageWithColor:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](iconView, "setImage:", v7);

    }
  }
}

- (void)_linkButtonPressed
{
  void (**linkHandler)(void);

  linkHandler = (void (**)(void))self->_linkHandler;
  if (linkHandler)
    linkHandler[2]();
}

- (void)setTitleText:(id)a3
{
  void *v4;

  -[UILabel setText:](self->_textLabel, "setText:", a3);
  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyThemeToTitleLabel:", self->_textLabel);

  -[BFFPaneHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setLinkText:(id)a3 handler:(id)a4
{
  id v6;
  uint64_t v7;
  UIButton *v8;
  UIButton *linkButton;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id linkHandler;
  UIButton *v17;
  id v18;
  id v19;

  v19 = a3;
  v6 = a4;
  -[UIButton removeFromSuperview](self->_linkButton, "removeFromSuperview");
  v7 = objc_msgSend(v19, "length");
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
    linkButton = self->_linkButton;
    self->_linkButton = v8;

    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](self->_linkButton, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    -[UIButton titleLabel](self->_linkButton, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLineBreakMode:", 0);

    -[UIButton titleLabel](self->_linkButton, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNumberOfLines:", 0);

    -[UIButton titleLabel](self->_linkButton, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextAlignment:", 1);

    -[UIButton setTitle:forState:](self->_linkButton, "setTitle:forState:", v19, 0);
    -[UIButton addTarget:action:forControlEvents:](self->_linkButton, "addTarget:action:forControlEvents:", self, sel__linkButtonPressed, 0x2000);
    v15 = (void *)MEMORY[0x2199D7C3C](v6);
    linkHandler = self->_linkHandler;
    self->_linkHandler = v15;

    -[BFFPaneHeaderView addSubview:](self, "addSubview:", self->_linkButton);
  }
  else
  {
    v17 = self->_linkButton;
    self->_linkButton = 0;

    v18 = self->_linkHandler;
    self->_linkHandler = 0;

  }
  -[BFFPaneHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (UIColor)bottomLineColor
{
  return -[UIView backgroundColor](self->_bottomLine, "backgroundColor");
}

- (void)setBottomLineColor:(id)a3
{
  id v4;
  void *v5;
  UIView *bottomLine;
  id v7;
  UIView *v8;
  UIView *v9;
  id v10;

  v10 = a3;
  -[UIView backgroundColor](self->_bottomLine, "backgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v4 != v10)
  {
    -[UIView removeFromSuperview](self->_bottomLine, "removeFromSuperview");
    if (v10)
    {
      bottomLine = self->_bottomLine;
      if (!bottomLine)
      {
        v7 = objc_alloc(MEMORY[0x24BEBDB00]);
        v8 = (UIView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        v9 = self->_bottomLine;
        self->_bottomLine = v8;

        bottomLine = self->_bottomLine;
      }
      -[BFFPaneHeaderView addSubview:](self, "addSubview:", bottomLine);
    }
    -[UIView setBackgroundColor:](self->_bottomLine, "setBackgroundColor:", v10);
    -[BFFPaneHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (double)_labelsAndLinksBaselineOffsetForView:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;

  v3 = (void *)MEMORY[0x24BEBD5F0];
  v4 = *MEMORY[0x24BEBE1D0];
  v5 = a3;
  objc_msgSend(v3, "metricsForTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "horizontalSizeClass");
  v9 = 34.0;
  if (v8 == 1)
    v9 = 30.0;
  objc_msgSend(v6, "scaledValueForValue:", v9);
  v11 = v10;

  return v11;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  UIImageView *iconView;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  _BOOL4 v44;
  UILabel *textLabel;
  double v46;
  double v47;
  float v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  UIButton *linkButton;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  CGFloat v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  objc_super v104;
  CGRect v105;

  v104.receiver = self;
  v104.super_class = (Class)BFFPaneHeaderView;
  -[BFFPaneHeaderView layoutSubviews](&v104, sel_layoutSubviews);
  -[BFFPaneHeaderView _labelsAndLinksBaselineOffsetForView:](self, "_labelsAndLinksBaselineOffsetForView:", self);
  v4 = v3;
  iconView = self->_iconView;
  -[BFFPaneHeaderView bounds](self, "bounds");
  v7 = v6;
  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "horizontalInsetsForContainingInView:width:", self, v7);
  v10 = v9;

  -[BFFPaneHeaderView superview](self, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaInsets");
  v13 = v12;

  if (iconView)
  {
    -[UIImageView frame](self->_iconView, "frame");
    v15 = v14;
    v17 = v16;
    v18 = v4;
    v19 = BFFRoundToPixel((v7 - v14) * 0.5);
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFPaneHeaderView iconSize](self, "iconSize");
    objc_msgSend(v20, "headerYOffsetForIconSize:inView:", self);
    v22 = v21;

    if (-[BFFPaneHeaderView useMinimumTopPadding](self, "useMinimumTopPadding") && v22 < 12.0)
      v23 = 12.0;
    else
      v23 = v22;
    v24 = v19;
    v4 = v18;
    -[UIImageView setFrame:](self->_iconView, "setFrame:", v24, v23, v15, v17);
  }
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPaneHeaderView customTopPadding](self, "customTopPadding");
  if (v26 >= 0.0)
  {
    v30 = (void *)MEMORY[0x24BEBD5F0];
    _BFFHeaderTextStyle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "metricsForTextStyle:", v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFPaneHeaderView customTopPadding](self, "customTopPadding");
    objc_msgSend(v31, "scaledValueForValue:");
    v29 = v32;

  }
  else
  {
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFPaneHeaderView iconSize](self, "iconSize");
    objc_msgSend(v27, "headerTitleBaselineOffsetForView:iconSize:", self);
    v29 = v28;
  }
  v33 = v10 + v13;

  -[UILabel _firstBaselineOffsetFromTop](self->_detailTextLabel, "_firstBaselineOffsetFromTop");
  v35 = v34;
  -[UILabel frame](self->_textLabel, "frame");
  v37 = v36;
  v39 = v38;
  v103 = v40;
  v101 = v41;
  -[UILabel text](self->_textLabel, "text");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "length");

  if (v43)
  {
    v37 = BFFRoundToPixel(v33);
    v44 = -[BFFPaneHeaderView isTextLabelAlignedByLastBaseline](self, "isTextLabelAlignedByLastBaseline");
    textLabel = self->_textLabel;
    if (v44)
      -[UILabel _lastLineBaseline](textLabel, "_lastLineBaseline");
    else
      -[UILabel _firstBaselineOffsetFromTop](textLabel, "_firstBaselineOffsetFromTop");
    v48 = BFFRoundToPixel(v29 - v46);
    v49 = fmaxf(v48, 0.0);
    -[BFFPaneHeaderView frame](self, "frame");
    if (v103 + v37 > v50)
    {
      -[BFFPaneHeaderView frame](self, "frame");
      v103 = v51 + v37 * -2.0;
    }
    -[UILabel _lastLineBaseline](self->_textLabel, "_lastLineBaseline");
    v102 = v49;
    v53 = v52 + v49;
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "headerSubheaderBaselineSpacingForView:", self);
    objc_msgSend(v25, "scaledValueForValue:");
    v47 = v53 + v55;

  }
  else
  {
    v102 = v39;
    v47 = v29 - v35;
  }
  -[UILabel frame](self->_detailTextLabel, "frame");
  v57 = v56;
  v59 = v58;
  v98 = v61;
  v99 = v60;
  -[UILabel text](self->_detailTextLabel, "text");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v37;
  if (objc_msgSend(v62, "length"))
  {

LABEL_20:
    v65 = v7;
    v57 = BFFRoundToPixel(v33);
    -[UILabel _firstBaselineOffsetFromTop](self->_detailTextLabel, "_firstBaselineOffsetFromTop");
    v59 = BFFRoundToPixel(v47 - v66);
    -[UILabel _lastLineBaseline](self->_detailTextLabel, "_lastLineBaseline");
    v47 = v4 + v59 + v67;
    goto LABEL_21;
  }
  -[UILabel attributedText](self->_detailTextLabel, "attributedText");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "length");

  if (v64)
    goto LABEL_20;
  v65 = v7;
LABEL_21:
  -[UILabel frame](self->_subLabel, "frame");
  v69 = v68;
  v71 = v70;
  v95 = v73;
  v96 = v72;
  -[UILabel text](self->_subLabel, "text");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "length");

  v97 = v57;
  if (v75)
  {
    v69 = BFFRoundToPixel(v33);
    -[UILabel _firstBaselineOffsetFromTop](self->_subLabel, "_firstBaselineOffsetFromTop");
    v71 = BFFRoundToPixel(v47 - v76);
    -[UILabel _lastLineBaseline](self->_subLabel, "_lastLineBaseline");
    v47 = v4 + v71 + v77;
  }
  -[UIButton frame](self->_linkButton, "frame");
  v81 = v80;
  v93 = v82;
  linkButton = self->_linkButton;
  if (linkButton)
  {
    -[UIButton layoutSubviews](linkButton, "layoutSubviews");
    v84 = BFFRoundToPixel((v65 - v81) * 0.5);
    -[UIButton titleLabel](self->_linkButton, "titleLabel");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "_firstLineBaselineOffsetFromBoundsTop");
    v87 = v47 - v86;

  }
  else
  {
    v84 = v78;
    v87 = v79;
  }
  v88 = v102;
  -[BFFPaneHeaderView bottomLineColor](self, "bottomLineColor", v93);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    UICeilToViewScale();
    v91 = v90;
    -[BFFPaneHeaderView bounds](self, "bounds");
    v92 = CGRectGetMaxY(v105) - v91;
    -[BFFPaneHeaderView bounds](self, "bounds");
    v88 = v102;
    -[UIView setFrame:](self->_bottomLine, "setFrame:", 0.0, v92);
  }
  -[UILabel setFrame:](self->_detailTextLabel, "setFrame:", v97, v59, v99, v98);
  -[UILabel setFrame:](self->_subLabel, "setFrame:", v69, v71, v96, v95);
  -[UILabel setFrame:](self->_textLabel, "setFrame:", v100, v88, v103, v101);
  -[UIButton setFrame:](self->_linkButton, "setFrame:", v84, v87, v81, v94);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[BFFPaneHeaderView heightForWidth:inView:](self, "heightForWidth:inView:", self, a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (double)heightForWidth:(double)a3 inView:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIImageView *iconView;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGSize *p_iconSize;
  double v38;
  double v39;
  UIImageView *v40;
  double v41;
  double width;
  double v43;
  double v44;
  _BOOL4 v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  char v61;
  UIButton *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  char v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v97;
  uint64_t v98;
  void *v99;
  _BOOL4 v100;
  UIButton *linkButton;
  uint64_t v102;

  v6 = a4;
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "horizontalSizeClass");

  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "horizontalInsetsForContainingInView:width:", v6, a3);
  v11 = v10;
  v13 = v12;

  -[BFFPaneHeaderView superview](self, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaInsets");
  v16 = a3 - v11 - v13 - v15;
  -[BFFPaneHeaderView superview](self, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeAreaInsets");
  v19 = v18;

  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPaneHeaderView _labelsAndLinksBaselineOffsetForView:](self, "_labelsAndLinksBaselineOffsetForView:", v6);
  v21 = v20;
  iconView = self->_iconView;
  -[UILabel text](self->_textLabel, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  -[UILabel text](self->_detailTextLabel, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v8;
  v102 = v24;
  if (objc_msgSend(v25, "length"))
  {
    v100 = 1;
  }
  else
  {
    -[UILabel attributedText](self->_detailTextLabel, "attributedText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v26, "length") != 0;

  }
  v27 = v16 - v19;

  -[UILabel text](self->_subLabel, "text");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "length");

  linkButton = self->_linkButton;
  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPaneHeaderView iconSize](self, "iconSize");
  objc_msgSend(v30, "headerTitleBaselineOffsetForView:iconSize:", v6);
  v32 = v31;

  if (iconView)
  {
    -[UIImageView frame](self->_iconView, "frame");
    v34 = v33;
    v36 = v35;
    p_iconSize = &self->_iconSize;
    v38 = *MEMORY[0x24BDBF148];
    v39 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v40 = self->_iconView;
    v97 = v32;
    if (self->_iconSize.width == *MEMORY[0x24BDBF148] && self->_iconSize.height == v39)
    {
      v41 = v21;
      -[UIImageView sizeToFit](v40, "sizeToFit");
      -[UIImageView frame](self->_iconView, "frame");
      v34 = v43;
      v36 = v44;
    }
    else
    {
      v41 = v21;
      -[UIImageView setBounds:](v40, "setBounds:", 0.0, 0.0);
      width = p_iconSize->width;
    }
    if (width < a3)
      a3 = width;
    -[UIImageView image](self->_iconView, "image");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "size");
    v48 = a3 * v47;
    -[UIImageView image](self->_iconView, "image");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "size");
    v51 = v48 / v50;

    if (a3 != v38 || v51 != v39)
    {
      p_iconSize->width = a3;
      self->_iconSize.height = v51;
    }
    -[UIImageView setFrame:](self->_iconView, "setFrame:", v34, v36, a3, v51);
    v21 = v41;
    v45 = v100;
    v32 = v97;
    if (v102)
      goto LABEL_17;
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFPaneHeaderView iconSize](self, "iconSize");
    objc_msgSend(v66, "headerYOffsetForIconSize:inView:", v6);
    v32 = v67;

LABEL_25:
    v63 = v99;
    v62 = linkButton;
    v60 = v32 + 0.0;
    if (v29)
      v68 = 1;
    else
      v68 = v45;
    if ((v68 & 1) != 0 || linkButton)
      goto LABEL_33;
    goto LABEL_30;
  }
  v45 = v100;
  if (!v102)
    goto LABEL_25;
LABEL_17:
  -[UILabel frame](self->_textLabel, "frame");
  v53 = v52;
  v55 = v54;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v27, 1.79769313e308);
  -[UILabel setFrame:](self->_textLabel, "setFrame:", v53, v55, v27, v56);
  -[UILabel setNeedsDisplay](self->_textLabel, "setNeedsDisplay");
  -[UILabel _lastLineBaseline](self->_textLabel, "_lastLineBaseline");
  v58 = v57;
  -[UILabel _firstBaselineOffsetFromTop](self->_textLabel, "_firstBaselineOffsetFromTop");
  v60 = v32 + v58 - v59 + 0.0;
  if (v29)
    v61 = 1;
  else
    v61 = v45;
  v62 = linkButton;
  if ((v61 & 1) != 0 || linkButton)
  {
    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "headerSubheaderBaselineSpacingForView:", v6);
    v63 = v99;
    objc_msgSend(v99, "scaledValueForValue:");
    v60 = v60 + v65;

    goto LABEL_33;
  }
  v63 = v99;
LABEL_30:
  v69 = 56.0;
  if (v98 == 1)
    v69 = 37.0;
  objc_msgSend(v63, "scaledValueForValue:", v69);
  v60 = v60 + v70;
LABEL_33:
  if (v45)
  {
    -[UILabel frame](self->_detailTextLabel, "frame");
    v72 = v71;
    v74 = v73;
    -[UILabel sizeThatFits:](self->_detailTextLabel, "sizeThatFits:", v27, 1.79769313e308);
    -[UILabel setFrame:](self->_detailTextLabel, "setFrame:", v72, v74, v27, v75);
    -[UILabel setNeedsDisplay](self->_detailTextLabel, "setNeedsDisplay");
    -[UILabel _lastLineBaseline](self->_detailTextLabel, "_lastLineBaseline");
    v77 = v76;
    -[UILabel _firstBaselineOffsetFromTop](self->_detailTextLabel, "_firstBaselineOffsetFromTop");
    v60 = v60 + v21 + v77 - v78;
  }
  if (v29)
  {
    -[UILabel frame](self->_subLabel, "frame");
    v80 = v79;
    v82 = v81;
    -[UILabel sizeThatFits:](self->_subLabel, "sizeThatFits:", v27, 1.79769313e308);
    -[UILabel setFrame:](self->_subLabel, "setFrame:", v80, v82, v27, v83);
    -[UILabel setNeedsDisplay](self->_subLabel, "setNeedsDisplay");
    -[UILabel _lastLineBaseline](self->_subLabel, "_lastLineBaseline");
    v85 = v84;
    -[UILabel _firstBaselineOffsetFromTop](self->_subLabel, "_firstBaselineOffsetFromTop");
    v60 = v60 + v21 + v85 - v86;
  }
  if (v62)
  {
    -[UIButton frame](self->_linkButton, "frame");
    v88 = v87;
    v90 = v89;
    -[UIButton titleLabel](self->_linkButton, "titleLabel");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0, v27, 1.79769313e308);
    v93 = v92;
    v95 = v94;

    -[UIButton setFrame:](self->_linkButton, "setFrame:", v88, v90, v93, v95);
    v60 = v21 + v60;
  }

  return v60;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UIImage)icon
{
  return self->_icon;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (UILabel)subLabel
{
  return self->_subLabel;
}

- (double)flexibleHeight
{
  return self->_flexibleHeight;
}

- (void)setFlexibleHeight:(double)a3
{
  self->_flexibleHeight = a3;
}

- (BOOL)iconInheritsTint
{
  return self->_iconInheritsTint;
}

- (BOOL)useMinimumTopPadding
{
  return self->_useMinimumTopPadding;
}

- (void)setUseMinimumTopPadding:(BOOL)a3
{
  self->_useMinimumTopPadding = a3;
}

- (double)customTopPadding
{
  return self->_customTopPadding;
}

- (void)setCustomTopPadding:(double)a3
{
  self->_customTopPadding = a3;
}

- (BOOL)isTextLabelAlignedByLastBaseline
{
  return self->_textLabelAlignedByLastBaseline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_bottomLine, 0);
  objc_storeStrong(&self->_linkHandler, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
}

@end
