@implementation SSUIServiceOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setFlashStyle:", -[SSUIServiceOptions flashStyle](self, "flashStyle"));
  objc_msgSend(v4, "setSaveLocation:", -[SSUIServiceOptions saveLocation](self, "saveLocation"));
  -[SSUIServiceOptions assetMetadata](self, "assetMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssetMetadata:", v5);

  return v4;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeUInt64:forKey:", -[SSUIServiceOptions flashStyle](self, "flashStyle"), CFSTR("SSUIServiceFlashStyleKey"));
  objc_msgSend(v4, "encodeUInt64:forKey:", -[SSUIServiceOptions saveLocation](self, "saveLocation"), CFSTR("SSUIServiceSaveLocationKey"));
  -[SSUIServiceOptions assetMetadata](self, "assetMetadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SSUIServiceMetadataKey"));

}

- (SSUIServiceOptions)initWithBSXPCCoder:(id)a3
{
  id v4;
  SSUIServiceOptions *v5;
  uint64_t v6;
  SSUIServiceOptionsAssetMetadata *assetMetadata;

  v4 = a3;
  v5 = -[SSUIServiceOptions init](self, "init");
  v5->_flashStyle = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("SSUIServiceFlashStyleKey"));
  v5->_saveLocation = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("SSUIServiceSaveLocationKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSUIServiceMetadataKey"));
  v6 = objc_claimAutoreleasedReturnValue();

  assetMetadata = v5->_assetMetadata;
  v5->_assetMetadata = (SSUIServiceOptionsAssetMetadata *)v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SSUIServiceOptions *v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v4 = (SSUIServiceOptions *)a3;
  v7 = 1;
  if (self != v4)
  {
    v5 = -[SSUIServiceOptions flashStyle](self, "flashStyle");
    if (v5 != -[SSUIServiceOptions flashStyle](v4, "flashStyle")
      || (v6 = -[SSUIServiceOptions saveLocation](self, "saveLocation"),
          v6 != -[SSUIServiceOptions saveLocation](v4, "saveLocation")))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)flashStyle
{
  return self->_flashStyle;
}

- (void)setFlashStyle:(unint64_t)a3
{
  self->_flashStyle = a3;
}

- (unint64_t)saveLocation
{
  return self->_saveLocation;
}

- (void)setSaveLocation:(unint64_t)a3
{
  self->_saveLocation = a3;
}

- (SSUIServiceOptionsAssetMetadata)assetMetadata
{
  return self->_assetMetadata;
}

- (void)setAssetMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetMetadata, 0);
}

@end
