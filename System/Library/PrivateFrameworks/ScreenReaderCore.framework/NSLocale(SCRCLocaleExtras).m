@implementation NSLocale(SCRCLocaleExtras)

+ (void)_nonRomanLanguages
{
  return &unk_24CB30550;
}

- (uint64_t)usesRomanTextProcessing
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "_nonRomanLanguages");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "containsObject:", v1) ^ 1;

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

@end
