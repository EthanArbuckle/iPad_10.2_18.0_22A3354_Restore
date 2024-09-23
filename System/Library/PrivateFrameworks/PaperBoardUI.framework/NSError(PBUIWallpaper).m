@implementation NSError(PBUIWallpaper)

- (uint64_t)pbui_isFileNotFoundError
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "code");
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {
    v4 = v3 == 2;
  }
  else
  {
    v5 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]);
    if (v3 == 4)
      v4 = v5;
    else
      v4 = 0;
  }

  return v4;
}

@end
