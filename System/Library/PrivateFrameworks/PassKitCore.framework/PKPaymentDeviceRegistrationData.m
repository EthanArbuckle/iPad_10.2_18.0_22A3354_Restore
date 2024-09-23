@implementation PKPaymentDeviceRegistrationData

- (PKPaymentDeviceRegistrationData)initWithCoder:(id)a3
{
  id v4;
  PKPaymentDeviceRegistrationData *v5;
  uint64_t v6;
  NSString *authorizationHeader;
  uint64_t v8;
  NSString *signedAuthToken;
  uint64_t v10;
  NSDictionary *secureElementStateInformation;
  uint64_t v12;
  NSString *secureElementIdentifier;
  uint64_t v14;
  NSString *deviceSerialNumber;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *additionalDeviceSerialNumbers;
  uint64_t v21;
  NSString *companionSerialNumber;
  uint64_t v23;
  NSString *productType;
  uint64_t v25;
  NSData *platformData;
  uint64_t v27;
  NSData *platformDataSignature;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKPaymentDeviceRegistrationData;
  v5 = -[PKPaymentDeviceRegistrationData init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationHeader"));
    v6 = objc_claimAutoreleasedReturnValue();
    authorizationHeader = v5->_authorizationHeader;
    v5->_authorizationHeader = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedAuthToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    signedAuthToken = v5->_signedAuthToken;
    v5->_signedAuthToken = (NSString *)v8;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("secureElementStateInformation"));
    v10 = objc_claimAutoreleasedReturnValue();
    secureElementStateInformation = v5->_secureElementStateInformation;
    v5->_secureElementStateInformation = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    secureElementIdentifier = v5->_secureElementIdentifier;
    v5->_secureElementIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceSerialNumber"));
    v14 = objc_claimAutoreleasedReturnValue();
    deviceSerialNumber = v5->_deviceSerialNumber;
    v5->_deviceSerialNumber = (NSString *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("additionalDeviceSerialNumbers"));
    v19 = objc_claimAutoreleasedReturnValue();
    additionalDeviceSerialNumbers = v5->_additionalDeviceSerialNumbers;
    v5->_additionalDeviceSerialNumbers = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companionSerialNumber"));
    v21 = objc_claimAutoreleasedReturnValue();
    companionSerialNumber = v5->_companionSerialNumber;
    v5->_companionSerialNumber = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productType"));
    v23 = objc_claimAutoreleasedReturnValue();
    productType = v5->_productType;
    v5->_productType = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformData"));
    v25 = objc_claimAutoreleasedReturnValue();
    platformData = v5->_platformData;
    v5->_platformData = (NSData *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformDataSignature"));
    v27 = objc_claimAutoreleasedReturnValue();
    platformDataSignature = v5->_platformDataSignature;
    v5->_platformDataSignature = (NSData *)v27;

    v5->_devSigned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("devSigned"));
    v5->_walletDeleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("walletDeleted"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *authorizationHeader;
  id v5;

  authorizationHeader = self->_authorizationHeader;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", authorizationHeader, CFSTR("authorizationHeader"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signedAuthToken, CFSTR("signedAuthToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secureElementStateInformation, CFSTR("secureElementStateInformation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secureElementIdentifier, CFSTR("secureElementIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceSerialNumber, CFSTR("deviceSerialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalDeviceSerialNumbers, CFSTR("additionalDeviceSerialNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_companionSerialNumber, CFSTR("companionSerialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productType, CFSTR("productType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_platformData, CFSTR("platformData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_platformDataSignature, CFSTR("platformDataSignature"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_devSigned, CFSTR("devSigned"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_walletDeleted, CFSTR("walletDeleted"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentDeviceRegistrationData *v5;
  uint64_t v6;
  NSString *authorizationHeader;
  uint64_t v8;
  NSString *signedAuthToken;
  uint64_t v10;
  NSDictionary *secureElementStateInformation;
  uint64_t v12;
  NSString *secureElementIdentifier;
  uint64_t v14;
  NSString *deviceSerialNumber;
  uint64_t v16;
  NSArray *additionalDeviceSerialNumbers;
  uint64_t v18;
  NSString *companionSerialNumber;
  uint64_t v20;
  NSString *productType;
  uint64_t v22;
  NSData *platformData;
  uint64_t v24;
  NSData *platformDataSignature;

  v5 = -[PKPaymentDeviceRegistrationData init](+[PKPaymentDeviceRegistrationData allocWithZone:](PKPaymentDeviceRegistrationData, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_authorizationHeader, "copyWithZone:", a3);
  authorizationHeader = v5->_authorizationHeader;
  v5->_authorizationHeader = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_signedAuthToken, "copyWithZone:", a3);
  signedAuthToken = v5->_signedAuthToken;
  v5->_signedAuthToken = (NSString *)v8;

  v10 = -[NSDictionary copyWithZone:](self->_secureElementStateInformation, "copyWithZone:", a3);
  secureElementStateInformation = v5->_secureElementStateInformation;
  v5->_secureElementStateInformation = (NSDictionary *)v10;

  v12 = -[NSString copyWithZone:](self->_secureElementIdentifier, "copyWithZone:", a3);
  secureElementIdentifier = v5->_secureElementIdentifier;
  v5->_secureElementIdentifier = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_deviceSerialNumber, "copyWithZone:", a3);
  deviceSerialNumber = v5->_deviceSerialNumber;
  v5->_deviceSerialNumber = (NSString *)v14;

  v16 = -[NSArray copyWithZone:](self->_additionalDeviceSerialNumbers, "copyWithZone:", a3);
  additionalDeviceSerialNumbers = v5->_additionalDeviceSerialNumbers;
  v5->_additionalDeviceSerialNumbers = (NSArray *)v16;

  v18 = -[NSString copyWithZone:](self->_companionSerialNumber, "copyWithZone:", a3);
  companionSerialNumber = v5->_companionSerialNumber;
  v5->_companionSerialNumber = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  productType = v5->_productType;
  v5->_productType = (NSString *)v20;

  v22 = -[NSData copyWithZone:](self->_platformData, "copyWithZone:", a3);
  platformData = v5->_platformData;
  v5->_platformData = (NSData *)v22;

  v24 = -[NSData copyWithZone:](self->_platformDataSignature, "copyWithZone:", a3);
  platformDataSignature = v5->_platformDataSignature;
  v5->_platformDataSignature = (NSData *)v24;

  v5->_devSigned = self->_devSigned;
  v5->_walletDeleted = self->_walletDeleted;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)authorizationHeader
{
  return self->_authorizationHeader;
}

- (void)setAuthorizationHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)signedAuthToken
{
  return self->_signedAuthToken;
}

- (void)setSignedAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)secureElementStateInformation
{
  return self->_secureElementStateInformation;
}

- (void)setSecureElementStateInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)deviceSerialNumber
{
  return self->_deviceSerialNumber;
}

- (void)setDeviceSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)deviceMLBSerialNumber
{
  return self->_deviceMLBSerialNumber;
}

- (void)setDeviceMLBSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)additionalDeviceSerialNumbers
{
  return self->_additionalDeviceSerialNumbers;
}

- (void)setAdditionalDeviceSerialNumbers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)companionSerialNumber
{
  return self->_companionSerialNumber;
}

- (void)setCompanionSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)platformData
{
  return self->_platformData;
}

- (void)setPlatformData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)platformDataSignature
{
  return self->_platformDataSignature;
}

- (void)setPlatformDataSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)walletDeleted
{
  return self->_walletDeleted;
}

- (void)setWalletDeleted:(BOOL)a3
{
  self->_walletDeleted = a3;
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (NSArray)legacyStateInformation
{
  return self->_legacyStateInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyStateInformation, 0);
  objc_storeStrong((id *)&self->_platformDataSignature, 0);
  objc_storeStrong((id *)&self->_platformData, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_companionSerialNumber, 0);
  objc_storeStrong((id *)&self->_additionalDeviceSerialNumbers, 0);
  objc_storeStrong((id *)&self->_deviceMLBSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElementStateInformation, 0);
  objc_storeStrong((id *)&self->_signedAuthToken, 0);
  objc_storeStrong((id *)&self->_authorizationHeader, 0);
}

@end
