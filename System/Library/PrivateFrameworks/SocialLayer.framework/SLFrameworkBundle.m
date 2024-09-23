@implementation SLFrameworkBundle

void __SLFrameworkBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.SocialLayer"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SLFrameworkBundle_sBundle;
  SLFrameworkBundle_sBundle = v0;

}

@end
