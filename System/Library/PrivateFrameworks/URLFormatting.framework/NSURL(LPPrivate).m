@implementation NSURL(LPPrivate)

- (id)_lp_originalData
{
  UInt8 *v2;
  CFIndex v3;
  size_t v4;
  CFIndex v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (UInt8 *)malloc_type_malloc(0x800uLL, 0xCEFEA29FuLL);
  v3 = CFURLGetBytes(a1, v2, 2048);
  if (v3 == -1)
  {
    v4 = CFURLGetBytes(a1, 0, 0);
    if (v4 == -1)
    {
      free(v2);
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      return v9;
    }
    v5 = v4;
    v2 = (UInt8 *)malloc_type_realloc(v2, v4, 0x223B1CBCuLL);
    v3 = CFURLGetBytes(a1, v2, v5);
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v2, v3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFURLGetBaseURL(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "_lp_URLWithData:baseURL:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_lp_originalData");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v6;
  }

  return v9;
}

+ (CFURLRef)_lp_URLWithData:()LPPrivate baseURL:
{
  id v5;
  const __CFURL *v6;
  CFIndex v7;
  const __CFURL *v8;
  const __CFURL *v9;
  CFIndex location;
  UInt8 *v11;
  uint64_t v12;
  size_t v13;
  CFIndex v14;
  CFIndex v15;
  CFURLRef v16;
  CFURLRef v17;
  const UInt8 *v18;
  CFURLRef v19;
  UInt8 buffer[2048];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_22;
  v7 = objc_msgSend(v5, "length");
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24C0A25C8);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v8 = v6;
  v9 = v8;
  if (!v8)
  {
    v6 = 0;
    goto LABEL_20;
  }
  location = CFURLGetByteRangeForComponent(v8, kCFURLComponentResourceSpecifier, 0).location;
  if (location == -1)
    goto LABEL_19;
  if (CFURLGetBytes(v9, buffer, 2048) == -1)
  {
    v13 = CFURLGetBytes(v9, 0, 0);
    v14 = v13;
    if (v13 != -1)
    {
      v11 = (UInt8 *)malloc_type_malloc(v13, 0x4C7AD526uLL);
      CFURLGetBytes(v9, v11, v14);
      goto LABEL_11;
    }
LABEL_19:
    v6 = v9;
    goto LABEL_20;
  }
  v11 = buffer;
LABEL_11:
  v15 = location - 1;
  v16 = CFURLCreateWithBytes(0, v11, v15, 0x8000100u, 0);
  if (!v16)
    v16 = CFURLCreateWithBytes(0, v11, v15, 0x201u, 0);
  if (v11 != buffer)
    free(v11);
  if (v16)
    v17 = v16;
  else
    v17 = v9;
  v6 = v17;

LABEL_20:
  v18 = (const UInt8 *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
  if (*v18 != 47 || v6)
  {
    v19 = CFURLCreateAbsoluteURLWithBytes(0, v18, v7, 0x8000100u, v6, 1u);
    if (v19)
      goto LABEL_26;
    v12 = (uint64_t)CFURLCreateAbsoluteURLWithBytes(0, v18, v7, 0x201u, v6, 1u);
LABEL_25:
    v19 = (CFURLRef)v12;
    goto LABEL_26;
  }
LABEL_22:
  v19 = 0;
LABEL_26:

  return v19;
}

- (id)_lp_simplifiedStringForDisplayOnly:()LPPrivate
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_lp_userVisibleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_lp_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:", 1023, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_lp_URLByDeletingCommonIndexPageNames
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (-[NSURL(LPPrivate) _lp_URLByDeletingCommonIndexPageNames]::onceToken != -1)
    dispatch_once(&-[NSURL(LPPrivate) _lp_URLByDeletingCommonIndexPageNames]::onceToken, &__block_literal_global);
  v2 = (void *)-[NSURL(LPPrivate) _lp_URLByDeletingCommonIndexPageNames]::commonIndexPageNames;
  objc_msgSend(a1, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v4);

  if ((_DWORD)v2)
  {
    objc_msgSend(a1, "URLByDeletingLastPathComponent");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (id)_lp_URLBySortingQueryItems
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:selector:", CFSTR("name"), 1, sel_compare_);
  objc_msgSend(v1, "percentEncodedQueryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPercentEncodedQueryItems:", v5);

  objc_msgSend(v1, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
