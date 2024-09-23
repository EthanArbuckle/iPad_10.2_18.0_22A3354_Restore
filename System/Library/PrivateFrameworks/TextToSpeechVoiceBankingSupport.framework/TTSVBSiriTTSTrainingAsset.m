@implementation TTSVBSiriTTSTrainingAsset

- (NSString)factor
{
  void *v2;
  void *v3;

  -[TTSVBSiriTTSTrainingAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "factor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)path
{
  void *v2;
  void *v3;

  -[TTSVBSiriTTSTrainingAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)language
{
  void *v2;
  void *v3;

  -[TTSVBSiriTTSTrainingAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "language");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[TTSVBSiriTTSTrainingAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)diskSize
{
  return 0;
}

- (SiriTTSTrainingAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

- (TTSVBSiriTTSTrainingAsset)initWithSiriTTSTrainingAsset:(id)a3
{
  id v4;
  TTSVBSiriTTSTrainingAsset *v5;
  TTSVBSiriTTSTrainingAsset *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TTSVBSiriTTSTrainingAsset;
  v5 = -[TTSVBSiriTTSTrainingAsset init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TTSVBSiriTTSTrainingAsset setAsset:](v5, "setAsset:", v4);

  return v6;
}

@end
