@implementation SBUIActionView

- (SBUIActionView)initWithAction:(id)a3
{
  id v5;
  SBUIActionView *v6;
  SBUIActionView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBUIActionView;
  v6 = -[SBUIActionView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_action, a3);
    v7->_imagePosition = 0;
    v7->_highlighted = 0;
    v7->_interfaceOrientationIsPortrait = (unint64_t)(objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeInterfaceOrientation")- 1) < 2;
    -[SBUIActionView _setupSubviews](v7, "_setupSubviews");
  }

  return v7;
}

- (SBUIActionView)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCA98];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%s is not a valid initializer. You must call -[%@ initWithAction:]."), "-[SBUIActionView initWithFrame:]", v7);

  return -[SBUIActionView initWithAction:](self, "initWithAction:", 0);
}

- (SBUIActionView)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  void *v8;
  SBUIActionView *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ does not support unarchiving from a nib."), v8);

  v11.receiver = self;
  v11.super_class = (Class)SBUIActionView;
  v9 = -[SBUIActionView initWithCoder:](&v11, sel_initWithCoder_, v6);

  return v9;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIActionView;
  -[SBUIActionView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBUIActionView _updateVisualStylingIfNecessary](self, "_updateVisualStylingIfNecessary");
}

- (void)willMoveToSuperview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIActionView;
  -[SBUIActionView willMoveToSuperview:](&v4, sel_willMoveToSuperview_, a3);
  -[SBUIActionView _invalidateVisualStyling](self, "_invalidateVisualStyling");
}

- (void)setImagePosition:(int64_t)a3
{
  if (self->_imagePosition != a3)
  {
    self->_imagePosition = a3;
    -[SBUIActionView _updateImageViewLayoutConstraints](self, "_updateImageViewLayoutConstraints");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[UIView setHidden:](self->_highlightView, "setHidden:", !a3);
  }
}

- (double)leadingContentMargin
{
  void *v2;
  uint64_t v3;
  double result;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  result = 12.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 16.0;
  return result;
}

- (double)trailingContentMargin
{
  return 17.0;
}

- (void)setHighlighted:(BOOL)a3 withFeedbackRetargetBehavior:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  if (-[SBUIActionView isHighlighted](self, "isHighlighted") != v4)
  {
    -[SBUIActionView setHighlighted:](self, "setHighlighted:", v4);
    if (v4)
      objc_msgSend(v6, "selectionChanged");
  }

}

- (void)_setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  UIImageView *v34;
  UIImageView *imageView;
  double v36;
  UIView *v37;
  UIView *textContainer;
  SBUIActionViewLabel *v39;
  SBUIActionViewLabel *titleLabel;
  uint64_t v41;
  SBUIActionViewLabel *v42;
  SBUIActionViewLabel *subtitleLabel;
  SBUIActionViewLabel *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  SBUIActionViewLabel *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  double v115;
  void *v116;
  void *v117;
  void *v118;
  double v119;
  void *v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  UIView *v128;
  UIView *highlightView;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  _QWORD v152[9];
  CGRect v153;
  CGRect v154;

  v152[7] = *MEMORY[0x24BDAC8D0];
  -[SBUIActionView action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageName");
  v147 = v3;
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "badgeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v4;
  v142 = objc_msgSend(v4, "length");
  v7 = (id)*MEMORY[0x24BDF77B0];
  v8 = (id)*MEMORY[0x24BDF77D0];
  v9 = (id)*MEMORY[0x24BDF7688];
  if (self->_interfaceOrientationIsPortrait)
  {
    v10 = v6;
    v11 = v7;
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "preferredContentSizeCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)*MEMORY[0x24BDF7680];
    v14 = *MEMORY[0x24BDF7678];
    v152[0] = *MEMORY[0x24BDF7680];
    v152[1] = v14;
    v15 = *MEMORY[0x24BDF7658];
    v152[2] = *MEMORY[0x24BDF7660];
    v152[3] = v15;
    v16 = *MEMORY[0x24BDF7648];
    v152[4] = *MEMORY[0x24BDF7650];
    v152[5] = v16;
    v152[6] = *MEMORY[0x24BDF7640];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v152, 7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsObject:", v12);

    if (v18)
    {
      v19 = v13;

      v9 = v19;
    }
    v149 = v8;

    v20 = v11;
    v6 = v10;
    v21 = v9;
  }
  else
  {
    v22 = (id)*MEMORY[0x24BDF76A8];

    v20 = (id)*MEMORY[0x24BDF7858];
    v23 = (id)*MEMORY[0x24BDF77B8];

    v21 = v22;
    v149 = v23;
  }
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithPreferredContentSizeCategory:", v21, v142);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", v20);
  v24 = objc_claimAutoreleasedReturnValue();
  v146 = v20;
  if (v5)
  {
    objc_msgSend(v5, "size");
    if (v25 < v26)
      v25 = v26;
    if (v25 >= 35.0)
      v27 = 1;
    else
      v27 = 4;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", v148);
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v5 = (void *)v28;
    v27 = 1;
LABEL_14:
    v29 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v30 = *MEMORY[0x24BDBF090];
    v31 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v32 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v33 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v34 = (UIImageView *)objc_msgSend(v29, "initWithFrame:", *MEMORY[0x24BDBF090], v31, v32, v33);
    imageView = self->_imageView;
    self->_imageView = v34;

    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", v27);
    -[UIImageView setImage:](self->_imageView, "setImage:", v5);
    -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", 0);
    LODWORD(v36) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](self->_imageView, "setContentHuggingPriority:forAxis:", 0, v36);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBUIActionView addSubview:](self, "addSubview:", self->_imageView);

    goto LABEL_15;
  }
  v30 = *MEMORY[0x24BDBF090];
  v31 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v32 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v33 = *(double *)(MEMORY[0x24BDBF090] + 24);
