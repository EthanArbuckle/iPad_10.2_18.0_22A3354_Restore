@implementation PKPaymentDeviceMetadata

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *secureElementIdentifier;
  NSString *uniqueDeviceIdentifier;
  NSNumber *uniqueChipIdentifier;
  NSString *serialNumber;
  NSString *deviceName;
  NSString *phoneNumber;
  NSString *signedPhoneNumber;
  NSString *signedPhoneNumberVersion;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  secureElementIdentifier = self->_secureElementIdentifier;
  if (secureElementIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", secureElementIdentifier, CFSTR("secureElementIdentifier"));
  uniqueDeviceIdentifier = self->_uniqueDeviceIdentifier;
  if (uniqueDeviceIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", uniqueDeviceIdentifier, CFSTR("uniqueDeviceIdentifier"));
  uniqueChipIdentifier = self->_uniqueChipIdentifier;
  if (uniqueChipIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", uniqueChipIdentifier, CFSTR("uniqueChipIdentifier"));
  serialNumber = self->_serialNumber;
  if (serialNumber)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", serialNumber, CFSTR("serialNumber"));
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", deviceName, CFSTR("deviceName"));
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", phoneNumber, CFSTR("phoneNumber"));
  signedPhoneNumber = self->_signedPhoneNumber;
  if (signedPhoneNumber)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", signedPhoneNumber, CFSTR("signedPhoneNumber"));
  signedPhoneNumberVersion = self->_signedPhoneNumberVersion;
  if (signedPhoneNumberVersion)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", signedPhoneNumberVersion, CFSTR("signedPhoneNumberVersion"));
  -[PKPaymentDeviceMetadata extensiveLatitude](self, "extensiveLatitude");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("extensiveLatitude"));
  -[PKPaymentDeviceMetadata extensiveLongitude](self, "extensiveLongitude");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("extensiveLongitude"));

  return v4;
}

