@implementation WBSFetchedCloudTabDeviceOrCloseRequest

- (WBSFetchedCloudTabDeviceOrCloseRequest)init
{

  return 0;
}

- (WBSFetchedCloudTabDeviceOrCloseRequest)initWithUUIDString:(id)a3 deviceOrCloseRequestDictionary:(id)a4
{
  id v6;
  id v7;
  WBSFetchedCloudTabDeviceOrCloseRequest *v8;
  uint64_t v9;
  NSString *uuidString;
  uint64_t v11;
  NSDictionary *deviceOrCloseRequestDictionary;
  WBSFetchedCloudTabDeviceOrCloseRequest *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSFetchedCloudTabDeviceOrCloseRequest;
  v8 = -[WBSFetchedCloudTabDeviceOrCloseRequest init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    uuidString = v8->_uuidString;
    v8->_uuidString = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    deviceOrCloseRequestDictionary = v8->_deviceOrCloseRequestDictionary;
    v8->_deviceOrCloseRequestDictionary = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSFetchedCloudTabDeviceOrCloseRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WBSFetchedCloudTabDeviceOrCloseRequest *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuidString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7, v12, v13, v14, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("deviceOrCloseRequestDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WBSFetchedCloudTabDeviceOrCloseRequest initWithUUIDString:deviceOrCloseRequestDictionary:](self, "initWithUUIDString:deviceOrCloseRequestDictionary:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uuidString;
  id v5;

  uuidString = self->_uuidString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuidString, CFSTR("uuidString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceOrCloseRequestDictionary, CFSTR("deviceOrCloseRequestDictionary"));

}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (NSDictionary)deviceOrCloseRequestDictionary
{
  return self->_deviceOrCloseRequestDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOrCloseRequestDictionary, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
}

@end
