@implementation CountryBillingInput

- (CountryBillingInput)initWithBillingCountry:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8;
  id v9;
  xpc_type_t type;
  const _xpc_type_s *v11;
  id v12;
  NSObject *v13;
  CountryBillingInput *v14;
  CountryBillingInput *v15;
  CountryBillingInput *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *name;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    type = xpc_get_type(v8);
    if (type != (xpc_type_t)&_xpc_type_string)
    {
      v11 = type;
      v12 = sub_10000C5FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[CountryBillingInput initWithBillingCountry:status:process:]";
        v21 = 2080;
        name = xpc_type_get_name(v11);
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Billing country code input is wrong data type: %s", buf, 0x16u);
      }
      v14 = 0;
      goto LABEL_11;
    }
    v13 = _CFXPCCreateCFObjectFromXPCObject(v8);
  }
  else
  {
    v13 = 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)CountryBillingInput;
  v15 = -[EligibilityInput initWithInputType:status:process:](&v18, "initWithInputType:status:process:", 2, a4, v9);
  v16 = v15;
  if (v15)
    objc_storeStrong((id *)&v15->_countryCode, v13);
  self = v16;
  v14 = self;
LABEL_11:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CountryBillingInput;
  v4 = a3;
  -[EligibilityInput encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CountryBillingInput countryCode](self, "countryCode", v6.receiver, v6.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("countryCode"));

}

- (CountryBillingInput)initWithCoder:(id)a3
{
  id v4;
  CountryBillingInput *v5;
  id v6;
  uint64_t v7;
  NSString *countryCode;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CountryBillingInput;
  v5 = -[EligibilityInput initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("countryCode"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v7;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CountryBillingInput;
  v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CountryBillingInput countryCode](self, "countryCode"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setCountryCode:", v7);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CountryBillingInput;
  v3 = -[EligibilityInput hash](&v7, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CountryBillingInput countryCode](self, "countryCode"));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CountryBillingInput *v4;
  uint64_t v5;
  CountryBillingInput *v6;
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

  v4 = (CountryBillingInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)CountryBillingInput;
  if (!-[EligibilityInput isEqual:](&v13, "isEqual:", v4))
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CountryBillingInput countryCode](self, "countryCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CountryBillingInput countryCode](v6, "countryCode"));
    v9 = sub_1000163A4(v7, v8);

    if ((v9 & 1) == 0)
    {
      v10 = sub_10000C5FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[CountryBillingInput isEqual:]";
        v16 = 2080;
        v17 = "countryCode";
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

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CountryBillingInput countryCode](self, "countryCode"));
  v8.receiver = self;
  v8.super_class = (Class)CountryBillingInput;
  v4 = -[EligibilityInput description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[CountryBillingInput countryCode:\"%@\" %@]"), v3, v5));

  return v6;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
