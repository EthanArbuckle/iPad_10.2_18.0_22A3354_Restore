@implementation ShazamState

- (_TtC12NowPlayingUI11ShazamState)init
{
  return (_TtC12NowPlayingUI11ShazamState *)sub_982AC();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC12NowPlayingUI11ShazamState__songTitle;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1FCF98);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC12NowPlayingUI11ShazamState__musicURL;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1FEB28);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC12NowPlayingUI11ShazamState__isShazamOn;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_201780);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

@end
