@implementation RTTUIAbbreviationCell

- (RTTUIAbbreviationCell)initWithFrame:(CGRect)a3
{
  RTTUIAbbreviationCell *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIView *abbreviationContainer;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  UIVisualEffectView *hintContainer;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIView *v27;
  void *v28;
  void *v29;
  void *v30;
  UIView *v31;
  void *v32;
  void *v33;
  void *v34;
  UIVisualEffectView *v35;
  void *v36;
  void *v37;
  void *v38;
  UIVisualEffectView *v39;
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
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)RTTUIAbbreviationCell;
  v3 = -[RTTUIAbbreviationCell initWithFrame:](&v56, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTTUIAbbreviationCell setBackgroundColor:](v3, "setBackgroundColor:", v4);
    }
    else
    {
      v5 = objc_alloc(MEMORY[0x24BDF6F90]);
      -[RTTUIAbbreviationCell bounds](v3, "bounds");
      v4 = (void *)objc_msgSend(v5, "initWithFrame:");
      objc_msgSend(v4, "setAutoresizingMask:", 18);
      -[RTTUIAbbreviationCell contentView](v3, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAutoresizesSubviews:", 1);

      -[RTTUIAbbreviationCell contentView](v3, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v4);

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithPrivateStyle:", 2030);
      objc_msgSend(v8, "setGroupName:", CFSTR("RTTUIAbbreviationCell"));
      -[RTTUIAbbreviationCell contentView](v3, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v8);

    }
    v10 = objc_opt_new();
    abbreviationContainer = v3->_abbreviationContainer;
    v3->_abbreviationContainer = (UIView *)v10;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_abbreviationContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RTTUIAbbreviationCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v3->_abbreviationContainer);

    v13 = objc_alloc(MEMORY[0x24BDF6FC8]);
    objc_msgSend(MEMORY[0x24BDF6F88], "controlCenterSecondaryVibrancyEffect");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithEffect:", v14);
    hintContainer = v3->_hintContainer;
    v3->_hintContainer = (UIVisualEffectView *)v15;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_hintContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RTTUIAbbreviationCell contentView](v3, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v3->_hintContainer);

    v18 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v19);

    objc_msgSend(v18, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v20);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v21);

    -[UIView addSubview:](v3->_abbreviationContainer, "addSubview:", v18);
    -[RTTUIAbbreviationCell setAbbreviation:](v3, "setAbbreviation:", v18);
    v22 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTextColor:", v23);

    objc_msgSend(v22, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFont:", v24);

    objc_msgSend(v22, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v22, "setMinimumScaleFactor:", 0.800000012);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBackgroundColor:", v25);

    -[UIVisualEffectView contentView](v3->_hintContainer, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v22);

    -[RTTUIAbbreviationCell setHint:](v3, "setHint:", v22);
    v27 = v3->_abbreviationContainer;
    v28 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("abbr"), v18, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[abbr]|"), 0, 0, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v27, "addConstraints:", v30);

    v31 = v3->_abbreviationContainer;
    v32 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("abbr"), v18, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[abbr]|"), 0, 0, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v31, "addConstraints:", v34);

    v35 = v3->_hintContainer;
    v36 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("hint"), v22, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[hint]|"), 0, 0, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView addConstraints:](v35, "addConstraints:", v38);

    v39 = v3->_hintContainer;
    v40 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("hint"), v22, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[hint]|"), 0, 0, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView addConstraints:](v39, "addConstraints:", v42);

    -[RTTUIAbbreviationCell contentView](v3, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_abbreviationContainer"), v3->_abbreviationContainer, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_abbreviationContainer]|"), 0, 0, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addConstraints:", v46);

    -[RTTUIAbbreviationCell contentView](v3, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_hintContainer"), v3->_hintContainer, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_hintContainer]|"), 0, 0, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addConstraints:", v50);

    -[RTTUIAbbreviationCell contentView](v3, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_abbreviationContainer, _hintContainer"), v3->_abbreviationContainer, v3->_hintContainer, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(5.0)-[_abbreviationContainer][_hintContainer]-(3.0)-|"), 0, 0, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addConstraints:", v54);

  }
  return v3;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RTTUIAbbreviationCell;
  -[RTTUIAbbreviationCell layoutSubviews](&v2, sel_layoutSubviews);
}

- (void)setAbbreviationData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("abbr"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("hint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTUIAbbreviationCell abbreviation](self, "abbreviation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v9);

  -[RTTUIAbbreviationCell hint](self, "hint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

}

- (id)abbreviationText
{
  void *v2;
  void *v3;

  -[RTTUIAbbreviationCell abbreviation](self, "abbreviation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[RTTUIAbbreviationCell setAbbreviation:](self, "setAbbreviation:", 0);
  -[RTTUIAbbreviationCell setHint:](self, "setHint:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RTTUIAbbreviationCell;
  -[RTTUIAbbreviationCell dealloc](&v3, sel_dealloc);
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

  -[RTTUIAbbreviationCell abbreviation](self, "abbreviation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIAbbreviationCell hint](self, "hint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;

  -[RTTUIAbbreviationCell abbreviation](self, "abbreviation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_abbreviation, 0);
  objc_storeStrong((id *)&self->_hintContainer, 0);
  objc_storeStrong((id *)&self->_abbreviationContainer, 0);
}

@end
