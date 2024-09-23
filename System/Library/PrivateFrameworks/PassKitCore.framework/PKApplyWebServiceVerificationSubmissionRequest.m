@implementation PKApplyWebServiceVerificationSubmissionRequest

- (PKApplyWebServiceVerificationSubmissionRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceVerificationSubmissionRequest *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSURL *baseURL;
  uint64_t v10;
  PKApplyVerificationInformation *verificationInfo;
  uint64_t v12;
  NSString *odiAssessment;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKApplyWebServiceVerificationSubmissionRequest;
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

    v5->_featureIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featureIdentifier"));
    v5->_verificationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("verificationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("verificationInfo"));
    v10 = objc_claimAutoreleasedReturnValue();
    verificationInfo = v5->_verificationInfo;
    v5->_verificationInfo = (PKApplyVerificationInformation *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("odiAssessment"));
    v12 = objc_claimAutoreleasedReturnValue();
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v12;

    v5->_channel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("channel"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceVerificationSubmissionRequest;
  v4 = a3;
  -[PKApplyWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_baseURL, CFSTR("baseURL"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_featureIdentifier, CFSTR("featureIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_verificationType, CFSTR("verificationType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_verificationInfo, CFSTR("verificationInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_odiAssessment, CFSTR("odiAssessment"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_channel, CFSTR("channel"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  PKApplyVerificationInformation *verificationInfo;
  unint64_t verificationType;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  id v14;
  void *v15;
  NSURL *baseURL;
  NSString *applicationIdentifier;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *odiAssessment;
  int64_t channel;
  void *v26;
  void *v27;
  objc_class *v29;
  _QWORD v30[4];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v10;
      v33 = 2082;
      v34 = "appleAccountInformation";
      goto LABEL_15;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_24;
  }
  if (!self->_verificationType)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v10;
      v33 = 2082;
      v34 = "_verificationType";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  verificationInfo = self->_verificationInfo;
  if (!verificationInfo)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v10;
      v33 = 2082;
      v34 = "_verificationInfo";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (!-[PKApplyVerificationInformation skippedVerification](verificationInfo, "skippedVerification"))
  {
    verificationType = self->_verificationType;
    if (verificationType >= 2)
    {
      if (verificationType == 2)
      {
        -[PKApplyVerificationInformation trialDeposits](self->_verificationInfo, "trialDeposits");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          PKLogFacilityTypeGetObject(0xDuLL);
          v8 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v10;
          v33 = 2082;
          v34 = "[_verificationInfo trialDeposits]";
          goto LABEL_15;
        }
      }
    }
    else
    {
      -[PKApplyVerificationInformation data](self->_verificationInfo, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        PKLogFacilityTypeGetObject(0xDuLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v10;
          v33 = 2082;
          v34 = "[_verificationInfo data]";
LABEL_15:
          _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
  }
  baseURL = self->_baseURL;
  applicationIdentifier = self->_applicationIdentifier;
  v30[0] = CFSTR("applications");
  v30[1] = applicationIdentifier;
  v30[2] = CFSTR("verification");
  v30[3] = CFSTR("submit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v18, 0, v4);
  v8 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v8, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[PKApplyWebServiceRequest _createMutableBody](self, "_createMutableBody");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PKApplyVerificationTypeToString(self->_verificationType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("verificationType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKApplyVerificationInformation skippedVerification](self->_verificationInfo, "skippedVerification"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("skippedVerification"));

  -[PKApplyVerificationInformation data](self->_verificationInfo, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safelySetObject:forKey:", v22, CFSTR("verificationData"));

  -[PKApplyVerificationInformation trialDeposits](self->_verificationInfo, "trialDeposits");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safelySetObject:forKey:", v23, CFSTR("trialDeposits"));

  odiAssessment = self->_odiAssessment;
  if (odiAssessment)
    objc_msgSend(v19, "setObject:forKey:", odiAssessment, CFSTR("odiAssessment"));
  channel = self->_channel;
  if (channel)
  {
    PKFeatureApplicationChannelToString(channel);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, CFSTR("channel"));

  }
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v8, "setHTTPBody:", v27);

  v14 = -[NSObject copy](v8, "copy");
LABEL_24:

  return v14;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (PKApplyVerificationInformation)verificationInfo
{
  return self->_verificationInfo;
}

- (void)setVerificationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_verificationInfo, a3);
}

- (unint64_t)verificationType
{
  return self->_verificationType;
}

- (void)setVerificationType:(unint64_t)a3
{
  self->_verificationType = a3;
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_verificationInfo, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
