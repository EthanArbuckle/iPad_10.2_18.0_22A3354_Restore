@implementation LibDownloadObserver

- (_TtC8VideosUI19LibDownloadObserver)init
{
  _TtC8VideosUI19LibDownloadObserver *result;

  sub_1D9B7A6A8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)dealloc
{
  _TtC8VideosUI19LibDownloadObserver *v2;

  v2 = self;
  sub_1D9B7B164();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI19LibDownloadObserver__hasDownloadInProgress;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA87880);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

}

- (void)downloadManager:(id)a3 didEnqueueAssetDownloads:(id)a4 didRemoveAssetDownloads:(id)a5
{
  _TtC8VideosUI19LibDownloadObserver *v7;
  id v8;
  _TtC8VideosUI19LibDownloadObserver *v9;

  v7 = self;
  if (a4)
  {
    OUTLINED_FUNCTION_6_10((uint64_t)self, &qword_1F020B8D8);
    self = (_TtC8VideosUI19LibDownloadObserver *)OUTLINED_FUNCTION_40_11();
  }
  if (a5)
  {
    OUTLINED_FUNCTION_6_10((uint64_t)self, &qword_1F020B8D8);
    OUTLINED_FUNCTION_39_30();
  }
  v8 = a3;
  v9 = v7;
  sub_1D9B7B304();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  id v4;
  _TtC8VideosUI19LibDownloadObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1D9B7C1E0();

  OUTLINED_FUNCTION_4_3(v5);
}

@end
