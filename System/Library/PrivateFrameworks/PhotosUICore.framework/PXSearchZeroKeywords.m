@implementation PXSearchZeroKeywords

void __PXSearchZeroKeywords_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  PXNewSearchToken *v9;
  void *v10;

  v6 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 1uLL)
  {
    *a4 = 1;
  }
  else
  {
    v10 = v6;
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AF8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D72AF0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PXNewSearchToken initWithTitle:queryToken:type:priorityAssetUUID:]([PXNewSearchToken alloc], "initWithTitle:queryToken:type:priorityAssetUUID:", v7, v8, 1, 0);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

    }
    v6 = v10;
  }

}

@end
