@implementation PKPaymentRewardsRedemption

- (PKPaymentRewardsRedemption)initWithIdentifier:(id)a3 balanceIdentifier:(id)a4 status:(unint64_t)a5 statusLink:(id)a6 paymentHash:(id)a7 lastUpdatedAt:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  PKPaymentRewardsRedemption *v19;
  uint64_t v20;
  NSString *identifier;
  uint64_t v22;
  NSString *balanceIdentifier;
  uint64_t v24;
  NSURL *statusLink;
  uint64_t v26;
  NSString *paymentHash;
  void *v28;
  void *v29;
  NSDate *v30;
  NSDate *lastUpdatedAt;
  NSString *v32;
  PKPaymentRewardsRedemption *v33;
  NSObject *v34;
  NSString *v35;
  objc_super v37;
  uint8_t buf[4];
  NSString *v39;
  __int16 v40;
  NSString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v37.receiver = self;
  v37.super_class = (Class)PKPaymentRewardsRedemption;
  v19 = -[PKPaymentRewardsRedemption init](&v37, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    balanceIdentifier = v19->_balanceIdentifier;
    v19->_balanceIdentifier = (NSString *)v22;

    v19->_status = a5;
    v24 = objc_msgSend(v16, "copy");
    statusLink = v19->_statusLink;
    v19->_statusLink = (NSURL *)v24;

    v26 = objc_msgSend(v17, "copy");
    paymentHash = v19->_paymentHash;
    v19->_paymentHash = (NSString *)v26;

    v28 = (void *)objc_msgSend(v18, "copy");
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v30 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    lastUpdatedAt = v19->_lastUpdatedAt;
    v19->_lastUpdatedAt = v30;

  }
  v32 = v19->_identifier;
  if (v32 && v19->_balanceIdentifier && v19->_statusLink)
  {
    v33 = v19;
  }
  else
  {
    PKLogFacilityTypeGetObject(0x2FuLL);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v19->_balanceIdentifier;
      *(_DWORD *)buf = 138412546;
      v39 = v32;
      v40 = 2112;
      v41 = v35;
      _os_log_impl(&dword_18FC92000, v34, OS_LOG_TYPE_DEFAULT, "Got Invalid Payment Rewards Redemption, with identifier: %@, balanceIdentifier: %@", buf, 0x16u);
    }

    v33 = 0;
  }

  return v33;
}

- (PKPaymentRewardsRedemption)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentRewardsRedemption *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *balanceIdentifier;
  void *v10;
  uint64_t v11;
  NSURL *statusLink;
  uint64_t v13;
  NSString *paymentHash;
  uint64_t v15;
  NSDate *lastUpdatedAt;
  void *v17;
  uint64_t v18;
  NSDate *v19;
  uint64_t v20;
  NSDate *v21;
  PKPaymentRewardsRedemptionDetails *v22;
  PKPaymentRewardsRedemptionDetails *details;
  NSString *v24;
  PKPaymentRewardsRedemption *v25;
  NSObject *v26;
  NSString *v27;
  objc_super v29;
  uint8_t buf[4];
  NSString *v31;
  __int16 v32;
  NSString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentRewardsRedemption;
  v5 = -[PKPaymentRewardsRedemption init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("balanceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    balanceIdentifier = v5->_balanceIdentifier;
    v5->_balanceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("status"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKPaymentRewardsRedemptionStatusFromString(v10);

    objc_msgSend(v4, "PKURLForKey:", CFSTR("statusLink"));
    v11 = objc_claimAutoreleasedReturnValue();
    statusLink = v5->_statusLink;
    v5->_statusLink = (NSURL *)v11;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("paymentHash"));
    v13 = objc_claimAutoreleasedReturnValue();
    paymentHash = v5->_paymentHash;
    v5->_paymentHash = (NSString *)v13;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdatedAt"));
    v15 = objc_claimAutoreleasedReturnValue();
    lastUpdatedAt = v5->_lastUpdatedAt;
    v5->_lastUpdatedAt = (NSDate *)v15;

    if (!v5->_lastUpdatedAt)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("lastUpdatedAt"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PKISO8601DateFromDateStringContainingFractionalSeconds(v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v5->_lastUpdatedAt;
      v5->_lastUpdatedAt = (NSDate *)v18;

      if (!v5->_lastUpdatedAt)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v5->_lastUpdatedAt;
        v5->_lastUpdatedAt = (NSDate *)v20;

      }
    }
    v22 = -[PKPaymentRewardsRedemptionDetails initWithDictionary:]([PKPaymentRewardsRedemptionDetails alloc], "initWithDictionary:", v4);
    details = v5->_details;
    v5->_details = v22;

  }
  v24 = v5->_identifier;
  if (v24 && v5->_balanceIdentifier && v5->_statusLink)
  {
    v25 = v5;
  }
  else
  {
    PKLogFacilityTypeGetObject(0x2FuLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v5->_balanceIdentifier;
      *(_DWORD *)buf = 138412546;
      v31 = v24;
      v32 = 2112;
      v33 = v27;
      _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Got Invalid Payment Rewards Redemption, with identifier: %@, balanceIdentifier: %@", buf, 0x16u);
    }

    v25 = 0;
  }

  return v25;
}

