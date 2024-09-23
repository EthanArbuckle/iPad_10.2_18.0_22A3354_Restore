@implementation MAAsset(VTAsset)

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "hash"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isVTAssetInstalled"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (objc_msgSend(a1, "canBePurged"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(a1, "languages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isPremium"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("MAAsset<%@> version: %@; installed: %@; canBePurged: %@; languages: %@; premium: %@ "),
    v3,
    v4,
    v5,
    v6,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)languages
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("Languages"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)footprint
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("Footprint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)version
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BE66A98]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)compatibilityVersion
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BE66A80]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)path
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "getLocalUrl");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)isPremium
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("Footprint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v2 && (objc_msgSend(v2, "isEqualToString:", CFSTR("Premium")) & 1) != 0;
  return v3;
}

- (BOOL)isVTAssetInstalled
{
  return objc_msgSend(a1, "state") == 2
      || objc_msgSend(a1, "state") == 3
      || objc_msgSend(a1, "state") == 5
      || objc_msgSend(a1, "state") == 6;
}

- (BOOL)canBePurged
{
  return objc_msgSend(a1, "state") == 2 || objc_msgSend(a1, "state") == 3 || objc_msgSend(a1, "state") == 6;
}

- (BOOL)isAvailableLocally
{
  return objc_msgSend(a1, "state") == 2
      || objc_msgSend(a1, "state") == 3
      || objc_msgSend(a1, "state") == 5
      || objc_msgSend(a1, "state") == 6;
}

- (BOOL)isDownloading
{
  return objc_msgSend(a1, "state") == 4;
}

- (uint64_t)isLatestCompareTo:()VTAsset
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  objc_msgSend(a1, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE66A98];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE66A98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v8 >= v11)
  {
    if (v8 == v11)
    {
      v12 = objc_msgSend(a1, "isPremium");
      goto LABEL_7;
    }
LABEL_6:
    v12 = 1;
    goto LABEL_7;
  }
  v12 = 0;
LABEL_7:

  return v12;
}

@end
