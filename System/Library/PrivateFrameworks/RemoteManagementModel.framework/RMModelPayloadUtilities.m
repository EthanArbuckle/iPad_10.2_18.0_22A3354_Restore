@implementation RMModelPayloadUtilities

+ (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 supportedOS:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a5;
  objc_msgSend(v8, "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "_isCurrentVariantSupportedForDetails:", v11))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v12);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 enrollmentType:(int64_t)a5 supportedOS:(id)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a6;
  objc_msgSend(v10, "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "_isCurrentVariantSupportedForDetails:", v13))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "containsObject:", v14))
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", v15);

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)_isCurrentVariantSupportedForDetails:(id)a3
{
  id v3;
  char v4;
  void *v5;
  char v6;
  char v7;
  char v8;

  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x24BE2A7E8], "isAppleInternal");
  if ((unint64_t)objc_msgSend(v3, "count") < 3)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", &unk_251629E50);

    v7 = v6 ^ 1;
  }
  v8 = v4 | v7;

  return v8;
}

@end
