@implementation PKPeerPaymentRequestTokenRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5 deviceScore:(id)a6 odiAssessment:(id)a7 deviceMetadata:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *recipientIdentifier;
  NSDecimalNumber *amount;
  void *v25;
  NSString *currency;
  unint64_t v27;
  const __CFString *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  objc_class *v33;
  objc_class *v34;
  objc_class *v35;
  objc_class *v36;
  objc_class *v37;
  objc_class *v38;
  void *v39;
  NSString *senderAddress;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  const char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (!v14)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    v49 = 2082;
    v50 = "url";
LABEL_33:
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_34;
  }
  if (!v15)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    v49 = 2082;
    v50 = "appleAccountInformation";
    goto LABEL_33;
  }
  if (!v16)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    v49 = 2082;
    v50 = "deviceIdentifier";
    goto LABEL_33;
  }
  if (!v19)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    v49 = 2082;
    v50 = "deviceMetadata";
    goto LABEL_33;
  }
  if (!self->_recipientIdentifier)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    v49 = 2082;
    v50 = "_recipientIdentifier";
    goto LABEL_33;
  }
  if (!self->_amount)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    v49 = 2082;
    v50 = "_amount";
    goto LABEL_33;
  }
  if (!self->_currency)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    v49 = 2082;
    v50 = "_currency";
    goto LABEL_33;
  }
  if (!self->_senderAddress)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v31;
      v49 = 2082;
      v50 = "_senderAddress";
      goto LABEL_33;
    }
LABEL_34:

    v39 = 0;
    goto LABEL_35;
  }
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v14, &unk_1E2C3E650, 0, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHTTPMethod:", CFSTR("POST"));
  v46 = v21;
  objc_msgSend(v21, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", v16, CFSTR("deviceIdentifier"));
  recipientIdentifier = self->_recipientIdentifier;
  if (recipientIdentifier)
    objc_msgSend(v22, "setObject:forKey:", recipientIdentifier, CFSTR("recipientIdentifier"));
  amount = self->_amount;
  if (amount)
  {
    -[NSDecimalNumber stringValue](amount, "stringValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v25, CFSTR("amount"));

  }
  currency = self->_currency;
  if (currency)
    objc_msgSend(v22, "setObject:forKey:", currency, CFSTR("currency"));
  v27 = self->_source - 1;
  if (v27 > 2)
    v28 = CFSTR("unknown");
  else
    v28 = off_1E2ADC0F8[v27];
  objc_msgSend(v22, "setObject:forKey:", v28, CFSTR("source"));
  senderAddress = self->_senderAddress;
  if (senderAddress)
  {
    PKIDSNormalizedAddress(senderAddress);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
      objc_msgSend(v22, "setObject:forKey:", v42, CFSTR("senderAddress"));

  }
  if (v17)
  {
    objc_msgSend(v17, "hexEncoding");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v43, CFSTR("deviceScore"));

  }
  if (v18)
    objc_msgSend(v22, "setObject:forKey:", v18, CFSTR("odiAssessment"));
  objc_msgSend(v20, "dictionaryRepresentation");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", v44, CFSTR("deviceMetadata"));

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v22);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setHTTPBody:", v45);

  v39 = (void *)objc_msgSend(v46, "copy");
LABEL_35:

  return v39;
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (NSString)recipientPhoneOrEmail
{
  return self->_recipientPhoneOrEmail;
}

- (void)setRecipientPhoneOrEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientPhoneOrEmail, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
}

@end
