@implementation CRLWPSystemFontNames

+ (NSString)baseName
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)ultraLight
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)thin
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)light
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)regular
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)medium
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)semibold
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)bold
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)heavy
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)black
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSArray)allSystemFontNames
{
  Class isa;

  if (qword_1013DD5E8 != -1)
    swift_once(&qword_1013DD5E8, sub_10098AB04);
  swift_bridgeObjectRetain(qword_101480098);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

+ (id)nameForWeight:(double)a3
{
  NSString v3;

  sub_10098BB80(a3);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v3;
}

+ (double)weightForName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  double v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = sub_10098BC24(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC8Freeform20CRLWPSystemFontNames)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLWPSystemFontNames();
  return -[CRLWPSystemFontNames init](&v3, "init");
}

@end
