@implementation NSString(Hash)

- (id)sha256hex
{
  const char *v1;
  CC_LONG v2;
  void *v3;
  uint64_t i;
  unsigned __int8 md[32];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v2 = strlen(v1);
  CC_SHA256(v1, v2, md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 64);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[i]);
  return v3;
}

- (id)preinstalledAudioHashForLanguage:()Hash name:
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "stringByAppendingFormat:", CFSTR(" %@ %@"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sha256hex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
