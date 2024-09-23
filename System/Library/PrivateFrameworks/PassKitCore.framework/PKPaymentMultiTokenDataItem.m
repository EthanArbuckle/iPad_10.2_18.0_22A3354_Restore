@implementation PKPaymentMultiTokenDataItem

- (int64_t)context
{
  return 1;
}

+ (int64_t)dataType
{
  return 13;
}

- (NSArray)multiTokenContexts
{
  void *v2;
  void *v3;
  void *v4;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "multiTokenContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

@end
