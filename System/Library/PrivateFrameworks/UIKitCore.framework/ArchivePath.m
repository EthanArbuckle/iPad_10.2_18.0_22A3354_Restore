@implementation ArchivePath

void ___ArchivePath_block_invoke()
{
  void *v0;
  void *v1;
  __CFString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectAtIndex:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIMainBundleIdentifier();
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v2, "length"))
  {

    v2 = CFSTR("com.apple");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v2, CFSTR("settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_1290;
  _MergedGlobals_1290 = v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", _MergedGlobals_1290, 1, 0, &v14);
  v8 = v14;

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", _MergedGlobals_1290);

    if ((v10 & 1) == 0)
    {
      v11 = _MergedGlobals_1290;
      objc_msgSend(v8, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("*** error creating settings archive directory: %@. %@"), v11, v12);

      v13 = (void *)_MergedGlobals_1290;
      _MergedGlobals_1290 = 0;

    }
  }

}

@end
