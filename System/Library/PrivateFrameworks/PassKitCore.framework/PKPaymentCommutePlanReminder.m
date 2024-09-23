@implementation PKPaymentCommutePlanReminder

- (PKPaymentCommutePlanReminder)initWithTimeInterval:(double)a3
{
  PKPaymentCommutePlanReminder *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentCommutePlanReminder;
  result = -[PKPaymentCommutePlanReminder init](&v5, sel_init);
  if (result)
    result->_timeInterval = a3;
  return result;
}

- (PKPaymentCommutePlanReminder)initWithCoder:(id)a3
{
  id v4;
  PKPaymentCommutePlanReminder *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentCommutePlanReminder;
  v5 = -[PKPaymentCommutePlanReminder init](&v7, sel_init);
  if (v5)
    v5->_timeInterval = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timeInterval"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", (uint64_t)self->_timeInterval, CFSTR("timeInterval"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; timeInterval: %f; >"),
               objc_opt_class(),
               self,
               *(_QWORD *)&self->_timeInterval);
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

@end