LABEL_15:
  v37 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  textContainer = self->_textContainer;
  self->_textContainer = v37;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_textContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SBUIActionView addSubview:](self, "addSubview:", self->_textContainer);
  v39 = -[SBUIActionViewLabel initWithFrame:]([SBUIActionViewLabel alloc], "initWithFrame:", v30, v31, v32, v33);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v39;

  -[SBUIActionViewLabel _setLayoutDebuggingIdentifier:](self->_titleLabel, "_setLayoutDebuggingIdentifier:", CFSTR("titleLabel"));
  v144 = (void *)v24;
  -[SBUIActionViewLabel setFont:](self->_titleLabel, "setFont:", v24);
  -[SBUIActionViewLabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4);
  if (v143)
    v41 = 1;
  else
    v41 = 2;
  -[SBUIActionViewLabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v41);
  -[SBUIActionViewLabel setText:](self->_titleLabel, "setText:", v151);
  -[SBUIActionViewLabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 4);
  -[SBUIActionViewLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_textContainer, "addSubview:", self->_titleLabel);
  if (v143)
  {
    v42 = -[SBUIActionViewLabel initWithFrame:]([SBUIActionViewLabel alloc], "initWithFrame:", v30, v31, v32, v33);
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v42;

    -[SBUIActionViewLabel _setLayoutDebuggingIdentifier:](self->_subtitleLabel, "_setLayoutDebuggingIdentifier:", CFSTR("subtitleLabel"));
    v44 = self->_subtitleLabel;
    v45 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithPreferredContentSizeCategory:", v21);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "preferredFontForTextStyle:compatibleWithTraitCollection:", v149, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionViewLabel setFont:](v44, "setFont:", v47);

    -[SBUIActionViewLabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", 4);
    -[SBUIActionViewLabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 1);
    -[SBUIActionViewLabel setText:](self->_subtitleLabel, "setText:", v150);
    -[SBUIActionViewLabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 4);
    -[SBUIActionViewLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_textContainer, "addSubview:", self->_subtitleLabel);
  }
  if (v6)
  {
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_textContainer, "addSubview:", v6);
    objc_msgSend(v6, "bounds");
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;
    objc_msgSend(v6, "widthAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v153.origin.x = v49;
    v153.origin.y = v51;
    v153.size.width = v53;
    v153.size.height = v55;
    objc_msgSend(v56, "constraintEqualToConstant:", CGRectGetWidth(v153));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setActive:", 1);

    objc_msgSend(v6, "heightAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v154.origin.x = v49;
    v154.origin.y = v51;
    v154.size.width = v53;
    v154.size.height = v55;
    objc_msgSend(v58, "constraintEqualToConstant:", CGRectGetHeight(v154));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setActive:", 1);

  }
  if (self->_imageView)
  {
    -[SBUIActionView _updateImageViewLayoutConstraints](self, "_updateImageViewLayoutConstraints");
    -[UIImageView centerYAnchor](self->_imageView, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionView centerYAnchor](self, "centerYAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setActive:", 1);

    -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToConstant:", 35.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setActive:", 1);

    -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToConstant:", 35.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setActive:", 1);
  }
  else
  {
    -[UIView leadingAnchor](self->_textContainer, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionView leadingAnchor](self, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionView trailingContentMargin](self, "trailingContentMargin");
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setActive:", 1);

    -[UIView trailingAnchor](self->_textContainer, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionView trailingAnchor](self, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionView trailingContentMargin](self, "trailingContentMargin");
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setActive:", 1);

  }
  -[UIView centerYAnchor](self->_textContainer, "centerYAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIActionView centerYAnchor](self, "centerYAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setActive:", 1);

  -[SBUIActionViewLabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_textContainer, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setActive:", 1);

  -[SBUIActionViewLabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "userInterfaceIdiom");

    v81 = -12.0;
    if ((v80 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v81 = -16.0;
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v78, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIView trailingAnchor](self->_textContainer, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v78);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v83 = v82;
  objc_msgSend(v82, "setActive:", 1);

  -[SBUIActionViewLabel font](self->_titleLabel, "font");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "_bodyLeading");
  v86 = v85;

  v87 = self->_subtitleLabel;
  if (v87)
  {
    -[SBUIActionViewLabel leadingAnchor](v87, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_textContainer, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setActive:", 1);

    -[SBUIActionViewLabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v6, "leadingAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v93, "userInterfaceIdiom");

      v95 = -12.0;
      if ((v94 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v95 = -16.0;
      objc_msgSend(v91, "constraintEqualToAnchor:constant:", v92, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIView trailingAnchor](self->_textContainer, "trailingAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "constraintEqualToAnchor:", v92);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v109 = v96;
    objc_msgSend(v96, "setActive:", 1);

    -[SBUIActionViewLabel font](self->_subtitleLabel, "font");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "_bodyLeading");
    v112 = v111;

    -[SBUIActionViewLabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionView topAnchor](self, "topAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = 1.173913;
    if (self->_interfaceOrientationIsPortrait)
      v115 = 1.125;
    objc_msgSend(v113, "constraintEqualToAnchor:constant:", v114, v86 * v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setActive:", 1);

    -[SBUIActionViewLabel firstBaselineAnchor](self->_subtitleLabel, "firstBaselineAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionViewLabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = 0.949999988;
    if (self->_interfaceOrientationIsPortrait)
      v119 = 1.0;
    objc_msgSend(v117, "constraintEqualToAnchor:constant:", v118, v112 * v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setActive:", 1);

    -[SBUIActionViewLabel firstBaselineAnchor](self->_subtitleLabel, "firstBaselineAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionView bottomAnchor](self, "bottomAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = 0.608695626;
    if (self->_interfaceOrientationIsPortrait)
      v121 = 0.625;
    objc_msgSend(v106, "constraintEqualToAnchor:constant:", v107, -(v121 * v86));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setActive:", 1);
  }
  else
  {
    -[SBUIActionViewLabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionView topAnchor](self, "topAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintGreaterThanOrEqualToAnchor:constant:", v98, v86 * dbl_215FA4EE0[!self->_interfaceOrientationIsPortrait]);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setActive:", 1);

    -[SBUIActionViewLabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionView bottomAnchor](self, "bottomAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:constant:", v101, -v86);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    __32__SBUIActionView__setupSubviews__block_invoke(250.0, (uint64_t)v102, v102);
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setActive:", 1);

    -[SBUIActionViewLabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionView bottomAnchor](self, "bottomAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintLessThanOrEqualToAnchor:constant:", v104, -(dbl_215FA4EF0[!self->_interfaceOrientationIsPortrait] * v86));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "setActive:", 1);

    -[SBUIActionViewLabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionView topAnchor](self, "topAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:constant:", v107, v86 * dbl_215FA4F00[!self->_interfaceOrientationIsPortrait]);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    __32__SBUIActionView__setupSubviews__block_invoke(250.0, (uint64_t)v108, v108);
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setActive:", 1);

  }
  if (v6)
  {
    objc_msgSend(v6, "trailingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_textContainer, "trailingAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "constraintEqualToAnchor:", v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setActive:", 1);

    objc_msgSend(v6, "centerYAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIActionView centerYAnchor](self, "centerYAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintEqualToAnchor:", v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "setActive:", 1);

  }
  v128 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  highlightView = self->_highlightView;
  self->_highlightView = v128;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_highlightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SBUIActionView addSubview:](self, "addSubview:", self->_highlightView);
  -[UIView leadingAnchor](self->_highlightView, "leadingAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIActionView leadingAnchor](self, "leadingAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "constraintEqualToAnchor:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setActive:", 1);

  -[UIView trailingAnchor](self->_highlightView, "trailingAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIActionView trailingAnchor](self, "trailingAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "constraintEqualToAnchor:", v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setActive:", 1);

  -[UIView topAnchor](self->_highlightView, "topAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIActionView topAnchor](self, "topAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:", v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "setActive:", 1);

  -[UIView bottomAnchor](self->_highlightView, "bottomAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIActionView bottomAnchor](self, "bottomAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "constraintEqualToAnchor:", v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "setActive:", 1);

  -[UIView setHidden:](self->_highlightView, "setHidden:", !self->_highlighted);
}

id __32__SBUIActionView__setupSubviews__block_invoke(float a1, uint64_t a2, void *a3)
{
  id v4;
  double v5;

  v4 = a3;
  *(float *)&v5 = a1;
  objc_msgSend(v4, "setPriority:", v5);
  return v4;
}

- (void)_updateImageViewLayoutConstraints
{
  int64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIImageView *imageView;
  UIView *textContainer;
  void *v13;
  NSArray *v14;
  NSArray *imageViewLayoutConstraints;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  if (self->_imageView && self->_textContainer)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_imageViewLayoutConstraints);
    v3 = -[SBUIActionView imagePosition](self, "imagePosition");
    if (v3 == 1)
      v4 = 0x10000;
    else
      v4 = (unint64_t)(v3 == 2) << 17;
    v5 = (void *)MEMORY[0x24BDD1628];
    v18[0] = CFSTR("trailingContentOffset");
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[SBUIActionView trailingContentMargin](self, "trailingContentMargin");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("leadingContentOffset");
    v19[0] = v7;
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[SBUIActionView leadingContentMargin](self, "leadingContentMargin");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    imageView = self->_imageView;
    v16[0] = CFSTR("imageView");
    v16[1] = CFSTR("textContainer");
    textContainer = self->_textContainer;
    v17[0] = imageView;
    v17[1] = textContainer;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(leadingContentOffset)-[imageView]-(leadingContentOffset)-[textContainer]-(trailingContentOffset)-|"), v4, v10, v13);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    imageViewLayoutConstraints = self->_imageViewLayoutConstraints;
    self->_imageViewLayoutConstraints = v14;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_imageViewLayoutConstraints);
  }
}

- (void)_invalidateVisualStyling
{
  MTVisualStylingProvider *visualStylingProviderStroke;
  MTVisualStylingProvider *visualStylingProviderFill;

  -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_visualStylingProviderStroke, "stopAutomaticallyUpdatingView:", self->_imageView);
  -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_visualStylingProviderStroke, "stopAutomaticallyUpdatingView:", self->_titleLabel);
  -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_visualStylingProviderStroke, "stopAutomaticallyUpdatingView:", self->_subtitleLabel);
  visualStylingProviderStroke = self->_visualStylingProviderStroke;
  self->_visualStylingProviderStroke = 0;

  -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_visualStylingProviderFill, "stopAutomaticallyUpdatingView:", self->_highlightView);
  visualStylingProviderFill = self->_visualStylingProviderFill;
  self->_visualStylingProviderFill = 0;

  -[SBUIActionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateVisualStylingIfNecessary
{
  MTVisualStylingProvider *v3;
  MTVisualStylingProvider *visualStylingProviderStroke;
  MTVisualStylingProvider *v5;
  MTVisualStylingProvider *visualStylingProviderFill;

  if (!self->_visualStylingProviderStroke)
  {
    -[SBUIActionView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v3 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    visualStylingProviderStroke = self->_visualStylingProviderStroke;
    self->_visualStylingProviderStroke = v3;

    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProviderStroke, "automaticallyUpdateView:withStyle:", self->_imageView, 0);
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProviderStroke, "automaticallyUpdateView:withStyle:", self->_titleLabel, 0);
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProviderStroke, "automaticallyUpdateView:withStyle:", self->_subtitleLabel, 0);
    -[SBUIActionView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 2);
    v5 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    visualStylingProviderFill = self->_visualStylingProviderFill;
    self->_visualStylingProviderFill = v5;

    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProviderFill, "automaticallyUpdateView:withStyle:", self->_highlightView, 4);
  }
}

- (SBUIAction)action
{
  return self->_action;
}

- (int64_t)imagePosition
{
  return self->_imagePosition;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_visualStylingProviderFill, 0);
  objc_storeStrong((id *)&self->_visualStylingProviderStroke, 0);
  objc_storeStrong((id *)&self->_imageViewLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
