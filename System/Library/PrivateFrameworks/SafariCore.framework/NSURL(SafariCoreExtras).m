@implementation NSURL(SafariCoreExtras)

- (uint64_t)safari_isHTTPFamilyURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "safari_hasCaseInsensitivePrefix:", CFSTR("http:")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "safari_hasCaseInsensitivePrefix:", CFSTR("https:"));

  return v2;
}

- (uint64_t)safari_hasScheme:()SafariCoreExtras
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safari_isCaseInsensitiveEqualToString:", v4);

  return v6;
}

+ (id)safari_URLWithUserTypedString:()SafariCoreExtras
{
  objc_msgSend(MEMORY[0x1E0C99E98], "_lp_URLWithUserTypedString:relativeToURL:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)safari_isSubdomainOfDomain:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a1, "safari_hostComponentsEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_hostComponentsEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = 0;
  do
  {
    objc_msgSend(v5, "nextObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v9;
    v8 = v10;
  }
  while ((objc_msgSend(v9, "isEqualToString:", v10) & 1) != 0);
  if (v10)
  {
    objc_msgSend(v6, "nextObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v10, "safari_isCaseInsensitiveEqualToString:", CFSTR("www")) & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      v12 = objc_msgSend(v10, "safari_isCaseInsensitiveEqualToString:", CFSTR("m"));
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

+ (void)safari_enumeratePossibleURLsForUserTypedString:()SafariCoreExtras withBlock:
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if ((enumeratePossibleURLsForUserTypedStringWithBlockInternal(v7, v5) & 1) == 0)
  {
    objc_msgSend(v7, "safari_possibleTopLevelDomainCorrectionForUserTypedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    enumeratePossibleURLsForUserTypedStringWithBlockInternal(v6, v5);

  }
}

+ (uint64_t)safari_hostAndPortRangeFromUserTypedString:()SafariCoreExtras
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;

  v3 = a3;
  v5 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("://"), 2);
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v4;
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "invertedSet");
      +[NSURL(SafariCoreExtras) safari_hostAndPortRangeFromUserTypedString:]::nonSchemeCharacters = objc_claimAutoreleasedReturnValue();

    }
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", +[NSURL(SafariCoreExtras) safari_hostAndPortRangeFromUserTypedString:]::nonSchemeCharacters, 2, 0, v5) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = objc_msgSend(v3, "length");
      {
        v9 = +[NSURL(SafariCoreExtras) safari_hostAndPortRangeFromUserTypedString:]::hostTerminators;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/?#"));
        v9 = objc_claimAutoreleasedReturnValue();
        +[NSURL(SafariCoreExtras) safari_hostAndPortRangeFromUserTypedString:]::hostTerminators = v9;
      }
      v10 = v5 + v7;
      v11 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v9, 2, v10, v8 - v10);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        v12 = v8;
      else
        v12 = v11;
      v13 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("@"), 2, v10, v12 - v10);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        v6 = v10;
      else
        v6 = v13 + v14;
    }
  }

  return v6;
}

- (uint64_t)safari_hasSameOriginAsURL:()SafariCoreExtras
{
  return objc_msgSend(a1, "safari_hasSameOriginAsURL:relaxingWWW:", a3, 0);
}

- (BOOL)safari_hasSameOriginAsURL:()SafariCoreExtras relaxingWWW:
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;

  v6 = a3;
  if (!v6)
    goto LABEL_8;
  objc_msgSend(a1, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    if (a4
      && objc_msgSend(a1, "safari_isHTTPFamilyURL")
      && (objc_msgSend(v6, "safari_isHTTPFamilyURL") & 1) != 0)
    {
      goto LABEL_4;
    }
LABEL_8:
    v14 = 0;
    goto LABEL_14;
  }
  if (!a4)
  {
    objc_msgSend(a1, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_4:
  objc_msgSend(a1, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_stringByRemovingWwwDotPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safari_stringByRemovingWwwDotPrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if ((objc_msgSend(v11, "isEqualToString:", v13) & 1) != 0)
  {
    objc_msgSend(a1, "port");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "port");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15 == v16;

  }
  else
  {
    v14 = 0;
  }

LABEL_14:
  return v14;
}

- (uint64_t)safari_hasSameSiteAsURL:()SafariCoreExtras
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  if ((objc_msgSend(a1, "safari_hasSameOriginAsURL:", v4) & 1) == 0)
  {
    objc_msgSend(a1, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      objc_msgSend(a1, "host");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safari_highLevelDomainFromHost");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "host");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safari_highLevelDomainFromHost");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v10, "isEqualToString:", v12);

      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = 1;
LABEL_7:

  return v5;
}

