@implementation PKDeviceEnvironment

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDeviceEnvironment;
  return -[PKDeviceEnvironment init](&v3, sel_init);
}

- (PKDeviceEnvironment)initWithCountryCode:(id)a3 deviceLanguage:(id)a4
{
  id v7;
  id v8;
  PKDeviceEnvironment *v9;
  PKDeviceEnvironment *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKDeviceEnvironment;
  v9 = -[PKDeviceEnvironment init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_countryCode, a3);
    objc_storeStrong((id *)&v10->_deviceLanguage, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *countryCode;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  NSString *deviceLanguage;
  void *v13;
  NSString *v14;
  NSString *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    countryCode = self->_countryCode;
    objc_msgSend(v5, "countryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = countryCode;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v8 || !v9)
      {
        v14 = v9;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

      if (!v11)
        goto LABEL_17;
    }
    deviceLanguage = self->_deviceLanguage;
    objc_msgSend(v5, "deviceLanguage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = deviceLanguage;
    v15 = v13;
    v8 = v15;
    if (v14 == v15)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v14 && v15)
        LOBYTE(v11) = -[NSString isEqualToString:](v14, "isEqualToString:", v15);
    }

    goto LABEL_16;
  }
  LOBYTE(v11) = 0;
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "addObject:", self->_countryCode);
  objc_msgSend(v3, "addObject:", self->_deviceLanguage);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)localeDiffersFromEnvironment:(id)a3
{
  id v4;
  NSString *countryCode;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  _BOOL4 v11;
  NSString *v12;
  _BOOL4 v13;
  NSString *deviceLanguage;
  void *v15;
  NSString *v16;

  v4 = a3;
  countryCode = self->_countryCode;
  objc_msgSend(v4, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = countryCode;
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {

LABEL_10:
    deviceLanguage = self->_deviceLanguage;
    objc_msgSend(v4, "deviceLanguage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = deviceLanguage;
    v16 = v15;
    v7 = v16;
    if (v12 == v16)
    {
      LOBYTE(v11) = 0;
    }
    else
    {
      LOBYTE(v11) = 1;
      if (v12 && v16)
        v11 = !-[NSString isEqualToString:](v12, "isEqualToString:", v16);
    }

    goto LABEL_16;
  }
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v13)
    {
      LOBYTE(v11) = 1;
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  LOBYTE(v11) = 1;
  v12 = v8;
LABEL_16:

LABEL_17:
  return v11;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSString)deviceLanguage
{
  return self->_deviceLanguage;
}

- (void)setDeviceLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLanguage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLanguage, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
