@implementation ResultEntityResolutionResult

+ (id)successWithResolvedResultEntity:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static ResultEntityResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithResultEntitysToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for ResultEntity();
  v3 = sub_21E9D86B0();
  swift_getObjCClassMetadata();
  static ResultEntityResolutionResult.disambiguation(with:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithResultEntityToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static ResultEntityResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  static ResultEntityResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_21E9D1FF0();
  sub_21E9D86B0();
  static ResultEntityResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  static ResultEntityResolutionResult.confirmationRequired(with:)();
}

- (ResultEntityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  ResultEntityResolutionResult *result;

  v5 = sub_21E9D84AC();
  ResultEntityResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
