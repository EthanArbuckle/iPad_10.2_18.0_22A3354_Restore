@implementation JSHighlightsManager

- (_TtC8VideosUI19JSHighlightsManager)initWithAppContext:(id)a3
{
  OUTLINED_FUNCTION_91_0();
  return (_TtC8VideosUI19JSHighlightsManager *)sub_1D97F1C44(a3);
}

- (void)syndicationInfoUpdated:(id)a3
{
  id v3;

  sub_1DA143C7C();
  v3 = OUTLINED_FUNCTION_91_0();
  sub_1D9E5E84C();

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  _TtC8VideosUI19JSHighlightsManager *v2;

  v2 = self;
  sub_1D9E5EED0();
}

- (_TtC8VideosUI19JSHighlightsManager)init
{
  sub_1D9E5EFD4();
}

- (void)handleHighlightsUpdatedNotification:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  OUTLINED_FUNCTION_5_129();
  OUTLINED_FUNCTION_44_8();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_1_158();
  v5 = v3;
  sub_1D9E5F00C();

  OUTLINED_FUNCTION_7_129();
  OUTLINED_FUNCTION_28_0();
}

- (void)handleRestrictionsDidChange:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  OUTLINED_FUNCTION_5_129();
  OUTLINED_FUNCTION_44_8();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_1_158();
  v5 = v3;
  sub_1D9E5F218();

  OUTLINED_FUNCTION_7_129();
  OUTLINED_FUNCTION_28_0();
}

@end
