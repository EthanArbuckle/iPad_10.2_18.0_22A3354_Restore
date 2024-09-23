@implementation NSBundle

void __47__NSBundle_SAMLAdditions__saml_frameworkBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.VideoSubscriberAccount.SAMLFramework"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)saml_frameworkBundle_bundle;
  saml_frameworkBundle_bundle = v0;

}

@end
