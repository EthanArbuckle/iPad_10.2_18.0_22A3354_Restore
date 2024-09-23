@implementation BKPendingAssetAuthorization

- (BKPendingAssetAuthorization)initWithAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  BKPendingAssetAuthorization *v8;
  BKPendingAssetAuthorization *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKPendingAssetAuthorization;
  v8 = -[BKPendingAssetAuthorization init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[BKPendingAssetAuthorization setAsset:](v8, "setAsset:", v6);
    -[BKPendingAssetAuthorization setCompletion:](v9, "setCompletion:", v7);
  }

  return v9;
}

- (AVURLAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
