@implementation PKTrustedDeviceEnrollmentInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTrustedDeviceEnrollmentInfo)initWithCoder:(id)a3
{
  id v4;
  PKTrustedDeviceEnrollmentInfo *v5;
  uint64_t v6;
  NSString *deviceName;
  uint64_t v8;
  NSString *deviceSerialNumber;
  uint64_t v10;
  NSString *deviceUDID;
  uint64_t v12;
  NSString *productType;
  uint64_t v14;
  NSString *secureElementIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKTrustedDeviceEnrollmentInfo;
  v5 = -[PKTrustedDeviceEnrollmentInfo init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceSerialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceSerialNumber = v5->_deviceSerialNumber;
    v5->_deviceSerialNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceUDID"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productType"));
    v12 = objc_claimAutoreleasedReturnValue();
    productType = v5->_productType;
    v5->_productType = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    secureElementIdentifier = v5->_secureElementIdentifier;
    v5->_secureElementIdentifier = (NSString *)v14;

    v5->_supportsAccessExpressMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsAccessExpressMode"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceName;
  id v5;

  deviceName = self->_deviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceName, CFSTR("deviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceSerialNumber, CFSTR("deviceSerialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceUDID, CFSTR("deviceUDID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productType, CFSTR("productType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secureElementIdentifier, CFSTR("secureElementIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsAccessExpressMode, CFSTR("supportsAccessExpressMode"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PKTrustedDeviceEnrollmentInfo;
  -[PKTrustedDeviceEnrollmentInfo description](&v9, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_supportsAccessExpressMode)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ Device Name: %@, Serial Number: %@, UDID: %@, Product Type: %@, Secure Element Idetifier: %@, Supports Access Express Mode: %@]"), v4, *(_OWORD *)&self->_deviceName, *(_OWORD *)&self->_deviceUDID, self->_secureElementIdentifier, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)deviceSerialNumber
{
  return self->_deviceSerialNumber;
}

- (void)setDeviceSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSerialNumber, a3);
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUDID, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_secureElementIdentifier, a3);
}

- (BOOL)supportsAccessExpressMode
{
  return self->_supportsAccessExpressMode;
}

- (void)setSupportsAccessExpressMode:(BOOL)a3
{
  self->_supportsAccessExpressMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
