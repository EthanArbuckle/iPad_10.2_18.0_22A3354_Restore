@implementation PKPeerPaymentRecipientRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *recipientAddress;
  void *v15;
  NSString *senderAddress;
  void *v17;
  unint64_t v18;
  const __CFString *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  objc_class *v24;
  objc_class *v25;
  objc_class *v26;
  void *v27;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v22;
    v32 = 2082;
    v33 = "url";
LABEL_26:
    _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v30, 0x16u);

    goto LABEL_27;
  }
  if (!v9)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v22;
    v32 = 2082;
    v33 = "appleAccountInformation";
    goto LABEL_26;
  }
  if (!v10)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v22;
    v32 = 2082;
    v33 = "deviceIdentifier";
    goto LABEL_26;
  }
  if (!self->_recipientAddress)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v22;
    v32 = 2082;
    v33 = "_recipientAddress";
    goto LABEL_26;
  }
  if (!self->_senderAddress)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v22;
      v32 = 2082;
      v33 = "_senderAddress";
      goto LABEL_26;
    }
LABEL_27:

    v27 = 0;
    goto LABEL_28;
  }
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v8, &unk_1E2C3E638, 0, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v12, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(v12, "setTimeoutInterval:", 15.0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v11, CFSTR("deviceIdentifier"));
  recipientAddress = self->_recipientAddress;
  if (recipientAddress)
  {
    PKIDSNormalizedAddress(recipientAddress);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("recipientQuery"));

  }
  senderAddress = self->_senderAddress;
  if (senderAddress)
  {
    PKIDSNormalizedAddress(senderAddress);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("senderAddress"));

  }
  v18 = self->_recipientAddressSource - 1;
  if (v18 > 2)
    v19 = CFSTR("unknown");
  else
    v19 = off_1E2ADC0E0[v18];
  objc_msgSend(v13, "setObject:forKey:", v19, CFSTR("recipientSource"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v13);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPBody:", v29);

  v27 = (void *)objc_msgSend(v12, "copy");
LABEL_28:

  return v27;
}

- (NSString)recipientAddress
{
  return self->_recipientAddress;
}

- (void)setRecipientAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)recipientAddressSource
{
  return self->_recipientAddressSource;
}

- (void)setRecipientAddressSource:(unint64_t)a3
{
  self->_recipientAddressSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_recipientAddress, 0);
}

@end
