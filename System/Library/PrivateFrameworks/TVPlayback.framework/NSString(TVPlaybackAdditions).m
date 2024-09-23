@implementation NSString(TVPlaybackAdditions)

- (id)tvp_languageCodeWithoutRegion
{
  id v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("_"));
  v3 = objc_msgSend(v1, "rangeOfString:", CFSTR("-"));
  if (v2 >= v3)
    v4 = v3;
  else
    v4 = v2;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = v2;
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = v3;
  else
    v5 = v4;
  v6 = v1;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v1, "substringToIndex:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)tvp_dataFromHexString
{
  const char *v1;
  size_t v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  _BYTE *v10;
  char __str[2];
  char v13;

  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 1);
  v2 = strlen(v1);
  v3 = 0;
  if (v2)
  {
    v4 = v2;
    if ((v2 & 1) == 0)
    {
      v5 = v2 >> 1;
      v6 = malloc_type_malloc(v2 >> 1, 0x5CC072C9uLL);
      v7 = v6;
      if (v4 >= 2)
      {
        if (v5 <= 1)
          v8 = 1;
        else
          v8 = v4 >> 1;
        v9 = v1 + 1;
        v10 = v6;
        do
        {
          *(_WORD *)__str = *(_WORD *)(v9 - 1);
          v13 = 0;
          *v10++ = strtol(__str, 0, 16);
          v9 += 2;
          --v8;
        }
        while (v8);
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      free(v7);
    }
  }
  return v3;
}

+ (uint64_t)tvp_lowercaseHexStringWithBytes:()TVPlaybackAdditions length:
{
  return objc_msgSend(a1, "tvp_hexStringWithBytes:length:lowercase:", a3, a4, 1);
}

+ (uint64_t)tvp_uppercaseHexStringWithBytes:()TVPlaybackAdditions length:
{
  return objc_msgSend(a1, "tvp_hexStringWithBytes:length:lowercase:", a3, a4, 0);
}

+ (id)tvp_hexStringWithBytes:()TVPlaybackAdditions length:lowercase:
{
  uint64_t v6;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  _BYTE *v12;
  char v13;
  void *v14;

  v6 = a4;
  v8 = 2 * a4;
  v9 = (char *)malloc_type_malloc((2 * a4) | 1, 0xA8F881CCuLL);
  v10 = v9;
  v11 = "0123456789ABCDEF0123456789abcdef";
  if (a5)
    v11 = "0123456789abcdef";
  if (v6)
  {
    v12 = v9 + 1;
    do
    {
      *(v12 - 1) = v11[(unint64_t)*a3 >> 4];
      v13 = *a3++;
      *v12 = v11[v13 & 0xF];
      v12 += 2;
      --v6;
    }
    while (v6);
  }
  v9[v8] = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  free(v10);
  return v14;
}

@end