- (NSString)extensiveLongitude
{
  double v3;
  const __CFString *v4;
  void *v5;

  -[CLLocation coordinate](self->_location, "coordinate");
  if (self->_location)
  {
    v4 = &stru_1E2ADF4C0;
    if (v3 >= 0.0)
      v4 = CFSTR("+");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%.2f"), v4, *(_QWORD *)&v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)extensiveLatitude
{
  double v3;
  const __CFString *v4;
  void *v5;

  -[CLLocation coordinate](self->_location, "coordinate");
  if (self->_location)
  {
    v4 = &stru_1E2ADF4C0;
    if (v3 >= 0.0)
      v4 = CFSTR("+");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%.2f"), v4, *(_QWORD *)&v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentDeviceMetadata)initWithCoder:(id)a3
{
  id v4;
  PKPaymentDeviceMetadata *v5;
  uint64_t v6;
  NSString *uniqueDeviceIdentifier;
  uint64_t v8;
  NSNumber *uniqueChipIdentifier;
  uint64_t v10;
  NSString *serialNumber;
  uint64_t v12;
  NSString *phoneNumber;
  uint64_t v14;
  NSString *deviceName;
  uint64_t v16;
  NSString *secureElementIdentifier;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  CLLocation *location;
  uint64_t v22;
  NSString *signedPhoneNumber;
  uint64_t v24;
  NSString *signedPhoneNumberVersion;
  uint64_t v26;
  NSNumber *primaryJSBLSequenceCounter;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentDeviceMetadata;
  v5 = -[PKPaymentDeviceMetadata init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueDeviceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueDeviceIdentifier = v5->_uniqueDeviceIdentifier;
    v5->_uniqueDeviceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueChipIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueChipIdentifier = v5->_uniqueChipIdentifier;
    v5->_uniqueChipIdentifier = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v10 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v12 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v14 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    secureElementIdentifier = v5->_secureElementIdentifier;
    v5->_secureElementIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v20 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedPhoneNumber"));
    v22 = objc_claimAutoreleasedReturnValue();
    signedPhoneNumber = v5->_signedPhoneNumber;
    v5->_signedPhoneNumber = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedPhoneNumberVersion"));
    v24 = objc_claimAutoreleasedReturnValue();
    signedPhoneNumberVersion = v5->_signedPhoneNumberVersion;
    v5->_signedPhoneNumberVersion = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("jsblSequenceCounter"));
    v26 = objc_claimAutoreleasedReturnValue();
    primaryJSBLSequenceCounter = v5->_primaryJSBLSequenceCounter;
    v5->_primaryJSBLSequenceCounter = (NSNumber *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueDeviceIdentifier;
  id v5;

  uniqueDeviceIdentifier = self->_uniqueDeviceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueDeviceIdentifier, CFSTR("uniqueDeviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueChipIdentifier, CFSTR("uniqueChipIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phoneNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceName, CFSTR("deviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secureElementIdentifier, CFSTR("secureElementIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signedPhoneNumber, CFSTR("signedPhoneNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signedPhoneNumberVersion, CFSTR("signedPhoneNumberVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryJSBLSequenceCounter, CFSTR("jsblSequenceCounter"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_phoneNumber, "copyWithZone:", a3);
  v9 = (void *)v5[7];
  v5[7] = v8;

  v10 = -[CLLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v11 = (void *)v5[10];
  v5[10] = v10;

  v12 = -[NSString copyWithZone:](self->_signedPhoneNumber, "copyWithZone:", a3);
  v13 = (void *)v5[8];
  v5[8] = v12;

  v14 = -[NSString copyWithZone:](self->_signedPhoneNumberVersion, "copyWithZone:", a3);
  v15 = (void *)v5[9];
  v5[9] = v14;

  v16 = -[NSNumber copyWithZone:](self->_primaryJSBLSequenceCounter, "copyWithZone:", a3);
  v17 = (void *)v5[2];
  v5[2] = v16;

  v18 = -[NSString copyWithZone:](self->_uniqueDeviceIdentifier, "copyWithZone:", a3);
  v19 = (void *)v5[4];
  v5[4] = v18;

  v20 = -[NSNumber copyWithZone:](self->_uniqueChipIdentifier, "copyWithZone:", a3);
  v21 = (void *)v5[5];
  v5[5] = v20;

  v22 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v23 = (void *)v5[6];
  v5[6] = v22;

  v24 = -[NSString copyWithZone:](self->_secureElementIdentifier, "copyWithZone:", a3);
  v25 = (void *)v5[3];
  v5[3] = v24;

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("uniqueDeviceIdentifier: '%@'; "), self->_uniqueDeviceIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("uniqueChipIdentifier: '%@'; "), self->_uniqueChipIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("serialNumber: '%@'; "), self->_serialNumber);
  objc_msgSend(v6, "appendFormat:", CFSTR("phoneNumber: '%@'; "), self->_phoneNumber);
  objc_msgSend(v6, "appendFormat:", CFSTR("deviceName: '%@'; "), self->_deviceName);
  objc_msgSend(v6, "appendFormat:", CFSTR("location: '%@'; "), self->_location);
  objc_msgSend(v6, "appendFormat:", CFSTR("secureElementIdentifier: '%@'; "), self->_secureElementIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("signedPhoneNumber: '%@'; "), self->_signedPhoneNumber);
  objc_msgSend(v6, "appendFormat:", CFSTR("signedPhoneNumberVersion: '%@'; "), self->_signedPhoneNumberVersion);
  objc_msgSend(v6, "appendFormat:", CFSTR("primaryJSBLSequenceCounter: '%@'; "), self->_primaryJSBLSequenceCounter);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_uniqueDeviceIdentifier)
    objc_msgSend(v3, "addObject:");
  if (self->_uniqueChipIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_serialNumber)
    objc_msgSend(v4, "addObject:");
  if (self->_phoneNumber)
    objc_msgSend(v4, "addObject:");
  if (self->_deviceName)
    objc_msgSend(v4, "addObject:");
  if (self->_location)
    objc_msgSend(v4, "addObject:");
  if (self->_secureElementIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_signedPhoneNumber)
    objc_msgSend(v4, "addObject:");
  if (self->_signedPhoneNumberVersion)
    objc_msgSend(v4, "addObject:");
  if (self->_primaryJSBLSequenceCounter)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentDeviceMetadata *v4;
  PKPaymentDeviceMetadata *v5;
  BOOL v6;

  v4 = (PKPaymentDeviceMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentDeviceMetadata isEqualToPaymentDeviceMetadata:](self, "isEqualToPaymentDeviceMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToPaymentDeviceMetadata:(id)a3
{
  _QWORD *v4;
  NSString *uniqueDeviceIdentifier;
  NSString *v6;
  BOOL v7;
  NSNumber *uniqueChipIdentifier;
  NSNumber *v9;
  NSString *serialNumber;
  NSString *v11;
  NSString *phoneNumber;
  NSString *v13;
  NSString *deviceName;
  NSString *v15;
  NSString *secureElementIdentifier;
  NSString *v17;
  CLLocation *location;
  CLLocation *v19;
  NSString *signedPhoneNumber;
  NSString *v21;
  NSString *signedPhoneNumberVersion;
  NSString *v23;
  NSNumber *primaryJSBLSequenceCounter;
  NSNumber *v25;
  char v26;

  v4 = a3;
  uniqueDeviceIdentifier = self->_uniqueDeviceIdentifier;
  v6 = (NSString *)v4[4];
  if (uniqueDeviceIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (uniqueDeviceIdentifier != v6)
      goto LABEL_51;
  }
  else if ((-[NSString isEqual:](uniqueDeviceIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_51;
  }
  uniqueChipIdentifier = self->_uniqueChipIdentifier;
  v9 = (NSNumber *)v4[5];
  if (uniqueChipIdentifier && v9)
  {
    if ((-[NSNumber isEqual:](uniqueChipIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_51;
  }
  else if (uniqueChipIdentifier != v9)
  {
    goto LABEL_51;
  }
  serialNumber = self->_serialNumber;
  v11 = (NSString *)v4[6];
  if (serialNumber && v11)
  {
    if ((-[NSString isEqual:](serialNumber, "isEqual:") & 1) == 0)
      goto LABEL_51;
  }
  else if (serialNumber != v11)
  {
    goto LABEL_51;
  }
  phoneNumber = self->_phoneNumber;
  v13 = (NSString *)v4[7];
  if (phoneNumber && v13)
  {
    if ((-[NSString isEqual:](phoneNumber, "isEqual:") & 1) == 0)
      goto LABEL_51;
  }
  else if (phoneNumber != v13)
  {
    goto LABEL_51;
  }
  deviceName = self->_deviceName;
  v15 = (NSString *)v4[1];
  if (deviceName && v15)
  {
    if ((-[NSString isEqual:](deviceName, "isEqual:") & 1) == 0)
      goto LABEL_51;
  }
  else if (deviceName != v15)
  {
    goto LABEL_51;
  }
  secureElementIdentifier = self->_secureElementIdentifier;
  v17 = (NSString *)v4[3];
  if (secureElementIdentifier && v17)
  {
    if ((-[NSString isEqual:](secureElementIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_51;
  }
  else if (secureElementIdentifier != v17)
  {
    goto LABEL_51;
  }
  location = self->_location;
  v19 = (CLLocation *)v4[10];
  if (location && v19)
  {
    if ((-[CLLocation isEqual:](location, "isEqual:") & 1) == 0)
      goto LABEL_51;
  }
  else if (location != v19)
  {
    goto LABEL_51;
  }
  signedPhoneNumber = self->_signedPhoneNumber;
  v21 = (NSString *)v4[8];
  if (signedPhoneNumber && v21)
  {
    if ((-[NSString isEqual:](signedPhoneNumber, "isEqual:") & 1) == 0)
      goto LABEL_51;
  }
  else if (signedPhoneNumber != v21)
  {
    goto LABEL_51;
  }
  signedPhoneNumberVersion = self->_signedPhoneNumberVersion;
  v23 = (NSString *)v4[9];
  if (!signedPhoneNumberVersion || !v23)
  {
    if (signedPhoneNumberVersion == v23)
      goto LABEL_47;
LABEL_51:
    v26 = 0;
    goto LABEL_52;
  }
  if ((-[NSString isEqual:](signedPhoneNumberVersion, "isEqual:") & 1) == 0)
    goto LABEL_51;
LABEL_47:
  primaryJSBLSequenceCounter = self->_primaryJSBLSequenceCounter;
  v25 = (NSNumber *)v4[2];
  if (primaryJSBLSequenceCounter && v25)
    v26 = -[NSNumber isEqual:](primaryJSBLSequenceCounter, "isEqual:");
  else
    v26 = primaryJSBLSequenceCounter == v25;
LABEL_52:

  return v26;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)primaryJSBLSequenceCounter
{
  return self->_primaryJSBLSequenceCounter;
}

- (void)setPrimaryJSBLSequenceCounter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)uniqueDeviceIdentifier
{
  return self->_uniqueDeviceIdentifier;
}

- (void)setUniqueDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)uniqueChipIdentifier
{
  return self->_uniqueChipIdentifier;
}

- (void)setUniqueChipIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)signedPhoneNumber
{
  return self->_signedPhoneNumber;
}

- (void)setSignedPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)signedPhoneNumberVersion
{
  return self->_signedPhoneNumberVersion;
}

- (void)setSignedPhoneNumberVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_signedPhoneNumberVersion, 0);
  objc_storeStrong((id *)&self->_signedPhoneNumber, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_uniqueChipIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryJSBLSequenceCounter, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
