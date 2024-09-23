@implementation UtsSearchParamResolutionResult

+ (id)successWithResolvedUtsSearchParam:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static UtsSearchParamResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithUtsSearchParamsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for UtsSearchParam();
  v3 = sub_21E9D86B0();
  swift_getObjCClassMetadata();
  static UtsSearchParamResolutionResult.disambiguation(with:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithUtsSearchParamToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static UtsSearchParamResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  static UtsSearchParamResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_21E9D1FF0();
  sub_21E9D86B0();
  static UtsSearchParamResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  static UtsSearchParamResolutionResult.confirmationRequired(with:)();
}

- (UtsSearchParamResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  UtsSearchParamResolutionResult *result;

  v5 = sub_21E9D84AC();
  UtsSearchParamResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
