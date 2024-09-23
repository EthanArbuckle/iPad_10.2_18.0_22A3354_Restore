@implementation SSUIServiceOptionsAssetMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SSUIServiceOptionsAssetMetadata assetDescription](self, "assetDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssetDescription:", v5);

  return v4;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SSUIServiceOptionsAssetMetadata assetDescription](self, "assetDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v5, CFSTR("SSUIServiceMetadataKey"));

}

- (SSUIServiceOptionsAssetMetadata)initWithBSXPCCoder:(id)a3
{
  id v4;
  SSUIServiceOptionsAssetMetadata *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *assetDescription;

  v4 = a3;
  v5 = -[SSUIServiceOptionsAssetMetadata init](self, "init");
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("SSUIServiceMetadataKey"));
  v7 = objc_claimAutoreleasedReturnValue();

  assetDescription = v5->_assetDescription;
  v5->_assetDescription = (NSArray *)v7;

  return v5;
}

- (NSArray)assetDescription
{
  return self->_assetDescription;
}

- (void)setAssetDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDescription, 0);
}

@end
