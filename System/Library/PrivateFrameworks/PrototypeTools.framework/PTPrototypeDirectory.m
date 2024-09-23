@implementation PTPrototypeDirectory

void __PTPrototypeDirectory_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  PTHomeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Library/Prototyping"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)PTPrototypeDirectory___path;
  PTPrototypeDirectory___path = v1;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PTPrototypeDirectory___path;
  v6 = *MEMORY[0x1E0CB2A98];
  v7[0] = CFSTR("mobile");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, v5, 0);

  PTDisableFileProtection((void *)PTPrototypeDirectory___path);
}

@end
