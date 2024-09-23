@implementation PGBundle

void __PGBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_PGBundle bundle](_PGBundle, "bundle");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PGBundle_bundle;
  PGBundle_bundle = v0;

}

@end
