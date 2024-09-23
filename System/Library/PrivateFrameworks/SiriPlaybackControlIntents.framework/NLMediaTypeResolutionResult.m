@implementation NLMediaTypeResolutionResult

+ (id)successWithResolvedNLMediaType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_2249E17CC(a3);
}

+ (id)confirmationRequiredWithNLMediaTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_2249E1804(a3);
}

- (NLMediaTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_2249ECD68();
  return (NLMediaTypeResolutionResult *)NLMediaTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
