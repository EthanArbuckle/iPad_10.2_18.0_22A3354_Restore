@implementation PKPaymentSummaryItemsDataItem

+ (int64_t)dataType
{
  return 8;
}

- (int64_t)context
{
  return 3;
}

- (NSString)currencyCode
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currencyCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)paymentSummaryItems
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentSummaryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

@end
