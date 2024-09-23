@implementation NSURL(UIKitAdditions)

- (BOOL)isAccountURL
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "compare:options:", CFSTR("account"), 1) == 0;
  else
    v3 = 0;

  return v3;
}

- (BOOL)isWebcalURL
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("webcal")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("http")) & 1) != 0
         || objc_msgSend(v3, "isEqualToString:", CFSTR("https")))
  {
    objc_msgSend(a1, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v4 = objc_msgSend(v5, "rangeOfString:options:", CFSTR(".ics"), 13) != 0x7FFFFFFFFFFFFFFFLL;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)mapsURLWithQuery:()UIKitAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "URLQueryAllowedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("maps:q=%@"), v6);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)mapsURLWithSourceAddress:()UIKitAdditions destinationAddress:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v5 = (void *)MEMORY[0x1E0CB3500];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "URLQueryAllowedCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v9, "length");
  v13 = objc_msgSend(v11, "length");
  if (v12)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (v14)
  {
    if (v12)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("maps:saddr=%@"), v9, v19);
    }
    else
    {
      if (!v13)
      {
        v17 = 0;
        goto LABEL_9;
      }
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("maps:daddr=%@"), v11, v19);
    }
  }
  else
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("maps:saddr=%@&daddr=%@"), v9, v11);
  }
  v16 = (void *)v15;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v17;
}

- (void)_domain:()UIKitAdditions subdomain:
{
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  *a3 = 0;
  *a4 = 0;
  objc_msgSend(a1, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v11, "count");
  v8 = v11;
  if (v7)
  {
    objc_msgSend(v11, "objectAtIndex:", v7 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "_web_isCaseInsensitiveEqualToString:", CFSTR("au")) & 1) != 0
      || (objc_msgSend(v9, "_web_isCaseInsensitiveEqualToString:", CFSTR("jp")) & 1) != 0
      || objc_msgSend(v9, "_web_isCaseInsensitiveEqualToString:", CFSTR("uk")))
    {
      if (v7 < 3)
        goto LABEL_11;
      objc_msgSend(v11, "objectAtIndex:", v7 - 3);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == 3)
        goto LABEL_11;
      v10 = -4;
    }
    else
    {
      if (v7 < 2)
        goto LABEL_11;
      objc_msgSend(v11, "objectAtIndex:", v7 - 2);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == 2)
        goto LABEL_11;
      v10 = -3;
    }
    objc_msgSend(v11, "objectAtIndex:", v10 + v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    v8 = v11;
  }

}

- (id)radarWebURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rdar")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("radar")))
  {
    objc_msgSend(a1, "resourceSpecifier");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://bugreport.apple.com/cgi-bin/WebObjects/RadarWeb.woa/wa/openURL?url=%@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://bugreport.apple.com/"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)URLWithDisplayIdentifier:()UIKitAdditions forSearchResultDomain:andIdentifier:
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("search://%@/%u/%llu"), a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)searchResultDomain
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("search"));

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v7, "longLongValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)searchResultIdentifier
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  const char *v6;
  unint64_t v7;
  void *v8;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("search"));

  if (v3)
  {
    objc_msgSend(a1, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");

    if (v6)
      v7 = strtoull(v6, 0, 10);
    else
      v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (uint64_t)isSpringboardHandledURL
{
  void *v2;
  uint64_t v3;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v3 = objc_msgSend(v2, "isApplicationAvailableToOpenURL:includePrivateURLSchemes:error:", a1, 0, &v5);

  return v3;
}

- (BOOL)isJavaScriptURL
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("javascript")) == 0;
  else
    v3 = 0;

  return v3;
}

- (BOOL)isHTTPOrHTTPSURL
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("http")))
      v3 = objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("https")) == 0;
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
