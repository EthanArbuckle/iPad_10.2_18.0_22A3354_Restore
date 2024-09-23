@implementation PolicyAndGracePeriodAsset

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PolicyAndGracePeriodAsset;
  return -[EligibilityAsset initForMobileAssetRootKey:withDictionary:](&v5, "initForMobileAssetRootKey:withDictionary:", a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PolicyAndGracePeriodAsset policies](self, "policies"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setPolicies:", v7);

  objc_msgSend(v5, "setGracePeriodInSeconds:", -[PolicyAndGracePeriodAsset gracePeriodInSeconds](self, "gracePeriodInSeconds"));
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PolicyAndGracePeriodAsset policies](self, "policies"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = -[PolicyAndGracePeriodAsset gracePeriodInSeconds](self, "gracePeriodInSeconds") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PolicyAndGracePeriodAsset *v4;
  uint64_t v5;
  PolicyAndGracePeriodAsset *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;

  v4 = (PolicyAndGracePeriodAsset *)a3;
  v16.receiver = self;
  v16.super_class = (Class)PolicyAndGracePeriodAsset;
  if (-[EligibilityAsset isEqual:](&v16, "isEqual:", v4))
  {
    if (v4 == self)
    {
      v11 = 1;
      goto LABEL_16;
    }
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PolicyAndGracePeriodAsset policies](self, "policies"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PolicyAndGracePeriodAsset policies](v6, "policies"));
      v9 = sub_1000163A4(v7, v8);

      if ((v9 & 1) != 0)
      {
        v10 = -[PolicyAndGracePeriodAsset gracePeriodInSeconds](self, "gracePeriodInSeconds");
        if (v10 == (id)-[PolicyAndGracePeriodAsset gracePeriodInSeconds](v6, "gracePeriodInSeconds"))
        {
          v11 = 1;
LABEL_15:

          goto LABEL_16;
        }
        v14 = sub_10000C5FC();
        v13 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "-[PolicyAndGracePeriodAsset isEqual:]";
          v19 = 2080;
          v20 = "gracePeriodInSeconds";
          goto LABEL_13;
        }
      }
      else
      {
        v12 = sub_10000C5FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "-[PolicyAndGracePeriodAsset isEqual:]";
          v19 = 2080;
          v20 = "policies";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
        }
      }

      v11 = 0;
      goto LABEL_15;
    }
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PolicyAndGracePeriodAsset policies](self, "policies"));
  v4 = -[PolicyAndGracePeriodAsset gracePeriodInSeconds](self, "gracePeriodInSeconds");
  v9.receiver = self;
  v9.super_class = (Class)PolicyAndGracePeriodAsset;
  v5 = -[EligibilityAsset description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Policies and Grace Period Asset policies:%@ gracePeriod:%lu %@]"), v3, v4, v6));

  return (NSString *)v7;
}

- (NSArray)policies
{
  return self->policies;
}

- (void)setPolicies:(id)a3
{
  objc_storeStrong((id *)&self->policies, a3);
}

- (unint64_t)gracePeriodInSeconds
{
  return self->gracePeriodInSeconds;
}

- (void)setGracePeriodInSeconds:(unint64_t)a3
{
  self->gracePeriodInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->policies, 0);
}

@end
