@implementation PKDeviceVersionRange

- (PKDeviceVersionRange)initWithDictionary:(id)a3
{
  id v4;
  PKDeviceVersionRange *v5;
  uint64_t v6;
  NSString *minimum;
  uint64_t v8;
  NSString *maximum;
  uint64_t v10;
  NSArray *models;
  void *v12;
  PKDeviceVersionRange *v13;
  PKDeviceVersionRange *companion;
  PKDeviceVersionRange *v15;
  NSObject *v17;
  void *v18;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKDeviceVersionRange;
  v5 = -[PKDeviceVersionRange init](&v20, sel_init);
  if (!v5)
    goto LABEL_8;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("minimum"));
  v6 = objc_claimAutoreleasedReturnValue();
  minimum = v5->_minimum;
  v5->_minimum = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("maximum"));
  v8 = objc_claimAutoreleasedReturnValue();
  maximum = v5->_maximum;
  v5->_maximum = (NSString *)v8;

  objc_msgSend(v4, "PKArrayForKey:", CFSTR("models"));
  v10 = objc_claimAutoreleasedReturnValue();
  models = v5->_models;
  v5->_models = (NSArray *)v10;

  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("companion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = -[PKDeviceVersionRange initWithDictionary:]([PKDeviceVersionRange alloc], "initWithDictionary:", v12);
    companion = v5->_companion;
    v5->_companion = v13;

  }
  if (v5->_minimum || v5->_maximum || v5->_models)
  {

LABEL_8:
    v15 = v5;
    goto LABEL_9;
  }
  PKLogFacilityTypeGetObject(0x10uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v22 = v18;
    v23 = 2112;
    v24 = v4;
    v19 = v18;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Invalid %@: %@", buf, 0x16u);

  }
  v15 = 0;
