@implementation ModifyOperationResolutionResult

+ (id)successWithResolvedModifyOperation:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ContactAttributeTypeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithModifyOperationToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ContactAttributeTypeResolutionResult.confirmationRequired(with:)(a3);
}

- (ModifyOperationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (ModifyOperationResolutionResult *)ModifyOperationResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
