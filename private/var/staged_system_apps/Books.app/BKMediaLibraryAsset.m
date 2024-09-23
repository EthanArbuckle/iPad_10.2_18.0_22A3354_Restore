@implementation BKMediaLibraryAsset

+ (id)newAssetFromRepresentativeMediaItem:(id)a3 withDataSourceIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BKMediaLibraryAsset *v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bk_assetID"));
  if (objc_msgSend(v7, "length"))
    v8 = -[BKMediaLibraryAsset initWithRepresentativeMediaItem:assetID:dataSourceIdentifier:]([BKMediaLibraryAsset alloc], "initWithRepresentativeMediaItem:assetID:dataSourceIdentifier:", v5, v7, v6);
  else
    v8 = 0;

  return v8;
}

- (BKMediaLibraryAsset)initWithRepresentativeMediaItem:(id)a3 assetID:(id)a4 dataSourceIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  BKMediaLibraryAsset *v12;
  BKMediaLibraryAsset *v13;
  uint64_t v14;
  NSDate *dataSourceInsertionDate;
  unsigned __int8 v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  BKMediaLibraryAsset *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BKMediaLibraryAsset;
  v12 = -[BKMediaLibraryAsset init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_representativeItem, a3);
    objc_storeStrong((id *)&v13->_assetID, a4);
    objc_storeStrong((id *)&v13->_dataSourceIdentifier, a5);
    v14 = objc_claimAutoreleasedReturnValue(-[MPMediaItem releaseDate](v13->_representativeItem, "releaseDate"));
    dataSourceInsertionDate = v13->_dataSourceInsertionDate;
    v13->_dataSourceInsertionDate = (NSDate *)v14;

    v16 = -[MPMediaItem bk_isJaliscoAsset](v13->_representativeItem, "bk_isJaliscoAsset");
    v13->_cloudAsset = v16;
    if ((v16 & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bk_storePlaylistID"));
      if (v17)
      {
        v18 = objc_alloc_init((Class)BLMetadataStore);
        v19 = objc_msgSend(v17, "longLongValue");
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10013262C;
        v21[3] = &unk_1008EBDB0;
        v22 = v13;
        objc_msgSend(v18, "racGUIDForStoreID:result:", v19, v21);

      }
    }
  }

  return v13;
}

- (MPMediaItemCollection)collection
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
  v4 = objc_opt_class(NSNumber);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", MPMediaItemPropertyAlbumPersistentID));
  v7 = BUDynamicCast(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v8, MPMediaItemPropertyAlbumPersistentID));
    objc_msgSend(v3, "addFilterPredicate:", v9);

    if (-[BKMediaLibraryAsset isCloudAsset](self, "isCloudAsset"))
    {
      objc_msgSend(v3, "setIgnoreSystemFilterPredicates:", 1);
      v10 = objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", &off_10092EDF0, MPMediaItemPropertyPurchaseHistoryID, 100));
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &off_10092EDF0, MPMediaItemPropertyPurchaseHistoryID));
    }
    v12 = (void *)v10;
    objc_msgSend(v3, "addFilterPredicate:", v10);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collections"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

  }
  else
  {
    v11 = 0;
  }

  return (MPMediaItemCollection *)v11;
}

- (id)localAndCloudCollection
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
  v4 = objc_opt_class(NSNumber);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", MPMediaItemPropertyAlbumPersistentID));
  v7 = BUDynamicCast(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    objc_msgSend(v3, "setIgnoreSystemFilterPredicates:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v8, MPMediaItemPropertyAlbumPersistentID));
    objc_msgSend(v3, "addFilterPredicate:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collections"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)clampedBookmarkTime:(double)a3 duration:(double)a4
{
  double v5;
  uint64_t v7;
  NSObject *v8;
  void *v10;
  void *v11;
  int v12;
  double v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  double v19;

  if (a3 <= a4)
  {
    if (a3 < 0.0)
      return 0.0;
    else
      return a3;
  }
  else
  {
    v5 = a4;
    v7 = BKLibraryDataSourceMediaLibraryLog(self);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset title](self, "title"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset author](self, "author"));
      v12 = 134218754;
      v13 = a3;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2048;
      v19 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "bookmark time %lf for asset \"%@\" by \"%@\" is greater than duration %lf", (uint8_t *)&v12, 0x2Au);

    }
  }
  return v5;
}

- (NSNumber)localReadPercent
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset collection](self, "collection"));
  objc_msgSend(v3, "bk_localBookmarkTime");
  v5 = v4;
  objc_msgSend(v3, "bk_localDuration");
  v7 = v6;
  -[BKMediaLibraryAsset clampedBookmarkTime:duration:](self, "clampedBookmarkTime:duration:", v5, v6);
  if (v7 <= 0.0)
    v9 = 0;
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8 / v7));

  return (NSNumber *)v9;
}

- (NSNumber)cloudReadPercent
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset collection](self, "collection"));
  objc_msgSend(v3, "bk_cloudBookmarkTime");
  v5 = v4;
  objc_msgSend(v3, "bk_cloudDuration");
  v7 = v6;
  -[BKMediaLibraryAsset clampedBookmarkTime:duration:](self, "clampedBookmarkTime:duration:", v5, v6);
  if (v7 <= 0.0)
    v9 = 0;
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8 / v7));

  return (NSNumber *)v9;
}

- (NSNumber)readPercent
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset localAndCloudCollection](self, "localAndCloudCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bk_mostRecentListeningProgress"));

  return (NSNumber *)v3;
}

