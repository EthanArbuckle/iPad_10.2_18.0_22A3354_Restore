@implementation _UIStatusBarCellularNetworkTypeView

- (_UIStatusBarCellularNetworkTypeView)initWithFrame:(CGRect)a3
{
  _UIStatusBarCellularNetworkTypeView *v3;
  UILayoutGuide *v4;
  _UIStatusBarStringView *v5;
  uint64_t v6;
  _UIStatusBarStringView *stringView;
  UIVectorLabel *v8;
  uint64_t v9;
  UIVectorLabel *prefixLabel;
  UIVectorLabel *v11;
  uint64_t v12;
  UIVectorLabel *accessoryLabel;
  void *v14;
  uint64_t v15;
  NSLayoutConstraint *widthConstraint;
  UILayoutGuide *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UILayoutGuide *v35;
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
  objc_super v54;
  _QWORD v55[14];

  v55[12] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)_UIStatusBarCellularNetworkTypeView;
  v3 = -[UIView initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(UILayoutGuide);
  -[UIView addLayoutGuide:](v3, "addLayoutGuide:");
  v5 = [_UIStatusBarStringView alloc];
  -[UIView bounds](v3, "bounds");
  v6 = -[_UIStatusBarStringView initWithFrame:](v5, "initWithFrame:");
  stringView = v3->_stringView;
  v3->_stringView = (_UIStatusBarStringView *)v6;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stringView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setLineBreakMode:](v3->_stringView, "setLineBreakMode:", 2);
  -[UIView addSubview:](v3, "addSubview:", v3->_stringView);
  v8 = [UIVectorLabel alloc];
  -[UIView bounds](v3, "bounds");
  v9 = -[UIVectorLabel initWithFrame:](v8, "initWithFrame:");
  prefixLabel = v3->_prefixLabel;
  v3->_prefixLabel = (UIVectorLabel *)v9;

  -[UIVectorLabel setText:](v3->_prefixLabel, "setText:", &stru_1E16EDF20);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_prefixLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setHidden:](v3->_prefixLabel, "setHidden:", 1);
  -[UIView addSubview:](v3, "addSubview:", v3->_prefixLabel);
  v11 = [UIVectorLabel alloc];
  -[UIView bounds](v3, "bounds");
  v12 = -[UIVectorLabel initWithFrame:](v11, "initWithFrame:");
  accessoryLabel = v3->_accessoryLabel;
  v3->_accessoryLabel = (UIVectorLabel *)v12;

  -[UIVectorLabel setText:](v3->_accessoryLabel, "setText:", &stru_1E16EDF20);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_accessoryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setHidden:](v3->_accessoryLabel, "setHidden:", 1);
  -[UIView addSubview:](v3, "addSubview:", v3->_accessoryLabel);
  -[UIView widthAnchor](v3, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 0.0);
  v15 = objc_claimAutoreleasedReturnValue();
  widthConstraint = v3->_widthConstraint;
  v3->_widthConstraint = (NSLayoutConstraint *)v15;

  -[UILayoutGuide leadingAnchor](v4, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v3->_stringView, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v51;
  -[UILayoutGuide trailingAnchor](v4, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v3->_stringView, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v48;
  -[UILayoutGuide topAnchor](v4, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](v3->_stringView, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v45;
  -[UILayoutGuide bottomAnchor](v4, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](v3->_stringView, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v42;
  -[UILayoutGuide leadingAnchor](v4, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v3->_prefixLabel, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v38;
  -[UIView trailingAnchor](v3->_prefixLabel, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v3->_accessoryLabel, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v34;
  -[UIView lastBaselineAnchor](v3->_stringView, "lastBaselineAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView lastBaselineAnchor](v3->_prefixLabel, "lastBaselineAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v31;
  -[UIView lastBaselineAnchor](v3->_stringView, "lastBaselineAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView lastBaselineAnchor](v3->_accessoryLabel, "lastBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v28;
  v17 = v4;
  -[UILayoutGuide centerXAnchor](v4, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](v3, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v20;
  -[UIView topAnchor](v3, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v17;
  -[UILayoutGuide topAnchor](v17, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[9] = v23;
  -[UIView bottomAnchor](v3, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](v17, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v55[10] = v26;
  v55[11] = v3->_widthConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 12);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v40);
  return v3;
}

- (void)setFixedWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  _QWORD v13[6];

  -[_UIStatusBarCellularNetworkTypeView widthConstraint](self, "widthConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constant");
  v7 = vabdd_f64(a3, v6);

  if (v7 > 0.00000011920929)
  {
    if (a3 <= 0.0
      || (-[_UIStatusBarCellularNetworkTypeView widthConstraint](self, "widthConstraint"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "constant"),
          v10 = v9,
          v8,
          v10 <= 0.0))
    {
      -[_UIStatusBarCellularNetworkTypeView widthConstraint](self, "widthConstraint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setConstant:", a3);

      -[UIView superview](self, "superview");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layoutSubviews");

    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __53___UIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke;
      v13[3] = &unk_1E16B1888;
      v13[4] = self;
      *(double *)&v13[5] = a3;
      objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v13);
    }
  }
}

- (void)_animateUpdateToText:(id)a3 prefixLength:(int64_t)a4 styleAttributes:(id)a5 attributedText:(id)a6 type:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  int64_t v28;
  BOOL v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  int64_t v34;
  BOOL v35;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a4 != 0x7FFFFFFFFFFFFFFFLL;
  v16 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke;
  v30[3] = &unk_1E16E7CB8;
  v30[4] = self;
  v35 = a4 != 0x7FFFFFFFFFFFFFFFLL;
  v17 = v12;
  v31 = v17;
  v34 = a4;
  v18 = v14;
  v32 = v18;
  v19 = v13;
  v33 = v19;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v30);
  v20 = (void *)UIApp;
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_2;
  v24[3] = &unk_1E16E7CB8;
  v24[4] = self;
  v25 = v18;
  v26 = v17;
  v27 = v19;
  v29 = v15;
  v28 = a7;
  v21 = v19;
  v22 = v17;
  v23 = v18;
  objc_msgSend(v20, "_performBlockAfterCATransactionCommits:", v24);

}

- (void)setAttributedText:(id)a3 prefixLength:(int64_t)a4 forType:(int64_t)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
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
  int64_t v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v6 = a6;
  v33[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (v6 && !self->_animatingUpdate)
  {
    self->_animatingUpdate = 1;
    objc_msgSend(v10, "string");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarCellularNetworkTypeView _animateUpdateToText:prefixLength:styleAttributes:attributedText:type:](self, "_animateUpdateToText:prefixLength:styleAttributes:attributedText:type:", v28, a4, 0, v11, a5);

  }
  else
  {
    v31 = a5;
    -[UILabel setAttributedText:](self->_stringView, "setAttributedText:", v10);
    -[UIView setHidden:](self->_prefixLabel, "setHidden:", 1);
    -[UIView setHidden:](self->_accessoryLabel, "setHidden:", 1);
    -[UIView setAlpha:](self->_stringView, "setAlpha:", 1.0);
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v12, "substringToIndex:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "attributesAtIndex:effectiveRange:", 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)off_1E1678D90;
    objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)off_1E1678D98;
    v29 = v15;
    objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0CB3498]);
    v32[0] = *(_QWORD *)off_1E1678E60;
    v32[1] = v16;
    v33[0] = &unk_1E1A962C0;
    v33[1] = v17;
    v30 = (void *)v17;
    v32[2] = v18;
    v33[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithString:attributes:", v14, v21);
    -[UIVectorLabel _setAttributedText:](self->_prefixLabel, "_setAttributedText:", v22);

    -[UIView setNeedsLayout](self->_prefixLabel, "setNeedsLayout");
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "string");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "substringFromIndex:", a4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVectorLabel setText:](self->_accessoryLabel, "setText:", v24);

      objc_msgSend(v11, "attributesAtIndex:effectiveRange:", a4, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVectorLabel setFont:](self->_accessoryLabel, "setFont:", v26);

      objc_msgSend(v25, "objectForKeyedSubscript:", v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVectorLabel setTextColor:](self->_accessoryLabel, "setTextColor:", v27);

      -[UIView setNeedsLayout](self->_accessoryLabel, "setNeedsLayout");
    }
    self->_type = v31;
    self->_animatingUpdate = 0;

  }
}

