@implementation WCAFetchRequest

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_asset, CFSTR("_asset"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WCAFetchRequest)initWithCoder:(id)a3
{
  id v3;
  WCAFetchRequest *v4;
  uint64_t v5;
  WCAAsset *asset;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WCAFetchRequest;
  v3 = a3;
  v4 = -[WCAFetchRequest init](&v8, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_asset"), v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();

  asset = v4->_asset;
  v4->_asset = (WCAAsset *)v5;

  return v4;
}

- (WCAAsset)asset
{
  return self->_asset;
}

@end
