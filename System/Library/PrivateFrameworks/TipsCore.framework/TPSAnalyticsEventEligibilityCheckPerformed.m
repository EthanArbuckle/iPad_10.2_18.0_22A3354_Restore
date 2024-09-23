@implementation TPSAnalyticsEventEligibilityCheckPerformed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventEligibilityCheckPerformed)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventEligibilityCheckPerformed *v5;
  uint64_t v6;
  NSString *error;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAnalyticsEventEligibilityCheckPerformed;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSString *)v6;

  }
  return v5;
}

- (id)_initWithError:(id)a3
{
  id v5;
  TPSAnalyticsEventEligibilityCheckPerformed *v6;
  TPSAnalyticsEventEligibilityCheckPerformed *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAnalyticsEventEligibilityCheckPerformed;
  v6 = -[TPSAnalyticsEvent initWithDate:](&v9, sel_initWithDate_, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_error, a3);

  return v7;
}

+ (id)eventWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithError:", v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventEligibilityCheckPerformed;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_error, CFSTR("error"), v5.receiver, v5.super_class);

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("eligibility_check_performed"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_error, CFSTR("error"));
  return v3;
}

- (NSString)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