- (void)setText:(id)a3 prefixLength:(int64_t)a4 withStyleAttributes:(id)a5 forType:(int64_t)a6 animated:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v7 = a7;
  v27[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  if (v7 && !self->_animatingUpdate)
  {
    self->_animatingUpdate = 1;
    -[_UIStatusBarCellularNetworkTypeView _animateUpdateToText:prefixLength:styleAttributes:attributedText:type:](self, "_animateUpdateToText:prefixLength:styleAttributes:attributedText:type:", v12, a4, v13, 0, a6);
  }
  else
  {
    -[_UIStatusBarStringView setText:](self->_stringView, "setText:", v12);
    -[_UIStatusBarStringView applyStyleAttributes:](self->_stringView, "applyStyleAttributes:", v13);
    -[UIView setHidden:](self->_prefixLabel, "setHidden:", 1);
    -[UIView setHidden:](self->_accessoryLabel, "setHidden:", 1);
    -[UIView setAlpha:](self->_stringView, "setAlpha:", 1.0);
    v23 = v12;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v12, "substringToIndex:", a4);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    objc_msgSend(v13, "fontForStyle:", -[_UIStatusBarStringView fontStyle](self->_stringView, "fontStyle", v23));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    v19 = *(_QWORD *)off_1E1678D90;
    v26[0] = *(_QWORD *)off_1E1678E60;
    v26[1] = v19;
    v27[0] = &unk_1E1A962C0;
    v27[1] = v16;
    v26[2] = *(_QWORD *)off_1E1678D98;
    v27[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v15;
    v21 = (void *)objc_msgSend(v18, "initWithString:attributes:", v15, v20);
    -[UIVectorLabel _setAttributedText:](self->_prefixLabel, "_setAttributedText:", v21);

    -[UIView setNeedsLayout](self->_prefixLabel, "setNeedsLayout");
    v12 = v24;
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v24, "substringFromIndex:", a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVectorLabel setText:](self->_accessoryLabel, "setText:", v22);

      -[UIVectorLabel setFont:](self->_accessoryLabel, "setFont:", v16);
      -[UIVectorLabel setTextColor:](self->_accessoryLabel, "setTextColor:", v17);
      -[UIView setNeedsLayout](self->_accessoryLabel, "setNeedsLayout");
    }
    self->_type = a6;
    self->_animatingUpdate = 0;

  }
}

