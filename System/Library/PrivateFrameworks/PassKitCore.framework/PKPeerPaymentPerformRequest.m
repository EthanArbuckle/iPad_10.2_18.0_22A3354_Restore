@implementation PKPeerPaymentPerformRequest

+ (id)requestWithAuthorizedPeerPaymentQuote:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  PKPeerPaymentPerformRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v16[16];

  v3 = a3;
  objc_msgSend(v3, "peerPaymentQuote");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "validUntil");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((PKPeerPaymentDisableInvalidQuoteEnforcement() & 1) == 0
    && v5
    && (objc_msgSend(MEMORY[0x1E0C99D68], "now"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "compare:", v5),
        v6,
        v7 == 1))
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Quote is expired, suppress call to perform", v16, 2u);
    }

    v9 = 0;
  }
  else
  {
    v9 = objc_alloc_init(PKPeerPaymentPerformRequest);
    objc_msgSend(v3, "peerPaymentQuote");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentPerformRequest setQuoteIdentifier:](v9, "setQuoteIdentifier:", v11);

    objc_msgSend(v3, "transactionData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentPerformRequest setPaymentData:](v9, "setPaymentData:", v12);

    objc_msgSend(v3, "certificates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentPerformRequest setCertificates:](v9, "setCertificates:", v13);

    objc_msgSend(v3, "contact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentPerformRequest setContact:](v9, "setContact:", v14);

  }
  return v9;
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
  NSString *quoteIdentifier;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSData *paymentData;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *pushToken;
  NSData *signedEnrollmentDataSignature;
  void *v32;
  PKContact *contact;
  void *v34;
  NSString *passTypeIdentifier;
  NSString *passSerialNumber;
  NSString *cryptogramType;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSString *publicKeyHash;
  NSString *ephemeralPublicKey;
  NSString *encryptedRecipientData;
  id v46;
  NSString *senderAddress;
  NSString *v48;
  objc_class *v49;
  void *v50;
  objc_class *v51;
  objc_class *v52;
  objc_class *v53;
  objc_class *v54;
  objc_class *v55;
  NSObject *v56;
  id v57;
  objc_class *v58;
  NSObject *v60;
  objc_class *v61;
  void *v62;
  objc_class *v63;
  objc_class *v64;
  objc_class *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  NSString *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  _QWORD v76[3];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  const char *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
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
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    v49 = (objc_class *)objc_opt_class();
    NSStringFromClass(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v78 = v50;
    v79 = 2082;
    v80 = "url";
LABEL_64:
    _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_65;
  }
  if (!v15)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v78 = v50;
    v79 = 2082;
    v80 = "appleAccountInformation";
    goto LABEL_64;
  }
  if (!v16)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    v52 = (objc_class *)objc_opt_class();
    NSStringFromClass(v52);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v78 = v50;
    v79 = 2082;
    v80 = "deviceIdentifier";
    goto LABEL_64;
  }
  if (!v19)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v78 = v50;
    v79 = 2082;
    v80 = "deviceMetadata";
    goto LABEL_64;
  }
  quoteIdentifier = self->_quoteIdentifier;
  if (!quoteIdentifier)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    v54 = (objc_class *)objc_opt_class();
    NSStringFromClass(v54);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v78 = v50;
    v79 = 2082;
    v80 = "_quoteIdentifier";
    goto LABEL_64;
  }
  if (!self->_paymentData)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    v55 = (objc_class *)objc_opt_class();
    NSStringFromClass(v55);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v78 = v50;
    v79 = 2082;
    v80 = "_paymentData";
    goto LABEL_64;
  }
  if (self->_certificates)
  {
    v76[0] = CFSTR("quote");
    v76[1] = quoteIdentifier;
    v76[2] = CFSTR("perform");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v14, v22, 0, v15);
    v23 = objc_claimAutoreleasedReturnValue();

    -[NSObject setHTTPMethod:](v23, "setHTTPMethod:", CFSTR("POST"));
    -[NSObject setValue:forHTTPHeaderField:](v23, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    paymentData = self->_paymentData;
    v26 = (void *)v24;
    if (paymentData)
    {
      -[NSData hexEncoding](paymentData, "hexEncoding");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v27, CFSTR("paymentData"));

    }
    if (!self->_certificates || !objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:"))
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v56, OS_LOG_TYPE_DEFAULT, "Error: Perform Quote _certificates is not a valid JSON encodable object.", buf, 2u);
      }

      v57 = 0;
      goto LABEL_81;
    }
    objc_msgSend(v26, "setObject:forKey:", self->_certificates, CFSTR("certificates"));
    if (v17)
    {
      objc_msgSend(v17, "hexEncoding");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v28, CFSTR("deviceScore"));

    }
    if (v18)
      objc_msgSend(v26, "setObject:forKey:", v18, CFSTR("odiAssessment"));
    objc_msgSend(v20, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v29, CFSTR("deviceMetadata"));

    pushToken = self->_pushToken;
    if (pushToken)
      objc_msgSend(v26, "setObject:forKey:", pushToken, CFSTR("pushToken"));
    signedEnrollmentDataSignature = self->_signedEnrollmentDataSignature;
    if (signedEnrollmentDataSignature)
    {
      -[NSData hexEncoding](signedEnrollmentDataSignature, "hexEncoding");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v32, CFSTR("signedEnrollmentDataSignature"));

    }
    contact = self->_contact;
    if (contact)
    {
      -[PKContact dictionaryRepresentation](contact, "dictionaryRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v34, CFSTR("contact"));

    }
    passTypeIdentifier = self->_passTypeIdentifier;
    if (passTypeIdentifier)
      objc_msgSend(v26, "setObject:forKey:", passTypeIdentifier, CFSTR("passTypeIdentifier"));
    passSerialNumber = self->_passSerialNumber;
    if (passSerialNumber)
      objc_msgSend(v26, "setObject:forKey:", passSerialNumber, CFSTR("passSerialNumber"));
    cryptogramType = self->_cryptogramType;
    if (cryptogramType)
      objc_msgSend(v26, "setObject:forKey:", cryptogramType, CFSTR("cryptogramType"));
    if (self->_accountNumber && self->_routingNumber)
    {
      v74 = v26;
      v69 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v69, "numberFromString:", self->_accountNumber);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringValue");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("EE2C738F-01CE-4336-AB9C-CE8A72E3679E"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "appendString:", CFSTR("-"));
      objc_msgSend(v39, "appendString:", v72);
      objc_msgSend(v39, "appendString:", CFSTR("-"));
      objc_msgSend(v39, "appendString:", self->_routingNumber);
      v67 = v39;
      objc_msgSend(v39, "dataUsingEncoding:", 4);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "SHA256Hash");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "base64EncodedStringWithOptions:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
        objc_msgSend(v74, "setObject:forKey:", v42, CFSTR("achHash"));

      v26 = v74;
    }
    if (self->_destination != 5)
      goto LABEL_80;
    v75 = v26;
    if (self->_senderAddress)
    {
      if (self->_encryptedRecipientData)
      {
        if (self->_publicKeyHash)
        {
          if (self->_ephemeralPublicKey)
          {
            v73 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            PKPrivacyEncryptionSchemeToString(self->_encryptionScheme);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "setObject:forKey:", v68, CFSTR("version"));

            publicKeyHash = self->_publicKeyHash;
            if (publicKeyHash)
              objc_msgSend(v73, "setObject:forKey:", publicKeyHash, CFSTR("publicKeyHash"));
            ephemeralPublicKey = self->_ephemeralPublicKey;
            if (ephemeralPublicKey)
              objc_msgSend(v73, "setObject:forKey:", ephemeralPublicKey, CFSTR("ephemeralPublicKey"));
            encryptedRecipientData = self->_encryptedRecipientData;
            if (encryptedRecipientData)
              objc_msgSend(v73, "setObject:forKey:", encryptedRecipientData, CFSTR("data"));
            v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v46, "setObject:forKey:", v73, CFSTR("recipientEncryptionFields"));
            PKPeerPaymentContactAddressTypeToString(self->_senderAddressType);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "setObject:forKey:", v70, CFSTR("senderAddressType"));

            senderAddress = self->_senderAddress;
            if (senderAddress)
            {
              if (self->_senderAddressType)
              {
                v48 = senderAddress;
              }
              else
              {
                PKIDSNormalizedAddress(senderAddress);
                v48 = (NSString *)objc_claimAutoreleasedReturnValue();
              }
              v71 = v48;
              objc_msgSend(v46, "setObject:forKey:", v48, CFSTR("senderAddress"));

            }
            objc_msgSend(v26, "setObject:forKey:", v46, CFSTR("recipientMetadata"));

LABEL_80:
            objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v26);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setHTTPBody:](v23, "setHTTPBody:", v66);

            v57 = -[NSObject copy](v23, "copy");
            goto LABEL_81;
          }
          PKLogFacilityTypeGetObject(0xBuLL);
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v65 = (objc_class *)objc_opt_class();
            NSStringFromClass(v65);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v78 = v62;
            v79 = 2082;
            v80 = "_ephemeralPublicKey";
            goto LABEL_75;
          }
