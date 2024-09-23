@implementation ApplicationResolutionResult

+ (id)successWithResolvedApplication:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static ApplicationResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithApplicationsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for Application();
  v3 = sub_2291C4778();
  swift_getObjCClassMetadata();
  static ApplicationResolutionResult.disambiguation(with:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithApplicationToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static ApplicationResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  static ApplicationResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_2291C1D14();
  sub_2291C4778();
  static ApplicationResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  static ApplicationResolutionResult.confirmationRequired(with:)();
}

- (ApplicationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  ApplicationResolutionResult *result;

  v5 = sub_2291C4664();
  ApplicationResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