- (id)dictionaryRepresentation
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_balanceIdentifier, CFSTR("balanceIdentifier"));
  v4 = self->_status - 1;
  if (v4 > 5)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2ADDB88[v4];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("status"));
  -[NSURL absoluteString](self->_statusLink, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("statusLink"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_paymentHash, CFSTR("paymentHash"));
  PKW3CDateStringFromDate(self->_lastUpdatedAt);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("lastUpdatedAt"));

  -[PKPaymentRewardsRedemptionDetails dictionaryRepresentation](self->_details, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v8);

  v9 = (void *)objc_msgSend(v3, "copy");
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentRewardsRedemption *v4;
  PKPaymentRewardsRedemption *v5;
  PKPaymentRewardsRedemption *v6;
  NSString *identifier;
  NSString *v8;
  BOOL v9;
  NSString *balanceIdentifier;
  NSString *v11;
  NSURL *statusLink;
  NSURL *v13;
  NSString *paymentHash;
  NSString *v15;
  NSDate *lastUpdatedAt;
  NSDate *v17;
  PKPaymentRewardsRedemptionDetails *details;
  PKPaymentRewardsRedemptionDetails *v19;

  v4 = (PKPaymentRewardsRedemption *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        identifier = self->_identifier;
        v8 = v6->_identifier;
        if (identifier && v8)
        {
          if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
            goto LABEL_36;
        }
        else if (identifier != v8)
        {
          goto LABEL_36;
        }
        balanceIdentifier = self->_balanceIdentifier;
        v11 = v6->_balanceIdentifier;
        if (balanceIdentifier && v11)
        {
          if ((-[NSString isEqual:](balanceIdentifier, "isEqual:") & 1) == 0)
            goto LABEL_36;
        }
        else if (balanceIdentifier != v11)
        {
          goto LABEL_36;
        }
        statusLink = self->_statusLink;
        v13 = v6->_statusLink;
        if (statusLink && v13)
        {
          if ((-[NSURL isEqual:](statusLink, "isEqual:") & 1) == 0)
            goto LABEL_36;
        }
        else if (statusLink != v13)
        {
          goto LABEL_36;
        }
        paymentHash = self->_paymentHash;
        v15 = v6->_paymentHash;
        if (paymentHash && v15)
        {
          if ((-[NSString isEqual:](paymentHash, "isEqual:") & 1) == 0)
            goto LABEL_36;
        }
        else if (paymentHash != v15)
        {
          goto LABEL_36;
        }
        lastUpdatedAt = self->_lastUpdatedAt;
        v17 = v6->_lastUpdatedAt;
        if (lastUpdatedAt && v17)
        {
          if ((-[NSDate isEqual:](lastUpdatedAt, "isEqual:") & 1) == 0)
            goto LABEL_36;
        }
        else if (lastUpdatedAt != v17)
        {
          goto LABEL_36;
        }
        details = self->_details;
        v19 = v6->_details;
        if (details && v19)
        {
          if (-[PKPaymentRewardsRedemptionDetails isEqual:](details, "isEqual:"))
          {
LABEL_34:
            v9 = self->_status == v6->_status;
LABEL_37:

            goto LABEL_38;
          }
        }
        else if (details == v19)
        {
          goto LABEL_34;
        }
LABEL_36:
        v9 = 0;
        goto LABEL_37;
      }
    }
    v9 = 0;
  }
