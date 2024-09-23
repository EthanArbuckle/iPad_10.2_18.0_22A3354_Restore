@implementation Music_SSMetricsComponentRenderEvent

+ (NSString)Topic
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC9MusicCore35Music_SSMetricsComponentRenderEvent *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1010F0920, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_100A268E4(a3, (uint64_t)sub_100A2A018, v7);

  swift_release();
}

- (_TtC9MusicCore35Music_SSMetricsComponentRenderEvent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Music_SSMetricsComponentRenderEvent();
  return -[Music_SSMetricsComponentRenderEvent init](&v3, "init");
}

- (_TtC9MusicCore35Music_SSMetricsComponentRenderEvent)initWithBodyDictionary:(id)a3
{
  Class isa;
  _TtC9MusicCore35Music_SSMetricsComponentRenderEvent *v5;
  objc_super v7;

  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for Music_SSMetricsComponentRenderEvent();
  v5 = -[Music_SSMetricsComponentRenderEvent initWithBodyDictionary:](&v7, "initWithBodyDictionary:", isa);

  return v5;
}

@end
