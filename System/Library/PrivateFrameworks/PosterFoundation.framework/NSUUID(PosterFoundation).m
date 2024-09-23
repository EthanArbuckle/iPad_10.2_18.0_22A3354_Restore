@implementation NSUUID(PosterFoundation)

+ (id)pf_invalidInstanceIdentifier
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
}

+ (id)pf_defaultInstanceIdentifier
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000001"));
}

+ (id)pf_UUIDFromArbitraryString:()PosterFoundation
{
  const char *v3;
  CC_LONG v4;
  void *v5;
  uint64_t i;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 md[32];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = strlen(v3);
  CC_SHA256(v3, v4, md);
  v5 = (void *)objc_opt_new();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v5, "appendFormat:", CFSTR("%02x"), md[i]);
  v7 = objc_alloc(MEMORY[0x24BDD1880]);
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "substringWithRange:", 0, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringWithRange:", 8, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringWithRange:", 12, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringWithRange:", 16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringWithRange:", 20, 12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@-%@-%@-%@"), v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v7, "initWithUUIDString:", v14);

  return v15;
}

+ (__CFString)pf_nonnullUUIDStringOrSentinel:()PosterFoundation
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a3, "UUIDString");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("(Null UUID)");
  v5 = v3;

  return v5;
}

@end