LABEL_38:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_balanceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_statusLink);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentHash);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdatedAt);
  objc_msgSend(v3, "safelyAddObject:", self->_details);
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRewardsRedemption;
  v4 = -[PKPaymentRewardsRedemption hash](&v8, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);
  v6 = self->_status - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const __CFString *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("balanceIdentifier: '%@'; "), self->_balanceIdentifier);
  v4 = self->_status - 1;
  if (v4 > 5)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2ADDB88[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("statusLink: '%@'; "), self->_statusLink);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentHash: '%@'; "), self->_paymentHash);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastFetchedAt: '%@'; "), self->_lastUpdatedAt);
  objc_msgSend(v3, "appendFormat:", CFSTR("details: '%@'; "), self->_details);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentRewardsRedemption)initWithCoder:(id)a3
{
  id v4;
  PKPaymentRewardsRedemption *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *balanceIdentifier;
  uint64_t v10;
  NSURL *statusLink;
  uint64_t v12;
  NSString *paymentHash;
  uint64_t v14;
  NSDate *lastUpdatedAt;
  uint64_t v16;
  PKPaymentRewardsRedemptionDetails *details;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentRewardsRedemption;
  v5 = -[PKPaymentRewardsRedemption init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balanceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    balanceIdentifier = v5->_balanceIdentifier;
    v5->_balanceIdentifier = (NSString *)v8;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusLink"));
    v10 = objc_claimAutoreleasedReturnValue();
    statusLink = v5->_statusLink;
    v5->_statusLink = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentHash"));
    v12 = objc_claimAutoreleasedReturnValue();
    paymentHash = v5->_paymentHash;
    v5->_paymentHash = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedAt"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastUpdatedAt = v5->_lastUpdatedAt;
    v5->_lastUpdatedAt = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("details"));
    v16 = objc_claimAutoreleasedReturnValue();
    details = v5->_details;
    v5->_details = (PKPaymentRewardsRedemptionDetails *)v16;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_balanceIdentifier, CFSTR("balanceIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statusLink, CFSTR("statusLink"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentHash, CFSTR("paymentHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdatedAt, CFSTR("lastUpdatedAt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_details, CFSTR("details"));

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
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_balanceIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v5[3] = self->_status;
  v10 = -[NSURL copyWithZone:](self->_statusLink, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSString copyWithZone:](self->_paymentHash, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[NSDate copyWithZone:](self->_lastUpdatedAt, "copyWithZone:", a3);
  v15 = (void *)v5[6];
  v5[6] = v14;

  v16 = -[PKPaymentRewardsRedemptionDetails copyWithZone:](self->_details, "copyWithZone:", a3);
  v17 = (void *)v5[7];
  v5[7] = v16;

  return v5;
}

- (BOOL)hasOriginalTransactionDetails
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PKPaymentRewardsRedemption details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setOriginalTransactionDetails:(id)a3
{
  PKPaymentRewardsRedemptionDetails *details;
  id v5;
  PKPaymentRewardsRedemptionDetails *v6;
  PKPaymentRewardsRedemptionDetails *v7;
  PKPaymentRewardsRedemptionDetails *v8;

  details = self->_details;
  if (!a3 || details)
  {
    v8 = (PKPaymentRewardsRedemptionDetails *)a3;
    -[PKPaymentRewardsRedemptionDetails setOriginalTransaction:](details, "setOriginalTransaction:", v8);
    v7 = v8;
  }
  else
  {
    v5 = a3;
    v6 = -[PKPaymentRewardsRedemptionDetails initWithIntended:redeemed:originalTransactionDetails:]([PKPaymentRewardsRedemptionDetails alloc], "initWithIntended:redeemed:originalTransactionDetails:", 0, 0, v5);

    v7 = self->_details;
    self->_details = v6;
  }

}

- (BOOL)isInGoodStanding
{
  return self->_statusLink && self->_status - 1 < 3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)balanceIdentifier
{
  return self->_balanceIdentifier;
}

- (void)setBalanceIdentifier:(id)a3
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

- (NSURL)statusLink
{
  return self->_statusLink;
}

- (void)setStatusLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)paymentHash
{
  return self->_paymentHash;
}

- (void)setPaymentHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)lastUpdatedAt
{
  return self->_lastUpdatedAt;
}

- (void)setLastUpdatedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (PKPaymentRewardsRedemptionDetails)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_lastUpdatedAt, 0);
  objc_storeStrong((id *)&self->_paymentHash, 0);
  objc_storeStrong((id *)&self->_statusLink, 0);
  objc_storeStrong((id *)&self->_balanceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
