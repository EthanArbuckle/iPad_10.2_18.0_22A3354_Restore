@implementation PKPeerPaymentRecipient

+ (PKPeerPaymentRecipient)recipientWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return (PKPeerPaymentRecipient *)v5;
}

- (PKPeerPaymentRecipient)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentRecipient *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *receiveCurrency;
  void *v15;
  uint64_t v16;
  NSDecimalNumber *minimumReceiveAmount;
  void *v18;
  uint64_t v19;
  NSDecimalNumber *maximumReceiveAmount;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDate *cacheUntil;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPeerPaymentRecipient;
  v5 = -[PKPeerPaymentRecipient init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("recipientStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKPeerPaymentRecipientStatusFromString(v6);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("recipientStatusReason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_statusReason = PKPeerPaymentRecipientStatusReasonFromString(v7);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("recipientIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v9;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("receiveMethod"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_receiveMethod = objc_msgSend(CFSTR("iMessage"), "isEqualToString:", v11);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("receiveCurrency"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    receiveCurrency = v5->_receiveCurrency;
    v5->_receiveCurrency = (NSString *)v13;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("minimumReceiveAmount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      minimumReceiveAmount = v5->_minimumReceiveAmount;
      v5->_minimumReceiveAmount = (NSDecimalNumber *)v16;
    }
    else
    {
      minimumReceiveAmount = v5->_minimumReceiveAmount;
      v5->_minimumReceiveAmount = 0;
    }

    objc_msgSend(v4, "PKStringForKey:", CFSTR("maximumReceiveAmount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      maximumReceiveAmount = v5->_maximumReceiveAmount;
      v5->_maximumReceiveAmount = (NSDecimalNumber *)v19;
    }
    else
    {
      maximumReceiveAmount = v5->_maximumReceiveAmount;
      v5->_maximumReceiveAmount = 0;
    }

    objc_msgSend(v4, "PKNumberForKey:", CFSTR("allowsFormalPaymentRequests"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
      v21 = (void *)MEMORY[0x1E0C9AAB0];
    v5->_allowsFormalPaymentRequests = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "PKDateForKey:", CFSTR("cacheUntil"));
    v23 = objc_claimAutoreleasedReturnValue();
    cacheUntil = v5->_cacheUntil;
    v5->_cacheUntil = (NSDate *)v23;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 24) = self->_status;
  *(_QWORD *)(v5 + 32) = self->_statusReason;
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_QWORD *)(v5 + 40) = self->_receiveMethod;
  v8 = -[NSString copyWithZone:](self->_receiveCurrency, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_minimumReceiveAmount, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_maximumReceiveAmount, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  *(_BYTE *)(v5 + 8) = self->_allowsFormalPaymentRequests;
  v14 = -[NSDate copyWithZone:](self->_cacheUntil, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  v16 = -[NSString copyWithZone:](self->_phoneOrEmail, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v16;

  v18 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v18;

  return (id)v5;
}

- (id)cacheableCopy
{
  id v2;

  v2 = -[PKPeerPaymentRecipient copyWithZone:](self, "copyWithZone:", 0);
  objc_msgSend(v2, "setPhoneOrEmail:", 0);
  objc_msgSend(v2, "setDisplayName:", 0);
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRecipient)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentRecipient *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *receiveCurrency;
  uint64_t v12;
  NSDecimalNumber *minimumReceiveAmount;
  uint64_t v14;
  NSDecimalNumber *maximumReceiveAmount;
  uint64_t v16;
  NSDate *cacheUntil;
  uint64_t v18;
  NSString *phoneOrEmail;
  uint64_t v20;
  NSString *displayName;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentRecipient;
  v5 = -[PKPeerPaymentRecipient init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKPeerPaymentRecipientStatusFromString(v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientStatusReason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_statusReason = PKPeerPaymentRecipientStatusReasonFromString(v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v5->_receiveMethod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("receiveMethod"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiveCurrency"));
    v10 = objc_claimAutoreleasedReturnValue();
    receiveCurrency = v5->_receiveCurrency;
    v5->_receiveCurrency = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumReceiveAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    minimumReceiveAmount = v5->_minimumReceiveAmount;
    v5->_minimumReceiveAmount = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumReceiveAmount"));
    v14 = objc_claimAutoreleasedReturnValue();
    maximumReceiveAmount = v5->_maximumReceiveAmount;
    v5->_maximumReceiveAmount = (NSDecimalNumber *)v14;

    v5->_allowsFormalPaymentRequests = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsFormalPaymentRequests"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheUntil"));
    v16 = objc_claimAutoreleasedReturnValue();
    cacheUntil = v5->_cacheUntil;
    v5->_cacheUntil = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneOrEmail"));
    v18 = objc_claimAutoreleasedReturnValue();
    phoneOrEmail = v5->_phoneOrEmail;
    v5->_phoneOrEmail = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v20 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  unint64_t status;
  const __CFString *v6;
  const __CFString *v7;
  unint64_t statusReason;
  const __CFString *v9;
  const __CFString *v10;
  id v11;

  identifier = self->_identifier;
  v11 = a3;
  objc_msgSend(v11, "encodeObject:forKey:", identifier, CFSTR("recipientIdentifier"));
  status = self->_status;
  v6 = CFSTR("unknown");
  if (status == 2)
    v6 = CFSTR("invalid");
  if (status == 1)
    v7 = CFSTR("valid");
  else
    v7 = v6;
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("recipientStatus"));
  statusReason = self->_statusReason;
  v9 = CFSTR("none");
  if (statusReason == 2)
    v9 = CFSTR("notInFamily");
  if (statusReason == 1)
    v10 = CFSTR("accountClosed");
  else
    v10 = v9;
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("recipientStatusReason"));
  objc_msgSend(v11, "encodeInteger:forKey:", self->_receiveMethod, CFSTR("receiveMethod"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_receiveCurrency, CFSTR("receiveCurrency"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_minimumReceiveAmount, CFSTR("minimumReceiveAmount"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_maximumReceiveAmount, CFSTR("maximumReceiveAmount"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_allowsFormalPaymentRequests, CFSTR("allowsFormalPaymentRequests"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_cacheUntil, CFSTR("cacheUntil"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_phoneOrEmail, CFSTR("phoneOrEmail"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_receiveCurrency);
  objc_msgSend(v3, "safelyAddObject:", self->_minimumReceiveAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_maximumReceiveAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_cacheUntil);
  objc_msgSend(v3, "safelyAddObject:", self->_phoneOrEmail);
  objc_msgSend(v3, "safelyAddObject:", self->_displayName);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_status - v4 + 32 * v4;
  v6 = self->_statusReason - v5 + 32 * v5;
  v7 = self->_receiveMethod - v6 + 32 * v6;
  v8 = self->_allowsFormalPaymentRequests - v7 + 32 * v7;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSString *receiveCurrency;
  NSString *v8;
  NSDecimalNumber *minimumReceiveAmount;
  NSDecimalNumber *v10;
  NSDecimalNumber *maximumReceiveAmount;
  NSDecimalNumber *v12;
  NSDate *cacheUntil;
  NSDate *v14;
  NSString *phoneOrEmail;
  NSString *v16;
  NSString *displayName;
  NSString *v18;
  BOOL v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_41;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (identifier != v6)
  {
    goto LABEL_41;
  }
  receiveCurrency = self->_receiveCurrency;
  v8 = (NSString *)v4[6];
  if (receiveCurrency && v8)
  {
    if ((-[NSString isEqual:](receiveCurrency, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (receiveCurrency != v8)
  {
    goto LABEL_41;
  }
  minimumReceiveAmount = self->_minimumReceiveAmount;
  v10 = (NSDecimalNumber *)v4[7];
  if (minimumReceiveAmount && v10)
  {
    if ((-[NSDecimalNumber isEqual:](minimumReceiveAmount, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (minimumReceiveAmount != v10)
  {
    goto LABEL_41;
  }
  maximumReceiveAmount = self->_maximumReceiveAmount;
  v12 = (NSDecimalNumber *)v4[8];
  if (maximumReceiveAmount && v12)
  {
    if ((-[NSDecimalNumber isEqual:](maximumReceiveAmount, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (maximumReceiveAmount != v12)
  {
    goto LABEL_41;
  }
  cacheUntil = self->_cacheUntil;
  v14 = (NSDate *)v4[9];
  if (cacheUntil && v14)
  {
    if ((-[NSDate isEqual:](cacheUntil, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (cacheUntil != v14)
  {
    goto LABEL_41;
  }
  phoneOrEmail = self->_phoneOrEmail;
  v16 = (NSString *)v4[10];
  if (phoneOrEmail && v16)
  {
    if ((-[NSString isEqual:](phoneOrEmail, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (phoneOrEmail != v16)
  {
    goto LABEL_41;
  }
  displayName = self->_displayName;
  v18 = (NSString *)v4[11];
  if (!displayName || !v18)
  {
    if (displayName == v18)
      goto LABEL_37;
LABEL_41:
    v19 = 0;
    goto LABEL_42;
  }
  if ((-[NSString isEqual:](displayName, "isEqual:") & 1) == 0)
    goto LABEL_41;
LABEL_37:
  if (self->_status != v4[3] || self->_statusReason != v4[4] || self->_receiveMethod != v4[5])
    goto LABEL_41;
  v19 = self->_allowsFormalPaymentRequests == *((unsigned __int8 *)v4 + 8);
LABEL_42:

  return v19;
}

- (id)description
{
  void *v3;
  unint64_t status;
  const __CFString *v5;
  const __CFString *v6;
  unint64_t statusReason;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  status = self->_status;
  v5 = CFSTR("invalid");
  if (status != 2)
    v5 = CFSTR("unknown");
  if (status == 1)
    v6 = CFSTR("valid");
  else
    v6 = v5;
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v6);
  statusReason = self->_statusReason;
  v8 = CFSTR("none");
  if (statusReason == 2)
    v8 = CFSTR("notInFamily");
  if (statusReason == 1)
    v9 = CFSTR("accountClosed");
  else
    v9 = v8;
  objc_msgSend(v3, "appendFormat:", CFSTR("statusReason: '%@'; "), v9);
  if (self->_receiveMethod == 1)
    v10 = CFSTR("iMessage");
  else
    v10 = CFSTR("unknown");
  objc_msgSend(v3, "appendFormat:", CFSTR("receiveMethod: '%@'; "), v10);
  objc_msgSend(v3, "appendFormat:", CFSTR("receiveCurrency: '%@'; "), self->_receiveCurrency);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumReceiveAmount: '%@'; "), self->_minimumReceiveAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumReceiveAmount: '%@'; "), self->_maximumReceiveAmount);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsFormalPaymentRequests);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("allowsFormalPaymentRequests: '%@'; "), v11);

  objc_msgSend(v3, "appendFormat:", CFSTR("cacheUntil: '%@'; "), self->_cacheUntil);
  objc_msgSend(v3, "appendFormat:", CFSTR("phoneOrEmail: '%@'; "), self->_phoneOrEmail);
  objc_msgSend(v3, "appendFormat:", CFSTR("displayName: '%@'; "), self->_displayName);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)statusReason
{
  return self->_statusReason;
}

- (void)setStatusReason:(unint64_t)a3
{
  self->_statusReason = a3;
}

- (unint64_t)receiveMethod
{
  return self->_receiveMethod;
}

- (void)setReceiveMethod:(unint64_t)a3
{
  self->_receiveMethod = a3;
}

- (NSString)receiveCurrency
{
  return self->_receiveCurrency;
}

- (void)setReceiveCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDecimalNumber)minimumReceiveAmount
{
  return self->_minimumReceiveAmount;
}

- (void)setMinimumReceiveAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDecimalNumber)maximumReceiveAmount
{
  return self->_maximumReceiveAmount;
}

- (void)setMaximumReceiveAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)allowsFormalPaymentRequests
{
  return self->_allowsFormalPaymentRequests;
}

- (void)setAllowsFormalPaymentRequests:(BOOL)a3
{
  self->_allowsFormalPaymentRequests = a3;
}

- (NSDate)cacheUntil
{
  return self->_cacheUntil;
}

- (void)setCacheUntil:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)phoneOrEmail
{
  return self->_phoneOrEmail;
}

- (void)setPhoneOrEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_phoneOrEmail, 0);
  objc_storeStrong((id *)&self->_cacheUntil, 0);
  objc_storeStrong((id *)&self->_maximumReceiveAmount, 0);
  objc_storeStrong((id *)&self->_minimumReceiveAmount, 0);
  objc_storeStrong((id *)&self->_receiveCurrency, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
