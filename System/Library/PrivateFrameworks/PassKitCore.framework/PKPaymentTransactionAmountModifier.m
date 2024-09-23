@implementation PKPaymentTransactionAmountModifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentTransactionAmountModifier *v5;
  uint64_t v6;
  NSString *typeString;
  uint64_t v8;
  NSString *modifierDescription;
  PKTransactionAmount *v10;
  PKTransactionAmount *amount;

  v5 = -[PKPaymentTransactionAmountModifier init](+[PKPaymentTransactionAmountModifier allocWithZone:](PKPaymentTransactionAmountModifier, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_typeString, "copyWithZone:", a3);
  typeString = v5->_typeString;
  v5->_typeString = (NSString *)v6;

  v5->_type = self->_type;
  v8 = -[NSString copyWithZone:](self->_modifierDescription, "copyWithZone:", a3);
  modifierDescription = v5->_modifierDescription;
  v5->_modifierDescription = (NSString *)v8;

  v5->_order = self->_order;
  v10 = -[PKTransactionAmount copyWithZone:](self->_amount, "copyWithZone:", a3);
  amount = v5->_amount;
  v5->_amount = v10;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *typeString;
  id v5;

  typeString = self->_typeString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", typeString, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modifierDescription, CFSTR("description"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_order, CFSTR("order"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));

}

- (PKPaymentTransactionAmountModifier)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransactionAmountModifier *v5;
  uint64_t v6;
  NSString *typeString;
  uint64_t v8;
  NSString *modifierDescription;
  uint64_t v10;
  PKTransactionAmount *amount;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentTransactionAmountModifier;
  v5 = -[PKPaymentTransactionAmountModifier init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    typeString = v5->_typeString;
    v5->_typeString = (NSString *)v6;

    v5->_type = PKPaymentTransactionAmountModifierTypeFromString(v5->_typeString);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
    v8 = objc_claimAutoreleasedReturnValue();
    modifierDescription = v5->_modifierDescription;
    v5->_modifierDescription = (NSString *)v8;

    v5->_order = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("order"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v10 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (PKTransactionAmount *)v10;

  }
  return v5;
}

- (PKPaymentTransactionAmountModifier)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentTransactionAmountModifier *v5;
  uint64_t v6;
  NSString *typeString;
  uint64_t v8;
  NSString *modifierDescription;
  void *v10;
  PKTransactionAmount *v11;
  PKTransactionAmount *amount;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentTransactionAmountModifier;
  v5 = -[PKPaymentTransactionAmountModifier init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    typeString = v5->_typeString;
    v5->_typeString = (NSString *)v6;

    v5->_type = PKPaymentTransactionAmountModifierTypeFromString(v5->_typeString);
    objc_msgSend(v4, "PKStringForKey:", CFSTR("description"));
    v8 = objc_claimAutoreleasedReturnValue();
    modifierDescription = v5->_modifierDescription;
    v5->_modifierDescription = (NSString *)v8;

    v5->_order = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("amount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKTransactionAmount initWithDictionary:]([PKTransactionAmount alloc], "initWithDictionary:", v10);
    amount = v5->_amount;
    v5->_amount = v11;

  }
  return v5;
}

- (void)setTypeString:(id)a3
{
  id v5;
  int64_t v6;

  objc_storeStrong((id *)&self->_typeString, a3);
  v5 = a3;
  v6 = PKPaymentTransactionAmountModifierTypeFromString(self->_typeString);

  self->_type = v6;
}

- (void)setType:(int64_t)a3
{
  const __CFString *v3;

  if (a3 == 1)
    v3 = CFSTR("discount");
  else
    v3 = CFSTR("unknown");
  -[PKPaymentTransactionAmountModifier setTypeString:](self, "setTypeString:", v3);
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_typeString, CFSTR("type"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_modifierDescription, CFSTR("description"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_order);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("order"));

  -[PKTransactionAmount dictionaryRepresentation](self->_amount, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("amount"));

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_typeString);
  objc_msgSend(v3, "safelyAddObject:", self->_modifierDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_order - v4 + 32 * v4;
  v6 = self->_type - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentTransactionAmountModifier *v4;
  PKPaymentTransactionAmountModifier *v5;
  BOOL v6;

  v4 = (PKPaymentTransactionAmountModifier *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentTransactionAmountModifier isEqualToPaymentTransactionAmountModifier:](self, "isEqualToPaymentTransactionAmountModifier:", v5);

  return v6;
}

- (BOOL)isEqualToPaymentTransactionAmountModifier:(id)a3
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
  PKTransactionAmount *amount;
  PKTransactionAmount *v15;
  BOOL v16;

  v4 = a3;
  v5 = (void *)v4[5];
  v6 = self->_typeString;
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
      goto LABEL_14;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_21;
  }
  v11 = (void *)v4[4];
  v6 = self->_modifierDescription;
  v12 = v11;
  if (v6 == v12)
  {

    goto LABEL_16;
  }
  v8 = v12;
  if (!v6 || !v12)
  {
LABEL_14:

LABEL_21:
    v16 = 0;
    goto LABEL_22;
  }
  v13 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

  if (!v13)
    goto LABEL_21;
LABEL_16:
  if (self->_order != v4[2] || self->_type != v4[1])
    goto LABEL_21;
  amount = self->_amount;
  v15 = (PKTransactionAmount *)v4[3];
  if (amount && v15)
    v16 = -[PKTransactionAmount isEqual:](amount, "isEqual:");
  else
    v16 = amount == v15;
LABEL_22:

  return v16;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)order
{
  return self->_order;
}

- (void)setOrder:(int64_t)a3
{
  self->_order = a3;
}

- (PKTransactionAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)modifierDescription
{
  return self->_modifierDescription;
}

- (void)setModifierDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)typeString
{
  return self->_typeString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_modifierDescription, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
