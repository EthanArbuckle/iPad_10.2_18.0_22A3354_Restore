@implementation SearchResultsViewController

- (_TtC8VideosUI27SearchResultsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9D01E28();
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI27SearchResultsViewController *v2;

  v2 = self;
  sub_1D9D01F64();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC8VideosUI27SearchResultsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D9D02228((uint64_t)a3);

  OUTLINED_FUNCTION_4_3(v6);
}

- (_TtC8VideosUI27SearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9D03C28();
}

- (void).cxx_destruct
{
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI27SearchResultsViewController_collectionImpressioner, &qword_1EDA8E6B0);
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI27SearchResultsViewController_delegate);
  OUTLINED_FUNCTION_15_2();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27SearchResultsViewController_stackViewController));
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_2();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27SearchResultsViewController____lazy_storage___noContentView));
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_19_5();
}

@end
