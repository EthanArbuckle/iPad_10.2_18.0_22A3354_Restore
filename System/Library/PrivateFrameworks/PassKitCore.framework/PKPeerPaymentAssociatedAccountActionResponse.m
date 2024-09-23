@implementation PKPeerPaymentAssociatedAccountActionResponse

- (PKPeerPaymentAssociatedAccountActionResponse)initWithData:(id)a3
{
  PKPeerPaymentAssociatedAccountActionResponse *v3;
  PKPeerPaymentAssociatedAccountActionResponse *v4;
  void *v5;
  id v6;
  PKPeerPaymentAssociatedAccountInformation *v7;
  NSObject *v8;
  uint64_t v9;
  PKPeerPaymentAssociatedAccountInformation *associatedAccountInformation;
  objc_class *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentAssociatedAccountActionResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v14, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = [PKPeerPaymentAssociatedAccountInformation alloc];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = -[PKPeerPaymentAssociatedAccountInformation initWithDictionary:lastUpdated:](v7, "initWithDictionary:lastUpdated:", v6, v8);

      associatedAccountInformation = v4->_associatedAccountInformation;
      v4->_associatedAccountInformation = (PKPeerPaymentAssociatedAccountInformation *)v9;

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v16 = v12;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Malformed PKPeerPaymentAssociatedAccountActionResponse: expected dictionary and received %{public}@", buf, 0xCu);

      }
    }

  }
  return v4;
}

- (PKPeerPaymentAssociatedAccountInformation)associatedAccountInformation
{
  return self->_associatedAccountInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedAccountInformation, 0);
}

@end
