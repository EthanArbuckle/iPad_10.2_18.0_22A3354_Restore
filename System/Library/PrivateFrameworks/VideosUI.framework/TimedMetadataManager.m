@implementation TimedMetadataManager

- (_TtC8VideosUI20TimedMetadataManager)init
{
  _TtC8VideosUI20TimedMetadataManager *result;

  sub_1D9A90FB4();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)addObserverForPlayer:(id)a3
{
  id v4;
  _TtC8VideosUI20TimedMetadataManager *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D9A910F0(v6);

  OUTLINED_FUNCTION_4_3(v7);
}

- (void)removeObserverForPlayer:(id)a3
{
  id v4;
  _TtC8VideosUI20TimedMetadataManager *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D9A911C4(v6);

  OUTLINED_FUNCTION_4_3(v7);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI20TimedMetadataManager_logger;
  v4 = sub_1DA13FFD4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
