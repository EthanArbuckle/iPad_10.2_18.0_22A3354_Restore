@implementation BFFPasscodeInputView

- (BFFPasscodeInputView)initWithFrame:(CGRect)a3
{
  BFFPasscodeInputView *v3;
  UILabel *v4;
  UILabel *instructions;
  UILabel *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BFFPasscodeInputView;
  v3 = -[BFFPasscodeInputView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    instructions = v3->_instructions;
    v3->_instructions = v4;

    v6 = v3->_instructions;
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setNumberOfLines:](v3->_instructions, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v3->_instructions, "setTextAlignment:", 1);
    -[BFFPasscodeInputView addSubview:](v3, "addSubview:", v3->_instructions);
  }
  return v3;
}

- (id)passcode
{
  return 0;
}

- (id)passcodeDisplayView
{
  return 0;
}

- (void)setFooterView:(id)a3
{
  void *v5;
  UIView **p_footerView;
  id v7;
  id v8;

  v8 = a3;
  -[BFFPasscodeInputView footerView](self, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  p_footerView = &self->_footerView;
  if (v8)
  {
    objc_storeStrong((id *)p_footerView, a3);
    -[BFFPasscodeInputView footerView](self, "footerView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[BFFPasscodeInputView addSubview:](self, "addSubview:", v7);
  }
  else
  {
    v7 = *p_footerView;
    *p_footerView = 0;
  }

  -[BFFPasscodeInputView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFooterButtonText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[BFFPasscodeInputView footerButton](self, "footerButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[BFFPasscodeInputView setFooterButton:](self, "setFooterButton:", v5);

      -[BFFPasscodeInputView footerButton](self, "footerButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "titleLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFont:", v8);

      -[BFFPasscodeInputView footerButton](self, "footerButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNumberOfLines:", 0);

      -[BFFPasscodeInputView footerButton](self, "footerButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextAlignment:", 1);

      -[BFFPasscodeInputView footerButton](self, "footerButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_footerButtonPressed, 64);

      -[BFFPasscodeInputView footerButton](self, "footerButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BFFPasscodeInputView addSubview:](self, "addSubview:", v14);

    }
    -[BFFPasscodeInputView footerButton](self, "footerButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:forState:", v16, 0);

  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");

    -[BFFPasscodeInputView setFooterButton:](self, "setFooterButton:", 0);
  }

}

- (void)footerButtonPressed
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[BFFPasscodeInputView delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[BFFPasscodeInputView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[BFFPasscodeInputView delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[BFFPasscodeInputView footerButton](self, "footerButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "passcodeInput:tappedFooterButton:", self, v7);

    }
  }
}

- (void)setInstructionsLinkText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIButton *instructionsLinkButton;
  UIButton *v17;
  id v18;

  v18 = a3;
  if (v18)
  {
    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[BFFPasscodeInputView setInstructionsLinkButton:](self, "setInstructionsLinkButton:", v5);

      objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "titleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFont:", v6);

      -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNumberOfLines:", 0);

      -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextAlignment:", 1);

      -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__instructionsLinkButtonPressed, 64);

      -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BFFPasscodeInputView addSubview:](self, "addSubview:", v14);

    }
    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:forState:", v18, 0);

    goto LABEL_7;
  }
  instructionsLinkButton = self->_instructionsLinkButton;
  if (instructionsLinkButton)
  {
    -[UIButton removeFromSuperview](instructionsLinkButton, "removeFromSuperview");
    v17 = self->_instructionsLinkButton;
    self->_instructionsLinkButton = 0;

LABEL_7:
    -[BFFPasscodeInputView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_instructionsLinkButtonPressed
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[BFFPasscodeInputView delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[BFFPasscodeInputView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[BFFPasscodeInputView delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "passcodeInputTappedInstructionsLink:", self);

    }
  }
}

- (id)passcodeField
{
  return 0;
}

- (void)_layoutForBounds:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  _BOOL4 v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double MaxY;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  CGFloat v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  double v118;
  double v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  void *v128;
  double v129;
  double v130;
  id v131;
  id v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BFFPasscodeInputView instructions](self, "instructions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;
  v12 = v11;

  -[BFFPasscodeInputView instructions](self, "instructions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = BFFRoundToPixel_0((width - v10) * 0.5);
  v15 = BFFIsiPad();
  v16 = 13.5;
  if (!v15)
    v16 = 15.0;
  objc_msgSend(v13, "setFrame:", v14, v16, v10, v12);

  -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFPasscodeInputView footerButton](self, "footerButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v21, "numberOfLines"), 0.0, 0.0, width, 1.79769313e308);
    v23 = v22;
    v25 = *(double *)&v24;
    v131 = v24;

    v26 = BFFRoundToPixel_0((width - v23) * 0.5);
    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrame:", v26, 0.0, v23, v25);

    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutIfNeeded");

    objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "titleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_firstBaselineOffsetFromTop");
    v33 = v32;
    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "titleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "frame");
    v36 = height;
    v37 = x;
    v38 = y;
    v39 = v33 + CGRectGetMinY(v133);

    -[BFFPasscodeInputView instructions](self, "instructions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "frame");
    MaxY = CGRectGetMaxY(v134);
    -[BFFPasscodeInputView instructions](self, "instructions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_baselineOffsetFromBottom");
    v44 = MaxY - v43;
    objc_msgSend(v29, "scaledValueForValue:", 30.0);
    v46 = v44 + v45 - v39;
    y = v38;
    x = v37;
    height = v36;

    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFrame:", v26, v46, v23, *(double *)&v131);

  }
  -[BFFPasscodeInputView footerButton](self, "footerButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[BFFPasscodeInputView footerButton](self, "footerButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "frame");
    v51 = v50;
    v53 = v52;

    -[BFFPasscodeInputView footerButton](self, "footerButton");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "titleLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFPasscodeInputView footerButton](self, "footerButton");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "titleLabel");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v57, "numberOfLines"), 0.0, 0.0, width, 1.79769313e308);
    v59 = v58;
    v61 = v60;

    v135.origin.x = v51;
    v135.origin.y = v53;
    v135.size.width = v59;
    v135.size.height = v61;
    v62 = CGRectGetWidth(v135);
    v63 = BFFRoundToPixel_0(x + (width - v62) * 0.5);
    v136.origin.x = x;
    v136.origin.y = y;
    v136.size.width = width;
    v136.size.height = height;
    v64 = CGRectGetMaxY(v136);
    v65 = BFFRoundToPixel_0(v64 - v61 + -15.0);
    -[BFFPasscodeInputView footerButton](self, "footerButton");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setFrame:", v63, v65, v59, v61);

  }
  -[BFFPasscodeInputView footerView](self, "footerView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    -[BFFPasscodeInputView footerView](self, "footerView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v69) = 1112014848;
    LODWORD(v70) = 1132068864;
    objc_msgSend(v68, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, 0.0, v69, v70);
    v72 = v71;
    v74 = v73;

    v75 = BFFRoundToPixel_0((width - v72) * 0.5);
    -[BFFPasscodeInputView footerButton](self, "footerButton");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (v76)
    {
      -[BFFPasscodeInputView footerButton](self, "footerButton");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "frame");
      v79 = BFFRoundToPixel_0(v78 - v74 + -10.0);

    }
    else
    {
      v137.origin.x = x;
      v137.origin.y = y;
      v137.size.width = width;
      v137.size.height = height;
      v80 = CGRectGetMaxY(v137);
      v79 = BFFRoundToPixel_0(v80 - v74 + -10.0);
    }
    -[BFFPasscodeInputView footerView](self, "footerView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setFrame:", v75, v79, v72, v74);

    -[BFFPasscodeInputView footerView](self, "footerView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setNeedsLayout");

  }
  -[BFFPasscodeInputView footerButton](self, "footerButton");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[BFFPasscodeInputView footerView](self, "footerView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85)
    {
      -[BFFPasscodeInputView footerView](self, "footerView");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "frame");
      v88 = v87;
      v90 = v89;
      v92 = v91;
      v94 = v93;

      -[BFFPasscodeInputView passcodeDisplayView](self, "passcodeDisplayView");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "frame");
      v96 = CGRectGetMaxY(v138) + 15.0;

      if (v96 >= v90)
        v97 = v96;
      else
        v97 = v90;
      v98 = BFFRoundToPixel_0(v97);
      -[BFFPasscodeInputView footerView](self, "footerView");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setFrame:", v88, v98, v92, v94);

      -[BFFPasscodeInputView footerButton](self, "footerButton");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "frame");
      v102 = v101;
      v104 = v103;
      v106 = v105;
      v108 = v107;

      v139.origin.x = v88;
      v139.origin.y = v98;
      v139.size.width = v92;
      v139.size.height = v94;
      v109 = CGRectGetMaxY(v139) + 10.0;
      if (v109 < v104)
        v109 = v104;
      goto LABEL_24;
    }
  }
  -[BFFPasscodeInputView footerButton](self, "footerButton");
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  if (v110)
  {
    -[BFFPasscodeInputView footerButton](self, "footerButton");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "frame");
    v102 = v112;
    v114 = v113;
    v106 = v115;
    v108 = v116;

    -[BFFPasscodeInputView passcodeDisplayView](self, "passcodeDisplayView");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "frame");
    v118 = CGRectGetMaxY(v140);

    if (v118 >= v114)
      v109 = v118;
    else
      v109 = v114;
