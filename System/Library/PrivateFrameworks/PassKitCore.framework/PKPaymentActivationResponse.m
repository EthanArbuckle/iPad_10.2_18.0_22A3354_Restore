@implementation PKPaymentActivationResponse

+ (id)responseWithData:(id)a3 forPass:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:forPass:", v6, v5);

  return v7;
}

- (PKPaymentActivationResponse)initWithData:(id)a3 forPass:(id)a4
{
  id v6;
  PKPaymentActivationResponse *v7;
  PKPaymentActivationResponse *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSString *stepIdentifier;
  uint64_t v14;
  NSString *previousStepIdentifier;
  NSObject *verificationStatus;
  NSObject *v17;
  uint64_t v18;
  NSURL *passURL;
  objc_class *v20;
  void *v21;
  id v22;
  const char *v23;
  void *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  NSArray *verificationChannels;
  NSArray *v34;
  uint64_t v35;
  NSObject *v36;
  PKPaymentActivationResponse *v37;
  NSObject *v38;
  NSObject *v40;
  void *v41;
  PKPaymentActivationResponse *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  uint8_t buf[4];
  NSObject *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v47.receiver = self;
  v47.super_class = (Class)PKPaymentActivationResponse;
  v7 = -[PKWebServiceResponse initWithData:](&v47, sel_initWithData_, a3);
  v8 = v7;
  if (!v7)
    goto LABEL_39;
  -[PKWebServiceResponse JSONObject](v7, "JSONObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v8->_verificationStatus = -[NSObject integerValue](v10, "integerValue");
      objc_msgSend(v9, "PKStringForKey:", CFSTR("stepIdentifier"));
      v12 = objc_claimAutoreleasedReturnValue();
      stepIdentifier = v8->_stepIdentifier;
      v8->_stepIdentifier = (NSString *)v12;

      objc_msgSend(v9, "PKStringForKey:", CFSTR("previousStepIdentifier"));
      v14 = objc_claimAutoreleasedReturnValue();
      previousStepIdentifier = v8->_previousStepIdentifier;
      v8->_previousStepIdentifier = (NSString *)v14;

      verificationStatus = v8->_verificationStatus;
      if (verificationStatus != 1)
      {
        if (verificationStatus == 2)
        {
          v40 = v11;
          v42 = v8;
          v41 = v9;
          objc_msgSend(v9, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("methods"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v17 = v24;
          v26 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v44 != v28)
                  objc_enumerationMutation(v17);
                v30 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
                objc_msgSend(v6, "organizationName");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                +[PKVerificationChannel verificationChannelWithDictionary:andOrganizationName:](PKVerificationChannel, "verificationChannelWithDictionary:andOrganizationName:", v30, v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                -[NSArray addObject:](v25, "addObject:", v32);
              }
              v27 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            }
            while (v27);
          }

          v8 = v42;
          verificationChannels = v42->_verificationChannels;
          v42->_verificationChannels = v25;
          v34 = v25;

          v35 = -[NSArray count](v42->_verificationChannels, "count");
          if (v35)
          {
            v11 = v40;
            v9 = v41;
LABEL_37:

            goto LABEL_38;
          }
          PKLogFacilityTypeGetObject(6uLL);
          v36 = objc_claimAutoreleasedReturnValue();
          v11 = v40;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v36, OS_LOG_TYPE_DEFAULT, "Error: no verification channels returned", buf, 2u);
          }

          v9 = v41;
        }
        else
        {
          if (verificationStatus == 3)
          {
            objc_msgSend(v9, "objectForKey:", CFSTR("passURL"));
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v17);
              passURL = v8->_passURL;
              v8->_passURL = (NSURL *)v18;

            }
            if (!v8->_passURL)
            {
              PKLogFacilityTypeGetObject(6uLL);
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18FC92000, v38, OS_LOG_TYPE_DEFAULT, "Error: passURL malformed or empty", buf, 2u);
              }

            }
            goto LABEL_37;
          }
          PKLogFacilityTypeGetObject(0);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v49 = verificationStatus;
            _os_log_error_impl(&dword_18FC92000, v17, OS_LOG_TYPE_ERROR, "Error: unknown state for activation returned : %ldl", buf, 0xCu);
          }
        }
        goto LABEL_31;
      }
      objc_storeStrong((id *)&v8->_requiredVerificationFieldData, v9);
      if (-[NSDictionary count](v8->_requiredVerificationFieldData, "count"))
      {
LABEL_38:

LABEL_39:
        v37 = v8;
        goto LABEL_40;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "Error: no verfication fields returned";
        goto LABEL_13;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "Error: no verfication status returned";
LABEL_13:
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
      }
    }
LABEL_31:

    goto LABEL_32;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v17 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v49 = v17;
    v50 = 2112;
    v51 = v21;
    v22 = v21;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

    goto LABEL_31;
  }
LABEL_32:

  v37 = 0;
LABEL_40:

  return v37;
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (NSString)previousStepIdentifier
{
  return self->_previousStepIdentifier;
}

- (int64_t)verificationStatus
{
  return self->_verificationStatus;
}

- (void)setVerificationStatus:(int64_t)a3
{
  self->_verificationStatus = a3;
}

- (NSDictionary)requiredVerificationFieldData
{
  return self->_requiredVerificationFieldData;
}

- (NSArray)verificationChannels
{
  return self->_verificationChannels;
}

- (void)setVerificationChannels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_verificationChannels, 0);
  objc_storeStrong((id *)&self->_requiredVerificationFieldData, 0);
  objc_storeStrong((id *)&self->_previousStepIdentifier, 0);
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
}

@end
