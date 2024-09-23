@implementation ShareModelStoryActivity

+ (int64_t)activityCategory
{
  return 1;
}

- (NSString)activityType
{
  unint64_t v2;
  _TtC16MusicApplication23ShareModelStoryActivity *v3;
  NSString v4;

  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC16MusicApplication23ShareModelStoryActivity_socialNetwork))
  {
    if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC16MusicApplication23ShareModelStoryActivity_socialNetwork) == 1)
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
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_53F090(*((_BYTE *)&self->super.super.isa
             + OBJC_IVAR____TtC16MusicApplication23ShareModelStoryActivity_socialNetwork));
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (id)_bundleIdentifierForActivityImageCreation
{
  unint64_t v2;
  NSString v3;

  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC16MusicApplication23ShareModelStoryActivity_socialNetwork))
  {
    if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC16MusicApplication23ShareModelStoryActivity_socialNetwork) == 1)
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
  _TtC16MusicApplication23ShareModelStoryActivity *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_11278C();

  return self & 1;
}

- (BOOL)_managesOwnPresentation
{
  return 1;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  _TtC16MusicApplication23ShareModelStoryActivity *v10;
  char v11;

  v7 = _Block_copy(a5);
  if (v7)
  {
    v8 = swift_allocObject(&unk_1347020, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_112F24;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  v11 = sub_112884();
  sub_5C198((uint64_t)v7, v8);

  return v11 & 1;
}

- (_TtC16MusicApplication23ShareModelStoryActivity)init
{
  _TtC16MusicApplication23ShareModelStoryActivity *result;

  result = (_TtC16MusicApplication23ShareModelStoryActivity *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ShareModelStoryActivity", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication23ShareModelStoryActivity_musicItem, &qword_14AED68);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication23ShareModelStoryActivity_effectiveStorePlatformDictionary));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23ShareModelStoryActivity_jsModel));
  sub_56060((uint64_t)self + OBJC_IVAR____TtC16MusicApplication23ShareModelStoryActivity_presentationSource);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication23ShareModelStoryActivity_metricsReporter, (uint64_t *)&unk_14AED10);
}

@end