LABEL_24:
    v119 = BFFRoundToPixel_0(v109);
    -[BFFPasscodeInputView footerButton](self, "footerButton");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
    v132 = v120;
    objc_msgSend(v120, "setFrame:", v102, v119, v106, v108);

    return;
  }
  -[BFFPasscodeInputView footerView](self, "footerView");
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  if (v121)
  {
    -[BFFPasscodeInputView footerView](self, "footerView");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "frame");
    v102 = v123;
    v125 = v124;
    v106 = v126;
    v108 = v127;

    -[BFFPasscodeInputView passcodeDisplayView](self, "passcodeDisplayView");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "frame");
    v129 = CGRectGetMaxY(v141);

    if (v129 >= v125)
      v130 = v129;
    else
      v130 = v125;
    v119 = BFFRoundToPixel_0(v130);
    -[BFFPasscodeInputView footerView](self, "footerView");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BFFPasscodeInputView;
  -[BFFPasscodeInputView layoutSubviews](&v3, sel_layoutSubviews);
  -[BFFPasscodeInputView bounds](self, "bounds");
  -[BFFPasscodeInputView _layoutForBounds:](self, "_layoutForBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  void *v6;
  double v7;
  double v8;
  CGSize result;
  CGRect v10;

  height = a3.height;
  width = a3.width;
  -[BFFPasscodeInputView _layoutForBounds:](self, "_layoutForBounds:", 0.0, 0.0, a3.width, a3.height);
  -[BFFPasscodeInputView footerButton](self, "footerButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (-[BFFPasscodeInputView footerView](self, "footerView"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v6, "frame");
    height = CGRectGetMaxY(v10) + 15.0;

  }
  v7 = width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[BFFPasscodeInputView passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)isFirstResponder
{
  void *v2;
  char v3;

  -[BFFPasscodeInputView passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BFFPasscodeInputView;
  -[BFFPasscodeInputView resignFirstResponder](&v6, sel_resignFirstResponder);
  -[BFFPasscodeInputView passcodeField](self, "passcodeField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "resignFirstResponder");

  return v4;
}

- (void)shakePasscode
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id CAMediaTimingFunctionClass;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  Class (*v37)(uint64_t);
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  -[BFFPasscodeInputView passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v3 = (void *)getCASpringAnimationClass_softClass;
  v43 = getCASpringAnimationClass_softClass;
  if (!getCASpringAnimationClass_softClass)
  {
    v35 = MEMORY[0x24BDAC760];
    v36 = 3221225472;
    v37 = __getCASpringAnimationClass_block_invoke;
    v38 = &unk_24D234208;
    v39 = &v40;
    __getCASpringAnimationClass_block_invoke((uint64_t)&v35);
    v3 = (void *)v41[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v4, "animationWithKeyPath:", CFSTR("position.x"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMass:", 1.20000005);
  objc_msgSend(v5, "setStiffness:", 1200.0);
  objc_msgSend(v5, "setDamping:", 12.0);
  CAMediaTimingFunctionClass = getCAMediaTimingFunctionClass();
  LODWORD(v7) = 1028389654;
  LODWORD(v8) = 990057071;
  LODWORD(v9) = 1059712716;
  LODWORD(v10) = 1.0;
  objc_msgSend(CAMediaTimingFunctionClass, "functionWithControlPoints::::", v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v11);

  objc_msgSend(v5, "setDuration:", 0.666999996);
  objc_msgSend(v5, "setInitialVelocity:", 0.0);
  getkCAFillModeBackwards();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFillMode:", v12);

  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v2, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "position");
  v16 = v15 + 75.0;
  *(float *)&v16 = v16;
  objc_msgSend(v13, "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", v17);

  objc_msgSend(v2, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAnimation:forKey:", v5, CFSTR("spring"));

  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v19 = (void *)getCABasicAnimationClass_softClass;
  v43 = getCABasicAnimationClass_softClass;
  if (!getCABasicAnimationClass_softClass)
  {
    v35 = MEMORY[0x24BDAC760];
    v36 = 3221225472;
    v37 = __getCABasicAnimationClass_block_invoke;
    v38 = &unk_24D234208;
    v39 = &v40;
    __getCABasicAnimationClass_block_invoke((uint64_t)&v35);
    v19 = (void *)v41[3];
  }
  v20 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v20, "animationWithKeyPath:", CFSTR("position.x"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = getCAMediaTimingFunctionClass();
  LODWORD(v23) = 1054276898;
  LODWORD(v24) = 1058305108;
  LODWORD(v25) = 0;
  LODWORD(v26) = 1.0;
  objc_msgSend(v22, "functionWithControlPoints::::", v23, v25, v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTimingFunction:", v27);

  objc_msgSend(v21, "setDuration:", 0.100000001);
  getkCAFillModeBackwards();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFillMode:", v28);

  v29 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v2, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "position");
  v32 = v31 + -75.0;
  *(float *)&v32 = v32;
  objc_msgSend(v29, "numberWithFloat:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFromValue:", v33);

  objc_msgSend(v2, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addAnimation:forKey:", v21, CFSTR("force"));

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  float MaxY;
  float v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  -[BFFPasscodeInputView instructions](self, "instructions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  MaxY = CGRectGetMaxY(v22);
  v5 = fmaxf(MaxY, 0.0);

  -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v7 = CGRectGetMaxY(v23);
  v8 = fmaxf(v7, v5);

  -[BFFPasscodeInputView footerButton](self, "footerButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v10 = CGRectGetMaxY(v24);
  v11 = fmaxf(v10, v8);

  -[BFFPasscodeInputView footerView](self, "footerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v13 = CGRectGetMaxY(v25);
  v14 = fmaxf(v13, v11);

  -[BFFPasscodeInputView passcodeField](self, "passcodeField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v16 = CGRectGetMaxY(v26);
  v17 = fmaxf(v16, v14);

  -[BFFPasscodeInputView bounds](self, "bounds");
  v19 = v18;
  v20 = v17;
  result.height = v20;
  result.width = v19;
  return result;
}

- (BFFPasscodeInputViewDelegate)delegate
{
  return (BFFPasscodeInputViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
  objc_storeStrong((id *)&self->_instructions, a3);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (UIButton)footerButton
{
  return self->_footerButton;
}

- (void)setFooterButton:(id)a3
{
  objc_storeStrong((id *)&self->_footerButton, a3);
}

- (UIButton)instructionsLinkButton
{
  return self->_instructionsLinkButton;
}

- (void)setInstructionsLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsLinkButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsLinkButton, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
