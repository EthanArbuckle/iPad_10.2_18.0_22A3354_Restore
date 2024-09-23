@implementation UIEventSessionDynamicAccumulator

void __64___UIEventSessionDynamicAccumulator_performIncreaseWithActions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "typeEncoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v7);

  v8 = *(void **)(a1 + 40);
  objc_msgSend(v6, "metadata");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ActionData%lu"), objc_msgSend(*(id *)(a1 + 48), "count") + ~a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, v9);

}

@end
