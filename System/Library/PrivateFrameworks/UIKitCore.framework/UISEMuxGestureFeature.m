@implementation UISEMuxGestureFeature

void __41___UISEMuxGestureFeature_debugDictionary__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  objc_msgSend(a3, "debugDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, a2);

}

@end
