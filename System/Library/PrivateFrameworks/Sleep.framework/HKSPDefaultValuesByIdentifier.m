@implementation HKSPDefaultValuesByIdentifier

void __HKSPDefaultValuesByIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

}

@end
