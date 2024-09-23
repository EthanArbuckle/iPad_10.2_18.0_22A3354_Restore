@implementation BKAVAudiobookIdentifier

+ (id)audiobookIdentifierWithAssetID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithAssetID:", v4);

  return v5;
}

- (BKAVAudiobookIdentifier)initWithAssetID:(id)a3
{
  id v4;
  BKAVAudiobookIdentifier *v5;
  NSString *v6;
  NSString *assetID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKAVAudiobookIdentifier;
  v5 = -[BKAVAudiobookIdentifier init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    assetID = v5->_assetID;
    v5->_assetID = v6;

  }
  return v5;
}

- (BOOL)isEqualToIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = objc_opt_class(BKAVAudiobookIdentifier);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookIdentifier assetID](self, "assetID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copy
{
  BKAVAudiobookIdentifier *v3;
  void *v4;
  id v5;

  v3 = objc_opt_new(BKAVAudiobookIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookIdentifier assetID](self, "assetID"));
  v5 = objc_msgSend(v4, "copy");
  -[BKAVAudiobookIdentifier setAssetID:](v3, "setAssetID:", v5);

  return v3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_assetID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
