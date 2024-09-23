@implementation PXAutoloopVideoInput

- (PXAutoloopVideoInput)initWithAsset:(id)a3 imageURL:(id)a4
{
  id v6;
  id v7;
  PXAutoloopVideoInput *v8;
  uint64_t v9;
  AVAsset *asset;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXAutoloopVideoInput;
  v8 = -[PXAutoloopVideoInput init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    asset = v8->_asset;
    v8->_asset = (AVAsset *)v9;

    objc_storeStrong((id *)&v8->_imageURL, a4);
  }

  return v8;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

+ (id)inputWithAsset:(id)a3 imageURL:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAsset:imageURL:", v6, v5);

  return v7;
}

@end