LABEL_76:

          v57 = 0;
          v26 = v75;
LABEL_81:

          goto LABEL_66;
        }
        PKLogFacilityTypeGetObject(0xBuLL);
        v60 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          goto LABEL_76;
        v64 = (objc_class *)objc_opt_class();
        NSStringFromClass(v64);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v78 = v62;
        v79 = 2082;
        v80 = "_publicKeyHash";
      }
      else
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v60 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          goto LABEL_76;
        v63 = (objc_class *)objc_opt_class();
        NSStringFromClass(v63);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v78 = v62;
        v79 = 2082;
        v80 = "_encryptedRecipientData";
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v60 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        goto LABEL_76;
      v61 = (objc_class *)objc_opt_class();
      NSStringFromClass(v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v78 = v62;
      v79 = 2082;
      v80 = "_senderAddress";
    }
LABEL_75:
    _os_log_impl(&dword_18FC92000, v60, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_76;
  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v58 = (objc_class *)objc_opt_class();
    NSStringFromClass(v58);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v78 = v50;
    v79 = 2082;
    v80 = "_certificates";
    goto LABEL_64;
  }
LABEL_65:
  v57 = 0;
LABEL_66:

  return v57;
}

- (NSString)quoteIdentifier
{
  return self->_quoteIdentifier;
}

