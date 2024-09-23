@implementation PKPeerPaymentQuoteRequest

- (void)updateWithPaymentPass:(id)a3
{
  -[PKPeerPaymentQuoteRequest updateWithPaymentPass:externalFundingSource:](self, "updateWithPaymentPass:externalFundingSource:", a3, 1);
}

- (void)updateWithPaymentPass:(id)a3 externalFundingSource:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *paymentMethodDescription;
  NSString *v12;
  NSString *paymentMethodSuffix;
  id v14;

  v14 = a3;
  if (v14)
  {
    objc_msgSend(v14, "devicePrimaryInAppPaymentApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dpanIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentQuoteRequest setDPANIdentifier:](self, "setDPANIdentifier:", v7);

    objc_msgSend(v14, "primaryAccountIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentQuoteRequest setFPANIdentifier:](self, "setFPANIdentifier:", v8);

    if (self->_dpanIdentifier)
    {
      self->_externalFundingSource = a4;
      objc_msgSend(v14, "devicePrimaryInAppPaymentApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_paymentNetwork = objc_msgSend(v9, "paymentNetworkIdentifier");
      self->_paymentMethodType = objc_msgSend(v9, "paymentType");
      objc_msgSend(v14, "localizedDescription");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      paymentMethodDescription = self->_paymentMethodDescription;
      self->_paymentMethodDescription = v10;

      objc_msgSend(v14, "primaryAccountNumberSuffix");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      paymentMethodSuffix = self->_paymentMethodSuffix;
      self->_paymentMethodSuffix = v12;

    }
  }

}

- (PKPeerPaymentQuoteRequest)init
{
  PKPeerPaymentQuoteRequest *v2;
  void *v3;
  uint64_t v4;
  NSString *orderIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentQuoteRequest;
  v2 = -[PKOverlayableWebServiceRequest init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    orderIdentifier = v2->_orderIdentifier;
    v2->_orderIdentifier = (NSString *)v4;

  }
  return v2;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5 deviceScore:(id)a6 odiAssessment:(id)a7 deviceMetadata:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  unint64_t destination;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  objc_class *v26;
  objc_class *v27;
  objc_class *v28;
  objc_class *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  NSDecimalNumber *amount;
  void *v35;
  NSString *currency;
  __CFString *v37;
  __CFString *v38;
  unint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  objc_class *v42;
  NSObject *v43;
  const char *v44;
  objc_class *v45;
  objc_class *v46;
  objc_class *v47;
  void *v48;
  const __CFString *v49;
  unint64_t v50;
  const __CFString *v51;
  PKPeerPaymentRequestToken *requestToken;
  void *v53;
  const __CFString *v54;
  PKPeerPaymentRequestToken *v55;
  _BOOL4 v56;
  __CFString *v57;
  objc_class *v58;
  id v59;
  __CFString *v61;
  NSString *dpanIdentifier;
  NSString *fpanIdentifier;
  int64_t paymentNetwork;
  void *v65;
  unint64_t paymentMethodType;
  void *v67;
  NSString *paymentMethodDescription;
  NSString *paymentMethodSuffix;
  void *v70;
  NSString *recipientIdentifier;
  NSString *senderAddress;
  void *v73;
  NSString *recurringPaymentIdentifier;
  unint64_t frequency;
  void *v76;
  NSDate *startDate;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  PKPeerPaymentQuoteCertificatesResponse *quoteCertificatesResponse;
  void *v83;
  void *v84;
  void *v85;
  NSString *bankName;
  NSString *routingNumber;
  NSString *accountNumber;
  NSObject *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  NSDecimalNumber *threshold;
  void *v102;
  PKPeerPaymentQuoteCertificatesResponse *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  int v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  uint8_t buf[4];
  void *v117;
  __int16 v118;
  const char *v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (v14)
  {
    if (!v15)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v117 = v24;
        v118 = 2082;
        v119 = "appleAccountInformation";
        goto LABEL_87;
      }
      goto LABEL_88;
    }
    if (!v16)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v117 = v24;
        v118 = 2082;
        v119 = "deviceIdentifier";
        goto LABEL_87;
      }
      goto LABEL_88;
    }
    if (!v19)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v117 = v24;
        v118 = 2082;
        v119 = "deviceMetadata";
        goto LABEL_87;
      }
      goto LABEL_88;
    }
    if (!self->_amount)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v117 = v24;
        v118 = 2082;
        v119 = "_amount";
        goto LABEL_87;
      }
      goto LABEL_88;
    }
    if (!self->_currency)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v117 = v24;
        v118 = 2082;
        v119 = "_currency";
        goto LABEL_87;
      }
      goto LABEL_88;
    }
    if (self->_externalFundingSource == 1 && !self->_dpanIdentifier)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v117 = v24;
        v118 = 2082;
        v119 = "_dpanIdentifier";
        goto LABEL_87;
      }
      goto LABEL_88;
    }
    destination = self->_destination;
    if (destination == 2)
    {
      if (!self->_bankName)
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v117 = v24;
          v118 = 2082;
          v119 = "_bankName";
          goto LABEL_87;
        }
        goto LABEL_88;
      }
      if (!self->_routingNumber)
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v47 = (objc_class *)objc_opt_class();
          NSStringFromClass(v47);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v117 = v24;
          v118 = 2082;
          v119 = "_routingNumber";
          goto LABEL_87;
        }
        goto LABEL_88;
      }
      if (!self->_accountNumber)
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v58 = (objc_class *)objc_opt_class();
          NSStringFromClass(v58);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v117 = v24;
          v118 = 2082;
          v119 = "_accountNumber";
          goto LABEL_87;
        }
        goto LABEL_88;
      }
    }
    else if (destination == 1)
    {
      if (!self->_recipientIdentifier)
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v45 = (objc_class *)objc_opt_class();
          NSStringFromClass(v45);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v117 = v24;
          v118 = 2082;
          v119 = "_recipientIdentifier";
          goto LABEL_87;
        }
        goto LABEL_88;
      }
      if (!self->_senderAddress)
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v117 = v24;
          v118 = 2082;
          v119 = "_senderAddress";
