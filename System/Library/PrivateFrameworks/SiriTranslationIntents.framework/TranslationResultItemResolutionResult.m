@implementation TranslationResultItemResolutionResult

+ (id)successWithResolvedTranslationResultItem:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static TranslationResultItemResolutionResult.success(with:)();

  return v5;
}

+ (id)disambiguationWithTranslationResultItemsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for TranslationResultItem();
  v3 = sub_228A3BBA4();
  swift_getObjCClassMetadata();
  static TranslationResultItemResolutionResult.disambiguation(with:)(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithTranslationResultItemToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static TranslationResultItemResolutionResult.confirmationRequired(with:)();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  static TranslationResultItemResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_228A3A6E8();
  sub_228A3BBA4();
  static TranslationResultItemResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  static TranslationResultItemResolutionResult.confirmationRequired(with:)();
}

- (TranslationResultItemResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  TranslationResultItemResolutionResult *result;

  v5 = sub_228A3BAA8();
  TranslationResultItemResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
