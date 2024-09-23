@implementation WFTextFieldCell

- (void)awakeFromNib
{
  void *v3;
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
  objc_super v14;

  self->_editable = 1;
  v14.receiver = self;
  v14.super_class = (Class)WFTextFieldCell;
  -[WFTextFieldCell awakeFromNib](&v14, sel_awakeFromNib);
  -[WFTextFieldCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_textFieldDidChange_, 0x20000);

  -[WFTextFieldCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_textFieldDidEndEditingExit_, 0x80000);

  -[WFTextFieldCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  -[WFTextFieldCell _adjustStackViewPadding](self, "_adjustStackViewPadding");
  -[WFTextFieldCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSmartQuotesType:", 1);

  -[WFTextFieldCell textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textInputTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSmartDashesType:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTextFieldCell label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTextFieldCell textField](self, "textField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v11);

  if (-[WFTextFieldCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    -[WFTextFieldCell textField](self, "textField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextAlignment:", 2);

  }
  -[WFTextFieldCell _updateStackViewForTraitCollection](self, "_updateStackViewForTraitCollection");
}

- (void)_adjustStackViewPadding
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  -[WFTextFieldCell _verticalPadding](self, "_verticalPadding");
  v4 = v3;
  -[WFTextFieldCell stackViewTopConstraint](self, "stackViewTopConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  -[WFTextFieldCell _verticalPadding](self, "_verticalPadding");
  v7 = v6;
  -[WFTextFieldCell stackViewBottomConstraint](self, "stackViewBottomConstraint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

}

- (double)_verticalPadding
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[WFTextFieldCell label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_bodyLeading");
  v5 = v4 * 0.5;

  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTextFieldCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    -[WFTextFieldCell _adjustStackViewPadding](self, "_adjustStackViewPadding");
    -[WFTextFieldCell _updateStackViewForTraitCollection](self, "_updateStackViewForTraitCollection");
  }
}

- (void)_updateStackViewForTraitCollection
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[WFTextFieldCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLargeTextTraitCollection");

  -[WFTextFieldCell stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    objc_msgSend(v5, "setAxis:", 0);

    -[WFTextFieldCell labelWidthConstraint](self, "labelWidthConstraint");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);
LABEL_6:

    return;
  }
  objc_msgSend(v5, "setAxis:", 1);

  -[WFTextFieldCell labelWidthConstraint](self, "labelWidthConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 0);

  if ((-[WFTextFieldCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) == 0)
  {
    -[WFTextFieldCell textField](self, "textField");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextAlignment:", 0);
    goto LABEL_6;
  }
}

- (void)textFieldDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  __CFString *v9;

  -[WFTextFieldCell textChangeHandler](self, "textChangeHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFTextFieldCell textField](self, "textField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      -[WFTextFieldCell textField](self, "textField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "text");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = &stru_24DB39F78;
    }

    -[WFTextFieldCell textChangeHandler](self, "textChangeHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, __CFString *))v8)[2](v8, v9);

  }
}

- (void)textFieldDidEndEditingExit:(id)a3
{
  void *v4;
  void (**v5)(id, WFTextFieldCell *);

  -[WFTextFieldCell returnKeyHandler](self, "returnKeyHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFTextFieldCell returnKeyHandler](self, "returnKeyHandler");
    v5 = (void (**)(id, WFTextFieldCell *))objc_claimAutoreleasedReturnValue();
    v5[2](v5, self);

  }
}

- (void)setAccessoryType:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFTextFieldCell;
  -[WFTextFieldCell setAccessoryType:](&v8, sel_setAccessoryType_);
  -[WFTextFieldCell trailingMarginConstraint](self, "trailingMarginConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0.0;
  if (!a3)
    v7 = 8.0;
  objc_msgSend(v5, "setConstant:", v7);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTextFieldCell;
  -[WFTextFieldCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (void)setEditable:(BOOL)a3
{
  if (self->_editable != a3)
    self->_editable = a3;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFTextFieldCell;
  -[WFTextFieldCell prepareForReuse](&v10, sel_prepareForReuse);
  -[WFTextFieldCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_24DB39F78);

  -[WFTextFieldCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardType:", 0);

  -[WFTextFieldCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecureTextEntry:", 0);

  -[WFTextFieldCell setAccessoryType:](self, "setAccessoryType:", 0);
  self->_editable = 1;
  objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTextFieldCell label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTextFieldCell textField](self, "textField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[WFTextFieldCell textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (void)setHideLabel:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_hideLabel = a3;
  -[WFTextFieldCell labelWidthConstraint](self, "labelWidthConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", v3 ^ 1);

  -[WFTextFieldCell label](self, "label");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v3);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  int v4;
  void *v5;

  if (sel_copy_ == a3)
  {
    -[WFTextFieldCell textField](self, "textField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isSecureTextEntry") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[WFTextFieldCell textField](self, "textField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[WFTextFieldCell textField](self, "textField");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setString:", v7);

  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  double v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFTextFieldCell;
  -[WFTextFieldCell setEditing:animated:](&v9, sel_setEditing_animated_, a3, a4);
  -[WFTextFieldCell stackViewLeadingConstraint](self, "stackViewLeadingConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 0.0;
  if (v4)
    v8 = 8.0;
  objc_msgSend(v6, "setConstant:", v8);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WFTextFieldCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:forEvents:", self, 655360);

  v4.receiver = self;
  v4.super_class = (Class)WFTextFieldCell;
  -[WFTextFieldCell dealloc](&v4, sel_dealloc);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return self->_editable;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UITextField)textField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_textField);
}

- (void)setTextField:(id)a3
{
  objc_storeWeak((id *)&self->_textField, a3);
}

- (id)textChangeHandler
{
  return self->_textChangeHandler;
}

- (void)setTextChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (id)returnKeyHandler
{
  return self->_returnKeyHandler;
}

- (void)setReturnKeyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (BOOL)editable
{
  return self->_editable;
}

- (BOOL)hideLabel
{
  return self->_hideLabel;
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_trailingMarginConstraint);
}

- (void)setTrailingMarginConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_trailingMarginConstraint, a3);
}

- (NSLayoutConstraint)labelWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_labelWidthConstraint);
}

- (void)setLabelWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_labelWidthConstraint, a3);
}

- (UIStackView)stackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_stackView);
}

- (void)setStackView:(id)a3
{
  objc_storeWeak((id *)&self->_stackView, a3);
}

- (NSLayoutConstraint)stackViewTopConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_stackViewTopConstraint);
}

- (void)setStackViewTopConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_stackViewTopConstraint, a3);
}

- (NSLayoutConstraint)stackViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_stackViewBottomConstraint);
}

- (void)setStackViewBottomConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_stackViewBottomConstraint, a3);
}

- (NSLayoutConstraint)stackViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_stackViewLeadingConstraint);
}

- (void)setStackViewLeadingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_stackViewLeadingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stackViewLeadingConstraint);
  objc_destroyWeak((id *)&self->_stackViewBottomConstraint);
  objc_destroyWeak((id *)&self->_stackViewTopConstraint);
  objc_destroyWeak((id *)&self->_stackView);
  objc_destroyWeak((id *)&self->_labelWidthConstraint);
  objc_destroyWeak((id *)&self->_trailingMarginConstraint);
  objc_storeStrong(&self->_returnKeyHandler, 0);
  objc_storeStrong(&self->_textChangeHandler, 0);
  objc_destroyWeak((id *)&self->_textField);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
