@implementation PKPaymentCredentialMetadata

+ (Class)classForValueType:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("text")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("date")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("currency")))
  {
    v4 = (void *)objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

+ (id)paymentCredentialMetadataWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("valueType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_msgSend((id)objc_opt_class(), "classForValueType:", v4);
  if (v5)
  {
    v6 = (void *)objc_msgSend([v5 alloc], "initWithConfiguration:", v3);
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_error_impl(&dword_18FC92000, v7, OS_LOG_TYPE_ERROR, "Could not generate meta data for the value type:%{public}@", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (PKPaymentCredentialMetadata)initWithConfiguration:(id)a3
{
  id v4;
  PKPaymentCredentialMetadata *v5;
  uint64_t v6;
  NSString *localizedDisplayName;
  uint64_t v8;
  NSString *value;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentCredentialMetadata;
  v5 = -[PKPaymentCredentialMetadata init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("localizedDisplayName"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("value"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v8;

    if (!v5->_localizedDisplayName || !v5->_value)
    {

      PKLogFacilityTypeGetObject(6uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Bad config could not create metadata", v12, 2u);
      }

      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentCredentialMetadata *v4;
  BOOL v5;

  v4 = (PKPaymentCredentialMetadata *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKPaymentCredentialMetadata _isEqualToMetadata:](self, "_isEqualToMetadata:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToMetadata:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  char v10;
  _BOOL4 v11;
  void *v12;
  NSString *v13;

  v4 = a3;
  v5 = (void *)v4[1];
  v6 = self->_localizedDisplayName;
  v7 = v5;
  if (v6 == v7)
  {

LABEL_10:
    v12 = (void *)v4[2];
    v6 = self->_value;
    v13 = v12;
    if (v6 == v13)
    {
      v10 = 1;
      v8 = v6;
    }
    else
    {
      v8 = v13;
      v10 = 0;
      if (v6 && v13)
        v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v13);
    }
    goto LABEL_15;
  }
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v11 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v11)
    {
      v10 = 0;
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  v10 = 0;
LABEL_15:

LABEL_16:
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_localizedDisplayName);
  objc_msgSend(v3, "safelyAddObject:", self->_value);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end