- (uint64_t)safari_isSameAsURLRemovingFragment:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "safari_absoluteStringWithoutFragment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_absoluteStringWithoutFragment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (id)safari_canonicalURL
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:", a1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C92C78], "_protocolClassForRequest:skipAppSSO:", v2, 1);
  else
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C92C78], "_protocolClassForRequest:", v2);
  if (v3)
  {
    objc_msgSend(v3, "canonicalRequestForRequest:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = a1;
  }

  return v5;
}

- (uint64_t)safari_displayNameForFile
{
  return 0;
}

- (id)safari_absoluteStringWithoutFragment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "fragment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "absoluteString");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("#"), "stringByAppendingString:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", v4, &stru_1E64A2498);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)safari_highLevelDomain
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_highLevelDomainFromHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_highLevelDomainFromHostFallingBackToHostOrAbsoluteString
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_highLevelDomainFromHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(a1, "absoluteString");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return v5;
}

- (uint64_t)safari_hostCompare:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v4 = a3;
  objc_msgSend(a1, "safari_hostComponentsEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_hostComponentsEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
    goto LABEL_10;
  if (objc_msgSend(v7, "length") && !objc_msgSend(v8, "length"))
    goto LABEL_8;
  v9 = objc_msgSend(v5, "kind");
  v10 = objc_msgSend(v6, "kind");
  if (!v9 && v10)
    goto LABEL_10;
  if (v9 && !v10)
    goto LABEL_8;
  if (!(v9 | v10))
  {
    v13 = objc_msgSend(v5, "ipv4Address");
    v14 = objc_msgSend(v6, "ipv4Address");
    if (v13 < v14)
      v11 = -1;
    else
      v11 = v13 > v14;
    goto LABEL_11;
  }
  if (v9 == 1 && v10 != 1)
    goto LABEL_10;
  if (v9 != 1 && v10 == 1)
    goto LABEL_8;
  if (v9 == 1 && v10 == 1)
  {
    v27[0] = objc_msgSend(v5, "ipv6Address");
    v27[1] = v15;
    v16 = objc_msgSend(v6, "ipv6Address");
    v17 = 0;
    v26[0] = v16;
    v26[1] = v18;
    v11 = 1;
    while (1)
    {
      v19 = *((unsigned __int8 *)v27 + v17);
      v20 = *((unsigned __int8 *)v26 + v17);
      if (v19 < v20)
        goto LABEL_10;
      if (v19 > v20)
        goto LABEL_11;
      if (++v17 == 16)
      {
        v11 = 0;
        goto LABEL_11;
      }
    }
  }
  if (v9 == 2 && v10 != 2)
  {
LABEL_10:
    v11 = -1;
    goto LABEL_11;
  }
  if (v9 != 2 && v10 == 2)
  {
LABEL_8:
    v11 = 1;
    goto LABEL_11;
  }
  v21 = 0;
  v22 = v8 != 0;
  if (v7 && v8)
  {
    v21 = 0;
    do
    {
      v11 = objc_msgSend(v7, "caseInsensitiveCompare:", v8);
      if (objc_msgSend(v5, "kind") == 3 && objc_msgSend(v6, "kind") == 3)
      {
        v21 = v11;
      }
      else if (v11)
      {
        goto LABEL_11;
      }
      objc_msgSend(v5, "nextObject");
      v23 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "nextObject");
      v24 = objc_claimAutoreleasedReturnValue();

      v22 = v24 != 0;
      if (!v23)
        break;
      v8 = (void *)v24;
      v7 = (void *)v23;
    }
    while (v24);
  }
  else
  {
    v23 = (uint64_t)v7;
    v24 = (uint64_t)v8;
  }
  if (!v23 || v22)
  {
    v25 = v23 == 0;
    if (v25 && v22)
      v11 = -1;
    else
      v11 = v21;
    if (v25 && v22)
      v7 = 0;
    else
      v7 = (void *)v23;
    v8 = (void *)v24;
  }
  else
  {
    v8 = 0;
    v11 = 1;
    v7 = (void *)v23;
  }
LABEL_11:

  return v11;
}

- (uint64_t)safari_isXWebSearchURL
{
  return objc_msgSend(a1, "safari_hasScheme:", CFSTR("x-web-search"));
}

- (uint64_t)safari_isAppleNewsURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safari_isCaseInsensitiveEqualToString:", CFSTR("apple.news"));

  return v2;
}

