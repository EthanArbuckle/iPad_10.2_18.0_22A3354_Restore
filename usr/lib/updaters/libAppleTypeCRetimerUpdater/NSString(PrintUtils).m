@implementation NSString(PrintUtils)

+ (id)stringWithDescString:()PrintUtils
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = v4;
    v6 = objc_retainAutorelease(v3);
    if (*(_BYTE *)(objc_msgSend(v6, "UTF8String") + v5 - 1) == 10)
      objc_msgSend(v6, "deleteCharactersInRange:");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
