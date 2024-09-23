@implementation _UIKeyShortcutHUDShortcutInputView

- (_UIKeyShortcutHUDShortcutInputView)initWithFrame:(CGRect)a3
{
  _UIKeyShortcutHUDShortcutInputView *v3;
  _UIKeyShortcutHUDShortcutInputView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDShortcutInputView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UIKeyShortcutHUDShortcutInputView _commonInit](v3, "_commonInit");
  return v4;
}

- (_UIKeyShortcutHUDShortcutInputView)initWithCoder:(id)a3
{
  _UIKeyShortcutHUDShortcutInputView *v3;
  _UIKeyShortcutHUDShortcutInputView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDShortcutInputView;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_UIKeyShortcutHUDShortcutInputView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UILabel *v3;
  UILabel *modifiersLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *inputLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *inputLabelContainer;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  char shouldAlignShortcutModifiersAndInputIn;
  UIView *v22;
  void *v23;
  void *v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *reservedInputWidthConstraint;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *reservedInputWidthSpacingConstraint;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  void *v37;
  void *v38;
  UIStackView *v39;
  UIView *v40;
  void *v41;
  UIStackView *v42;
  UIStackView *labelStackView;
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
  _QWORD v60[4];
  _QWORD v61[2];
  _QWORD v62[7];

  v62[5] = *MEMORY[0x1E0C80C00];
  -[_UIKeyShortcutHUDShortcutInputView setInputStyledAsSingleCharacterOrSymbol:](self, "setInputStyledAsSingleCharacterOrSymbol:", 1);
  -[_UIKeyShortcutHUDShortcutInputView setWantsCompressedWidth:](self, "setWantsCompressedWidth:", 0);
  v3 = (UILabel *)objc_opt_new();
  modifiersLabel = self->_modifiersLabel;
  self->_modifiersLabel = v3;

  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyShortcutModifiersFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_modifiersLabel, "setFont:", v6);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_modifiersLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setTextAlignment:](self->_modifiersLabel, "setTextAlignment:", 2);
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "standardHUDTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_modifiersLabel, "setTextColor:", v8);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_modifiersLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (UILabel *)objc_opt_new();
  inputLabel = self->_inputLabel;
  self->_inputLabel = v9;

  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyShortcutInputCharacterFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_inputLabel, "setFont:", v12);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_inputLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setTextAlignment:](self->_inputLabel, "setTextAlignment:", -[_UIKeyShortcutHUDShortcutInputView _shouldAlignShortcutModifiersAndInputInColumn]((uint64_t)self) ^ 1);
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "standardHUDTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_inputLabel, "setTextColor:", v14);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_inputLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (UIView *)objc_opt_new();
  inputLabelContainer = self->_inputLabelContainer;
  self->_inputLabelContainer = v15;

  -[UIView addSubview:](self->_inputLabelContainer, "addSubview:", self->_inputLabel);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_inputLabelContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView widthAnchor](self->_inputLabelContainer, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_inputLabel, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v20) = 1144750080;
  v59 = v19;
  objc_msgSend(v19, "setPriority:", v20);
  shouldAlignShortcutModifiersAndInputIn = -[_UIKeyShortcutHUDShortcutInputView _shouldAlignShortcutModifiersAndInputInColumn]((uint64_t)self);
  v22 = self->_inputLabelContainer;
  if ((shouldAlignShortcutModifiersAndInputIn & 1) != 0)
  {
    -[UIView rightAnchor](v22, "rightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_inputLabel, "rightAnchor");
  }
  else
  {
    -[UIView centerXAnchor](v22, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_inputLabel, "centerXAnchor");
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView widthAnchor](self->_inputLabelContainer, "widthAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintGreaterThanOrEqualToConstant:", 0.0);
  v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  reservedInputWidthConstraint = self->_reservedInputWidthConstraint;
  self->_reservedInputWidthConstraint = v26;

  -[UIView widthAnchor](self->_inputLabelContainer, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_inputLabel, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 0.0);
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  reservedInputWidthSpacingConstraint = self->_reservedInputWidthSpacingConstraint;
  self->_reservedInputWidthSpacingConstraint = v30;

  v32 = (void *)MEMORY[0x1E0D156E0];
  v62[0] = v58;
  -[UIView centerYAnchor](self->_inputLabelContainer, "centerYAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_inputLabel, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v35;
  v62[2] = v59;
  v36 = self->_reservedInputWidthConstraint;
  v62[3] = self->_reservedInputWidthSpacingConstraint;
  v62[4] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "activateConstraints:", v37);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObserver:selector:name:object:", self, sel__updateInputLabelSpacing_, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

  v39 = [UIStackView alloc];
  v40 = self->_inputLabelContainer;
  v61[0] = self->_modifiersLabel;
  v61[1] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[UIStackView initWithArrangedSubviews:](v39, "initWithArrangedSubviews:", v41);
  labelStackView = self->_labelStackView;
  self->_labelStackView = v42;

  -[UIView setSemanticContentAttribute:](self->_labelStackView, "setSemanticContentAttribute:", 3);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_labelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self, "addSubview:", self->_labelStackView);
  v53 = (void *)MEMORY[0x1E0D156E0];
  -[UIView topAnchor](self->_labelStackView, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v55;
  -[UIView leadingAnchor](self->_labelStackView, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v45;
  -[UIView trailingAnchor](self->_labelStackView, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v48;
  -[UIView bottomAnchor](self->_labelStackView, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "activateConstraints:", v52);

  -[_UIKeyShortcutHUDShortcutInputView _updateInputLabelSpacing:](self, "_updateInputLabelSpacing:", 0);
}

- (uint64_t)_shouldAlignShortcutModifiersAndInputInColumn
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "shouldAlignShortcutModifiersAndInputInColumn");

    return v2;
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDShortcutInputView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)setShortcut:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shortcut);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_shortcut, v4);
    +[_UIKeyShortcutHUDUtilities modifiersAttributedStringForShortcut:]((uint64_t)_UIKeyShortcutHUDUtilities, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_modifiersLabel, "setAttributedText:", v6);

    v8 = 0;
    +[_UIKeyShortcutHUDUtilities inputAttributedStringForShortcut:outShouldStyleAsSingleCharacterOrSymbol:]((uint64_t)_UIKeyShortcutHUDUtilities, v4, &v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_inputLabel, "setAttributedText:", v7);

    -[_UIKeyShortcutHUDShortcutInputView setInputStyledAsSingleCharacterOrSymbol:](self, "setInputStyledAsSingleCharacterOrSymbol:", v8);
    -[_UIKeyShortcutHUDShortcutInputView _updateInputLabelSpacing:](self, "_updateInputLabelSpacing:", 0);
  }

}

