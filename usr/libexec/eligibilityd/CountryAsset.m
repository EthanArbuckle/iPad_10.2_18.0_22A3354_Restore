@implementation CountryAsset

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CountryAsset;
  return -[EligibilityAsset initForMobileAssetRootKey:withDictionary:](&v5, "initForMobileAssetRootKey:withDictionary:", a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAsset countryCodes](self, "countryCodes"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setCountryCodes:", v7);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAsset countryCodes](self, "countryCodes"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  CountryAsset *v4;
  uint64_t v5;
  CountryAsset *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;

  v4 = (CountryAsset *)a3;
  v13.receiver = self;
  v13.super_class = (Class)CountryAsset;
  if (!-[EligibilityAsset isEqual:](&v13, "isEqual:", v4))
    goto LABEL_9;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_11;
  }
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAsset countryCodes](self, "countryCodes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAsset countryCodes](v6, "countryCodes"));
    v9 = sub_1000163A4(v7, v8);

    if ((v9 & 1) == 0)
    {
      v10 = sub_10000C5FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[CountryAsset isEqual:]";
        v16 = 2080;
        v17 = "countryCodes";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }

    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
LABEL_11:

  return v9;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAsset countryCodes](self, "countryCodes"));
  v8.receiver = self;
  v8.super_class = (Class)CountryAsset;
  v4 = -[EligibilityAsset description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Country Asset countryCodes:%@ %@]"), v3, v5));

  return (NSString *)v6;
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
}

@end
