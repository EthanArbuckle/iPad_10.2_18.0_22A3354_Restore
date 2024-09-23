@implementation PKPeerPaymentFailureDiagnosticRequest

- (PKPeerPaymentFailureDiagnosticRequest)initWithFailureDiagnostic:(id)a3
{
  id v5;
  PKPeerPaymentFailureDiagnosticRequest *v6;
  PKPeerPaymentFailureDiagnosticRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentFailureDiagnosticRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_failureDiagnostic, a3);

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  unint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  objc_class *v30;
  int v32;
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v28;
    v34 = 2082;
    v35 = "url";
LABEL_23:
    _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v32, 0x16u);

    goto LABEL_24;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v28;
    v34 = 2082;
    v35 = "appleAccountInformation";
    goto LABEL_23;
  }
  if (!self->_failureDiagnostic)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v28;
      v34 = 2082;
      v35 = "_failureDiagnostic";
      goto LABEL_23;
    }
LABEL_24:

    v25 = 0;
    goto LABEL_25;
  }
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, &unk_1E2C3E7B8, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[PKPeerPaymentFailureDiagnostic flowType](self->_failureDiagnostic, "flowType"))
    v11 = CFSTR("unknown");
  else
    v11 = CFSTR("deviceTap");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("flowType"));
  v12 = -[PKPeerPaymentFailureDiagnostic role](self->_failureDiagnostic, "role");
  v13 = CFSTR("receiver");
  if (v12 != 1)
    v13 = CFSTR("unknown");
  if (v12)
    v14 = v13;
  else
    v14 = CFSTR("sender");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("role"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKPeerPaymentFailureDiagnostic reasonCode](self->_failureDiagnostic, "reasonCode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("reasonCode"));

  -[PKPeerPaymentFailureDiagnostic transactionIdentifier](self->_failureDiagnostic, "transactionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    -[PKPeerPaymentFailureDiagnostic transactionIdentifier](self->_failureDiagnostic, "transactionIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("transactionIdentifier"));

  }
  -[PKPeerPaymentFailureDiagnostic error](self->_failureDiagnostic, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "code"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("errorCode"));

    objc_msgSend(v20, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("errorDomain"));

    objc_msgSend(v20, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("errorDescription"));

  }
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPBody:", v24);

  v25 = (void *)objc_msgSend(v9, "copy");
LABEL_25:

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureDiagnostic, 0);
}

@end