- (void)setTextColor:(id)a3
{
  UILabel *modifiersLabel;
  id v5;

  modifiersLabel = self->_modifiersLabel;
  v5 = a3;
  -[UILabel setTextColor:](modifiersLabel, "setTextColor:", v5);
  -[UILabel setTextColor:](self->_inputLabel, "setTextColor:", v5);

}

- (UIColor)textColor
{
  return -[UILabel textColor](self->_modifiersLabel, "textColor");
}

- (void)setWantsCompressedWidth:(BOOL)a3
{
  if (self->_wantsCompressedWidth != a3)
  {
    self->_wantsCompressedWidth = a3;
    -[_UIKeyShortcutHUDShortcutInputView _updateInputLabelSpacing:](self, "_updateInputLabelSpacing:", 0);
  }
}

- (void)setInputStyledAsSingleCharacterOrSymbol:(BOOL)a3
{
  if (self->_inputStyledAsSingleCharacterOrSymbol != a3)
  {
    self->_inputStyledAsSingleCharacterOrSymbol = a3;
    -[_UIKeyShortcutHUDShortcutInputView _updateInputLabelStyle:](self, "_updateInputLabelStyle:", 0);
  }
}

- (double)modifiersLabelWidth
{
  CGRect v3;

  -[UIView bounds](self->_modifiersLabel, "bounds");
  return CGRectGetWidth(v3);
}

