@implementation PKApplyVerificationInformation

- (PKApplyVerificationInformation)initWithCoder:(id)a3
{
  id v4;
  PKApplyVerificationInformation *v5;
  uint64_t v6;
  NSString *data;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *trialDeposits;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKApplyVerificationInformation;
  v5 = -[PKApplyVerificationInformation init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("trialDeposits"));
    v11 = objc_claimAutoreleasedReturnValue();
    trialDeposits = v5->_trialDeposits;
    v5->_trialDeposits = (NSArray *)v11;

    v5->_skippedVerification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("skippedVerification"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *data;
  id v5;

  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", data, CFSTR("data"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trialDeposits, CFSTR("trialDeposits"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_skippedVerification, CFSTR("skippedVerification"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)trialDeposits
{
  return self->_trialDeposits;
}

- (void)setTrialDeposits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)skippedVerification
{
  return self->_skippedVerification;
}

- (void)setSkippedVerification:(BOOL)a3
{
  self->_skippedVerification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialDeposits, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
