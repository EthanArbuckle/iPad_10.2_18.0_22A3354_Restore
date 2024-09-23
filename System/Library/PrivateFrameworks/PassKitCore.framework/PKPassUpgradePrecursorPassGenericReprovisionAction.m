@implementation PKPassUpgradePrecursorPassGenericReprovisionAction

- (PKPassUpgradePrecursorPassGenericReprovisionAction)initWithDictionary:(id)a3
{
  id v4;
  PKPassUpgradePrecursorPassGenericReprovisionAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassUpgradePrecursorPassGenericReprovisionAction;
  v5 = -[PKPassUpgradePrecursorPassAction initWithDictionary:](&v8, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("subtype"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_subtype = PKPassUpgradePrecursorPassActionGenericReprovisionSubTypeFromString(v6);

  }
  return v5;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassUpgradePrecursorPassGenericReprovisionAction;
  -[PKPassUpgradePrecursorPassAction asDictionary](&v9, sel_asDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = self->_subtype - 1;
  if (v5 > 4)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD3398[v5];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("subtype"));
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  const __CFString *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassUpgradePrecursorPassGenericReprovisionAction;
  v4 = a3;
  -[PKPassUpgradePrecursorPassAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = self->_subtype - 1;
  if (v5 > 4)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD3398[v5];
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subtype"), v7.receiver, v7.super_class);

}

- (PKPassUpgradePrecursorPassGenericReprovisionAction)initWithCoder:(id)a3
{
  id v4;
  PKPassUpgradePrecursorPassGenericReprovisionAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassUpgradePrecursorPassGenericReprovisionAction;
  v5 = -[PKPassUpgradePrecursorPassAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtype"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_subtype = PKPassUpgradePrecursorPassActionGenericReprovisionSubTypeFromString(v6);

  }
  return v5;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

@end
