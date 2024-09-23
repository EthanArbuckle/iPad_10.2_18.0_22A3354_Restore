@implementation TKVibrationPickerTableViewCell

- (TKVibrationPickerTableViewCell)initWithReuseIdentifier:(id)a3
{
  TKVibrationPickerTableViewCell *v3;
  UITextField *v4;
  UITextField *removableTextField;
  void *v6;
  UITextField *v7;
  void *v8;
  UITextField *v9;
  void *v10;
  void *v11;

  v3 = -[TKVibrationPickerTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 1, a3);
  if (v3)
  {
    v4 = (UITextField *)objc_alloc_init(MEMORY[0x24BDF6EA8]);
    removableTextField = v3->_removableTextField;
    v3->_removableTextField = v4;

    +[TKVibrationInterfaceUtilities configureVibrationNameTextField:](TKVibrationInterfaceUtilities, "configureVibrationNameTextField:", v3->_removableTextField);
    -[TKVibrationPickerTableViewCell textLabel](v3, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v3->_removableTextField;
    objc_msgSend(v6, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](v7, "setTextColor:", v8);

    v9 = v3->_removableTextField;
    objc_msgSend(v6, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UITextField setDelegate:](v3->_removableTextField, "setDelegate:", v3);
    +[TKUIKitConstants defaultTableViewCellTextColor](TKUIKitConstants, "defaultTableViewCellTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationPickerTableViewCell setRegularTextColor:](v3, "setRegularTextColor:", v11);

  }
  return v3;
}

- (void)setEditable:(BOOL)a3
{
  if (self->_editable != a3)
  {
    self->_editable = a3;
    if (!a3)
      -[TKVibrationPickerTableViewCell _makeRemovableTextFieldEditable:](self, "_makeRemovableTextFieldEditable:", 0);
  }
}

- (NSString)labelText
{
  void *v3;
  void *v4;

  if (-[TKVibrationPickerTableViewCell _isDisplayingRemovableTextField](self, "_isDisplayingRemovableTextField"))
  {
    -[UITextField text](self->_removableTextField, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TKVibrationPickerTableViewCell textLabel](self, "textLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (void)setLabelText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[TKVibrationPickerTableViewCell _isDisplayingRemovableTextField](self, "_isDisplayingRemovableTextField"))
  {
    -[UITextField setText:](self->_removableTextField, "setText:", v5);
  }
  else
  {
    -[TKVibrationPickerTableViewCell textLabel](self, "textLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v5);

  }
}

- (NSString)placeholderText
{
  return -[UITextField placeholder](self->_removableTextField, "placeholder");
}

- (void)setPlaceholderText:(id)a3
{
  -[UITextField setPlaceholder:](self->_removableTextField, "setPlaceholder:", a3);
}

- (UIFont)regularTextFont
{
  void *v2;
  void *v3;

  -[TKVibrationPickerTableViewCell textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setRegularTextFont:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TKVibrationPickerTableViewCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    -[TKVibrationPickerTableViewCell textLabel](self, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[UITextField setFont:](self->_removableTextField, "setFont:", v7);
  }

}

- (void)setRegularTextColor:(id)a3
{
  void *v5;
  UIColor *v6;

  v6 = (UIColor *)a3;
  if (self->_regularTextColor != v6)
  {
    objc_storeStrong((id *)&self->_regularTextColor, a3);
    -[TKVibrationPickerTableViewCell textLabel](self, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

    -[UITextField setTextColor:](self->_removableTextField, "setTextColor:", v6);
  }

}

- (UIColor)highlightedTextColor
{
  void *v2;
  void *v3;

  -[TKVibrationPickerTableViewCell textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightedTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setHighlightedTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TKVibrationPickerTableViewCell textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlightedTextColor:", v4);

}

- (BOOL)isChecked
{
  return -[TKVibrationPickerTableViewCell accessoryType](self, "accessoryType") == 3;
}

- (void)setChecked:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  TKVibrationPickerTableViewCell *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = -[TKVibrationPickerTableViewCell accessoryType](self, "accessoryType");
  if (!v3 && v5)
  {
    v6 = self;
    v7 = 0;
LABEL_7:
    -[TKVibrationPickerTableViewCell setAccessoryType:](v6, "setAccessoryType:", v7);
    -[TKVibrationPickerTableViewCell textLabel](self, "textLabel");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[TKVibrationPickerTableViewCell regularTextColor](self, "regularTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    return;
  }
  if (v3 && v5 != 3)
  {
    v6 = self;
    v7 = 3;
    goto LABEL_7;
  }
}

- (BOOL)_isDisplayingRemovableTextField
{
  void *v2;
  BOOL v3;

  -[UITextField superview](self->_removableTextField, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)makeTextFieldResignFirstResponderIfNeeded
{
  if (-[UITextField isFirstResponder](self->_removableTextField, "isFirstResponder"))
    -[UITextField resignFirstResponder](self->_removableTextField, "resignFirstResponder");
}

- (void)_layoutRemovableTextField
{
  void *v3;
  void *v4;
  double x;
  CGFloat y;
  double width;
  double height;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  if (self->_removableTextField)
  {
    -[TKVibrationPickerTableViewCell textLabel](self, "textLabel");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "font");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](self->_removableTextField, "setFont:", v3);
    -[TKVibrationPickerTableViewCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v17 = CGRectInset(v16, 10.0, 0.0);
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
    v9 = (double)-[TKVibrationPickerTableViewCell indentationLevel](self, "indentationLevel");
    -[TKVibrationPickerTableViewCell indentationWidth](self, "indentationWidth");
    v11 = v10 * v9;
    v18.origin.x = x + v10 * v9;
    v18.size.width = width - v11;
    v12 = v18.origin.x + 5.0;
    v18.origin.y = y;
    v18.size.height = height;
    v13 = CGRectGetMaxX(v18) + -10.0;
    objc_msgSend(v3, "descender");
    -[UITextField setFrame:](self->_removableTextField, "setFrame:", v12, 0.0, v13, height + fabs(ceil(v14)));

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKVibrationPickerTableViewCell;
  -[TKVibrationPickerTableViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[TKVibrationPickerTableViewCell _layoutRemovableTextField](self, "_layoutRemovableTextField");
}

- (void)didTransitionToState:(unint64_t)a3
{
  char v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationPickerTableViewCell;
  -[TKVibrationPickerTableViewCell didTransitionToState:](&v5, sel_didTransitionToState_);
  if ((v3 & 1) != 0)
    -[TKVibrationPickerTableViewCell _makeRemovableTextFieldEditable:](self, "_makeRemovableTextFieldEditable:", -[TKVibrationPickerTableViewCell isEditable](self, "isEditable"));
}

- (void)willTransitionToState:(unint64_t)a3
{
  char v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationPickerTableViewCell;
  -[TKVibrationPickerTableViewCell willTransitionToState:](&v5, sel_willTransitionToState_);
  if ((v3 & 1) == 0)
    -[TKVibrationPickerTableViewCell _makeRemovableTextFieldEditable:](self, "_makeRemovableTextFieldEditable:", 0);
}

- (void)_makeRemovableTextFieldEditable:(BOOL)a3
{
  _BOOL4 v3;
  UITextField *removableTextField;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  if (-[TKVibrationPickerTableViewCell _isDisplayingRemovableTextField](self, "_isDisplayingRemovableTextField") != a3)
  {
    -[TKVibrationPickerTableViewCell textLabel](self, "textLabel");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    removableTextField = self->_removableTextField;
    if (v3)
    {
      objc_msgSend(v10, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField setText:](removableTextField, "setText:", v6);

      objc_msgSend(v10, "setText:", 0);
      -[TKVibrationPickerTableViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_removableTextField);

    }
    else
    {
      -[UITextField text](self->_removableTextField, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v8);

      v9 = objc_msgSend(MEMORY[0x24BDF6F90], "areAnimationsEnabled");
      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", 1);
      -[UITextField resignFirstResponder](self->_removableTextField, "resignFirstResponder");
      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", v9);
      -[UITextField setText:](self->_removableTextField, "setText:", 0);
      -[UITextField removeFromSuperview](self->_removableTextField, "removeFromSuperview");
    }

  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return +[TKVibrationInterfaceUtilities vibrationNameTextField:shouldChangeCharactersInRange:replacementString:](TKVibrationInterfaceUtilities, "vibrationNameTextField:shouldChangeCharactersInRange:replacementString:", a3, a4.location, a4.length, a5);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  if ((UIKeyboardIsAutomaticAppearanceEnabled() & 1) == 0 && (UIKeyboardAutomaticIsOnScreen() & 1) == 0)
    UIKeyboardForceOrderInAutomatic();
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[TKVibrationPickerTableViewCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vibrationPickerTableViewCell:endedEditingWithText:", self, v5);

  }
  if ((UIKeyboardIsAutomaticAppearanceEnabled() & 1) == 0)
    UIKeyboardForceOrderOutAutomatic();

}

- (TKVibrationPickerTableViewCellDelegate)delegate
{
  return (TKVibrationPickerTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)regularTextColor
{
  return self->_regularTextColor;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regularTextColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_removableTextField, 0);
}

@end
