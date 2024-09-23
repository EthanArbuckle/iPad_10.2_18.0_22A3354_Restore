@implementation SYBundle

void ___SYBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!_SYBundle___bundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)_SYBundle___bundle;
    _SYBundle___bundle = v0;

  }
}

@end
