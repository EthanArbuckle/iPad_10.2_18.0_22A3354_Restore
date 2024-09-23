@implementation HighlightsManager

- (_TtC8VideosUI17HighlightsManager)init
{
  _TtC8VideosUI17HighlightsManager *result;

  sub_1D97FA824();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)dealloc
{
  _TtC8VideosUI17HighlightsManager *v2;

  v2 = self;
  sub_1D9F5AAB8();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  sub_1D9F5ABA8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8VideosUI17HighlightsManager_pendingHighlightsUpdate), *(_QWORD *)&self->highlightCenter[OBJC_IVAR____TtC8VideosUI17HighlightsManager_pendingHighlightsUpdate], *(_QWORD *)&self->$__lazy_storage_$_syndicationIdToHighlightMap[OBJC_IVAR____TtC8VideosUI17HighlightsManager_pendingHighlightsUpdate], *(_QWORD *)&self->pendingHighlightsUpdate[OBJC_IVAR____TtC8VideosUI17HighlightsManager_pendingHighlightsUpdate]);

}

- (void)highlightCenterDidAddHighlights:(id)a3
{
  id v4;
  _TtC8VideosUI17HighlightsManager *v5;

  v4 = a3;
  v5 = self;
  sub_1D9F5C010();

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC8VideosUI17HighlightsManager *v8;

  OUTLINED_FUNCTION_6_10((uint64_t)self, (unint64_t *)&unk_1EDA9B820);
  v6 = sub_1DA1440FC();
  v7 = a3;
  v8 = self;
  sub_1D9F5C0C8((uint64_t)v8, v6);

  OUTLINED_FUNCTION_1_19();
}

- (void)highlightCenterSettingsEnablementHasChanged:(id)a3
{
  id v4;
  _TtC8VideosUI17HighlightsManager *v5;

  v4 = a3;
  v5 = self;
  sub_1D9F5C1B4((uint64_t)v5);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)handleAccountStoreDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8VideosUI17HighlightsManager *v9;

  v4 = sub_1DA13F0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_61();
  v8 = v7 - v6;
  sub_1DA13F080();
  v9 = self;
  sub_1D9F5C410((uint64_t)v9);

  OUTLINED_FUNCTION_5_0(v8, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
}

@end
