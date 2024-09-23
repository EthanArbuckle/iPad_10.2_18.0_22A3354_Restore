@implementation PKPaymentRequestCouponCodeUpdate

- (PKPaymentRequestCouponCodeUpdate)initWithPaymentSummaryItems:(id)a3
{
  return -[PKPaymentRequestCouponCodeUpdate initWithErrors:paymentSummaryItems:shippingMethods:](self, "initWithErrors:paymentSummaryItems:shippingMethods:", 0, a3, MEMORY[0x1E0C9AA60]);
}

- (PKPaymentRequestCouponCodeUpdate)initWithErrors:(NSArray *)errors paymentSummaryItems:(NSArray *)paymentSummaryItems shippingMethods:(NSArray *)shippingMethods
{
  NSArray *v8;
  NSArray *v9;
  PKPaymentRequestCouponCodeUpdate *v10;
  NSArray *v11;
  NSArray *v12;
  PKShippingMethods *v13;
  PKShippingMethods *availableShippingMethods;
  objc_super v16;

  v8 = errors;
  v9 = shippingMethods;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentRequestCouponCodeUpdate;
  v10 = -[PKPaymentRequestUpdate initWithPaymentSummaryItems:](&v16, sel_initWithPaymentSummaryItems_, paymentSummaryItems);
  if (v10)
  {
    if (v8)
    {
      +[PKPaymentAuthorizationResult sanitizedErrors:](PKPaymentAuthorizationResult, "sanitizedErrors:", v8);
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    }
    v12 = v10->_errors;
    v10->_errors = v11;

    if (v9)
    {
      v13 = -[PKShippingMethods initWithLegacyShippingMethods:]([PKShippingMethods alloc], "initWithLegacyShippingMethods:", v9);
      availableShippingMethods = v10->super._availableShippingMethods;
      v10->super._availableShippingMethods = v13;

    }
  }

  return v10;
}

- (PKPaymentRequestCouponCodeUpdate)initWithCoder:(id)a3
{
  id v4;
  PKPaymentRequestCouponCodeUpdate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *errors;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentRequestCouponCodeUpdate;
  v5 = -[PKPaymentRequestUpdate initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("errors"));
    v9 = objc_claimAutoreleasedReturnValue();
    errors = v5->_errors;
    v5->_errors = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentRequestCouponCodeUpdate;
  v4 = a3;
  -[PKPaymentRequestUpdate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_errors, CFSTR("errors"), v5.receiver, v5.super_class);

}

- (void)setErrors:(NSArray *)errors
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;

  v4 = errors;
  v5 = v4;
  if (self->_errors != v4)
  {
    v8 = v4;
    if (v4)
    {
      +[PKPaymentAuthorizationResult sanitizedErrors:](PKPaymentAuthorizationResult, "sanitizedErrors:", v4);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    }
    v7 = self->_errors;
    self->_errors = v6;

    v5 = v8;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
}

@end
