@implementation RMModelAssetReference

- (RMModelAssetReference)initWithIdentifier:(id)a3 assetTypes:(id)a4
{
  id v6;
  id v7;
  RMModelAssetReference *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSArray *assetTypes;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RMModelAssetReference;
  v8 = -[RMModelAssetReference init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    assetTypes = v8->_assetTypes;
    v8->_assetTypes = (NSArray *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  RMModelAssetReference *v4;
  BOOL v5;

  v4 = (RMModelAssetReference *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[RMModelAssetReference isEqualToAssetReference:](self, "isEqualToAssetReference:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[RMModelAssetReference identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[RMModelAssetReference assetTypes](self, "assetTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToArray:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)assetTypes
{
  return self->_assetTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTypes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
