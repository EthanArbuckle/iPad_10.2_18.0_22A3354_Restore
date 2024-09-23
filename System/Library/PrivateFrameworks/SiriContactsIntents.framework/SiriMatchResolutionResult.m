@implementation SiriMatchResolutionResult

+ (id)successWithResolvedSiriMatch:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static SiriMatchResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithSiriMatchsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for SiriMatch();
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  static SiriMatchResolutionResult.disambiguation(with:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithSiriMatchToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static SiriMatchResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id v3;

  v3 = a3;
  static SiriMatchResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  type metadata accessor for INObject();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static SiriMatchResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id v3;

  v3 = a3;
  static SiriMatchResolutionResult.confirmationRequired(with:)();
}

- (SiriMatchResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  SiriMatchResolutionResult *result;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  SiriMatchResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
