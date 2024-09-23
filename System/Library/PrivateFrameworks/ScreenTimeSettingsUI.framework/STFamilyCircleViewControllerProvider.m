@implementation STFamilyCircleViewControllerProvider

+ (id)familyRootViewControllerPresentedAsModal:(BOOL)a3
{
  return -[STFamilyRootViewController initWithModalPresentation:]([STFamilyRootViewController alloc], "initWithModalPresentation:", a3);
}

@end
