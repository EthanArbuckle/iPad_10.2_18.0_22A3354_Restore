@implementation UIPathLazyImageAsset

uint64_t __47___UIPathLazyImageAsset__containsImagesInPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasPrefix:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end
