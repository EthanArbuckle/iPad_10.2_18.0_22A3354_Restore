@implementation NSString(TSDKVCKeyPathAdditions)

- (__CFString)tsu_keyPathByRemovingLastKey
{
  uint64_t v2;
  __CFString *v3;

  v2 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("."), 6);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = &stru_24F3BFFF8;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (__CFString)tsu_keyPathByRemovingFirstKey
{
  uint64_t v2;
  __CFString *v3;

  v2 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("."), 2);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = &stru_24F3BFFF8;
  }
  else
  {
    objc_msgSend(a1, "substringFromIndex:", v2 + 1);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)tsu_keyPathByPrependingKey:()TSDKVCKeyPathAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  if (!objc_msgSend(a1, "length"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v8 = v4;
LABEL_6:
    objc_msgSend(v6, "stringWithString:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v5 = objc_msgSend(v4, "length");
  v6 = (void *)MEMORY[0x24BDD17C8];
  if (!v5)
  {
    v8 = a1;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v4, a1);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)v7;

  return v9;
}

- (id)tsu_keyPathByAppendingKey:()TSDKVCKeyPathAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  if (!objc_msgSend(a1, "length"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v8 = v4;
LABEL_6:
    objc_msgSend(v6, "stringWithString:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v5 = objc_msgSend(v4, "length");
  v6 = (void *)MEMORY[0x24BDD17C8];
  if (!v5)
  {
    v8 = a1;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), a1, v4);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)v7;

  return v9;
}

- (id)tsu_firstKey
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:options:", CFSTR("."), 2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v1, "substringToIndex:", v2);
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v3;
  }
  return v1;
}

- (id)tsu_lastKey
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:options:", CFSTR("."), 6);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v1, "substringFromIndex:", v2 + 1);
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v3;
  }
  return v1;
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
