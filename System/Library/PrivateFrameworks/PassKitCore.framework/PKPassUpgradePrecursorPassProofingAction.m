@implementation PKPassUpgradePrecursorPassProofingAction

- (PKPassUpgradePrecursorPassProofingAction)initWithDictionary:(id)a3
{
  id v4;
  PKPassUpgradePrecursorPassProofingAction *v5;
  uint64_t v6;
  NSString *productIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassUpgradePrecursorPassProofingAction;
  v5 = -[PKPassUpgradePrecursorPassAction initWithDictionary:](&v9, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("productIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassUpgradePrecursorPassProofingAction;
  -[PKPassUpgradePrecursorPassAction asDictionary](&v7, sel_asDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_productIdentifier, CFSTR("productIdentifier"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassUpgradePrecursorPassProofingAction;
  v4 = a3;
  -[PKPassUpgradePrecursorPassAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_productIdentifier, CFSTR("productIdentifier"), v5.receiver, v5.super_class);

}

- (PKPassUpgradePrecursorPassProofingAction)initWithCoder:(id)a3
{
  id v4;
  PKPassUpgradePrecursorPassProofingAction *v5;
  uint64_t v6;
  NSString *productIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassUpgradePrecursorPassProofingAction;
  v5 = -[PKPassUpgradePrecursorPassAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIdentifier, 0);
}

@end
