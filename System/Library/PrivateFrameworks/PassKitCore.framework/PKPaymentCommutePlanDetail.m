@implementation PKPaymentCommutePlanDetail

- (PKPaymentCommutePlanDetail)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentCommutePlanDetail *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *uniqueIdentifier;
  uint64_t v10;
  NSString *localizedTitle;
  uint64_t v12;
  NSString *localizedDescription;
  uint64_t v14;
  NSDate *lastUpdateDate;
  uint64_t v16;
  NSDate *startDate;
  uint64_t v18;
  NSDate *expiryDate;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentCommutePlanDetail;
  v5 = -[PKPaymentCommutePlanDetail init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("uniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    v5->_value = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("value"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v12;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdatedDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastUpdateDate = v5->_lastUpdateDate;
    v5->_lastUpdateDate = (NSDate *)v14;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("startDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v16;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("expiryDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v18;

    v5->_status = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("status"));
  }

  return v5;
}

- (unint64_t)planType
{
  return self->_expiryDate == 0;
}

- (PKPaymentCommutePlanDetail)initWithAppletCommutePlan:(id)a3 label:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPaymentCommutePlanDetail *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *uniqueIdentifier;
  uint64_t v16;
  NSDate *startDate;
  uint64_t v18;
  NSDate *expiryDate;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentCommutePlanDetail;
  v11 = -[PKPaymentCommutePlanDetail init](&v21, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_msgSend(v8, "uniqueIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v11->_uniqueIdentifier;
    v11->_uniqueIdentifier = (NSString *)v14;

    v11->_status = objc_msgSend(v8, "status");
    objc_msgSend(v8, "startDate");
    v16 = objc_claimAutoreleasedReturnValue();
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v16;

    objc_msgSend(v8, "expirationDate");
    v18 = objc_claimAutoreleasedReturnValue();
    expiryDate = v11->_expiryDate;
    v11->_expiryDate = (NSDate *)v18;

    objc_storeStrong((id *)&v11->_localizedTitle, a4);
    objc_storeStrong((id *)&v11->_localizedDescription, a5);
  }

  return v11;
}

- (PKPaymentCommutePlanDetail)initWithTransitCommutePlan:(id)a3
{
  id v4;
  PKPaymentCommutePlanDetail *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *uniqueIdentifier;
  uint64_t v10;
  NSDate *startDate;
  uint64_t v12;
  NSDate *expiryDate;
  void *v14;
  uint64_t v15;
  NSString *localizedTitle;
  uint64_t v17;
  NSString *localizedDescription;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentCommutePlanDetail;
  v5 = -[PKPaymentCommutePlanDetail init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "uniqueIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    v5->_status = 0;
    objc_msgSend(v4, "startDate");
    v10 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v10;

    objc_msgSend(v4, "expiryDate");
    v12 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v12;

    objc_msgSend(v4, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "label");
    v15 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v15;

    objc_msgSend(v14, "value");
    v17 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v17;

  }
  return v5;
}

- (PKPaymentCommutePlanDetail)initWithIdentifier:(id)a3 uniqueIdentifier:(id)a4 startDate:(id)a5 expiryDate:(id)a6 title:(id)a7 description:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKPaymentCommutePlanDetail *v18;
  PKPaymentCommutePlanDetail *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentCommutePlanDetail;
  v18 = -[PKPaymentCommutePlanDetail init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_uniqueIdentifier, a4);
    objc_storeStrong((id *)&v19->_startDate, a5);
    objc_storeStrong((id *)&v19->_expiryDate, a6);
    objc_storeStrong((id *)&v19->_localizedTitle, a7);
    objc_storeStrong((id *)&v19->_localizedDescription, a8);
    v19->_planType = 0;
  }

  return v19;
}

