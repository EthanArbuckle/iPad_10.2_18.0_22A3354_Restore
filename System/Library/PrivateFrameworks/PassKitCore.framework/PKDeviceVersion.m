@implementation PKDeviceVersion

- (PKDeviceVersion)initWithDictionary:(id)a3
{
  id v4;
  PKDeviceVersion *v5;
  uint64_t v6;
  NSString *deviceClass;
  uint64_t v8;
  NSString *generation;
  uint64_t v10;
  NSString *model;
  void *v12;
  PKDeviceVersion *v13;
  PKDeviceVersion *companion;
  PKDeviceVersion *v15;
  NSObject *v16;
  void *v17;
  id v18;
  const char *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKDeviceVersion;
  v5 = -[PKDeviceVersion init](&v22, sel_init);
  if (!v5)
    goto LABEL_8;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceClass"));
  v6 = objc_claimAutoreleasedReturnValue();
  deviceClass = v5->_deviceClass;
  v5->_deviceClass = (NSString *)v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("generation"));
  v8 = objc_claimAutoreleasedReturnValue();
  generation = v5->_generation;
  v5->_generation = (NSString *)v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("model"));
  v10 = objc_claimAutoreleasedReturnValue();
  model = v5->_model;
  v5->_model = (NSString *)v10;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("companion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = -[PKDeviceVersion initWithDictionary:]([PKDeviceVersion alloc], "initWithDictionary:", v12);
    companion = v5->_companion;
    v5->_companion = v13;

    if (!v5->_companion)
    {
      PKLogFacilityTypeGetObject(0x10uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v24 = v20;
        v25 = 2112;
        v26 = v12;
        v18 = v20;
        v19 = "Invalid companion for %@: %@";
        goto LABEL_13;
      }
LABEL_14:

      v15 = 0;
      goto LABEL_15;
    }
  }
  if (!v5->_deviceClass || !v5->_generation || !v5->_model)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      v25 = 2112;
      v26 = v4;
      v18 = v17;
      v19 = "Invalid %@: %@";
LABEL_13:
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);

      goto LABEL_14;
    }
    goto LABEL_14;
  }

LABEL_8:
  v15 = v5;
LABEL_15:

  return v15;
}

