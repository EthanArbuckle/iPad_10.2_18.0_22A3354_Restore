@implementation UIDICArchiveEnumerateFilePaths

void ___UIDICArchiveEnumerateFilePaths_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "fileType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0CB2B28];

  if (v3 == v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "pathInArchive");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

@end
