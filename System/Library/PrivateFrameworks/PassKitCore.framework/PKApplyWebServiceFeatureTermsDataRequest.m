@implementation PKApplyWebServiceFeatureTermsDataRequest

- (PKApplyWebServiceFeatureTermsDataRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceFeatureTermsDataRequest *v5;
  uint64_t v6;
  NSString *termsDataFormat;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyWebServiceFeatureTermsDataRequest;
  v5 = -[PKApplyWebServiceRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_featureIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featureIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsDataFormat"));
    v6 = objc_claimAutoreleasedReturnValue();
    termsDataFormat = v5->_termsDataFormat;
    v5->_termsDataFormat = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceFeatureTermsDataRequest;
  v4 = a3;
  -[PKApplyWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_featureIdentifier, CFSTR("featureIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_termsDataFormat, CFSTR("termsDataFormat"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_termsDataFormat)
  {
    PKFeatureIdentifierToString(self->_featureIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("applications"), v8, CFSTR("termsData"), 0);
    v10 = v9;
    if (self->_termsIdentifier)
      objc_msgSend(v9, "addObject:");
    -[PKApplyWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, v10, 0, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    -[PKApplyWebServiceRequest _createMutableBody](self, "_createMutableBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", self->_termsDataFormat, CFSTR("format"));
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHTTPBody:", v13);

    v14 = (void *)objc_msgSend(v11, "copy");
  }
  else
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      v21 = 2082;
      v22 = "_termsDataFormat";
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    }
    v14 = 0;
  }

  return v14;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)termsDataFormat
{
  return self->_termsDataFormat;
}

- (void)setTermsDataFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsDataFormat, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
}

@end
