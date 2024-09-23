@implementation PlayerHUDDocumentViewController

- (double)contentsHeight
{
  _TtC8VideosUI31PlayerHUDDocumentViewController *v2;
  double result;

  v2 = self;
  sub_1D9E3C31C();

  OUTLINED_FUNCTION_59();
  return result;
}

- (id)contentsDidLoad
{
  return sub_1D9E3C520((uint64_t)self, (uint64_t)a2, sub_1D9E3C3B4, (uint64_t)sub_1D9741598, (uint64_t)&block_descriptor_17_4);
}

- (void)setContentsDidLoad:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v4 = OUTLINED_FUNCTION_154_4((int)self, (int)a2, a3);
  if (v4)
    *(_QWORD *)(OUTLINED_FUNCTION_37() + 16) = v4;
  v5 = v3;
  OUTLINED_FUNCTION_25_106();
  sub_1D9E3C42C();
  OUTLINED_FUNCTION_12_4(v6);
}

- (id)didInteract
{
  return sub_1D9E3C520((uint64_t)self, (uint64_t)a2, sub_1D9E3C59C, (uint64_t)sub_1D9E3C5B0, (uint64_t)&block_descriptor_11_0);
}

- (void)setDidInteract:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v4 = OUTLINED_FUNCTION_154_4((int)self, (int)a2, a3);
  if (v4)
    *(_QWORD *)(OUTLINED_FUNCTION_37() + 16) = v4;
  v5 = v3;
  OUTLINED_FUNCTION_25_106();
  sub_1D9E3C618();
  OUTLINED_FUNCTION_12_4(v6);
}

- (int64_t)itemCount
{
  _TtC8VideosUI31PlayerHUDDocumentViewController *v2;
  int64_t result;

  v2 = self;
  sub_1D9E3C89C();

  OUTLINED_FUNCTION_2_1();
  return result;
}

- (VUIMultiPlayerDetailsViewControllerDelegate)detailDelegate
{
  sub_1D9E3C92C();
}

- (void)setDetailDelegate:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_54_12();
  v4 = v3;
  OUTLINED_FUNCTION_36_5();
  sub_1D9E3C998();
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9E3CB80();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9E3CC00();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9E3CD9C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI31PlayerHUDDocumentViewController *v2;

  v2 = self;
  sub_1D9E3CDF4();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9E3DE14();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)updateWithSelectedPlaybackIdentifiers:(id)a3 reloadingData:(BOOL)a4
{
  _TtC8VideosUI31PlayerHUDDocumentViewController *v6;
  uint64_t v7;

  sub_1DA1440FC();
  v6 = self;
  v7 = OUTLINED_FUNCTION_183_0();
  sub_1D9E3E200(v7, a4);

  OUTLINED_FUNCTION_1_19();
}

- (void)updateVisibleCellsWithPlaybackIdentifiers:(id)a3
{
  void *v3;
  _TtC8VideosUI31PlayerHUDDocumentViewController *v5;

  sub_1DA1440FC();
  v5 = self;
  OUTLINED_FUNCTION_183_0();
  sub_1D9E3E2E0();

  OUTLINED_FUNCTION_1_19();
}

- (_TtC8VideosUI31PlayerHUDDocumentViewController)initWithCoder:(id)a3
{
  _TtC8VideosUI31PlayerHUDDocumentViewController *result;

  sub_1D9E3E530((uint64_t)a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI31PlayerHUDDocumentViewController_nowPlayingTabDelegate);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_33_14((uint64_t *)((char *)self
                                    + OBJC_IVAR____TtC8VideosUI31PlayerHUDDocumentViewController_contentsDidLoad));
  OUTLINED_FUNCTION_33_14((uint64_t *)((char *)self
                                    + OBJC_IVAR____TtC8VideosUI31PlayerHUDDocumentViewController_didInteract));
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI31PlayerHUDDocumentViewController_detailDelegate);
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI31PlayerHUDDocumentViewController_focusButton));
}

- (void)setNowPlayingTabDelegate:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_54_12();
  v4 = v3;
  OUTLINED_FUNCTION_36_5();
  sub_1D9E3E790();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_5_8(v5);
}

- (id)getNowPlayingTabContextData
{
  _TtC8VideosUI31PlayerHUDDocumentViewController *v2;
  uint64_t *v3;

  v2 = self;
  v3 = sub_1D9E3E868();

  if (v3)
  {
    sub_1DA143C70();
    OUTLINED_FUNCTION_1_14();
  }
  else
  {
    v2 = 0;
  }
  return OUTLINED_FUNCTION_111(v2);
}

- (void)setNowPlayingTabContextData:(id)a3
{
  void *v3;
  _TtC8VideosUI31PlayerHUDDocumentViewController *v5;
  uint64_t v6;

  sub_1DA143C7C();
  v5 = self;
  v6 = OUTLINED_FUNCTION_183_0();
  sub_1D9E3E978(v6);

  OUTLINED_FUNCTION_1_19();
}

- (double)nowPlayingTabHeight
{
  _TtC8VideosUI31PlayerHUDDocumentViewController *v2;
  double result;

  v2 = self;
  sub_1D9E3EB04();

  OUTLINED_FUNCTION_59();
  return result;
}

- (void)setPlayerViewSize:(CGSize)a3
{
  double height;
  double width;
  _TtC8VideosUI31PlayerHUDDocumentViewController *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1D9E3EBF8(width, height);
  OUTLINED_FUNCTION_12_4(v5);
}

@end
