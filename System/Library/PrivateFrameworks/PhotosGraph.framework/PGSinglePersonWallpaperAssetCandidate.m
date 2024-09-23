@implementation PGSinglePersonWallpaperAssetCandidate

- (PGSinglePersonWallpaperAssetCandidate)initWithFace:(id)a3 inAsset:(id)a4
{
  id v5;
  PGSinglePersonWallpaperAssetCandidate *v6;
  uint64_t v7;
  NSString *assetUUID;
  void *v9;
  float v10;
  float v11;
  double v12;
  uint64_t v13;
  NSDate *creationDate;
  objc_super v16;

  v5 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PGSinglePersonWallpaperAssetCandidate;
  v6 = -[PGSinglePersonWallpaperAssetCandidate init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "uuid");
    v7 = objc_claimAutoreleasedReturnValue();
    assetUUID = v6->_assetUUID;
    v6->_assetUUID = (NSString *)v7;

    v6->_isFavorite = objc_msgSend(v5, "isFavorite");
    objc_msgSend(v5, "mediaAnalysisProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wallpaperScore");
    v6->_wallpaperScore = v10;

    objc_msgSend(v5, "overallAestheticScore");
    v12 = v11;
    v6->_aestheticScore = v12;
    v6->_score = v6->_wallpaperScore + v12;
    objc_msgSend(v5, "creationDate");
    v13 = objc_claimAutoreleasedReturnValue();
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v13;

  }
  return v6;
}

- (NSString)assetUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (double)score
{
  return self->_score;
}

- (double)wallpaperScore
{
  return self->_wallpaperScore;
}

- (double)aestheticScore
{
  return self->_aestheticScore;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

@end
