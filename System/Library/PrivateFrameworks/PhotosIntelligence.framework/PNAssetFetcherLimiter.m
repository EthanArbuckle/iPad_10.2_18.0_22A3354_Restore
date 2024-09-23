@implementation PNAssetFetcherLimiter

- (PNAssetFetcherLimiter)initWithType:(int64_t)a3 limit:(int64_t)a4
{
  return (PNAssetFetcherLimiter *)AssetFetcherLimiter.init(type:limit:)(a3, a4);
}

- (int64_t)type
{
  return AssetFetcherLimiter.type.getter();
}

- (int64_t)limit
{
  return AssetFetcherLimiter.limit.getter();
}

- (PNAssetFetcherLimiter)init
{
  AssetFetcherLimiter.init()();
}

- (int64_t)limitType
{
  PNAssetFetcherLimiter *v2;
  unint64_t v3;

  v2 = self;
  v3 = AssetFetcherLimiter.limitType.getter();

  return v3;
}

@end
