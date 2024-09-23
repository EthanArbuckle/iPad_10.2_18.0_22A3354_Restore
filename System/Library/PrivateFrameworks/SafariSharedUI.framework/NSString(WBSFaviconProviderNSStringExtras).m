@implementation NSString(WBSFaviconProviderNSStringExtras)

- (id)safari_urlStringVariantsForFaviconDatabase
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_safari_variantsOfURLStringInFaviconFormat:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(a1, "safari_stringByFormattingForFaviconDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_11);
  return v6;
}

- (id)safari_domainFaviconURLStringVariantsForFaviconDatabase
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safari_domainURLStringPrefixVariantsForFaviconDatabase");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_mapObjectsUsingBlock:", &__block_literal_global_2_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_domainURLStringPrefixVariantsForFaviconDatabase
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@"), a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_stringByFormattingForFaviconDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://www.%@"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_stringByFormattingForFaviconDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("http://%@"), a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_stringByFormattingForFaviconDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("http://www.%@"), a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_stringByFormattingForFaviconDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v10);

  return v2;
}

- (id)safari_urlStringVariantsForIconControllerDatabase
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_safari_variantsOfURLStringInFaviconFormat:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "addObject:", a1);
  }
  else
  {
    objc_msgSend(a1, "safari_stringByFormattingForIconControllerDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  objc_msgSend(v3, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_14_0);
  return v8;
}

- (id)safari_stringByFormattingForFaviconDatabase
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "hasSuffix:", CFSTR("/")))
  {
    do
    {
      objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "length") - 1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v2;
    }
    while ((objc_msgSend(v2, "hasSuffix:", CFSTR("/")) & 1) != 0);
  }
  else
  {
    v2 = v1;
  }
  return v2;
}

- (id)safari_stringByFormattingForIconControllerDatabase
{
  id v2;

  if (objc_msgSend(a1, "hasSuffix:", CFSTR("/")))
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByAppendingString:", CFSTR("/"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_safari_variantsOfURLStringInFaviconFormat:()WBSFaviconProviderNSStringExtras
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v36;

  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v13 = v8;
    goto LABEL_37;
  }
  if (objc_msgSend(v6, "isFileURL"))
  {
    if ((a3 & 1) != 0)
      objc_msgSend(a1, "safari_stringByFormattingForFaviconDatabase");
    else
      objc_msgSend(a1, "safari_stringByFormattingForIconControllerDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

    v8 = v5;
    goto LABEL_10;
  }
  objc_msgSend(v7, "safari_URLByRemovingUserPasswordPathQueryAndFragment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((a3 & 1) != 0)
    objc_msgSend(v10, "safari_stringByFormattingForFaviconDatabase");
  else
    objc_msgSend(v10, "safari_stringByFormattingForIconControllerDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v14);

  objc_msgSend(v9, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safari_highLevelDomainFromHost");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = v9;
    objc_msgSend(v17, "host");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v17;
    if (v18)
    {
      v20 = (void *)v18;
      v36 = v17;
      v19 = v17;
      while (1)
      {
        if ((objc_msgSend(v20, "isEqualToString:", v16, v36) & 1) != 0)
          goto LABEL_24;
        v21 = objc_msgSend(v20, "rangeOfString:", CFSTR("."));
        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        objc_msgSend(v20, "substringFromIndex:", v21 + 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "safari_URLByReplacingHostWithString:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "absoluteString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          if ((a3 & 1) != 0)
            objc_msgSend(v24, "safari_stringByFormattingForFaviconDatabase");
          else
            objc_msgSend(v24, "safari_stringByFormattingForIconControllerDatabase");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v26);

        }
        objc_msgSend(v23, "host");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v23;
        if (!v20)
        {
          v19 = v23;
LABEL_24:

          v17 = v36;
          goto LABEL_25;
        }
      }
      v32 = v5;

    }
    else
    {
LABEL_25:
      if ((objc_msgSend(v16, "safari_hasCaseInsensitivePrefix:", CFSTR("www.")) & 1) == 0)
      {
        objc_msgSend(CFSTR("www."), "stringByAppendingString:", v16);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "safari_URLByReplacingHostWithString:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "absoluteString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          if ((a3 & 1) != 0)
            objc_msgSend(v29, "safari_stringByFormattingForFaviconDatabase");
          else
            objc_msgSend(v29, "safari_stringByFormattingForIconControllerDatabase");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v33);

        }
      }
      v34 = v5;
    }

  }
  else
  {
    v31 = v5;
  }

  v13 = v5;
LABEL_37:

  return v13;
}

@end
