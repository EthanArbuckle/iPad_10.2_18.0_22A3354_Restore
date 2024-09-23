@implementation PKPaymentCheckMerchantRequest

- (PKPaymentCheckMerchantRequest)initWithMerchantIdentifier:(id)a3 domainName:(id)a4
{
  id v6;
  id v7;
  PKPaymentCheckMerchantRequest *v8;
  uint64_t v9;
  NSString *merchantIdentifier;
  uint64_t v11;
  NSString *domainName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentCheckMerchantRequest;
  v8 = -[PKOverlayableWebServiceRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    merchantIdentifier = v8->_merchantIdentifier;
    v8->_merchantIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    domainName = v8->_domainName;
    v8->_domainName = (NSString *)v11;

  }
  return v8;
}

- (id)_urlRequestWithServiceURL:(id)a3
{
  NSString *merchantIdentifier;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  merchantIdentifier = self->_merchantIdentifier;
  v5 = a3;
  -[NSString dataUsingEncoding:](merchantIdentifier, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "SHA256Hash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hexEncoding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = CFSTR("checkStatus");
  v16[1] = CFSTR("merchant");
  v16[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v5, v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", self->_domainName, CFSTR("domainName"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHTTPBody:", v13);

  v14 = (void *)objc_msgSend(v11, "copy");
  return v14;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end
