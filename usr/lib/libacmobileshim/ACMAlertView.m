@implementation ACMAlertView

- (void)dealloc
{
  objc_super v3;

  -[ACMAlertView setDelegate:](self, "setDelegate:", 0);
  -[ACMAlertView setCompletionBlock:](self, "setCompletionBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMAlertView;
  -[ACMAlertView dealloc](&v3, sel_dealloc);
}

- (void)setAlpha:(double)a3
{
  double v5;
  acmAlertViewDelegateProtocol *v6;
  objc_super v7;

  -[ACMAlertView alpha](self, "alpha");
  if (v5 != a3)
  {
    v6 = -[ACMAlertView acmAlertViewDelegate](self, "acmAlertViewDelegate");
    if (a3 == 0.0)
      -[acmAlertViewDelegateProtocol acmAlertViewWillBecomeInvisible](v6, "acmAlertViewWillBecomeInvisible");
    else
      -[acmAlertViewDelegateProtocol acmAlertViewWillBecomeVisible](v6, "acmAlertViewWillBecomeVisible");
  }
  v7.receiver = self;
  v7.super_class = (Class)ACMAlertView;
  -[ACMAlertView setAlpha:](&v7, sel_setAlpha_, a3);
}

- (void)showWithCompletionBlock:(id)a3
{
  if (a3)
  {
    -[ACMAlertView setDelegate:](self, "setDelegate:", self);
    -[ACMAlertView setCompletionBlock:](self, "setCompletionBlock:", a3);
    -[ACMAlertView show](self, "show");
  }
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  void (**v6)(id, int64_t);

  if (-[ACMAlertView completionBlock](self, "completionBlock", a3))
  {
    v6 = -[ACMAlertView completionBlock](self, "completionBlock");
    v6[2](v6, a4);
    -[ACMAlertView setCompletionBlock:](self, "setCompletionBlock:", 0);
  }
}

- (void)dismissAlert
{
  ACMAlertView *v3;
  void (**v4)(id, uint64_t);

  if (-[ACMAlertView completionBlock](self, "completionBlock"))
  {
    v3 = self;
    v4 = -[ACMAlertView completionBlock](self, "completionBlock");
    v4[2](v4, -[ACMAlertView cancelButtonIndex](self, "cancelButtonIndex"));
    -[ACMAlertView setCompletionBlock:](self, "setCompletionBlock:", 0);
  }
  -[ACMAlertView dismissWithClickedButtonIndex:animated:](self, "dismissWithClickedButtonIndex:animated:", -[ACMAlertView cancelButtonIndex](self, "cancelButtonIndex"), 0);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (acmAlertViewDelegateProtocol)acmAlertViewDelegate
{
  return (acmAlertViewDelegateProtocol *)self->_acmAlertViewDelegate;
}

- (void)setAcmAlertViewDelegate:(id)a3
{
  self->_acmAlertViewDelegate = a3;
}

@end
