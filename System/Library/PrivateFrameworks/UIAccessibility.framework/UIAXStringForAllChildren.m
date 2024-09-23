@implementation UIAXStringForAllChildren

uint64_t ___UIAXStringForAllChildren_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) != v3 && ((objc_msgSend(v3, "isAccessibilityElement") & 1) != 0 || *(_BYTE *)(a1 + 48)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  return 0;
}

@end
