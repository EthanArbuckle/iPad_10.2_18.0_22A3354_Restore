@implementation ICStoreFinanceItemMetadata

- (ICStoreFinanceItemMetadata)initWithMetadataDictionary:(id)a3
{
  id v5;
  ICStoreFinanceItemMetadata *v6;
  ICStoreFinanceItemMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStoreFinanceItemMetadata;
  v6 = -[ICStoreFinanceItemMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metadataDictionary, a3);

  return v7;
}

- (NSNumber)itemAdamID
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("itemId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)itemCloudID
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("cloud-id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)itemName
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("itemName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)itemSortName
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("sort-name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)artistName
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("artistName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)artistSortName
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("sort-artist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)artistID
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("artistId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)playlistName
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("playlistName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)albumSortName
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("sort-album"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)playlistArtistName
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("playlistArtistName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)composerName
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("composerName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)composerSortName
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("sort-composer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)genre
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("genre"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)genreID
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("genreId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)albumID
{
  void *v2;
  void *v3;
  id v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("playlistId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)discCount
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("discCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)discNumber
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("discNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)trackCount
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("trackCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)trackNumber
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("trackNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)duration
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("duration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)isExplicit
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("explicit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)year
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("year"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)bitrate
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("bitRate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)comments
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("comments"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSDate)dateAdded
{
  void *v2;
  void *v3;
  NSDate *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("dateAdded"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDate())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)drmVersionNumber
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("bitrate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)fileExtension
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("fileExtension"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)isGapless
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("gapless"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)isMasteredForITunes
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("isMasteredForItunes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)kind
{
  return (NSString *)-[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("kind"));
}

- (NSNumber)sampleRate
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("sampleRate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)versionRestrictions
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("versionRestrictions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)xid
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("xid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)isCompilation
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("compilation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)copyright
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("copyright"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)rank
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("rank"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSDate)releaseDate
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("releaseDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    if (releaseDate_sOnceToken != -1)
      dispatch_once(&releaseDate_sOnceToken, &__block_literal_global_1349);
    objc_msgSend((id)releaseDate_sReleaseDateFormatter, "dateFromString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (NSNumber)storefrontID
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("s"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)vendorID
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("vendorId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (NSNumber)playlistID
{
  return self->_playlistID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistID, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

void __41__ICStoreFinanceItemMetadata_releaseDate__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)releaseDate_sReleaseDateFormatter;
  releaseDate_sReleaseDateFormatter = (uint64_t)v0;

  objc_msgSend((id)releaseDate_sReleaseDateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
  v2 = (void *)releaseDate_sReleaseDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)releaseDate_sReleaseDateFormatter, "setLenient:", 1);
  v4 = (void *)releaseDate_sReleaseDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

}

@end
