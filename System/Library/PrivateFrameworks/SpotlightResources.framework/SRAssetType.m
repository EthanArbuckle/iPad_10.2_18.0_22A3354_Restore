@implementation SRAssetType

- (void)setXpcName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->_compatibilityVersion = a3;
}

- (void)setAssetType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)contentTypes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDBCF20]);
  -[SRAssetType deliveryTypeMap](self, "deliveryTypeMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  return v6;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTypeMap, 0);
  objc_storeStrong((id *)&self->_deliveryTypeMap, 0);
  objc_storeStrong((id *)&self->_deliveryTypes, 0);
  objc_storeStrong((id *)&self->_xpcName, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

- (NSString)xpcName
{
  return self->_xpcName;
}

- (NSSet)deliveryTypes
{
  return self->_deliveryTypes;
}

- (void)setDeliveryTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)deliveryTypeMap
{
  return self->_deliveryTypeMap;
}

- (void)setDeliveryTypeMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)contentTypeMap
{
  return self->_contentTypeMap;
}

- (void)setContentTypeMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
