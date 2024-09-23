@implementation IdentityResolutionResult

+ (id)successWithResolvedIdentity:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static IdentityResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithIdentitysToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for Identity();
  v3 = sub_2463C0684();
  swift_getObjCClassMetadata();
  static IdentityResolutionResult.disambiguation(with:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithIdentityToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static IdentityResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  static IdentityResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_2463BDB0C();
  sub_2463C0684();
  static IdentityResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  static IdentityResolutionResult.confirmationRequired(with:)();
}

- (IdentityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  IdentityResolutionResult *result;

  v5 = sub_2463C05D0();
  IdentityResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
