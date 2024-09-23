@implementation PKApplyWebServiceVerificationResendRequest

- (PKApplyWebServiceVerificationResendRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceVerificationResendRequest *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSURL *baseURL;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplyWebServiceVerificationResendRequest;
  v5 = -[PKApplyWebServiceRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
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

    v5->_verificationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("verificationType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceVerificationResendRequest;
  v4 = a3;
  -[PKApplyWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_baseURL, CFSTR("baseURL"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_verificationType, CFSTR("verificationType"));

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
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  _QWORD v17[4];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2082;
      v21 = "appleAccountInformation";
LABEL_8:
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    }
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  if (!self->_verificationType)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2082;
      v21 = "_verificationType";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  baseURL = self->_baseURL;
  applicationIdentifier = self->_applicationIdentifier;
  v17[0] = CFSTR("applications");
  v17[1] = applicationIdentifier;
  v17[2] = CFSTR("verification");
  v17[3] = CFSTR("resend");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v7, 0, v4);
  v8 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v8, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[PKApplyWebServiceRequest _createMutableBody](self, "_createMutableBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKApplyVerificationTypeToString(self->_verificationType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("verificationType"));

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v8, "setHTTPBody:", v11);

  v12 = -[NSObject copy](v8, "copy");
LABEL_10:

  return v12;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (unint64_t)verificationType
{
  return self->_verificationType;
}

- (void)setVerificationType:(unint64_t)a3
{
  self->_verificationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
