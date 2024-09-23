@implementation MFIntentMailboxKindResolutionResult

+ (id)successWithResolvedMFIntentMailboxKind:(int64_t)a3
{
  swift_getObjCClassMetadata(a1);
  swift_getObjCClassMetadata(a1);
  return static MFIntentMailboxKindResolutionResult.success(with:)();
}

+ (id)confirmationRequiredWithMFIntentMailboxKindToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata(a1);
  swift_getObjCClassMetadata(a1);
  return static MFIntentMailboxKindResolutionResult.confirmationRequired(with:)();
}

- (MFIntentMailboxKindResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  MFIntentMailboxKindResolutionResult *v10;

  v4 = a3;
  v5 = a4;
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v10 = (MFIntentMailboxKindResolutionResult *)MFIntentMailboxKindResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end
