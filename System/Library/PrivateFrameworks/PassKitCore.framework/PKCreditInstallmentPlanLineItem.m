@implementation PKCreditInstallmentPlanLineItem

- (PKCreditInstallmentPlanLineItem)initWithDictionary:(id)a3
{
  id v4;
  PKCreditInstallmentPlanLineItem *v5;
  __CFString *v6;
  __CFString *v7;
  char v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  char v12;
  __CFString *v13;
  __CFString *v14;
  char v15;
  __CFString *v16;
  __CFString *v17;
  char v18;
  __CFString *v19;
  __CFString *v20;
  char v21;
  __CFString *v22;
  __CFString *v23;
  int v24;
  uint64_t v25;
  NSDecimalNumber *amount;
  uint64_t v27;
  NSString *itemDescription;
  void *v29;
  uint64_t v30;
  NSString *identifier;
  uint64_t v32;
  NSDecimalNumber *paymentsToDateAmount;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKCreditInstallmentPlanLineItem;
  v5 = -[PKCreditInstallmentPlanLineItem init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 != CFSTR("product"))
    {
      if (v6)
      {
        v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("product"));

        if ((v8 & 1) != 0)
          goto LABEL_5;
        v10 = v7;
        if (v10 == CFSTR("tax")
          || (v11 = v10,
              v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("tax")),
              v11,
              (v12 & 1) != 0))
        {
          v9 = 2;
          goto LABEL_22;
        }
        v13 = v11;
        if (v13 == CFSTR("shipping")
          || (v14 = v13,
              v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("shipping")),
              v14,
              (v15 & 1) != 0))
        {
          v9 = 3;
          goto LABEL_22;
        }
        v16 = v14;
        if (v16 == CFSTR("other")
          || (v17 = v16,
              v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("other")),
              v17,
              (v18 & 1) != 0))
        {
          v9 = 4;
          goto LABEL_22;
        }
        v19 = v17;
        if (v19 == CFSTR("tradeIn")
          || (v20 = v19,
              v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("tradeIn")),
              v20,
              (v21 & 1) != 0))
        {
          v9 = 5;
          goto LABEL_22;
        }
        v22 = v20;
        if (v22 == CFSTR("accessory")
          || (v23 = v22,
              v24 = -[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR("accessory")),
              v23,
              v24))
        {
          v9 = 6;
          goto LABEL_22;
        }
      }
      v9 = 0;
      goto LABEL_22;
    }
LABEL_5:
    v9 = 1;
LABEL_22:

    v5->_type = v9;
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("amount"));
    v25 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v25;

    v5->_duration = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("duration"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("description"));
    v27 = objc_claimAutoreleasedReturnValue();
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v27;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("state"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = PKInstallmentPlanStateFromString(v29);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v30 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v30;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("paymentsToDateAmount"));
    v32 = objc_claimAutoreleasedReturnValue();
    paymentsToDateAmount = v5->_paymentsToDateAmount;
    v5->_paymentsToDateAmount = (NSDecimalNumber *)v32;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKCreditInstallmentPlanLineItem *v4;
  PKCreditInstallmentPlanLineItem *v5;
  BOOL v6;

  v4 = (PKCreditInstallmentPlanLineItem *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCreditInstallmentPlanLineItem isEqualToInstallmentPlanLineItem:](self, "isEqualToInstallmentPlanLineItem:", v5);

  return v6;
}

- (BOOL)isEqualToInstallmentPlanLineItem:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSDecimalNumber *amount;
  NSDecimalNumber *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  _BOOL4 v12;
  void *v13;
  NSString *v14;
  _BOOL4 v15;
  char v16;
  NSDecimalNumber *paymentsToDateAmount;
  NSDecimalNumber *v19;

  v4 = a3;
  v5 = v4;
  if (!v4 || self->_type != v4[1])
    goto LABEL_22;
  amount = self->_amount;
  v7 = (NSDecimalNumber *)v5[2];
  if (amount && v7)
  {
    if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0)
      goto LABEL_22;
  }
  else if (amount != v7)
  {
    goto LABEL_22;
  }
  if (self->_duration != v5[3])
    goto LABEL_22;
  v8 = (void *)v5[4];
  v9 = self->_itemDescription;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
      goto LABEL_21;
    v12 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

    if (!v12)
      goto LABEL_22;
  }
  if (self->_state != v5[5])
    goto LABEL_22;
  v13 = (void *)v5[6];
  v9 = self->_identifier;
  v14 = v13;
  if (v9 != v14)
  {
    v11 = v14;
    if (v9 && v14)
    {
      v15 = -[NSString isEqualToString:](v9, "isEqualToString:", v14);

      if (v15)
        goto LABEL_25;
LABEL_22:
      v16 = 0;
      goto LABEL_23;
    }
LABEL_21:

    goto LABEL_22;
  }

LABEL_25:
  paymentsToDateAmount = self->_paymentsToDateAmount;
  v19 = (NSDecimalNumber *)v5[7];
  if (paymentsToDateAmount && v19)
    v16 = -[NSDecimalNumber isEqual:](paymentsToDateAmount, "isEqual:");
  else
    v16 = paymentsToDateAmount == v19;
LABEL_23:

  return v16;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_itemDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentsToDateAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_duration - v5 + 32 * v5;
  v7 = self->_state - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%ld'; "), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), self->_amount);
  objc_msgSend(v3, "appendFormat:", CFSTR("duration: '%lu'; "), self->_duration);
  objc_msgSend(v3, "appendFormat:", CFSTR("itemDescription: '%@'; "), self->_itemDescription);
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%ld'; "), self->_state);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentsToDateAmount: '%@'; "), self->_paymentsToDateAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditInstallmentPlanLineItem)initWithCoder:(id)a3
{
  id v4;
  PKCreditInstallmentPlanLineItem *v5;
  uint64_t v6;
  NSDecimalNumber *amount;
  uint64_t v8;
  NSString *itemDescription;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSDecimalNumber *paymentsToDateAmount;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCreditInstallmentPlanLineItem;
  v5 = -[PKCreditInstallmentPlanLineItem init](&v15, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    v5->_duration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("duration"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
    v8 = objc_claimAutoreleasedReturnValue();
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v8;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentsToDateAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    paymentsToDateAmount = v5->_paymentsToDateAmount;
    v5->_paymentsToDateAmount = (NSDecimalNumber *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_duration, CFSTR("duration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemDescription, CFSTR("description"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentsToDateAmount, CFSTR("paymentsToDateAmount"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_type;
  v6 = -[NSDecimalNumber copyWithZone:](self->_amount, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[3] = self->_duration;
  v8 = -[NSString copyWithZone:](self->_itemDescription, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v5[5] = self->_state;
  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_paymentsToDateAmount, "copyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDecimalNumber)paymentsToDateAmount
{
  return self->_paymentsToDateAmount;
}

- (void)setPaymentsToDateAmount:(id)a3
{
  objc_storeStrong((id *)&self->_paymentsToDateAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentsToDateAmount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
