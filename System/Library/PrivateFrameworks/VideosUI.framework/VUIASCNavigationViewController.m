@implementation VUIASCNavigationViewController

- (VUIASCNavigationViewController)initWithAppName:(id)a3 appBundleIDs:(id)a4 appAdamIDs:(id)a5 contentTitle:(id)a6 shouldHandleVPPA:(BOOL)a7 shouldPunchOutAfterAppInstallation:(BOOL)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  VUIASCNavigationViewController *result;

  OUTLINED_FUNCTION_24();
  v9 = v8;
  if (v10)
    OUTLINED_FUNCTION_63_30();
  sub_1DA1440FC();
  sub_1DA1440FC();
  if (v9)
    sub_1DA143E80();
  v11 = OUTLINED_FUNCTION_300();
  ASCNavigationViewController.init(appName:appBundleIDs:appAdamIDs:contentTitle:shouldHandleVPPA:shouldPunchOutAfterAppInstallation:)(v11);
  OUTLINED_FUNCTION_3_1();
  return result;
}

- (VUIASCNavigationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9CD22B4();
}

- (void)viewDidLoad
{
  VUIASCNavigationViewController *v2;

  v2 = self;
  ASCNavigationViewController.viewDidLoad()();

}

- (VUIASCNavigationViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  ASCNavigationViewController.init(navigationBarClass:toolbarClass:)();
}

- (VUIASCNavigationViewController)initWithRootViewController:(id)a3
{
  id v3;

  v3 = a3;
  ASCNavigationViewController.init(rootViewController:)();
}

- (VUIASCNavigationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    OUTLINED_FUNCTION_63_30();
  v5 = a4;
  ASCNavigationViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___VUIASCNavigationViewController_onFlowComplete));
}

@end