- (void)setQuoteIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)paymentData
{
  return self->_paymentData;
}

- (void)setPaymentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDictionary)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)recipientPhoneOrEmail
{
  return self->_recipientPhoneOrEmail;
}

- (void)setRecipientPhoneOrEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (PKContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)routingNumber
{
  return self->_routingNumber;
}

- (void)setRoutingNumber:(id)a3
{
  objc_storeStrong((id *)&self->_routingNumber, a3);
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (void)setAccountNumber:(id)a3
{
  objc_storeStrong((id *)&self->_accountNumber, a3);
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSData)signedEnrollmentDataSignature
{
  return self->_signedEnrollmentDataSignature;
}

- (void)setSignedEnrollmentDataSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)cryptogramType
{
  return self->_cryptogramType;
}

- (void)setCryptogramType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (unint64_t)senderAddressType
{
  return self->_senderAddressType;
}

- (void)setSenderAddressType:(unint64_t)a3
{
  self->_senderAddressType = a3;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)encryptedRecipientData
{
  return self->_encryptedRecipientData;
}

- (void)setEncryptedRecipientData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (unint64_t)encryptionScheme
{
  return self->_encryptionScheme;
}

- (void)setEncryptionScheme:(unint64_t)a3
{
  self->_encryptionScheme = a3;
}

- (NSString)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_encryptedRecipientData, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_cryptogramType, 0);
  objc_storeStrong((id *)&self->_signedEnrollmentDataSignature, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
  objc_storeStrong((id *)&self->_routingNumber, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_recipientPhoneOrEmail, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_paymentData, 0);
  objc_storeStrong((id *)&self->_quoteIdentifier, 0);
}

@end
