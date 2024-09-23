@implementation PKAccountWebServiceTermsDataResponse

- (PKAccountWebServiceTermsDataResponse)initWithData:(id)a3
{
  PKAccountWebServiceTermsDataResponse *v3;
  PKAccountWebServiceTermsDataResponse *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSData *termsData;
  NSData *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  NSString *termsDataFileName;
  PKAccountWebServiceTermsDataResponse *v29;
  objc_class *v30;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)PKAccountWebServiceTermsDataResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v32, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_19;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v19;
      v35 = 2114;
      v36 = v21;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

LABEL_13:
    }
LABEL_14:

LABEL_25:
    v29 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v5, "PKStringForKey:", CFSTR("dataHash"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dataHash", buf, 0xCu);
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "PKStringForKey:", CFSTR("data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
  termsData = v4->_termsData;
  v4->_termsData = (NSData *)v9;

  v11 = v4->_termsData;
  if (!v11)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v25;
      v26 = "Malformed %{public}@: expected terms data";
LABEL_23:
      _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);

    }
LABEL_24:

    goto LABEL_25;
  }
  -[NSData SHA256Hash](v11, "SHA256Hash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hexEncoding");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v15 = v14;
  if (v13 == v14)
  {

  }
  else
  {
    if (!v13)
    {

      goto LABEL_21;
    }
    v16 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v16 & 1) == 0)
    {
LABEL_21:
      PKLogFacilityTypeGetObject(0xEuLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v25;
        v26 = "Malformed %{public}@: dataHash does not match terms data";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
  }
  objc_msgSend(v5, "PKStringForKey:", CFSTR("dataFilename"));
  v27 = objc_claimAutoreleasedReturnValue();
  termsDataFileName = v4->_termsDataFileName;
  v4->_termsDataFileName = (NSString *)v27;

LABEL_19:
  v29 = v4;
LABEL_26:

  return v29;
}

- (NSData)termsData
{
  return self->_termsData;
}

- (void)setTermsData:(id)a3
{
  objc_storeStrong((id *)&self->_termsData, a3);
}

- (NSString)termsDataFileName
{
  return self->_termsDataFileName;
}

- (void)setTermsDataFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsDataFileName, 0);
  objc_storeStrong((id *)&self->_termsData, 0);
}

@end
