@implementation NSFileManager

uint64_t __47__NSFileManager_RTExtensions__sortFilesByName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:options:", v8, 64);
  if (!v9)
    v9 = objc_msgSend(v5, "compare:options:", v6, 64);

  return v9;
}

@end
