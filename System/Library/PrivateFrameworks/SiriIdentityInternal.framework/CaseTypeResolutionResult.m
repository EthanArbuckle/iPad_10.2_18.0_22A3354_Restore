@implementation CaseTypeResolutionResult

+ (id)successWithResolvedCaseType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static CaseTypeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithCaseTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static CaseTypeResolutionResult.confirmationRequired(with:)(a3);
}

- (CaseTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_2463C05D0();
  return (CaseTypeResolutionResult *)CaseTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
