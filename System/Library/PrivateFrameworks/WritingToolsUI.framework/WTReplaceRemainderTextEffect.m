@implementation WTReplaceRemainderTextEffect

void __50___WTReplaceRemainderTextEffect_updateEffectWith___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "removeEffect:animated:", v2, 0);

}

@end
