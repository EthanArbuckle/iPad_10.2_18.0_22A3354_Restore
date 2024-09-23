@implementation ShareLyricsStoryActivity

+ (int64_t)activityCategory
{
  return 1;
}

- (NSString)activityType
{
  unint64_t v2;
  _TtC5Music24ShareLyricsStoryActivity *v3;
  NSString v4;

  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Music24ShareLyricsStoryActivity_socialNetwork))
  {
    if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Music24ShareLyricsStoryActivity_socialNetwork) == 1)
      v2 = 0x8000000100E2AC10;
    else
      v2 = 0x8000000100E2AC30;
  }
  else
  {
    v2 = 0x8000000100E2ABE0;
  }
  v3 = self;
  v4 = String._bridgeToObjectiveC()();

  swift_bridgeObjectRelease(v2);
  return (NSString *)v4;
}

- (NSString)activityTitle
{
  NSString v2;

  sub_100415480(*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Music24ShareLyricsStoryActivity_socialNetwork));
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)_bundleIdentifierForActivityImageCreation
{
  unint64_t v2;
  NSString v3;

  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Music24ShareLyricsStoryActivity_socialNetwork))
  {
    if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Music24ShareLyricsStoryActivity_socialNetwork) == 1)
      v2 = 0x8000000100E398A0;
    else
      v2 = 0x8000000100E39860;
  }
  else
  {
    v2 = 0x8000000100E39880;
  }
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  _TtC5Music24ShareLyricsStoryActivity *v3;
  char v4;

  v3 = self;
  v4 = sub_1007D85F0();

  return v4 & 1;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t (*v8)();
  _TtC5Music24ShareLyricsStoryActivity *v9;

  v6 = _Block_copy(a4);
  if (a3)
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1010DCDF8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_100253D40;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = self;
  sub_1007D7720((uint64_t)a3, (uint64_t)v8, v7);
  sub_10004BA30((uint64_t)v8, v7);

  swift_bridgeObjectRelease();
}

- (_TtC5Music24ShareLyricsStoryActivity)init
{
  _TtC5Music24ShareLyricsStoryActivity *result;

  result = (_TtC5Music24ShareLyricsStoryActivity *)_swift_stdlib_reportUnimplementedInitializer("Music.ShareLyricsStoryActivity", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC5Music24ShareLyricsStoryActivity_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24ShareLyricsStoryActivity_artwork, &qword_1011A1440);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100064B4C((uint64_t)self + OBJC_IVAR____TtC5Music24ShareLyricsStoryActivity_presentationSource);
}

@end
