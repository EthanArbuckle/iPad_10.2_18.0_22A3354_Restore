@implementation NSError(SUS)

- (BOOL)isUpToDate
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  int v6;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.errors"));

  if ((v3 & 1) != 0)
  {
    v4 = 3;
    return objc_msgSend(a1, "code") == v4;
  }
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEAEB68]);

  if (v6)
  {
    v4 = 8406;
    return objc_msgSend(a1, "code") == v4;
  }
  return 0;
}

- (BOOL)isCatalogNotFound
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  _BOOL8 v12;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.errors"));

  if (!v3)
    goto LABEL_4;
  if (objc_msgSend(v1, "code") != 57)
    goto LABEL_10;
  objc_msgSend(v1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v5 = objc_claimAutoreleasedReturnValue();

  v1 = (id)v5;
  if (v5)
  {
LABEL_4:
    objc_msgSend(v1, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEAEB68]);

    if (!v7)
      goto LABEL_7;
    if (objc_msgSend(v1, "code") != 8400)
      goto LABEL_10;
    objc_msgSend(v1, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v9 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v9;
    if (v9)
    {
LABEL_7:
      objc_msgSend(v1, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.MobileAssetError.Download"));

      if (v11)
      {
        if (objc_msgSend(v1, "code") != 44)
        {
          v12 = objc_msgSend(v1, "code") == 40;
          goto LABEL_11;
        }
        goto LABEL_9;
      }
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
  }
LABEL_9:
  v12 = 1;
LABEL_11:

  return v12;
}

- (uint64_t)noMatchingUpdateFound
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "shouldFallbackToCustomerScan") & 1) != 0)
    return 1;
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.errors")))
    v2 = objc_msgSend(a1, "code") == 105;
  else
    v2 = 0;

  return v2;
}

@end
