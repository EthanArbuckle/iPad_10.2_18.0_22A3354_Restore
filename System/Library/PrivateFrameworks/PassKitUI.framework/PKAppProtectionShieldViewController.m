@implementation PKAppProtectionShieldViewController

- (PKAppProtectionShieldViewController)init
{

  return 0;
}

+ (id)createShieldViewController
{
  return (id)objc_msgSend(a1, "createShieldViewControllerWithConfiguration:", 0);
}

+ (id)createShieldViewControllerWithConfiguration:(id)a3
{
  id v3;
  _PKAppProtectionShieldViewController *v4;

  v3 = a3;
  v4 = -[_PKAppProtectionShieldViewController initWithConfiguration:]([_PKAppProtectionShieldViewController alloc], "initWithConfiguration:", v3);

  return v4;
}

@end
