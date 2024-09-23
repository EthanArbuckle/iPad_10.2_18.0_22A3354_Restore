@implementation GeoFenceTriggerResolutionResult

+ (id)successWithResolvedGeoFenceTrigger:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static GeoFenceTriggerResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithGeoFenceTriggerToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static GeoFenceTriggerResolutionResult.confirmationRequired(with:)(a3);
}

- (GeoFenceTriggerResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_1CCCF2A54();
  return (GeoFenceTriggerResolutionResult *)GeoFenceTriggerResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
