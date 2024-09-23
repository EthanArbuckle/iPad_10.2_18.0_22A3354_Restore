@implementation PKSavingsAccountStepUpDetails

- (PKSavingsAccountStepUpDetails)initWithDictionary:(id)a3
{
  id v4;
  PKSavingsAccountStepUpDetails *v5;
  uint64_t v6;
  NSDate *neededBy;
  PKSavingsAccountStepUpDetails *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKSavingsAccountStepUpDetails;
    v5 = -[PKSavingsAccountStepUpDetails init](&v10, sel_init);
    if (v5)
    {
      v5->_thresholdExceeded = objc_msgSend(v4, "PKBoolForKey:", CFSTR("thresholdExceeded"));
      objc_msgSend(v4, "PKDateForKey:", CFSTR("neededBy"));
      v6 = objc_claimAutoreleasedReturnValue();
      neededBy = v5->_neededBy;
      v5->_neededBy = (NSDate *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSavingsAccountStepUpDetails)initWithCoder:(id)a3
{
  id v4;
  PKSavingsAccountStepUpDetails *v5;
  uint64_t v6;
  NSDate *neededBy;

  v4 = a3;
  v5 = -[PKSavingsAccountStepUpDetails init](self, "init");
  if (v5)
  {
    v5->_thresholdExceeded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("thresholdExceeded"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("neededBy"));
    v6 = objc_claimAutoreleasedReturnValue();
    neededBy = v5->_neededBy;
    v5->_neededBy = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 thresholdExceeded;
  id v5;

  thresholdExceeded = self->_thresholdExceeded;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", thresholdExceeded, CFSTR("thresholdExceeded"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_neededBy, CFSTR("neededBy"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *neededBy;
  NSDate *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_thresholdExceeded == *((unsigned __int8 *)v4 + 8))
  {
    neededBy = self->_neededBy;
    v6 = (NSDate *)v4[2];
    if (neededBy && v6)
      v7 = -[NSDate isEqual:](neededBy, "isEqual:");
    else
      v7 = neededBy == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_neededBy);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_thresholdExceeded - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_thresholdExceeded)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("thresholdExceeded: '%@'; "), v5);
  -[NSDate description](self->_neededBy, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("neededBy: '%@'; "), v6);

  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKSavingsAccountStepUpDetails *v4;

  v4 = -[PKSavingsAccountStepUpDetails init](+[PKSavingsAccountStepUpDetails allocWithZone:](PKSavingsAccountStepUpDetails, "allocWithZone:", a3), "init");
  v4->_thresholdExceeded = self->_thresholdExceeded;
  objc_storeStrong((id *)&v4->_neededBy, self->_neededBy);
  return v4;
}

- (BOOL)thresholdExceeded
{
  return self->_thresholdExceeded;
}

- (void)setThresholdExceeded:(BOOL)a3
{
  self->_thresholdExceeded = a3;
}

- (NSDate)neededBy
{
  return self->_neededBy;
}

- (void)setNeededBy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neededBy, 0);
}

@end