LABEL_87:
          _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

          goto LABEL_88;
        }
        goto LABEL_88;
      }
    }
    v110 = v18;
    -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v14, &unk_1E2C3E680, 0, v15);
    v22 = objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPMethod:](v22, "setHTTPMethod:", CFSTR("POST"));
    -[NSObject setValue:forHTTPHeaderField:](v22, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v17;
    if (v17)
    {
      objc_msgSend(v17, "hexEncoding");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKey:", v32, CFSTR("deviceScore"));

    }
    if (v110)
      objc_msgSend(v31, "setObject:forKey:", v110, CFSTR("odiAssessment"));
    objc_msgSend(v20, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", v33, CFSTR("deviceMetadata"));

    objc_msgSend(v31, "setObject:forKey:", v16, CFSTR("deviceIdentifier"));
    objc_msgSend(v31, "setObject:forKey:", self->_orderIdentifier, CFSTR("orderIdentifier"));
    amount = self->_amount;
    if (amount)
    {
      -[NSDecimalNumber stringValue](amount, "stringValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKey:", v35, CFSTR("amount"));

    }
    currency = self->_currency;
    if (currency)
      objc_msgSend(v31, "setObject:forKey:", currency, CFSTR("currency"));
    if (self->_externalFundingSource == 1)
      v37 = CFSTR("dpan");
    else
      v37 = CFSTR("none");
    v38 = v37;
    objc_msgSend(v31, "setObject:forKey:", v38, CFSTR("externalFundingSource"));

    v39 = self->_source - 1;
    if (v39 > 2)
      v40 = CFSTR("unknown");
    else
      v40 = off_1E2ADC140[v39];
    objc_msgSend(v31, "setObject:forKey:", v40, CFSTR("source"));
    if (!self->_preserveCurrentBalance)
      goto LABEL_62;
    if (self->_externalFundingSource == 1)
    {
      if (self->_dpanIdentifier)
      {
        v41 = 1;
        goto LABEL_63;
      }
      PKLogFacilityTypeGetObject(0xBuLL);
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        goto LABEL_61;
      *(_WORD *)buf = 0;
      v44 = "Ignoring request for preserveCurrentBalance because dpanIdentifier is missing";
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
LABEL_61:

LABEL_62:
        v41 = 0;
LABEL_63:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v41);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v48, CFSTR("preserveCurrentBalance"));

        v49 = CFSTR("recipient");
        switch(self->_destination)
        {
          case 0uLL:
            goto LABEL_70;
          case 1uLL:
            goto LABEL_69;
          case 2uLL:
            v49 = CFSTR("bankAccount");
            goto LABEL_69;
          case 3uLL:
            v49 = CFSTR("self");
            goto LABEL_69;
          case 4uLL:
            v49 = CFSTR("instantWithdrawal");
            goto LABEL_69;
          case 5uLL:
            v49 = CFSTR("undeterminedRecipient");
            goto LABEL_69;
          default:
            v49 = CFSTR("unknown");
LABEL_69:
            objc_msgSend(v31, "setObject:forKey:", v49, CFSTR("destination"));
LABEL_70:
            v50 = self->_source - 1;
            if (v50 > 2)
              v51 = CFSTR("unknown");
            else
              v51 = off_1E2ADC140[v50];
            objc_msgSend(v31, "setObject:forKey:", v51, CFSTR("source"));
            requestToken = self->_requestToken;
            if (requestToken
              && !-[PKPeerPaymentRequestToken isInformalRequestToken](requestToken, "isInformalRequestToken"))
            {
              -[PKPeerPaymentRequestToken requestToken](self->_requestToken, "requestToken");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKey:", v53, CFSTR("requestToken"));

            }
            v54 = CFSTR("user");
            switch(self->_context)
            {
              case 0uLL:
                v55 = self->_requestToken;
                if (v55)
                {
                  v56 = -[PKPeerPaymentRequestToken isInformalRequestToken](v55, "isInformalRequestToken", CFSTR("user"));
                  v57 = CFSTR("formalRequest");
                  if (v56)
                    v57 = CFSTR("informalRequest");
                }
                else
                {
                  v57 = CFSTR("user");
                }
                v61 = v57;
                objc_msgSend(v31, "setObject:forKey:", v61, CFSTR("context"));

                goto LABEL_92;
              case 1uLL:
                goto LABEL_84;
              case 2uLL:
                v54 = CFSTR("formalRequest");
                goto LABEL_84;
              case 3uLL:
                v54 = CFSTR("informalRequest");
                goto LABEL_84;
              default:
                v54 = CFSTR("unknown");
LABEL_84:
                objc_msgSend(v31, "setObject:forKey:", v54, CFSTR("context"));
LABEL_92:
                if (self->_externalFundingSource == 1 || self->_destination == 4)
                {
                  dpanIdentifier = self->_dpanIdentifier;
                  if (dpanIdentifier)
                    objc_msgSend(v31, "setObject:forKey:", dpanIdentifier, CFSTR("dpanIdentifier"));
                  fpanIdentifier = self->_fpanIdentifier;
                  if (fpanIdentifier)
                    objc_msgSend(v31, "setObject:forKey:", fpanIdentifier, CFSTR("fpanIdentifier"));
                  paymentNetwork = self->_paymentNetwork;
                  if (paymentNetwork)
                  {
                    PKPaymentNetworkNameForPaymentCredentialType(paymentNetwork);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "setObject:forKey:", v65, CFSTR("paymentNetwork"));

                  }
                  paymentMethodType = self->_paymentMethodType;
                  if (paymentMethodType)
                  {
                    PKPaymentMethodTypeToString(paymentMethodType);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "setObject:forKey:", v67, CFSTR("paymentMethodType"));

                  }
                  paymentMethodDescription = self->_paymentMethodDescription;
                  if (paymentMethodDescription)
                    objc_msgSend(v31, "setObject:forKey:", paymentMethodDescription, CFSTR("paymentMethodDescription"));
                  paymentMethodSuffix = self->_paymentMethodSuffix;
                  if (paymentMethodSuffix)
                    objc_msgSend(v31, "setObject:forKey:", paymentMethodSuffix, CFSTR("paymentMethodSuffix"));
                }
                break;
            }
            break;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasUpdatedPaymentMethod);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v70, CFSTR("hasUpdatedPaymentMethod"));

        switch(self->_destination)
        {
          case 1uLL:
            recipientIdentifier = self->_recipientIdentifier;
            if (recipientIdentifier)
              objc_msgSend(v31, "setObject:forKey:", recipientIdentifier, CFSTR("recipientIdentifier"));
            senderAddress = self->_senderAddress;
            if (senderAddress)
            {
              PKIDSNormalizedAddress(senderAddress);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              if (v73)
                objc_msgSend(v31, "setObject:forKey:", v73, CFSTR("senderAddress"));

            }
            recurringPaymentIdentifier = self->_recurringPaymentIdentifier;
            if (recurringPaymentIdentifier)
              objc_msgSend(v31, "setObject:forKey:", recurringPaymentIdentifier, CFSTR("recurringPaymentIdentifier"));
            frequency = self->_frequency;
            if (frequency)
            {
              PKPeerPaymentRecurringPaymentFrequencyToString(frequency);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKey:", v76, CFSTR("frequency"));

            }
            startDate = self->_startDate;
            if (startDate)
            {
              objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "timeZone");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              PKPaymentDateStringFromDateWithTimeZone(startDate, v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKey:", v80, CFSTR("startDate"));

            }
            if (!self->_recurringPaymentIdentifier)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sendImmediately);
              v81 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKey:", v81, CFSTR("sendImmediately"));
              goto LABEL_145;
            }
            goto LABEL_150;
          case 2uLL:
            quoteCertificatesResponse = self->_quoteCertificatesResponse;
            if (!quoteCertificatesResponse)
              goto LABEL_143;
            -[PKPeerPaymentQuoteCertificatesResponse encryptionVersion](quoteCertificatesResponse, "encryptionVersion");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = objc_msgSend(v83, "isEqualToString:", CFSTR("EV_ECC_v1-ASN.1"));

            if (v111)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = v84;
              bankName = self->_bankName;
              if (bankName)
                objc_msgSend(v84, "setObject:forKey:", bankName, CFSTR("bankName"));
              routingNumber = self->_routingNumber;
              if (routingNumber)
                objc_msgSend(v85, "setObject:forKey:", routingNumber, CFSTR("routingNumber"));
              v107 = v31;
              accountNumber = self->_accountNumber;
              if (accountNumber)
                objc_msgSend(v85, "setObject:forKey:", accountNumber, CFSTR("accountNumber"));
              PKLogFacilityTypeGetObject(0xBuLL);
              v89 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
              {
                v112 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v85, "allKeys");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v112, "stringWithFormat:", CFSTR("Encrypted Account Number keys: %@"), v90);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138477827;
                v117 = v113;
                _os_log_impl(&dword_18FC92000, v89, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);

              }
              v91 = v89;
              v109 = v85;
              objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v85);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPeerPaymentQuoteCertificatesResponse encryptionCertificates](self->_quoteCertificatesResponse, "encryptionCertificates");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = 0;
              v94 = v92;
              PKPeerPaymentEncryptDataWithCertChain(v92, v93, &v115);
              v95 = objc_claimAutoreleasedReturnValue();
              v114 = v115;

              v96 = (void *)v95;
              if (v95)
              {
                v97 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v95, 4);
                v31 = v107;
                objc_msgSend(v107, "setObject:forKey:", v97, CFSTR("encryptedAccountNumbers"));
                objc_msgSend(v107, "setObject:forKey:", CFSTR("EV_ECC_v1-ASN.1"), CFSTR("encryptionVersion"));
                objc_msgSend(v114, "hexEncoding");
                v98 = v96;
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "setObject:forKey:", v99, CFSTR("publicKeyHash"));

                v100 = (void *)v97;
              }
              else
              {
                v100 = v91;
                if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18FC92000, v91, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate encrypted account numbers structure. This is bad!", buf, 2u);
                }
                v98 = 0;
                v31 = v107;
              }

            }
            else
            {
              v103 = self->_quoteCertificatesResponse;
              if (v103)
              {
                PKLogFacilityTypeGetObject(0xBuLL);
                v104 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                {
                  -[PKPeerPaymentQuoteCertificatesResponse encryptionVersion](v103, "encryptionVersion");
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v117 = v105;
                  _os_log_impl(&dword_18FC92000, v104, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate encrypted account numbers structure. Unknown encryption version: %{public}@", buf, 0xCu);

                }
              }
              else
              {
LABEL_143:
                PKLogFacilityTypeGetObject(0xBuLL);
                v81 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18FC92000, v81, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate encrypted account numbers structure. Missing quoteCertificatesResponse.", buf, 2u);
                }
LABEL_145:

              }
            }
