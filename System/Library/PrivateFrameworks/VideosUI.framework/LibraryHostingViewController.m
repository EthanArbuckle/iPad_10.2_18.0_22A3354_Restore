@implementation LibraryHostingViewController

- (UINavigationItem)navigationItem
{
  _TtC8VideosUI28LibraryHostingViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1D9D8D98C();

  return (UINavigationItem *)v3;
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI28LibraryHostingViewController *v2;

  v2 = self;
  sub_1D9D8D9B8();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  _TtC8VideosUI28LibraryHostingViewController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9D8DAA4();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI28LibraryHostingViewController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9D8DC48();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewWillLayoutSubviews
{
  _TtC8VideosUI28LibraryHostingViewController *v2;

  v2 = self;
  sub_1D9D8DD34();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI28LibraryHostingViewController)initWithCoder:(id)a3
{
  sub_1D9D8DE0C();
}

- (_TtC8VideosUI28LibraryHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9D8DE70();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28LibraryHostingViewController_childController));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

@end
