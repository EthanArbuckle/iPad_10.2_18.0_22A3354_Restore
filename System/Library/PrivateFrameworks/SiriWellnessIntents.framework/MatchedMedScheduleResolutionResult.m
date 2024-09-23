@implementation MatchedMedScheduleResolutionResult

+ (id)successWithResolvedMatchedMedSchedule:(id)a3
{
  id v3;
  id v6;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  v6 = static MatchedMedScheduleResolutionResult.success(with:)((uint64_t)a3);

  return v6;
}

+ (id)disambiguationWithMatchedMedSchedulesToDisambiguate:(id)a3
{
  id v3;
  uint64_t v5;
  id v7;

  swift_getObjCClassMetadata();
  v3 = a3;
  type metadata accessor for MatchedMedSchedule();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  v7 = static MatchedMedScheduleResolutionResult.disambiguation(with:)(v5);
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)confirmationRequiredWithMatchedMedScheduleToConfirm:(id)a3
{
  id v3;
  id v6;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  v6 = static MatchedMedScheduleResolutionResult.confirmationRequired(with:)(a3);

  return v6;
}

+ (id)successWithResolvedObject:(id)a3
{
  id v3;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  static MatchedMedScheduleResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id v3;

  swift_getObjCClassMetadata();
  v3 = a3;
  type metadata accessor for INObject();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  static MatchedMedScheduleResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id v3;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  static MatchedMedScheduleResolutionResult.confirmationRequired(with:)();
}

- (MatchedMedScheduleResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  MatchedMedScheduleResolutionResult *v10;

  v4 = a3;
  v5 = a4;
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (MatchedMedScheduleResolutionResult *)MatchedMedScheduleResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end
