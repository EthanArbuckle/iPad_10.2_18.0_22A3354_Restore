@implementation PKApplyWebServiceRequest

- (PKApplyWebServiceRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceRequest *v5;
  uint64_t v6;
  NSString *referrerIdentifier;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *experimentDetails;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKApplyWebServiceRequest;
  v5 = -[PKOverlayableWebServiceRequest initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    referrerIdentifier = v5->_referrerIdentifier;
    v5->_referrerIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("experimentDetails"));
    v12 = objc_claimAutoreleasedReturnValue();
    experimentDetails = v5->_experimentDetails;
    v5->_experimentDetails = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceRequest;
  v4 = a3;
  -[PKOverlayableWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_referrerIdentifier, CFSTR("referrerIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_experimentDetails, CFSTR("experimentDetails"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKApplyWebServiceRequest;
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](&v7, sel__murlRequestWithServiceURL_version_endpointComponents_queryParameters_appleAccountInformation_, a3, CFSTR("1"), a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_murlRequestWithURL:(id)a3
{
  void *v4;
  void *v5;
  NSString *referrerIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKApplyWebServiceRequest;
  -[PKPaymentWebServiceRequest _murlRequestWithURL:](&v8, sel__murlRequestWithURL_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  referrerIdentifier = self->_referrerIdentifier;
  if (referrerIdentifier)
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", referrerIdentifier, CFSTR("x-apple-referrer-identifier"));
  return v5;
}

- (id)_createMutableBody
{
  id v3;
  void *v4;
  NSDictionary *experimentDetails;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  experimentDetails = self->_experimentDetails;
  if (experimentDetails)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", experimentDetails, CFSTR("experiment"));
  return v4;
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)experimentDetails
{
  return self->_experimentDetails;
}

- (void)setExperimentDetails:(id)a3
{
  objc_storeStrong((id *)&self->_experimentDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentDetails, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
}

@end