- (double)inputLabelWidth
{
  CGRect v3;

  -[UIView bounds](self->_inputLabelContainer, "bounds");
  return CGRectGetWidth(v3);
}

- (void)setModifiersWidth:(double)a3 inputWidth:(double)a4
{
  NSLayoutConstraint *modifiersLabelWidthConstraint;
  double v8;
  NSLayoutConstraint *inputLabelWidthConstraint;
  double v10;
  NSLayoutConstraint *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *v18;

  modifiersLabelWidthConstraint = self->_modifiersLabelWidthConstraint;
  if (!modifiersLabelWidthConstraint)
    goto LABEL_6;
  -[NSLayoutConstraint constant](modifiersLabelWidthConstraint, "constant");
  if (v8 == a3)
  {
    inputLabelWidthConstraint = self->_inputLabelWidthConstraint;
    if (inputLabelWidthConstraint)
    {
      -[NSLayoutConstraint constant](inputLabelWidthConstraint, "constant");
      if (v10 == a4)
        return;
    }
  }
  v11 = self->_modifiersLabelWidthConstraint;
  if (!v11)
  {
LABEL_6:
    -[UIView widthAnchor](self->_modifiersLabel, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 0.0);
    v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v14 = self->_modifiersLabelWidthConstraint;
    self->_modifiersLabelWidthConstraint = v13;

    -[NSLayoutConstraint setActive:](self->_modifiersLabelWidthConstraint, "setActive:", 1);
    v11 = self->_modifiersLabelWidthConstraint;
  }
  -[NSLayoutConstraint setConstant:](v11, "setConstant:", a3);
  v15 = self->_inputLabelWidthConstraint;
  if (!v15)
  {
    -[UIView widthAnchor](self->_inputLabel, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", 0.0);
    v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v18 = self->_inputLabelWidthConstraint;
    self->_inputLabelWidthConstraint = v17;

    -[NSLayoutConstraint setActive:](self->_inputLabelWidthConstraint, "setActive:", 1);
    v15 = self->_inputLabelWidthConstraint;
  }
  -[NSLayoutConstraint setConstant:](v15, "setConstant:", a4);
  -[_UIKeyShortcutHUDShortcutInputView _updateInputLabelSpacing:](self, "_updateInputLabelSpacing:", 0);
}

- (void)_updateInputLabelStyle:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  id v7;

  v4 = -[_UIKeyShortcutHUDShortcutInputView isInputStyledAsSingleCharacterOrSymbol](self, "isInputStyledAsSingleCharacterOrSymbol", a3);
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v4)
    objc_msgSend(v5, "keyShortcutInputCharacterFont");
  else
    objc_msgSend(v5, "keyShortcutInputWordFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_inputLabel, "setFont:", v6);

}

