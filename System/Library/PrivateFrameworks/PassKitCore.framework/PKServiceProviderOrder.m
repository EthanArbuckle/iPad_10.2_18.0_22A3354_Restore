@implementation PKServiceProviderOrder

- (PKServiceProviderOrder)init
{
  PKServiceProviderOrder *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  uint64_t v6;
  NSDictionary *serviceProviderData;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKServiceProviderOrder;
  v2 = -[PKServiceProviderOrder init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    serviceProviderData = v2->_serviceProviderData;
    v2->_serviceProviderData = (NSDictionary *)v6;

    v2->_paymentInstrumentType = 1;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKServiceProviderOrder)initWithCoder:(id)a3
{
  id v4;
  PKServiceProviderOrder *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *itemDescription;
  uint64_t v10;
  NSString *serviceProviderIdentifier;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *serviceProviderData;
  void *v20;
  uint64_t v21;
  NSData *appletValue;
  uint64_t v23;
  NSString *transactionIdentifier;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKServiceProviderOrder;
  v5 = -[PKServiceProviderOrder init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemDescription"));
    v8 = objc_claimAutoreleasedReturnValue();
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceProviderIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    serviceProviderIdentifier = v5->_serviceProviderIdentifier;
    v5->_serviceProviderIdentifier = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("serviceProviderData"));
    v18 = objc_claimAutoreleasedReturnValue();
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentInstrumentType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_paymentInstrumentType = objc_msgSend(CFSTR("Applet"), "isEqualToString:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletValue"));
    v21 = objc_claimAutoreleasedReturnValue();
    appletValue = v5->_appletValue;
    v5->_appletValue = (NSData *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionIdentifier"));
    v23 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  const __CFString *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_itemDescription, CFSTR("itemDescription"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_serviceProviderIdentifier, CFSTR("serviceProviderIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_serviceProviderData, CFSTR("serviceProviderData"));
  if (self->_paymentInstrumentType == 1)
    v5 = CFSTR("Applet");
  else
    v5 = CFSTR("Unknown");
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("paymentInstrumentType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_appletValue, CFSTR("appletValue"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_transactionIdentifier, CFSTR("transactionIdentifier"));

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", identifier, CFSTR("orderId"));
  -[PKServiceProviderOrder _itemDictionary](self, "_itemDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("item"));
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (id)_itemDictionary
{
  void *v3;
  void *v4;
  NSString *itemDescription;
  NSString *serviceProviderIdentifier;
  void *v7;
  void *v8;
  NSString *transactionIdentifier;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  itemDescription = self->_itemDescription;
  if (itemDescription)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", itemDescription, CFSTR("description"));
  serviceProviderIdentifier = self->_serviceProviderIdentifier;
  if (serviceProviderIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", serviceProviderIdentifier, CFSTR("serviceProviderIdentifier"));
  -[PKServiceProviderOrder serviceProviderData](self, "serviceProviderData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("serviceProviderData"));
  -[PKServiceProviderOrder _paymentInstrumentDictionary](self, "_paymentInstrumentDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("paymentInstrument"));
  transactionIdentifier = self->_transactionIdentifier;
  if (transactionIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", transactionIdentifier, CFSTR("transactionIdentifier"));
  v10 = (void *)objc_msgSend(v4, "copy");

  return v10;
}

- (id)_paymentInstrumentDictionary
{
  void *v3;
  void *v4;
  const __CFString *v5;
  NSData *appletValue;
  void *v7;
  NSString *serviceProviderIdentifier;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_paymentInstrumentType == 1)
    v5 = CFSTR("Applet");
  else
    v5 = CFSTR("Unknown");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("type"));
  if (self->_paymentInstrumentType == 1)
  {
    appletValue = self->_appletValue;
    if (appletValue)
    {
      -[NSData hexEncoding](appletValue, "hexEncoding");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("value"));

      serviceProviderIdentifier = self->_serviceProviderIdentifier;
      if (serviceProviderIdentifier)
      {
        -[NSString dataUsingEncoding:](serviceProviderIdentifier, "dataUsingEncoding:", 4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "SHA256Hash");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hexEncoding");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("merchantId"));

      }
    }
  }
  v12 = (void *)objc_msgSend(v4, "copy");

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)serviceProviderIdentifier
{
  return self->_serviceProviderIdentifier;
}

- (void)setServiceProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)serviceProviderData
{
  return self->_serviceProviderData;
}

- (void)setServiceProviderData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)paymentInstrumentType
{
  return self->_paymentInstrumentType;
}

- (void)setPaymentInstrumentType:(unint64_t)a3
{
  self->_paymentInstrumentType = a3;
}

- (NSData)appletValue
{
  return self->_appletValue;
}

- (void)setAppletValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_appletValue, 0);
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
