@implementation NSString(PosterFoundation)

- (id)pf_sha256Hash
{
  const char *v1;
  CC_LONG v2;
  void *v3;
  uint64_t i;
  void *v5;
  unsigned __int8 md[32];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v2 = strlen(v1);
  CC_SHA256(v1, v2, md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 64);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[i]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pf_bootInstanceIdentifier
{
  if (pf_bootInstanceIdentifier_onceToken != -1)
    dispatch_once(&pf_bootInstanceIdentifier_onceToken, &__block_literal_global_3);
  return (id)pf_bootInstanceIdentifier_uuid;
}

@end