LABEL_150:
            objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v31);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setHTTPBody:](v22, "setHTTPBody:", v106);

            v59 = -[NSObject copy](v22, "copy");
            v17 = v108;
            v18 = v110;
            goto LABEL_89;
          case 3uLL:
            threshold = self->_threshold;
            if (threshold)
              objc_msgSend(v31, "setObject:forKey:", threshold, CFSTR("threshold"));
            if (self->_recurringPaymentIdentifier)
              goto LABEL_138;
            goto LABEL_150;
          case 5uLL:
            PKPeerPaymentPaymentModeToString(self->_paymentMode);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKey:", v102, CFSTR("paymentMode"));

            if (self->_deviceTapFlow)
LABEL_138:
              objc_msgSend(v31, "setObject:forKey:");
            goto LABEL_150;
          default:
            goto LABEL_150;
        }
      }
      *(_WORD *)buf = 0;
      v44 = "Ignoring request for preserveCurrentBalance because the externalFundingSourceType is not DPAN";
    }
    _os_log_impl(&dword_18FC92000, v43, OS_LOG_TYPE_DEFAULT, v44, buf, 2u);
    goto LABEL_61;
  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v117 = v24;
    v118 = 2082;
    v119 = "url";
    goto LABEL_87;
  }
LABEL_88:
  v59 = 0;