- (uint64_t)safari_isAppleOneURL
{
  void *v2;
  uint64_t v3;

  if (!objc_msgSend(a1, "safari_hasScheme:", CFSTR("ams-ui")))
    return 0;
  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_isCaseInsensitiveEqualToString:", CFSTR("one.apple.com"));

  return v3;
}

- (id)safari_URLByReplacingScheme:()SafariCoreExtras withScheme:
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = WBSIsEqual(v8, v6);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(a1, "safari_URLByReplacingSchemeWithString:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = a1;
  }
  v11 = v10;

  return v11;
}

- (id)safari_URLByReplacingSchemeWithString:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScheme:", v4);
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)safari_isEligibleforDirectSSO
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  char v23;
  char v24;
  void *v26;
  char v27;
  id obj;
  uint64_t v29;
  char v30;
  uint64_t v31;
  _BOOL4 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v26, "queryItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v1)
  {

LABEL_22:
    v24 = 0;
    goto LABEL_23;
  }
  v2 = 0;
  v27 = 0;
  v30 = 0;
  v3 = 0;
  v4 = 0;
  v29 = *(_QWORD *)v34;
  do
  {
    v31 = v1;
    for (i = 0; i != v31; ++i)
    {
      if (*(_QWORD *)v34 != v29)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lowercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("client_id")))
      {
        objc_msgSend(v6, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v9, "length") != 0;

      }
      else
      {
        v32 = 0;
      }

      objc_msgSend(v6, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("response_type")))
      {
        objc_msgSend(v6, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("code"));

      }
      else
      {
        v13 = 0;
      }

      objc_msgSend(v6, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", CFSTR("redirect_uri")))
      {
        objc_msgSend(v6, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("http"));

        v18 = v17 ^ 1;
      }
      else
      {
        v18 = 0;
      }

      objc_msgSend(v6, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lowercaseString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("response_mode"));

      if (v21)
      {
        objc_msgSend(v6, "value");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("query"));

        v30 |= v23;
        v27 = 1;
      }
      v4 |= v32;
      v3 |= v13;
      v2 |= v18;
    }
    v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v1);

  if ((v4 & v3 & v2 & 1) == 0)
    goto LABEL_22;
  v24 = v27 ^ 1 | v30;
LABEL_23:

  return v24 & 1;
}

- (id)safari_URLByRemovingUserPasswordPathQueryAndFragment
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUser:", 0);
  objc_msgSend(v1, "setPassword:", 0);
  objc_msgSend(v1, "setPath:", 0);
  objc_msgSend(v1, "setQuery:", 0);
  objc_msgSend(v1, "setFragment:", 0);
  objc_msgSend(v1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E64A2498);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (uint64_t)safari_isWellKnownChangePasswordURL
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "safari_wellKnownChangePasswordURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqual:", v2);

  return v3;
}

- (id)safari_wellKnownChangePasswordURL
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (objc_msgSend(a1, "safari_isHTTPFamilyURL"))
  {
    v2 = a1;
    objc_msgSend(v2, "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_highLevelDomainFromHost");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", CFSTR("google.com"));

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://accounts.google.com/"));
      v6 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v6;
    }
    objc_msgSend(v2, "safari_URLByRemovingUserPasswordPathQueryAndFragment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR(".well-known/change-password"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_URLByReplacingSchemeWithString:", CFSTR("https"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSURL)safari_URLWithUniqueFilename
{
  void *v2;
  WBSUniqueFilenameEnumerator *v3;
  void *v4;
  WBSUniqueFilenameEnumerator *v5;
  WBSUniqueFilenameEnumerator *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSURL *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (fileExists(a1))
  {
    -[NSURL URLByDeletingLastPathComponent](a1, "URLByDeletingLastPathComponent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = [WBSUniqueFilenameEnumerator alloc];
    -[NSURL lastPathComponent](a1, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WBSUniqueFilenameEnumerator initWithFilename:](v3, "initWithFilename:", v4);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = -[WBSUniqueFilenameEnumerator countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), 0, (_QWORD)v12);
        v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
        if (!fileExists(v10))
          break;

        if (v7 == ++v9)
        {
          v7 = -[WBSUniqueFilenameEnumerator countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v10 = 0;
    }

  }
  else
  {
    v10 = a1;
  }
  return v10;
}

- (void)safari_accessingSecurityScopedResource:()SafariCoreExtras
{
  int v4;
  void (**v5)(void);

  v5 = a3;
  v4 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
  v5[2]();
  if (v4)
    objc_msgSend(a1, "stopAccessingSecurityScopedResource");

}

@end
