@implementation PKApplyWebServiceShownTermsRequest

- (PKApplyWebServiceShownTermsRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceShownTermsRequest *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSURL *baseURL;
  uint64_t v10;
  NSString *termsIdentifier;
  uint64_t v12;
  NSString *termsType;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKApplyWebServiceShownTermsRequest;
  v5 = -[PKApplyWebServiceRequest initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsType"));
    v12 = objc_claimAutoreleasedReturnValue();
    termsType = v5->_termsType;
    v5->_termsType = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceShownTermsRequest;
  v4 = a3;
  -[PKApplyWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_baseURL, CFSTR("baseURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_termsIdentifier, CFSTR("termsIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_termsType, CFSTR("termsType"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSURL *baseURL;
  NSString *applicationIdentifier;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  _QWORD v18[3];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    v21 = 2082;
    v22 = "_baseURL";
LABEL_14:
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_15;
  }
  if (!self->_termsIdentifier)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    v21 = 2082;
    v22 = "_termsIdentifier";
    goto LABEL_14;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (!applicationIdentifier)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    v21 = 2082;
    v22 = "_applicationIdentifier";
    goto LABEL_14;
  }
  if (!self->_termsType)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2082;
      v22 = "_termsType";
      goto LABEL_14;
    }
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  v18[0] = CFSTR("applications");
  v18[1] = applicationIdentifier;
  v18[2] = CFSTR("shownTerms");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v7, 0, v4);
  v8 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v8, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[PKApplyWebServiceRequest _createMutableBody](self, "_createMutableBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", self->_termsType, CFSTR("termsType"));
  objc_msgSend(v9, "setObject:forKey:", self->_termsIdentifier, CFSTR("termsIdentifier"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v8, "setHTTPBody:", v10);

  v11 = -[NSObject copy](v8, "copy");
LABEL_16:

  return v11;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)termsType
{
  return self->_termsType;
}

- (void)setTermsType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_termsType, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
