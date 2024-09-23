@implementation PKAccountServicingEvent

- (PKAccountServicingEvent)initWithDictionary:(id)a3
{
  id v4;
  PKAccountServicingEvent *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  NSString *v9;
  NSDecimalNumber *v10;
  uint64_t v11;
  PKCurrencyAmount *amount;
  uint64_t v13;
  NSString *activityIdentifier;
  void *v15;
  uint64_t v16;
  NSDate *openDate;
  uint64_t v18;
  NSDate *lastUpdatedDate;
  uint64_t v20;
  NSString *reasonCode;
  uint64_t v22;
  NSString *claimIdentifier;
  uint64_t v24;
  NSArray *linkedCaseIdentifiers;
  PKAccountServicingEventStatusDetails *v26;
  PKAccountServicingEventStatusDetails *statusDetails;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKAccountServicingEvent;
  v5 = -[PKAccountServicingEvent init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("status"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKAccountServicingEventStatusFromString(v8);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("amount"));
    v10 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v10, v9, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v11;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("activityIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    activityIdentifier = v5->_activityIdentifier;
    v5->_activityIdentifier = (NSString *)v13;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("activityType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activityType = PKAccountServicingEventActivityTypeFromString(v15);

    objc_msgSend(v4, "PKDateForKey:", CFSTR("openDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    openDate = v5->_openDate;
    v5->_openDate = (NSDate *)v16;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdatedDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v18;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("reasonCode"));
    v20 = objc_claimAutoreleasedReturnValue();
    reasonCode = v5->_reasonCode;
    v5->_reasonCode = (NSString *)v20;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("claimIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    claimIdentifier = v5->_claimIdentifier;
    v5->_claimIdentifier = (NSString *)v22;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("linkedCaseIdentifiers"));
    v24 = objc_claimAutoreleasedReturnValue();
    linkedCaseIdentifiers = v5->_linkedCaseIdentifiers;
    v5->_linkedCaseIdentifiers = (NSArray *)v24;

    v26 = -[PKAccountServicingEventStatusDetails initWithDictionary:currencyCode:]([PKAccountServicingEventStatusDetails alloc], "initWithDictionary:currencyCode:", v4, v9);
    statusDetails = v5->_statusDetails;
    v5->_statusDetails = v26;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServicingEvent)initWithCoder:(id)a3
{
  id v4;
  PKAccountServicingEvent *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *openDate;
  uint64_t v10;
  NSDate *lastUpdatedDate;
  uint64_t v12;
  NSString *activityIdentifier;
  uint64_t v14;
  PKCurrencyAmount *amount;
  uint64_t v16;
  NSString *reasonCode;
  uint64_t v18;
  NSString *claimIdentifier;
  uint64_t v20;
  NSArray *linkedCaseIdentifiers;
  uint64_t v22;
  PKAccountServicingEventStatusDetails *statusDetails;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKAccountServicingEvent;
  v5 = -[PKAccountServicingEvent init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    openDate = v5->_openDate;
    v5->_openDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v10;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    activityIdentifier = v5->_activityIdentifier;
    v5->_activityIdentifier = (NSString *)v12;

    v5->_activityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activityType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
    v14 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reasonCode"));
    v16 = objc_claimAutoreleasedReturnValue();
    reasonCode = v5->_reasonCode;
    v5->_reasonCode = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("claimIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    claimIdentifier = v5->_claimIdentifier;
    v5->_claimIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("linkedCaseIdentifiers"));
    v20 = objc_claimAutoreleasedReturnValue();
    linkedCaseIdentifiers = v5->_linkedCaseIdentifiers;
    v5->_linkedCaseIdentifiers = (NSArray *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusDetails"));
    v22 = objc_claimAutoreleasedReturnValue();
    statusDetails = v5->_statusDetails;
    v5->_statusDetails = (PKAccountServicingEventStatusDetails *)v22;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_openDate, CFSTR("openDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdatedDate, CFSTR("lastUpdatedDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activityIdentifier, CFSTR("activityIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_activityType, CFSTR("activityType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("currencyAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reasonCode, CFSTR("reasonCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_claimIdentifier, CFSTR("claimIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_linkedCaseIdentifiers, CFSTR("linkedCaseIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statusDetails, CFSTR("statusDetails"));

}

- (PKAccountServicingEvent)initWithRecord:(id)a3
{
  id v4;
  PKAccountServicingEvent *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *openDate;
  uint64_t v10;
  NSDate *lastUpdatedDate;
  NSString *v12;
  NSDecimalNumber *v13;
  uint64_t v14;
  PKCurrencyAmount *amount;
  void *v16;
  uint64_t v17;
  NSString *activityIdentifier;
  void *v19;
  uint64_t v20;
  NSString *reasonCode;
  uint64_t v22;
  NSString *claimIdentifier;
  void *v24;
  uint64_t v25;
  NSArray *linkedCaseIdentifiers;
  PKAccountServicingEventStatusDetails *v27;
  PKAccountServicingEventStatusDetails *statusDetails;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKAccountServicingEvent;
  v5 = -[PKAccountServicingEvent init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("openDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    openDate = v5->_openDate;
    v5->_openDate = (NSDate *)v8;

    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("lastUpdatedDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v10;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("currencyCode"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("amount"));
    v13 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v13, v12, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v14;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("status"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKAccountServicingEventStatusFromString(v16);

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("activityIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    activityIdentifier = v5->_activityIdentifier;
    v5->_activityIdentifier = (NSString *)v17;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("activityType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activityType = PKAccountServicingEventActivityTypeFromString(v19);

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("reasonCode"));
    v20 = objc_claimAutoreleasedReturnValue();
    reasonCode = v5->_reasonCode;
    v5->_reasonCode = (NSString *)v20;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("claimIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    claimIdentifier = v5->_claimIdentifier;
    v5->_claimIdentifier = (NSString *)v22;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_encryptedArrayOfClasses:forKey:", v24, CFSTR("linkedCaseIdentifiers"));
    v25 = objc_claimAutoreleasedReturnValue();
    linkedCaseIdentifiers = v5->_linkedCaseIdentifiers;
    v5->_linkedCaseIdentifiers = (NSArray *)v25;

    v27 = -[PKAccountServicingEventStatusDetails initWithRecord:currencyCode:]([PKAccountServicingEventStatusDetails alloc], "initWithRecord:currencyCode:", v4, v12);
    statusDetails = v5->_statusDetails;
    v5->_statusDetails = v27;

  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  void *v4;
  unint64_t status;
  const __CFString *v6;
  unint64_t activityType;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "encryptedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "setObject:forKey:", self->_openDate, CFSTR("openDate"));
  objc_msgSend(v4, "setObject:forKey:", self->_lastUpdatedDate, CFSTR("lastUpdatedDate"));
  status = self->_status;
  if (status > 7)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2ADC5E8[status];
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("status"));
  objc_msgSend(v4, "setObject:forKey:", self->_activityIdentifier, CFSTR("activityIdentifier"));
  activityType = self->_activityType;
  if (activityType > 5)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2ADC628[activityType];
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("activityType"));
  -[PKCurrencyAmount currency](self->_amount, "currency");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("currencyCode"));

  -[PKCurrencyAmount amount](self->_amount, "amount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("amount"));

  objc_msgSend(v4, "setObject:forKey:", self->_reasonCode, CFSTR("reasonCode"));
  objc_msgSend(v4, "setObject:forKey:", self->_claimIdentifier, CFSTR("claimIdentifier"));
  if (self->_linkedCaseIdentifiers)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", self->_linkedCaseIdentifiers, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithData:encoding:", v13, 4);

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("linkedCaseIdentifiers"));
  }
  -[PKAccountServicingEventStatusDetails encodeWithRecord:](self->_statusDetails, "encodeWithRecord:", v15);

}

+ (id)recordType
{
  return CFSTR("Servicing");
}

+ (id)recordNamePrefix
{
  return CFSTR("servicing-");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSDate *openDate;
  NSDate *v8;
  NSDate *lastUpdatedDate;
  NSDate *v10;
  NSString *activityIdentifier;
  NSString *v12;
  PKCurrencyAmount *amount;
  PKCurrencyAmount *v14;
  NSString *reasonCode;
  NSString *v16;
  NSString *claimIdentifier;
  NSString *v18;
  NSArray *linkedCaseIdentifiers;
  NSArray *v20;
  PKAccountServicingEventStatusDetails *statusDetails;
  PKAccountServicingEventStatusDetails *v22;
  BOOL v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_46;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_46;
  }
  else if (identifier != v6)
  {
    goto LABEL_46;
  }
  openDate = self->_openDate;
  v8 = (NSDate *)v4[5];
  if (openDate && v8)
  {
    if ((-[NSDate isEqual:](openDate, "isEqual:") & 1) == 0)
      goto LABEL_46;
  }
  else if (openDate != v8)
  {
    goto LABEL_46;
  }
  lastUpdatedDate = self->_lastUpdatedDate;
  v10 = (NSDate *)v4[6];
  if (lastUpdatedDate && v10)
  {
    if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0)
      goto LABEL_46;
  }
  else if (lastUpdatedDate != v10)
  {
    goto LABEL_46;
  }
  activityIdentifier = self->_activityIdentifier;
  v12 = (NSString *)v4[4];
  if (activityIdentifier && v12)
  {
    if ((-[NSString isEqual:](activityIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_46;
  }
  else if (activityIdentifier != v12)
  {
    goto LABEL_46;
  }
  amount = self->_amount;
  v14 = (PKCurrencyAmount *)v4[7];
  if (amount && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](amount, "isEqual:"))
      goto LABEL_46;
  }
  else if (amount != v14)
  {
    goto LABEL_46;
  }
  reasonCode = self->_reasonCode;
  v16 = (NSString *)v4[8];
  if (reasonCode && v16)
  {
    if ((-[NSString isEqual:](reasonCode, "isEqual:") & 1) == 0)
      goto LABEL_46;
  }
  else if (reasonCode != v16)
  {
    goto LABEL_46;
  }
  if (self->_activityType != v4[3] || self->_status != v4[2])
    goto LABEL_46;
  claimIdentifier = self->_claimIdentifier;
  v18 = (NSString *)v4[9];
  if (claimIdentifier && v18)
  {
    if ((-[NSString isEqual:](claimIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_46;
  }
  else if (claimIdentifier != v18)
  {
    goto LABEL_46;
  }
  linkedCaseIdentifiers = self->_linkedCaseIdentifiers;
  v20 = (NSArray *)v4[10];
  if (!linkedCaseIdentifiers || !v20)
  {
    if (linkedCaseIdentifiers == v20)
      goto LABEL_42;
LABEL_46:
    v23 = 0;
    goto LABEL_47;
  }
  if ((-[NSArray isEqual:](linkedCaseIdentifiers, "isEqual:") & 1) == 0)
    goto LABEL_46;
LABEL_42:
  statusDetails = self->_statusDetails;
  v22 = (PKAccountServicingEventStatusDetails *)v4[11];
  if (statusDetails && v22)
    v23 = -[PKAccountServicingEventStatusDetails isEqual:](statusDetails, "isEqual:");
  else
    v23 = statusDetails == v22;
LABEL_47:

  return v23;
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
  objc_msgSend(v3, "safelyAddObject:", self->_openDate);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdatedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_activityIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_reasonCode);
  objc_msgSend(v3, "safelyAddObject:", self->_claimIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_linkedCaseIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_statusDetails);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_status - v4 + 32 * v4;
  v6 = self->_activityType - v5 + 32 * v5;

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t status;
  const __CFString *v7;
  unint64_t activityType;
  const __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  -[NSDate description](self->_openDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("openDate: '%@'; "), v4);

  -[NSDate description](self->_lastUpdatedDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdatedDate: '%@'; "), v5);

  status = self->_status;
  if (status > 7)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E2ADC5E8[status];
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("activityIdentifier: '%@'; "), self->_activityIdentifier);
  activityType = self->_activityType;
  if (activityType > 5)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E2ADC628[activityType];
  objc_msgSend(v3, "appendFormat:", CFSTR("activityType: '%@'; "), v9);
  -[PKCurrencyAmount description](self->_amount, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR("reasonCode: '%@'; "), self->_reasonCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("claimIdentifier: '%@'; "), self->_claimIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("linkedCaseIdentifiers: '%@'; "), self->_linkedCaseIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("statusDetails: '%@'; "), self->_statusDetails);
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

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(unint64_t)a3
{
  self->_activityType = a3;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)openDate
{
  return self->_openDate;
}

- (void)setOpenDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)reasonCode
{
  return self->_reasonCode;
}

- (void)setReasonCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)claimIdentifier
{
  return self->_claimIdentifier;
}

- (void)setClaimIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)linkedCaseIdentifiers
{
  return self->_linkedCaseIdentifiers;
}

- (void)setLinkedCaseIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PKAccountServicingEventStatusDetails)statusDetails
{
  return self->_statusDetails;
}

- (void)setStatusDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDetails, 0);
  objc_storeStrong((id *)&self->_linkedCaseIdentifiers, 0);
  objc_storeStrong((id *)&self->_claimIdentifier, 0);
  objc_storeStrong((id *)&self->_reasonCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_openDate, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
