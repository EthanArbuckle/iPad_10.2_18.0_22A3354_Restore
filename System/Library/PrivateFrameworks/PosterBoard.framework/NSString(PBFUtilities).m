@implementation NSString(PBFUtilities)

+ (id)pbf_bootInstanceIdentifier
{
  if (pbf_bootInstanceIdentifier_onceToken != -1)
    dispatch_once(&pbf_bootInstanceIdentifier_onceToken, &__block_literal_global_54);
  return (id)pbf_bootInstanceIdentifier_uuid;
}

- (id)pbf_sha256Hash
{
  const char *v2;
  CC_LONG v3;
  void *v4;
  uint64_t i;
  void *v6;
  unsigned __int8 md[32];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "length"))
    return 0;
  v2 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v3 = strlen(v2);
  CC_SHA256(v2, v3, md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
