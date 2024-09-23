@implementation PXArrayDisplayAssetFetchResult

BOOL __62___PXArrayDisplayAssetFetchResult_countOfAssetsWithMediaType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaType") == *(_QWORD *)(a1 + 32);
}

@end
