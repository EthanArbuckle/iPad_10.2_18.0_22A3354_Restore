@implementation PKSecureElementPassField

- (PKSecureElementPassField)initWithPaymentPassFieldDictionary:(id)a3
{
  id v4;
  PKSecureElementPassField *v5;
  uint64_t v6;
  NSString *key;
  uint64_t v8;
  NSSet *foreignReferenceIdentifiers;
  void *v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  v5 = -[PKSecureElementPassField init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("key"));
    v6 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v6;

    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("combinedForeignReferenceIdentifiers"));
    v8 = objc_claimAutoreleasedReturnValue();
    foreignReferenceIdentifiers = v5->_foreignReferenceIdentifiers;
    v5->_foreignReferenceIdentifiers = (NSSet *)v8;

    if (!v5->_foreignReferenceIdentifiers)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("foreignReferenceIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v10, 0);
        v12 = v5->_foreignReferenceIdentifiers;
        v5->_foreignReferenceIdentifiers = (NSSet *)v11;

      }
    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("unitType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v13;
    if (v13)
      v5->_unitType = (int)_PKEnumValueFromString(v13, 0, (uint64_t)CFSTR("PKFieldUnitType"), CFSTR("PKFieldUnitTypeNone, PKFieldUnitTypeDefault, PKFieldUnitTypeRides, PKFieldUnitTypeTickets, PKFieldUnitTypeLoyaltyPoints"), v14, v15, v16, v17, 0xFFFFFFFF);

  }
  return v5;
}

- (PKSecureElementPassField)initWithPassField:(id)a3
{
  id v4;
  PKSecureElementPassField *v5;
  void *v6;
  uint64_t v7;
  NSString *key;
  void *v9;
  uint64_t v10;
  NSSet *foreignReferenceIdentifiers;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSecureElementPassField;
  v5 = -[PKSecureElementPassField init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    key = v5->_key;
    v5->_key = (NSString *)v7;

    objc_msgSend(v4, "foreignReferenceIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    foreignReferenceIdentifiers = v5->_foreignReferenceIdentifiers;
    v5->_foreignReferenceIdentifiers = (NSSet *)v10;

    v5->_unitType = objc_msgSend(v4, "unitType");
  }

  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)foreignReferenceIdentifiers
{
  return self->_foreignReferenceIdentifiers;
}

- (void)setForeignReferenceIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)unitType
{
  return self->_unitType;
}

- (void)setUnitType:(int64_t)a3
{
  self->_unitType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignReferenceIdentifiers, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
