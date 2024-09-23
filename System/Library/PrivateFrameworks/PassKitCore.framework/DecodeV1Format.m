@implementation DecodeV1Format

void __DecodeV1Format_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  objc_msgSend(v8, "addObject:", v6);

  if (v7)
    objc_msgSend(v8, "addObject:", v7);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v8);

}

@end
