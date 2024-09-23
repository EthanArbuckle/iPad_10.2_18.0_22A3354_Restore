@implementation RootHostingViewController

- (UITabBarItem)tabBarItem
{
  _TtC8VideosUI25RootHostingViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1DA051A98();
  v4 = v3;

  return (UITabBarItem *)OUTLINED_FUNCTION_111(v4);
}

- (void)setTabBarItem:(id)a3
{
  id v5;
  _TtC8VideosUI25RootHostingViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1DA051B48(a3);
  OUTLINED_FUNCTION_5_8(v6);
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  _TtC8VideosUI25RootHostingViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1DA051BC4();

  return (UIViewController *)OUTLINED_FUNCTION_111(v3);
}

- (_TtC8VideosUI25RootHostingViewController)init
{
  _TtC8VideosUI25RootHostingViewController *result;

  sub_1DA051CB0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI25RootHostingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA051D50();
}

- (void)viewDidLoad
{
  _TtC8VideosUI25RootHostingViewController *v2;

  v2 = self;
  sub_1DA051DDC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI25RootHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1DA052234();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25RootHostingViewController_contentNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25RootHostingViewController____lazy_storage___emptyNavigationController));
}

@end
