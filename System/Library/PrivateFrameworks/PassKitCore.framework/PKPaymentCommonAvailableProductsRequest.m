@implementation PKPaymentCommonAvailableProductsRequest

- (PKPaymentCommonAvailableProductsRequest)initWithContentURL:(id)a3
{
  return -[PKPaymentCommonAvailableProductsRequest initWithContentURL:preferredLanguage:](self, "initWithContentURL:preferredLanguage:", a3, 0);
}

- (PKPaymentCommonAvailableProductsRequest)initWithContentURL:(id)a3 preferredLanguage:(id)a4
{
  id v7;
  id v8;
  PKPaymentCommonAvailableProductsRequest *v9;
  PKPaymentCommonAvailableProductsRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentCommonAvailableProductsRequest;
  v9 = -[PKOverlayableWebServiceRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentURL, a3);
    objc_storeStrong((id *)&v10->_preferredLanguage, a4);
  }

  return v10;
}

- (BOOL)isStatic
{
  return 1;
}

- (id)_urlRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPaymentWebServiceRequest targetDevice](self, "targetDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("region"));

  -[PKPaymentCommonAvailableProductsRequest preferredLanguage](self, "preferredLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "pk_deviceLanguage");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("locale"));
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", self->_contentURL, CFSTR("4"), &unk_1E2C3E2F0, v3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v10, "setValue:forHTTPHeaderField:", v9, CFSTR("Accept-Language"));
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

- (PKPaymentCommonAvailableProductsRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKPaymentCommonAvailableProductsRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredLanguage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[PKPaymentCommonAvailableProductsRequest initWithContentURL:preferredLanguage:](self, "initWithContentURL:preferredLanguage:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentCommonAvailableProductsRequest;
  v4 = a3;
  -[PKOverlayableWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredLanguage, CFSTR("preferredLanguage"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentURL, CFSTR("contentURL"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
}

@end
