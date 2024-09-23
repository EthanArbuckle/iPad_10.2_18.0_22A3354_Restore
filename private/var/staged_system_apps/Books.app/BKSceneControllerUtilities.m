@implementation BKSceneControllerUtilities

+ (NSString)primaryKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)accountInfoKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)endOfBookKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)bookKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)sceneTypeKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)assetIDKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (id)sceneTypekeyForSceneController:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  swift_unknownObjectRetain(a3);
  sub_1005D0FF0(a3);
  v5 = v4;
  swift_unknownObjectRelease(a3);
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

+ (unint64_t)sceneTypeFrom:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = sub_1005D10C8(v3, v4);
  swift_bridgeObjectRelease(v5);
  return v6;
}

- (BKSceneControllerUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneControllerUtilities();
  return -[BKSceneControllerUtilities init](&v3, "init");
}

@end
