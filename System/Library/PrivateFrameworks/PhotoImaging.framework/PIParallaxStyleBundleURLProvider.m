@implementation PIParallaxStyleBundleURLProvider

- (PIParallaxStyleBundleURLProvider)init
{
  PIParallaxStyleBundleURLProvider *v2;
  uint64_t v3;
  NSBundle *bundle;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PIParallaxStyleBundleURLProvider;
  v2 = -[PIParallaxStyleBundleURLProvider init](&v6, sel_init);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = objc_claimAutoreleasedReturnValue();
  bundle = v2->_bundle;
  v2->_bundle = (NSBundle *)v3;

  return v2;
}

- (id)urlForIdentifier:(id)a3
{
  return -[NSBundle URLForResource:withExtension:](self->_bundle, "URLForResource:withExtension:", a3, CFSTR("plist"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