LABEL_89:

  return v59;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentQuoteRequest)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentQuoteRequest *v5;
  uint64_t v6;
  NSString *orderIdentifier;
  uint64_t v8;
  NSDecimalNumber *amount;
  uint64_t v10;
  NSString *currency;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PKPeerPaymentRequestToken *requestToken;
  uint64_t v18;
  NSString *dpanIdentifier;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *paymentMethodDescription;
  uint64_t v24;
  NSString *paymentMethodSuffix;
  uint64_t v26;
  NSString *recipientIdentifier;
  uint64_t v28;
  NSString *senderAddress;
  uint64_t v30;
  NSString *recipientPhoneOrEmail;
  uint64_t v32;
  NSString *routingNumber;
  uint64_t v34;
  NSString *accountNumber;
  uint64_t v36;
  PKPeerPaymentQuoteCertificatesResponse *quoteCertificatesResponse;
  uint64_t v38;
  NSString *recurringPaymentIdentifier;
  uint64_t v40;
  NSDate *startDate;
  uint64_t v42;
  NSDecimalNumber *threshold;
  void *v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKPeerPaymentQuoteRequest;
  v5 = -[PKOverlayableWebServiceRequest init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orderIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    orderIdentifier = v5->_orderIdentifier;
    v5->_orderIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v8 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v10 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalFundingSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_externalFundingSource = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destination"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_destination = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_context = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_source = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestToken"));
    v16 = objc_claimAutoreleasedReturnValue();
    requestToken = v5->_requestToken;
    v5->_requestToken = (PKPeerPaymentRequestToken *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dpanIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentNetwork"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_paymentNetwork = objc_msgSend(v20, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentMethodType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_paymentMethodType = objc_msgSend(v21, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentMethodDescription"));
    v22 = objc_claimAutoreleasedReturnValue();
    paymentMethodDescription = v5->_paymentMethodDescription;
    v5->_paymentMethodDescription = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentMethodSuffix"));
    v24 = objc_claimAutoreleasedReturnValue();
    paymentMethodSuffix = v5->_paymentMethodSuffix;
    v5->_paymentMethodSuffix = (NSString *)v24;

    v5->_hasUpdatedPaymentMethod = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasUpdatedPaymentMethod"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    recipientIdentifier = v5->_recipientIdentifier;
    v5->_recipientIdentifier = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderAddress"));
    v28 = objc_claimAutoreleasedReturnValue();
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientPhoneOrEmail"));
    v30 = objc_claimAutoreleasedReturnValue();
    recipientPhoneOrEmail = v5->_recipientPhoneOrEmail;
    v5->_recipientPhoneOrEmail = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routingNumber"));
    v32 = objc_claimAutoreleasedReturnValue();
    routingNumber = v5->_routingNumber;
    v5->_routingNumber = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountNumber"));
    v34 = objc_claimAutoreleasedReturnValue();
    accountNumber = v5->_accountNumber;
    v5->_accountNumber = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quoteCertificatesResponse"));
    v36 = objc_claimAutoreleasedReturnValue();
    quoteCertificatesResponse = v5->_quoteCertificatesResponse;
    v5->_quoteCertificatesResponse = (PKPeerPaymentQuoteCertificatesResponse *)v36;

    v5->_preserveCurrentBalance = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preserveCurrentBalance"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recurringPaymentIdentifier"));
    v38 = objc_claimAutoreleasedReturnValue();
    recurringPaymentIdentifier = v5->_recurringPaymentIdentifier;
    v5->_recurringPaymentIdentifier = (NSString *)v38;

    v5->_frequency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("frequency"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v40 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threshold"));
    v42 = objc_claimAutoreleasedReturnValue();
    threshold = v5->_threshold;
    v5->_threshold = (NSDecimalNumber *)v42;

    v5->_sendImmediately = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sendImmediately"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentMode"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_paymentMode = objc_msgSend(v44, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *orderIdentifier;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  orderIdentifier = self->_orderIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", orderIdentifier, CFSTR("orderIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_externalFundingSource);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("externalFundingSource"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_destination);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("destination"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_context);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("context"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_source);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("source"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_requestToken, CFSTR("requestToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dpanIdentifier, CFSTR("dpanIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_paymentNetwork);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("paymentNetwork"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_paymentMethodType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("paymentMethodType"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentMethodDescription, CFSTR("paymentMethodDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentMethodSuffix, CFSTR("paymentMethodSuffix"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasUpdatedPaymentMethod, CFSTR("hasUpdatedPaymentMethod"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientIdentifier, CFSTR("recipientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderAddress, CFSTR("senderAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientPhoneOrEmail, CFSTR("recipientPhoneOrEmail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routingNumber, CFSTR("routingNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountNumber, CFSTR("accountNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_quoteCertificatesResponse, CFSTR("quoteCertificatesResponse"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_preserveCurrentBalance, CFSTR("preserveCurrentBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recurringPaymentIdentifier, CFSTR("recurringPaymentIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_frequency, CFSTR("frequency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_threshold, CFSTR("threshold"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_sendImmediately, CFSTR("sendImmediately"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_paymentMode);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("paymentMode"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("orderIdentifier: '%@'; "), self->_orderIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("amount: '%@'; "), self->_amount);
  objc_msgSend(v6, "appendFormat:", CFSTR("currency: '%@'; "), self->_currency);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_externalFundingSource);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("externalFundingSource: '%@'; "), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_destination);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("destination: '%@'; "), v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_context);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("context: '%@'; "), v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_source);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("source: '%@'; "), v10);

  objc_msgSend(v6, "appendFormat:", CFSTR("requestToken: '%@'; "), self->_requestToken);
  objc_msgSend(v6, "appendFormat:", CFSTR("dpanIdentifier: '%@'; "), self->_dpanIdentifier);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_paymentNetwork);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("paymentNetwork: '%@'; "), v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_paymentMethodType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("paymentMethodType: '%@'; "), v12);

  objc_msgSend(v6, "appendFormat:", CFSTR("paymentMethodDescription: '%@'; "), self->_paymentMethodDescription);
  objc_msgSend(v6, "appendFormat:", CFSTR("paymentMethodSuffix: '%@'; "), self->_paymentMethodSuffix);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasUpdatedPaymentMethod);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("hasUpdatedPaymentMethod: '%@'; "), v13);

  objc_msgSend(v6, "appendFormat:", CFSTR("recipientIdentifier: '%@'; "), self->_recipientIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("senderAddress: '%@'; "), self->_senderAddress);
  objc_msgSend(v6, "appendFormat:", CFSTR("recipientPhoneOrEmail: '%@'; "), self->_recipientPhoneOrEmail);
  objc_msgSend(v6, "appendFormat:", CFSTR("routingNumber: '%@'; "), self->_routingNumber);
  objc_msgSend(v6, "appendFormat:", CFSTR("accountNumber: '%@'; "), self->_accountNumber);
  objc_msgSend(v6, "appendFormat:", CFSTR("quoteCertificatesResponse: '%@'; "), self->_quoteCertificatesResponse);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preserveCurrentBalance);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("preserveCurrentBalance: '%@'; "), v14);

  objc_msgSend(v6, "appendFormat:", CFSTR("recurringPaymentIdentifier: '%@'; "), self->_recurringPaymentIdentifier);
  PKPeerPaymentRecurringPaymentFrequencyToString(self->_frequency);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("frequency: '%@'; "), v15);

  objc_msgSend(v6, "appendFormat:", CFSTR("startDate: '%@'; "), self->_startDate);
  objc_msgSend(v6, "appendFormat:", CFSTR("threshold: '%@'; "), self->_threshold);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sendImmediately);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("sendImmediately: '%@'; "), v16);

  PKPeerPaymentPaymentModeToString(self->_paymentMode);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("paymentMode: %@"), v17);

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_orderIdentifier)
    objc_msgSend(v3, "addObject:");
  if (self->_amount)
    objc_msgSend(v4, "addObject:");
  if (self->_currency)
    objc_msgSend(v4, "addObject:");
  if (self->_requestToken)
    objc_msgSend(v4, "addObject:");
  if (self->_dpanIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_paymentMethodDescription)
    objc_msgSend(v4, "addObject:");
  if (self->_paymentMethodSuffix)
    objc_msgSend(v4, "addObject:");
  if (self->_recipientIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_senderAddress)
    objc_msgSend(v4, "addObject:");
  if (self->_recipientPhoneOrEmail)
    objc_msgSend(v4, "addObject:");
  if (self->_routingNumber)
    objc_msgSend(v4, "addObject:");
  if (self->_accountNumber)
    objc_msgSend(v4, "addObject:");
  if (self->_quoteCertificatesResponse)
    objc_msgSend(v4, "addObject:");
  if (self->_recurringPaymentIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_startDate)
    objc_msgSend(v4, "addObject:");
  if (self->_threshold)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_externalFundingSource - v5 + 32 * v5;
  v7 = self->_destination - v6 + 32 * v6;
  v8 = self->_context - v7 + 32 * v7;
  v9 = self->_source - v8 + 32 * v8;
  v10 = self->_paymentNetwork - v9 + 32 * v9;
  v11 = self->_paymentMethodType - v10 + 32 * v10;
  v12 = self->_hasUpdatedPaymentMethod - v11 + 32 * v11;
  v13 = self->_preserveCurrentBalance - v12 + 32 * v12;
  v14 = self->_frequency - v13 + 32 * v13;
  v15 = self->_sendImmediately - v14 + 32 * v14;
  v16 = self->_paymentMode - v15 + 32 * v15;

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentQuoteRequest *v4;
  PKPeerPaymentQuoteRequest *v5;
  BOOL v6;

  v4 = (PKPeerPaymentQuoteRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPeerPaymentQuoteRequest isEqualToPeerPaymentQuoteRequest:](self, "isEqualToPeerPaymentQuoteRequest:", v5);

  return v6;
}