LABEL_9:

  return v15;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_minimum, CFSTR("minimum"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_maximum, CFSTR("maximum"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_models, CFSTR("models"));
  -[PKDeviceVersionRange asDictionary](self->_companion, "asDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("companion"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDeviceVersionRange)initWithCoder:(id)a3
{
  id v4;
  PKDeviceVersionRange *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *minimum;
  uint64_t v9;
  NSString *maximum;
  void *v11;
  uint64_t v12;
  NSArray *models;
  uint64_t v14;
  PKDeviceVersionRange *companion;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKDeviceVersionRange;
  v5 = -[PKDeviceVersionRange init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("minimum"));
    v7 = objc_claimAutoreleasedReturnValue();
    minimum = v5->_minimum;
    v5->_minimum = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("maximum"));
    v9 = objc_claimAutoreleasedReturnValue();
    maximum = v5->_maximum;
    v5->_maximum = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("models"));
    v12 = objc_claimAutoreleasedReturnValue();
    models = v5->_models;
    v5->_models = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companion"));
    v14 = objc_claimAutoreleasedReturnValue();
    companion = v5->_companion;
    v5->_companion = (PKDeviceVersionRange *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKDeviceVersionRange *companion;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_minimum, CFSTR("minimum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maximum, CFSTR("maximum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_models, CFSTR("models"));
  companion = self->_companion;
  if (companion)
    objc_msgSend(v5, "encodeObject:forKey:", companion, CFSTR("companion"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKDeviceVersionRange *v5;
  uint64_t v6;
  NSString *minimum;
  uint64_t v8;
  NSString *maximum;
  uint64_t v10;
  NSArray *models;
  PKDeviceVersionRange *v12;
  PKDeviceVersionRange *companion;

  v5 = -[PKDeviceVersionRange init](+[PKDeviceVersionRange allocWithZone:](PKDeviceVersionRange, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_minimum, "copyWithZone:", a3);
  minimum = v5->_minimum;
  v5->_minimum = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_maximum, "copyWithZone:", a3);
  maximum = v5->_maximum;
  v5->_maximum = (NSString *)v8;

  v10 = -[NSArray copyWithZone:](self->_models, "copyWithZone:", a3);
  models = v5->_models;
  v5->_models = (NSArray *)v10;

  v12 = -[PKDeviceVersionRange copyWithZone:](self->_companion, "copyWithZone:", a3);
  companion = v5->_companion;
  v5->_companion = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKDeviceVersionRange *v4;
  PKDeviceVersionRange *v5;
  BOOL v6;

  v4 = (PKDeviceVersionRange *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKDeviceVersionRange isEqualToDeviceVersionRange:](self, "isEqualToDeviceVersionRange:", v5);

  return v6;
}

- (BOOL)isEqualToDeviceVersionRange:(id)a3
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
  NSArray *models;
  NSArray *v15;
  PKDeviceVersionRange *companion;
  PKDeviceVersionRange *v17;
  BOOL v18;

  v4 = a3;
  v5 = (void *)v4[1];
  v6 = self->_minimum;
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
      goto LABEL_7;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_23;
  }
  v11 = (void *)v4[2];
  v6 = self->_maximum;
  v12 = v11;
  if (v6 == v12)
  {

    goto LABEL_16;
  }
  v8 = v12;
  if (!v6 || !v12)
  {
LABEL_7:

    goto LABEL_23;
  }
  v13 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

  if (!v13)
    goto LABEL_23;
LABEL_16:
  models = self->_models;
  v15 = (NSArray *)v4[3];
  if (!models || !v15)
  {
    if (models == v15)
      goto LABEL_19;
LABEL_23:
    v18 = 0;
    goto LABEL_24;
  }
  if ((-[NSArray isEqual:](models, "isEqual:") & 1) == 0)
    goto LABEL_23;
LABEL_19:
  companion = self->_companion;
  v17 = (PKDeviceVersionRange *)v4[4];
  if (companion && v17)
    v18 = -[PKDeviceVersionRange isEqual:](companion, "isEqual:");
  else
    v18 = companion == v17;
LABEL_24:

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_minimum);
  objc_msgSend(v3, "safelyAddObject:", self->_maximum);
  objc_msgSend(v3, "safelyAddObject:", self->_models);
  objc_msgSend(v3, "safelyAddObject:", self->_companion);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)_matchesDeviceVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v4 = a3;
  -[PKDeviceVersionRange models](self, "models");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKDeviceVersionRange models](self, "models");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

  }
  else
  {
    v8 = 0;
  }
  -[PKDeviceVersionRange minimum](self, "minimum");
  v9 = objc_claimAutoreleasedReturnValue();

  -[PKDeviceVersionRange maximum](self, "maximum");
  v10 = objc_claimAutoreleasedReturnValue();

  if ((v8 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v4, "generation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (v16 && v9 | v10)
  {
    objc_msgSend(v4, "generation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

    -[PKDeviceVersionRange minimum](self, "minimum");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "integerValue");

    -[PKDeviceVersionRange maximum](self, "maximum");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

    if (!v9 || !v10)
    {
      if (v9)
      {
        if (v18 < v20)
          goto LABEL_20;
      }
      else if (v18 > v22)
      {
        goto LABEL_20;
      }
LABEL_5:
      -[PKDeviceVersionRange companion](self, "companion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v15 = 1;
        goto LABEL_21;
      }
      objc_msgSend(v4, "companion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[PKDeviceVersionRange companion](self, "companion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "companion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "_matchesDeviceVersion:", v14);

        goto LABEL_21;
      }
LABEL_20:
      v15 = 0;
      goto LABEL_21;
    }
    v15 = 0;
    if (v18 >= v20 && v18 <= v22)
      goto LABEL_5;
  }
LABEL_21:

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("minimum: '%@'; "), self->_minimum);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximum: '%@'; "), self->_maximum);
  objc_msgSend(v3, "appendFormat:", CFSTR("models: '%@'; "), self->_models);
  objc_msgSend(v3, "appendFormat:", CFSTR("companion: '%@'; "), self->_companion);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSString)minimum
{
  return self->_minimum;
}

- (NSString)maximum
{
  return self->_maximum;
}

- (NSArray)models
{
  return self->_models;
}

- (PKDeviceVersionRange)companion
{
  return self->_companion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_maximum, 0);
  objc_storeStrong((id *)&self->_minimum, 0);
}

@end
