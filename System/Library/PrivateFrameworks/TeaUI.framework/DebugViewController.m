@implementation DebugViewController

- (_TtC5TeaUI19DebugViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  DebugViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC5TeaUI19DebugViewController *v2;

  v2 = self;
  DebugViewController.viewDidLoad()();

}

- (void)viewWillLayoutSubviews
{
  _TtC5TeaUI19DebugViewController *v2;

  v2 = self;
  DebugViewController.viewWillLayoutSubviews()();

}

- (void)doDone
{
  _TtC5TeaUI19DebugViewController *v2;

  v2 = self;
  sub_1B15FB50C();

}

- (void)doSettings
{
  _TtC5TeaUI19DebugViewController *v2;

  v2 = self;
  sub_1B1601C24();

}

- (_TtC5TeaUI19DebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  DebugViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI19DebugViewController_settingsPresenter);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20_0();
  swift_bridgeObjectRelease();

}

@end
