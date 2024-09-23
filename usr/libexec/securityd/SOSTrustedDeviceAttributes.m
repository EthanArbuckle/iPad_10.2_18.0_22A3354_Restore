@implementation SOSTrustedDeviceAttributes

- (SOSTrustedDeviceAttributes)initWithCoder:(id)a3
{
  id v4;
  SOSTrustedDeviceAttributes *v5;
  id v6;
  uint64_t v7;
  NSString *machineID;
  id v9;
  uint64_t v10;
  NSString *serialNumber;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SOSTrustedDeviceAttributes;
  v5 = -[SOSTrustedDeviceAttributes init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("machineID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    machineID = v5->_machineID;
    v5->_machineID = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("serialNumber"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *machineID;
  id v5;

  machineID = self->_machineID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", machineID, CFSTR("machineID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));

}

- (NSString)machineID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMachineID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
