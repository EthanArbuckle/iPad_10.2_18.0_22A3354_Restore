@implementation NSBundle

void __35__NSBundle_PhotosUICore__px_bundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)px_bundle_frameworkBundle;
  px_bundle_frameworkBundle = v0;

}

@end
