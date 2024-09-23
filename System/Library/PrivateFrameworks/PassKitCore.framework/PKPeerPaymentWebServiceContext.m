@implementation PKPeerPaymentWebServiceContext

- (NSURL)serviceURL
{
  return self->_serviceURL;
}

- (PKPeerPaymentWebServiceContext)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentWebServiceContext *v5;
  uint64_t v6;
  NSURL *serviceURL;
  uint64_t v8;
  NSString *deviceIdentifier;
  uint64_t v10;
  NSString *pushTopic;
  uint64_t v12;
  NSString *pushToken;
  uint64_t v14;
  NSString *companionSerialNumber;
  uint64_t v16;
  NSData *signedEnrollmentDataSignature;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPeerPaymentWebServiceContext;
  v5 = -[PKPeerPaymentWebServiceContext init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    serviceURL = v5->_serviceURL;
    v5->_serviceURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pushTopic"));
    v10 = objc_claimAutoreleasedReturnValue();
    pushTopic = v5->_pushTopic;
    v5->_pushTopic = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pushToken"));
    v12 = objc_claimAutoreleasedReturnValue();
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v12;

    v5->_devSigned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("devSigned"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companionSerialNumber"));
    v14 = objc_claimAutoreleasedReturnValue();
    companionSerialNumber = v5->_companionSerialNumber;
    v5->_companionSerialNumber = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedEnrollmentDataSignature"));
    v16 = objc_claimAutoreleasedReturnValue();
    signedEnrollmentDataSignature = v5->_signedEnrollmentDataSignature;
    v5->_signedEnrollmentDataSignature = (NSData *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *serviceURL;
  id v5;

  serviceURL = self->_serviceURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceURL, CFSTR("serviceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("deviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pushTopic, CFSTR("pushTopic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pushToken, CFSTR("pushToken"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_devSigned, CFSTR("devSigned"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_companionSerialNumber, CFSTR("companionSerialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signedEnrollmentDataSignature, CFSTR("signedEnrollmentDataSignature"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (PKPeerPaymentWebServiceContext)contextWithArchive:(id)a3
{
  void *v3;
  PKPeerPaymentWebServiceContext *v4;
  PKPeerPaymentWebServiceContext *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PKPeerPaymentWebServiceContext;
  objc_msgSendSuper2(&v7, sel_contextWithArchive_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = objc_alloc_init(PKPeerPaymentWebServiceContext);
  v5 = v4;

  return v5;
}

- (void)updateContextWithDeviceRegistrationData:(id)a3 registrationResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSData *v9;
  NSData *signedEnrollmentDataSignature;
  void *v11;
  NSString *v12;
  NSString *companionSerialNumber;
  void *v14;
  NSURL *v15;
  NSURL *serviceURL;
  void *v17;
  NSString *v18;
  NSString *deviceIdentifier;
  NSString *v20;
  NSString *pushTopic;
  id v22;

  v6 = a4;
  v7 = a3;
  self->_devSigned = objc_msgSend(v7, "devSigned");
  objc_msgSend(v7, "signedEnrollmentDataSignature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSData *)objc_msgSend(v8, "copy");
  signedEnrollmentDataSignature = self->_signedEnrollmentDataSignature;
  self->_signedEnrollmentDataSignature = v9;

  objc_msgSend(v7, "companionSerialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (NSString *)objc_msgSend(v11, "copy");
  companionSerialNumber = self->_companionSerialNumber;
  self->_companionSerialNumber = v12;

  objc_msgSend(v6, "peerPaymentServiceURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (NSURL *)objc_msgSend(v14, "copy");
  serviceURL = self->_serviceURL;
  self->_serviceURL = v15;

  objc_msgSend(v6, "deviceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (NSString *)objc_msgSend(v17, "copy");
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = v18;

  objc_msgSend(v6, "peerPaymentServicesPushTopic");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v20 = (NSString *)objc_msgSend(v22, "copy");
  pushTopic = self->_pushTopic;
  self->_pushTopic = v20;

}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (NSString)companionSerialNumber
{
  return self->_companionSerialNumber;
}

- (NSData)signedEnrollmentDataSignature
{
  return self->_signedEnrollmentDataSignature;
}

- (void)setSignedEnrollmentDataSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedEnrollmentDataSignature, 0);
  objc_storeStrong((id *)&self->_companionSerialNumber, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceURL, 0);
}

@end
