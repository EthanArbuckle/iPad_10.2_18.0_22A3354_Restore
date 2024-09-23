@implementation GeoFenceActionResolutionResult

+ (id)successWithResolvedGeoFenceAction:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static GeoFenceActionResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithGeoFenceActionToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static GeoFenceActionResolutionResult.confirmationRequired(with:)(a3);
}

- (GeoFenceActionResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_1CCCF2A54();
  return (GeoFenceActionResolutionResult *)GeoFenceActionResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
