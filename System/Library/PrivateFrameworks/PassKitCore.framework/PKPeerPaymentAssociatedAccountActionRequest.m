@implementation PKPeerPaymentAssociatedAccountActionRequest

- (PKPeerPaymentAssociatedAccountActionRequest)initWithAssociatedAccountIdentifier:(id)a3
{
  id v5;
  PKPeerPaymentAssociatedAccountActionRequest *v6;
  PKPeerPaymentAssociatedAccountActionRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentAssociatedAccountActionRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_associatedAccountIdentifier, a3);

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *associatedAccountIdentifier;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSString *featureIdentifier;
  NSString *value;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  _QWORD v25[3];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v19;
    v28 = 2082;
    v29 = "url";
LABEL_21:
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_22;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v19;
    v28 = 2082;
    v29 = "appleAccountInformation";
    goto LABEL_21;
  }
  associatedAccountIdentifier = self->_associatedAccountIdentifier;
  if (!associatedAccountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v19;
    v28 = 2082;
    v29 = "_associatedAccountIdentifier";
    goto LABEL_21;
  }
  if (!self->_featureIdentifier)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v19;
    v28 = 2082;
    v29 = "_featureIdentifier";
    goto LABEL_21;
  }
  if (!self->_value)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v19;
      v28 = 2082;
      v29 = "_value";
      goto LABEL_21;
    }
LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }
  v25[0] = CFSTR("account");
  v25[1] = CFSTR("associatedAccountAction");
  v25[2] = associatedAccountIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, v10, 0, v8);
  v11 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v11, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v11, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier)
    objc_msgSend(v12, "setObject:forKey:", featureIdentifier, CFSTR("featureIdentifier"));
  value = self->_value;
  if (value)
    objc_msgSend(v13, "setObject:forKey:", value, CFSTR("value"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v11, "setHTTPBody:", v16);

  v17 = -[NSObject copy](v11, "copy");
LABEL_23:

  return v17;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedAccountIdentifier, 0);
}

@end
