@implementation PNTCCCollectionFetcherWrapper

+ (id)fetchCuratedAssetsForTCCWithLimit:(int64_t)a3 seed:(id)a4 library:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = -[TCCCollectionFetcher init:]([TCCCollectionFetcher alloc], "init:", v7);

  objc_msgSend(v9, "fetchAssetsForTCCWithLimit:seed:", a3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
