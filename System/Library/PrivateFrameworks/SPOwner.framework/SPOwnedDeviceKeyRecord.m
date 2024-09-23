@implementation SPOwnedDeviceKeyRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("deviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_advertisement, CFSTR("advertisement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hashedAdvertisement, CFSTR("hashedAdvertisement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));

}

- (SPOwnedDeviceKeyRecord)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  NSUUID *v7;
  NSUUID *deviceIdentifier;
  NSData *v9;
  NSData *advertisement;
  NSData *v11;
  NSData *hashedAdvertisement;
  NSDate *v13;
  NSDate *creationDate;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
  v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("advertisement"));
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  advertisement = self->_advertisement;
  self->_advertisement = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashedAdvertisement"));
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  hashedAdvertisement = self->_hashedAdvertisement;
  self->_hashedAdvertisement = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();

  creationDate = self->_creationDate;
  self->_creationDate = v13;

  return self;
}

- (SPOwnedDeviceKeyRecord)initWithIdentifier:(id)a3 deviceIdentifier:(id)a4 advertisement:(id)a5 hashedAdvertisement:(id)a6 creationDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SPOwnedDeviceKeyRecord *v17;
  SPOwnedDeviceKeyRecord *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SPOwnedDeviceKeyRecord;
  v17 = -[SPOwnedDeviceKeyRecord init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_deviceIdentifier, a4);
    objc_storeStrong((id *)&v18->_advertisement, a5);
    objc_storeStrong((id *)&v18->_hashedAdvertisement, a6);
    objc_storeStrong((id *)&v18->_creationDate, a7);
  }

  return v18;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSData)advertisement
{
  return self->_advertisement;
}

- (NSData)hashedAdvertisement
{
  return self->_hashedAdvertisement;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_hashedAdvertisement, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
