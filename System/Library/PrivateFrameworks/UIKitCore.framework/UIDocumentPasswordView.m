@implementation UIDocumentPasswordView

- (UIDocumentPasswordView)initWithDocumentName:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIDocumentPasswordView *v8;
  UILabel *v9;
  UILabel *label;
  id v11;
  UIDocumentPasswordField *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIDocumentPasswordView;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, v6, v7);
  if (v8)
  {
    v9 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v4, v5, v6, v7);
    v8->_label = v9;
    -[UILabel setFont:](v9, "setFont:", -[UIDocumentPasswordView _labelFont](v8, "_labelFont"));
    -[UILabel setTextColor:](v8->_label, "setTextColor:", -[UIDocumentPasswordView _labelTextColor](v8, "_labelTextColor"));
    -[UILabel setBaselineAdjustment:](v8->_label, "setBaselineAdjustment:", 1);
    label = v8->_label;
    if (a3)
      v11 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", _UINSLocalizedStringWithDefaultValue(CFSTR("The document “%@” is password protected."), CFSTR("The document “%@” is password protected.")), a3);
    else
      v11 = _UINSLocalizedStringWithDefaultValue(CFSTR("This document is password protected."), CFSTR("This document is password protected."));
    -[UILabel setText:](label, "setText:", v11);
    -[UILabel setLineBreakMode:](v8->_label, "setLineBreakMode:", 0);
    -[UIView setBackgroundColor:](v8->_label, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setTextAlignment:](v8->_label, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v8->_label, "setNumberOfLines:", 0);
    -[UIView addSubview:](v8, "addSubview:", v8->_label);
    v12 = -[UITextField initWithFrame:]([UIDocumentPasswordField alloc], "initWithFrame:", v4, v5, v6, v7);
    v8->_passwordTextField = v12;
    -[UITextField setPlaceholder:](v12, "setPlaceholder:", _UINSLocalizedStringWithDefaultValue(CFSTR("Password"), CFSTR("Password")));
    -[UITextField setContentVerticalAlignment:](v8->_passwordTextField, "setContentVerticalAlignment:", 0);
    -[UIDocumentPasswordField setAutocapitalizationType:](v8->_passwordTextField, "setAutocapitalizationType:", 0);
    -[UIDocumentPasswordField setAutocorrectionType:](v8->_passwordTextField, "setAutocorrectionType:", 1);
    -[UITextField setBorderStyle:](v8->_passwordTextField, "setBorderStyle:", 3);
    -[UITextField setTextAlignment:](v8->_passwordTextField, "setTextAlignment:", 1);
    -[UIDocumentPasswordField setReturnKeyType:](v8->_passwordTextField, "setReturnKeyType:", 1);
    -[UITextField setClearsOnBeginEditing:](v8->_passwordTextField, "setClearsOnBeginEditing:", 1);
    -[UITextField setSecureTextEntry:](v8->_passwordTextField, "setSecureTextEntry:", 1);
    -[UITextField setDelegate:](v8->_passwordTextField, "setDelegate:", v8);
    -[UIView addSubview:](v8, "addSubview:", v8->_passwordTextField);
    -[UIControl addTarget:action:forControlEvents:](v8->_passwordTextField, "addTarget:action:forControlEvents:", v8, sel__passwordEntered_, 0x80000);
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", +[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[UIView removeFromSuperview](self->_label, "removeFromSuperview");

  -[UITextField removeFromSuperview](self->_passwordTextField, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)UIDocumentPasswordView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double width;
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
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)UIDocumentPasswordView;
  -[UIView layoutSubviews](&v14, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  width = v15.size.width;
  if (!CGRectIsEmpty(v15))
  {
    -[UIDocumentPasswordView _labelHorizontalOffset](self, "_labelHorizontalOffset");
    v5 = v4;
    -[UIView bounds](self, "bounds");
    UIRoundToViewScale(self);
    v7 = v6;
    -[UIDocumentPasswordView _labelHorizontalOffset](self, "_labelHorizontalOffset");
    v9 = width - (v8 + v8);
    -[UIDocumentPasswordView _textFieldWidth](self, "_textFieldWidth");
    v11 = (width - v10) * 0.5;
    -[UIDocumentPasswordView _textFieldWidth](self, "_textFieldWidth");
    v13 = v12;
    -[UILabel setFrame:](self->_label, "setFrame:", v5, v7, v9, 62.0);
    -[UITextField setFrame:](self->_passwordTextField, "setFrame:", v11, v7 + 62.0 + 8.0, v13, 31.0);
  }
}

- (BOOL)_canDrawContent
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  _QWORD *ContextStack;
  CGContext *v5;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v7;
  CGGradientRef v8;
  CGGradient *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat v15;
  objc_super v16;
  CGPoint v17;
  CGPoint v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v16.receiver = self;
  v16.super_class = (Class)UIDocumentPasswordView;
  -[UIView drawRect:](&v16, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v5 = 0;
  else
    v5 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v5);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v7 = DeviceRGB;
    v8 = CGGradientCreateWithColorComponents(DeviceRGB, components, locations, 2uLL);
    if (v8)
    {
      v9 = v8;
      -[UIView bounds](self, "bounds");
      x = v19.origin.x;
      y = v19.origin.y;
      width = v19.size.width;
      height = v19.size.height;
      MidX = CGRectGetMidX(v19);
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      v15 = CGRectGetMaxY(v20) * 0.5;
      v17.y = 0.0;
      v17.x = MidX;
      v18.x = MidX;
      v18.y = v15;
      CGContextDrawLinearGradient(v5, v9, v17, v18, 0);
      CGContextSetFillColor(v5, dbl_1866859C8);
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      v22.size.width = CGRectGetWidth(v21);
      v22.origin.x = 0.0;
      v22.origin.y = v15;
      v22.size.height = v15;
      CGContextFillRect(v5, v22);
      CGGradientRelease(v9);
    }
    CGColorSpaceRelease(v7);
  }
  CGContextRestoreGState(v5);
}

- (void)textFieldDidBeginEditing:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIDocumentPasswordViewDelegate didBeginEditingPassword:inView:](self->passwordDelegate, "didBeginEditingPassword:inView:", a3, self);
}

- (void)textFieldDidEndEditing:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIDocumentPasswordViewDelegate didEndEditingPassword:inView:](self->passwordDelegate, "didEndEditingPassword:inView:", a3, self);
}

- (void)_passwordEntered:(id)a3
{
  -[UIDocumentPasswordViewDelegate userDidEnterPassword:forPasswordView:](self->passwordDelegate, "userDidEnterPassword:forPasswordView:", -[UITextField text](self->_passwordTextField, "text", a3), self);
}

- (id)_labelFont
{
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.5);
}

- (id)_labelTextColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (double)_labelHorizontalOffset
{
  return 15.0;
}

- (double)_textFieldWidth
{
  return 290.0;
}

- (UIDocumentPasswordViewDelegate)passwordDelegate
{
  return self->passwordDelegate;
}

- (void)setPasswordDelegate:(id)a3
{
  self->passwordDelegate = (UIDocumentPasswordViewDelegate *)a3;
}

- (UITextField)passwordField
{
  return &self->_passwordTextField->super;
}

@end
