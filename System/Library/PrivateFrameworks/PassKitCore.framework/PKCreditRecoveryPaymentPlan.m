@implementation PKCreditRecoveryPaymentPlan

- (PKCreditRecoveryPaymentPlan)initWithDictionary:(id)a3 enrolled:(BOOL)a4
{
  id v6;
  PKCreditRecoveryPaymentPlan *v7;
  PKCreditRecoveryPaymentPlan *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *displayName;
  uint64_t v13;
  NSDate *enrollmentDate;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKCreditRecoveryPaymentPlan;
  v7 = -[PKCreditRecoveryPaymentPlan init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_enrolled = a4;
    objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("displayName"));
    v11 = objc_claimAutoreleasedReturnValue();
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v11;

    objc_msgSend(v6, "PKDateForKey:", CFSTR("enrollmentDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    enrollmentDate = v8->_enrollmentDate;
    v8->_enrollmentDate = (NSDate *)v13;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditRecoveryPaymentPlan)initWithCoder:(id)a3
{
  id v4;
  PKCreditRecoveryPaymentPlan *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSDate *enrollmentDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCreditRecoveryPaymentPlan;
  v5 = -[PKCreditRecoveryPaymentPlan init](&v13, sel_init);
  if (v5)
  {
    v5->_enrolled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enrolled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enrollmentDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    enrollmentDate = v5->_enrollmentDate;
    v5->_enrollmentDate = (NSDate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 enrolled;
  id v5;

  enrolled = self->_enrolled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", enrolled, CFSTR("enrolled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enrollmentDate, CFSTR("enrollmentDate"));

}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_enrolled)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("enrolled: '%@'; "), v5);
  objc_msgSend(v4, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v4, "appendFormat:", CFSTR("displayName: '%@'; "), self->_displayName);
  objc_msgSend(v4, "appendFormat:", CFSTR("enrollmentDate: '%@'; "), self->_enrollmentDate);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCreditRecoveryPaymentPlan *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  NSString *displayName;
  uint64_t v9;
  NSDate *enrollmentDate;

  v4 = -[PKCreditRecoveryPaymentPlan init](+[PKCreditRecoveryPaymentPlan allocWithZone:](PKCreditRecoveryPaymentPlan, "allocWithZone:", a3), "init");
  v4->_enrolled = self->_enrolled;
  v5 = -[NSString copy](self->_identifier, "copy");
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  v7 = -[NSString copy](self->_displayName, "copy");
  displayName = v4->_displayName;
  v4->_displayName = (NSString *)v7;

  v9 = -[NSDate copy](self->_enrollmentDate, "copy");
  enrollmentDate = v4->_enrollmentDate;
  v4->_enrollmentDate = (NSDate *)v9;

  return v4;
}

- (BOOL)enrolled
{
  return self->_enrolled;
}

- (void)setEnrolled:(BOOL)a3
{
  self->_enrolled = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)enrollmentDate
{
  return self->_enrollmentDate;
}

- (void)setEnrollmentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
