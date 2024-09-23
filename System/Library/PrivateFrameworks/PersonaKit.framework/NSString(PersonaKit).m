@implementation NSString(PersonaKit)

- (id)pr_SHADigest
{
  const char *v1;
  CC_LONG v2;
  void *v3;
  uint64_t i;
  unsigned __int8 md[16];
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  *(_OWORD *)md = 0u;
  v7 = 0u;
  v2 = strlen(v1);
  CC_SHA256(v1, v2, md);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 64);
  for (i = 0; i != 32; ++i)
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[i]);
  return v3;
}

- (id)pr_numericValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0123456789"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", &stru_24C1C1BA8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)pr_hexStringWithData:()PersonaKit
{
  id v3;
  uint64_t v4;
  id v5;
  unsigned __int8 *v6;
  void *v7;
  unsigned int v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 2 * v4);
  if (v4 >= 1)
  {
    do
    {
      v8 = *v6++;
      objc_msgSend(v7, "appendFormat:", CFSTR("%02X"), v8);
      --v4;
    }
    while (v4);
  }
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

@end
