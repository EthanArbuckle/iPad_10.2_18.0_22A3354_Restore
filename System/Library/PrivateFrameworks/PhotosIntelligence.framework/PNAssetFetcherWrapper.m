@implementation PNAssetFetcherWrapper

+ (id)fetchAssetsWithOptions:(id)a3
{
  return +[PNAssetFetcher fetchAssetsWithOptions:](PNAssetFetcher, "fetchAssetsWithOptions:", a3);
}

+ (id)fetchOptionsWithPhotoLibrary:(id)a3 limit:(int64_t)a4 fetchBatchSize:(int64_t)a5
{
  id v7;
  PNAssetFetcherOptions *v8;

  v7 = a3;
  v8 = -[PNAssetFetcherOptions initWithPhotoLibrary:limit:sampleBatchSize:]([PNAssetFetcherOptions alloc], "initWithPhotoLibrary:limit:sampleBatchSize:", v7, a4, a5);

  return v8;
}

+ (id)fetchLimiterWithType:(int64_t)a3 limit:(int64_t)a4
{
  if ((unint64_t)a3 > 1)
    return 0;
  else
    return -[PNAssetFetcherLimiter initWithType:limit:]([PNAssetFetcherLimiter alloc], "initWithType:limit:", a3, a4);
}

@end
