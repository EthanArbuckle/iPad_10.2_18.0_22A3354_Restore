@implementation BKLibrarySupplementalAsset

- (NSString)assetID
{
  return 0;
}

- (NSString)storePlaylistID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset parentAsset](self, "parentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storeID"));

  return (NSString *)v3;
}

- (BOOL)isSupplementalContent
{
  return 1;
}

- (NSString)author
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset parentAsset](self, "parentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "author"));

  return (NSString *)v3;
}

- (NSString)sortAuthor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset parentAsset](self, "parentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortAuthor"));

  return (NSString *)v3;
}

- (NSString)genre
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset parentAsset](self, "parentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "genre"));

  return (NSString *)v3;
}

- (NSString)comments
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset parentAsset](self, "parentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "comments"));

  return (NSString *)v3;
}

- (NSString)bookDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset parentAsset](self, "parentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bookDescription"));

  return (NSString *)v3;
}

- (NSString)year
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset parentAsset](self, "parentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "year"));

  return (NSString *)v3;
}

- (NSNumber)isExplicit
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset parentAsset](self, "parentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "isExplicit"));

  return (NSNumber *)v3;
}

- (NSDate)lastOpenDate
{
  return 0;
}

- (NSDate)purchaseDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset parentAsset](self, "parentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "purchaseDate"));

  return (NSDate *)v3;
}

- (int64_t)rating
{
  return 0;
}

- (NSString)accountID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset parentAsset](self, "parentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountID"));

  return (NSString *)v3;
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

- (int64_t)generation
{
  return 1;
}

- (int64_t)fileSize
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset size](self, "size"));
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (signed)contentType
{
  return 3;
}

- (signed)state
{
  return 3;
}

- (NSDate)dataSourceInsertionDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset parentAsset](self, "parentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataSourceInsertionDate"));

  return (NSDate *)v3;
}

- (NSDate)releaseDate
{
  return 0;
}

- (NSDate)expectedDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySupplementalAsset parentAsset](self, "parentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "expectedDate"));

  return (NSDate *)v3;
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

- (int64_t)pageCount
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

- (NSString)kind
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
  return 0;
}

- (BOOL)isDevelopment
{
  return 0;
}

- (BKLibrarySupplementalAsset)initWithParentAsset:(id)a3 dataSourceIdentifier:(id)a4 storeID:(id)a5 title:(id)a6 downloadParams:(id)a7 size:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BKLibrarySupplementalAsset *v21;
  BKLibrarySupplementalAsset *v22;
  NSString *v23;
  NSString *storeID;
  NSString *v25;
  NSString *title;
  NSString *v27;
  NSString *dataSourceIdentifier;
  NSString *v29;
  NSString *storeDownloadParameters;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v32.receiver = self;
  v32.super_class = (Class)BKLibrarySupplementalAsset;
  v21 = -[BKLibrarySupplementalAsset init](&v32, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_parentAsset, a3);
    v23 = (NSString *)objc_msgSend(v17, "copy");
    storeID = v22->_storeID;
    v22->_storeID = v23;

    v25 = (NSString *)objc_msgSend(v18, "copy");
    title = v22->_title;
    v22->_title = v25;

    v27 = (NSString *)objc_msgSend(v16, "copy");
    dataSourceIdentifier = v22->_dataSourceIdentifier;
    v22->_dataSourceIdentifier = v27;

    v29 = (NSString *)objc_msgSend(v19, "copy");
    storeDownloadParameters = v22->_storeDownloadParameters;
    v22->_storeDownloadParameters = v29;

    objc_storeStrong((id *)&v22->_size, a8);
  }

  return v22;
}

+ (id)newAssetFromJaliscoBookletItem:(id)a3 parentAsset:(id)a4 dataSourceIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  BKLibrarySupplementalAsset *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BKLibrarySupplementalAsset *v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [BKLibrarySupplementalAsset alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeDownloadParameters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "size"));

  v15 = -[BKLibrarySupplementalAsset initWithParentAsset:dataSourceIdentifier:storeID:title:downloadParams:size:](v10, "initWithParentAsset:dataSourceIdentifier:storeID:title:downloadParams:size:", v8, v7, v11, v12, v13, v14);
  return v15;
}

- (BKAsset)parentAsset
{
  return (BKAsset *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParentAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)storeID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDataSourceIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)storeDownloadParameters
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoreDownloadParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)size
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_storeDownloadParameters, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_parentAsset, 0);
}

@end
