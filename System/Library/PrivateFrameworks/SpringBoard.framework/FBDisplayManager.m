@implementation FBDisplayManager

void __59__FBDisplayManager_SpringBoard__sb_secureMainConfiguration__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copyForSecureRendering");
  v1 = (void *)sb_secureMainConfiguration___configuration;
  sb_secureMainConfiguration___configuration = v0;

}

@end
