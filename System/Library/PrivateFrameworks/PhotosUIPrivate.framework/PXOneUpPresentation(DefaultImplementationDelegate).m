@implementation PXOneUpPresentation(DefaultImplementationDelegate)

+ (PUPXOneUpPresentationImplementationDelegate)defaultImplementationDelegate
{
  return objc_alloc_init(PUPXOneUpPresentationImplementationDelegate);
}

+ (PUNavigationController)implementationDelegateNavigationControllerWithRootViewController:()DefaultImplementationDelegate
{
  id v3;
  PUNavigationController *v4;

  v3 = a3;
  v4 = -[PUNavigationController initWithRootViewController:]([PUNavigationController alloc], "initWithRootViewController:", v3);

  return v4;
}

@end
