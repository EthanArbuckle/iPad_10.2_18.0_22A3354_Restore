@implementation LiveServiceResolutionResult

+ (id)successWithResolvedLiveService:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static LiveServiceResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithLiveServicesToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for LiveService();
  v3 = sub_21E9D86B0();
  swift_getObjCClassMetadata();
  static LiveServiceResolutionResult.disambiguation(with:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithLiveServiceToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static LiveServiceResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  static LiveServiceResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_21E9D1FF0();
  sub_21E9D86B0();
  static LiveServiceResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  static LiveServiceResolutionResult.confirmationRequired(with:)();
}

- (LiveServiceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  LiveServiceResolutionResult *result;

  v5 = sub_21E9D84AC();
  LiveServiceResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
