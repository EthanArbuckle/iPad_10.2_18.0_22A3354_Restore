@implementation SBAddSuppressionMetricsIntoEventPayload

void __SBAddSuppressionMetricsIntoEventPayload_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "stringByAppendingString:", v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v9;
  }
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v7);

}

@end
