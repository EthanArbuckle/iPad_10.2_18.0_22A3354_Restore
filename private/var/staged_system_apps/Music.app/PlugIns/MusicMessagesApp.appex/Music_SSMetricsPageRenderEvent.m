@implementation Music_SSMetricsPageRenderEvent

+ (NSString)Topic
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC9MusicCore30Music_SSMetricsPageRenderEvent *v8;
  id v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100471550, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  v9 = a3;
  sub_1000CD570(a3, v8, v8, (uint64_t)a3, (uint64_t)sub_1000CE5C4, v7);

  swift_release(v7);
}

- (_TtC9MusicCore30Music_SSMetricsPageRenderEvent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[Music_SSMetricsPageRenderEvent init](&v3, "init");
}

- (_TtC9MusicCore30Music_SSMetricsPageRenderEvent)initWithBodyDictionary:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  Class isa;
  _TtC9MusicCore30Music_SSMetricsPageRenderEvent *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = -[Music_SSMetricsPageRenderEvent initWithBodyDictionary:](&v10, "initWithBodyDictionary:", isa);

  return v8;
}

@end
