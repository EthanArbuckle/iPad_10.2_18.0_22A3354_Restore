@implementation LibTransitionDetailsViewController

- (UIViewController)detailsViewController
{
  id v2;

  sub_1D9FA060C();
  return (UIViewController *)v2;
}

- (void)setDetailsViewController:(id)a3
{
  id v5;
  _TtC8VideosUI34LibTransitionDetailsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D9FA0674(a3);
  OUTLINED_FUNCTION_5_8(v6);
}

- (_TtC8VideosUI34LibTransitionDetailsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9FA0BB0();
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI34LibTransitionDetailsViewController *v2;

  v2 = self;
  sub_1D9FA0C7C();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI34LibTransitionDetailsViewController *v2;

  v2 = self;
  sub_1D9FA0E24();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  _TtC8VideosUI34LibTransitionDetailsViewController *v3;
  void *v4;
  void *v5;

  v3 = self;
  v4 = (void *)OUTLINED_FUNCTION_36_5();
  sub_1D9FA0F30(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  _TtC8VideosUI34LibTransitionDetailsViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9FA1034(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (_TtC8VideosUI34LibTransitionDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9FA2888();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8VideosUI34LibTransitionDetailsViewController_mediaEntity);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34LibTransitionDetailsViewController_detailsViewController));
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI34LibTransitionDetailsViewController_navigationItemCancellable, &qword_1F0230990);
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI34LibTransitionDetailsViewController_navBarTintColor));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

@end
