@implementation CatchUpFetchController

- (NSArray)mediaInfos
{
  _TtC8VideosUI22CatchUpFetchController *v2;
  uint64_t v3;

  v2 = self;
  sub_1D9C78D18();

  OUTLINED_FUNCTION_6_10(v3, (unint64_t *)&qword_1EDAB2F00);
  OUTLINED_FUNCTION_10_17();
  OUTLINED_FUNCTION_35_1();
  swift_bridgeObjectRelease();
  return (NSArray *)OUTLINED_FUNCTION_111(v2);
}

- (void)setMediaInfos:(id)a3
{
  _TtC8VideosUI22CatchUpFetchController *v4;

  OUTLINED_FUNCTION_6_10((uint64_t)self, (unint64_t *)&qword_1EDAB2F00);
  OUTLINED_FUNCTION_72_3();
  v4 = self;
  sub_1D9C79008();

}

- (void)dealloc
{
  _TtC8VideosUI22CatchUpFetchController *v2;

  v2 = self;
  sub_1D9C79870();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI22CatchUpFetchController_mediaInfo);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI22CatchUpFetchController_selectedAudioOption);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI22CatchUpFetchController_prewarmPlayer);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI22CatchUpFetchController_imageOperationQueue);
  OUTLINED_FUNCTION_19_5();
}

- (void)appendMediaInfos:(id)a3
{
  _TtC8VideosUI22CatchUpFetchController *v4;

  OUTLINED_FUNCTION_6_10((uint64_t)self, (unint64_t *)&qword_1EDAB2F00);
  OUTLINED_FUNCTION_72_3();
  v4 = self;
  OUTLINED_FUNCTION_35_1();
  sub_1D9C79B0C();

  OUTLINED_FUNCTION_19_5();
}

- (void)loadImageAtIndex:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  _TtC8VideosUI22CatchUpFetchController *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)OUTLINED_FUNCTION_5_10();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = self;
  sub_1D9BCFD10((uint64_t)&unk_1F0212010, (uint64_t)v7);
}

- (BOOL)mediaInfoContainsImageAtIndex:(unint64_t)a3
{
  void *v3;
  _TtC8VideosUI22CatchUpFetchController *v4;
  uint64_t v5;
  char v6;
  char v7;

  v4 = self;
  v5 = OUTLINED_FUNCTION_35_1();
  sub_1D9C7A118(v5);
  v7 = v6;

  return v7 & 1;
}

- (BOOL)mediaInfoContainsPlayerAtIndex:(unint64_t)a3
{
  char v3;

  sub_1D9C7A1CC(a3);
  return v3 & 1;
}

- (id)loadPlayerAtIndex:(unint64_t)a3
{
  void *v3;
  _TtC8VideosUI22CatchUpFetchController *v4;
  unint64_t v5;
  void *v6;

  v4 = self;
  v5 = OUTLINED_FUNCTION_35_1();
  v6 = (void *)sub_1D9C7A238(v5);

  return OUTLINED_FUNCTION_111(v6);
}

- (_TtC8VideosUI22CatchUpFetchController)initWithMediaInfos:(id)a3
{
  OUTLINED_FUNCTION_6_10((uint64_t)self, (unint64_t *)&qword_1EDAB2F00);
  OUTLINED_FUNCTION_72_3();
  sub_1D9C7AD7C();
}

- (_TtC8VideosUI22CatchUpFetchController)init
{
  sub_1D9C7ADD4();
}

@end
