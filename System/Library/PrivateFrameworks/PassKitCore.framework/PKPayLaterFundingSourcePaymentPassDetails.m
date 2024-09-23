@implementation PKPayLaterFundingSourcePaymentPassDetails

- (PKPayLaterFundingSourcePaymentPassDetails)initWithDictionary:(id)a3 type:(unint64_t)a4
{
  id v6;
  PKPayLaterFundingSourcePaymentPassDetails *v7;
  PKPayLaterFundingSourcePaymentPassDetails *v8;
  uint64_t v9;
  NSString *dpanIdentifier;
  uint64_t v11;
  NSString *fpanIdentifier;
  uint64_t v13;
  NSString *cardName;
  uint64_t v15;
  NSString *cardSuffix;
  void *v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterFundingSourcePaymentPassDetails;
  v7 = -[PKPayLaterFundingSourcePaymentPassDetails init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a4;
    objc_msgSend(v6, "PKStringForKey:", CFSTR("dpanIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v8->_dpanIdentifier;
    v8->_dpanIdentifier = (NSString *)v9;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("fpanIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    fpanIdentifier = v8->_fpanIdentifier;
    v8->_fpanIdentifier = (NSString *)v11;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("cardName"));
    v13 = objc_claimAutoreleasedReturnValue();
    cardName = v8->_cardName;
    v8->_cardName = (NSString *)v13;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("cardSuffix"));
    v15 = objc_claimAutoreleasedReturnValue();
    cardSuffix = v8->_cardSuffix;
    v8->_cardSuffix = (NSString *)v15;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("cardType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_cardType = PKPayLaterFundingSourceCardTypeFromString(v17);

    objc_msgSend(v6, "PKStringForKey:", CFSTR("cardNetwork"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_cardNetwork = PKPaymentCredentialTypeForPaymentNetworkName(v18);

  }
  return v8;
}

- (PKPayLaterFundingSourcePaymentPassDetails)initWithPaymentPass:(id)a3 paymentApplication:(id)a4
{
  id v6;
  id v7;
  PKPayLaterFundingSourcePaymentPassDetails *v8;
  PKPayLaterFundingSourcePaymentPassDetails *v9;
  uint64_t v10;
  NSString *fpanIdentifier;
  uint64_t v12;
  NSString *dpanIdentifier;
  uint64_t v14;
  NSString *cardSuffix;
  uint64_t v16;
  NSString *cardName;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterFundingSourcePaymentPassDetails;
  v8 = -[PKPayLaterFundingSourcePaymentPassDetails init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = 1;
    objc_msgSend(v6, "primaryAccountIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    fpanIdentifier = v9->_fpanIdentifier;
    v9->_fpanIdentifier = (NSString *)v10;

    objc_msgSend(v7, "dpanIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v9->_dpanIdentifier;
    v9->_dpanIdentifier = (NSString *)v12;

    objc_msgSend(v6, "primaryAccountNumberSuffix");
    v14 = objc_claimAutoreleasedReturnValue();
    cardSuffix = v9->_cardSuffix;
    v9->_cardSuffix = (NSString *)v14;

    objc_msgSend(v6, "localizedDescription");
    v16 = objc_claimAutoreleasedReturnValue();
    cardName = v9->_cardName;
    v9->_cardName = (NSString *)v16;

    v18 = objc_msgSend(v7, "paymentType");
    v19 = 2 * (v18 == 2);
    if (v18 == 1)
      v19 = 1;
    v9->_cardType = v19;
    v9->_cardNetwork = objc_msgSend(v7, "paymentNetworkIdentifier");
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3;
  unint64_t cardType;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_dpanIdentifier, CFSTR("dpanIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_fpanIdentifier, CFSTR("fpanIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_cardName, CFSTR("cardName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_cardSuffix, CFSTR("cardSuffix"));
  cardType = self->_cardType;
  if (cardType > 2)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2ADA5E0[cardType];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cardType"));
  PKPaymentNetworkNameForPaymentCredentialType(self->_cardNetwork);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cardNetwork"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFundingSourcePaymentPassDetails *v4;
  PKPayLaterFundingSourcePaymentPassDetails *v5;
  BOOL v6;

  v4 = (PKPayLaterFundingSourcePaymentPassDetails *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterFundingSourcePaymentPassDetails isEqualToDetails:](self, "isEqualToDetails:", v5);

  return v6;
}

- (BOOL)isEqualToDetails:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  BOOL v20;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_26;
  v6 = (void *)v4[2];
  v7 = self->_dpanIdentifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_25;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_26;
  }
  v11 = (void *)v5[3];
  v7 = self->_fpanIdentifier;
  v12 = v11;
  if (v7 == v12)
  {

  }
  else
  {
    v9 = v12;
    if (!v7 || !v12)
      goto LABEL_25;
    v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_26;
  }
  v14 = (void *)v5[6];
  v7 = self->_cardName;
  v15 = v14;
  if (v7 == v15)
  {

  }
  else
  {
    v9 = v15;
    if (!v7 || !v15)
      goto LABEL_25;
    v16 = -[NSString isEqualToString:](v7, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_26;
  }
  v17 = (void *)v5[7];
  v7 = self->_cardSuffix;
  v18 = v17;
  if (v7 != v18)
  {
    v9 = v18;
    if (v7 && v18)
    {
      v19 = -[NSString isEqualToString:](v7, "isEqualToString:", v18);

      if (!v19)
        goto LABEL_26;
      goto LABEL_29;
    }
LABEL_25:

    goto LABEL_26;
  }

LABEL_29:
  if (self->_cardNetwork == v5[4] && self->_cardType == v5[5])
  {
    v20 = self->_type == v5[1];
    goto LABEL_27;
  }
LABEL_26:
  v20 = 0;
LABEL_27:

  return v20;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_dpanIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_fpanIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_cardName);
  objc_msgSend(v3, "safelyAddObject:", self->_cardSuffix);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_cardNetwork - v4 + 32 * v4;
  v6 = self->_cardType - v5 + 32 * v5;
  v7 = self->_type - v6 + 32 * v6;

  return v7;
}

- (NSString)description
{
  id v3;
  unint64_t cardType;
  const __CFString *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("dpanIdentifier: '%@'; "), self->_dpanIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("fpanIdentifier: '%@'; "), self->_fpanIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("cardName: '%@'; "), self->_cardName);
  objc_msgSend(v3, "appendFormat:", CFSTR("cardSuffix: '%@'; "), self->_cardSuffix);
  cardType = self->_cardType;
  if (cardType > 2)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2ADA5E0[cardType];
  objc_msgSend(v3, "appendFormat:", CFSTR("cardType: '%@'; "), v5);
  PKPaymentNetworkNameForPaymentCredentialType(self->_cardNetwork);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("cardNetwork: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFundingSourcePaymentPassDetails)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFundingSourcePaymentPassDetails *v5;
  uint64_t v6;
  NSString *dpanIdentifier;
  uint64_t v8;
  NSString *fpanIdentifier;
  uint64_t v10;
  NSString *cardSuffix;
  uint64_t v12;
  NSString *cardName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFundingSourcePaymentPassDetails;
  v5 = -[PKPayLaterFundingSourcePaymentPassDetails init](&v15, sel_init);
  if (v5)
  {
    -[PKPayLaterFundingSourcePaymentPassDetails setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dpanIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fpanIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardSuffix"));
    v10 = objc_claimAutoreleasedReturnValue();
    cardSuffix = v5->_cardSuffix;
    v5->_cardSuffix = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardName"));
    v12 = objc_claimAutoreleasedReturnValue();
    cardName = v5->_cardName;
    v5->_cardName = (NSString *)v12;

    v5->_cardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardType"));
    v5->_cardNetwork = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardNetwork"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dpanIdentifier, CFSTR("dpanIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fpanIdentifier, CFSTR("fpanIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardSuffix, CFSTR("cardSuffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardName, CFSTR("cardName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cardType, CFSTR("cardType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cardNetwork, CFSTR("cardNetwork"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterFundingSourcePaymentPassDetails *v5;
  uint64_t v6;
  NSString *dpanIdentifier;
  uint64_t v8;
  NSString *fpanIdentifier;
  uint64_t v10;
  NSString *cardSuffix;
  uint64_t v12;
  NSString *cardName;

  v5 = -[PKPayLaterFundingSourcePaymentPassDetails init](+[PKPayLaterFundingSourcePaymentPassDetails allocWithZone:](PKPayLaterFundingSourcePaymentPassDetails, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_dpanIdentifier, "copyWithZone:", a3);
  dpanIdentifier = v5->_dpanIdentifier;
  v5->_dpanIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_fpanIdentifier, "copyWithZone:", a3);
  fpanIdentifier = v5->_fpanIdentifier;
  v5->_fpanIdentifier = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_cardSuffix, "copyWithZone:", a3);
  cardSuffix = v5->_cardSuffix;
  v5->_cardSuffix = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_cardName, "copyWithZone:", a3);
  cardName = v5->_cardName;
  v5->_cardName = (NSString *)v12;

  v5->_cardType = self->_cardType;
  v5->_cardNetwork = self->_cardNetwork;
  v5->_type = self->_type;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFpanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)cardNetwork
{
  return self->_cardNetwork;
}

- (void)setCardNetwork:(int64_t)a3
{
  self->_cardNetwork = a3;
}

- (unint64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(unint64_t)a3
{
  self->_cardType = a3;
}

- (NSString)cardName
{
  return self->_cardName;
}

- (void)setCardName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)cardSuffix
{
  return self->_cardSuffix;
}

- (void)setCardSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSuffix, 0);
  objc_storeStrong((id *)&self->_cardName, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end
