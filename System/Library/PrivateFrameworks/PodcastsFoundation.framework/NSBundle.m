@implementation NSBundle

void __49__NSBundle_PFAdditions__podcastsFoundationBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)podcastsFoundationBundle_bundle;
  podcastsFoundationBundle_bundle = v0;

}

@end
