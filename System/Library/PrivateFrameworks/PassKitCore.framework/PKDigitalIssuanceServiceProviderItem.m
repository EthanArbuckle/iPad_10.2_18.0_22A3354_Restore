@implementation PKDigitalIssuanceServiceProviderItem

- (PKDigitalIssuanceServiceProviderItem)initWithDictionary:(id)a3
{
  id v4;
  PKDigitalIssuanceServiceProviderItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *localizedDisplayName;
  uint64_t v10;
  NSString *localizedDescription;
  uint64_t v12;
  NSDecimalNumber *amount;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKDigitalIssuanceServiceProviderItem;
  v5 = -[PKDigitalIssuanceServiceProviderItem init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDisplayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v10;

    v5->_unitCount = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("unitCount"));
    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("amount"));
    v12 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v12;

  }
  return v5;
}

- (PKDigitalIssuanceServiceProviderItem)initWithServiceProviderProduct:(id)a3
{
  id v4;
  PKDigitalIssuanceServiceProviderItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *localizedDisplayName;
  uint64_t v10;
  NSString *localizedDescription;
  uint64_t v12;
  NSDecimalNumber *amount;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKDigitalIssuanceServiceProviderItem;
  v5 = -[PKDigitalIssuanceServiceProviderItem init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "localizedDisplayName");
    v8 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v8;

    objc_msgSend(v4, "localizedDescription");
    v10 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v10;

    v5->_unitCount = 0;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithInt:", 0);
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v12;

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (unint64_t)unitCount
{
  return self->_unitCount;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
