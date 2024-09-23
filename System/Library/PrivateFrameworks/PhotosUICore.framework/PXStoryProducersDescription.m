@implementation PXStoryProducersDescription

void __PXStoryProducersDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  if ((a2 & ~*(_QWORD *)(a1 + 48)) == 0)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));
    v4 = *(void **)(a1 + 32);
    PXStoryProducerName(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v5);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

@end
