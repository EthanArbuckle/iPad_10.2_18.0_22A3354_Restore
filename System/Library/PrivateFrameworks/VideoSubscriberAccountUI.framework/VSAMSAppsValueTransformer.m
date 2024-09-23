@implementation VSAMSAppsValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (BOOL)responseDeviceFamilies:(id)a3 compatibleWithDevice:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  char v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "stringForAMSDeviceFamilies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "containsObject:", v7);

  objc_msgSend(v6, "bincompatPlatform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v5, "containsObject:", v9);
  else
    v10 = 0;
  v11 = v8 | v10;

  return v11;
}

- (id)platformAttributes:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "stringForAMSPlatformAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vs_dictionaryForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v6, "bincompatOS");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v5, "vs_dictionaryForKey:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)transformedValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  VSAppDescription *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = (void *)MEMORY[0x24BDBCE88];
      v6 = *MEMORY[0x24BDBCAB8];
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "raise:format:", v6, CFSTR("Unexpectedly, value was %@, instead of NSDictionary."), v8);

    }
    v9 = v4;
    objc_msgSend(v9, "vs_stringForKey:", CFSTR("id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "vs_dictionaryForKey:", CFSTR("attributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, "vs_stringForKey:", CFSTR("name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "vs_stringForKey:", CFSTR("artistName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "vs_arrayOfStringsForKey:", CFSTR("deviceFamilies"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF8BD8], "currentDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[VSAMSAppsValueTransformer responseDeviceFamilies:compatibleWithDevice:](self, "responseDeviceFamilies:compatibleWithDevice:", v15, v16))
      {
        v48 = v15;
        objc_msgSend(v12, "vs_dictionaryForKey:", CFSTR("platformAttributes"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v16;
        -[VSAMSAppsValueTransformer platformAttributes:forDevice:](self, "platformAttributes:forDevice:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "vs_stringForKey:", CFSTR("bundleId"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "vs_numberForKey:", CFSTR("hasInAppPurchases"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v18, "BOOLValue");

        objc_msgSend(v17, "vs_numberForKey:", CFSTR("isXROSCompatible"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "vs_dictionaryForKey:", CFSTR("artwork"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "vs_stringForKey:", CFSTR("url"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "vs_arrayForKey:", CFSTR("offers"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "vs_arrayForKey:", CFSTR("assets"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "firstObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "vs_numberForKey:", CFSTR("size"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v17;
        objc_msgSend(v17, "vs_numberForKey:", CFSTR("externalVersionId"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v19;
        objc_msgSend(v19, "vs_stringForKey:", CFSTR("buyParams"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "vs_stringForKey:", CFSTR("url"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "vs_dictionaryForKey:", CFSTR("contentRatingsBySystem"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "vs_dictionaryForKey:", CFSTR("appsApple"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "vs_stringForKey:", CFSTR("name"));
        v32 = v21;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "vs_numberForKey:", CFSTR("value"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "vs_dictionaryForKey:", CFSTR("meta"));
        v22 = v13;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "vs_numberForKey:", CFSTR("defaultApp"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "BOOLValue");

        v25 = objc_alloc_init(VSAppDescription);
        v49 = v22;
        -[VSAppDescription setDisplayName:](v25, "setDisplayName:", v22);
        -[VSAppDescription setBundleID:](v25, "setBundleID:", v51);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "intValue"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSAppDescription setAdamID:](v25, "setAdamID:", v26);

        -[VSAppDescription setSellerName:](v25, "setSellerName:", v14);
        if (v20)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSAppDescription setAppStoreURL:](v25, "setAppStoreURL:", v27);

        }
        -[VSAppDescription setRating:](v25, "setRating:", v33);
        -[VSAppDescription setContentRank:](v25, "setContentRank:", v31);
        -[VSAppDescription setOffersInAppPurchases:](v25, "setOffersInAppPurchases:", v35);
        -[VSAppDescription setArtworkURLTemplate:](v25, "setArtworkURLTemplate:", v50);
        objc_msgSend(v38, "stringValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSAppDescription setExternalVersionID:](v25, "setExternalVersionID:", v28);

        -[VSAppDescription setBuyParams:](v25, "setBuyParams:", v36);
        -[VSAppDescription setDefaultAppForProvider:](v25, "setDefaultAppForProvider:", v24);
        -[VSAppDescription setDeviceFamilies:](v25, "setDeviceFamilies:", v48);
        -[VSAppDescription setAppSizeBytes:](v25, "setAppSizeBytes:", v39);
        -[VSAppDescription setVisionOSCompatible:](v25, "setVisionOSCompatible:", v45);

        v15 = v48;
        v13 = v49;
        v16 = v47;
      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

@end
