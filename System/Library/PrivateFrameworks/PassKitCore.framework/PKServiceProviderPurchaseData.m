@implementation PKServiceProviderPurchaseData

- (PKServiceProviderPurchaseData)initWithDictionary:(id)a3
{
  id v4;
  PKServiceProviderPurchaseData *v5;
  uint64_t v6;
  NSDictionary *dictionaryRepresentation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKServiceProviderPurchaseData;
  v5 = -[PKServiceProviderPurchaseData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKServiceProviderPurchaseData)initWithCoder:(id)a3
{
  id v4;
  PKServiceProviderPurchaseData *v5;
  uint64_t v6;
  NSDictionary *dictionaryRepresentation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKServiceProviderPurchaseData;
  v5 = -[PKServiceProviderPurchaseData init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dictionary"));
    v6 = objc_claimAutoreleasedReturnValue();
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dictionaryRepresentation, CFSTR("dictionary"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[PKServiceProviderPurchaseData isEqualToPKServiceProviderPurchaseData:](self, "isEqualToPKServiceProviderPurchaseData:", v4);

  return v5;
}

- (BOOL)isEqualToPKServiceProviderPurchaseData:(id)a3
{
  NSDictionary *dictionaryRepresentation;
  void *v4;

  if (self == a3)
    return 1;
  dictionaryRepresentation = self->_dictionaryRepresentation;
  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(dictionaryRepresentation) = -[NSDictionary isEqualToDictionary:](dictionaryRepresentation, "isEqualToDictionary:", v4);

  return (char)dictionaryRepresentation;
}

- (id)description
{
  void *v3;
  NSDictionary *dictionaryRepresentation;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dictionaryRepresentation = self->_dictionaryRepresentation;
  if (dictionaryRepresentation)
  {
    -[NSDictionary description](dictionaryRepresentation, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("dictionary: '%@'; "), v5);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void)setDictionaryRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end
