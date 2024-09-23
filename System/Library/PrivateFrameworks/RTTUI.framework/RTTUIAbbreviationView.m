@implementation RTTUIAbbreviationView

- (RTTUIAbbreviationView)initWithFrame:(CGRect)a3
{
  RTTUIAbbreviationView *v3;
  id v4;
  double v5;
  double v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
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
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id firstValue;
  void *v92;
  objc_super v93;
  _QWORD v94[2];
  _QWORD v95[3];
  _QWORD v96[4];
  _QWORD v97[6];

  v97[4] = *MEMORY[0x24BDAC8D0];
  v93.receiver = self;
  v93.super_class = (Class)RTTUIAbbreviationView;
  v3 = -[RTTUIAbbreviationView initWithFrame:](&v93, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    -[RTTUIAbbreviationView setHighlightView:](v3, "setHighlightView:", v9);

    -[RTTUIAbbreviationView highlightView](v3, "highlightView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[RTTUIAbbreviationView highlightView](v3, "highlightView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setContinuousCornerRadius:", 8.0);

    objc_msgSend(MEMORY[0x24BDF6950], "systemDarkGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIAbbreviationView highlightView](v3, "highlightView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

    -[RTTUIAbbreviationView highlightView](v3, "highlightView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 1);

    -[RTTUIAbbreviationView highlightView](v3, "highlightView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIAbbreviationView addSubview:](v3, "addSubview:", v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v5, v6, v7, v8);
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RTTUIAbbreviationView addSubview:](v3, "addSubview:", v16);
    firstValue = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(firstValue, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(firstValue, "setTextColor:", v17);

    objc_msgSend(firstValue, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 16.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(firstValue, "setFont:", v18);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(firstValue, "setBackgroundColor:", v19);

    v92 = v16;
    objc_msgSend(v16, "addSubview:", firstValue);
    -[RTTUIAbbreviationView setAbbreviation:](v3, "setAbbreviation:", firstValue);
    v90 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v90, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setTextColor:", v20);

    objc_msgSend(v90, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setFont:", v21);

    objc_msgSend(v90, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v90, "setAllowsDefaultTighteningForTruncation:", 1);
    objc_msgSend(v90, "setMinimumScaleFactor:", 0.800000012);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setBackgroundColor:", v22);

    objc_msgSend(v16, "addSubview:", v90);
    -[RTTUIAbbreviationView setHint:](v3, "setHint:", v90);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v5, v6, v7, v8);
    -[RTTUIAbbreviationView setLeftBorderView:](v3, "setLeftBorderView:", v23);

    -[RTTUIAbbreviationView leftBorderView](v3, "leftBorderView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "colorWithAlphaComponent:", 0.35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIAbbreviationView leftBorderView](v3, "leftBorderView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", v26);

    -[RTTUIAbbreviationView leftBorderView](v3, "leftBorderView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHidden:", 1);

    -[RTTUIAbbreviationView leftBorderView](v3, "leftBorderView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIAbbreviationView addSubview:](v3, "addSubview:", v29);

    v30 = (void *)MEMORY[0x24BDD1628];
    -[RTTUIAbbreviationView leftBorderView](v3, "leftBorderView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v86, 7, 0, 0, 0, 1.0, 1.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v31;
    v32 = (void *)MEMORY[0x24BDD1628];
    -[RTTUIAbbreviationView leftBorderView](v3, "leftBorderView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 8, 0, v3, 8, 0.65, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v97[1] = v34;
    v35 = (void *)MEMORY[0x24BDD1628];
    -[RTTUIAbbreviationView leftBorderView](v3, "leftBorderView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v36, 9, 0, v3, 1, 1.0, -1.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v97[2] = v37;
    v38 = (void *)MEMORY[0x24BDD1628];
    -[RTTUIAbbreviationView leftBorderView](v3, "leftBorderView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 10, 0, v3, 10, 1.0, 0.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v97[3] = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v41);

    v78 = (void *)MEMORY[0x24BDD1628];
    -[RTTUIAbbreviationView highlightView](v3, "highlightView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "widthAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "widthAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:multiplier:", v83, 0.95);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = v82;
    -[RTTUIAbbreviationView highlightView](v3, "highlightView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "heightAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "heightAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:multiplier:", v79, 1.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v96[1] = v77;
    -[RTTUIAbbreviationView highlightView](v3, "highlightView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v96[2] = v45;
    -[RTTUIAbbreviationView highlightView](v3, "highlightView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "centerYAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "centerYAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v96[3] = v49;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 4);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "activateConstraints:", v50);

    v85 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v92, "widthAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIAbbreviationView widthAnchor](v3, "widthAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:multiplier:", v51, 1.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v52;
    objc_msgSend(v92, "centerXAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIAbbreviationView centerXAnchor](v3, "centerXAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v55;
    objc_msgSend(v92, "centerYAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIAbbreviationView centerYAnchor](v3, "centerYAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2] = v58;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "activateConstraints:", v59);

    v89 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(firstValue, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = v62;
    objc_msgSend(v90, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v94[1] = v65;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 2);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "activateConstraints:", v66);

    v67 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("abbr, hint"), firstValue, v90, 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[abbr]-2-[hint]|"), 0, 0, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addConstraints:", v69);

    v70 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("abbr, hint"), firstValue, v90, 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[abbr]|"), 0, 0, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addConstraints:", v72);

    v73 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("abbr, hint"), firstValue, v90, 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[hint]|"), 0, 0, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addConstraints:", v75);

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  -[RTTUIAbbreviationView hint](self, "hint", a3.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;

  -[RTTUIAbbreviationView abbreviation](self, "abbreviation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  if (v7 >= v10)
    v11 = v7;
  else
    v11 = v10;
  v12 = v11 + 50.0;
  v13 = height;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[RTTUIAbbreviationView highlightView](self, "highlightView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setDrawLeftBorder:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[RTTUIAbbreviationView leftBorderView](self, "leftBorderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setAbbreviationData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("abbr"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("hint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTUIAbbreviationView abbreviation](self, "abbreviation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v11);

  -[RTTUIAbbreviationView hint](self, "hint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  -[RTTUIAbbreviationView abbreviation](self, "abbreviation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeToFit");

  -[RTTUIAbbreviationView hint](self, "hint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeToFit");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[RTTUIAbbreviationView abbreviation](self, "abbreviation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIAbbreviationView hint](self, "hint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;

  -[RTTUIAbbreviationView abbreviation](self, "abbreviation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)abbreviationText
{
  void *v2;
  void *v3;

  -[RTTUIAbbreviationView abbreviation](self, "abbreviation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)abbreviationData
{
  return self->_abbreviationData;
}

- (BOOL)drawLeftBorder
{
  return self->_drawLeftBorder;
}

- (UILabel)abbreviation
{
  return self->_abbreviation;
}

- (void)setAbbreviation:(id)a3
{
  objc_storeStrong((id *)&self->_abbreviation, a3);
}

- (UILabel)hint
{
  return self->_hint;
}

- (void)setHint:(id)a3
{
  objc_storeStrong((id *)&self->_hint, a3);
}

- (UIView)leftBorderView
{
  return self->_leftBorderView;
}

- (void)setLeftBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_leftBorderView, a3);
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_leftBorderView, 0);
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_abbreviation, 0);
  objc_storeStrong((id *)&self->_abbreviationData, 0);
}

@end
