@implementation PFBitmaskDescription

void __PFBitmaskDescription_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  if ((v5 & ~*(_QWORD *)(a1 + 56)) == 0)
  {
    v6 = v5;
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v6;
  }
}

@end
