@implementation ShareLyricsStoryActivity

+ (int64_t)activityCategory
{
  return 1;
}

- (NSString)activityType
{
  unint64_t v2;
  _TtC16MusicApplication24ShareLyricsStoryActivity *v3;
  NSString v4;

  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC16MusicApplication24ShareLyricsStoryActivity_socialNetwork))
  {
    if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC16MusicApplication24ShareLyricsStoryActivity_socialNetwork) == 1)
      v2 = 0x80000000010C2B40;
    else
      v2 = 0x80000000010C2B60;
  }
  else
  {
    v2 = 0x80000000010C2B10;
  }
  v3 = self;
  v4 = String._bridgeToObjectiveC()();

  swift_bridgeObjectRelease(v2);
  return (NSString *)v4;
}

- (NSString)activityTitle
{
  NSString v2;

  sub_53F090(*((_BYTE *)&self->super.super.isa
             + OBJC_IVAR____TtC16MusicApplication24ShareLyricsStoryActivity_socialNetwork));
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)_bundleIdentifierForActivityImageCreation
{
  unint64_t v2;
  NSString v3;

  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC16MusicApplication24ShareLyricsStoryActivity_socialNetwork))
  {
    if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC16MusicApplication24ShareLyricsStoryActivity_socialNetwork) == 1)
      v2 = 0x80000000010C83E0;
    else
      v2 = 0x80000000010C83A0;
  }
  else
  {
    v2 = 0x80000000010C83C0;
  }
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  _TtC16MusicApplication24ShareLyricsStoryActivity *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_AB9638();

  return self & 1;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t (*v8)();
  _TtC16MusicApplication24ShareLyricsStoryActivity *v9;

  v6 = _Block_copy(a4);
  if (a3)
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1399BE8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_112F24;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = self;
  sub_AB87B4((uint64_t)a3, (uint64_t)v8, v7);
  sub_5C198((uint64_t)v8, v7);

  swift_bridgeObjectRelease();
}

- (_TtC16MusicApplication24ShareLyricsStoryActivity)init
{
  _TtC16MusicApplication24ShareLyricsStoryActivity *result;

  result = (_TtC16MusicApplication24ShareLyricsStoryActivity *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ShareLyricsStoryActivity", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication24ShareLyricsStoryActivity_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24ShareLyricsStoryActivity_artwork, (uint64_t *)&unk_14AD650);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_56060((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24ShareLyricsStoryActivity_presentationSource);
}

@end
