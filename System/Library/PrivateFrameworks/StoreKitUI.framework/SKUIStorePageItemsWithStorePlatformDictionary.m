@implementation SKUIStorePageItemsWithStorePlatformDictionary

void __SKUIStorePageItemsWithStorePlatformDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1BCCE6C7C]();
  v7 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithLookupDictionary:", v5);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v7, "itemIdentifier"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v8);

  }
  objc_autoreleasePoolPop(v6);

}

@end
