@implementation TSWPRep

void __56__TSWPRep_SXAccessibility__accessibilityAttributedValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = a2;
  objc_opt_class();
  TSUDynamicCast();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "sxaxRepRelativeRangeFromStorageRelativeRange:", a3, a4);
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x24BDFEBA0], MEMORY[0x24BDBD1C8], v8, v9);
  }

}

void __56__TSWPRep_SXAccessibility__accessibilityAttributedValue__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = objc_msgSend(v15, "firstLabelType");
  v8 = v15;
  if (v7)
  {
    objc_msgSend(v15, "valueForProperty:", 183);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x24BDFEBB0], v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v11 = *MEMORY[0x24BDFEBA8];
      v12 = (void *)MEMORY[0x24BDD16E0];
      v13 = *(void **)(a1 + 32);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      objc_msgSend(v12, "numberWithUnsignedInteger:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAttribute:value:range:", v11, v14, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    }
    *a5 = 1;

    v8 = v15;
  }

}

@end
