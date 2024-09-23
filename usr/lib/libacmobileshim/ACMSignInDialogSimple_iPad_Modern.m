@implementation ACMSignInDialogSimple_iPad_Modern

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (id)createIForgotItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Forgot your ID or Password?")), 0, self, sel_onIForgot_);
}

- (id)createCancelItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Cancel")), 0, 0, 0);
}

- (double)widgetConstraintMultiplier
{
  return 1.34375;
}

- (double)widgetConstraintConstant
{
  return -290.0;
}

- (void)buildWidgetContentGroupHorizontalConstraints
{
  void *v3;
  uint64_t v4;
  double v5;

  v3 = (void *)MEMORY[0x24BDD1628];
  v4 = objc_msgSend(-[ACMSignInDialogSimple_iPad_Modern widget](self, "widget"), "view");
  objc_msgSend((id)objc_msgSend(-[ACMSignInDialogSimple_iPad_Modern widget](self, "widget"), "view"), "frame");
  objc_msgSend((id)-[ACMSignInDialogSimple_iPad_Modern view](self, "view"), "addConstraint:", objc_msgSend(v3, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 7, 0, 0, 7, 1.0, v5));
  objc_msgSend((id)-[ACMSignInDialogSimple_iPad_Modern view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", objc_msgSend(-[ACMSignInDialogSimple_iPad_Modern widget](self, "widget"), "view"), 9, 0, -[ACMSignInDialogSimple_iPad_Modern view](self, "view"), 9, 1.0, 0.0));
}

- (id)widget
{
  void *widget;
  objc_super v4;

  widget = self->super.super._widget;
  if (!widget)
  {
    v4.receiver = self;
    v4.super_class = (Class)ACMSignInDialogSimple_iPad_Modern;
    widget = -[ACMSignInDialogSimple_Modern widget](&v4, sel_widget);
    objc_msgSend(widget, "setHideMargin:", 1);
  }
  return widget;
}

@end
