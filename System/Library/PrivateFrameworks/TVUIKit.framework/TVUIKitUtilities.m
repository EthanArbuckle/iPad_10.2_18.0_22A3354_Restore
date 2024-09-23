@implementation TVUIKitUtilities

+ (id)TVUIKitBundle
{
  if (TVUIKitBundle_onceToken != -1)
    dispatch_once(&TVUIKitBundle_onceToken, &__block_literal_global);
  return (id)TVUIKitBundle_bundle;
}

void __33__TVUIKitUtilities_TVUIKitBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.TVUIKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TVUIKitBundle_bundle;
  TVUIKitBundle_bundle = v0;

}

+ (id)preferredGraphicsRenderFormat
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDF6AA0];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formatForTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");

  return v5;
}

+ (BOOL)isJ42
{
  return 0;
}

@end