- (void)applyStyleAttributes:(id)a3
{
  -[_UIStatusBarStringView applyStyleAttributes:](self->_stringView, "applyStyleAttributes:", a3);
}

- (id)viewForLastBaselineLayout
{
  return self->_stringView;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  UIAccessibilityHUDItem *v3;
  void *v4;
  UIAccessibilityHUDItem *v5;

  v3 = [UIAccessibilityHUDItem alloc];
  -[UILabel text](self->_stringView, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v3, "initWithTitle:image:imageInsets:", v4, 0, 0.0, 0.0, 0.0, 0.0);

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (_UIStatusBarStringView)stringView
{
  return self->_stringView;
}

- (void)setStringView:(id)a3
{
  objc_storeStrong((id *)&self->_stringView, a3);
}

- (UIVectorLabel)prefixLabel
{
  return self->_prefixLabel;
}

- (void)setPrefixLabel:(id)a3
{
  objc_storeStrong((id *)&self->_prefixLabel, a3);
}

- (UIVectorLabel)accessoryLabel
{
  return self->_accessoryLabel;
}

- (void)setAccessoryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryLabel, a3);
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryLabel, 0);
  objc_storeStrong((id *)&self->_prefixLabel, 0);
  objc_storeStrong((id *)&self->_stringView, 0);
}

@end
