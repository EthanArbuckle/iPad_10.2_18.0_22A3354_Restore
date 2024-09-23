@implementation MatchedMedNameResolutionResult

+ (id)successWithResolvedMatchedMedName:(id)a3
{
  id v3;
  id v6;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  v6 = static MatchedMedNameResolutionResult.success(with:)((uint64_t)a3);

  return v6;
}

+ (id)disambiguationWithMatchedMedNamesToDisambiguate:(id)a3
{
  id v3;
  uint64_t v5;
  id v7;

  swift_getObjCClassMetadata();
  v3 = a3;
  type metadata accessor for MatchedMedName();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  v7 = static MatchedMedNameResolutionResult.disambiguation(with:)(v5);
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)confirmationRequiredWithMatchedMedNameToConfirm:(id)a3
{
  id v3;
  id v6;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  v6 = static MatchedMedNameResolutionResult.confirmationRequired(with:)(a3);

  return v6;
}

+ (id)successWithResolvedObject:(id)a3
{
  id v3;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  static MatchedMedNameResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id v3;

  swift_getObjCClassMetadata();
  v3 = a3;
  type metadata accessor for INObject();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  static MatchedMedNameResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id v3;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  static MatchedMedNameResolutionResult.confirmationRequired(with:)();
}

- (MatchedMedNameResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  MatchedMedNameResolutionResult *v10;

  v4 = a3;
  v5 = a4;
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (MatchedMedNameResolutionResult *)MatchedMedNameResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end
