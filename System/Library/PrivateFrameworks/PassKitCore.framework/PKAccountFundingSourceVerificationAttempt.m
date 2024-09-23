@implementation PKAccountFundingSourceVerificationAttempt

- (PKAccountFundingSourceVerificationAttempt)initWithDictionary:(id)a3
{
  id v4;
  PKAccountFundingSourceVerificationAttempt *v5;
  void *v6;
  uint64_t v7;
  NSDate *sentDate;
  uint64_t v9;
  NSDate *expiryDate;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountFundingSourceVerificationAttempt;
  v5 = -[PKAccountFundingSourceVerificationAttempt init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKApplyVerificationTypeFromString(v6);

    objc_msgSend(v4, "PKDateForKey:", CFSTR("sentDate"));
    v7 = objc_claimAutoreleasedReturnValue();
    sentDate = v5->_sentDate;
    v5->_sentDate = (NSDate *)v7;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("expiryDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v9;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("failureReason"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_failureReason = PKAccountFundingSourceVerificationFailureReasonFromString(v11);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountFundingSourceVerificationAttempt)initWithCoder:(id)a3
{
  id v4;
  PKAccountFundingSourceVerificationAttempt *v5;
  uint64_t v6;
  NSDate *sentDate;
  uint64_t v8;
  NSDate *expiryDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountFundingSourceVerificationAttempt;
  v5 = -[PKAccountFundingSourceVerificationAttempt init](&v11, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sentDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    sentDate = v5->_sentDate;
    v5->_sentDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiryDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v8;

    v5->_failureReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("failureReason"));
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_sentDate, CFSTR("sentDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiryDate, CFSTR("expiryDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_failureReason, CFSTR("failureReason"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *sentDate;
  NSDate *v6;
  NSDate *expiryDate;
  NSDate *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  sentDate = self->_sentDate;
  v6 = (NSDate *)v4[2];
  if (sentDate && v6)
  {
    if ((-[NSDate isEqual:](sentDate, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (sentDate != v6)
  {
    goto LABEL_14;
  }
  expiryDate = self->_expiryDate;
  v8 = (NSDate *)v4[3];
  if (!expiryDate || !v8)
  {
    if (expiryDate == v8)
      goto LABEL_12;
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  if ((-[NSDate isEqual:](expiryDate, "isEqual:") & 1) == 0)
    goto LABEL_14;
LABEL_12:
  if (self->_failureReason != v4[4])
    goto LABEL_14;
  v9 = self->_type == v4[1];
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_sentDate);
  objc_msgSend(v3, "safelyAddObject:", self->_expiryDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_failureReason - v4 + 32 * v4;
  v6 = self->_type - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKApplyVerificationTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("sentDate: '%@'; "), self->_sentDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("expiryDate: '%@'; "), self->_expiryDate);
  v5 = self->_failureReason - 1;
  if (v5 > 3)
    v6 = CFSTR("unknown");
  else
    v6 = (const __CFString *)qword_1E2AD5958[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR("failureReason: '%@'; "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAccountFundingSourceVerificationAttempt *v5;
  uint64_t v6;
  NSDate *sentDate;
  uint64_t v8;
  NSDate *expiryDate;

  v5 = -[PKAccountFundingSourceVerificationAttempt init](+[PKAccountFundingSourceVerificationAttempt allocWithZone:](PKAccountFundingSourceVerificationAttempt, "allocWithZone:"), "init");
  v5->_type = self->_type;
  v6 = -[NSDate copyWithZone:](self->_sentDate, "copyWithZone:", a3);
  sentDate = v5->_sentDate;
  v5->_sentDate = (NSDate *)v6;

  v8 = -[NSDate copyWithZone:](self->_expiryDate, "copyWithZone:", a3);
  expiryDate = v5->_expiryDate;
  v5->_expiryDate = (NSDate *)v8;

  v5->_failureReason = self->_failureReason;
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

- (NSDate)sentDate
{
  return self->_sentDate;
}

- (void)setSentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(unint64_t)a3
{
  self->_failureReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_sentDate, 0);
}

@end
