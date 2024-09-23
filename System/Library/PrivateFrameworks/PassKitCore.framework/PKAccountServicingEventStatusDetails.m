@implementation PKAccountServicingEventStatusDetails

- (PKAccountServicingEventStatusDetails)initWithDictionary:(id)a3 currencyCode:(id)a4
{
  id v6;
  NSString *v7;
  PKAccountServicingEventStatusDetails *v8;
  uint64_t v9;
  NSArray *statusReasons;
  uint64_t v11;
  NSDate *customerResponseByDate;
  uint64_t v13;
  NSDate *merchantResponseByDate;
  uint64_t v15;
  NSArray *evidenceDocumentTypes;
  uint64_t v17;
  NSString *resolutionReason;
  NSDecimalNumber *v19;
  uint64_t v20;
  PKCurrencyAmount *partiallyApprovedAmount;
  uint64_t v22;
  NSDate *resolutionDate;
  objc_super v25;

  v6 = a3;
  v7 = (NSString *)a4;
  v25.receiver = self;
  v25.super_class = (Class)PKAccountServicingEventStatusDetails;
  v8 = -[PKAccountServicingEventStatusDetails init](&v25, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("statusReasonCodes"));
    v9 = objc_claimAutoreleasedReturnValue();
    statusReasons = v8->_statusReasons;
    v8->_statusReasons = (NSArray *)v9;

    objc_msgSend(v6, "PKDateForKey:", CFSTR("customerResponseByDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    customerResponseByDate = v8->_customerResponseByDate;
    v8->_customerResponseByDate = (NSDate *)v11;

    objc_msgSend(v6, "PKDateForKey:", CFSTR("merchantResponseByDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    merchantResponseByDate = v8->_merchantResponseByDate;
    v8->_merchantResponseByDate = (NSDate *)v13;

    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("evidenceDocumentTypes"));
    v15 = objc_claimAutoreleasedReturnValue();
    evidenceDocumentTypes = v8->_evidenceDocumentTypes;
    v8->_evidenceDocumentTypes = (NSArray *)v15;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("resolutionReasonCode"));
    v17 = objc_claimAutoreleasedReturnValue();
    resolutionReason = v8->_resolutionReason;
    v8->_resolutionReason = (NSString *)v17;

    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("partiallyApprovedAmount"));
    v19 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v19, v7, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    partiallyApprovedAmount = v8->_partiallyApprovedAmount;
    v8->_partiallyApprovedAmount = (PKCurrencyAmount *)v20;

    objc_msgSend(v6, "PKDateForKey:", CFSTR("resolutionDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    resolutionDate = v8->_resolutionDate;
    v8->_resolutionDate = (NSDate *)v22;

  }
  return v8;
}

- (PKAccountServicingEventStatusDetails)initWithRecord:(id)a3 currencyCode:(id)a4
{
  id v6;
  NSString *v7;
  PKAccountServicingEventStatusDetails *v8;
  void *v9;
  uint64_t v10;
  NSArray *statusReasons;
  uint64_t v12;
  NSDate *customerResponseByDate;
  uint64_t v14;
  NSDate *merchantResponseByDate;
  void *v16;
  uint64_t v17;
  NSArray *evidenceDocumentTypes;
  uint64_t v19;
  NSString *resolutionReason;
  NSDecimalNumber *v21;
  NSDecimalNumber *v22;
  uint64_t v23;
  PKCurrencyAmount *partiallyApprovedAmount;
  uint64_t v25;
  NSDate *resolutionDate;
  objc_super v28;

  v6 = a3;
  v7 = (NSString *)a4;
  v28.receiver = self;
  v28.super_class = (Class)PKAccountServicingEventStatusDetails;
  v8 = -[PKAccountServicingEventStatusDetails init](&v28, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_encryptedArrayOfClasses:forKey:", v9, CFSTR("statusReasonCodes"));
    v10 = objc_claimAutoreleasedReturnValue();
    statusReasons = v8->_statusReasons;
    v8->_statusReasons = (NSArray *)v10;

    objc_msgSend(v6, "pk_encryptedDateForKey:", CFSTR("customerResponseByDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    customerResponseByDate = v8->_customerResponseByDate;
    v8->_customerResponseByDate = (NSDate *)v12;

    objc_msgSend(v6, "pk_encryptedDateForKey:", CFSTR("merchantResponseByDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    merchantResponseByDate = v8->_merchantResponseByDate;
    v8->_merchantResponseByDate = (NSDate *)v14;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_encryptedArrayOfClasses:forKey:", v16, CFSTR("evidenceDocumentTypes"));
    v17 = objc_claimAutoreleasedReturnValue();
    evidenceDocumentTypes = v8->_evidenceDocumentTypes;
    v8->_evidenceDocumentTypes = (NSArray *)v17;

    objc_msgSend(v6, "pk_encryptedStringForKey:", CFSTR("resolutionReasonCode"));
    v19 = objc_claimAutoreleasedReturnValue();
    resolutionReason = v8->_resolutionReason;
    v8->_resolutionReason = (NSString *)v19;

    objc_msgSend(v6, "pk_encryptedDecimalNumberForKey:", CFSTR("partiallyApprovedAmount"));
    v21 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      PKCurrencyAmountCreate(v21, v7, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      partiallyApprovedAmount = v8->_partiallyApprovedAmount;
      v8->_partiallyApprovedAmount = (PKCurrencyAmount *)v23;

    }
    objc_msgSend(v6, "pk_encryptedDateForKey:", CFSTR("resolutionDate"));
    v25 = objc_claimAutoreleasedReturnValue();
    resolutionDate = v8->_resolutionDate;
    v8->_resolutionDate = (NSDate *)v25;

  }
  return v8;
}

- (void)encodeWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "encryptedValues");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_statusReasons)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", self->_statusReasons, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithData:encoding:", v5, 4);

    objc_msgSend(v12, "setObject:forKey:", v6, CFSTR("statusReasonCodes"));
  }
  objc_msgSend(v12, "setObject:forKey:", self->_customerResponseByDate, CFSTR("customerResponseByDate"));
  objc_msgSend(v12, "setObject:forKey:", self->_merchantResponseByDate, CFSTR("merchantResponseByDate"));
  if (self->_evidenceDocumentTypes)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", self->_evidenceDocumentTypes, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithData:encoding:", v8, 4);

    objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("evidenceDocumentTypes"));
  }
  objc_msgSend(v12, "setObject:forKey:", self->_resolutionReason, CFSTR("resolutionReasonCode"));
  -[PKCurrencyAmount amount](self->_partiallyApprovedAmount, "amount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("partiallyApprovedAmount"));

  objc_msgSend(v12, "setObject:forKey:", self->_resolutionDate, CFSTR("resolutionDate"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServicingEventStatusDetails)initWithCoder:(id)a3
{
  id v4;
  PKAccountServicingEventStatusDetails *v5;
  uint64_t v6;
  NSArray *statusReasons;
  uint64_t v8;
  NSDate *customerResponseByDate;
  uint64_t v10;
  NSDate *merchantResponseByDate;
  uint64_t v12;
  NSArray *evidenceDocumentTypes;
  uint64_t v14;
  NSString *resolutionReason;
  uint64_t v16;
  PKCurrencyAmount *partiallyApprovedAmount;
  uint64_t v18;
  NSDate *resolutionDate;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountServicingEventStatusDetails;
  v5 = -[PKAccountServicingEventStatusDetails init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("statusReasonCodes"));
    v6 = objc_claimAutoreleasedReturnValue();
    statusReasons = v5->_statusReasons;
    v5->_statusReasons = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customerResponseByDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    customerResponseByDate = v5->_customerResponseByDate;
    v5->_customerResponseByDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantResponseByDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    merchantResponseByDate = v5->_merchantResponseByDate;
    v5->_merchantResponseByDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("evidenceDocumentTypes"));
    v12 = objc_claimAutoreleasedReturnValue();
    evidenceDocumentTypes = v5->_evidenceDocumentTypes;
    v5->_evidenceDocumentTypes = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionReasonCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    resolutionReason = v5->_resolutionReason;
    v5->_resolutionReason = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partiallyApprovedAmount"));
    v16 = objc_claimAutoreleasedReturnValue();
    partiallyApprovedAmount = v5->_partiallyApprovedAmount;
    v5->_partiallyApprovedAmount = (PKCurrencyAmount *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    resolutionDate = v5->_resolutionDate;
    v5->_resolutionDate = (NSDate *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *statusReasons;
  id v5;

  statusReasons = self->_statusReasons;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", statusReasons, CFSTR("statusReasonCodes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customerResponseByDate, CFSTR("customerResponseByDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantResponseByDate, CFSTR("merchantResponseByDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_evidenceDocumentTypes, CFSTR("evidenceDocumentTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resolutionReason, CFSTR("resolutionReasonCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_partiallyApprovedAmount, CFSTR("partiallyApprovedAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resolutionDate, CFSTR("resolutionDate"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *statusReasons;
  NSArray *v6;
  NSDate *customerResponseByDate;
  NSDate *v8;
  NSDate *merchantResponseByDate;
  NSDate *v10;
  NSArray *evidenceDocumentTypes;
  NSArray *v12;
  NSString *resolutionReason;
  NSString *v14;
  PKCurrencyAmount *partiallyApprovedAmount;
  PKCurrencyAmount *v16;
  NSDate *resolutionDate;
  NSDate *v18;
  char v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_34;
  statusReasons = self->_statusReasons;
  v6 = (NSArray *)v4[1];
  if (statusReasons && v6)
  {
    if ((-[NSArray isEqual:](statusReasons, "isEqual:") & 1) == 0)
      goto LABEL_34;
  }
  else if (statusReasons != v6)
  {
    goto LABEL_34;
  }
  customerResponseByDate = self->_customerResponseByDate;
  v8 = (NSDate *)v4[2];
  if (customerResponseByDate && v8)
  {
    if ((-[NSDate isEqual:](customerResponseByDate, "isEqual:") & 1) == 0)
      goto LABEL_34;
  }
  else if (customerResponseByDate != v8)
  {
    goto LABEL_34;
  }
  merchantResponseByDate = self->_merchantResponseByDate;
  v10 = (NSDate *)v4[3];
  if (merchantResponseByDate && v10)
  {
    if ((-[NSDate isEqual:](merchantResponseByDate, "isEqual:") & 1) == 0)
      goto LABEL_34;
  }
  else if (merchantResponseByDate != v10)
  {
    goto LABEL_34;
  }
  evidenceDocumentTypes = self->_evidenceDocumentTypes;
  v12 = (NSArray *)v4[4];
  if (evidenceDocumentTypes && v12)
  {
    if ((-[NSArray isEqual:](evidenceDocumentTypes, "isEqual:") & 1) == 0)
      goto LABEL_34;
  }
  else if (evidenceDocumentTypes != v12)
  {
    goto LABEL_34;
  }
  resolutionReason = self->_resolutionReason;
  v14 = (NSString *)v4[5];
  if (resolutionReason && v14)
  {
    if ((-[NSString isEqual:](resolutionReason, "isEqual:") & 1) == 0)
      goto LABEL_34;
  }
  else if (resolutionReason != v14)
  {
    goto LABEL_34;
  }
  partiallyApprovedAmount = self->_partiallyApprovedAmount;
  v16 = (PKCurrencyAmount *)v4[6];
  if (!partiallyApprovedAmount || !v16)
  {
    if (partiallyApprovedAmount == v16)
      goto LABEL_30;
LABEL_34:
    v19 = 0;
    goto LABEL_35;
  }
  if (!-[PKCurrencyAmount isEqual:](partiallyApprovedAmount, "isEqual:"))
    goto LABEL_34;
LABEL_30:
  resolutionDate = self->_resolutionDate;
  v18 = (NSDate *)v4[7];
  if (resolutionDate && v18)
    v19 = -[NSDate isEqual:](resolutionDate, "isEqual:");
  else
    v19 = resolutionDate == v18;
LABEL_35:

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_statusReasons);
  objc_msgSend(v3, "safelyAddObject:", self->_customerResponseByDate);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantResponseByDate);
  objc_msgSend(v3, "safelyAddObject:", self->_evidenceDocumentTypes);
  objc_msgSend(v3, "safelyAddObject:", self->_partiallyApprovedAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_resolutionDate);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountServicingEventStatusDetails statusReasons](self, "statusReasons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("statusReasons: '%@'; "), v4);

  -[PKAccountServicingEventStatusDetails customerResponseByDate](self, "customerResponseByDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("customerResponseByDate: '%@'; "), v5);

  -[PKAccountServicingEventStatusDetails merchantResponseByDate](self, "merchantResponseByDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantResponseByDate: '%@'; "), v6);

  -[PKAccountServicingEventStatusDetails evidenceDocumentTypes](self, "evidenceDocumentTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("evidenceDocumentTypes: '%@'; "), v7);

  -[PKAccountServicingEventStatusDetails resolutionReason](self, "resolutionReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("resolutionReasonCode: '%@'; "), v8);

  -[PKAccountServicingEventStatusDetails partiallyApprovedAmount](self, "partiallyApprovedAmount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("partiallyApprovedAmount: '%@'; "), v9);

  -[PKAccountServicingEventStatusDetails resolutionDate](self, "resolutionDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("resolutionDate: '%@'; "), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSArray)statusReasons
{
  return self->_statusReasons;
}

- (void)setStatusReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)customerResponseByDate
{
  return self->_customerResponseByDate;
}

- (void)setCustomerResponseByDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)merchantResponseByDate
{
  return self->_merchantResponseByDate;
}

- (void)setMerchantResponseByDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)evidenceDocumentTypes
{
  return self->_evidenceDocumentTypes;
}

- (void)setEvidenceDocumentTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)resolutionReason
{
  return self->_resolutionReason;
}

- (void)setResolutionReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PKCurrencyAmount)partiallyApprovedAmount
{
  return self->_partiallyApprovedAmount;
}

- (void)setPartiallyApprovedAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)resolutionDate
{
  return self->_resolutionDate;
}

- (void)setResolutionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionDate, 0);
  objc_storeStrong((id *)&self->_partiallyApprovedAmount, 0);
  objc_storeStrong((id *)&self->_resolutionReason, 0);
  objc_storeStrong((id *)&self->_evidenceDocumentTypes, 0);
  objc_storeStrong((id *)&self->_merchantResponseByDate, 0);
  objc_storeStrong((id *)&self->_customerResponseByDate, 0);
  objc_storeStrong((id *)&self->_statusReasons, 0);
}

@end
