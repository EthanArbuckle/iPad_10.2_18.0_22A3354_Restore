@implementation PGSearchThumbnailMomentAssetPairUUID

- (PGSearchThumbnailMomentAssetPairUUID)initWithAssetUUID:(id)a3 momentUUID:(id)a4
{
  id v7;
  id v8;
  PGSearchThumbnailMomentAssetPairUUID *v9;
  PGSearchThumbnailMomentAssetPairUUID *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGSearchThumbnailMomentAssetPairUUID;
  v9 = -[PGSearchThumbnailMomentAssetPairUUID init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetUUID, a3);
    objc_storeStrong((id *)&v10->_momentUUID, a4);
  }

  return v10;
}

- (PGSearchThumbnailMomentAssetPairUUID)initWithCoder:(id)a3
{
  id v4;
  PGSearchThumbnailMomentAssetPairUUID *v5;
  uint64_t v6;
  NSString *assetUUID;
  uint64_t v8;
  NSString *momentUUID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGSearchThumbnailMomentAssetPairUUID;
  v5 = -[PGSearchThumbnailMomentAssetPairUUID init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetUUID = v5->_assetUUID;
    v5->_assetUUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("momentUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    momentUUID = v5->_momentUUID;
    v5->_momentUUID = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *assetUUID;
  id v5;

  assetUUID = self->_assetUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", assetUUID, CFSTR("assetUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_momentUUID, CFSTR("momentUUID"));

}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (NSString)momentUUID
{
  return self->_momentUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentUUID, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
