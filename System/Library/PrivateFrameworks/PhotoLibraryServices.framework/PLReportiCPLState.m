@implementation PLReportiCPLState

uint64_t __PLReportiCPLState_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

void __PLReportiCPLState_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setObject:forKey:", a2, CFSTR("rebuildDate"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "stringValue");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("rebuildReason"));
}

@end
