@implementation PKPaymentBillingAgreementDataItem

- (int64_t)context
{
  return 1;
}

+ (int64_t)dataType
{
  return 12;
}

- (NSString)billingAgreement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "recurringPaymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "automaticReloadPaymentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v5 = v4;
  objc_msgSend(v5, "billingAgreement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

@end
