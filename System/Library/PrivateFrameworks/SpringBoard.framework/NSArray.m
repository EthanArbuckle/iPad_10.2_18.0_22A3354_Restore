@implementation NSArray

uint64_t __75__NSArray_SBSAAdditions__sbsa_arrayByAddingOrReplacingObjectMatchingClass___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "isMemberOfClass:", objc_opt_class());

  return v3;
}

void __59__NSArray_SBSystemApertureAdditions__dictionaryDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = v9;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(v9, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, v8);

}

void __78__NSArray_SBHistorianDescription__sb_switcherModifierDebugTimelineDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "sb_switcherModifierDebugTimelineDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[%lu] %@"), a3, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

}

@end
