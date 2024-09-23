@implementation PXStoryClipOptionsDescription

void __PXStoryClipOptionsDescription_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = v5;
  if ((a2 & ~*(_QWORD *)(a1 + 48)) == 0)
  {
    v7 = v5;
    if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 1)
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("|"));
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v7);
    v6 = v7;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

@end
