@implementation TVAssetElement

- (NSString)actionParams
{
  void *v2;
  void *v3;

  -[TVAssetElement assetElement](self, "assetElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)adamID
{
  void *v2;
  void *v3;

  -[TVAssetElement assetElement](self, "assetElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)extrasURL
{
  void *v2;
  void *v3;

  -[TVAssetElement assetElement](self, "assetElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extrasURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (unint64_t)keyDelivery
{
  void *v2;
  uint64_t v3;

  -[TVAssetElement assetElement](self, "assetElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyDelivery");

  return v3 == 1;
}

- (NSNumber)persistentID
{
  void *v2;
  void *v3;

  -[TVAssetElement assetElement](self, "assetElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)rentalAdamID
{
  void *v2;
  void *v3;

  -[TVAssetElement assetElement](self, "assetElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rentalAdamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (unint64_t)type
{
  void *v2;
  uint64_t v3;

  -[TVAssetElement assetElement](self, "assetElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  if (v3 == 1)
    return 1;
  else
    return 2 * (v3 == 2);
}

- (NSURL)url
{
  void *v2;
  void *v3;

  -[TVAssetElement assetElement](self, "assetElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  BOOL v32;

  v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_43;
  -[TVAssetElement actionParams](self, "actionParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_5:
    -[TVAssetElement actionParams](self, "actionParams");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionParams");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    goto LABEL_6;
  }
  objc_msgSend(v4, "actionParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_5;
  v9 = 1;
LABEL_6:
  -[TVAssetElement adamID](self, "adamID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    if ((v9 & 1) == 0)
    {
      v11 = 0;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  objc_msgSend(v4, "adamID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v11 = 0;
  else
    v11 = v9;
  if (v12 && ((v9 ^ 1) & 1) == 0)
  {
LABEL_14:
    -[TVAssetElement adamID](self, "adamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "adamID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "isEqualToString:", v14);

  }
LABEL_15:
  -[TVAssetElement url](self, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

    if ((v11 & 1) == 0)
    {
      v16 = 0;
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  objc_msgSend(v4, "url");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v16 = 0;
  else
    v16 = v11;
  if (v17 && ((v11 ^ 1) & 1) == 0)
  {
LABEL_23:
    -[TVAssetElement url](self, "url");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v18, "isEqual:", v19);

  }
LABEL_24:
  -[TVAssetElement persistentID](self, "persistentID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

    if ((v16 & 1) == 0)
    {
      v21 = 0;
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  objc_msgSend(v4, "persistentID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v21 = 0;
  else
    v21 = v16;
  if (v22 && ((v16 ^ 1) & 1) == 0)
  {
LABEL_32:
    -[TVAssetElement persistentID](self, "persistentID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v23, "isEqual:", v24);

  }
LABEL_33:
  -[TVAssetElement rentalAdamID](self, "rentalAdamID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {

LABEL_36:
    if (!v21)
      goto LABEL_43;
    -[TVAssetElement rentalAdamID](self, "rentalAdamID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rentalAdamID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if ((v29 & 1) == 0)
      goto LABEL_43;
    goto LABEL_41;
  }
  objc_msgSend(v4, "rentalAdamID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    goto LABEL_36;
  if (!v21)
  {
LABEL_43:
    v32 = 0;
    goto LABEL_44;
  }
LABEL_41:
  v30 = -[TVAssetElement keyDelivery](self, "keyDelivery");
  if (v30 != objc_msgSend(v4, "keyDelivery"))
    goto LABEL_43;
  v31 = -[TVAssetElement type](self, "type");
  v32 = v31 == objc_msgSend(v4, "type");
LABEL_44:

  return v32;
}

@end
