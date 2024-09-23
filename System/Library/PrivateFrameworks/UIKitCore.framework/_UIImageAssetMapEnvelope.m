@implementation _UIImageAssetMapEnvelope

- (UIImageAsset)imageAsset
{
  return (UIImageAsset *)objc_loadWeakRetained((id *)&self->_imageAsset);
}

+ (id)wrapAsset:(id)a3
{
  id v3;
  _UIImageAssetMapEnvelope *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(_UIImageAssetMapEnvelope);
  -[_UIImageAssetMapEnvelope setImageAsset:](v4, "setImageAsset:", v3);
  objc_msgSend(v3, "assetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIImageAssetMapEnvelope setAssetName:](v4, "setAssetName:", v5);
  return v4;
}

- (void)setImageAsset:(id)a3
{
  objc_storeWeak((id *)&self->_imageAsset, a3);
}

- (void)setAssetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_destroyWeak((id *)&self->_imageAsset);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  -[_UIImageAssetMapEnvelope imageAsset](self, "imageAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIImageAssetMapEnvelope assetName](self, "assetName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("For now");
  if (!v3)
    v9 = CFSTR("Nope");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> asset: %@ valid? %@"), v6, self, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)assetName
{
  return self->_assetName;
}

@end
