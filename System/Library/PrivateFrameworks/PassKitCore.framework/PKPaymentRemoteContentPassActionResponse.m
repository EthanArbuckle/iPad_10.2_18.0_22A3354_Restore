@implementation PKPaymentRemoteContentPassActionResponse

- (PKPaymentRemoteContentPassActionResponse)initWithExistingAction:(id)a3 pass:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  PKPaymentRemoteContentPassActionResponse *v10;
  PKPaymentRemoteContentPassActionResponse *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  PKPaymentPassAction *updatedAction;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentRemoteContentPassActionResponse;
  v10 = -[PKWebServiceResponse initWithData:](&v23, sel_initWithData_, a5);
  v11 = v10;
  if (v10)
  {
    -[PKWebServiceResponse JSONObject](v10, "JSONObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
      objc_msgSend(v9, "secureElementPass");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "actionLocalizations");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "actionUpdatedWithDictionary:localizations:", v13, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      updatedAction = v11->_updatedAction;
      v11->_updatedAction = (PKPaymentPassAction *)v16;

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v25 = v19;
        v26 = 2112;
        v27 = v20;
        v21 = v20;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v14 = v11;
      v11 = 0;
    }

  }
  return v11;
}

- (PKPaymentPassAction)updatedAction
{
  return self->_updatedAction;
}

- (void)setUpdatedAction:(id)a3
{
  objc_storeStrong((id *)&self->_updatedAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedAction, 0);
}

@end
