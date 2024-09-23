@implementation BKLibraryDataSourcePerformanceAsset

+ (id)profileKeysOfInterest
{
  if (qword_DE548 != -1)
    dispatch_once(&qword_DE548, &stru_C2F48);
  return (id)qword_DE540;
}

- (BKLibraryDataSourcePerformanceAsset)initWithAssetID:(id)a3 productProfile:(id)a4 identifier:(id)a5 date:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BKLibraryDataSourcePerformanceAsset *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *title;
  uint64_t v22;
  NSString *author;
  uint64_t v24;
  NSString *bookDescription;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  NSString *genre;
  objc_super v44;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v44.receiver = self;
  v44.super_class = (Class)BKLibraryDataSourcePerformanceAsset;
  v15 = -[BKLibraryDataSourcePerformanceAsset init](&v44, "init");
  if (v15)
  {
    v16 = objc_opt_class(NSDictionary);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ebookInfo")));
    v18 = BUDynamicCast(v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    objc_storeStrong((id *)&v15->_assetID, a3);
    objc_storeStrong((id *)&v15->_dataSourceIdentifier, a5);
    objc_storeStrong((id *)&v15->_date, a6);
    v15->_contentType = 0;
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("name")));
    title = v15->_title;
    v15->_title = (NSString *)v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("artistName")));
    author = v15->_author;
    v15->_author = (NSString *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("description")));
    bookDescription = v15->_bookDescription;
    v15->_bookDescription = (NSString *)v24;

    v26 = objc_opt_class(NSNumber);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pageCount")));
    v28 = BUDynamicCast(v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v15->_pageCount = (int64_t)objc_msgSend(v29, "unsignedLongValue");

    v30 = objc_opt_class(NSArray);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("genres")));
    v32 = BUDynamicCast(v30, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

    v34 = objc_opt_class(NSDictionary);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));
    v36 = BUDynamicCast(v34, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

    v38 = objc_opt_class(NSString);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("name")));
    v40 = BUDynamicCast(v38, v39);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    genre = v15->_genre;
    v15->_genre = (NSString *)v41;

  }
  return v15;
}

- (BKLibraryDataSourcePerformanceAsset)initWithAssetID:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  BKLibraryDataSourcePerformanceAsset *v9;
  BKLibraryDataSourcePerformanceAsset *v10;
  uint64_t v11;
  NSDate *date;
  NSString *author;
  NSString *bookDescription;
  NSString *genre;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BKLibraryDataSourcePerformanceAsset;
  v9 = -[BKLibraryDataSourcePerformanceAsset init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetID, a3);
    objc_storeStrong((id *)&v10->_dataSourceIdentifier, a4);
    v11 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    date = v10->_date;
    v10->_date = (NSDate *)v11;

    v10->_contentType = 0;
    objc_storeStrong((id *)&v10->_title, a3);
    author = v10->_author;
    v10->_author = (NSString *)CFSTR("No Author");

    bookDescription = v10->_bookDescription;
    v10->_bookDescription = (NSString *)CFSTR("bookDescription");

    genre = v10->_genre;
    v10->_genre = (NSString *)CFSTR("Genre");
    v10->_pageCount = 100;

  }
  return v10;
}

- (int64_t)rating
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSString)sortAuthor
{
  return 0;
}

- (NSString)accountID
{
  return 0;
}

- (NSString)storeID
{
  return self->_assetID;
}

- (NSString)temporaryAssetID
{
  return 0;
}

- (NSURL)url
{
  return 0;
}

- (BOOL)isSample
{
  return 0;
}

- (BOOL)isProof
{
  return 0;
}

- (BOOL)isCompressed
{
  return 0;
}

- (BOOL)isLocked
{
  return 0;
}

- (BOOL)isEphemeral
{
  return 0;
}

- (BOOL)isDevelopment
{
  return 0;
}

- (int64_t)generation
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)fileSize
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (signed)state
{
  return 1;
}

- (NSNumber)isExplicit
{
  return (NSNumber *)&__kCFBooleanFalse;
}

- (NSDate)dataSourceInsertionDate
{
  return self->_date;
}

- (NSDate)releaseDate
{
  return 0;
}

- (NSDate)purchaseDate
{
  return 0;
}

- (NSDate)expectedDate
{
  return 0;
}

- (BOOL)shouldDisableOptimizeSpeed
{
  return 0;
}

- (BOOL)shouldDisableTouchEmulation
{
  return 0;
}

- (signed)desktopSupportLevel
{
  return 0;
}

- (NSString)scrollDirection
{
  return 0;
}

- (NSDate)updateDate
{
  return 0;
}

- (NSNumber)versionNumber
{
  return 0;
}

- (NSString)versionNumberHumanReadable
{
  return 0;
}

- (NSString)comments
{
  return 0;
}

- (NSString)kind
{
  return 0;
}

- (NSString)year
{
  return 0;
}

- (NSString)grouping
{
  return 0;
}

- (BOOL)computedRating
{
  return 0;
}

- (int64_t)metadataMigrationVersion
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (NSString)bookDescription
{
  return self->_bookDescription;
}

- (void)setBookDescription:(id)a3
{
  objc_storeStrong((id *)&self->_bookDescription, a3);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

- (NSDate)lastOpenDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)seriesID
{
  return self->_seriesID;
}

- (void)setSeriesID:(id)a3
{
  objc_storeStrong((id *)&self->_seriesID, a3);
}

- (NSNumber)seriesSortKey
{
  return self->_seriesSortKey;
}

- (void)setSeriesSortKey:(id)a3
{
  objc_storeStrong((id *)&self->_seriesSortKey, a3);
}

- (signed)contentType
{
  return self->_contentType;
}

- (void)setContentType:(signed __int16)a3
{
  self->_contentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesSortKey, 0);
  objc_storeStrong((id *)&self->_seriesID, 0);
  objc_storeStrong((id *)&self->_lastOpenDate, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_bookDescription, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
