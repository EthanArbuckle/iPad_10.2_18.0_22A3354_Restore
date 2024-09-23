@implementation PKApplyWebServiceTermsDataRequest

- (PKApplyWebServiceTermsDataRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceTermsDataRequest *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSURL *baseURL;
  uint64_t v10;
  NSString *termsIdentifier;
  uint64_t v12;
  NSString *termsDataFormat;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKApplyWebServiceTermsDataRequest;
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsDataFormat"));
    v12 = objc_claimAutoreleasedReturnValue();
    termsDataFormat = v5->_termsDataFormat;
    v5->_termsDataFormat = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceTermsDataRequest;
  v4 = a3;
  -[PKApplyWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_baseURL, CFSTR("baseURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_termsIdentifier, CFSTR("termsIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_termsDataFormat, CFSTR("termsDataFormat"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSURL *baseURL;
  NSString *termsIdentifier;
  NSString *applicationIdentifier;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  objc_class *v13;
  id v14;
  NSURL *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[4];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    v25 = 2082;
    v26 = "_baseURL";
LABEL_12:
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_13;
  }
  termsIdentifier = self->_termsIdentifier;
  if (!termsIdentifier)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    v25 = 2082;
    v26 = "_termsIdentifier";
    goto LABEL_12;
  }
  if (!self->_termsDataFormat)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      v25 = 2082;
      v26 = "_termsDataFormat";
      goto LABEL_12;
    }
LABEL_13:
    v14 = 0;
    goto LABEL_16;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
  {
    v22[0] = CFSTR("applications");
    v22[1] = applicationIdentifier;
    v22[2] = CFSTR("termsData");
    v22[3] = termsIdentifier;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v8, 0, v4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKFeatureIdentifierToString(self->_featureIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_baseURL;
    v21[0] = CFSTR("applications");
    v21[1] = v8;
    v16 = self->_termsIdentifier;
    v21[2] = CFSTR("termsData");
    v21[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v15, v17, 0, v4);
    v9 = objc_claimAutoreleasedReturnValue();

  }
  -[NSObject setHTTPMethod:](v9, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[PKApplyWebServiceRequest _createMutableBody](self, "_createMutableBody");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", self->_termsDataFormat, CFSTR("format"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v9, "setHTTPBody:", v19);

  v14 = -[NSObject copy](v9, "copy");
LABEL_16:

  return v14;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)termsDataFormat
{
  return self->_termsDataFormat;
}

- (void)setTermsDataFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsDataFormat, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
