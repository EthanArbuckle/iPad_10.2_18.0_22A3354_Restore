@implementation MessagingError

- (_TtC25keychainsharingmessagingd14MessagingError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  NSDictionary v11;
  _TtC25keychainsharingmessagingd14MessagingError *v12;
  objc_super v14;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  if (a5)
    a5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for MessagingError();
  v12 = -[MessagingError initWithDomain:code:userInfo:](&v14, "initWithDomain:code:userInfo:", v10, a4, v11.super.isa);

  return v12;
}

- (_TtC25keychainsharingmessagingd14MessagingError)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MessagingError();
  return -[MessagingError initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
