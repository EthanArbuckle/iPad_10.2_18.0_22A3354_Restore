@implementation NowPlayingMediaTypeResolutionResult

+ (id)successWithResolvedNowPlayingMediaType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_2249E17CC(a3);
}

+ (id)confirmationRequiredWithNowPlayingMediaTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_2249E1804(a3);
}

- (NowPlayingMediaTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_2249ECD68();
  return (NowPlayingMediaTypeResolutionResult *)NowPlayingMediaTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
