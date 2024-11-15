@implementation RMModelConfigurationSchemaAssetReference

- (RMModelConfigurationSchemaAssetReference)initWithAssetTypes:(id)a3 keyPath:(id)a4
{
  id v7;
  id v8;
  RMModelConfigurationSchemaAssetReference *v9;
  RMModelConfigurationSchemaAssetReference *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMModelConfigurationSchemaAssetReference;
  v9 = -[RMModelConfigurationSchemaAssetReference init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetTypes, a3);
    objc_storeStrong((id *)&v10->_keyPath, a4);
  }

  return v10;
}

- (NSArray)assetTypes
{
  return self->_assetTypes;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_assetTypes, 0);
}

@end
