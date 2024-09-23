@implementation BillingRegionAndLocationAsset

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BillingRegionAndLocationAsset;
  return -[EligibilityAsset initForMobileAssetRootKey:withDictionary:](&v5, "initForMobileAssetRootKey:withDictionary:", a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset billingCountryCodes](self, "billingCountryCodes"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setBillingCountryCodes:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset regionSKUs](self, "regionSKUs"));
  v9 = objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setRegionSKUs:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset countryCodes](self, "countryCodes"));
  v11 = objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setCountryCodes:", v11);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset billingCountryCodes](self, "billingCountryCodes"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset regionSKUs](self, "regionSKUs"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset countryCodes](self, "countryCodes"));
  v8 = v6 ^ (unint64_t)objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  BillingRegionAndLocationAsset *v4;
  uint64_t v5;
  BillingRegionAndLocationAsset *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;

  v4 = (BillingRegionAndLocationAsset *)a3;
  v22.receiver = self;
  v22.super_class = (Class)BillingRegionAndLocationAsset;
  if (-[EligibilityAsset isEqual:](&v22, "isEqual:", v4))
  {
    if (v4 == self)
    {
      v16 = 1;
      goto LABEL_19;
    }
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset billingCountryCodes](self, "billingCountryCodes"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset billingCountryCodes](v6, "billingCountryCodes"));
      v9 = sub_1000163A4(v7, v8);

      if ((v9 & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset regionSKUs](self, "regionSKUs"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset regionSKUs](v6, "regionSKUs"));
        v12 = sub_1000163A4(v10, v11);

        if ((v12 & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset countryCodes](self, "countryCodes"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset countryCodes](v6, "countryCodes"));
          v15 = sub_1000163A4(v13, v14);

          if ((v15 & 1) != 0)
          {
            v16 = 1;
LABEL_18:

            goto LABEL_19;
          }
          v20 = sub_10000C5FC();
          v18 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v24 = "-[BillingRegionAndLocationAsset isEqual:]";
            v25 = 2080;
            v26 = "countryCodes";
            goto LABEL_16;
          }
LABEL_17:

          v16 = 0;
          goto LABEL_18;
        }
        v19 = sub_10000C5FC();
        v18 = objc_claimAutoreleasedReturnValue(v19);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        *(_DWORD *)buf = 136315394;
        v24 = "-[BillingRegionAndLocationAsset isEqual:]";
        v25 = 2080;
        v26 = "regionSKUs";
      }
      else
      {
        v17 = sub_10000C5FC();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        *(_DWORD *)buf = 136315394;
        v24 = "-[BillingRegionAndLocationAsset isEqual:]";
        v25 = 2080;
        v26 = "billingCountryCodes";
      }
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      goto LABEL_17;
    }
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset billingCountryCodes](self, "billingCountryCodes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset regionSKUs](self, "regionSKUs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset countryCodes](self, "countryCodes"));
  v10.receiver = self;
  v10.super_class = (Class)BillingRegionAndLocationAsset;
  v6 = -[EligibilityAsset description](&v10, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Billing, Region, and Locatoin Asset billingCountryCodes:%@ regionSKUs:%@ countryCodes:%@ %@]"), v3, v4, v5, v7));

  return (NSString *)v8;
}

- (NSSet)billingCountryCodes
{
  return self->billingCountryCodes;
}

- (void)setBillingCountryCodes:(id)a3
{
  objc_storeStrong((id *)&self->billingCountryCodes, a3);
}

- (NSSet)regionSKUs
{
  return self->regionSKUs;
}

- (void)setRegionSKUs:(id)a3
{
  objc_storeStrong((id *)&self->regionSKUs, a3);
}

- (NSSet)countryCodes
{
  return self->countryCodes;
}

- (void)setCountryCodes:(id)a3
{
  objc_storeStrong((id *)&self->countryCodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->countryCodes, 0);
  objc_storeStrong((id *)&self->regionSKUs, 0);
  objc_storeStrong((id *)&self->billingCountryCodes, 0);
}

@end