- (void)_updateInputLabelSpacing:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  double v19;
  NSLayoutConstraint *modifiersLabelWidthConstraint;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  id v25;

  +[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIKeyShortcutHUDShortcutInputView wantsCompressedWidth](self, "wantsCompressedWidth"))
    v5 = 0;
  else
    v5 = -[_UIKeyShortcutHUDShortcutInputView _shouldAlignShortcutModifiersAndInputInColumn]((uint64_t)self) ^ 1;
  -[NSLayoutConstraint setActive:](self->_reservedInputWidthConstraint, "setActive:", v5);
  objc_msgSend(v4, "standardShortcutInputReservedWidth");
  v7 = v6;
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scaledValueForValue:compatibleWithTraitCollection:", v8, v7);
  -[NSLayoutConstraint setConstant:](self->_reservedInputWidthConstraint, "setConstant:");

  if (-[_UIKeyShortcutHUDShortcutInputView isInputStyledAsSingleCharacterOrSymbol](self, "isInputStyledAsSingleCharacterOrSymbol")&& (+[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "shouldAlignShortcutModifiersAndInputInColumn"), v9, !v10))
  {
    v11 = 0;
  }
  else
  {
    v11 = -[_UIKeyShortcutHUDShortcutInputView wantsCompressedWidth](self, "wantsCompressedWidth") ^ 1;
  }
  -[NSLayoutConstraint setActive:](self->_reservedInputWidthSpacingConstraint, "setActive:", v11);
  objc_msgSend(v4, "standardShortcutModifierInputMinimumSpacing");
  v13 = v12;
  -[UIView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scaledValueForValue:compatibleWithTraitCollection:", v14, v13);
  v16 = v15;

  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldAlignShortcutModifiersAndInputInColumn");

  if (v18)
  {
    modifiersLabelWidthConstraint = self->_modifiersLabelWidthConstraint;
    if (!modifiersLabelWidthConstraint
      || (-[NSLayoutConstraint constant](modifiersLabelWidthConstraint, "constant"), v22 = v21, v19 = 0.0, v22 != 0.0)
      && (v19 = v16, !self->_modifiersLabelWidthConstraint))
    {
      -[UILabel text](self->_modifiersLabel, "text", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");

      v19 = 0.0;
      if (v24)
        v19 = v16;
    }
  }
  else
  {
    v19 = v16 + v16;
  }
  -[NSLayoutConstraint setConstant:](self->_reservedInputWidthSpacingConstraint, "setConstant:", v19);

}

- (_UIKeyShortcutHUDShortcut)shortcut
{
  return (_UIKeyShortcutHUDShortcut *)objc_loadWeakRetained((id *)&self->_shortcut);
}

- (BOOL)wantsCompressedWidth
{
  return self->_wantsCompressedWidth;
}

- (UILabel)modifiersLabel
{
  return self->_modifiersLabel;
}

- (void)setModifiersLabel:(id)a3
{
  objc_storeStrong((id *)&self->_modifiersLabel, a3);
}

- (UILabel)inputLabel
{
  return self->_inputLabel;
}

- (void)setInputLabel:(id)a3
{
  objc_storeStrong((id *)&self->_inputLabel, a3);
}

- (UIView)inputLabelContainer
{
  return self->_inputLabelContainer;
}

- (void)setInputLabelContainer:(id)a3
{
  objc_storeStrong((id *)&self->_inputLabelContainer, a3);
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (NSLayoutConstraint)reservedInputWidthConstraint
{
  return self->_reservedInputWidthConstraint;
}

- (void)setReservedInputWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_reservedInputWidthConstraint, a3);
}

- (NSLayoutConstraint)reservedInputWidthSpacingConstraint
{
  return self->_reservedInputWidthSpacingConstraint;
}

- (void)setReservedInputWidthSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_reservedInputWidthSpacingConstraint, a3);
}

- (NSLayoutConstraint)modifiersLabelWidthConstraint
{
  return self->_modifiersLabelWidthConstraint;
}

- (void)setModifiersLabelWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_modifiersLabelWidthConstraint, a3);
}

- (NSLayoutConstraint)inputLabelWidthConstraint
{
  return self->_inputLabelWidthConstraint;
}

- (void)setInputLabelWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_inputLabelWidthConstraint, a3);
}

- (BOOL)isInputStyledAsSingleCharacterOrSymbol
{
  return self->_inputStyledAsSingleCharacterOrSymbol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_modifiersLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_reservedInputWidthSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_reservedInputWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_inputLabelContainer, 0);
  objc_storeStrong((id *)&self->_inputLabel, 0);
  objc_storeStrong((id *)&self->_modifiersLabel, 0);
  objc_destroyWeak((id *)&self->_shortcut);
}

@end
