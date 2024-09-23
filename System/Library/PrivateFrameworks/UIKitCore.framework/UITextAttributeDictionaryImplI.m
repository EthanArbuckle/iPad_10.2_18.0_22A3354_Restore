@implementation UITextAttributeDictionaryImplI

void __46___UITextAttributeDictionaryImplI_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id key;

  key = a2;
  v5 = a3;
  if (!CFDictionaryContainsKey(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 16), key))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("က00%@က00"), key);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  }
}

@end
