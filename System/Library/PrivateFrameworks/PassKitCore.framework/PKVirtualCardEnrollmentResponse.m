@implementation PKVirtualCardEnrollmentResponse

- (PKVirtualCardEnrollmentResponse)initWithData:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKVirtualCardEnrollmentResponse;
  return -[PKPaymentRewrapResponseBase initWithData:](&v4, sel_initWithData_, a3);
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

@end
