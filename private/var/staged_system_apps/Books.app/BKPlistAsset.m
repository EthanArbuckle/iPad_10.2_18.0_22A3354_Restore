@implementation BKPlistAsset

+ (id)newBlankAsset
{
  return objc_opt_new(BKPlistAsset);
}

- (NSString)description
{
  return (NSString *)+[BKAssetUtilities descriptionForAsset:](BKAssetUtilities, "descriptionForAsset:", self);
}

- (NSString)coverWritingMode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCoverWritingMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)pageProgressionDirection
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPageProgressionDirection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSURL)permlink
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPermlink:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isRestoring
{
  return self->_isRestoring;
}

- (void)setIsRestoring:(BOOL)a3
{
  self->_isRestoring = a3;
}

- (NSString)accountID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)storeID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)temporaryAssetID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTemporaryAssetID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)sortTitle
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSortTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)sortAuthor
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSortAuthor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)genre
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setGenre:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDataSourceIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
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

- (BOOL)isEphemeral
{
  return self->_ephemeral;
}

- (void)setEphemeral:(BOOL)a3
{
  self->_ephemeral = a3;
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
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setIsExplicit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSDate)dataSourceInsertionDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDataSourceInsertionDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 184, 1);
}

- (void)setReleaseDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSDate)purchaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (void)setPurchaseDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSDate)expectedDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setExpectedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSDate)lastOpenDate
{
  return (NSDate *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLastOpenDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
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
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setScrollDirection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
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
  return (NSDate *)objc_getProperty(self, a2, 240, 1);
}

- (void)setUpdateDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSNumber)versionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 248, 1);
}

- (void)setVersionNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSString)versionNumberHumanReadable
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setVersionNumberHumanReadable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSString)bookDescription
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setBookDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSString)comments
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setComments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setKind:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSString)year
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setYear:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSString)grouping
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setGrouping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
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

- (BOOL)isSupplementalContent
{
  return self->_supplementalContent;
}

- (void)setSupplementalContent:(BOOL)a3
{
  self->_supplementalContent = a3;
}

- (NSString)storePlaylistID
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (void)setStorePlaylistID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePlaylistID, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_bookDescription, 0);
  objc_storeStrong((id *)&self->_versionNumberHumanReadable, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_scrollDirection, 0);
  objc_storeStrong((id *)&self->_lastOpenDate, 0);
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_dataSourceInsertionDate, 0);
  objc_storeStrong((id *)&self->_isExplicit, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sortAuthor, 0);
  objc_storeStrong((id *)&self->_sortTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_temporaryAssetID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_permlink, 0);
  objc_storeStrong((id *)&self->_pageProgressionDirection, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_coverWritingMode, 0);
}

@end
