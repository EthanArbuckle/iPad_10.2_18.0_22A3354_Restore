@implementation PKPaymentDateDataItem

+ (int64_t)dataType
{
  return 10;
}

- (PKPaymentDateDataItem)initWithModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentDateDataItem;
  return -[PKPaymentDataItem initWithModel:](&v4, sel_initWithModel_, a3);
}

- (int64_t)context
{
  return 1;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

- (NSDate)paymentDate
{
  return self->_paymentDate;
}

- (void)setPaymentDate:(id)a3
{
  objc_storeStrong((id *)&self->_paymentDate, a3);
}

- (NSTimeZone)paymentTimeZone
{
  return self->_paymentTimeZone;
}

- (void)setPaymentTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_paymentTimeZone, a3);
}

- (int64_t)paymentFrequency
{
  return self->_paymentFrequency;
}

- (void)setPaymentFrequency:(int64_t)a3
{
  self->_paymentFrequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentTimeZone, 0);
  objc_storeStrong((id *)&self->_paymentDate, 0);
}

@end
