@implementation BrowsingVideoModel

- (_TtC15PhotosUIPrivate18BrowsingVideoModel)init
{
  return (_TtC15PhotosUIPrivate18BrowsingVideoModel *)sub_1AAB8D258();
}

- (void)videoPlayer:(id)a3 currentTimeDidChange:(id *)a4
{
  id v5;
  _TtC15PhotosUIPrivate18BrowsingVideoModel *v6;

  v5 = a3;
  v6 = self;
  sub_1AAB8E0AC();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel___audioMuteState;
  v4 = OUTLINED_FUNCTION_12_3();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel_videoPlayer);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel_browsingViewModel);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel_assetViewModel);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel__controlSource);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel_timeRangeMarkUIProvider);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel_assetViewModelObservation);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel_videoPlayerObservation);
  OUTLINED_FUNCTION_14_3();
  v5 = (char *)self + OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel___observationRegistrar;
  v6 = sub_1AB08B0A4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (void)mediaTimelineControl:(id)a3 didChangeValue:(float)a4
{
  id v6;
  _TtC15PhotosUIPrivate18BrowsingVideoModel *v7;

  v6 = a3;
  v7 = self;
  sub_1AAB8F2B0(a4);

}

- (void)mediaTimelineControlWillBeginChanging:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate18BrowsingVideoModel *v5;

  v4 = a3;
  v5 = self;
  sub_1AAB8F4A0();

}

- (void)mediaTimelineControlDidEndChanging:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate18BrowsingVideoModel *v5;

  v4 = a3;
  v5 = self;
  sub_1AAB8F62C();

}

@end
