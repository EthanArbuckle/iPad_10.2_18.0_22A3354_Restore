@implementation NSBundle

void __60__NSBundle_SafariCoreExtras__safari_safariInjectedBundleURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariCoreBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByDeletingLastPathComponent");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("MobileSafari.framework"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    __60__NSBundle_SafariCoreExtras__safari_safariInjectedBundleURL__block_invoke_cold_1();
  objc_msgSend(v4, "builtInPlugInsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Safari.wkbundle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteURL");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)safari_safariInjectedBundleURL_bundleURL;
  safari_safariInjectedBundleURL_bundleURL = v7;

}

void __53__NSBundle_SafariCoreExtras__safari_safariCoreBundle__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "bundleForClass:", objc_opt_class());
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)safari_safariCoreBundle_bundle;
  safari_safariCoreBundle_bundle = v1;

}

void __60__NSBundle_SafariCoreExtras__safari_safariInjectedBundleURL__block_invoke_cold_1()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E64A2498);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/SafariShared/SafariShared/SafariCore/FoundationExtras/WBSCoreNSBundleExtras.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "containingBundle", "+[NSBundle(SafariCoreExtras) safari_safariInjectedBundleURL]_block_invoke", v3, 364, v5);
    v4 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v1, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "containingBundle", "+[NSBundle(SafariCoreExtras) safari_safariInjectedBundleURL]_block_invoke", v3, 364, &stru_1E64A2498);
    v4 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@\n%@"), v4, v6);

  abort();
}

@end
