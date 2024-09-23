@implementation UIVisualEffectFilterEntry

uint64_t __36___UIVisualEffectFilterEntry_filter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setValue:forKey:", a3, a2);
}

void __41___UIVisualEffectFilterEntry_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("), ("));
  v6 = *(void **)(a1 + 32);
  _UIVisualEffectFilterEntryDescribeValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@=%@"), v8, v7);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void __41___UIVisualEffectFilterEntry_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("), ("));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  _UIVisualEffectFilterEntryDescribeValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVisualEffectFilterEntryDescribeValue(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@=[%@][%@]"), v10, v8, v9);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
}

@end
