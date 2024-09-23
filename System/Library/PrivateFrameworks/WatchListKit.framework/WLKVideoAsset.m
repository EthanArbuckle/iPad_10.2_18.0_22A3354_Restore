@implementation WLKVideoAsset

- (WLKVideoAsset)initWithDictionary:(id)a3
{
  id v4;
  WLKVideoAsset *v5;
  uint64_t v6;
  NSString *URL;
  uint64_t v8;
  NSString *programID;
  uint64_t v10;
  NSString *assetID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WLKVideoAsset;
  v5 = -[WLKVideoAsset init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("hlsUrl"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSString *)v6;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("programId"));
    v8 = objc_claimAutoreleasedReturnValue();
    programID = v5->_programID;
    v5->_programID = (NSString *)v8;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("assetId"));
    v10 = objc_claimAutoreleasedReturnValue();
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v10;

  }
  return v5;
}

- (NSString)URL
{
  return self->_URL;
}

- (NSString)programID
{
  return self->_programID;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_programID, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
