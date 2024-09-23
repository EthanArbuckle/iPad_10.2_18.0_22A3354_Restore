@implementation PKSharedCacheGetCustomOptions

id __PKSharedCacheGetCustomOptions_block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3598];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithString:", v3);

  return v4;
}

@end
