@implementation NSMapTable

void __68__NSMapTable_HVHeadersMapTable__hv_addEntriesFromHeadersDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "addObject:", v5);
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v8 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
      v9 = objc_msgSend(v5, "mutableCopy");
    else
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v5, 0);
    v10 = (void *)v9;
    objc_msgSend(v8, "setObject:forKey:", v9, v11);

  }
}

@end