+ (id)fromCurrentDeviceVersion
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  PKDeviceVersion *v14;
  int v16;
  NSObject *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PKDeviceClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProductType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("deviceClass"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("model"));
  v5 = v3;
  v6 = v4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = objc_msgSend(v6, "rangeOfString:", v5);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      PKLogFacilityTypeGetObject(0x10uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412546;
        v17 = v5;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Invalid deviceClass: '%@' for model: '%@'", (uint8_t *)&v16, 0x16u);
      }
      v8 = 0;
    }
    else
    {
      objc_msgSend(v7, "substringFromIndex:", v9 + v10);
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject componentsSeparatedByString:](v11, "componentsSeparatedByString:", CFSTR(","));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v12, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PKLogFacilityTypeGetObject(0x10uLL);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138412546;
          v17 = v11;
          v18 = 2112;
          v19 = v7;
          _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Invalid numeric substring: '%@' for model: '%@'", (uint8_t *)&v16, 0x16u);
        }

        v8 = 0;
      }

    }
  }

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("generation"));
  v14 = -[PKDeviceVersion initWithDictionary:]([PKDeviceVersion alloc], "initWithDictionary:", v2);

  return v14;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceClass, CFSTR("deviceClass"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_generation, CFSTR("generation"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_model, CFSTR("model"));
  -[PKDeviceVersion asDictionary](self->_companion, "asDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("companion"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDeviceVersion)initWithCoder:(id)a3
{
  id v4;
  PKDeviceVersion *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *deviceClass;
  uint64_t v9;
  NSString *generation;
  uint64_t v11;
  NSString *model;
  uint64_t v13;
  PKDeviceVersion *companion;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKDeviceVersion;
  v5 = -[PKDeviceVersion init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("deviceClass"));
    v7 = objc_claimAutoreleasedReturnValue();
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("generation"));
    v9 = objc_claimAutoreleasedReturnValue();
    generation = v5->_generation;
    v5->_generation = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("model"));
    v11 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companion"));
    v13 = objc_claimAutoreleasedReturnValue();
    companion = v5->_companion;
    v5->_companion = (PKDeviceVersion *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKDeviceVersion *companion;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceClass, CFSTR("deviceClass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_generation, CFSTR("generation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("model"));
  companion = self->_companion;
  if (companion)
    objc_msgSend(v5, "encodeObject:forKey:", companion, CFSTR("companion"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKDeviceVersion *v5;
  uint64_t v6;
  NSString *deviceClass;
  uint64_t v8;
  NSString *generation;
  uint64_t v10;
  NSString *model;
  PKDeviceVersion *v12;
  PKDeviceVersion *companion;

  v5 = -[PKDeviceVersion init](+[PKDeviceVersion allocWithZone:](PKDeviceVersion, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_deviceClass, "copyWithZone:", a3);
  deviceClass = v5->_deviceClass;
  v5->_deviceClass = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_generation, "copyWithZone:", a3);
  generation = v5->_generation;
  v5->_generation = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_model, "copyWithZone:", a3);
  model = v5->_model;
  v5->_model = (NSString *)v10;

  v12 = -[PKDeviceVersion copyWithZone:](self->_companion, "copyWithZone:", a3);
  companion = v5->_companion;
  v5->_companion = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKDeviceVersion *v4;
  PKDeviceVersion *v5;
  BOOL v6;

  v4 = (PKDeviceVersion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKDeviceVersion isEqualToDeviceVersion:](self, "isEqualToDeviceVersion:", v5);

  return v6;
}

- (BOOL)isEqualToDeviceVersion:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  BOOL v17;
  PKDeviceVersion *companion;
  PKDeviceVersion *v20;

  v4 = a3;
  v5 = (void *)v4[1];
  v6 = self->_deviceClass;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_20;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_21;
  }
  v11 = (void *)v4[2];
  v6 = self->_generation;
  v12 = v11;
  if (v6 == v12)
  {

  }
  else
  {
    v8 = v12;
    if (!v6 || !v12)
      goto LABEL_20;
    v13 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_21;
  }
  v14 = (void *)v4[3];
  v6 = self->_model;
  v15 = v14;
  if (v6 != v15)
  {
    v8 = v15;
    if (v6 && v15)
    {
      v16 = -[NSString isEqualToString:](v6, "isEqualToString:", v15);

      if (v16)
        goto LABEL_24;
LABEL_21:
      v17 = 0;
      goto LABEL_22;
    }
LABEL_20:

    goto LABEL_21;
  }

LABEL_24:
  companion = self->_companion;
  v20 = (PKDeviceVersion *)v4[4];
  if (companion && v20)
    v17 = -[PKDeviceVersion isEqual:](companion, "isEqual:");
  else
    v17 = companion == v20;
LABEL_22:

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_deviceClass);
  objc_msgSend(v3, "safelyAddObject:", self->_generation);
  objc_msgSend(v3, "safelyAddObject:", self->_model);
  objc_msgSend(v3, "safelyAddObject:", self->_companion);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("deviceClass: '%@'; "), self->_deviceClass);
  objc_msgSend(v3, "appendFormat:", CFSTR("generation: '%@'; "), self->_generation);
  objc_msgSend(v3, "appendFormat:", CFSTR("model: '%@'; "), self->_model);
  objc_msgSend(v3, "appendFormat:", CFSTR("companion: '%@'; "), self->_companion);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (NSString)generation
{
  return self->_generation;
}

- (NSString)model
{
  return self->_model;
}

- (PKDeviceVersion)companion
{
  return self->_companion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_generation, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end
