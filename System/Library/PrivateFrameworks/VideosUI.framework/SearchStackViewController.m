@implementation SearchStackViewController

- (void)vui_didMoveToParentViewController:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v5 = OUTLINED_FUNCTION_63_1();
  sub_1D97CC64C(v3);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI25SearchStackViewController *v2;

  v2 = self;
  sub_1D97CC958();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI25SearchStackViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9E8EB2C();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  uint64_t v4;
  void *v5;
  id v6;

  OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v6 = OUTLINED_FUNCTION_63_1();
  sub_1D9E8ECA4(v4);

  OUTLINED_FUNCTION_4_3(v6);
}

- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC8VideosUI25SearchStackViewController *v12;

  v6 = sub_1DA13F710();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_61();
  v10 = v9 - v8;
  sub_1DA13F6BC();
  v11 = a3;
  v12 = self;
  sub_1D9E8EF28((uint64_t)v11);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  OUTLINED_FUNCTION_28_0();
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI25SearchStackViewController_delegate);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_19_5();
}

@end
