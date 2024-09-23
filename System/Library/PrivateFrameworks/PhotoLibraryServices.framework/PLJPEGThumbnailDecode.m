@implementation PLJPEGThumbnailDecode

+ (id)_baseSessionOptions
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0D09558], 0);
}

+ (id)decodeSessionOptions
{
  pl_dispatch_once();
  return (id)decodeSessionOptions_decodeSessionOptions;
}

+ (id)decodeSessionOptionsForMaxPixelSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_baseSessionOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0D09568]);

  return v6;
}

void __45__PLJPEGThumbnailDecode_decodeSessionOptions__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_baseSessionOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (PLIsPTPD())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1111970369);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v1, *MEMORY[0x1E0D09570]);

  }
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)decodeSessionOptions_decodeSessionOptions;
  decodeSessionOptions_decodeSessionOptions = v2;

}

@end
