@implementation LazyViewController

- (void)viewDidLoad
{
  _TtC5TeaUI18LazyViewController *v2;

  v2 = self;
  LazyViewController.viewDidLoad()();

}

- (UIViewController)childViewControllerForStatusBarStyle
{
  _TtC5TeaUI18LazyViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)LazyViewController.childForStatusBarStyle.getter();

  return (UIViewController *)v3;
}

- (void)viewWillLayoutSubviews
{
  _TtC5TeaUI18LazyViewController *v2;

  v2 = self;
  LazyViewController.viewWillLayoutSubviews()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5TeaUI18LazyViewController *v4;

  v4 = self;
  LazyViewController.viewWillAppear(_:)(a3);

}

- (_TtC5TeaUI18LazyViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B155D4D0();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC5TeaUI18LazyViewController *v6;

  v6 = self;
  LazyViewController.setEditing(_:animated:)(a3, a4);

}

- (_TtC5TeaUI18LazyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  LazyViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (NSString)description
{
  _TtC5TeaUI18LazyViewController *v2;
  void *v3;

  v2 = self;
  LazyViewController.description.getter();

  v3 = (void *)sub_1B16B983C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
