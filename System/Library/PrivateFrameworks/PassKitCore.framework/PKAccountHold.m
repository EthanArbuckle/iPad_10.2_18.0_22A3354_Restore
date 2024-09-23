@implementation PKAccountHold

- (PKAccountHold)initWithRecord:(id)a3
{
  id v4;
  PKAccountHold *v5;
  uint64_t v6;
  NSString *identifier;
  __CFString *v8;
  __CFString *v9;
  char v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  char v14;
  __CFString *v15;
  __CFString *v16;
  char v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  __CFString *v21;
  __CFString *v22;
  char v23;
  __CFString *v24;
  __CFString *v25;
  char v26;
  __CFString *v27;
  __CFString *v28;
  char v29;
  __CFString *v30;
  __CFString *v31;
  int v32;
  __CFString *v33;
  __CFString *v34;
  char v35;
  uint64_t v36;
  __CFString *v37;
  __CFString *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  PKCurrencyAmount *v43;
  void *v44;
  uint64_t v45;
  PKCurrencyAmount *currencyAmount;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PKAccountHold;
  v5 = -[PKAccountHold init](&v48, sel_init);
  if (!v5)
    goto LABEL_40;
  objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("holdIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("type"));
  v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == CFSTR("floatHold"))
    goto LABEL_5;
  if (!v8)
    goto LABEL_27;
  v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("floatHold"));

  if ((v10 & 1) != 0)
  {
LABEL_5:
    v11 = 1;
    goto LABEL_28;
  }
  v12 = v9;
  if (v12 == CFSTR("checkHold")
    || (v13 = v12,
        v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("checkHold")),
        v13,
        (v14 & 1) != 0))
  {
    v11 = 2;
    goto LABEL_28;
  }
  v15 = v13;
  if (v15 == CFSTR("exceptionReviewHold")
    || (v16 = v15,
        v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("exceptionReviewHold")),
        v16,
        (v17 & 1) != 0))
  {
    v11 = 3;
    goto LABEL_28;
  }
  v18 = v16;
  if (v18 == CFSTR("childSupportObligationHold")
    || (v19 = v18,
        v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("childSupportObligationHold")),
        v19,
        (v20 & 1) != 0))
  {
    v11 = 4;
    goto LABEL_28;
  }
  v21 = v19;
  if (v21 == CFSTR("permanentHold")
    || (v22 = v21,
        v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("permanentHold")),
        v22,
        (v23 & 1) != 0))
  {
    v11 = 5;
    goto LABEL_28;
  }
  v24 = v22;
  if (v24 == CFSTR("fdicHold")
    || (v25 = v24,
        v26 = -[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("fdicHold")),
        v25,
        (v26 & 1) != 0))
  {
    v11 = 6;
    goto LABEL_28;
  }
  v27 = v25;
  if (v27 == CFSTR("garnishmentHold")
    || (v28 = v27,
        v29 = -[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR("garnishmentHold")),
        v28,
        (v29 & 1) != 0))
  {
    v11 = 7;
    goto LABEL_28;
  }
  v30 = v28;
  if (v30 == CFSTR("provisionalHold")
    || (v31 = v30,
        v32 = -[__CFString isEqualToString:](v30, "isEqualToString:", CFSTR("provisionalHold")),
        v31,
        v32))
  {
    v11 = 8;
  }
  else
  {
LABEL_27:
    v11 = 0;
  }
LABEL_28:

  v5->_type = v11;
  objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("state"));
  v33 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33 == CFSTR("placed"))
  {
LABEL_31:
    v36 = 1;
    goto LABEL_36;
  }
  if (!v33)
    goto LABEL_35;
  v35 = -[__CFString isEqualToString:](v33, "isEqualToString:", CFSTR("placed"));

  if ((v35 & 1) != 0)
    goto LABEL_31;
  v37 = v34;
  if (v37 == CFSTR("removed")
    || (v38 = v37,
        v39 = -[__CFString isEqualToString:](v37, "isEqualToString:", CFSTR("removed")),
        v38,
        v39))
  {
    v36 = 2;
  }
  else
  {
LABEL_35:
    v36 = 0;
  }
LABEL_36:

  v5->_state = v36;
  objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("amount"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("currencyCode"));
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v41;
  if (v40 && v41)
  {
    v43 = [PKCurrencyAmount alloc];
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[PKCurrencyAmount initWithAmount:currency:exponent:](v43, "initWithAmount:currency:exponent:", v44, v42, 0);
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v45;

  }
LABEL_40:

  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  unint64_t type;
  const __CFString *v5;
  unint64_t state;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "encryptedValues");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (PKApplePayContainerEnvironment() == 2)
  {
    objc_msgSend(v12, "setObject:forKey:", self->_identifier, CFSTR("holdIdentifier"));
    type = self->_type;
    if (type > 8)
      v5 = CFSTR("floatHold");
    else
      v5 = off_1E2AD1DD0[type];
    objc_msgSend(v12, "setObject:forKey:", v5, CFSTR("type"));
    state = self->_state;
    v7 = CFSTR("placed");
    if (state == 2)
      v7 = CFSTR("removed");
    if (state)
      v8 = v7;
    else
      v8 = CFSTR("unknown");
    objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("state"));
    -[PKCurrencyAmount amount](self->_currencyAmount, "amount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("amount"));

    -[PKCurrencyAmount currency](self->_currencyAmount, "currency");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("currencyCode"));

  }
}

+ (id)recordType
{
  return CFSTR("AccountHold");
}

+ (id)recordNamePrefix
{
  return CFSTR("hold");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountHold)initWithCoder:(id)a3
{
  id v4;
  PKAccountHold *v5;
  uint64_t v6;
  NSString *identifier;
  NSDecimalNumber *v8;
  NSString *v9;
  uint64_t v10;
  PKCurrencyAmount *currencyAmount;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountHold;
  v5 = -[PKAccountHold init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("holdIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v8, v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  void *v6;
  id v7;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("holdIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  -[PKCurrencyAmount amount](self->_currencyAmount, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("amount"));

  -[PKCurrencyAmount currency](self->_currencyAmount, "currency");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("currencyCode"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  PKCurrencyAmount *currencyAmount;
  PKCurrencyAmount *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (identifier != v6)
  {
    goto LABEL_14;
  }
  currencyAmount = self->_currencyAmount;
  v8 = (PKCurrencyAmount *)v4[4];
  if (!currencyAmount || !v8)
  {
    if (currencyAmount == v8)
      goto LABEL_12;
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
    goto LABEL_14;
LABEL_12:
  if (self->_type != v4[2])
    goto LABEL_14;
  v9 = self->_state == v4[3];
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyAmount);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_state - v5 + 32 * v5;

  return v6;
}

- (NSString)description
{
  void *v3;
  unint64_t type;
  const __CFString *v5;
  unint64_t state;
  const __CFString *v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  type = self->_type;
  if (type > 8)
    v5 = CFSTR("floatHold");
  else
    v5 = off_1E2AD1DD0[type];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);
  state = self->_state;
  v7 = CFSTR("placed");
  if (state == 2)
    v7 = CFSTR("removed");
  if (state)
    v8 = v7;
  else
    v8 = CFSTR("unknown");
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyAmount: '%@'; "), self->_currencyAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
