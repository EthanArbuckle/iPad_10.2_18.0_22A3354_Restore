@implementation NSData(VideosUICore)

- (uint64_t)vui_lowercaseHexString
{
  void *v1;
  id v2;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_retainAutorelease(a1);
  return objc_msgSend(v1, "vui_lowercaseHexStringWithBytes:length:", objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"));
}

- (id)vui_SHA256Digest
{
  uint64_t v2;
  void *v3;
  unsigned __int8 md[32];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  if (v2 < 1)
  {
    v3 = 0;
  }
  else
  {
    CC_SHA256((const void *)objc_msgSend(objc_retainAutorelease(a1), "bytes"), v2, md);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 32);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)vui_SHA1Digest
{
  uint64_t v2;
  void *v3;
  _OWORD v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  if (v2 < 1)
  {
    v3 = 0;
  }
  else
  {
    memset(v5, 0, sizeof(v5));
    CC_SHA1((const void *)objc_msgSend(objc_retainAutorelease(a1), "bytes", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                      0,
                      0,
                      0,
                      0),
      v2,
      (unsigned __int8 *)v5);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, 20);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
