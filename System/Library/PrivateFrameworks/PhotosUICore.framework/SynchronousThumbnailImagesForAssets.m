@implementation SynchronousThumbnailImagesForAssets

uint64_t ___SynchronousThumbnailImagesForAssets_block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), "addObject:", a2);
  return result;
}

@end
