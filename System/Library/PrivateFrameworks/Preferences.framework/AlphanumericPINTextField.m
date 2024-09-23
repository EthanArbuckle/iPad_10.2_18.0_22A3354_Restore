@implementation AlphanumericPINTextField

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AlphanumericPINTextField;
  result = -[AlphanumericPINTextField canPerformAction:withSender:](&v6, sel_canPerformAction_withSender_, a3, a4);
  if (sel_paste_ == a3)
    return 0;
  return result;
}

@end
