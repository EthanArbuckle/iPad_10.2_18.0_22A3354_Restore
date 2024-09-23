@implementation UIVisualEffectSubviewApplyFilterValues

void ___UIVisualEffectSubviewApplyFilterValues_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v8)
    v7 = 0;
  else
    v7 = v8;
  objc_msgSend(*(id *)(a1 + 40), "setValue:forKeyPath:", v7, v5);

}

@end
