@implementation ShareModelStoryActivity

+ (int64_t)activityCategory
{
  return 1;
}

- (NSString)activityType
{
  unint64_t v2;
  _TtC5Music23ShareModelStoryActivity *v3;
  NSString v4;

  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Music23ShareModelStoryActivity_socialNetwork))
  {
    if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Music23ShareModelStoryActivity_socialNetwork) == 1)
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

  sub_100415480(*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Music23ShareModelStoryActivity_socialNetwork));
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)_bundleIdentifierForActivityImageCreation
{
  unint64_t v2;
  NSString v3;

  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Music23ShareModelStoryActivity_socialNetwork))
  {
    if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Music23ShareModelStoryActivity_socialNetwork) == 1)
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
  _TtC5Music23ShareModelStoryActivity *v3;
  char v4;

  v3 = self;
  v4 = sub_1005613B8();

  return v4 & 1;
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
  _TtC5Music23ShareModelStoryActivity *v10;
  char v11;

  v7 = _Block_copy(a5);
  if (v7)
  {
    v8 = swift_allocObject(&unk_1010CDC88, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_100253D40;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  v11 = sub_1005614B0();
  sub_10004BA30((uint64_t)v7, v8);

  return v11 & 1;
}

- (_TtC5Music23ShareModelStoryActivity)init
{
  _TtC5Music23ShareModelStoryActivity *result;

  result = (_TtC5Music23ShareModelStoryActivity *)_swift_stdlib_reportUnimplementedInitializer("Music.ShareModelStoryActivity", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music23ShareModelStoryActivity_musicItem, &qword_10119E4A8);
  swift_bridgeObjectRelease();

  sub_100064B4C((uint64_t)self + OBJC_IVAR____TtC5Music23ShareModelStoryActivity_presentationSource);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music23ShareModelStoryActivity_metricsReporter, (uint64_t *)&unk_10119E450);
}

@end
