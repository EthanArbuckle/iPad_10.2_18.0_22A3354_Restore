@implementation NSString(TVMLKitAdditions)

- (id)tv_filenameSafeString
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("_"), 0, 0, v3);
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(":"), CFSTR("_"), 0, 0, v3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tv_SHA256String
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(a1, "length");
  if (v2 < 1)
  {
    v5 = 0;
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), v2);
    objc_msgSend(v3, "tv_SHA256Digest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tv_lowercaseHexString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (uint64_t)tv_lowercaseHexStringWithBytes:()TVMLKitAdditions length:
{
  return objc_msgSend(a1, "tvs_hexStringWithBytes:length:lowercase:", a3, a4, 1);
}

- (id)tv_MD5String
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(a1, "length");
  if (v2 < 1)
  {
    v5 = 0;
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), v2);
    objc_msgSend(v3, "tv_MD5Digest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tv_lowercaseHexString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)tvs_hexStringWithBytes:()TVMLKitAdditions length:lowercase:
{
  uint64_t v6;
  uint64_t v8;
  char *v9;
  char *v10;
  _BYTE *v11;
  _BYTE *v12;
  char v13;
  void *v14;

  v6 = a4;
  v8 = 2 * a4;
  v9 = (char *)malloc_type_malloc((2 * a4) | 1, 0xBFFA7B9EuLL);
  v10 = v9;
  v11 = &unk_222E773D0;
  if (a5)
    v11 = &unk_222E773E0;
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
