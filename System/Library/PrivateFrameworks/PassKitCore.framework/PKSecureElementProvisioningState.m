@implementation PKSecureElementProvisioningState

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSecureElementProvisioningState;
  return -[PKSecureElementProvisioningState init](&v3, sel_init);
}

- (PKSecureElementProvisioningState)init
{
  PKSecureElementProvisioningState *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *sid;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = -[PKSecureElementProvisioningState _init](self, "_init");
  if (v2)
  {
    v9[0] = 0;
    v9[1] = 0;
    v3 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "getUUIDBytes:", v9);

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v9, 16);
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "substringToIndex:", 22);
    v6 = objc_claimAutoreleasedReturnValue();
    sid = v2->_sid;
    v2->_sid = (NSString *)v6;

  }
  return v2;
}

- (BOOL)hasNonce
{
  return self->_nonce != 0;
}

- (void)setNonce:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_nonce, a3);
    v5 = v6;
  }

}

- (id)useNonce
{
  NSString *v3;
  NSString *nonce;

  v3 = self->_nonce;
  nonce = self->_nonce;
  self->_nonce = 0;

  return v3;
}

- (void)setRequirementsResponse:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_requirementsResponse, a3);
  objc_msgSend(v6, "productIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong((id *)&self->_productIdentifier, v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSecureElementProvisioningState)initWithCoder:(id)a3
{
  id v4;
  PKSecureElementProvisioningState *v5;
  uint64_t v6;
  NSString *sid;
  uint64_t v8;
  NSData *externalizedAuth;
  uint64_t v10;
  PKPaymentRequirementsResponse *requirementsResponse;
  uint64_t v12;
  PKPaymentEligibilityResponse *eligibilityResponse;
  uint64_t v14;
  PKPaymentProvisioningResponse *provisioningResponse;
  uint64_t v16;
  NSString *secureElementReservationGroupIdentifier;
  uint64_t v18;
  NSString *productIdentifier;
  uint64_t v20;
  NSString *nonce;
  uint64_t v22;
  NSString *referrerIdentifier;
  uint64_t v24;
  NSData *provisioningStepState;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKSecureElementProvisioningState;
  v5 = -[PKSecureElementProvisioningState init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sid"));
    v6 = objc_claimAutoreleasedReturnValue();
    sid = v5->_sid;
    v5->_sid = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalizedAuth"));
    v8 = objc_claimAutoreleasedReturnValue();
    externalizedAuth = v5->_externalizedAuth;
    v5->_externalizedAuth = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requirementsResponse"));
    v10 = objc_claimAutoreleasedReturnValue();
    requirementsResponse = v5->_requirementsResponse;
    v5->_requirementsResponse = (PKPaymentRequirementsResponse *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eligibilityResponse"));
    v12 = objc_claimAutoreleasedReturnValue();
    eligibilityResponse = v5->_eligibilityResponse;
    v5->_eligibilityResponse = (PKPaymentEligibilityResponse *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningResponse"));
    v14 = objc_claimAutoreleasedReturnValue();
    provisioningResponse = v5->_provisioningResponse;
    v5->_provisioningResponse = (PKPaymentProvisioningResponse *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementReservationGroupIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    secureElementReservationGroupIdentifier = v5->_secureElementReservationGroupIdentifier;
    v5->_secureElementReservationGroupIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v20 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    referrerIdentifier = v5->_referrerIdentifier;
    v5->_referrerIdentifier = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningStepState"));
    v24 = objc_claimAutoreleasedReturnValue();
    provisioningStepState = v5->_provisioningStepState;
    v5->_provisioningStepState = (NSData *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sid;
  id v5;

  sid = self->_sid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sid, CFSTR("sid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalizedAuth, CFSTR("externalizedAuth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requirementsResponse, CFSTR("requirementsResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eligibilityResponse, CFSTR("eligibilityResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provisioningResponse, CFSTR("provisioningResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secureElementReservationGroupIdentifier, CFSTR("secureElementReservationGroupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productIdentifier, CFSTR("productIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referrerIdentifier, CFSTR("referrerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provisioningStepState, CFSTR("provisioningStepState"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("sid: '%@'; "), self->_sid);
  objc_msgSend(v6, "appendFormat:", CFSTR("externalizedAuth: '%@'; "), self->_externalizedAuth);
  objc_msgSend(v6, "appendFormat:", CFSTR("requirementsResponse: '%@'; "), self->_requirementsResponse);
  objc_msgSend(v6, "appendFormat:", CFSTR("eligibilityResponse: '%@'; "), self->_eligibilityResponse);
  objc_msgSend(v6, "appendFormat:", CFSTR("secureElementReservationGroupIdentifier: '%@'; "),
    self->_secureElementReservationGroupIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("productIdentifier: '%@'; "), self->_productIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("nonce: '%@'; "), self->_nonce);
  objc_msgSend(v6, "appendFormat:", CFSTR("referrerIdentifier: '%@'; "), self->_nonce);
  if (self->_provisioningStepState)
    v7 = CFSTR("Yes");
  else
    v7 = CFSTR("No");
  objc_msgSend(v6, "appendFormat:", CFSTR("hasProvisioningStepState: '%@'; "), v7);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_sid);
  objc_msgSend(v3, "safelyAddObject:", self->_externalizedAuth);
  objc_msgSend(v3, "safelyAddObject:", self->_requirementsResponse);
  objc_msgSend(v3, "safelyAddObject:", self->_eligibilityResponse);
  objc_msgSend(v3, "safelyAddObject:", self->_provisioningResponse);
  objc_msgSend(v3, "safelyAddObject:", self->_secureElementReservationGroupIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_productIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_nonce);
  objc_msgSend(v3, "safelyAddObject:", self->_referrerIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_provisioningStepState);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKSecureElementProvisioningState *v4;
  PKSecureElementProvisioningState *v5;
  PKSecureElementProvisioningState *v6;
  NSString *sid;
  NSString *v8;
  char v9;
  NSData *externalizedAuth;
  NSData *v11;
  PKPaymentRequirementsResponse *requirementsResponse;
  PKPaymentRequirementsResponse *v13;
  PKPaymentEligibilityResponse *eligibilityResponse;
  PKPaymentEligibilityResponse *v15;
  PKPaymentProvisioningResponse *provisioningResponse;
  PKPaymentProvisioningResponse *v17;
  NSString *secureElementReservationGroupIdentifier;
  NSString *v19;
  NSString *productIdentifier;
  NSString *v21;
  NSString *nonce;
  NSString *v23;
  NSString *referrerIdentifier;
  NSString *v25;
  NSData *provisioningStepState;
  NSData *v27;

  v4 = (PKSecureElementProvisioningState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        sid = self->_sid;
        v8 = v6->_sid;
        if (sid && v8)
        {
          if ((-[NSString isEqual:](sid, "isEqual:") & 1) == 0)
            goto LABEL_53;
        }
        else if (sid != v8)
        {
          goto LABEL_53;
        }
        externalizedAuth = self->_externalizedAuth;
        v11 = v6->_externalizedAuth;
        if (externalizedAuth && v11)
        {
          if ((-[NSData isEqual:](externalizedAuth, "isEqual:") & 1) == 0)
            goto LABEL_53;
        }
        else if (externalizedAuth != v11)
        {
          goto LABEL_53;
        }
        requirementsResponse = self->_requirementsResponse;
        v13 = v6->_requirementsResponse;
        if (requirementsResponse && v13)
        {
          if ((-[PKPaymentRequirementsResponse isEqual:](requirementsResponse, "isEqual:") & 1) == 0)
            goto LABEL_53;
        }
        else if (requirementsResponse != v13)
        {
          goto LABEL_53;
        }
        eligibilityResponse = self->_eligibilityResponse;
        v15 = v6->_eligibilityResponse;
        if (eligibilityResponse && v15)
        {
          if ((-[PKPaymentEligibilityResponse isEqual:](eligibilityResponse, "isEqual:") & 1) == 0)
            goto LABEL_53;
        }
        else if (eligibilityResponse != v15)
        {
          goto LABEL_53;
        }
        provisioningResponse = self->_provisioningResponse;
        v17 = v6->_provisioningResponse;
        if (provisioningResponse && v17)
        {
          if ((-[PKPaymentProvisioningResponse isEqual:](provisioningResponse, "isEqual:") & 1) == 0)
            goto LABEL_53;
        }
        else if (provisioningResponse != v17)
        {
          goto LABEL_53;
        }
        secureElementReservationGroupIdentifier = self->_secureElementReservationGroupIdentifier;
        v19 = v6->_secureElementReservationGroupIdentifier;
        if (secureElementReservationGroupIdentifier && v19)
        {
          if ((-[NSString isEqual:](secureElementReservationGroupIdentifier, "isEqual:") & 1) == 0)
            goto LABEL_53;
        }
        else if (secureElementReservationGroupIdentifier != v19)
        {
          goto LABEL_53;
        }
        productIdentifier = self->_productIdentifier;
        v21 = v6->_productIdentifier;
        if (productIdentifier && v21)
        {
          if ((-[NSString isEqual:](productIdentifier, "isEqual:") & 1) == 0)
            goto LABEL_53;
        }
        else if (productIdentifier != v21)
        {
          goto LABEL_53;
        }
        nonce = self->_nonce;
        v23 = v6->_nonce;
        if (nonce && v23)
        {
          if ((-[NSString isEqual:](nonce, "isEqual:") & 1) == 0)
            goto LABEL_53;
        }
        else if (nonce != v23)
        {
          goto LABEL_53;
        }
        referrerIdentifier = self->_referrerIdentifier;
        v25 = v6->_referrerIdentifier;
        if (referrerIdentifier && v25)
        {
          if ((-[NSString isEqual:](referrerIdentifier, "isEqual:") & 1) != 0)
          {
LABEL_49:
            provisioningStepState = self->_provisioningStepState;
            v27 = v6->_provisioningStepState;
            if (provisioningStepState && v27)
              v9 = -[NSData isEqual:](provisioningStepState, "isEqual:");
            else
              v9 = provisioningStepState == v27;
            goto LABEL_54;
          }
        }
        else if (referrerIdentifier == v25)
        {
          goto LABEL_49;
        }
LABEL_53:
        v9 = 0;
LABEL_54:

        goto LABEL_55;
      }
    }
    v9 = 0;
  }
LABEL_55:

  return v9;
}

- (id)createDivergentState
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v3 = -[PKSecureElementProvisioningState _init]([PKSecureElementProvisioningState alloc], "_init");
  v4 = -[NSString copy](self->_sid, "copy");
  v5 = (void *)*((_QWORD *)v3 + 2);
  *((_QWORD *)v3 + 2) = v4;

  v6 = -[NSData copy](self->_externalizedAuth, "copy");
  v7 = (void *)*((_QWORD *)v3 + 3);
  *((_QWORD *)v3 + 3) = v6;

  objc_storeStrong((id *)v3 + 8, self->_requirementsResponse);
  objc_storeStrong((id *)v3 + 9, self->_eligibilityResponse);
  objc_storeStrong((id *)v3 + 10, self->_provisioningResponse);
  v8 = -[NSString copy](self->_secureElementReservationGroupIdentifier, "copy");
  v9 = (void *)*((_QWORD *)v3 + 4);
  *((_QWORD *)v3 + 4) = v8;

  v10 = -[NSString copy](self->_productIdentifier, "copy");
  v11 = (void *)*((_QWORD *)v3 + 6);
  *((_QWORD *)v3 + 6) = v10;

  -[PKSecureElementProvisioningState useNonce](self, "useNonce");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)v3 + 1);
  *((_QWORD *)v3 + 1) = v12;

  v14 = -[NSString copy](self->_referrerIdentifier, "copy");
  v15 = (void *)*((_QWORD *)v3 + 5);
  *((_QWORD *)v3 + 5) = v14;

  v16 = -[NSData copy](self->_provisioningStepState, "copy");
  v17 = (void *)*((_QWORD *)v3 + 7);
  *((_QWORD *)v3 + 7) = v16;

  return v3;
}

- (NSString)sid
{
  return self->_sid;
}

- (NSData)externalizedAuth
{
  return self->_externalizedAuth;
}

- (void)setExternalizedAuth:(id)a3
{
  objc_storeStrong((id *)&self->_externalizedAuth, a3);
}

- (NSString)secureElementReservationGroupIdentifier
{
  return self->_secureElementReservationGroupIdentifier;
}

- (void)setSecureElementReservationGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_secureElementReservationGroupIdentifier, a3);
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_referrerIdentifier, a3);
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_productIdentifier, a3);
}

- (NSData)provisioningStepState
{
  return self->_provisioningStepState;
}

- (void)setProvisioningStepState:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningStepState, a3);
}

- (PKPaymentRequirementsResponse)requirementsResponse
{
  return self->_requirementsResponse;
}

- (PKPaymentEligibilityResponse)eligibilityResponse
{
  return self->_eligibilityResponse;
}

- (void)setEligibilityResponse:(id)a3
{
  objc_storeStrong((id *)&self->_eligibilityResponse, a3);
}

- (PKPaymentProvisioningResponse)provisioningResponse
{
  return self->_provisioningResponse;
}

- (void)setProvisioningResponse:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningResponse, 0);
  objc_storeStrong((id *)&self->_eligibilityResponse, 0);
  objc_storeStrong((id *)&self->_requirementsResponse, 0);
  objc_storeStrong((id *)&self->_provisioningStepState, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElementReservationGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_externalizedAuth, 0);
  objc_storeStrong((id *)&self->_sid, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end
