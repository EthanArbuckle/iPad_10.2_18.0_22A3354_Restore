@implementation VUIASCAppInstallerViewController

- (VUIASCAppInstallerViewController)initWithTitle:(id)a3 subtitle:(id)a4 request:(id)a5 forceDSIDless:(BOOL)a6 onFlowComplete:(id)a7
{
  void *v8;
  id v9;
  VUIASCAppInstallerViewController *result;

  v8 = _Block_copy(a7);
  sub_1DA143E80();
  sub_1DA143E80();
  if (v8)
    *(_QWORD *)(OUTLINED_FUNCTION_37() + 16) = v8;
  v9 = a5;
  AppInstallerViewController.init(title:subtitle:request:forceDSIDless:onFlowComplete:)();
  OUTLINED_FUNCTION_3_1();
  return result;
}

- (VUIASCAppInstallerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  VUIASCAppInstallerViewController *result;

  if (a3)
  {
    v5 = sub_1DA143E80();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  AppInstallerViewController.init(nibName:bundle:)(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (VUIASCAppInstallerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9ADE488();
}

- (void)viewDidLoad
{
  VUIASCAppInstallerViewController *v2;

  v2 = self;
  AppInstallerViewController.viewDidLoad()();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)handleCancel
{
  VUIASCAppInstallerViewController *v2;

  v2 = self;
  sub_1D9ADF868();
  OUTLINED_FUNCTION_5_8(v2);
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6;
  id v7;
  VUIASCAppInstallerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  AppInstallerViewController.lockupView(_:appStateDidChange:)((uint64_t)v8, v7);

}

- (BOOL)lockupViewShouldSupportDSIDLessInstalls:(id)a3
{
  id v4;
  VUIASCAppInstallerViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = AppInstallerViewController.lockupViewShouldSupportDSIDLessInstalls(_:)();

  return self & 1;
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_50_2(OBJC_IVAR___VUIASCAppInstallerViewController_onFlowComplete);
  OUTLINED_FUNCTION_50_2(OBJC_IVAR___VUIASCAppInstallerViewController_onAppInstall);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___VUIASCAppInstallerViewController____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___VUIASCAppInstallerViewController____lazy_storage___appStoreComponentsLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___VUIASCAppInstallerViewController____lazy_storage___ascContainerView));
}

@end
