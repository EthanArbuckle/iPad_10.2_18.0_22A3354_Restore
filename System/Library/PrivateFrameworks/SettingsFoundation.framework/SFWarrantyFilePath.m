@implementation SFWarrantyFilePath

void __SFWarrantyFilePath_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "uppercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _SFWarrantyFilePathForBundleWithName(CFSTR("iPhone"), v1, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)SFWarrantyFilePath___path;
  SFWarrantyFilePath___path = v4;

}

@end
