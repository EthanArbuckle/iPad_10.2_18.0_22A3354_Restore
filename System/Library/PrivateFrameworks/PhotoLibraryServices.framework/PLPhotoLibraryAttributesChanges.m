@implementation PLPhotoLibraryAttributesChanges

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userDescription, CFSTR("userDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enableCloudSyncValue, CFSTR("enableCloudSyncValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cloudResourcePrefetchModeValue, CFSTR("cloudResourcePrefetchModeValue"));

}

- (PLPhotoLibraryAttributesChanges)initWithCoder:(id)a3
{
  id v4;
  PLPhotoLibraryAttributesChanges *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *userDescription;
  uint64_t v10;
  NSNumber *enableCloudSyncValue;
  uint64_t v12;
  NSNumber *cloudResourcePrefetchModeValue;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLPhotoLibraryAttributesChanges;
  v5 = -[PLPhotoLibraryAttributesChanges init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userDescription"));
    v8 = objc_claimAutoreleasedReturnValue();
    userDescription = v5->_userDescription;
    v5->_userDescription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enableCloudSyncValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    enableCloudSyncValue = v5->_enableCloudSyncValue;
    v5->_enableCloudSyncValue = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudResourcePrefetchModeValue"));
    v12 = objc_claimAutoreleasedReturnValue();
    cloudResourcePrefetchModeValue = v5->_cloudResourcePrefetchModeValue;
    v5->_cloudResourcePrefetchModeValue = (NSNumber *)v12;

  }
  return v5;
}

- (BOOL)hasChanges
{
  return self->_name
      || self->_userDescription
      || self->_enableCloudSyncValue
      || self->_cloudResourcePrefetchModeValue != 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)userDescription
{
  return self->_userDescription;
}

- (void)setUserDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)enableCloudSyncValue
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnableCloudSyncValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)cloudResourcePrefetchModeValue
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCloudResourcePrefetchModeValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudResourcePrefetchModeValue, 0);
  objc_storeStrong((id *)&self->_enableCloudSyncValue, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
