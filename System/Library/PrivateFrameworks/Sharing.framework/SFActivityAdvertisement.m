@implementation SFActivityAdvertisement

- (SFActivityAdvertisement)initWithAdvertisementVersion:(unint64_t)a3 advertisementPayload:(id)a4 options:(id)a5 device:(id)a6
{
  id v10;
  id v11;
  id v12;
  SFActivityAdvertisement *v13;
  SFActivityAdvertisement *v14;
  uint64_t v15;
  NSData *advertisementPayload;
  uint64_t v17;
  NSDictionary *options;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SFActivityAdvertisement;
  v13 = -[SFActivityAdvertisement init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_advertisementVersion = a3;
    v15 = objc_msgSend(v10, "copy");
    advertisementPayload = v14->_advertisementPayload;
    v14->_advertisementPayload = (NSData *)v15;

    v17 = objc_msgSend(v11, "copy");
    options = v14->_options;
    v14->_options = (NSDictionary *)v17;

    objc_storeStrong((id *)&v14->_device, a6);
  }

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice uniqueID](self->_device, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SFHexStringForData(self->_advertisementPayload);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SFCompactStringFromCollection(self->_options);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice name](self->_device, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice modelIdentifier](self->_device, "modelIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, deviceIdentifier:%@, advertisementPayload:%@, options:%@, deviceName:%@, deviceModelIdentifier:%@>"), v5, self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SFActivityAdvertisement)initWithCoder:(id)a3
{
  id v4;
  SFActivityAdvertisement *v5;
  void *v6;
  uint64_t v7;
  NSData *advertisementPayload;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *options;
  uint64_t v15;
  SFPeerDevice *device;
  objc_super v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFActivityAdvertisement;
  v5 = -[SFActivityAdvertisement init](&v18, sel_init);
  if (v5)
  {
    v5->_advertisementVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("advertisementVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("advertisementPayload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    advertisementPayload = v5->_advertisementPayload;
    v5->_advertisementPayload = (NSData *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("options"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    options = v5->_options;
    v5->_options = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device"));
    v15 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (SFPeerDevice *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t advertisementVersion;
  id v5;

  advertisementVersion = self->_advertisementVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", advertisementVersion, CFSTR("advertisementVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_advertisementPayload, CFSTR("advertisementPayload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_options, CFSTR("options"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_device, CFSTR("device"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)advertisementVersion
{
  return self->_advertisementVersion;
}

- (NSData)advertisementPayload
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (SFPeerDevice)device
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_advertisementPayload, 0);
}

@end
