@implementation BSUIMicaFileProvider

- (id)dataFor:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BSUIMicaFileProvider *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Class isa;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = sub_109BEC(v4, v6);
  v10 = v9;

  swift_bridgeObjectRelease(v6);
  if (v10 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_109E78(v8, v10);
  }
  return isa;
}

- (BSUIMicaFileProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MicaFileProvider();
  return -[BSUIMicaFileProvider init](&v3, "init");
}

@end
