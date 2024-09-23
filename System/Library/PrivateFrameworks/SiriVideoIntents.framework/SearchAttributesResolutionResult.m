@implementation SearchAttributesResolutionResult

+ (id)successWithResolvedSearchAttributes:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static SearchAttributesResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithSearchAttributessToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for SearchAttributes();
  v3 = sub_21E9D86B0();
  swift_getObjCClassMetadata();
  static SearchAttributesResolutionResult.disambiguation(with:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithSearchAttributesToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static SearchAttributesResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  static SearchAttributesResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_21E9D1FF0();
  sub_21E9D86B0();
  static SearchAttributesResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  static SearchAttributesResolutionResult.confirmationRequired(with:)();
}

- (SearchAttributesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  SearchAttributesResolutionResult *result;

  v5 = sub_21E9D84AC();
  SearchAttributesResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
