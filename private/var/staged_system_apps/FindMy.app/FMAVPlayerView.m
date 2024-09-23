@implementation FMAVPlayerView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_100006C5C(0, &qword_1005DDDA0, AVPlayerLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC6FindMy14FMAVPlayerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002884EC();
}

- (void)dealloc
{
  void *v2;
  _TtC6FindMy14FMAVPlayerView *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMAVPlayerView_assetManager);
  v3 = self;
  objc_msgSend(v2, "invalidate");
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for FMAVPlayerView();
  -[FMAVPlayerView dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->info[OBJC_IVAR____TtC6FindMy14FMAVPlayerView_info + 96]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy14FMAVPlayerView_playerStartedObservation));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy14FMAVPlayerView_playerEndedObserver));
  sub_10005D03C((uint64_t)self + OBJC_IVAR____TtC6FindMy14FMAVPlayerView_playerTimeObserver);
  swift_bridgeObjectRelease(*(_QWORD *)&self->assetBundle[OBJC_IVAR____TtC6FindMy14FMAVPlayerView_playingAssetName]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy14FMAVPlayerView_deviceAssetRequestWatchDogWorkItem));
  swift_bridgeObjectRelease(*(_QWORD *)&self->assetBundle[OBJC_IVAR____TtC6FindMy14FMAVPlayerView_assetName]);
  sub_1000327F0(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMAVPlayerView_playingHandler), *(_QWORD *)&self->assetBundle[OBJC_IVAR____TtC6FindMy14FMAVPlayerView_playingHandler]);
  sub_1000327F0(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMAVPlayerView_showHideHandler), *(_QWORD *)&self->assetBundle[OBJC_IVAR____TtC6FindMy14FMAVPlayerView_showHideHandler]);
}

- (NSString)description
{
  unint64_t v2;
  unint64_t v3;
  NSString v4;

  v2 = *(_QWORD *)&self->assetBundle[OBJC_IVAR____TtC6FindMy14FMAVPlayerView_assetName];
  if (v2)
    v3 = v2;
  else
    v3 = 0x80000001004BA570;
  swift_bridgeObjectRetain(v2);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (_TtC6FindMy14FMAVPlayerView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy14FMAVPlayerView *result;

  result = (_TtC6FindMy14FMAVPlayerView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAVPlayerView", 21, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (NSString)accessibilityAssetName
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->assetBundle[OBJC_IVAR____TtC6FindMy14FMAVPlayerView_assetName];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->assetBundle[OBJC_IVAR____TtC6FindMy14FMAVPlayerView_assetName]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

@end
