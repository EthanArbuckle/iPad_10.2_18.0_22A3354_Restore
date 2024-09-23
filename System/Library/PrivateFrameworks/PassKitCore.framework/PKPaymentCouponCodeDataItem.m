@implementation PKPaymentCouponCodeDataItem

+ (int64_t)dataType
{
  return 11;
}

- (int64_t)context
{
  return 3;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

- (NSString)couponCode
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "couponCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isAwaitingCouponCodeUpdate
{
  void *v2;
  BOOL v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfOutstandingCouponCodeUpdates") != 0;

  return v3;
}

- (NSArray)errors
{
  void *v2;
  void *v3;
  void *v4;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentErrors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_299);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

BOOL __37__PKPaymentCouponCodeDataItem_errors__block_invoke(uint64_t a1, void *a2)
{
  return PKIsCouponCodeError(a2);
}

@end
