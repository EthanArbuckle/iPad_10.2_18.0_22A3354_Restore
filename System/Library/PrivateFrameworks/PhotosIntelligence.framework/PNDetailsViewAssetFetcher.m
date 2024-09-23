@implementation PNDetailsViewAssetFetcher

+ (id)fetchPreviewAssetsForCollection:(id)a3 options:(id)a4
{
  return sub_243E2862C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(id, id))static PNDetailsViewAssetFetcher.fetchPreviewAssets(forCollection:options:));
}

+ (id)fetchEditorialAssetsForCollection:(id)a3 options:(id)a4
{
  return sub_243E2862C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(id, id))static PNDetailsViewAssetFetcher.fetchEditorialAssets(forCollection:options:));
}

+ (id)fetchAllAssetsForCollection:(id)a3 options:(id)a4
{
  return sub_243E2862C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(id, id))static PNDetailsViewAssetFetcher.fetchAllAssets(forCollection:options:));
}

+ (id)fetchMovieAssetsForCollection:(id)a3 options:(id)a4
{
  return sub_243E2862C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(id, id))static PNDetailsViewAssetFetcher.fetchMovieAssets(forCollection:options:));
}

- (PNDetailsViewAssetFetcher)init
{
  return (PNDetailsViewAssetFetcher *)PNDetailsViewAssetFetcher.init()();
}

@end
