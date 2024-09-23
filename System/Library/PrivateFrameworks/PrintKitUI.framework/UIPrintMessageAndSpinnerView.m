@implementation UIPrintMessageAndSpinnerView

- (UIPrintMessageAndSpinnerView)initWithFrame:(CGRect)a3
{
  double width;
  UIPrintMessageAndSpinnerView *v4;
  UIPrintMessageAndSpinnerView *v5;
  UILabel *v6;
  UILabel *label;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIActivityIndicatorView *spinner;
  void *v14;
  objc_super v16;

  width = a3.size.width;
  v16.receiver = self;
  v16.super_class = (Class)UIPrintMessageAndSpinnerView;
  v4 = -[UIPrintMessageAndSpinnerView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[UIPrintMessageAndSpinnerView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v5->_label;
    v5->_label = v6;

    v8 = (void *)MEMORY[0x1E0DC37E8];
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_scaledValueForValue:", 17.0);
    objc_msgSend(v8, "systemFontOfSize:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_label, "setFont:", v10);

    -[UILabel setNumberOfLines:](v5->_label, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v5->_label, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v5->_label, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_label, "setTextColor:", v11);

    -[UILabel setBackgroundColor:](v5->_label, "setBackgroundColor:", 0);
    -[UILabel setOpaque:](v5->_label, "setOpaque:", 0);
    -[UILabel setPreferredMaxLayoutWidth:](v5->_label, "setPreferredMaxLayoutWidth:", width + -40.0);
    -[UIPrintMessageAndSpinnerView addSubview:](v5, "addSubview:", v5->_label);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v12;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](v5->_spinner, "setColor:", v14);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v5->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIPrintMessageAndSpinnerView setNeedsUpdateConstraints](v5, "setNeedsUpdateConstraints");
  }
  return v5;
}

- (void)updateFont
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC37E8];
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scaledValueForValue:", 17.0);
  objc_msgSend(v3, "systemFontOfSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v4);

}

- (void)updateConstraints
{
  int v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = !-[UIPrintMessageAndSpinnerView spinnerHidden](self, "spinnerHidden");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[UIPrintMessageAndSpinnerView constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  v6 = 0x1F0166000;
  if (!v5)
  {

    goto LABEL_25;
  }
  v7 = v5;
  v8 = *(_QWORD *)v28;
  v9 = 1;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v28 != v8)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v11, "firstItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintMessageAndSpinnerView label](self, "label");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {
        v14 = objc_msgSend(v11, "firstAttribute");

        if (v14 == 10)
        {
          v9 = 0;
          continue;
        }
      }
      else
      {

      }
      objc_msgSend(v11, "firstItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintMessageAndSpinnerView spinner](self, "spinner");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == v16)
      {
        v17 = objc_msgSend(v11, "firstAttribute") != 10;

        LOBYTE(v3) = v17 & v3;
      }
      else
      {

      }
    }
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v7);

  v6 = 0x1F0166000uLL;
  if ((v9 & 1) == 0)
  {
    if ((v3 & 1) != 0)
      goto LABEL_17;
    goto LABEL_18;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_label, 10, 0, self, 10, 1.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintMessageAndSpinnerView addConstraint:](self, "addConstraint:", v25);

  if ((v3 & 1) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(Class *)((char *)&self->super.super.super.isa + *(int *)(v6 + 1524)), 10, 0, self, 10, 1.0, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintMessageAndSpinnerView addConstraint:](self, "addConstraint:", v18);

  }
LABEL_18:
  -[UIPrintMessageAndSpinnerView currentHorizontalConstraints](self, "currentHorizontalConstraints");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[UIPrintMessageAndSpinnerView currentHorizontalConstraints](self, "currentHorizontalConstraints");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintMessageAndSpinnerView removeConstraints:](self, "removeConstraints:", v20);

    -[UIPrintMessageAndSpinnerView setCurrentHorizontalConstraints:](self, "setCurrentHorizontalConstraints:", 0);
  }
  _NSDictionaryOfVariableBindings(CFSTR("_label, _spinner"), self->_label, *(Class *)((char *)&self->super.super.super + *(int *)(v6 + 1524)), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIPrintMessageAndSpinnerView spinnerHidden](self, "spinnerHidden"))
    v22 = CFSTR("H:|[_label]|");
  else
    v22 = CFSTR("H:|[_label]-indicatorGap-[_spinner]|");
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v22, 0, &unk_1E9DB0868, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintMessageAndSpinnerView setCurrentHorizontalConstraints:](self, "setCurrentHorizontalConstraints:", v23);

  -[UIPrintMessageAndSpinnerView currentHorizontalConstraints](self, "currentHorizontalConstraints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintMessageAndSpinnerView addConstraints:](self, "addConstraints:", v24);

  v26.receiver = self;
  v26.super_class = (Class)UIPrintMessageAndSpinnerView;
  -[UIPrintMessageAndSpinnerView updateConstraints](&v26, sel_updateConstraints);

}

- (NSString)messageText
{
  void *v2;
  void *v3;

  -[UIPrintMessageAndSpinnerView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setMessageText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIPrintMessageAndSpinnerView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[UIPrintMessageAndSpinnerView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)spinSpinner
{
  void *v2;
  char v3;

  -[UIPrintMessageAndSpinnerView spinner](self, "spinner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnimating");

  return v3;
}

- (void)setSpinSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[UIPrintMessageAndSpinnerView spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "startAnimating");
  else
    objc_msgSend(v4, "stopAnimating");

}

- (BOOL)spinnerHidden
{
  UIPrintMessageAndSpinnerView *v2;
  void *v3;
  UIPrintMessageAndSpinnerView *v4;

  v2 = self;
  -[UIPrintMessageAndSpinnerView spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (UIPrintMessageAndSpinnerView *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != v2;

  return (char)v2;
}

- (void)setSpinnerHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[UIPrintMessageAndSpinnerView spinnerHidden](self, "spinnerHidden") != a3)
  {
    -[UIPrintMessageAndSpinnerView spinner](self, "spinner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "removeFromSuperview");
    else
      -[UIPrintMessageAndSpinnerView addSubview:](self, "addSubview:", v5);

    -[UIPrintMessageAndSpinnerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[UIPrintMessageAndSpinnerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (NSArray)currentHorizontalConstraints
{
  return self->_currentHorizontalConstraints;
}

- (void)setCurrentHorizontalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_currentHorizontalConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHorizontalConstraints, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
