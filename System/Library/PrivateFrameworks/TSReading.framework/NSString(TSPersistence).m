@implementation NSString(TSPersistence)

+ (id)tsp_stringForDigest:()TSPersistence length:
{
  void *v6;
  unint64_t v7;
  unsigned int v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v7 = 0;
    v8 = 1;
    do
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(a3 + v7));
      v7 = v8++;
    }
    while (v7 < a4);
  }
  return v6;
}

+ (uint64_t)tsp_stringWithExtensionFieldComponent:()TSPersistence
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(">%d"), a3);
}

- (id)tsp_stringByAppendingExtensionFieldComponent:()TSPersistence
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "tsp_stringWithExtensionFieldComponent:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByAppendingPathComponent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
