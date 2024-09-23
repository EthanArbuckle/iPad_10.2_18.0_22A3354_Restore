@implementation PromiseViewController

- (_TtC5TeaUI21PromiseViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  PromiseViewController.init(coder:)();
}

- (UINavigationItem)navigationItem
{
  _TtC5TeaUI21PromiseViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1B14A24C8();

  return (UINavigationItem *)v3;
}

- (void)viewDidLoad
{
  _TtC5TeaUI21PromiseViewController *v2;

  v2 = self;
  sub_1B14A2538();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5TeaUI21PromiseViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1B14A33B4((uint64_t)a3);

}

- (UIViewController)childViewControllerForStatusBarStyle
{
  id v2;

  sub_1B14A3474();
  return (UIViewController *)v2;
}

- (int64_t)preferredStatusBarStyle
{
  _TtC5TeaUI21PromiseViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1B14A34CC((uint64_t)v2);

  return (int64_t)v3;
}

- (NSString)description
{
  _TtC5TeaUI21PromiseViewController *v2;
  void *v3;

  v2 = self;
  sub_1B14A37E0();

  v3 = (void *)sub_1B16B983C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC5TeaUI21PromiseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  PromiseViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_24_6();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI21PromiseViewController_contentViewController));
  OUTLINED_FUNCTION_24_6();
  OUTLINED_FUNCTION_24_6();
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI21PromiseViewController_parentingCompleteClosure));
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI21PromiseViewController_parentingErrorClosure));
}

@end
