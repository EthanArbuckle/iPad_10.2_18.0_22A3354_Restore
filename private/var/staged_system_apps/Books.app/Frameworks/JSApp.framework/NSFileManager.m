@implementation NSFileManager

- (id)jsa_pathForCacheDirectoryWithDomain:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSFileManager *v7;
  Swift::String v8;
  void *object;
  NSString v10;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = NSFileManager.pathForCacheDirectory(with:)(v8).value._object;

  swift_bridgeObjectRelease(v6);
  if (object)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end
