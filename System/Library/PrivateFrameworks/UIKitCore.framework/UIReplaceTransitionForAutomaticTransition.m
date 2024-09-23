@implementation UIReplaceTransitionForAutomaticTransition

void ___UIReplaceTransitionForAutomaticTransition_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CE86F8], "transition");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1294;
  _MergedGlobals_1294 = v0;

}

@end
