@implementation FedStatsUtil

+ (int)bitStringToInt:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  void *v9;
  int v10;
  int v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = v4 - 1;
    do
    {
      objc_msgSend(v3, "substringWithRange:", v6, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("1"));

      v11 = 1 << v8;
      if (!v10)
        v11 = 0;
      v7 += v11;
      ++v6;
      --v8;
    }
    while (v5 != v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)intToBitString:(int)a3 length:(int)a4
{
  void *v6;
  int v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 >= 1)
  {
    v7 = 0;
    do
    {
      if (((a3 >> v7) & 1) != 0)
        v8 = CFSTR("1");
      else
        v8 = CFSTR("0");
      objc_msgSend(v6, "insertString:atIndex:", v8, 0);
      ++v7;
    }
    while (a4 != v7);
  }
  return v6;
}

+ (id)sha1:(id)a3
{
  const char *v4;
  CC_LONG v5;
  void *v6;
  uint64_t i;
  void *v8;
  unsigned __int8 md[20];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v5 = strlen(v4);
  CC_SHA1(v4, v5, md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
  {
    objc_msgSend(a1, "intToBitString:length:", md[i], 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v8);

  }
  return v6;
}

@end
