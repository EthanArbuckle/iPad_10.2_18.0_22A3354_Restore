@implementation PRBundle

void __PRBundle_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleForClass:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)PRBundle___posterKitBundle;
  PRBundle___posterKitBundle = v1;

}

@end
