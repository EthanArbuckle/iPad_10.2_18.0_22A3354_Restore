@implementation MOContextPhotoMetaData

- (MOContextPhotoMetaData)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOContextPhotoMetaData;
  return -[MOContextPhotoMetaData init](&v3, sel_init);
}

- (MOContextPhotoMetaData)initWithPhotoAssetIdentifier:(id)a3
{
  id v5;
  MOContextPhotoMetaData *v6;
  MOContextPhotoMetaData *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MOContextPhotoMetaData;
  v6 = -[MOContextPhotoMetaData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoAssetIdentifier, a3);
    _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_243AAA000, v8, OS_LOG_TYPE_INFO, "PhotoMetaData photoAssetIdentifier,%@", buf, 0xCu);
    }

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOContextPhotoMetaData *v4;
  void *v5;
  MOContextPhotoMetaData *v6;

  v4 = [MOContextPhotoMetaData alloc];
  -[MOContextPhotoMetaData photoAssetIdentifier](self, "photoAssetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOContextPhotoMetaData initWithPhotoAssetIdentifier:](v4, "initWithPhotoAssetIdentifier:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_photoAssetIdentifier, CFSTR("photoAssetIdentifier"));
}

- (MOContextPhotoMetaData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MOContextPhotoMetaData *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoAssetIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MOContextPhotoMetaData initWithPhotoAssetIdentifier:](self, "initWithPhotoAssetIdentifier:", v5);
  return v6;
}

- (NSString)photoAssetIdentifier
{
  return self->_photoAssetIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoAssetIdentifier, 0);
}

@end
