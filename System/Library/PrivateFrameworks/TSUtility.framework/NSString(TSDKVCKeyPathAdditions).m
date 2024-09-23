@implementation NSString(TSDKVCKeyPathAdditions)

- (const)tsu_keyPathByRemovingLastKey
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("."), 6);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return &stru_24D61C228;
  else
    return (const __CFString *)objc_msgSend(a1, "substringToIndex:", v2);
}

- (const)tsu_keyPathByRemovingFirstKey
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("."), 2);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return &stru_24D61C228;
  else
    return (const __CFString *)objc_msgSend(a1, "substringFromIndex:", v2 + 1);
}

- (uint64_t)tsu_keyPathByPrependingKey:()TSDKVCKeyPathAdditions
{
  uint64_t v5;
  void *v6;
  void *v8;

  if (objc_msgSend(a1, "length"))
  {
    v5 = objc_msgSend(a3, "length");
    v6 = (void *)MEMORY[0x24BDD17C8];
    if (v5)
      return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), a3, a1);
    v8 = a1;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v8 = a3;
  }
  return objc_msgSend(v6, "stringWithString:", v8);
}

- (uint64_t)tsu_keyPathByAppendingKey:()TSDKVCKeyPathAdditions
{
  uint64_t v5;
  void *v6;
  void *v8;

  if (objc_msgSend(a1, "length"))
  {
    v5 = objc_msgSend(a3, "length");
    v6 = (void *)MEMORY[0x24BDD17C8];
    if (v5)
      return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), a1, a3);
    v8 = a1;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v8 = a3;
  }
  return objc_msgSend(v6, "stringWithString:", v8);
}

- (uint64_t)tsu_firstKey
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("."), 2);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return (uint64_t)a1;
  else
    return objc_msgSend(a1, "substringToIndex:", v2);
}

- (uint64_t)tsu_lastKey
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("."), 6);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return (uint64_t)a1;
  else
    return objc_msgSend(a1, "substringFromIndex:", v2 + 1);
}

- (uint64_t)tsu_numberOfKeysInKeyPath
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_msgSend(a1, "length");
  v3 = 0;
  v4 = 0;
  v5 = v2;
  do
  {
    v6 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("."), 2, v3, v5);
    ++v4;
    v3 = v6 + v7;
    v5 = v2 - (v6 + v7);
  }
  while (v6 + v7 != 0x7FFFFFFFFFFFFFFFLL);
  return v4;
}

@end