- (BOOL)hasBeenPlayed
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset collection](self, "collection"));
  if (-[BKMediaLibraryAsset isCloudAsset](self, "isCloudAsset"))
    v4 = objc_msgSend(v3, "bk_cloudHasBeenPlayed");
  else
    v4 = objc_msgSend(v3, "bk_localHasBeenPlayed");
  v5 = v4;

  return v5;
}

- (NSString)accountID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", MPMediaItemPropertyStoreAccountID));

  if (objc_msgSend(v3, "longLongValue"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSString)storeID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bk_storeID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));

  return (NSString *)v4;
}

- (NSString)storeRedownloadParameters
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bk_storeRedownloadParameters"));

  return (NSString *)v3;
}

- (NSString)temporaryAssetID
{
  return 0;
}

- (NSString)author
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveAlbumArtist"));

  return (NSString *)v3;
}

- (NSString)sortAuthor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForProperty:", MPMediaItemPropertySortAlbumArtist));

  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", MPMediaItemPropertySortArtist));

    v4 = (void *)v6;
  }
  return (NSString *)v4;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForProperty:", MPMediaItemPropertyAlbumTitle));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", MPMediaItemPropertyPurchaseHistoryID));

  if (!objc_msgSend(v4, "length") && objc_msgSend(v6, "longLongValue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForProperty:", MPMediaItemPropertyTitle));

    v4 = (void *)v8;
  }

  return (NSString *)v4;
}

- (NSString)sortTitle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForProperty:", MPMediaItemPropertySortAlbumTitle));

  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", MPMediaItemPropertySortTitle));

    v4 = (void *)v6;
  }
  if (!objc_msgSend(v4, "length"))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset title](self, "title"));

    v4 = (void *)v7;
  }
  return (NSString *)v4;
}

- (NSURL)url
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset title](self, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaItem bk_audioBookAssetURLWithAlbumTitle:isCloudItem:](MPMediaItem, "bk_audioBookAssetURLWithAlbumTitle:isCloudItem:", v3, -[BKMediaLibraryAsset isCloudAsset](self, "isCloudAsset")));

  return (NSURL *)v4;
}

- (NSString)genre
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", MPMediaItemPropertyGenre));

  return (NSString *)v3;
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

- (int64_t)generation
{
  return 1;
}

- (int64_t)fileSize
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", MPMediaItemPropertyFileSize));
  v4 = objc_msgSend(v3, "longLongValue");

  return (int64_t)v4;
}

- (signed)contentType
{
  return 6;
}

- (BOOL)isCloudAsset
{
  return -[BKMediaLibraryAsset cloudAsset](self, "cloudAsset");
}

- (signed)state
{
  if (-[BKMediaLibraryAsset isCloudAsset](self, "isCloudAsset"))
    return 3;
  else
    return 1;
}

- (BOOL)isEphemeral
{
  return 0;
}

- (BOOL)isDevelopment
{
  return 0;
}

- (NSNumber)isExplicit
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", MPMediaItemPropertyIsExplicit));

  return (NSNumber *)v3;
}

- (NSDate)releaseDate
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", MPMediaItemPropertyReleaseDate));

  v4 = objc_opt_class(NSDate);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSDate *)v6;
}

- (NSDate)purchaseDate
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", MPMediaItemPropertyStoreDatePurchased));

  v4 = objc_opt_class(NSDate);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSDate *)v6;
}

- (NSDate)expectedDate
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v4 = objc_msgSend(v3, "isPreorder");

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset releaseDate](self, "releaseDate"));
  else
    v5 = 0;
  return (NSDate *)v5;
}

- (NSDate)lastOpenDate
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

- (id)pageProgressionDirection
{
  return 0;
}

- (int64_t)pageCount
{
  return 0;
}

- (int64_t)rating
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", MPMediaItemPropertyRating));
  v4 = objc_msgSend(v3, "longLongValue");

  return (int64_t)v4;
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

- (NSString)bookDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForProperty:", MPMediaItemPropertyShortDescriptionInfo));

  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", MPMediaItemPropertyDescriptionInfo));

    v4 = (void *)v6;
  }
  return (NSString *)v4;
}

- (NSString)comments
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset representativeItem](self, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", MPMediaItemPropertyComments));

  return (NSString *)v3;
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
  return 0;
}

- (NSURL)assetURL
{
  return 0;
}

- (NSNumber)isStoreAudiobook
{
  return (NSNumber *)&__kCFBooleanFalse;
}

- (NSDictionary)options
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset storeID](self, "storeID"));
  if (v3)
  {
    v7 = CFSTR("storeID");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset storeID](self, "storeID"));
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

  }
  else
  {
    v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[BKMediaLibraryAsset isCloudAsset](self, "isCloudAsset"))
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset storeID](self, "storeID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset assetID](self, "assetID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset title](self, "title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset author](self, "author"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryAsset storeRedownloadParameters](self, "storeRedownloadParameters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) isCloud=%@ storeID=%@ assetID=%@ title=%@ author=%@ storeRedownloadParameters=%@>"), v5, self, v6, v7, v8, v9, v10, v11));

  return (NSString *)v12;
}

- (MPMediaItem)representativeItem
{
  return (MPMediaItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRepresentativeItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)hasRACSupport
{
  return self->_hasRACSupport;
}

- (void)setHasRACSupport:(id)a3
{
  objc_storeStrong((id *)&self->_hasRACSupport, a3);
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataSourceIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)dataSourceInsertionDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDataSourceInsertionDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)cloudAsset
{
  return self->_cloudAsset;
}

- (void)setCloudAsset:(BOOL)a3
{
  self->_cloudAsset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceInsertionDate, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_hasRACSupport, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_representativeItem, 0);
}

@end
