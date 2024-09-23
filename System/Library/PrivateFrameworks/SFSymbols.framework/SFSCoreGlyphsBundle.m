@implementation SFSCoreGlyphsBundle

void __30__SFSCoreGlyphsBundle_private__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SFSymbolsFramework"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("CoreGlyphsPrivate"), CFSTR("bundle"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = (uint64_t)v3;
  if (v3)
    v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", v3);
  v2 = (void *)private_privateBundle;
  private_privateBundle = v1;

}

void __29__SFSCoreGlyphsBundle_public__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SFSymbolsFramework"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("CoreGlyphs"), CFSTR("bundle"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = (uint64_t)v3;
  if (v3)
    v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", v3);
  v2 = (void *)public_publicBundle;
  public_publicBundle = v1;

}

+ (NSBundle)public
{
  if (public_once != -1)
    dispatch_once(&public_once, &__block_literal_global);
  return (NSBundle *)(id)public_publicBundle;
}

+ (NSBundle)private
{
  if (private_once != -1)
    dispatch_once(&private_once, &__block_literal_global_6);
  return (NSBundle *)(id)private_privateBundle;
}

@end
