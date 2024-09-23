@implementation PKPeerPaymentRecurringPaymentTransaction

+ (id)transactionWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

- (PKPeerPaymentRecurringPaymentTransaction)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentRecurringPaymentTransaction *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDate *executionDate;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentRecurringPaymentTransaction;
  v5 = -[PKPeerPaymentRecurringPaymentTransaction init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("status"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKPeerPaymentRecurringPaymentTransactionStatusFromString(v9);

    objc_msgSend(v4, "PKDateForKey:", CFSTR("executionDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    executionDate = v5->_executionDate;
    v5->_executionDate = (NSDate *)v11;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("errorCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = objc_msgSend(v13, "integerValue");
    else
      v15 = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("errorCode"));
    v5->_errorCode = v15;

  }
  return v5;
}

- (BOOL)exceedsAppleCashLimits
{
  return (unint64_t)(self->_errorCode - 40305) < 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRecurringPaymentTransaction)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentRecurringPaymentTransaction *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSDate *executionDate;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentRecurringPaymentTransaction;
  v5 = -[PKPeerPaymentRecurringPaymentTransaction init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKPeerPaymentRecurringPaymentTransactionStatusFromString(v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("executionDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    executionDate = v5->_executionDate;
    v5->_executionDate = (NSDate *)v9;

    v5->_errorCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("errorCode"));
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
  PKPeerPaymentRecurringPaymentTransactionStatusToString(self->_status);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("status"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_executionDate, CFSTR("executionDate"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_errorCode, CFSTR("errorCode"));

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
  objc_msgSend(v3, "safelyAddObject:", self->_executionDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_status - v4 + 32 * v4;
  v6 = self->_errorCode - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSDate *executionDate;
  NSDate *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (identifier != v6)
  {
    goto LABEL_14;
  }
  executionDate = self->_executionDate;
  v8 = (NSDate *)v4[3];
  if (!executionDate || !v8)
  {
    if (executionDate == v8)
      goto LABEL_12;
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  if ((-[NSDate isEqual:](executionDate, "isEqual:") & 1) == 0)
    goto LABEL_14;
LABEL_12:
  if (self->_status != v4[2])
    goto LABEL_14;
  v9 = self->_errorCode == v4[4];
LABEL_15:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  PKPeerPaymentRecurringPaymentTransactionStatusToString(self->_status);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("executionDate: '%@'; "), self->_executionDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("errorCode: '%ld'; "), self->_errorCode);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPeerPaymentRecurringPaymentTransaction *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *executionDate;

  v5 = -[PKPeerPaymentRecurringPaymentTransaction init](+[PKPeerPaymentRecurringPaymentTransaction allocWithZone:](PKPeerPaymentRecurringPaymentTransaction, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_status = self->_status;
  v8 = -[NSDate copyWithZone:](self->_executionDate, "copyWithZone:", a3);
  executionDate = v5->_executionDate;
  v5->_executionDate = (NSDate *)v8;

  v5->_errorCode = self->_errorCode;
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

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSDate)executionDate
{
  return self->_executionDate;
}

- (void)setExecutionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
