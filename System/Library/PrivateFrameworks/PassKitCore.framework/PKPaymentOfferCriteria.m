@implementation PKPaymentOfferCriteria

- (PKPaymentOfferCriteria)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferCriteria *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  char v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  uint64_t v16;
  NSString *passSerialNumber;
  uint64_t v18;
  NSString *passTypeIdentifier;
  uint64_t v20;
  NSString *fpanIdentifier;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentOfferCriteria;
  v5 = -[PKPaymentOfferCriteria init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPaymentOfferCriteriaTypeFromString(v8);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("eligibility"));
    v9 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 != CFSTR("eligible"))
    {
      if (v9)
      {
        v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("eligible"));

        if ((v11 & 1) != 0)
          goto LABEL_5;
        v13 = v10;
        if (v13 == CFSTR("notEligible")
          || (v14 = v13,
              v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("notEligible")),
              v14,
              v15))
        {
          v12 = 2;
          goto LABEL_10;
        }
      }
      v12 = 0;
      goto LABEL_10;
    }
LABEL_5:
    v12 = 1;
LABEL_10:

    v5->_eligibility = v12;
    objc_msgSend(v4, "PKStringForKey:", CFSTR("passSerialNumber"));
    v16 = objc_claimAutoreleasedReturnValue();
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v16;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("passTypeIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v18;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("fpanIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v20;

  }
  return v5;
}

