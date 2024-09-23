@implementation NSURL(SSBExtras)

- (void)ssb_hasUserInfo
{
  void *result;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "scheme");
  result = (void *)objc_claimAutoreleasedReturnValue();
  if (result)
  {
    v3 = result;
    if (objc_msgSend(result, "caseInsensitiveCompare:", CFSTR("http")))
    {
      v4 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("https"));

      if (v4)
        return 0;
    }
    else
    {

    }
    return (void *)(CFURLGetByteRangeForComponent((CFURLRef)a1, kCFURLComponentUserInfo, 0).location != -1);
  }
  return result;
}

- (uint64_t)ssb_isSafeURL
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "isFileURL") & 1) != 0)
    return 1;
  objc_msgSend(a1, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "length") == 0;

  return v2;
}

- (CFURLRef)ssb_canonicalizeURL
{
  CFURLRef v1;
  void *__p;
  _BYTE *v4;

  Backend::Google::CanonicalURL::canonicalizeURL(a1, (uint64_t)&__p);
  v1 = CFURLCreateWithBytes(0, (const UInt8 *)__p, v4 - (_BYTE *)__p, 0x8000100u, 0);
  if (__p)
  {
    v4 = __p;
    operator delete(__p);
  }
  return v1;
}

- (id)ssb_hashes
{
  void *v1;
  char *v2;
  char *v3;
  void *v4;
  void *__p;
  char *v7;
  void *v8[10];

  Backend::Google::CanonicalURL::canonicalizeURL(a1, (uint64_t)v8);
  Backend::Google::CanonicalURL::computeHashes((Backend::Google::CanonicalURL *)v8, (char **)&__p);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (v7 - (_BYTE *)__p) >> 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (char *)__p;
  v3 = v7;
  if (__p != v7)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 32);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "addObject:", v4);

      v2 += 32;
    }
    while (v2 != v3);
  }
  if (__p)
  {
    v7 = (char *)__p;
    operator delete(__p);
  }
  if (v8[0])
  {
    v8[1] = v8[0];
    operator delete(v8[0]);
  }
  return v1;
}

@end
