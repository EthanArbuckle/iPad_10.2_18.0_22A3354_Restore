@implementation PKPaymentShippingMethodDataItem

+ (int64_t)dataType
{
  return 6;
}

- (PKShippingMethod)shippingMethod
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shippingMethod");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKShippingMethod *)v3;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

- (int64_t)context
{
  return 3;
}

@end
