@implementation SBRecentAppLayoutsPersistenceURL

void __SBRecentAppLayoutsPersistenceURL_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  SBHomeDirectory();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("RecentAppLayouts"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathExtension:", CFSTR("pb.lzfse"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)SBRecentAppLayoutsPersistenceURL___persistenceURL;
  SBRecentAppLayoutsPersistenceURL___persistenceURL = v3;

}

@end