- (BOOL)isEqualToPeerPaymentQuoteRequest:(id)a3
{
  _QWORD *v4;
  NSString *orderIdentifier;
  NSString *v6;
  BOOL v7;
  NSDecimalNumber *amount;
  NSDecimalNumber *v9;
  BOOL v10;
  NSString *currency;
  NSString *v12;
  BOOL v13;
  PKPeerPaymentRequestToken *requestToken;
  PKPeerPaymentRequestToken *v15;
  NSString *dpanIdentifier;
  NSString *v17;
  NSString *paymentMethodDescription;
  NSString *v19;
  NSString *paymentMethodSuffix;
  NSString *v21;
  NSString *recipientIdentifier;
  NSString *v23;
  NSString *senderAddress;
  NSString *v25;
  NSString *recipientPhoneOrEmail;
  NSString *v27;
  NSString *routingNumber;
  NSString *v29;
  NSString *accountNumber;
  NSString *v31;
  PKPeerPaymentQuoteCertificatesResponse *quoteCertificatesResponse;
  PKPeerPaymentQuoteCertificatesResponse *v33;
  NSString *recurringPaymentIdentifier;
  NSString *v35;
  NSDate *startDate;
  NSDate *v37;
  NSDecimalNumber *threshold;
  NSDecimalNumber *v39;
  BOOL v40;

  v4 = a3;
  orderIdentifier = self->_orderIdentifier;
  v6 = (NSString *)v4[12];
  if (orderIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (orderIdentifier != v6)
      goto LABEL_101;
  }
  else if ((-[NSString isEqual:](orderIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_101;
  }
  amount = self->_amount;
  v9 = (NSDecimalNumber *)v4[13];
  if (amount)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (amount != v9)
      goto LABEL_101;
  }
  else if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0)
  {
    goto LABEL_101;
  }
  currency = self->_currency;
  v12 = (NSString *)v4[14];
  if (currency)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    if (currency != v12)
      goto LABEL_101;
  }
  else if ((-[NSString isEqual:](currency, "isEqual:") & 1) == 0)
  {
    goto LABEL_101;
  }
  if (self->_externalFundingSource != v4[15]
    || self->_destination != v4[16]
    || self->_context != v4[17]
    || self->_source != v4[18])
  {
    goto LABEL_101;
  }
  requestToken = self->_requestToken;
  v15 = (PKPeerPaymentRequestToken *)v4[19];
  if (requestToken && v15)
  {
    if (!-[PKPeerPaymentRequestToken isEqual:](requestToken, "isEqual:"))
      goto LABEL_101;
  }
  else if (requestToken != v15)
  {
    goto LABEL_101;
  }
  dpanIdentifier = self->_dpanIdentifier;
  v17 = (NSString *)v4[20];
  if (dpanIdentifier && v17)
  {
    if ((-[NSString isEqual:](dpanIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_101;
  }
  else if (dpanIdentifier != v17)
  {
    goto LABEL_101;
  }
  if (self->_paymentNetwork != v4[22] || self->_paymentMethodType != v4[23])
    goto LABEL_101;
  paymentMethodDescription = self->_paymentMethodDescription;
  v19 = (NSString *)v4[24];
  if (paymentMethodDescription && v19)
  {
    if ((-[NSString isEqual:](paymentMethodDescription, "isEqual:") & 1) == 0)
      goto LABEL_101;
  }
  else if (paymentMethodDescription != v19)
  {
    goto LABEL_101;
  }
  paymentMethodSuffix = self->_paymentMethodSuffix;
  v21 = (NSString *)v4[25];
  if (paymentMethodSuffix && v21)
  {
    if ((-[NSString isEqual:](paymentMethodSuffix, "isEqual:") & 1) == 0)
      goto LABEL_101;
  }
  else if (paymentMethodSuffix != v21)
  {
    goto LABEL_101;
  }
  if (self->_hasUpdatedPaymentMethod != *((unsigned __int8 *)v4 + 89))
    goto LABEL_101;
  recipientIdentifier = self->_recipientIdentifier;
  v23 = (NSString *)v4[26];
  if (recipientIdentifier && v23)
  {
    if ((-[NSString isEqual:](recipientIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_101;
  }
  else if (recipientIdentifier != v23)
  {
    goto LABEL_101;
  }
  senderAddress = self->_senderAddress;
  v25 = (NSString *)v4[27];
  if (senderAddress && v25)
  {
    if ((-[NSString isEqual:](senderAddress, "isEqual:") & 1) == 0)
      goto LABEL_101;
  }
  else if (senderAddress != v25)
  {
    goto LABEL_101;
  }
  recipientPhoneOrEmail = self->_recipientPhoneOrEmail;
  v27 = (NSString *)v4[30];
  if (recipientPhoneOrEmail && v27)
  {
    if ((-[NSString isEqual:](recipientPhoneOrEmail, "isEqual:") & 1) == 0)
      goto LABEL_101;
  }
  else if (recipientPhoneOrEmail != v27)
  {
    goto LABEL_101;
  }
  routingNumber = self->_routingNumber;
  v29 = (NSString *)v4[32];
  if (routingNumber && v29)
  {
    if ((-[NSString isEqual:](routingNumber, "isEqual:") & 1) == 0)
      goto LABEL_101;
  }
  else if (routingNumber != v29)
  {
    goto LABEL_101;
  }
  accountNumber = self->_accountNumber;
  v31 = (NSString *)v4[33];
  if (accountNumber && v31)
  {
    if ((-[NSString isEqual:](accountNumber, "isEqual:") & 1) == 0)
      goto LABEL_101;
  }
  else if (accountNumber != v31)
  {
    goto LABEL_101;
  }
  quoteCertificatesResponse = self->_quoteCertificatesResponse;
  v33 = (PKPeerPaymentQuoteCertificatesResponse *)v4[34];
  if (quoteCertificatesResponse && v33)
  {
    if ((-[PKPeerPaymentQuoteCertificatesResponse isEqual:](quoteCertificatesResponse, "isEqual:") & 1) == 0)
      goto LABEL_101;
  }
  else if (quoteCertificatesResponse != v33)
  {
    goto LABEL_101;
  }
  recurringPaymentIdentifier = self->_recurringPaymentIdentifier;
  v35 = (NSString *)v4[35];
  if (recurringPaymentIdentifier && v35)
  {
    if ((-[NSString isEqual:](recurringPaymentIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_101;
  }
  else if (recurringPaymentIdentifier != v35)
  {
    goto LABEL_101;
  }
  startDate = self->_startDate;
  v37 = (NSDate *)v4[37];
  if (startDate && v37)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
      goto LABEL_101;
  }
  else if (startDate != v37)
  {
    goto LABEL_101;
  }
  threshold = self->_threshold;
  v39 = (NSDecimalNumber *)v4[38];
  if (!threshold || !v39)
  {
    if (threshold == v39)
      goto LABEL_97;
LABEL_101:
    v40 = 0;
    goto LABEL_102;
  }
  if ((-[NSDecimalNumber isEqual:](threshold, "isEqual:") & 1) == 0)
    goto LABEL_101;
LABEL_97:
  if (self->_frequency != v4[36]
    || self->_sendImmediately != *((unsigned __int8 *)v4 + 90)
    || self->_paymentMode != v4[28])
  {
    goto LABEL_101;
  }
  v40 = self->_preserveCurrentBalance == *((unsigned __int8 *)v4 + 88);
LABEL_102:

  return v40;
}

- (NSString)orderIdentifier
{
  return self->_orderIdentifier;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)preserveCurrentBalance
{
  return self->_preserveCurrentBalance;
}

- (void)setPreserveCurrentBalance:(BOOL)a3
{
  self->_preserveCurrentBalance = a3;
}

- (unint64_t)externalFundingSource
{
  return self->_externalFundingSource;
}

- (void)setExternalFundingSource:(unint64_t)a3
{
  self->_externalFundingSource = a3;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (PKPeerPaymentRequestToken)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
  objc_storeStrong((id *)&self->_requestToken, a3);
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDPANIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFPANIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (int64_t)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(int64_t)a3
{
  self->_paymentNetwork = a3;
}

- (unint64_t)paymentMethodType
{
  return self->_paymentMethodType;
}

- (void)setPaymentMethodType:(unint64_t)a3
{
  self->_paymentMethodType = a3;
}

- (NSString)paymentMethodDescription
{
  return self->_paymentMethodDescription;
}

- (void)setPaymentMethodDescription:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethodDescription, a3);
}

- (NSString)paymentMethodSuffix
{
  return self->_paymentMethodSuffix;
}

- (void)setPaymentMethodSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethodSuffix, a3);
}

- (BOOL)hasUpdatedPaymentMethod
{
  return self->_hasUpdatedPaymentMethod;
}

- (void)setHasUpdatedPaymentMethod:(BOOL)a3
{
  self->_hasUpdatedPaymentMethod = a3;
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (unint64_t)paymentMode
{
  return self->_paymentMode;
}

- (void)setPaymentMode:(unint64_t)a3
{
  self->_paymentMode = a3;
}

- (unint64_t)deviceTapFlow
{
  return self->_deviceTapFlow;
}

- (void)setDeviceTapFlow:(unint64_t)a3
{
  self->_deviceTapFlow = a3;
}

- (NSString)recipientPhoneOrEmail
{
  return self->_recipientPhoneOrEmail;
}

- (void)setRecipientPhoneOrEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)bankName
{
  return self->_bankName;
}

- (void)setBankName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)routingNumber
{
  return self->_routingNumber;
}

- (void)setRoutingNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (void)setAccountNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (PKPeerPaymentQuoteCertificatesResponse)quoteCertificatesResponse
{
  return self->_quoteCertificatesResponse;
}

- (void)setQuoteCertificatesResponse:(id)a3
{
  objc_storeStrong((id *)&self->_quoteCertificatesResponse, a3);
}

- (NSString)recurringPaymentIdentifier
{
  return self->_recurringPaymentIdentifier;
}

- (void)setRecurringPaymentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(unint64_t)a3
{
  self->_frequency = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSDecimalNumber)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (BOOL)sendImmediately
{
  return self->_sendImmediately;
}

- (void)setSendImmediately:(BOOL)a3
{
  self->_sendImmediately = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_recurringPaymentIdentifier, 0);
  objc_storeStrong((id *)&self->_quoteCertificatesResponse, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
  objc_storeStrong((id *)&self->_routingNumber, 0);
  objc_storeStrong((id *)&self->_bankName, 0);
  objc_storeStrong((id *)&self->_recipientPhoneOrEmail, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentMethodSuffix, 0);
  objc_storeStrong((id *)&self->_paymentMethodDescription, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_orderIdentifier, 0);
}

@end
