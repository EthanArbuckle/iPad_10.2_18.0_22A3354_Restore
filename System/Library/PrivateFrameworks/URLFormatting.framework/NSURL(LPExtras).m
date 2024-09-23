@implementation NSURL(LPExtras)

- (BOOL)_lp_userVisibleStringUsesEncodedHost
{
  id v1;
  BOOL v3;

  v3 = 0;
  v1 = userVisibleStringForURL(a1, &v3);
  return v3;
}

- (BOOL)_lp_isHTTPFamilyURL
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "compare:options:", CFSTR("http"), 3))
    v2 = objc_msgSend(v1, "compare:options:", CFSTR("https"), 3) == 0;
  else
    v2 = 1;

  return v2;
}

- (uint64_t)_lp_simplifiedDisplayString
{
  return objc_msgSend(a1, "_lp_simplifiedStringForDisplayOnly:", 1);
}

- (__CFString)_lp_userVisibleString
{
  return userVisibleStringForURL(a1, 0);
}

- (id)_lp_highLevelDomain
{
  NSString *v1;
  void *v2;
  NSString *v3;
  NSString *v4;
  void *v5;

  objc_msgSend(a1, "host");
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  encodeHostName(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "_lp_highLevelDomainFromHost");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    decodeHostName(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_lp_URLWithUserTypedString:()LPExtras relativeToURL:
{
  id v5;
  id v6;
  NSString *v7;
  void *v8;
  id v9;
  id v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  void *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  unsigned int v19;
  unsigned int v20;
  char v21;
  char v22;
  char v23;
  _BYTE *v24;
  int v25;
  void *v26;

  v5 = a3;
  v6 = a4;
  if (v5
    && (objc_msgSend(v5, "_lp_stringByTrimmingWhitespace"),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        mapHostNames(v7, 1, 0),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v7,
        v8))
  {
    v9 = v8;
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (unsigned __int8 *)objc_msgSend(v10, "bytes");
    v12 = objc_msgSend(v10, "length");
    v13 = v12;
    v14 = 0;
    if (v12 && v12 <= 715827882)
    {
      v15 = malloc_type_malloc(3 * v12, 0x6A602E9CuLL);
      if (v13 < 1)
      {
        v16 = 0;
      }
      else
      {
        LODWORD(v16) = 0;
        v17 = v13;
        v18 = v15;
        do
        {
          v20 = *v11++;
          v19 = v20;
          if (v20 - 127 > 0xFFFFFFA1)
          {
            v24 = v18 + 1;
            v25 = 1;
          }
          else
          {
            if (v19 >= 0xA0)
              v21 = 55;
            else
              v21 = 48;
            v18[1] = v21 + (v19 >> 4);
            v19 &= 0xFu;
            if (v19 >= 0xA)
              v22 = 55;
            else
              v22 = 48;
            v23 = v22 + v19;
            v24 = v18 + 3;
            v18[2] = v23;
            LOBYTE(v19) = 37;
            v25 = 3;
          }
          v16 = (v25 + v16);
          *v18 = v19;
          v18 = v24;
          --v17;
        }
        while (v17);
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", v15, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v14)
      objc_msgSend(MEMORY[0x24BDBCF48], "_lp_URLWithData:baseURL:", v14, v6);
    else
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24C0A25C8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)_lp_simplifiedURLStringForFuzzyMatching
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_lp_URLByDeletingCommonIndexPageNames");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_lp_URLBySortingQueryItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_lp_stringByTrimmingWhitespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_lp_stringByDeletingUsernameAndPassword");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_lp_stringByDeletingTrailingSlash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_lp_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:", 2031, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
