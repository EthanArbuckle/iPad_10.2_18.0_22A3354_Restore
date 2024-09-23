@implementation PPXBLDownloadAsset

- (PPXBLDownloadAsset)initWithBLDownloadStatus:(id)a3 isParent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PPXBLDownloadAsset *v7;
  uint64_t v8;
  NSString *downloadID;
  void *v10;
  uint64_t v11;
  NSString *storeID;
  NSMutableArray *v13;
  NSMutableArray *childAssets;
  void *v15;
  id v16;
  uint64_t v17;
  NSString *v18;
  void *v20;
  void *v21;
  uint64_t v22;
  NSURL *permlink;
  NSURL *v24;
  uint64_t v25;
  objc_super v26;

  v4 = a4;
  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PPXBLDownloadAsset;
  v7 = -[PPXBLDownloadAsset init](&v26, "init");
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadID"));
    downloadID = v7->_downloadID;
    v7->_downloadID = (NSString *)v8;

    v7->_isAudiobook = objc_msgSend(v6, "isAudiobook");
    v7->_isParent = v4;
    if (v4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storePlaylistID"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
      storeID = v7->_storeID;
      v7->_storeID = (NSString *)v11;

      v13 = objc_opt_new(NSMutableArray);
      childAssets = v7->_childAssets;
      v7->_childAssets = v13;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeID"));
      v16 = objc_msgSend(v15, "longLongValue");

      if (v16)
      {
        childAssets = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeID"));
        v17 = objc_claimAutoreleasedReturnValue(-[NSMutableArray stringValue](childAssets, "stringValue"));
        v18 = v7->_storeID;
        v7->_storeID = (NSString *)v17;

      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "permLink"));

        if (!v20)
          goto LABEL_7;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "permLink"));
        v22 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v21));
        permlink = v7->_permlink;
        v7->_permlink = (NSURL *)v22;

        v24 = v7->_permlink;
        if (v24)
        {
          v25 = objc_claimAutoreleasedReturnValue(-[NSURL identifierFromPermlink](v24, "identifierFromPermlink"));
          childAssets = (NSMutableArray *)v7->_temporaryAssetID;
          v7->_temporaryAssetID = (NSString *)v25;
        }
        else
        {
          childAssets = (NSMutableArray *)v7->_temporaryAssetID;
          v7->_temporaryAssetID = 0;
        }
      }
    }

  }
LABEL_7:

  return v7;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset storeID](self, "storeID"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset temporaryAssetID](self, "temporaryAssetID"));
  v6 = v5;

  return (NSString *)v6;
}

- (void)addChild:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset childAssets](self, "childAssets"));
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v5, "setParent:", self);
}

- (void)removeFromParent
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset parent](self, "parent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "childAssets"));
  objc_msgSend(v4, "removeObject:", self);

  -[PPXBLDownloadAsset setParent:](self, "setParent:", 0);
}

- (NSArray)children
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset childAssets](self, "childAssets"));
  v3 = objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)temporaryAssetID
{
  return self->_temporaryAssetID;
}

- (void)setTemporaryAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)permlink
{
  return self->_permlink;
}

- (void)setPermlink:(id)a3
{
  objc_storeStrong((id *)&self->_permlink, a3);
}

- (NSMutableArray)childAssets
{
  return self->_childAssets;
}

- (void)setChildAssets:(id)a3
{
  objc_storeStrong((id *)&self->_childAssets, a3);
}

- (BLDownloadStatus)downloadStatus
{
  return self->_downloadStatus;
}

- (void)setDownloadStatus:(id)a3
{
  objc_storeStrong((id *)&self->_downloadStatus, a3);
}

- (PPXBLDownloadAsset)parent
{
  return (PPXBLDownloadAsset *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(BOOL)a3
{
  self->_isAudiobook = a3;
}

- (BOOL)isParent
{
  return self->_isParent;
}

- (void)setIsParent:(BOOL)a3
{
  self->_isParent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_downloadStatus, 0);
  objc_storeStrong((id *)&self->_childAssets, 0);
  objc_storeStrong((id *)&self->_permlink, 0);
  objc_storeStrong((id *)&self->_temporaryAssetID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
}

@end
