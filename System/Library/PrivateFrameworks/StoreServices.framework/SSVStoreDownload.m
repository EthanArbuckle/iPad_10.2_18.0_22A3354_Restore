@implementation SSVStoreDownload

- (SSVStoreDownload)initWithDictionary:(id)a3
{
  id v4;
  SSVStoreDownload *v5;
  uint64_t v6;
  NSDictionary *properties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVStoreDownload;
  v5 = -[SSVStoreDownload init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v6;

  }
  return v5;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSString)preferredAssetFlavor
{
  return self->_preferredAssetFlavor;
}

- (void)setPreferredAssetFlavor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredAssetFlavor, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
