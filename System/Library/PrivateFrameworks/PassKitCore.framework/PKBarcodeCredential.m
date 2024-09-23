@implementation PKBarcodeCredential

- (PKBarcodeCredential)initWithDictionary:(id)a3
{
  id v4;
  PKBarcodeCredential *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSDate *expirationTimestamp;
  PKEncryptedDataObject *v11;
  void *v12;
  uint64_t v13;
  PKEncryptedDataObject *value;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKBarcodeCredential;
  v5 = -[PKBarcodeCredential init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("expirationTimestamp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v8, 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    expirationTimestamp = v5->_expirationTimestamp;
    v5->_expirationTimestamp = (NSDate *)v9;

    v11 = [PKEncryptedDataObject alloc];
    objc_msgSend(v4, "objectForKey:", CFSTR("value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKEncryptedDataObject initWithWebServiceDictionary:](v11, "initWithWebServiceDictionary:", v12);
    value = v5->_value;
    v5->_value = (PKEncryptedDataObject *)v13;

  }
  return v5;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  PKW3CDateStringFromDate(self->_expirationTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("expirationTimestamp"));

  -[PKEncryptedDataObject asWebServiceDictionary](self->_value, "asWebServiceDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("value"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBarcodeCredential)initWithCoder:(id)a3
{
  id v4;
  PKBarcodeCredential *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  PKEncryptedDataObject *value;
  uint64_t v10;
  NSDate *expirationTimestamp;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKBarcodeCredential;
  v5 = -[PKBarcodeCredential init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (PKEncryptedDataObject *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationTimestamp"));
    v10 = objc_claimAutoreleasedReturnValue();
    expirationTimestamp = v5->_expirationTimestamp;
    v5->_expirationTimestamp = (NSDate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationTimestamp, CFSTR("expirationTimestamp"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)expirationTimestamp
{
  return self->_expirationTimestamp;
}

- (void)setExpirationTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKEncryptedDataObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_expirationTimestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
