@implementation UIHostedFocusSystemRegister

void ___UIHostedFocusSystemRegister_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 517, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1_9;
  _MergedGlobals_1_9 = v0;

}

@end
