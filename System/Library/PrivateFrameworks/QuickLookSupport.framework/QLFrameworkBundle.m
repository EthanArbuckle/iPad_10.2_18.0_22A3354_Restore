@implementation QLFrameworkBundle

void __QLFrameworkBundle_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/"), 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Library/Frameworks/QuickLook.framework"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithURL:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)QLFrameworkBundle_QLBundle;
  QLFrameworkBundle_QLBundle = v2;

}

@end
