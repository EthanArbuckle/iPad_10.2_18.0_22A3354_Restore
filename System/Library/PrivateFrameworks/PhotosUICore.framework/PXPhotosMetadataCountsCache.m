@implementation PXPhotosMetadataCountsCache

- (PXPhotosMetadataCountsCache)initWithAssetCounts:(id *)a3 guestAssetCounts:(id *)a4
{
  PXPhotosMetadataCountsCache *result;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPhotosMetadataCountsCache;
  result = -[PXPhotosMetadataCountsCache init](&v9, sel_init);
  if (result)
  {
    v7 = *(_OWORD *)&a3->var0;
    result->_assetCounts.othersCount = a3->var2;
    *(_OWORD *)&result->_assetCounts.photosCount = v7;
    v8 = *(_OWORD *)&a4->var0;
    result->_guestAssetCounts.othersCount = a4->var2;
    *(_OWORD *)&result->_guestAssetCounts.photosCount = v8;
  }
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)assetCounts
{
  *($C8986E5AD9146E03F7E851F39E835596 *)retstr = *($C8986E5AD9146E03F7E851F39E835596 *)&self->var1;
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)guestAssetCounts
{
  *($C8986E5AD9146E03F7E851F39E835596 *)retstr = *($C8986E5AD9146E03F7E851F39E835596 *)((char *)self + 32);
  return self;
}

@end
