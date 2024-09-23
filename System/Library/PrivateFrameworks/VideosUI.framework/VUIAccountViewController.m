@implementation VUIAccountViewController

- (VUIAccountViewController)init
{
  VUIAccountViewController *result;

  AccountViewController.init()();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (VUIAccountViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9DEE298();
}

- (void)viewWillAppear:(BOOL)a3
{
  VUIAccountViewController *v4;

  v4 = self;
  AccountViewController.viewWillAppear(_:)(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewDidLayoutSubviews
{
  VUIAccountViewController *v2;

  v2 = self;
  AccountViewController.viewDidLayoutSubviews()();
  OUTLINED_FUNCTION_5_8(v2);
}

- (VUIAccountViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  AccountViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___VUIAccountViewController____lazy_storage___accountSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___VUIAccountViewController____lazy_storage___signInController));
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4;
  VUIAccountViewController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_2_13();
  AccountViewController.signInControllerDidCancel(_:)(v6);

  OUTLINED_FUNCTION_4_3(v7);
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  uint64_t v6;
  id v7;
  VUIAccountViewController *v8;

  OUTLINED_FUNCTION_6_10((uint64_t)self, (unint64_t *)&unk_1F021D800);
  v6 = sub_1DA143C7C();
  v7 = a3;
  v8 = self;
  AccountViewController.signInController(_:didCompleteWithOperationsResults:)(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)signInControllerDidSkip:(id)a3
{
  id v4;
  VUIAccountViewController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_2_13();
  AccountViewController.signInControllerDidSkip(_:)(v6);

  OUTLINED_FUNCTION_4_3(v7);
}

@end