+ (id)paymentOfferCritieraWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "PKStringForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && ((objc_msgSend(v3, "PKStringForKey:", CFSTR("type")),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         v6 = PKPaymentOfferCriteriaTypeFromString(v5),
         v5,
         v6 == 1)
     || v6 == 2)
    && (v7 = (objc_class *)objc_opt_class()) != 0)
  {
    v8 = (void *)objc_msgSend([v7 alloc], "initWithDictionary:", v3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)associatedPassUniqueID
{
  NSString *passSerialNumber;
  void *passTypeIdentifier;

  passSerialNumber = self->_passSerialNumber;
  if (passSerialNumber)
  {
    passTypeIdentifier = self->_passTypeIdentifier;
    if (passTypeIdentifier)
    {
      PKGeneratePassUniqueID(passTypeIdentifier, passSerialNumber);
      passTypeIdentifier = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    passTypeIdentifier = 0;
  }
  return passTypeIdentifier;
}

- (BOOL)eligibleWithConfiguration:(id)a3
{
  return -[PKPaymentOfferCriteria eligibleWithConfiguration:ineligibleReason:](self, "eligibleWithConfiguration:ineligibleReason:", a3, 0);
}

- (BOOL)eligibleWithConfiguration:(id)a3 ineligibleReason:(unint64_t *)a4
{
  unint64_t eligibility;

  eligibility = self->_eligibility;
  if (a4)
    *a4 = 2 * (eligibility != 1);
  return eligibility == 1;
}

- (id)dictionaryRepresentation
{
  id v3;
  unint64_t type;
  const __CFString *v5;
  const __CFString *v6;
  unint64_t eligibility;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  type = self->_type;
  v5 = CFSTR("installments");
  if (type != 1)
    v5 = CFSTR("unknown");
  if (type == 2)
    v6 = CFSTR("rewards");
  else
    v6 = v5;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("type"));
  eligibility = self->_eligibility;
  v8 = CFSTR("eligible");
  if (eligibility != 1)
    v8 = CFSTR("unknown");
  if (eligibility == 2)
    v9 = CFSTR("notEligible");
  else
    v9 = v8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("eligibility"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_passSerialNumber, CFSTR("passSerialNumber"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_passTypeIdentifier, CFSTR("passTypeIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_fpanIdentifier, CFSTR("fpanIdentifier"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferCriteria *v4;
  PKPaymentOfferCriteria *v5;
  PKPaymentOfferCriteria *v6;
  NSString *identifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  NSString *passSerialNumber;
  NSString *v13;
  NSString *passTypeIdentifier;
  NSString *v15;
  NSString *fpanIdentifier;
  NSString *v17;
  NSString *v18;

  v4 = (PKPaymentOfferCriteria *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        identifier = v6->_identifier;
        v8 = self->_identifier;
        v9 = identifier;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9)
            goto LABEL_32;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_33;
        }
        if (self->_type != v6->_type || self->_eligibility != v6->_eligibility)
        {
          LOBYTE(v11) = 0;
LABEL_33:

          goto LABEL_34;
        }
        passSerialNumber = v6->_passSerialNumber;
        v8 = self->_passSerialNumber;
        v13 = passSerialNumber;
        if (v8 == v13)
        {

        }
        else
        {
          v10 = v13;
          LOBYTE(v11) = 0;
          if (!v8 || !v13)
            goto LABEL_32;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v13);

          if (!v11)
            goto LABEL_33;
        }
        passTypeIdentifier = v6->_passTypeIdentifier;
        v8 = self->_passTypeIdentifier;
        v15 = passTypeIdentifier;
        if (v8 == v15)
        {

LABEL_27:
          fpanIdentifier = self->_fpanIdentifier;
          v17 = v6->_fpanIdentifier;
          v8 = fpanIdentifier;
          v18 = v17;
          if (v8 == v18)
          {
            LOBYTE(v11) = 1;
            v10 = v8;
          }
          else
          {
            v10 = v18;
            LOBYTE(v11) = 0;
            if (v8 && v18)
              LOBYTE(v11) = -[NSString isEqualToString:](v8, "isEqualToString:", v18);
          }
          goto LABEL_32;
        }
        v10 = v15;
        LOBYTE(v11) = 0;
        if (v8 && v15)
        {
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v15);

          if (!v11)
            goto LABEL_33;
          goto LABEL_27;
        }
LABEL_32:

        goto LABEL_33;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_passSerialNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_passTypeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_fpanIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_eligibility - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3;
  unint64_t type;
  const __CFString *v5;
  const __CFString *v6;
  unint64_t eligibility;
  const __CFString *v8;
  const __CFString *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  type = self->_type;
  v5 = CFSTR("installments");
  if (type != 1)
    v5 = CFSTR("unknown");
  if (type == 2)
    v6 = CFSTR("rewards");
  else
    v6 = v5;
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  eligibility = self->_eligibility;
  v8 = CFSTR("eligible");
  if (eligibility != 1)
    v8 = CFSTR("unknown");
  if (eligibility == 2)
    v9 = CFSTR("notEligible");
  else
    v9 = v8;
  objc_msgSend(v3, "appendFormat:", CFSTR("eligibility: '%@'; "), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("passSerialNumber: '%@'; "), self->_passSerialNumber);
  objc_msgSend(v3, "appendFormat:", CFSTR("passTypeIdentifier: '%@'; "), self->_passTypeIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("fpanIdentifier: '%@'; "), self->_fpanIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferCriteria)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferCriteria *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *passSerialNumber;
  uint64_t v10;
  NSString *passTypeIdentifier;
  uint64_t v12;
  NSString *fpanIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentOfferCriteria;
  v5 = -[PKPaymentOfferCriteria init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_eligibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eligibility"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passSerialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passTypeIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fpanIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eligibility, CFSTR("eligibility"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passSerialNumber, CFSTR("passSerialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passTypeIdentifier, CFSTR("passTypeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fpanIdentifier, CFSTR("fpanIdentifier"));

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
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[3] = self->_type;
  v5[2] = self->_eligibility;
  v8 = -[NSString copyWithZone:](self->_passSerialNumber, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_passTypeIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSString copyWithZone:](self->_fpanIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[6];
  v5[6] = v12;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)eligibility
{
  return self->_eligibility;
}

- (void)setEligibility:(unint64_t)a3
{
  self->_eligibility = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFpanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
