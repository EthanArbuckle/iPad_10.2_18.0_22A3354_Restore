@implementation WFShareSheetState

+ (id)storageURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "wf_shortcutsDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ShareSheetState.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (NSDictionary)shareSheetShortcuts
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(a1, "storageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (void)setShareSheetShortcuts:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "storageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeToURL:error:", v4, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "storageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtURL:error:", v5, 0);

  }
}

@end
