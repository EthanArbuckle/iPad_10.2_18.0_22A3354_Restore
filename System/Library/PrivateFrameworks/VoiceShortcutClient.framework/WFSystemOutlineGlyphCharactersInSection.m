@implementation WFSystemOutlineGlyphCharactersInSection

void __WFSystemOutlineGlyphCharactersInSection_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = a3;
  v10 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, v8);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
}

void __WFSystemOutlineGlyphCharactersInSection_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v10 = a2;
  objc_msgSend(v7, "setObject:forKey:", v8, a3);
  v9 = *(void **)(a1 + 40);
  LODWORD(a2) = objc_msgSend(v8, "intValue");

  objc_msgSend(v9, "replaceObjectAtIndex:withObject:", (int)a2, v10);
}

@end
