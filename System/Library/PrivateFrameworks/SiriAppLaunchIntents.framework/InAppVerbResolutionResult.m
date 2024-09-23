@implementation InAppVerbResolutionResult

+ (id)successWithResolvedInAppVerb:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static InAppVerbResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithInAppVerbToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static InAppVerbResolutionResult.confirmationRequired(with:)(a3);
}

- (InAppVerbResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_2291C4664();
  return (InAppVerbResolutionResult *)InAppVerbResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
