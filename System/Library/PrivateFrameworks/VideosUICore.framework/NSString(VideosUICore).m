@implementation NSString(VideosUICore)

- (id)vui_SHA256String
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
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), v2);
    objc_msgSend(v3, "vui_SHA256Digest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vui_lowercaseHexString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)tvs_hexStringWithBytes:()VideosUICore length:lowercase:
{
  uint64_t v8;
  void *v9;
  void *v10;
  _BYTE *v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;

  v8 = 2 * a4;
  v9 = malloc_type_malloc((2 * a4) | 1, 0x19CC244BuLL);
  v10 = v9;
  v11 = &unk_1D954F920;
  if (a5)
    v11 = &unk_1D954F930;
  if (a4)
  {
    v12 = 0;
    v13 = 1;
    do
    {
      *((_BYTE *)v9 + v13 - 1) = v11[(unint64_t)*(unsigned __int8 *)(a3 + v12) >> 4];
      *((_BYTE *)v9 + v13) = v11[*(_BYTE *)(a3 + v12++) & 0xF];
      v13 += 2;
    }
    while (a4 > v12);
  }
  *((_BYTE *)v9 + v8) = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  free(v10);
  return v14;
}

+ (uint64_t)vui_lowercaseHexStringWithBytes:()VideosUICore length:
{
  return objc_msgSend(a1, "tvs_hexStringWithBytes:length:lowercase:", a3, a4, 1);
}

- (id)vui_filenameSafeString
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("_"), 0, 0, v3);
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(":"), CFSTR("_"), 0, 0, v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