- (NSString)uniqueIdentifier
{
  NSString *uniqueIdentifier;

  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
    uniqueIdentifier = self->_identifier;
  return uniqueIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentCommutePlanDetail *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSString *uniqueIdentifier;
  uint64_t v11;
  NSString *localizedTitle;
  uint64_t v13;
  NSString *localizedDescription;
  uint64_t v15;
  NSDate *lastUpdateDate;
  uint64_t v17;
  NSDate *startDate;
  uint64_t v19;
  NSDate *expiryDate;

  v5 = -[PKPaymentCommutePlanDetail init](+[PKPaymentCommutePlanDetail allocWithZone:](PKPaymentCommutePlanDetail, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  -[PKPaymentCommutePlanDetail uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copyWithZone:", a3);
  uniqueIdentifier = v5->_uniqueIdentifier;
  v5->_uniqueIdentifier = (NSString *)v9;

  v5->_value = self->_value;
  v11 = -[NSString copyWithZone:](self->_localizedTitle, "copyWithZone:", a3);
  localizedTitle = v5->_localizedTitle;
  v5->_localizedTitle = (NSString *)v11;

  v13 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3);
  localizedDescription = v5->_localizedDescription;
  v5->_localizedDescription = (NSString *)v13;

  v15 = -[NSDate copyWithZone:](self->_lastUpdateDate, "copyWithZone:", a3);
  lastUpdateDate = v5->_lastUpdateDate;
  v5->_lastUpdateDate = (NSDate *)v15;

  v17 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v17;

  v19 = -[NSDate copyWithZone:](self->_expiryDate, "copyWithZone:", a3);
  expiryDate = v5->_expiryDate;
  v5->_expiryDate = (NSDate *)v19;

  v5->_status = self->_status;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  -[PKPaymentCommutePlanDetail uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("uniqueIdentifier"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_lastUpdateDate, CFSTR("lastUpdatedDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_expiryDate, CFSTR("expiryDate"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_status, CFSTR("status"));

}

- (PKPaymentCommutePlanDetail)initWithCoder:(id)a3
{
  id v4;
  PKPaymentCommutePlanDetail *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *uniqueIdentifier;
  uint64_t v10;
  NSString *localizedTitle;
  uint64_t v12;
  NSString *localizedDescription;
  uint64_t v14;
  NSDate *lastUpdateDate;
  uint64_t v16;
  NSDate *startDate;
  uint64_t v18;
  NSDate *expiryDate;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentCommutePlanDetail;
  v5 = -[PKPaymentCommutePlanDetail init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    v5->_value = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("value"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastUpdateDate = v5->_lastUpdateDate;
    v5->_lastUpdateDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiryDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v18;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
  }

  return v5;
}

- (NSString)identifier
{
  __CFString *identifier;

  identifier = (__CFString *)self->_identifier;
  if (!identifier)
    identifier = CFSTR("ApplicationStoredValueBalanceDefault");
  return (NSString *)identifier;
}

- (id)description
{
  unint64_t planType;
  void *v4;
  NSString *identifier;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;

  planType = self->_planType;
  v4 = (void *)MEMORY[0x1E0CB3940];
  identifier = self->_identifier;
  -[PKPaymentCommutePlanDetail uniqueIdentifier](self, "uniqueIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (planType)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Count Plan: %@ %@ %ld %@ %@ %lu"), identifier, v6, self->_value, self->_localizedTitle, self->_localizedDescription, self->_status, v10);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Timed Plan: %@ %@ %@ %@ %@ %@ %lu"), identifier, v6, self->_startDate, self->_expiryDate, self->_localizedTitle, self->_localizedDescription, self->_status);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  -[PKPaymentCommutePlanDetail uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(v3, "safelyAddObject:", self->_localizedTitle);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdateDate);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_expiryDate);
  v5 = PKCombinedHash(17, v3);
  v6 = self->_value - v5 + 32 * v5;
  v7 = self->_status - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  int64_t value;
  unint64_t status;
  NSString *localizedTitle;
  uint64_t v15;
  void *v16;
  NSString *localizedDescription;
  uint64_t v18;
  void *v19;
  NSDate *startDate;
  uint64_t v21;
  void *v22;
  NSDate *expiryDate;
  uint64_t v24;
  void *v25;
  NSDate *lastUpdateDate;
  uint64_t v27;
  void *v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (identifier && v6)
    {
      if ((-[NSString isEqual:](identifier, "isEqual:", v6) & 1) != 0)
      {
LABEL_5:
        -[PKPaymentCommutePlanDetail uniqueIdentifier](self, "uniqueIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uniqueIdentifier");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v8 && v9)
        {
          if ((objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
            goto LABEL_30;
        }
        else if (v8 != (void *)v9)
        {
LABEL_30:
          v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        value = self->_value;
        if (value != objc_msgSend(v4, "value"))
          goto LABEL_30;
        status = self->_status;
        if (status != objc_msgSend(v4, "status"))
          goto LABEL_30;
        localizedTitle = self->_localizedTitle;
        objc_msgSend(v4, "localizedTitle");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (localizedTitle && v15)
        {
          if ((-[NSString isEqual:](localizedTitle, "isEqual:", v15) & 1) != 0)
          {
LABEL_18:
            localizedDescription = self->_localizedDescription;
            objc_msgSend(v4, "localizedDescription");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v18;
            if (localizedDescription && v18)
            {
              if ((-[NSString isEqual:](localizedDescription, "isEqual:", v18) & 1) != 0)
              {
LABEL_21:
                startDate = self->_startDate;
                objc_msgSend(v4, "startDate");
                v21 = objc_claimAutoreleasedReturnValue();
                v22 = (void *)v21;
                if (startDate && v21)
                {
                  if ((-[NSDate isEqual:](startDate, "isEqual:", v21) & 1) != 0)
                  {
LABEL_24:
                    expiryDate = self->_expiryDate;
                    objc_msgSend(v4, "expiryDate");
                    v24 = objc_claimAutoreleasedReturnValue();
                    v25 = (void *)v24;
                    if (expiryDate && v24)
                    {
                      if ((-[NSDate isEqual:](expiryDate, "isEqual:", v24) & 1) != 0)
                        goto LABEL_27;
                    }
                    else if (expiryDate == (NSDate *)v24)
                    {
LABEL_27:
                      lastUpdateDate = self->_lastUpdateDate;
                      objc_msgSend(v4, "lastUpdateDate");
                      v27 = objc_claimAutoreleasedReturnValue();
                      v28 = (void *)v27;
                      if (lastUpdateDate && v27)
                        v11 = -[NSDate isEqual:](lastUpdateDate, "isEqual:", v27);
                      else
                        v11 = lastUpdateDate == (NSDate *)v27;

                      goto LABEL_44;
                    }
                    v11 = 0;
LABEL_44:

                    goto LABEL_45;
                  }
                }
                else if (startDate == (NSDate *)v21)
                {
                  goto LABEL_24;
                }
                v11 = 0;
LABEL_45:

                goto LABEL_46;
              }
            }
            else if (localizedDescription == (NSString *)v18)
            {
              goto LABEL_21;
            }
            v11 = 0;
LABEL_46:

            goto LABEL_47;
          }
        }
        else if (localizedTitle == (NSString *)v15)
        {
          goto LABEL_18;
        }
        v11 = 0;
LABEL_47:

        goto LABEL_31;
      }
    }
    else if (identifier == (NSString *)v6)
    {
      goto LABEL_5;
    }
    v11 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v11 = 0;
LABEL_33:

  return v11;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void)setPlanType:(unint64_t)a3
{
  self->_planType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
