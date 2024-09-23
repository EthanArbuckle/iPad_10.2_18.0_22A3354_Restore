@implementation PKPaymentBalanceReminder

- (PKPaymentBalanceReminder)initWithThreshold:(id)a3 isEnabled:(BOOL)a4
{
  id v7;
  PKPaymentBalanceReminder *v8;
  PKPaymentBalanceReminder *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentBalanceReminder;
  v8 = -[PKPaymentBalanceReminder init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_threshold, a3);
    v9->_enabled = a4;
  }

  return v9;
}

- (PKPaymentBalanceReminder)initWithCoder:(id)a3
{
  id v4;
  PKPaymentBalanceReminder *v5;
  uint64_t v6;
  NSDecimalNumber *threshold;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentBalanceReminder;
  v5 = -[PKPaymentBalanceReminder init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threshold"));
    v6 = objc_claimAutoreleasedReturnValue();
    threshold = v5->_threshold;
    v5->_threshold = (NSDecimalNumber *)v6;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *threshold;
  id v5;

  threshold = self->_threshold;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", threshold, CFSTR("threshold"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("YES");
  if (!self->_enabled)
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; isEnabled: %@; threshold: %@; >"),
               v4,
               self,
               v5,
               self->_threshold);
}

- (NSDecimalNumber)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_threshold, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threshold, 0);
}

@end
