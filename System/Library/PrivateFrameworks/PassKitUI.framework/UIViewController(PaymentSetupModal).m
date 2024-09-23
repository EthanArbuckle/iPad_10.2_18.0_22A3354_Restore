@implementation UIViewController(PaymentSetupModal)

- (void)presentModalViewController:()PaymentSetupModal withPaymentSetupContext:
{
  id v6;

  v6 = a3;
  PKPaymentSetupApplyContextAppearance(a4, v6);
  if (objc_msgSend(a1, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    objc_msgSend(v6, "setModalPresentationStyle:", 3);
    objc_msgSend(a1, "presentViewController:withTransition:completion:", v6, 8, 0);
  }
  else
  {
    objc_msgSend(a1, "presentViewController:animated:completion:", v6, 1, 0);
  }

}

@end
