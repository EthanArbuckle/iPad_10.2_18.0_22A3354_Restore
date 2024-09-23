@implementation MTEditableTextFieldCell

+ (id)textFont
{
  return +[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleBody);
}

- (void)updateFonts
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "textFont");
  v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEditableTextFieldCell textField](self, "textField"));
  objc_msgSend(v4, "setFont:", v5);

}

- (void)setupCell
{
  id v3;
  double y;
  double width;
  double height;
  UITextField *v7;
  UITextField *textField;
  UITextField *v9;
  id v10;
  UITextField *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc((Class)UITextField);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UITextField *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  textField = self->_textField;
  self->_textField = v7;

  -[UITextField setContentVerticalAlignment:](self->_textField, "setContentVerticalAlignment:", 0);
  -[UITextField setClearButtonMode:](self->_textField, "setClearButtonMode:", 3);
  v9 = self->_textField;
  v10 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UITextField setLeftView:](v9, "setLeftView:", v10);

  -[UITextField setLeftViewMode:](self->_textField, "setLeftViewMode:", 3);
  v11 = self->_textField;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.556862745, 0.556862745, 0.576470588, 1.0));
  -[UITextField setTextColor:](v11, "setTextColor:", v12);

  -[UITextField setDelegate:](self->_textField, "setDelegate:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEditableTextFieldCell contentView](self, "contentView"));
  objc_msgSend(v13, "addSubview:", self->_textField);

  -[MTEditableTextFieldCell updateFonts](self, "updateFonts");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTEditableTextFieldCell;
  -[MTTableViewCell layoutSubviews](&v15, "layoutSubviews");
  -[MTEditableTextFieldCell updateFonts](self, "updateFonts");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEditableTextFieldCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[MTEditableTextFieldCell layoutMargins](self, "layoutMargins");
  v11 = v10;
  -[MTEditableTextFieldCell layoutMargins](self, "layoutMargins");
  v13 = v12;
  -[MTEditableTextFieldCell layoutMargins](self, "layoutMargins");
  -[UITextField setFrame:](self->_textField, "setFrame:", v11, v5, v7 - (v13 + v14), v9);
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v5;
  UITextFieldDelegate **p_delegate;
  id WeakRetained;
  id v8;
  unsigned __int8 v9;

  v5 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_msgSend(v8, "textFieldShouldBeginEditing:", v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  UITextFieldDelegate **p_delegate;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "textFieldDidBeginEditing:", v8);

  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v5;
  UITextFieldDelegate **p_delegate;
  id WeakRetained;
  id v8;
  unsigned __int8 v9;

  v5 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_msgSend(v8, "textFieldShouldEndEditing:", v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  UITextFieldDelegate **p_delegate;
  id WeakRetained;
  id v9;
  id v10;

  v10 = a3;
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MTEditableTextFieldCell textChanged](self, "textChanged"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
  ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "textFieldDidEndEditing:", v10);

  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  UITextFieldDelegate **p_delegate;
  id WeakRetained;
  id v14;
  unsigned __int8 v15;

  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = a5;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)p_delegate);
    v15 = objc_msgSend(v14, "textField:shouldChangeCharactersInRange:replacementString:", v10, location, length, v11);

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v5;
  UITextFieldDelegate **p_delegate;
  id WeakRetained;
  id v8;
  unsigned __int8 v9;

  v5 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_msgSend(v8, "textFieldShouldClear:", v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v5;
  UITextFieldDelegate **p_delegate;
  id WeakRetained;
  id v8;
  unsigned __int8 v9;

  v5 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_msgSend(v8, "textFieldShouldReturn:", v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (id)textChanged
{
  return self->_textChanged;
}

- (void)setTextChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UITextFieldDelegate)delegate
{
  return (UITextFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_textChanged, 0);
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
