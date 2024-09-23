@implementation PXStoryProducerRequestOptionsDescription

void __PXStoryProducerRequestOptionsDescription_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if ((a2 & ~*(_QWORD *)(a1 + 48)) == 0)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = v5;
    if (*(_BYTE *)(v7 + 24))
      *(_BYTE *)(v7 + 24) = 0;
    else
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v8);
    v6 = v8;
  }

}

@end
