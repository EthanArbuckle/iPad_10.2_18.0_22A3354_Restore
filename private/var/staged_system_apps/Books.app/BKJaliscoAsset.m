@implementation BKJaliscoAsset

+ (id)newAssetFromServerItem:(id)a3 dataSourceIdentifier:(id)a4
{
  id v5;
  id v6;
  BKJaliscoAsset *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  double v33;
  void *v34;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(BKJaliscoAsset);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "isAudiobook"));
  v9 = objc_msgSend(v8, "BOOLValue");

  -[BKJaliscoAsset setAccountID:](v7, "setAccountID:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
  -[BKJaliscoAsset setAssetID:](v7, "setAssetID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
  -[BKJaliscoAsset setStoreID:](v7, "setStoreID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artist"));
  -[BKJaliscoAsset setAuthor:](v7, "setAuthor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  -[BKJaliscoAsset setTitle:](v7, "setTitle:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedTitle"));
  -[BKJaliscoAsset setSortTitle:](v7, "setSortTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedAuthor"));
  -[BKJaliscoAsset setSortAuthor:](v7, "setSortAuthor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://book/%@"), CFSTR("ibooks-purchases"), v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v17));
  -[BKJaliscoAsset setUrl:](v7, "setUrl:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "genre"));
  -[BKJaliscoAsset setGenre:](v7, "setGenre:", v19);

  -[BKJaliscoAsset setDataSourceIdentifier:](v7, "setDataSourceIdentifier:", v6);
  -[BKJaliscoAsset setSample:](v7, "setSample:", 0);
  -[BKJaliscoAsset setProof:](v7, "setProof:", 0);
  -[BKJaliscoAsset setCompressed:](v7, "setCompressed:", 0);
  -[BKJaliscoAsset setLocked:](v7, "setLocked:", 0);
  -[BKJaliscoAsset setGeneration:](v7, "setGeneration:", 0x7FFFFFFFFFFFFFFFLL);
  -[BKJaliscoAsset setFileSize:](v7, "setFileSize:", 0);
  if (v9)
    v20 = 6;
  else
    v20 = 1;
  -[BKJaliscoAsset setContentType:](v7, "setContentType:", v20);
  -[BKJaliscoAsset setState:](v7, "setState:", 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "isExplicit"));
  -[BKJaliscoAsset setIsExplicit:](v7, "setIsExplicit:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "purchasedAt"));
  -[BKJaliscoAsset setDataSourceInsertionDate:](v7, "setDataSourceInsertionDate:", v22);

  -[BKJaliscoAsset setReleaseDate:](v7, "setReleaseDate:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "purchasedAt"));
  -[BKJaliscoAsset setPurchaseDate:](v7, "setPurchaseDate:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "expectedDate"));
  -[BKJaliscoAsset setExpectedDate:](v7, "setExpectedDate:", v24);

  -[BKJaliscoAsset setShouldDisableOptimizeSpeed:](v7, "setShouldDisableOptimizeSpeed:", 0);
  -[BKJaliscoAsset setShouldDisableTouchEmulation:](v7, "setShouldDisableTouchEmulation:", 0);
  -[BKJaliscoAsset setDesktopSupportLevel:](v7, "setDesktopSupportLevel:", 0);
  -[BKJaliscoAsset setPageProgressionDirection:](v7, "setPageProgressionDirection:", 0);
  -[BKJaliscoAsset setPageCount:](v7, "setPageCount:", 0);
  -[BKJaliscoAsset setRating:](v7, "setRating:", 0);
  -[BKJaliscoAsset setUpdateDate:](v7, "setUpdateDate:", 0);
  -[BKJaliscoAsset setVersionNumber:](v7, "setVersionNumber:", 0);
  -[BKJaliscoAsset setKind:](v7, "setKind:", 0);
  -[BKJaliscoAsset setYear:](v7, "setYear:", 0);
  -[BKJaliscoAsset setGrouping:](v7, "setGrouping:", 0);
  -[BKJaliscoAsset setComputedRating:](v7, "setComputedRating:", 0);
  -[BKJaliscoAsset setMetadataMigrationVersion:](v7, "setMetadataMigrationVersion:", 0);
  if (v9)
  {
    v25 = objc_opt_class(NSNumber);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "additionalAudiobookInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("daap.songtime")));
    v28 = BUDynamicCast(v25, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    if (!v29)
    {
      v31 = BKLibraryDataSourceJaliscoLog(v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_1006A2604(v7, v32);

    }
    objc_msgSend(v29, "doubleValue");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v33 / 1000.0));
    -[BKJaliscoAsset setDuration:](v7, "setDuration:", v34);

  }
  return v7;
}

+ (id)newAssetWithStoreID:(id)a3 dataSourceIdentifier:(id)a4
{
  id v5;
  id v6;
  BKJaliscoAsset *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(BKJaliscoAsset);
  -[BKJaliscoAsset setAccountID:](v7, "setAccountID:", 0);
  -[BKJaliscoAsset setAssetID:](v7, "setAssetID:", v6);
  -[BKJaliscoAsset setStoreID:](v7, "setStoreID:", v6);

  -[BKJaliscoAsset setAuthor:](v7, "setAuthor:", 0);
  -[BKJaliscoAsset setTitle:](v7, "setTitle:", 0);
  -[BKJaliscoAsset setSortTitle:](v7, "setSortTitle:", 0);
  -[BKJaliscoAsset setUrl:](v7, "setUrl:", 0);
  -[BKJaliscoAsset setGenre:](v7, "setGenre:", 0);
  -[BKJaliscoAsset setDataSourceIdentifier:](v7, "setDataSourceIdentifier:", v5);

  -[BKJaliscoAsset setSample:](v7, "setSample:", 0);
  -[BKJaliscoAsset setProof:](v7, "setProof:", 0);
  -[BKJaliscoAsset setCompressed:](v7, "setCompressed:", 0);
  -[BKJaliscoAsset setLocked:](v7, "setLocked:", 0);
  -[BKJaliscoAsset setGeneration:](v7, "setGeneration:", 0x7FFFFFFFFFFFFFFFLL);
  -[BKJaliscoAsset setFileSize:](v7, "setFileSize:", 0);
  -[BKJaliscoAsset setContentType:](v7, "setContentType:", 0);
  -[BKJaliscoAsset setState:](v7, "setState:", 0);
  -[BKJaliscoAsset setIsExplicit:](v7, "setIsExplicit:", 0);
  -[BKJaliscoAsset setDataSourceInsertionDate:](v7, "setDataSourceInsertionDate:", 0);
  -[BKJaliscoAsset setReleaseDate:](v7, "setReleaseDate:", 0);
  -[BKJaliscoAsset setPurchaseDate:](v7, "setPurchaseDate:", 0);
  -[BKJaliscoAsset setExpectedDate:](v7, "setExpectedDate:", 0);
  -[BKJaliscoAsset setShouldDisableOptimizeSpeed:](v7, "setShouldDisableOptimizeSpeed:", 0);
  -[BKJaliscoAsset setShouldDisableTouchEmulation:](v7, "setShouldDisableTouchEmulation:", 0);
  -[BKJaliscoAsset setDesktopSupportLevel:](v7, "setDesktopSupportLevel:", 0);
  -[BKJaliscoAsset setPageProgressionDirection:](v7, "setPageProgressionDirection:", 0);
  -[BKJaliscoAsset setPageCount:](v7, "setPageCount:", 0);
  -[BKJaliscoAsset setRating:](v7, "setRating:", 0);
  -[BKJaliscoAsset setUpdateDate:](v7, "setUpdateDate:", 0);
  -[BKJaliscoAsset setVersionNumber:](v7, "setVersionNumber:", 0);
  -[BKJaliscoAsset setKind:](v7, "setKind:", 0);
  -[BKJaliscoAsset setYear:](v7, "setYear:", 0);
  -[BKJaliscoAsset setGrouping:](v7, "setGrouping:", 0);
  -[BKJaliscoAsset setComputedRating:](v7, "setComputedRating:", 0);
  -[BKJaliscoAsset setMetadataMigrationVersion:](v7, "setMetadataMigrationVersion:", 0);
  return v7;
}

- (BOOL)isEphemeral
{
  return 0;
}

- (NSString)description
{
  return (NSString *)+[BKAssetUtilities descriptionForAsset:](BKAssetUtilities, "descriptionForAsset:", self);
}

- (NSString)accountID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)storeID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)storePlaylistID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStorePlaylistID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)temporaryAssetID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTemporaryAssetID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)sortAuthor
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSortAuthor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)sortTitle
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSortTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)genre
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setGenre:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDataSourceIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
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

- (BOOL)isSupplementalContent
{
  return self->_supplementalContent;
}

- (void)setSupplementalContent:(BOOL)a3
{
  self->_supplementalContent = a3;
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
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setIsExplicit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSDate)dataSourceInsertionDate
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDataSourceInsertionDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setReleaseDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSDate)purchaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPurchaseDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSDate)expectedDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setExpectedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSDate)lastOpenDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastOpenDate:(id)a3
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

- (NSString)pageProgressionDirection
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setPageProgressionDirection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
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
  return (NSDate *)objc_getProperty(self, a2, 216, 1);
}

- (void)setUpdateDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSNumber)versionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setVersionNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)versionNumberHumanReadable
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setVersionNumberHumanReadable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSString)bookDescription
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setBookDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSString)comments
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setComments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setKind:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSString)year
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setYear:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSString)grouping
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setGrouping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
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

- (NSNumber)duration
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setDuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_bookDescription, 0);
  objc_storeStrong((id *)&self->_versionNumberHumanReadable, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_pageProgressionDirection, 0);
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
  objc_storeStrong((id *)&self->_sortTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sortAuthor, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_temporaryAssetID, 0);
  objc_storeStrong((id *)&self->_storePlaylistID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
