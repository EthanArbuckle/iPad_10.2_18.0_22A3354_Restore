@implementation PKTransactionCommutePlanUnit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKTransactionCommutePlanUnit *v5;
  uint64_t v6;
  NSString *identifier;
  PKCurrencyAmount *v8;
  PKCurrencyAmount *valueCount;
  uint64_t v10;
  NSString *label;

  v5 = -[PKTransactionCommutePlanUnit init](+[PKTransactionCommutePlanUnit allocWithZone:](PKTransactionCommutePlanUnit, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_planType = self->_planType;
  v8 = -[PKCurrencyAmount copyWithZone:](self->_valueCount, "copyWithZone:", a3);
  valueCount = v5->_valueCount;
  v5->_valueCount = v8;

  v10 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  label = v5->_label;
  v5->_label = (NSString *)v10;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_valueCount, CFSTR("valueCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_planType, CFSTR("planType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));

}

- (PKTransactionCommutePlanUnit)initWithCoder:(id)a3
{
  id v4;
  PKTransactionCommutePlanUnit *v5;
  uint64_t v6;
  PKCurrencyAmount *valueCount;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *label;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionCommutePlanUnit;
  v5 = -[PKTransactionCommutePlanUnit init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueCount"));
    v6 = objc_claimAutoreleasedReturnValue();
    valueCount = v5->_valueCount;
    v5->_valueCount = (PKCurrencyAmount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v5->_planType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("planType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v10 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v10;

  }
  return v5;
}

- (PKTransactionCommutePlanUnit)initWithTimedPlanIdentifier:(id)a3 label:(id)a4
{
  id v7;
  id v8;
  PKTransactionCommutePlanUnit *v9;
  PKTransactionCommutePlanUnit *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKTransactionCommutePlanUnit;
  v9 = -[PKTransactionCommutePlanUnit init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_planType = 0;
    objc_storeStrong((id *)&v10->_label, a4);
  }

  return v10;
}

- (PKTransactionCommutePlanUnit)initWithCountPlanIdentifier:(id)a3 currencyCode:(id)a4 value:(id)a5 label:(id)a6
{
  id v11;
  NSString *v12;
  NSDecimalNumber *v13;
  id v14;
  PKTransactionCommutePlanUnit *v15;
  PKTransactionCommutePlanUnit *v16;
  uint64_t v17;
  PKCurrencyAmount *valueCount;
  objc_super v20;

  v11 = a3;
  v12 = (NSString *)a4;
  v13 = (NSDecimalNumber *)a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKTransactionCommutePlanUnit;
  v15 = -[PKTransactionCommutePlanUnit init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    v16->_planType = 1;
    PKCurrencyAmountCreate(v13, v12, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    valueCount = v16->_valueCount;
    v16->_valueCount = (PKCurrencyAmount *)v17;

    objc_storeStrong((id *)&v16->_label, a6);
  }

  return v16;
}

- (PKTransactionCommutePlanUnit)initWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKTransactionCommutePlanUnit *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("value"));
  objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6 && v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "numberWithInteger:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[PKTransactionCommutePlanUnit initWithCountPlanIdentifier:currencyCode:value:label:](self, "initWithCountPlanIdentifier:currencyCode:value:label:", v8, v6, v9, v7);

      v10 = self;
    }
    else
    {
      self = -[PKTransactionCommutePlanUnit initWithTimedPlanIdentifier:label:](self, "initWithTimedPlanIdentifier:label:", v8, v7);
      v10 = self;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  unint64_t planType;
  void *v4;
  NSString *identifier;
  NSString *label;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  planType = self->_planType;
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (planType == 1)
  {
    identifier = self->_identifier;
    label = self->_label;
    -[PKCurrencyAmount currency](self->_valueCount, "currency");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCurrencyAmount amount](self->_valueCount, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Plan Type: %@, Identifier: %@, Label: %@, Currency: %@, Value: %ld"), CFSTR("count plan"), identifier, label, v7, objc_msgSend(v8, "integerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (planType)
      v10 = CFSTR("unknown plan");
    else
      v10 = CFSTR("timed plan");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Plan Type: %@, Identifier: %@, Label: %@"), v10, self->_identifier, self->_label);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *label;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  -[PKCurrencyAmount currency](self->_valueCount, "currency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("currencyCode"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PKCurrencyAmount amount](self->_valueCount, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("value"));

  label = self->_label;
  if (label)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", label, CFSTR("label"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_valueCount);
  objc_msgSend(v3, "safelyAddObject:", self->_label);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_planType - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  NSString *label;
  void *v13;
  NSString *v14;
  NSString *v15;
  unint64_t planType;
  PKCurrencyAmount *valueCount;
  uint64_t v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = identifier;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {

    }
    else
    {
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
      {
        v14 = v8;
        goto LABEL_23;
      }
      v11 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (!v11)
      {
        LOBYTE(v10) = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    label = self->_label;
    objc_msgSend(v4, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = label;
    v15 = v13;
    v7 = v15;
    if (v14 == v15)
    {

    }
    else
    {
      if (!v14 || !v15)
      {

        LOBYTE(v10) = 0;
        goto LABEL_23;
      }
      v10 = -[NSString isEqualToString:](v14, "isEqualToString:", v15);

      if (!v10)
        goto LABEL_24;
    }
    planType = self->_planType;
    if (planType != objc_msgSend(v4, "planType"))
    {
      LOBYTE(v10) = 0;
LABEL_24:

      goto LABEL_25;
    }
    valueCount = self->_valueCount;
    objc_msgSend(v4, "valueCount");
    v18 = objc_claimAutoreleasedReturnValue();
    v14 = (NSString *)v18;
    if (valueCount && v18)
      LOBYTE(v10) = -[PKCurrencyAmount isEqual:](valueCount, "isEqual:", v18);
    else
      LOBYTE(v10) = valueCount == (PKCurrencyAmount *)v18;
LABEL_23:

    goto LABEL_24;
  }
  LOBYTE(v10) = 0;
LABEL_26:

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)planType
{
  return self->_planType;
}

- (PKCurrencyAmount)valueCount
{
  return self->_valueCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueCount, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
