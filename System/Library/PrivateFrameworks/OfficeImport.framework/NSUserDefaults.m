@implementation NSUserDefaults

void __67__NSUserDefaults_NSUserDefaults_TSUAdditions__tsu_registerDefaults__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  SFUBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("Defaults"), CFSTR("plist"));
  v5 = objc_claimAutoreleasedReturnValue();

  v1 = (void *)v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2 && objc_msgSend(v2, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "registerDefaults:", v3);

    }
    v1 = (void *)v5;
  }

}

@end
