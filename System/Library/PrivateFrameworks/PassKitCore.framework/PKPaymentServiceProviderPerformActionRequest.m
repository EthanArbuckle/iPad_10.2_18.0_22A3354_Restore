@implementation PKPaymentServiceProviderPerformActionRequest

- (PKPaymentServiceProviderPerformActionRequest)initWithAction:(id)a3 purchase:(id)a4
{
  id v6;
  id v7;
  PKPaymentServiceProviderPerformActionRequest *v8;
  uint64_t v9;
  NSString *action;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentServiceProviderPerformActionRequest;
  v8 = -[PKOverlayableWebServiceRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    action = v8->_action;
    v8->_action = (NSString *)v9;

    objc_storeStrong((id *)&v8->_purchase, a4);
  }

  return v8;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  PKServiceProviderPurchase *purchase;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("purchase");
  purchase = self->_purchase;
  v7 = a4;
  v8 = a3;
  -[PKServiceProviderPurchase identifier](purchase, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  v14[2] = CFSTR("action");
  v14[3] = self->_action;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v8, v10, 0, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
  v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PKServiceProviderPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
  objc_storeStrong((id *)&self->_purchase, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
