@implementation PKTransitAppletCommutePlan

- (BOOL)isEqual:(id)a3
{
  PKTransitAppletCommutePlan *v4;
  PKTransitAppletCommutePlan *v5;
  BOOL v6;

  v4 = (PKTransitAppletCommutePlan *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransitAppletCommutePlan isEqualToCommutePlan:](self, "isEqualToCommutePlan:", v5);

  return v6;
}

- (BOOL)isEqualToCommutePlan:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  BOOL v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSDate *startDate;
  NSDate *v14;
  NSDate *expirationDate;
  NSDate *v16;

  v4 = a3;
  if (v4)
  {
    identifier = self->_identifier;
    v6 = (NSString *)v4[1];
    if (identifier)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
    {
      if (identifier == v6)
        goto LABEL_10;
    }
    else
    {
      v9 = -[NSString isEqual:](identifier, "isEqual:");
      if ((v9 & 1) != 0)
      {
LABEL_10:
        -[PKTransitAppletCommutePlan uniqueIdentifier](self, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uniqueIdentifier");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v10 && v11)
        {
          if ((objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
            goto LABEL_25;
        }
        else if (v10 != (void *)v11)
        {
          goto LABEL_25;
        }
        startDate = self->_startDate;
        v14 = (NSDate *)v4[4];
        if (startDate && v14)
        {
          if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
            goto LABEL_25;
        }
        else if (startDate != v14)
        {
          goto LABEL_25;
        }
        expirationDate = self->_expirationDate;
        v16 = (NSDate *)v4[5];
        if (expirationDate && v16)
        {
          if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) != 0)
          {
LABEL_23:
            v8 = self->_status == v4[3];
LABEL_26:

            goto LABEL_27;
          }
        }
        else if (expirationDate == v16)
        {
          goto LABEL_23;
        }
LABEL_25:
        v8 = 0;
        goto LABEL_26;
      }
    }
  }
  v8 = 0;
LABEL_27:

  return v8;
}

- (id)description
{
  void *v3;
  NSString *identifier;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  identifier = self->_identifier;
  -[PKTransitAppletCommutePlan uniqueIdentifier](self, "uniqueIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = self->_status - 1;
  if (v7 > 3)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2AD4700[v7];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Applet Plan: %@ %@ %@ %@ %@"), identifier, v5, self->_startDate, self->_expirationDate, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)uniqueIdentifier
{
  NSString *uniqueIdentifier;

  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
    uniqueIdentifier = self->_identifier;
  return uniqueIdentifier;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  -[PKTransitAppletCommutePlan uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_expirationDate);
  v5 = PKCombinedHash(17, v3);
  v6 = self->_status - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransitAppletCommutePlan)initWithCoder:(id)a3
{
  id v4;
  PKTransitAppletCommutePlan *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *uniqueIdentifier;
  uint64_t v10;
  NSDate *startDate;
  uint64_t v12;
  NSDate *expirationDate;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKTransitAppletCommutePlan;
  v5 = -[PKTransitAppletCommutePlan init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v12;

  }
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
  -[PKTransitAppletCommutePlan uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("UniqueIdentifier"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_status, CFSTR("status"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  -[PKTransitAppletCommutePlan uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copyWithZone:", a3);
  v10 = (void *)v5[2];
  v5[2] = v9;

  v11 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  v12 = (void *)v5[4];
  v5[4] = v11;

  v13 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  v14 = (void *)v5[5];
  v5[5] = v13;

  v5[3] = self->_status;
  return v5;
}

- (PKTransitAppletCommutePlan)initWithDictionary:(id)a3
{
  id v4;
  PKTransitAppletCommutePlan *v5;
  PKTransitAppletCommutePlan *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  uint64_t v11;
  NSString *uniqueIdentifier;
  void *v13;
  uint64_t v14;
  NSDate *startDate;
  void *v16;
  uint64_t v17;
  NSDate *expirationDate;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKTransitAppletCommutePlan;
  v5 = -[PKTransitAppletCommutePlan init](&v20, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CommutePlanIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CommutePlanUniqueIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v11;

    v6->_status = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("ContractStatus"));
    objc_msgSend(v4, "PKDateComponentsForKey:", CFSTR("CommutePlanValidityStartDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKDateFromDateComponents(v13);
    v14 = objc_claimAutoreleasedReturnValue();
    startDate = v6->_startDate;
    v6->_startDate = (NSDate *)v14;

    objc_msgSend(v4, "PKDateComponentsForKey:", CFSTR("CommutePlanValidityEndDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKDateFromDateComponents(v16);
    v17 = objc_claimAutoreleasedReturnValue();
    expirationDate = v6->_expirationDate;
    v6->_expirationDate = (NSDate *)v17;

  }
  return v6;
}

- (PKTransitAppletCommutePlan)initWithIdentifier:(id)a3 uniqueIdentifier:(id)a4 startDate:(id)a5 expirationDate:(id)a6 status:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKTransitAppletCommutePlan *v16;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  NSString *uniqueIdentifier;
  uint64_t v21;
  NSDate *startDate;
  uint64_t v23;
  NSDate *expirationDate;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKTransitAppletCommutePlan;
  v16 = -[PKTransitAppletCommutePlan init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    uniqueIdentifier = v16->_uniqueIdentifier;
    v16->_uniqueIdentifier = (NSString *)v19;

    PKDateFromDateComponents(v14);
    v21 = objc_claimAutoreleasedReturnValue();
    startDate = v16->_startDate;
    v16->_startDate = (NSDate *)v21;

    PKDateFromDateComponents(v15);
    v23 = objc_claimAutoreleasedReturnValue();
    expirationDate = v16->_expirationDate;
    v16->_expirationDate = (NSDate *)v23;

    v16->_status = a7;
  }

  return v16;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setUniqueIdentifier:(id)a3
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

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
