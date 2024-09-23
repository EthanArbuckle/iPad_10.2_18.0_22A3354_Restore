@implementation PKPassKitBundle

void __PKPassKitBundle_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.Foundation"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Frameworks/PassKit.framework"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", v3);
  v5 = (void *)_MergedGlobals_243;
  _MergedGlobals_243 = v4;

}

@end
