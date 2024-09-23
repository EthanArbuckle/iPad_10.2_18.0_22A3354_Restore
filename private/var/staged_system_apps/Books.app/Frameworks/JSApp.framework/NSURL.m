@implementation NSURL

- (BOOL)jsa_isSafeExternalURL
{
  NSURL *v2;
  char v3;

  v2 = self;
  v3 = NSURL.isSafeExternalURL.getter();

  return v3 & 1;
}

- (id)jsa_parametrize:(id)a3
{
  Swift::OpaquePointer v4;
  NSURL *v5;
  NSURL *v6;
  void *v7;
  void *v8;

  v4._rawValue = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &type metadata for String, &protocol witness table for String);
  v5 = self;
  NSURL.parametrize(_:)(v6, v4);
  v8 = v7;

  swift_bridgeObjectRelease(v4._rawValue);
  return v8;
}

+ (id)jsa_queryStringForParameters:(id)a3 escapedValues:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = a4;
  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  _sSo5NSURLC5JSAppE11queryString3for13escapedValuesSSSDys11AnyHashableVypG_SbtFZ_0(v5, v4);
  v7 = v6;
  swift_bridgeObjectRelease(v5);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return v8;
}

@end
