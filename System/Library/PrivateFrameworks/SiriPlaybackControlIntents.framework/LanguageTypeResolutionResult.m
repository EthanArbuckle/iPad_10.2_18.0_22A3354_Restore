@implementation LanguageTypeResolutionResult

+ (id)successWithResolvedLanguageType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_2249E17CC(a3);
}

+ (id)confirmationRequiredWithLanguageTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_2249E1804(a3);
}

- (LanguageTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_2249ECD68();
  return (LanguageTypeResolutionResult *)LanguageTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
