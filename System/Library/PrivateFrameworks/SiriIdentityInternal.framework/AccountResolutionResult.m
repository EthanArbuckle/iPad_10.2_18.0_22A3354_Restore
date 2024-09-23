@implementation AccountResolutionResult

+ (id)successWithResolvedAccount:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static AccountResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithAccountsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for Account();
  v3 = sub_2463C0684();
  swift_getObjCClassMetadata();
  static AccountResolutionResult.disambiguation(with:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithAccountToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static AccountResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  static AccountResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_2463BDB0C();
  sub_2463C0684();
  static AccountResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  static AccountResolutionResult.confirmationRequired(with:)();
}

- (AccountResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  AccountResolutionResult *result;

  v5 = sub_2463C05D0();
  AccountResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
