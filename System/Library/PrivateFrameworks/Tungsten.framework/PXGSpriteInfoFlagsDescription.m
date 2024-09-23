@implementation PXGSpriteInfoFlagsDescription

void __PXGSpriteInfoFlagsDescription_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  if ((a2 & ~*(unsigned __int8 *)(a1 + 40)) == 0)
  {
    v8 = v5;
    v6 = objc_msgSend(*(id *)(a1 + 32), "length");
    v7 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v7, "appendFormat:", CFSTR("|%@"), v8);
    else
      objc_msgSend(v7, "setString:", v8);
    v5 = v8;
  }

}

@end
