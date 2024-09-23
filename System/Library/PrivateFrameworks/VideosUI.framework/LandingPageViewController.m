@implementation LandingPageViewController

- (void)vui_willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC8VideosUI25LandingPageViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D97CD808((uint64_t)a3);

  OUTLINED_FUNCTION_4_3(v6);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI25LandingPageViewController *v2;

  v2 = self;
  sub_1D97CDCA8();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D97CDD24();
  OUTLINED_FUNCTION_5_8(v3);
}

- (_TtC8VideosUI25LandingPageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F12E08();
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9F12F68();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9F12FEC();
  OUTLINED_FUNCTION_5_8(v3);
}

- (_TtC8VideosUI25LandingPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9F13338();
}

- (void).cxx_destruct
{
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI25LandingPageViewController_collectionImpressioner, &qword_1EDA8E6B0);
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI25LandingPageViewController_delegate);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25LandingPageViewController_stackViewController));
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI25LandingPageViewController_lastRefreshTime, (uint64_t *)&unk_1EDA877D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25LandingPageViewController_notificationCenter));
  OUTLINED_FUNCTION_129_2((uint64_t *)((char *)self
                                    + OBJC_IVAR____TtC8VideosUI25LandingPageViewController_naturalLanguageSearchData));
  OUTLINED_FUNCTION_10_3();
}

- (void)handleAppWillEnterForeground:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8VideosUI25LandingPageViewController *v9;
  uint64_t v10;

  v5 = sub_1DA13F0B0();
  OUTLINED_FUNCTION_316();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA13F080();
  v9 = self;
  sub_1D9F136A8();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v5);
}

@end
