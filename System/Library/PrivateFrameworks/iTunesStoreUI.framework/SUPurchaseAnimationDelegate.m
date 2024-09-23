@implementation SUPurchaseAnimationDelegate

- (SUPurchaseAnimationDelegate)initWithView:(id)a3
{
  SUPurchaseAnimationDelegate *v4;

  v4 = -[SUPurchaseAnimationDelegate init](self, "init");
  if (v4)
    v4->_view = (UIView *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_view = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUPurchaseAnimationDelegate;
  -[SUPurchaseAnimationDelegate dealloc](&v3, sel_dealloc);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3, a4), "endIgnoringInteractionEvents");
  -[UIView removeFromSuperview](self->_view, "removeFromSuperview");

  self->_view = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPurchaseAnimationDidEndNotification"), self);
}

@end
