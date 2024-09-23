@implementation STSInAppPaymentRequest

- (STSInAppPaymentRequest)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STSInAppPaymentRequest;
  return -[STSPaymentRequestBase initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSInAppPaymentRequest;
  -[STSPaymentRequestBase encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

@end
