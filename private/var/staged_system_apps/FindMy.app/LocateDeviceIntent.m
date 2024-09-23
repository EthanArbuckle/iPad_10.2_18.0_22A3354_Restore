@implementation LocateDeviceIntent

- (LocateDeviceIntent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocateDeviceIntent();
  return -[LocateDeviceIntent init](&v3, "init");
}

- (LocateDeviceIntent)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LocateDeviceIntent();
  return -[LocateDeviceIntent initWithCoder:](&v5, "initWithCoder:", a3);
}

- (LocateDeviceIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  LocateDeviceIntent *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for LocateDeviceIntent();
  v11 = -[LocateDeviceIntent initWithIdentifier:backingStore:](&v13, "initWithIdentifier:backingStore:", v9, a4);

  return v11;
}

- (LocateDeviceIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  NSString v13;
  NSDictionary v14;
  LocateDeviceIntent *v15;
  objc_super v17;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  if (a5)
    a5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  if (a5)
  {
    v14.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v14.super.isa = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for LocateDeviceIntent();
  v15 = -[LocateDeviceIntent initWithDomain:verb:parametersByName:](&v17, "initWithDomain:verb:parametersByName:", v12, v13, v14.super.isa);

  return v15;
}

@end
