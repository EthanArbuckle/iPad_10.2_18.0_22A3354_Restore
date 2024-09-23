@implementation MusicManager

- (_TtC8VideosUI12MusicManager)init
{
  _TtC8VideosUI12MusicManager *result;

  sub_1D9D7FA00();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)dealloc
{
  _TtC8VideosUI12MusicManager *v2;

  v2 = self;
  sub_1D9D7FB90();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8VideosUI12MusicManager_logger;
  v3 = sub_1DA13FFD4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_19();
}

- (void)addSongToMusicWithSongId:(id)a3 isExplicit:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8VideosUI12MusicManager *v9;

  v6 = sub_1DA143E80();
  v8 = v7;
  v9 = self;
  sub_1D9D856C4(v6, v8, (os_log_type_t)a4);

  OUTLINED_FUNCTION_1_19();
}

@end
