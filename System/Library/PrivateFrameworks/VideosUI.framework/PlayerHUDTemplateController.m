@implementation PlayerHUDTemplateController

- (void)vui_viewDidLoad
{
  _TtC8VideosUI27PlayerHUDTemplateController *v2;

  v2 = self;
  sub_1D9A69DC8();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  _TtC8VideosUI27PlayerHUDTemplateController *v3;

  v3 = self;
  OUTLINED_FUNCTION_72_11((uint64_t)v3, (SEL *)&selRef_vui_viewWillAppear_);
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  _TtC8VideosUI27PlayerHUDTemplateController *v3;

  v3 = self;
  OUTLINED_FUNCTION_72_11((uint64_t)v3, (SEL *)&selRef_vui_viewDidDisappear_);
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI27PlayerHUDTemplateController *v2;

  v2 = self;
  sub_1D9A6A1E4();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)dealloc
{
  _TtC8VideosUI27PlayerHUDTemplateController *v2;

  v2 = self;
  sub_1D9A6A2E0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI27PlayerHUDTemplateController_nowPlayingTabDelegate);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27PlayerHUDTemplateController_targetResponderForPendingEventHandling));
  OUTLINED_FUNCTION_19_5();
}

- (void)handlePlayerDismissedAfterPiping:(id)a3
{
  sub_1D9A6C0B4(self, (uint64_t)a2, (uint64_t)a3, sub_1D9A6BF90);
}

- (void)handlePipingDidChange:(id)a3
{
  sub_1D9A6C0B4(self, (uint64_t)a2, (uint64_t)a3, sub_1D9A6C028);
}

- (_TtC8VideosUI27PlayerHUDTemplateController)initWithCoder:(id)a3
{
  _TtC8VideosUI27PlayerHUDTemplateController *result;

  sub_1D9A6C6F8((uint64_t)a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

@end
