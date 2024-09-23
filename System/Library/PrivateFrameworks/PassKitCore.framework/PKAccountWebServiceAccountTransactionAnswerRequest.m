@implementation PKAccountWebServiceAccountTransactionAnswerRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSURL *baseURL;
  NSString *accountIdentifier;
  NSString *transactionIdentifier;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  PKAccountWebServiceAccountTransactionAnswerRequest *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  objc_class *v27;
  objc_class *v28;
  objc_class *v29;
  id v31;
  NSObject *v32;
  id v33;
  NSDictionary *obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _BYTE v41[128];
  _QWORD v42[5];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (PKRunningInPassd())
  {
    baseURL = self->_baseURL;
    if (baseURL)
    {
      if (v4)
      {
        accountIdentifier = self->_accountIdentifier;
        if (accountIdentifier)
        {
          transactionIdentifier = self->_transactionIdentifier;
          if (transactionIdentifier)
          {
            if (self->_answers)
            {
              v42[0] = CFSTR("accounts");
              v42[1] = accountIdentifier;
              v42[2] = CFSTR("transactions");
              v42[3] = transactionIdentifier;
              v42[4] = CFSTR("answer");
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 5);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v4;
              -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v8, 0, v4);
              v9 = objc_claimAutoreleasedReturnValue();

              -[NSObject setHTTPMethod:](v9, "setHTTPMethod:", CFSTR("POST"));
              v32 = v9;
              -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
              v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSDictionary count](self->_answers, "count"));
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v38 = 0u;
              obj = self->_answers;
              v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
              if (v11)
              {
                v12 = v11;
                v13 = *(_QWORD *)v36;
                do
                {
                  for (i = 0; i != v12; ++i)
                  {
                    if (*(_QWORD *)v36 != v13)
                      objc_enumerationMutation(obj);
                    v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                    v39[0] = CFSTR("question");
                    PKPaymentTransactionQuestionTypeToString(objc_msgSend(v15, "integerValue", v31));
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    v39[1] = CFSTR("answer");
                    v40[0] = v16;
                    -[NSDictionary objectForKey:](self->_answers, "objectForKey:", v15);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v40[1] = v17;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
                    v18 = self;
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "addObject:", v19);

                    self = v18;
                  }
                  v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
                }
                while (v12);
              }

              v20 = v31;
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v10, CFSTR("answers"));
              objc_msgSend(v31, "setObject:forKeyedSubscript:", self->_accountUserAltDSID, CFSTR("accountUserAltDSID"));
              v21 = v32;
              if (v31)
              {
                objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v31);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setHTTPBody:](v32, "setHTTPBody:", v22);

              }
              v23 = -[NSObject copy](v32, "copy", v31);

              v4 = v33;
              goto LABEL_30;
            }
            PKLogFacilityTypeGetObject(0xEuLL);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v29 = (objc_class *)objc_opt_class();
              NSStringFromClass(v29);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v44 = v25;
              v45 = 2082;
              v46 = "_answers";
              goto LABEL_28;
            }
LABEL_29:
            v23 = 0;
LABEL_30:

            goto LABEL_31;
          }
          PKLogFacilityTypeGetObject(0xEuLL);
          v21 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            goto LABEL_29;
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v25;
          v45 = 2082;
          v46 = "_transactionIdentifier";
        }
        else
        {
          PKLogFacilityTypeGetObject(0xEuLL);
          v21 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            goto LABEL_29;
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v25;
          v45 = 2082;
          v46 = "_accountIdentifier";
        }
      }
      else
      {
        PKLogFacilityTypeGetObject(0xEuLL);
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          goto LABEL_29;
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v25;
        v45 = 2082;
        v46 = "appleAccountInformation";
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v25;
      v45 = 2082;
      v46 = "_baseURL";
    }
LABEL_28:
    _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_29;
  }
  v23 = 0;
LABEL_31:

  return v23;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDictionary)answers
{
  return self->_answers;
}

- (void)setAnswers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answers, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
