@implementation SSXPCCreateNSArrayFromCFTypeArray

uint64_t __SSXPCCreateNSArrayFromCFTypeArray_block_invoke(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  CFArrayRef v4;
  CFArrayRef v5;

  v4 = SSXPCCreateCFObjectFromXPCObject(a3);
  if (v4)
  {
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    CFRelease(v5);
  }
  return 1;
}

@end
