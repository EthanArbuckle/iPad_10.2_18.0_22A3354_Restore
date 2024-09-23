@implementation EpicInlineViewController

- (void)vui_loadView
{
  _TtC8VideosUI24EpicInlineViewController *v2;

  v2 = self;
  sub_1D9C36C0C();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC8VideosUI24EpicInlineViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D9C37018((void (*)(uint64_t))a3);

  OUTLINED_FUNCTION_12_4(v6);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI24EpicInlineViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9C370E4(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  _TtC8VideosUI24EpicInlineViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9C375BC(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)vui_viewWillLayoutSubviews
{
  _TtC8VideosUI24EpicInlineViewController *v2;

  v2 = self;
  sub_1D9C376D4();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI24EpicInlineViewController *v2;

  v2 = self;
  sub_1D9C37884();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8VideosUI24EpicInlineViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1D9C3818C(a4, width, height);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_12_4(v8);
}

- (void)dealloc
{
  _TtC8VideosUI24EpicInlineViewController *v2;

  v2 = self;
  sub_1D9C383D8();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  sub_1D9C369AC((uint64_t)self + OBJC_IVAR____TtC8VideosUI24EpicInlineViewController_collectionImpressioner);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24EpicInlineViewController_horizontalStackViewController));
  OUTLINED_FUNCTION_10_3();
}

- (void)handleIsPlaybackUIBeingShownDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8VideosUI24EpicInlineViewController *v8;
  uint64_t v9;

  v4 = sub_1DA13F0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA13F080();
  v8 = self;
  sub_1D9C3857C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_28_0();
}

- (void)handleAppWillEnterForeground:(id)a3
{
  sub_1D9C386B4(self, (uint64_t)a2, (uint64_t)a3, sub_1D9C38740);
}

- (void)handleAppDidEnterBackground:(id)a3
{
  sub_1D9C386B4(self, (uint64_t)a2, (uint64_t)a3, sub_1D9C38784);
}

- (void)handleVPPADismissed:(id)a3
{
  sub_1D9C386B4(self, (uint64_t)a2, (uint64_t)a3, sub_1D9C38740);
}

- (void)handleVPPAPresented:(id)a3
{
  sub_1D9C386B4(self, (uint64_t)a2, (uint64_t)a3, sub_1D9C38784);
}

- (_TtC8VideosUI24EpicInlineViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI24EpicInlineViewController *result;

  if (a3)
  {
    v5 = sub_1DA143E80();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  sub_1D9C38A84(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI24EpicInlineViewController)initWithCoder:(id)a3
{
  _TtC8VideosUI24EpicInlineViewController *result;

  sub_1D9C38B78(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

@end
