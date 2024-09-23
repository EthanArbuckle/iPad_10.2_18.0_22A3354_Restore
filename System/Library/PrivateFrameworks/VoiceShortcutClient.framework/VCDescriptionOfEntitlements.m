@implementation VCDescriptionOfEntitlements

void __VCDescriptionOfEntitlements_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  v7 = objc_msgSend(v6, "integerValue") & v5;
  v8 = objc_msgSend(v6, "integerValue");

  if (v7 == v8)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

}

@end
