@implementation NSBundle

void __48__NSBundle_PhotosUI__pu_PhotosUIFrameworkBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pu_PhotosUIFrameworkBundle_frameworkBundle;
  pu_PhotosUIFrameworkBundle_frameworkBundle = v0;

}

@end
