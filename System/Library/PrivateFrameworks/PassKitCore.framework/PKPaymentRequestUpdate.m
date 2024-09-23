@implementation PKPaymentRequestUpdate

- (PKPaymentRequestUpdate)initWithPaymentSummaryItems:(NSArray *)paymentSummaryItems
{
  NSArray *v4;
  PKPaymentRequestUpdate *v5;
  PKPaymentRequestUpdate *v6;
  uint64_t v7;
  NSArray *v8;
  PKShippingMethods *v9;
  PKShippingMethods *availableShippingMethods;
  objc_super v12;

  v4 = paymentSummaryItems;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentRequestUpdate;
  v5 = -[PKPaymentRequestUpdate init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_status = 0;
    v7 = -[NSArray copy](v4, "copy");
    v8 = v6->_paymentSummaryItems;
    v6->_paymentSummaryItems = (NSArray *)v7;

    v9 = objc_alloc_init(PKShippingMethods);
    availableShippingMethods = v6->_availableShippingMethods;
    v6->_availableShippingMethods = v9;

  }
  return v6;
}

- (PKPaymentRequestUpdate)initWithCoder:(id)a3
{
  id v4;
  PKPaymentRequestUpdate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *multiTokenContexts;
  uint64_t v11;
  PKRecurringPaymentRequest *recurringPaymentRequest;
  uint64_t v13;
  PKAutomaticReloadPaymentRequest *automaticReloadPaymentRequest;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *paymentSummaryItems;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *contentItems;
  uint64_t v25;
  PKShippingMethods *availableShippingMethods;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  PKShippingMethods *v31;
  PKShippingMethods *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKPaymentRequestUpdate;
  v5 = -[PKPaymentRequestUpdate init](&v34, sel_init);
  if (v5)
  {
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("multiTokenContexts"));
    v9 = objc_claimAutoreleasedReturnValue();
    multiTokenContexts = v5->_multiTokenContexts;
    v5->_multiTokenContexts = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recurringPaymentRequest"));
    v11 = objc_claimAutoreleasedReturnValue();
    recurringPaymentRequest = v5->_recurringPaymentRequest;
    v5->_recurringPaymentRequest = (PKRecurringPaymentRequest *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("automaticReloadPaymentRequest"));
    v13 = objc_claimAutoreleasedReturnValue();
    automaticReloadPaymentRequest = v5->_automaticReloadPaymentRequest;
    v5->_automaticReloadPaymentRequest = (PKAutomaticReloadPaymentRequest *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("paymentSummaryItems"));
    v18 = objc_claimAutoreleasedReturnValue();
    paymentSummaryItems = v5->_paymentSummaryItems;
    v5->_paymentSummaryItems = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("paymentContentItems"));
    v23 = objc_claimAutoreleasedReturnValue();
    contentItems = v5->_contentItems;
    v5->_contentItems = (NSArray *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availableShippingMethods"));
    v25 = objc_claimAutoreleasedReturnValue();
    availableShippingMethods = v5->_availableShippingMethods;
    v5->_availableShippingMethods = (PKShippingMethods *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("shippingMethods"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5->_availableShippingMethods && v30)
    {
      v31 = -[PKShippingMethods initWithLegacyShippingMethods:]([PKShippingMethods alloc], "initWithLegacyShippingMethods:", v30);
      v32 = v5->_availableShippingMethods;
      v5->_availableShippingMethods = v31;

    }
  }

  return v5;
}

- (PKPaymentRequestUpdate)init
{
  return -[PKPaymentRequestUpdate initWithPaymentSummaryItems:](self, "initWithPaymentSummaryItems:", MEMORY[0x1E0C9AA60]);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t status;
  void *v5;
  id v6;

  status = self->_status;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", status, CFSTR("status"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_multiTokenContexts, CFSTR("multiTokenContexts"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_recurringPaymentRequest, CFSTR("recurringPaymentRequest"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_automaticReloadPaymentRequest, CFSTR("automaticReloadPaymentRequest"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_paymentSummaryItems, CFSTR("paymentSummaryItems"));
  -[PKShippingMethods legacyShippingMethods](self->_availableShippingMethods, "legacyShippingMethods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("shippingMethods"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_availableShippingMethods, CFSTR("availableShippingMethods"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_contentItems, CFSTR("paymentContentItems"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)shippingMethods
{
  return -[PKShippingMethods legacyShippingMethods](self->_availableShippingMethods, "legacyShippingMethods");
}

- (void)setShippingMethods:(NSArray *)shippingMethods
{
  PKShippingMethods *v4;
  PKShippingMethods *availableShippingMethods;
  NSArray *v6;

  v6 = shippingMethods;
  if (v6)
  {
    v4 = -[PKShippingMethods initWithLegacyShippingMethods:]([PKShippingMethods alloc], "initWithLegacyShippingMethods:", v6);
    availableShippingMethods = self->_availableShippingMethods;
    self->_availableShippingMethods = v4;
  }
  else
  {
    availableShippingMethods = self->_availableShippingMethods;
    self->_availableShippingMethods = 0;
  }

}

- (PKPaymentAuthorizationStatus)status
{
  return self->_status;
}

- (void)setStatus:(PKPaymentAuthorizationStatus)status
{
  self->_status = status;
}

- (NSArray)paymentSummaryItems
{
  return self->_paymentSummaryItems;
}

- (void)setPaymentSummaryItems:(NSArray *)paymentSummaryItems
{
  objc_setProperty_nonatomic_copy(self, a2, paymentSummaryItems, 24);
}

- (NSArray)multiTokenContexts
{
  return self->_multiTokenContexts;
}

- (void)setMultiTokenContexts:(NSArray *)multiTokenContexts
{
  objc_setProperty_nonatomic_copy(self, a2, multiTokenContexts, 32);
}

- (PKRecurringPaymentRequest)recurringPaymentRequest
{
  return self->_recurringPaymentRequest;
}

- (void)setRecurringPaymentRequest:(PKRecurringPaymentRequest *)recurringPaymentRequest
{
  objc_storeStrong((id *)&self->_recurringPaymentRequest, recurringPaymentRequest);
}

- (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest;
}

- (void)setAutomaticReloadPaymentRequest:(PKAutomaticReloadPaymentRequest *)automaticReloadPaymentRequest
{
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, automaticReloadPaymentRequest);
}

- (PKDeferredPaymentRequest)deferredPaymentRequest
{
  return self->_deferredPaymentRequest;
}

- (void)setDeferredPaymentRequest:(PKDeferredPaymentRequest *)deferredPaymentRequest
{
  objc_storeStrong((id *)&self->_deferredPaymentRequest, deferredPaymentRequest);
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (void)setContentItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (PKShippingMethods)availableShippingMethods
{
  return self->_availableShippingMethods;
}

- (void)setAvailableShippingMethods:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_deferredPaymentRequest, 0);
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, 0);
  objc_storeStrong((id *)&self->_recurringPaymentRequest, 0);
  objc_storeStrong((id *)&self->_multiTokenContexts, 0);
  objc_storeStrong((id *)&self->_paymentSummaryItems, 0);
  objc_storeStrong((id *)&self->_availableShippingMethods, 0);
}

@end
