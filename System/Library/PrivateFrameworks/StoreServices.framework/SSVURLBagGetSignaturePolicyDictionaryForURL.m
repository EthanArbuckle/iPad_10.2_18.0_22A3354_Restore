@implementation SSVURLBagGetSignaturePolicyDictionaryForURL

void __SSVURLBagGetSignaturePolicyDictionaryForURL_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:", v9, 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
    *a4 = 1;

  }
}

@end
