@implementation PKPaymentOfferWebServiceDynamicContentRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSURL *baseURL;
  NSString *criteriaIdentifier;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  objc_class *v17;
  _QWORD v19[2];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    v22 = 2082;
    v23 = "_baseURL";
LABEL_13:
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_14;
  }
  criteriaIdentifier = self->_criteriaIdentifier;
  if (!criteriaIdentifier)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    v22 = 2082;
    v23 = "_criteriaIdentifier";
    goto LABEL_13;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      v22 = 2082;
      v23 = "appleAccountInformation";
      goto LABEL_13;
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v19[0] = CFSTR("paymentOfferDynamicContent");
  v19[1] = criteriaIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOfferWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v8, 0, v5);
  v9 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v9, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = -[NSArray pk_createArrayBySafelyApplyingBlock:](self->_types, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_98);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("types"));

  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v9, "setHTTPBody:", v12);

  }
  v13 = -[NSObject copy](v9, "copy");

LABEL_15:
  return v13;
}

const __CFString *__88__PKPaymentOfferWebServiceDynamicContentRequest__urlRequestWithAppleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  return PKPaymentOfferDynamicContentPageTypeToString(objc_msgSend(a2, "integerValue"));
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (void)setCriteriaIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
