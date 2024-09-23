@implementation PKAccountAssistanceProgramMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountAssistanceProgramMessage)initWithCoder:(id)a3
{
  id v4;
  PKAccountAssistanceProgramMessage *v5;
  uint64_t v6;
  NSDecimalNumber *pastDue;
  uint64_t v8;
  NSDecimalNumber *chargeOffPreventionAmount;
  uint64_t v10;
  NSDecimalNumber *currentBalance;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountAssistanceProgramMessage;
  v5 = -[PKAccountAssistanceProgramMessage init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pastDue"));
    v6 = objc_claimAutoreleasedReturnValue();
    pastDue = v5->_pastDue;
    v5->_pastDue = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chargeOffPreventionAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    chargeOffPreventionAmount = v5->_chargeOffPreventionAmount;
    v5->_chargeOffPreventionAmount = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *pastDue;
  id v5;

  pastDue = self->_pastDue;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pastDue, CFSTR("pastDue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_chargeOffPreventionAmount, CFSTR("chargeOffPreventionAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBalance, CFSTR("currentBalance"));

}

- (PKAccountAssistanceProgramMessage)initWithRecord:(id)a3
{
  id v4;
  PKAccountAssistanceProgramMessage *v5;
  uint64_t v6;
  NSDecimalNumber *pastDue;
  uint64_t v8;
  NSDecimalNumber *chargeOffPreventionAmount;
  uint64_t v10;
  NSDecimalNumber *currentBalance;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountAssistanceProgramMessage;
  v5 = -[PKAccountAssistanceProgramMessage init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("pastDue"));
    v6 = objc_claimAutoreleasedReturnValue();
    pastDue = v5->_pastDue;
    v5->_pastDue = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("chargeOffPreventionAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    chargeOffPreventionAmount = v5->_chargeOffPreventionAmount;
    v5->_chargeOffPreventionAmount = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("currentBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v10;

  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v4;

  objc_msgSend(a3, "encryptedValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (PKApplePayContainerEnvironment() == 2)
  {
    objc_msgSend(v4, "setObject:forKey:", self->_pastDue, CFSTR("pastDue"));
    objc_msgSend(v4, "setObject:forKey:", self->_chargeOffPreventionAmount, CFSTR("chargeOffPreventionAmount"));
    objc_msgSend(v4, "setObject:forKey:", self->_currentBalance, CFSTR("currentBalance"));
  }

}

+ (id)recordType
{
  return CFSTR("AssistanceProgram");
}

+ (id)recordNamePrefix
{
  return CFSTR("assitance-");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *pastDue;
  NSDecimalNumber *v6;
  NSDecimalNumber *chargeOffPreventionAmount;
  NSDecimalNumber *v8;
  NSDecimalNumber *currentBalance;
  NSDecimalNumber *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  pastDue = self->_pastDue;
  v6 = (NSDecimalNumber *)v4[1];
  if (pastDue && v6)
  {
    if ((-[NSDecimalNumber isEqual:](pastDue, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (pastDue != v6)
  {
    goto LABEL_14;
  }
  chargeOffPreventionAmount = self->_chargeOffPreventionAmount;
  v8 = (NSDecimalNumber *)v4[2];
  if (!chargeOffPreventionAmount || !v8)
  {
    if (chargeOffPreventionAmount == v8)
      goto LABEL_10;
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if ((-[NSDecimalNumber isEqual:](chargeOffPreventionAmount, "isEqual:") & 1) == 0)
    goto LABEL_14;
LABEL_10:
  currentBalance = self->_currentBalance;
  v10 = (NSDecimalNumber *)v4[3];
  if (currentBalance && v10)
    v11 = -[NSDecimalNumber isEqual:](currentBalance, "isEqual:");
  else
    v11 = currentBalance == v10;
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_pastDue);
  objc_msgSend(v3, "safelyAddObject:", self->_chargeOffPreventionAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber description](self->_pastDue, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("pastDue: '%@'; "), v4);

  -[NSDecimalNumber description](self->_chargeOffPreventionAmount, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("chargeOffPreventionAmount: '%@'; "), v5);

  -[NSDecimalNumber description](self->_currentBalance, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (NSDecimalNumber)pastDue
{
  return self->_pastDue;
}

- (void)setPastDue:(id)a3
{
  objc_storeStrong((id *)&self->_pastDue, a3);
}

- (NSDecimalNumber)chargeOffPreventionAmount
{
  return self->_chargeOffPreventionAmount;
}

- (void)setChargeOffPreventionAmount:(id)a3
{
  objc_storeStrong((id *)&self->_chargeOffPreventionAmount, a3);
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_storeStrong((id *)&self->_currentBalance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_chargeOffPreventionAmount, 0);
  objc_storeStrong((id *)&self->_pastDue, 0);
}

@end
