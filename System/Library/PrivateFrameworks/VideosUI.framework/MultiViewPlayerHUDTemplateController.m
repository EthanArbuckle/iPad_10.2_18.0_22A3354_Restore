@implementation MultiViewPlayerHUDTemplateController

- (int64_t)itemCount
{
  _TtC8VideosUI36MultiViewPlayerHUDTemplateController *v2;
  int64_t result;

  v2 = self;
  sub_1D9F85CA0();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (double)contentsHeight
{
  _TtC8VideosUI36MultiViewPlayerHUDTemplateController *v2;
  double result;

  v2 = self;
  sub_1D9F85E70();

  OUTLINED_FUNCTION_59();
  return result;
}

- (id)contentsDidLoad
{
  return sub_1D9F85F60((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_contentsDidLoad, (void (*)(_QWORD, _QWORD))sub_1D97B2C04, (uint64_t)sub_1D9741598, (uint64_t)&block_descriptor_20_2);
}

- (void)setContentsDidLoad:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v4 = OUTLINED_FUNCTION_154_4((int)self, (int)a2, a3);
  if (v4)
    *(_QWORD *)(OUTLINED_FUNCTION_37() + 16) = v4;
  v6 = v3;
  OUTLINED_FUNCTION_58_68((uint64_t)v6, v5, &OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_contentsDidLoad, (void (*)(uint64_t, uint64_t))sub_1D97B50A8);
  OUTLINED_FUNCTION_4_3(v6);
}

- (id)didInteract
{
  return sub_1D9F85F60((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_didInteract, (void (*)(_QWORD, _QWORD))sub_1D97B2C04, (uint64_t)sub_1D9E3C5B0, (uint64_t)&block_descriptor_14_4);
}

- (void)setDidInteract:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v4 = OUTLINED_FUNCTION_154_4((int)self, (int)a2, a3);
  if (v4)
    *(_QWORD *)(OUTLINED_FUNCTION_37() + 16) = v4;
  v6 = v3;
  OUTLINED_FUNCTION_58_68((uint64_t)v6, v5, &OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_didInteract, (void (*)(uint64_t, uint64_t))sub_1D97B50A8);
  OUTLINED_FUNCTION_4_3(v6);
}

- (VUIMultiPlayerDetailsViewControllerDelegate)detailDelegate
{
  sub_1D9F86314();
}

- (void)setDetailDelegate:(id)a3
{
  _TtC8VideosUI36MultiViewPlayerHUDTemplateController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1D9F86394();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI36MultiViewPlayerHUDTemplateController *v2;

  v2 = self;
  sub_1D9F863E0();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  _TtC8VideosUI36MultiViewPlayerHUDTemplateController *v3;

  v3 = self;
  sub_1D9F86924();
  OUTLINED_FUNCTION_5_8(v3);
}

- (_TtC8VideosUI36MultiViewPlayerHUDTemplateController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F87020();
}

- (void)vuiScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8VideosUI36MultiViewPlayerHUDTemplateController *v5;

  v4 = a3;
  v5 = self;
  sub_1D9F8716C(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)updateWithSelectedPlaybackIdentifiers:(id)a3 reloadingData:(BOOL)a4
{
  _TtC8VideosUI36MultiViewPlayerHUDTemplateController *v6;

  sub_1DA1440FC();
  v6 = self;
  sub_1D9F887F4((uint64_t)v6, a4);

  OUTLINED_FUNCTION_1_19();
}

- (void)updateVisibleCellsWithPlaybackIdentifiers:(id)a3
{
  _TtC8VideosUI36MultiViewPlayerHUDTemplateController *v4;

  sub_1DA1440FC();
  v4 = self;
  sub_1D9F88D34();

  OUTLINED_FUNCTION_1_19();
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  sub_1D9F89190(self, (uint64_t)a2, a3, (uint64_t)a4, 1);
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  sub_1D9F89190(self, (uint64_t)a2, a3, (uint64_t)a4, 0);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_33_14((uint64_t *)((char *)self
                                    + OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_contentsDidLoad));
  OUTLINED_FUNCTION_33_14((uint64_t *)((char *)self
                                    + OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_didInteract));
  OUTLINED_FUNCTION_131_25((uint64_t)self + OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_detailDelegate);
}

@end
