@implementation BKATAsset

- (BKATAsset)initWithATAsset:(id)a3 dataSourceIdentifier:(id)a4
{
  id v7;
  id v8;
  BKATAsset *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *storeID;
  uint64_t v15;
  NSString *temporaryAssetID;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  NSDate *dataSourceInsertionDate;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)BKATAsset;
  v9 = -[BKATAsset init](&v22, "init");
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeInfo"));
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "adamID"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
      storeID = v9->_storeID;
      v9->_storeID = (NSString *)v13;

      objc_storeStrong((id *)&v9->_assetID, v9->_storeID);
    }
    objc_storeStrong((id *)&v9->_atAsset, a3);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    temporaryAssetID = v9->_temporaryAssetID;
    v9->_temporaryAssetID = (NSString *)v15;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "prettyName"));
    title = v9->_title;
    v9->_title = (NSString *)v17;

    v9->_state = 2;
    v19 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    dataSourceInsertionDate = v9->_dataSourceInsertionDate;
    v9->_dataSourceInsertionDate = (NSDate *)v19;

    objc_storeStrong((id *)&v9->_dataSourceIdentifier, a4);
  }

  return v9;
}

- (BOOL)isEphemeral
{
  return 0;
}

- (NSString)description
{
  return (NSString *)+[BKAssetUtilities descriptionForAsset:](BKAssetUtilities, "descriptionForAsset:", self);
}

- (ATAsset)atAsset
{
  return self->_atAsset;
}

- (NSDate)lastOpenDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastOpenDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)accountID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)storeID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)temporaryAssetID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTemporaryAssetID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)sortAuthor
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSortAuthor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)sortTitle
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSortTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)genre
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setGenre:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDataSourceIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)isSample
{
  return self->_sample;
}

- (void)setSample:(BOOL)a3
{
  self->_sample = a3;
}

- (BOOL)isProof
{
  return self->_proof;
}

- (void)setProof:(BOOL)a3
{
  self->_proof = a3;
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (int64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(int64_t)a3
{
  self->_generation = a3;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (signed)contentType
{
  return self->_contentType;
}

- (void)setContentType:(signed __int16)a3
{
  self->_contentType = a3;
}

- (signed)state
{
  return self->_state;
}

- (void)setState:(signed __int16)a3
{
  self->_state = a3;
}

- (NSNumber)isExplicit
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setIsExplicit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDate)dataSourceInsertionDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDataSourceInsertionDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setReleaseDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSDate)purchaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPurchaseDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSDate)expectedDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setExpectedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (BOOL)shouldDisableOptimizeSpeed
{
  return self->_shouldDisableOptimizeSpeed;
}

- (void)setShouldDisableOptimizeSpeed:(BOOL)a3
{
  self->_shouldDisableOptimizeSpeed = a3;
}

- (BOOL)shouldDisableTouchEmulation
{
  return self->_shouldDisableTouchEmulation;
}

- (void)setShouldDisableTouchEmulation:(BOOL)a3
{
  self->_shouldDisableTouchEmulation = a3;
}

- (signed)desktopSupportLevel
{
  return self->_desktopSupportLevel;
}

- (void)setDesktopSupportLevel:(signed __int16)a3
{
  self->_desktopSupportLevel = a3;
}

- (NSString)scrollDirection
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setScrollDirection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

- (int64_t)rating
{
  return self->_rating;
}

- (void)setRating:(int64_t)a3
{
  self->_rating = a3;
}

- (NSDate)updateDate
{
  return (NSDate *)objc_getProperty(self, a2, 208, 1);
}

- (void)setUpdateDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSNumber)versionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setVersionNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)versionNumberHumanReadable
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setVersionNumberHumanReadable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)bookDescription
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setBookDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSString)comments
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setComments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setKind:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSString)year
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setYear:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSString)grouping
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setGrouping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (BOOL)computedRating
{
  return self->_computedRating;
}

- (void)setComputedRating:(BOOL)a3
{
  self->_computedRating = a3;
}

- (int64_t)metadataMigrationVersion
{
  return self->_metadataMigrationVersion;
}

- (void)setMetadataMigrationVersion:(int64_t)a3
{
  self->_metadataMigrationVersion = a3;
}

- (BOOL)isDevelopment
{
  return self->_development;
}

- (void)setDevelopment:(BOOL)a3
{
  self->_development = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_bookDescription, 0);
  objc_storeStrong((id *)&self->_versionNumberHumanReadable, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_scrollDirection, 0);
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_dataSourceInsertionDate, 0);
  objc_storeStrong((id *)&self->_isExplicit, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sortTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sortAuthor, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_temporaryAssetID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_lastOpenDate, 0);
  objc_storeStrong((id *)&self->_atAsset, 0);
}

@end
