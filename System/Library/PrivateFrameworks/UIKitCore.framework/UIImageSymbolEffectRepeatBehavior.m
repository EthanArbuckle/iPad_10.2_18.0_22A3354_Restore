@implementation UIImageSymbolEffectRepeatBehavior

void __59___UIImageSymbolEffectRepeatBehavior_defaultRepeatBehavior__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_repeatBehaviorWithRepeats:", 0.0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_1_18;
  _MergedGlobals_1_18 = v1;

}

void __62___UIImageSymbolEffectRepeatBehavior_indefiniteRepeatBehavior__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_repeatBehaviorWithRepeats:", INFINITY);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECD79EC8;
  qword_1ECD79EC8 = v1;

}

@end
