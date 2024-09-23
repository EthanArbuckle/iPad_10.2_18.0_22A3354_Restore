@implementation PKDeepCopyDeduplicatedWithHashTable

void __PKDeepCopyDeduplicatedWithHashTable_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  PKDeepCopyDeduplicatedWithHashTable(a2, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  PKDeepCopyDeduplicatedWithHashTable(v6, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);
}

@end
