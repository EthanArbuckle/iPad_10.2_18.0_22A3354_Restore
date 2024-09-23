@implementation PKPaymentAvailableProductsRequest

- (PKPaymentAvailableProductsRequest)initWithPreferredLanguage:(id)a3
{
  id v5;
  PKPaymentAvailableProductsRequest *v6;
  PKPaymentAvailableProductsRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAvailableProductsRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_preferredLanguage, a3);

  return v7;
}

- (PKPaymentAvailableProductsRequest)initWithCoder:(id)a3
{
  id v4;
  PKPaymentAvailableProductsRequest *v5;
  uint64_t v6;
  NSString *preferredLanguage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAvailableProductsRequest;
  v5 = -[PKOverlayableWebServiceRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredLanguage"));
    v6 = objc_claimAutoreleasedReturnValue();
    preferredLanguage = v5->_preferredLanguage;
    v5->_preferredLanguage = (NSString *)v6;

    v5->_context = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("context"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAvailableProductsRequest;
  v4 = a3;
  -[PKOverlayableWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredLanguage, CFSTR("preferredLanguage"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_context, CFSTR("context"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *preferredLanguage;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  BOOL v19;
  int64_t context;
  NSObject *v21;
  void *v22;
  void *v24;
  __int16 v25[8];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[PKWebServiceRequest cachePolicyOverride](self, "cachePolicyOverride");
  if (v11 == 4 || v11 == 1)
    -[PKWebServiceRequest addDiagnosticReason:](self, "addDiagnosticReason:", CFSTR("Ignoring cache"));
  v26[0] = CFSTR("devices");
  v26[1] = v8;
  v26[2] = CFSTR("products");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", v10, CFSTR("4"), v12, 0, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_preferredLanguage)
  {
    objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("Accept-Language"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    preferredLanguage = self->_preferredLanguage;
    v16 = v14;
    v17 = preferredLanguage;
    if (v16 == v17)
    {

    }
    else
    {
      v18 = v17;
      if (v16 && v17)
      {
        v19 = -[NSString isEqualToString:](v16, "isEqualToString:", v17);

        if (v19)
          goto LABEL_13;
      }
      else
      {

      }
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", self->_preferredLanguage, CFSTR("Accept-Language"));
    }
LABEL_13:

  }
  context = self->_context;
  if (PKPreferenceBOOLforKey(CFSTR("PKDoNotSendProductsContextKey")))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v25[0] = 0;
      _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "PKDoNotSendProductsContextKey set so skipping passed in context value", (uint8_t *)v25, 2u);
    }

LABEL_20:
    objc_msgSend(v13, "setHTTPMethod:", CFSTR("GET"));
    goto LABEL_21;
  }
  if (context == 1)
  {
    objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", &unk_1E2C40C60);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHTTPBody:", v24);

    goto LABEL_21;
  }
  if (!context)
    goto LABEL_20;
LABEL_21:
  v22 = (void *)objc_msgSend(v13, "copy");

  return v22;
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
}

@end
