@implementation NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation

uint64_t ____NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t result;
  uint64_t v8;

  v4 = *(void **)(a3 + 16);
  if (v4)
  {
    if ((objc_msgSend(*(id *)(a3 + 16), "containsLocation:", a2) & 1) == 0)
    {
      if (objc_msgSend(a2, "compare:", objc_msgSend(v4, "location")) == -1)
        return 0xFFFFFFFFLL;
      else
        return 1;
    }
    return 0;
  }
  v8 = *(_QWORD *)(a3 + 8);
  if (!v8)
    v8 = objc_msgSend(*(id *)(a1 + 32), "location");
  result = objc_msgSend(a2, "compare:", v8);
  if (result == 1)
    return (unint64_t)(a3 + 72) < *(_QWORD *)(a1 + 40)
        && objc_msgSend(a2, "compare:", *(_QWORD *)(a3 + 80)) != -1;
  return result;
}

@end
