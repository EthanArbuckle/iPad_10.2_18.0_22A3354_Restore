@implementation WFContactEntriesFromAttributedString

void __WFContactEntriesFromAttributedString_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(void **)(a1 + 32);
    v5 = objc_alloc(MEMORY[0x24BE19418]);
    if (v3)
    {
      objc_msgSend(v9, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "initWithContact:", v6);
    }
    else
    {
      objc_msgSend(v9, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "initWithHandleString:", v6);
    }
    v8 = (void *)v7;
    objc_msgSend(v4, "addObject:", v7);

  }
}

@end
