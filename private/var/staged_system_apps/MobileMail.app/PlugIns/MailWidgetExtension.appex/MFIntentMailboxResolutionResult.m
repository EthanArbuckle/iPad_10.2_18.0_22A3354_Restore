@implementation MFIntentMailboxResolutionResult

+ (id)successWithResolvedMFIntentMailbox:(id)a3
{
  id v3;
  id v7;

  swift_getObjCClassMetadata(a1);
  v3 = a3;
  swift_getObjCClassMetadata(a1);
  v7 = static MFIntentMailboxResolutionResult.success(with:)((uint64_t)a3);

  return v7;
}

+ (id)disambiguationWithMFIntentMailboxsToDisambiguate:(id)a3
{
  id v3;
  uint64_t v6;
  id v8;

  swift_getObjCClassMetadata(a1);
  v3 = a3;
  type metadata accessor for MFIntentMailbox();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_getObjCClassMetadata(a1);
  v8 = static MFIntentMailboxResolutionResult.disambiguation(with:)(v6);
  swift_bridgeObjectRelease(v6);

  return v8;
}

+ (id)confirmationRequiredWithMFIntentMailboxToConfirm:(id)a3
{
  id v3;
  id v7;

  swift_getObjCClassMetadata(a1);
  v3 = a3;
  swift_getObjCClassMetadata(a1);
  v7 = static MFIntentMailboxResolutionResult.confirmationRequired(with:)(a3);

  return v7;
}

+ (id)successWithResolvedObject:(id)a3
{
  id v3;

  swift_getObjCClassMetadata(a1);
  v3 = a3;
  swift_getObjCClassMetadata(a1);
  static MFIntentMailboxResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id v3;

  swift_getObjCClassMetadata(a1);
  v3 = a3;
  sub_100070C84();
  static Array._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_getObjCClassMetadata(a1);
  static MFIntentMailboxResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id v3;

  swift_getObjCClassMetadata(a1);
  v3 = a3;
  swift_getObjCClassMetadata(a1);
  static MFIntentMailboxResolutionResult.confirmationRequired(with:)();
}

- (MFIntentMailboxResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  MFIntentMailboxResolutionResult *v10;

  v4 = a3;
  v5 = a4;
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v10 = (MFIntentMailboxResolutionResult *)MFIntentMailboxResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end
