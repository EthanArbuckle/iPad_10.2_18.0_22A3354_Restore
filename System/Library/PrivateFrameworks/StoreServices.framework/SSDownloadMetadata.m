@implementation SSDownloadMetadata

- (SSDownloadMetadata)init
{
  return -[SSDownloadMetadata initWithDictionary:](self, "initWithDictionary:", 0);
}

- (SSDownloadMetadata)initWithDictionary:(id)a3
{
  SSDownloadMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSDownloadMetadata;
  v4 = -[SSDownloadMetadata init](&v6, sel_init);
  if (v4)
  {
    v4->_dictionary = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  }
  return v4;
}

- (SSDownloadMetadata)initWithItem:(id)a3
{
  return -[SSDownloadMetadata initWithItem:offer:](self, "initWithItem:offer:", a3, objc_msgSend(a3, "defaultItemOffer"));
}

- (SSDownloadMetadata)initWithItem:(id)a3 offer:(id)a4
{
  SSDownloadMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v6 = -[SSDownloadMetadata initWithDictionary:](self, "initWithDictionary:", 0);
  if (!v6)
    return v6;
  v7 = objc_msgSend(a3, "ITunesStoreIdentifier");
  if (v7)
  {
    v8 = v7;
    -[SSDownloadMetadata setItemIdentifier:](v6, "setItemIdentifier:", SSGetItemIdentifierFromValue(v7));
    if (objc_msgSend(a4, "isPreorder"))
    {
      v9 = objc_msgSend(a3, "preOrderIdentifier");
      if (!v9)
        v9 = v8;
      -[SSDownloadMetadata setPreOrderIdentifier:](v6, "setPreOrderIdentifier:", SSGetItemIdentifierFromValue(v9));
    }
  }
  -[SSDownloadMetadata setArtistIdentifier:](v6, "setArtistIdentifier:", objc_msgSend((id)objc_msgSend(a3, "artistIdentifier"), "itemIdentifierValue"));
  -[SSDownloadMetadata setBundleIdentifier:](v6, "setBundleIdentifier:", objc_msgSend(a3, "bundleIdentifier"));
  -[SSDownloadMetadata setCollectionArtistName:](v6, "setCollectionArtistName:", objc_msgSend(a3, "collectionArtistName"));
  -[SSDownloadMetadata setCollectionIdentifier:](v6, "setCollectionIdentifier:", objc_msgSend((id)objc_msgSend(a3, "collectionIdentifier"), "itemIdentifierValue"));
  -[SSDownloadMetadata setCollectionIndexInCollectionGroup:](v6, "setCollectionIndexInCollectionGroup:", objc_msgSend(a3, "collectionIndexInCollectionGroup"));
  -[SSDownloadMetadata setCollectionName:](v6, "setCollectionName:", objc_msgSend(a3, "collectionName"));
  -[SSDownloadMetadata setCompilation:](v6, "setCompilation:", objc_msgSend(a3, "isCompilation"));
  -[SSDownloadMetadata setComposerName:](v6, "setComposerName:", objc_msgSend(a3, "composerName"));
  -[SSDownloadMetadata setEpisodeIdentifier:](v6, "setEpisodeIdentifier:", objc_msgSend(a3, "episodeIdentifier"));
  -[SSDownloadMetadata setEpisodeSortIdentifier:](v6, "setEpisodeSortIdentifier:", objc_msgSend(a3, "episodeSortIdentifier"));
  -[SSDownloadMetadata setGenre:](v6, "setGenre:", objc_msgSend(a3, "genreName"));
  -[SSDownloadMetadata setGenreIdentifier:](v6, "setGenreIdentifier:", objc_msgSend((id)objc_msgSend(a3, "genreIdentifier"), "itemIdentifierValue"));
  -[SSDownloadMetadata setIndexInCollection:](v6, "setIndexInCollection:", objc_msgSend(a3, "indexInCollection"));
  -[SSDownloadMetadata setLongDescription:](v6, "setLongDescription:", objc_msgSend(a3, "longDescription"));
  -[SSDownloadMetadata setNetworkName:](v6, "setNetworkName:", objc_msgSend(a3, "networkName"));
  -[SSDownloadMetadata setNumberOfCollectionsInCollectionGroup:](v6, "setNumberOfCollectionsInCollectionGroup:", objc_msgSend(a3, "numberOfCollectionsInCollectionGroup"));
  -[SSDownloadMetadata setNumberOfItemsInCollection:](v6, "setNumberOfItemsInCollection:", objc_msgSend(a3, "numberOfItemsInCollection"));
  -[SSDownloadMetadata setPodcastEpisodeGUID:](v6, "setPodcastEpisodeGUID:", objc_msgSend(a3, "podcastEpisodeGUID"));
  -[SSDownloadMetadata setSeasonNumber:](v6, "setSeasonNumber:", objc_msgSend(a3, "seasonNumber"));
  -[SSDownloadMetadata setSeriesName:](v6, "setSeriesName:", objc_msgSend(a3, "seriesName"));
  -[SSDownloadMetadata setShortDescription:](v6, "setShortDescription:", objc_msgSend(a3, "shortDescription"));
  -[SSDownloadMetadata setSubtitle:](v6, "setSubtitle:", objc_msgSend(a3, "artistName"));
  -[SSDownloadMetadata setTitle:](v6, "setTitle:", objc_msgSend(a3, "itemTitle"));
  -[SSDownloadMetadata setVideoDetailsDictionary:](v6, "setVideoDetailsDictionary:", objc_msgSend(a3, "videoDetails"));
  v10 = (__CFString *)SSDownloadKindForItemKind((void *)objc_msgSend(a3, "itemKind"));
  -[SSDownloadMetadata setKind:](v6, "setKind:", v10);
  v11 = (void *)objc_msgSend(a3, "softwareType");
  -[SSDownloadMetadata setValue:forMetadataKey:](v6, "setValue:forMetadataKey:", v11, CFSTR("software-type"));
  v12 = (void *)objc_msgSend(a3, "contentRating");
  -[SSDownloadMetadata setContentRating:](v6, "setContentRating:", v12);
  -[SSDownloadMetadata setExplicitContent:](v6, "setExplicitContent:", objc_msgSend(v12, "isExplicitContent"));
  -[SSDownloadMetadata setHighDefinition:](v6, "setHighDefinition:", objc_msgSend(a3, "isHighDefinition"));
  v13 = objc_msgSend((id)objc_msgSend(a4, "playableMedia"), "fullDurationInMilliseconds");
  if ((v13 & 0x8000000000000000) == 0)
    -[SSDownloadMetadata setDurationInMilliseconds:](v6, "setDurationInMilliseconds:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13));
  v14 = (void *)objc_msgSend(a3, "imageCollection");
  v15 = (void *)objc_msgSend(v14, "bestImageForSize:", 0.0, 0.0);
  -[SSDownloadMetadata setFullSizeImageURL:](v6, "setFullSizeImageURL:", objc_msgSend(v15, "URL"));
  if ((SSDownloadKindIsSoftwareKind(v10) & 1) == 0)
  {
    v17 = 88.0;
LABEL_19:
    v18 = objc_msgSend(v14, "bestImageForSize:", v17, v17);
    goto LABEL_20;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("newsstand")))
    v16 = (void *)objc_msgSend(v14, "imagesForKind:", CFSTR("newsstand-latest-issue-icon.default"));
  else
    v16 = 0;
  if (!objc_msgSend(v16, "count"))
    v16 = (void *)objc_msgSend(v14, "imagesForKind:", CFSTR("software-icon.default"));
  if (!objc_msgSend(v16, "count"))
  {
    v17 = 57.0;
    goto LABEL_19;
  }
  v18 = objc_msgSend(v16, "lastObject");
LABEL_20:
  v19 = (void *)v18;
  if ((objc_msgSend(v15, "isPrerendered") & 1) != 0)
    v20 = 1;
  else
    v20 = objc_msgSend(v19, "isPrerendered");
  -[SSDownloadMetadata setArtworkIsPrerendered:](v6, "setArtworkIsPrerendered:", v20);
  if (v19)
  {
    -[SSDownloadMetadata setThumbnailImageURL:](v6, "setThumbnailImageURL:", objc_msgSend(v19, "URL"));
    -[SSDownloadMetadata setThumbnailNewsstandBindingEdge:](v6, "setThumbnailNewsstandBindingEdge:", objc_msgSend(v19, "valueForProperty:", CFSTR("UINewsstandBindingEdge")));
    v21 = v19;
  }
  else
  {
    -[SSDownloadMetadata setThumbnailImageURL:](v6, "setThumbnailImageURL:", objc_msgSend(v15, "URL"));
    -[SSDownloadMetadata setThumbnailNewsstandBindingEdge:](v6, "setThumbnailNewsstandBindingEdge:", objc_msgSend(v15, "valueForProperty:", CFSTR("UINewsstandBindingEdge")));
    v21 = v15;
  }
  -[SSDownloadMetadata setThumbnailNewsstandBindingType:](v6, "setThumbnailNewsstandBindingType:", objc_msgSend(v21, "valueForProperty:", CFSTR("UINewsstandBindingType")));
  v22 = objc_msgSend(a3, "releaseDate");
  if (v22)
  {
    v23 = v22;
    v24 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"), "components:fromDate:", 4, v22);
    if (v24)
      -[SSDownloadMetadata setReleaseYear:](v6, "setReleaseYear:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v24, "year")));
    -[SSDownloadMetadata setReleaseDate:](v6, "setReleaseDate:", v23);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "itemKind"), "isEqualToString:", CFSTR("itunes-u")))
    -[SSDownloadMetadata setPodcastType:](v6, "setPodcastType:", CFSTR("itunes-u"));
  if (SSDownloadKindIsPodcastKind(v10))
  {
    -[SSDownloadMetadata setPodcastFeedURL:](v6, "setPodcastFeedURL:", objc_msgSend(a3, "podcastFeedURL"));
    -[SSDownloadMetadata setPrimaryAssetURL:](v6, "setPrimaryAssetURL:", objc_msgSend((id)objc_msgSend(a4, "playableMedia"), "URL"));
  }
  return v6;
}

- (SSDownloadMetadata)initWithKind:(id)a3
{
  SSDownloadMetadata *v4;
  SSDownloadMetadata *v5;

  v4 = -[SSDownloadMetadata initWithDictionary:](self, "initWithDictionary:", 0);
  v5 = v4;
  if (v4)
    -[SSDownloadMetadata setKind:](v4, "setKind:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadMetadata;
  -[SSDownloadMetadata dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSDownloadMetadata.m"), 403, CFSTR("Only keyed coding is supported"));
  -[NSLock lock](self->_lock, "lock");
  objc_msgSend(a3, "encodeObject:forKey:", self->_dictionary, CFSTR("dict"));
  -[NSLock unlock](self->_lock, "unlock");
}

- (SSDownloadMetadata)initWithCoder:(id)a3
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SSDownloadMetadata *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSDownloadMetadata.m"), 410, CFSTR("Only keyed coding is supported"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v13 = -[SSDownloadMetadata initWithDictionary:](self, "initWithDictionary:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("dict")));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("kind")))
  {
    -[SSDownloadMetadata setArtworkIsPrerendered:](v13, "setArtworkIsPrerendered:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("prerender")));
    -[SSDownloadMetadata setBundleIdentifier:](v13, "setBundleIdentifier:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bid")));
    -[SSDownloadMetadata setCollectionName:](v13, "setCollectionName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playlist")));
    -[SSDownloadMetadata setKind:](v13, "setKind:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind")));
    -[SSDownloadMetadata setDownloadKey:](v13, "setDownloadKey:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key")));
    -[SSDownloadMetadata setDurationInMilliseconds:](v13, "setDurationInMilliseconds:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("duration")));
    -[SSDownloadMetadata setGenre:](v13, "setGenre:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genre")));
    -[SSDownloadMetadata setRental:](v13, "setRental:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("rental")));
    -[SSDownloadMetadata setSinfs:](v13, "setSinfs:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("sinfs")));
    -[SSDownloadMetadata setThumbnailImageURL:](v13, "setThumbnailImageURL:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("small-image")));
    -[SSDownloadMetadata setTitle:](v13, "setTitle:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title")));
    -[SSDownloadMetadata setTransactionIdentifier:](v13, "setTransactionIdentifier:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tid")));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v15 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2)), CFSTR("identifier"));
    if (v15)
      -[SSDownloadMetadata setItemIdentifier:](v13, "setItemIdentifier:", SSGetItemIdentifierFromValue(v15));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v17 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2)), CFSTR("preorder-id"));
    if (v17)
      -[SSDownloadMetadata setPreOrderIdentifier:](v13, "setPreOrderIdentifier:", SSGetItemIdentifierFromValue(v17));
    v18 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artist"));
    if (!v18)
      v18 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    -[SSDownloadMetadata setSubtitle:](v13, "setSubtitle:", v18);
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NSLock lock](self->_lock, "lock");
  v5[1] = -[NSMutableDictionary mutableCopyWithZone:](self->_dictionary, "mutableCopyWithZone:", a3);
  -[NSLock unlock](self->_lock, "unlock");
  return v5;
}

- (id)copyXPCEncoding
{
  return SSXPCCreateXPCObjectFromCFObject((__CFString *)self->_dictionary);
}

- (SSDownloadMetadata)initWithXPCEncoding:(id)a3
{
  CFArrayRef v4;
  SSDownloadMetadata *v5;

  v4 = SSXPCCreateCFObjectFromXPCObject((const __CFDictionary *)a3);
  v5 = -[SSDownloadMetadata initWithDictionary:](self, "initWithDictionary:", v4);

  return v5;
}

- (id)applicationIdentifier
{
  unint64_t v3;
  id result;

  v3 = -[SSDownloadMetadata itemIdentifier](self, "itemIdentifier");
  if (v3)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v3);
  result = -[SSDownloadMetadata bundleIdentifier](self, "bundleIdentifier");
  if (!result)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v3);
  return result;
}

- (unint64_t)artistIdentifier
{
  return SSGetItemIdentifierFromValue(-[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("artistId"), CFSTR("artist-id"), 0));
}

- (NSString)artistName
{
  NSString *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("artistName"), CFSTR("artist-name"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (BOOL)artworkIsPrerendered
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("softwareIconNeedsShine"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue") ^ 1;
  else
    return 0;
}

- (id)betaExternalVersionIdentifier
{
  id v2;

  v2 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("betaExternalVersionIdentifier"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)bundleIdentifier
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("softwareVersionBundleId"), CFSTR("bundle-id"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)cloudIdentifier
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("cloud-id"), CFSTR("sagaId"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)collectionArtistName
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("playlistArtistName"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (unint64_t)collectionIdentifier
{
  return SSGetItemIdentifierFromValue(-[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("playlistId"), CFSTR("collection-id"), 0));
}

- (id)collectionIndexInCollectionGroup
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("discNumber"), CFSTR("disc-number"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)collectionName
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("playlistName"), CFSTR("collection-name"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (unint64_t)composerIdentifier
{
  return SSGetItemIdentifierFromValue(-[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("composerId"), CFSTR("composer-id"), 0));
}

- (id)composerName
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("composerName"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)contentRating
{
  id v2;
  char isKindOfClass;
  SSItemContentRating *v4;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("rating"), 0);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = 0;
  if ((isKindOfClass & 1) != 0)
    v4 = -[SSItemContentRating initWithDictionary:]([SSItemContentRating alloc], "initWithDictionary:", v2);
  return v4;
}

- (id)documentTargetIdentifier
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("document-target-app"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)downloadPermalink
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("download-permalink"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)durationInMilliseconds
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("duration"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)enableExtensions
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("enableExtensions"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)episodeIdentifier
{
  return -[SSDownloadMetadata _stringValueForValue:](self, "_stringValueForValue:", -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("episode-number"), 0));
}

- (id)episodeSortIdentifier
{
  id v3;

  v3 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("episode-sort-id"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return -[SSDownloadMetadata indexInCollection](self, "indexInCollection");
}

- (NSURL)fullSizeImageURL
{
  id v3;
  NSURL *result;
  SSItemImageCollection *v5;
  NSURL *v6;

  v3 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("artworkURL"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  result = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("artwork-urls"), 0);
  if (result)
  {
    v5 = -[SSItemImageCollection initWithImageCollection:]([SSItemImageCollection alloc], "initWithImageCollection:", result);
    v6 = (NSURL *)(id)objc_msgSend(-[SSItemImageCollection bestImageForSize:](v5, "bestImageForSize:", 0.0, 0.0), "URL");

    return v6;
  }
  return result;
}

- (NSString)genre
{
  NSString *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("genre"), CFSTR("genreName"), CFSTR("genre-name"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (unint64_t)genreIdentifier
{
  return SSGetItemIdentifierFromValue(-[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("genreId"), CFSTR("genre-id"), 0));
}

- (BOOL)hasMessagesExtension
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("hasMessagesExtension"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (NSURL)hlsPlaylistURL
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("hls-playlist-url"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  else
    return 0;
}

- (id)indexInCollection
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("trackNumber"), CFSTR("track-number"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (BOOL)is32BitOnly
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("is32BitOnly"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isCompilation
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("compilation"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isDeviceBasedVPP
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("isDeviceBased"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isExplicitContent
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("explicit"), 0);
  return (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v2, "integerValue") == 1;
}

- (BOOL)hasHDR
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("has-hdr"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isHighDefinition
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("high-definition"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isHLS
{
  NSURL *v3;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;

  v3 = -[SSDownloadMetadata hlsPlaylistURL](self, "hlsPlaylistURL");
  if (SSDownloadKindIsVideosAppKind(-[SSDownloadMetadata kind](self, "kind")))
    return v3 != 0;
  v5 = -[SSDownloadMetadata isPremium](self, "isPremium");
  v6 = -[SSDownloadMetadata hasHDR](self, "hasHDR");
  v7 = v6 & SSDeviceSupportsHDRDownload() | v5;
  return v3 && v7;
}

- (BOOL)isPremium
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("PR"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isRental
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("isRental"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isSample
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("isSample"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isSharedResource
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("isSharedResource"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isTvTemplate
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("isTvTemplateApp"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (unint64_t)itemIdentifier
{
  return SSGetItemIdentifierFromValue(-[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("itemId"), CFSTR("songId"), CFSTR("item-id"), 0));
}

- (NSString)kind
{
  NSString *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("kind"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSURL)launchExtrasUrl
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("launch-extras-url"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  else
    return 0;
}

- (BOOL)launchProhibited
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("launchProhibited"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (NSString)longDescription
{
  NSString *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("longDescription"), CFSTR("long-description"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)messagesArtworkURL
{
  return -[SSDownloadMetadata _urlValueForValue:](self, "_urlValueForValue:", -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("messagesIconUrl"), 0));
}

- (id)networkName
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("network-name"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)numberOfCollectionsInCollectionGroup
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("discCount"), CFSTR("disc-count"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)numberOfItemsInCollection
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("trackCount"), CFSTR("track-count"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)podcastEpisodeGUID
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("episode-guid"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)podcastFeedURL
{
  return -[SSDownloadMetadata _urlValueForValue:](self, "_urlValueForValue:", -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("podcast-feed-url"), 0));
}

- (id)podcastType
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("podcast-type"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSDictionary)primaryAssetDictionary
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)objc_msgSend(-[SSDownloadMetadata _assetDictionary](self, "_assetDictionary"), "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (id)purchaseDate
{
  return -[SSDownloadMetadata _dateValueForValue:](self, "_dateValueForValue:", -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("purchaseDate"), 0));
}

- (NSDate)releaseDate
{
  return (NSDate *)-[SSDownloadMetadata _dateValueForValue:](self, "_dateValueForValue:", -[SSDownloadMetadata _releaseDateValue](self, "_releaseDateValue"));
}

- (NSNumber)releaseYear
{
  NSNumber *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("year"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSNumber)rentalID
{
  NSNumber *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("rental-id"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (unint64_t)sagaIdentifier
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("cloud-id"), CFSTR("sagaId"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v2, "unsignedLongLongValue");
  else
    return 0;
}

- (id)seasonNumber
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("season-number"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)seriesName
{
  id v3;

  v3 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("show-name"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return -[SSDownloadMetadata collectionName](self, "collectionName");
}

- (id)longSeasonDescription
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("longSeasonDescription"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)downloadPolicy
{
  id v2;
  void *v3;
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("downloadPolicy"), 0);
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0;
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v19);
    if (v19)
    {
      v4 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v4)
        v4 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = objc_msgSend(v4, "shouldLog");
      if (objc_msgSend(v4, "shouldLogToDisk"))
        v6 = v5 | 2;
      else
        v6 = v5;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v6 &= 2u;
      if (v6)
      {
        v7 = objc_opt_class();
        v20 = 138543618;
        v21 = v7;
        v22 = 2114;
        v23 = v19;
        LODWORD(v18) = 22;
        v8 = _os_log_send_and_compose_impl();
        if (v8)
        {
          v9 = (void *)v8;
          v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v20, v18);
          free(v9);
          SSFileLog(v4, CFSTR("%@"), v11, v12, v13, v14, v15, v16, v10);
        }
      }
    }
  }
  return v3;
}

- (void)setArtistIdentifier:(unint64_t)a3
{
  uint64_t v4;
  const __CFString *v5;

  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", a3);
  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("artist-id");
  else
    v5 = CFSTR("artistId");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, v5);
}

- (void)setArtistName:(id)a3
{
  const __CFString *v5;

  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("artist-name");
  else
    v5 = CFSTR("artistName");
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, v5);
}

- (void)setArtworkIsPrerendered:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !a3), CFSTR("softwareIconNeedsShine"));
}

- (void)setBetaExternalVersionIdentifier:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("betaExternalVersionIdentifier"));
}

- (void)setBundleIdentifier:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("softwareVersionBundleId"));
}

- (void)setCloudIdentifier:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("cloud-id"));
}

- (void)setCollectionArtistName:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("playlistArtistName"));
}

- (void)setCollectionIdentifier:(unint64_t)a3
{
  uint64_t v4;
  const __CFString *v5;

  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", a3);
  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("collection-id");
  else
    v5 = CFSTR("playlistId");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, v5);
}

- (void)setCollectionIndexInCollectionGroup:(id)a3
{
  const __CFString *v5;

  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("disc-number");
  else
    v5 = CFSTR("discNumber");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, v5);
}

- (void)setCollectionName:(id)a3
{
  const __CFString *v5;

  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("collection-name");
  else
    v5 = CFSTR("playlistName");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, v5);
}

- (void)setCompilation:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("compilation"));
}

- (void)setDeviceBasedVPP:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("isDeviceBased"));
}

- (void)setComposerIdentifier:(unint64_t)a3
{
  uint64_t v4;
  const __CFString *v5;

  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", a3);
  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("composer-id");
  else
    v5 = CFSTR("composerId");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, v5);
}

- (void)setComposerName:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("composerName"));
}

- (void)setContentRating:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(a3, "contentRatingDictionary"), CFSTR("rating"));
}

- (void)setDocumentTargetIdentifier:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("document-target-app"));
}

- (void)setDurationInMilliseconds:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("duration"));
}

- (void)setEnableExtensions:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("enableExtensions"));
}

- (void)setEpisodeIdentifier:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("episode-number"));
}

- (void)setEpisodeSortIdentifier:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("episode-sort-id"));
}

- (void)setExplicitContent:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("explicit"));
}

- (void)setFullSizeImageURL:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(a3, "absoluteString"), CFSTR("artworkURL"));
}

- (void)setGenre:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("genre"));
}

- (void)setGenreIdentifier:(unint64_t)a3
{
  uint64_t v4;
  const __CFString *v5;

  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", a3);
  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("genre-id");
  else
    v5 = CFSTR("genreId");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, v5);
}

- (void)setHasMessagesExtension:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("hasMessagesExtension"));
}

- (void)setHighDefinition:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("high-definition"));
}

- (void)setHlsPlaylistURL:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(a3, "absoluteString"), CFSTR("hls-playlist-url"));
}

- (void)setIndexInCollection:(id)a3
{
  const __CFString *v5;

  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("track-number");
  else
    v5 = CFSTR("trackNumber");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, v5);
}

- (void)setItemIdentifier:(unint64_t)a3
{
  uint64_t v4;
  const __CFString *v5;

  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", a3);
  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("item-id");
  else
    v5 = CFSTR("itemId");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, v5);
}

- (void)setKind:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("kind"));
}

- (void)setLaunchExtrasUrl:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(a3, "absoluteString"), CFSTR("launch-extras-url"));
}

- (void)setLaunchProhibited:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("launchProhibited"));
}

- (void)setLongDescription:(id)a3
{
  const __CFString *v5;

  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("long-description");
  else
    v5 = CFSTR("longDescription");
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, v5);
}

- (void)setMessagesArtworkURL:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(a3, "absoluteString"), CFSTR("messagesIconUrl"));
}

- (void)setNetworkName:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("network-name"));
}

- (void)setNumberOfCollectionsInCollectionGroup:(id)a3
{
  const __CFString *v5;

  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("disc-count");
  else
    v5 = CFSTR("discCount");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, v5);
}

- (void)setNumberOfItemsInCollection:(id)a3
{
  const __CFString *v5;

  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("track-count");
  else
    v5 = CFSTR("trackCount");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, v5);
}

- (void)setPodcastEpisodeGUID:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("episode-guid"));
}

- (void)setPodcastFeedURL:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(a3, "absoluteString"), CFSTR("podcast-feed-url"));
}

- (void)setPodcastType:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("podcast-type"));
}

- (void)setPurchaseDate:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("purchaseDate"));
}

- (void)setReleaseDate:(id)a3
{
  const __CFString *v5;

  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("release-date");
  else
    v5 = CFSTR("releaseDate");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, v5);
}

- (void)setReleaseYear:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("year"));
}

- (void)setRental:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("isRental"));
}

- (void)setRentalID:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("rental-id"));
}

- (void)setSagaIdentifier:(unint64_t)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", a3), CFSTR("cloud-id"));
}

- (void)setSample:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("isSample"));
}

- (void)setMusicShow:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("is-apple-music-show"));
}

- (void)setSeasonNumber:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("season-number"));
}

- (void)setSharedResource:(BOOL)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("isSharedResource"));
}

- (void)setSeriesName:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("show-name"));
}

- (void)setLongSeasonDescription:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("longSeasonDescription"));
}

- (void)setShortDescription:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("description"));
}

- (void)setSortArtistName:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("sort-artist"));
}

- (void)setSortCollectionName:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("sort-album"));
}

- (void)setSortTitle:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("sort-name"));
}

- (void)setThumbnailNewsstandBindingEdge:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("thumbnail-newsstand-binding-edge"));
}

- (void)setThumbnailNewsstandBindingType:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("thumbnail-newsstand-binding-type"));
}

- (void)setThumbnailImageURL:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(a3, "absoluteString"), CFSTR("thumbnail-url"));
}

- (void)setTitle:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("title"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("unmodified-title"));
}

- (void)setTransactionIdentifier:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("download-id"));
}

- (void)setTvTemplate:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("isTvTemplateApp"));
}

- (void)setVariantIdentifier:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("variantId"));
}

- (void)setVideoDetailsDictionary:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("videoDetails"));
}

- (void)setViewStoreItemURL:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(a3, "absoluteString"), CFSTR("url"));
}

- (void)setDownloadPolicy:(id)a3
{
  uint64_t v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v19 = 0;
    v4 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v19);
    if (v4)
    {
      -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("downloadPolicy"));
    }
    else
    {
      v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v5)
        v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = objc_msgSend(v5, "shouldLog");
      if (objc_msgSend(v5, "shouldLogToDisk"))
        v7 = v6 | 2;
      else
        v7 = v6;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v7 &= 2u;
      if (v7)
      {
        v8 = objc_opt_class();
        v20 = 138543618;
        v21 = v8;
        v22 = 2114;
        v23 = v19;
        LODWORD(v18) = 22;
        v9 = _os_log_send_and_compose_impl();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v20, v18);
          free(v10);
          SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
        }
      }
    }
  }
}

- (NSString)shortDescription
{
  NSString *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("description"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSString)sortArtistName
{
  NSString *v3;

  v3 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("sort-artist"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return -[SSDownloadMetadata subtitle](self, "subtitle");
}

- (NSString)sortCollectionName
{
  NSString *v3;

  v3 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("sort-album"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return (NSString *)-[SSDownloadMetadata collectionName](self, "collectionName");
}

- (NSString)sortTitle
{
  NSString *v3;

  v3 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("sort-name"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return -[SSDownloadMetadata title](self, "title");
}

- (SSItemImageCollection)thumbnailImageCollection
{
  id v3;
  SSItemImageCollection *v4;
  id v5;
  id v6;
  char isKindOfClass;

  v3 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("thumbnail-url"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v4 = -[SSDownloadMetadata _newImageCollectionWithURLString:](self, "_newImageCollectionWithURLString:", v3)) == 0)
  {
    v5 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("artwork-urls"), 0);
    if (!v5
      || (v4 = -[SSItemImageCollection initWithImageCollection:]([SSItemImageCollection alloc], "initWithImageCollection:", v5)) == 0)
    {
      v6 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("softwareIcon57x57URL"), CFSTR("icon-url"), 0);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v4 = 0;
      if ((isKindOfClass & 1) != 0)
        v4 = -[SSDownloadMetadata _newImageCollectionWithURLString:](self, "_newImageCollectionWithURLString:", v6);
    }
  }
  return v4;
}

- (NSString)thumbnailNewsstandBindingEdge
{
  NSString *v3;

  v3 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("thumbnail-newsstand-binding-edge"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return (NSString *)objc_msgSend(-[SSDownloadMetadata _thumbnailArtworkImage](self, "_thumbnailArtworkImage"), "valueForProperty:", CFSTR("UINewsstandBindingEdge"));
}

- (NSString)thumbnailNewsstandBindingType
{
  NSString *v3;

  v3 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("thumbnail-newsstand-binding-type"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return (NSString *)objc_msgSend(-[SSDownloadMetadata _thumbnailArtworkImage](self, "_thumbnailArtworkImage"), "valueForProperty:", CFSTR("UINewsstandBindingType"));
}

- (NSURL)thumbnailImageURL
{
  return (NSURL *)objc_msgSend(-[SSDownloadMetadata _thumbnailArtworkImage](self, "_thumbnailArtworkImage"), "URL");
}

- (NSString)title
{
  NSString *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("unmodified-title"), CFSTR("title"), CFSTR("itemName"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSString)transactionIdentifier
{
  NSString *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("download-id"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)variantIdentifier
{
  id v2;

  v2 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("variantId"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)videoDetailsDictionary
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("videoDetails"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)viewStoreItemURL
{
  return -[SSDownloadMetadata _urlValueForValue:](self, "_urlValueForValue:", -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("url"), 0));
}

- (id)showComposer
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("show-composer"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (BOOL)isMusicShow
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("is-apple-music-show"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (id)workName
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("work"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)movementName
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("movement"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)movementNumber
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("movement-number"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)movementCount
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("movement-count"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSData)appReceiptData
{
  NSData *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("app-receipt"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSURL)cancelDownloadURL
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("cancel-download-url"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  else
    return 0;
}

- (NSString)copyright
{
  NSString *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("copyright"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)copyWritableMetadata
{
  uint64_t v3;
  void *v4;
  uint64_t i;
  __CFString *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  v3 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("metadata")), "mutableCopy");
  if (v3)
  {
    v4 = (void *)v3;
    for (i = 0; i != 4; ++i)
    {
      v6 = off_1E47B96E0[i];
      v7 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", v6);
      if (v7)
        objc_msgSend(v4, "setObject:forKey:", v7, v6);
    }
    v8 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("asset-info")), "mutableCopy");
    if (!v8)
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = (id)objc_msgSend(v8, "allKeys");
    if (!objc_msgSend(v9, "count"))
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("file-size"), CFSTR("flavor"), 0);
    v10 = -[SSDownloadMetadata _assetDictionary](self, "_assetDictionary");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j);
          v16 = objc_msgSend(v10, "objectForKey:", v15);
          if (v16)
            objc_msgSend(v8, "setObject:forKey:", v16, v15);
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("asset-info"));

  }
  else
  {
    v4 = (void *)-[NSMutableDictionary mutableCopy](self->_dictionary, "mutableCopy");
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v4;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)self->_dictionary;
}

- (NSNumber)downloaderAccountIdentifier
{
  id v2;
  NSNumber *v3;
  void *v4;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("com.apple.iTunesStore.downloadInfo"), 0);
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("accountInfo"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (NSNumber *)objc_msgSend(v4, "objectForKey:", CFSTR("DownloaderID"));
    else
      v3 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (NSString)downloadKey
{
  NSString *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("downloadKey"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSData)epubRightsData
{
  NSData *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("epr"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSString)fileExtension
{
  NSString *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("fileExtension"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (int64_t)keyStyle
{
  int64_t keyStyle;

  -[NSLock lock](self->_lock, "lock");
  keyStyle = self->_keyStyle;
  -[NSLock unlock](self->_lock, "unlock");
  return keyStyle;
}

- (BOOL)isAutomaticDownload
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("is-auto-download"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isContentRestricted
{
  id v3;
  int v4;
  NSString *v5;
  const char *v6;

  v3 = -[SSDownloadMetadata contentRating](self, "contentRating");
  if (v3)
  {
    LOBYTE(v4) = objc_msgSend(v3, "isRestricted");
  }
  else
  {
    v4 = -[SSDownloadMetadata isExplicitContent](self, "isExplicitContent");
    if (v4)
    {
      v5 = -[SSDownloadMetadata kind](self, "kind");
      if (SSDownloadKindIsEBookKind(v5, v6))
        LOBYTE(v4) = SSRestrictionsShouldRestrictEroticBooks();
      else
        LOBYTE(v4) = SSRestrictionsShouldRestrictExplicitContent();
    }
  }
  return v4;
}

- (BOOL)isRedownloadDownload
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("is-redownload"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isSoftwareKind
{
  return SSDownloadKindIsSoftwareKind(-[SSDownloadMetadata kind](self, "kind"));
}

- (BOOL)isVideosKind
{
  return SSDownloadKindIsVideosAppKind(-[SSDownloadMetadata kind](self, "kind"));
}

- (NSArray)MD5HashStrings
{
  id v3;
  uint64_t v4;
  id v5;
  NSArray *v6;

  v3 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("chunks"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "objectForKey:", CFSTR("chunks"));
  }
  else
  {
    v5 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("md5"), 0);
    objc_opt_class();
    v6 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
  }
  v6 = (NSArray *)v4;
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v6;
  else
    return 0;
}

- (id)newDownloadProperties
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  SSAccount *v15;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  char *v40;
  const __CFString *v41;
  uint64_t v42;
  char *v43;
  const __CFString *v44;
  uint64_t v45;
  char *v46;
  const __CFString *v47;
  uint64_t v48;
  char *v49;
  const __CFString *v50;
  uint64_t v51;
  char *v52;
  const __CFString *v53;
  uint64_t v54;
  char *v55;
  const __CFString *v56;
  uint64_t v57;
  char *v58;
  const __CFString *v59;
  uint64_t v60;
  char *v61;
  const __CFString *v62;
  uint64_t v63;
  char *v64;
  const __CFString *v65;
  uint64_t v66;
  char *v67;
  const __CFString *v68;
  uint64_t v69;
  char *v70;
  const __CFString *v71;
  uint64_t v72;
  char *v73;
  const __CFString *v74;
  uint64_t v75;
  char *v76;
  const __CFString *v77;
  uint64_t v78;
  char *v79;
  const __CFString *v80;
  uint64_t v81;
  char *v82;
  const __CFString *v83;
  uint64_t v84;
  char *v85;
  const __CFString *v86;
  uint64_t v87;
  char *v88;
  const __CFString *v89;
  uint64_t v90;
  char *v91;
  const __CFString *v92;
  uint64_t v93;
  char *v94;
  const __CFString *v95;
  uint64_t v96;
  char *v97;
  const __CFString *v98;
  uint64_t v99;
  char *v100;
  const __CFString *v101;
  uint64_t v102;
  char *v103;
  const __CFString *v104;
  uint64_t v105;
  char *v106;
  const __CFString *v107;
  uint64_t (*v108)();
  char *v109;
  const __CFString *v110;
  uint64_t v111;
  char *v112;
  const __CFString *v113;
  uint64_t v114;
  char *v115;
  const __CFString *v116;
  uint64_t (*v117)();
  char *v118;
  const __CFString *v119;
  uint64_t v120;
  char *v121;
  const __CFString *v122;
  uint64_t (*v123)(void *);
  char *v124;
  const __CFString *v125;
  uint64_t v126;
  char *v127;
  const __CFString *v128;
  uint64_t v129;
  char *v130;
  const __CFString *v131;
  uint64_t v132;
  char *v133;
  const __CFString *v134;
  uint64_t v135;
  char *v136;
  const __CFString *v137;
  uint64_t (*v138)(void *);
  char *v139;
  const __CFString *v140;
  uint64_t v141;
  char *v142;
  const __CFString *v143;
  uint64_t v144;
  char *v145;
  const __CFString *v146;
  uint64_t v147;
  char *v148;
  const __CFString *v149;
  uint64_t (*v150)();
  char *v151;
  const __CFString *v152;
  uint64_t (*v153)();
  char *v154;
  const __CFString *v155;
  uint64_t v156;
  char *v157;
  const __CFString *v158;
  uint64_t v159;
  char *v160;
  const __CFString *v161;
  uint64_t v162;
  char *v163;
  const __CFString *v164;
  uint64_t (*v165)();
  char *v166;
  const __CFString *v167;
  uint64_t v168;
  uint64_t v169;

  v169 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = 0;
  v40 = sel_artistName;
  v41 = CFSTR("d");
  v42 = 0;
  v43 = sel_betaExternalVersionIdentifier;
  v44 = CFSTR("27");
  v45 = 0;
  v46 = sel_bundleIdentifier;
  v47 = CFSTR("c");
  v48 = 0;
  v49 = sel_cloudIdentifier;
  v50 = CFSTR("Y");
  v51 = 0;
  v52 = sel_collectionArtistName;
  v53 = CFSTR("e");
  v54 = 0;
  v55 = sel_downloadPermalink;
  v56 = CFSTR("p0");
  v57 = 0;
  v58 = sel_numberOfCollectionsInCollectionGroup;
  v59 = CFSTR("o");
  v60 = 0;
  v61 = sel_numberOfItemsInCollection;
  v62 = CFSTR("p");
  v63 = 0;
  v64 = sel_collectionName;
  v65 = CFSTR("f");
  v66 = 0;
  v67 = sel_composerName;
  v68 = CFSTR("g");
  v69 = 0;
  v70 = sel_documentTargetIdentifier;
  v71 = CFSTR("E");
  v72 = 0;
  v73 = sel_downloadKey;
  v74 = CFSTR("F");
  v75 = 0;
  v76 = sel_durationInMilliseconds;
  v77 = CFSTR("h");
  v78 = 0;
  v79 = sel_enableExtensions;
  v80 = CFSTR("EE");
  v81 = 0;
  v82 = sel_episodeIdentifier;
  v83 = CFSTR("u");
  v84 = 0;
  v85 = sel_episodeSortIdentifier;
  v86 = CFSTR("v");
  v87 = 0;
  v88 = sel_genre;
  v89 = CFSTR("i");
  v90 = 0;
  v91 = sel_indexInCollection;
  v92 = CFSTR("j");
  v93 = 0;
  v94 = sel_collectionIndexInCollectionGroup;
  v95 = CFSTR("k");
  v96 = 0;
  v97 = sel_kind;
  v98 = CFSTR("1");
  v99 = 0;
  v100 = sel_longDescription;
  v101 = CFSTR("n");
  v102 = 0;
  v103 = sel_longSeasonDescription;
  v104 = CFSTR("w");
  v105 = 0;
  v106 = sel_messagesArtworkURL;
  v107 = CFSTR("MA");
  v108 = __StringValueForURL;
  v109 = sel_pageProgressionDirection;
  v110 = CFSTR("13");
  v111 = 0;
  v112 = sel_podcastEpisodeGUID;
  v113 = CFSTR("A");
  v114 = 0;
  v115 = sel_podcastFeedURL;
  v116 = CFSTR("B");
  v117 = __StringValueForURL;
  v118 = sel_podcastType;
  v119 = CFSTR("C");
  v121 = sel_releaseDate;
  v122 = CFSTR("q");
  v124 = sel_releaseYear;
  v120 = 0;
  v125 = CFSTR("r");
  v127 = sel_seasonNumber;
  v128 = CFSTR("y");
  v130 = sel_seriesName;
  v131 = CFSTR("z");
  v133 = sel_shortDescription;
  v134 = CFSTR("s");
  v136 = sel_purchaseDate;
  v137 = CFSTR("8");
  v123 = __AbsoluteTimeForDate;
  v126 = 0;
  v129 = 0;
  v132 = 0;
  v135 = 0;
  v138 = __AbsoluteTimeForDate;
  v139 = sel_publicationVersion;
  v140 = CFSTR("p2");
  v141 = 0;
  v142 = sel_transactionIdentifier;
  v143 = CFSTR("9");
  v144 = 0;
  v145 = sel_title;
  v146 = CFSTR("2");
  v147 = 0;
  v148 = sel_cancelDownloadURL;
  v149 = CFSTR("P");
  v150 = __StringValueForURL;
  v151 = sel_thumbnailImageURL;
  v152 = CFSTR("G");
  v153 = __StringValueForURL;
  v154 = sel_redownloadActionParameters;
  v155 = CFSTR("04");
  v156 = 0;
  v157 = sel_thumbnailNewsstandBindingEdge;
  v158 = CFSTR("05");
  v159 = 0;
  v160 = sel_thumbnailNewsstandBindingType;
  v161 = CFSTR("06");
  v162 = 0;
  v163 = sel_viewStoreItemURL;
  v164 = CFSTR("11");
  v165 = __StringValueForURL;
  v166 = sel_variantIdentifier;
  v167 = CFSTR("26");
  v168 = 0;
  do
  {
    v5 = -[SSDownloadMetadata performSelector:](self, "performSelector:", (&v40)[v4]);
    v6 = v5;
    v7 = *(uint64_t (**)(uint64_t))((char *)&v42 + v4 * 8);
    if (v7)
      v6 = v7(v5);
    if (v6)
      objc_msgSend(v3, "setObject:forKey:", v6, (&v40)[v4 + 1]);
    v4 += 3;
  }
  while (v4 != 129);
  v8 = 0;
  v20 = CFSTR("artwork-template-name");
  v21 = CFSTR("L");
  v22 = CFSTR("bundleVersion");
  v23 = CFSTR("20");
  v24 = CFSTR("cancelIfDuplicate");
  v25 = CFSTR("10");
  v26 = CFSTR("is-in-queue");
  v27 = CFSTR("03");
  v28 = CFSTR("is-purchased-redownload");
  v29 = CFSTR("21");
  v30 = CFSTR("storeCohort");
  v31 = CFSTR("22");
  v32 = CFSTR("softwareVersionExternalIdentifier");
  v33 = CFSTR("R");
  v34 = CFSTR("software-type");
  v35 = CFSTR("N");
  v36 = CFSTR("s");
  v37 = CFSTR("T");
  v38 = CFSTR("xid");
  v39 = CFSTR("X");
  do
  {
    v9 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", *(const __CFString **)((char *)&v20 + v8), v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
           v36,
           v37,
           v38,
           v39,
           v40,
           v41,
           v42,
           v43,
           v44,
           v45,
           v46,
           v47,
           v48,
           v49,
           v50,
           v51,
           v52,
           v53,
           v54,
           v55,
           v56,
           v57,
           v58,
           v59,
           v60,
           v61,
           v62,
           v63,
           v64,
           v65,
           v66,
           v67,
           v68,
           v69,
           v70,
           v71,
           v72,
           v73,
           v74,
           v75,
           v76,
           v77,
           v78,
           v79);
    if (v9)
      objc_msgSend(v3, "setObject:forKey:", v9, *(const __CFString **)((char *)&v20 + v8 + 8));
    v8 += 16;
  }
  while (v8 != 160);
  v10 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("is-auto-download"));
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v10, "BOOLValue"))
    objc_msgSend(v3, "setObject:forKey:", &unk_1E481E678, CFSTR("D"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata artworkIsPrerendered](self, "artworkIsPrerendered")), CFSTR("b"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata hasMessagesExtension](self, "hasMessagesExtension")), CFSTR("HM"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata isCompilation](self, "isCompilation")), CFSTR("l"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata isDeviceBasedVPP](self, "isDeviceBasedVPP")), CFSTR("vp"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata isExplicitContent](self, "isExplicitContent")), CFSTR("12"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata isHighDefinition](self, "isHighDefinition")), CFSTR("15"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata isRental](self, "isRental")), CFSTR("m"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata isSample](self, "isSample")), CFSTR("t"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata isSharedResource](self, "isSharedResource")), CFSTR("sr"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata isTvTemplate](self, "isTvTemplate")), CFSTR("tt"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata launchProhibited](self, "launchProhibited")), CFSTR("LP"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata isMusicShow](self, "isMusicShow")), CFSTR("ms"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata isHLS](self, "isHLS")), CFSTR("hi"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata isPremium](self, "isPremium")), CFSTR("PR"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSDownloadMetadata hasHDR](self, "hasHDR")), CFSTR("HR"));
  v11 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("has-4k"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "BOOLValue")), CFSTR("FK"));
  v12 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("has-dolby-vision"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "BOOLValue")), CFSTR("DV"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", -[SSDownloadMetadata artistIdentifier](self, "artistIdentifier")), CFSTR("3"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", -[SSDownloadMetadata collectionIdentifier](self, "collectionIdentifier")), CFSTR("4"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", -[SSDownloadMetadata composerIdentifier](self, "composerIdentifier")), CFSTR("5"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", -[SSDownloadMetadata genreIdentifier](self, "genreIdentifier")), CFSTR("6"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", -[SSDownloadMetadata itemIdentifier](self, "itemIdentifier")), CFSTR("7"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", -[SSDownloadMetadata preOrderIdentifier](self, "preOrderIdentifier")), CFSTR("H"));
  if (-[SSDownloadMetadata rentalID](self, "rentalID"))
    objc_msgSend(v3, "setObject:forKey:", -[SSDownloadMetadata rentalID](self, "rentalID"), CFSTR("ri"));
  if (-[SSDownloadMetadata hlsPlaylistURL](self, "hlsPlaylistURL"))
    objc_msgSend(v3, "setObject:forKey:", -[SSDownloadMetadata hlsPlaylistURL](self, "hlsPlaylistURL"), CFSTR("hl"));
  v13 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = 0;
LABEL_28:
    v17 = 0;
    goto LABEL_29;
  }
  v14 = objc_msgSend(v13, "objectForKey:", CFSTR("accountInfo"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = objc_msgSend(v13, "objectForKey:", CFSTR("preferredAssetFlavor"));
    goto LABEL_28;
  }
  v15 = objc_alloc_init(SSAccount);
  -[SSAccount setLockdownDictionary:](v15, "setLockdownDictionary:", v14);
  v16 = -[SSAccount uniqueIdentifier](v15, "uniqueIdentifier");
  v17 = -[SSAccount accountName](v15, "accountName");

  v18 = objc_msgSend(v13, "objectForKey:", CFSTR("preferredAssetFlavor"));
  if (v16)
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("U"));
LABEL_29:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v17 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("appleId"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("Z"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("09"));
  return v3;
}

- (NSNumber)numberOfBytesToHash
{
  id v2;
  NSNumber *v3;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("chunks"), 0);
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (NSNumber *)objc_msgSend(v2, "objectForKey:", CFSTR("chunkSize"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (NSString)pageProgressionDirection
{
  NSString *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("page-progression-direction"), CFSTR("pageProgressionDirection"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSString)preferredAssetFlavor
{
  id v2;
  void *v3;

  v2 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("preferredAssetFlavor")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    return (NSString *)(id)objc_msgSend(v3, "copy");
  }
  else
  {
    return 0;
  }
}

- (id)publicationVersion
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("publication-version"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (unint64_t)preOrderIdentifier
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("preorder-id"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v2, "itemIdentifierValue");
  else
    return 0;
}

- (NSURL)primaryAssetURL
{
  id v2;

  v2 = -[SSDownloadMetadata _valueForFirstAvailableTopLevelKey:](self, "_valueForFirstAvailableTopLevelKey:", CFSTR("URL"), CFSTR("url"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  else
    return 0;
}

- (NSString)redownloadActionParameters
{
  NSString *v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("buy-params-256"), CFSTR("buyParams"), CFSTR("action-params"), CFSTR("redownload-params"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSString)releaseDateString
{
  NSString *v3;
  id v4;

  v3 = -[SSDownloadMetadata _releaseDateValue](self, "_releaseDateValue");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[SSDownloadMetadata _newDateFormatter](self, "_newDateFormatter");
    v3 = (NSString *)objc_msgSend(v4, "stringFromDate:", v3);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (NSNumber)requestPersistentID
{
  id v2;
  void *v3;

  v2 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("requestPersistentID")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    return (NSNumber *)(id)objc_msgSend(v3, "copy");
  }
  else
  {
    return 0;
  }
}

- (id)requiredDeviceCapabilities
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("UIRequiredDeviceCapabilities"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  return v2;
}

- (void)setAutomaticDownload:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("is-auto-download"));
}

- (void)setCancelDownloadURL:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(a3, "absoluteString"), CFSTR("cancel-download-url"));
}

- (void)setCopyright:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("copyright"));
}

- (void)setDictionary:(id)a3
{
  NSMutableDictionary *dictionary;

  -[NSLock lock](self->_lock, "lock");
  dictionary = self->_dictionary;
  if (dictionary != a3)
  {

    self->_dictionary = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setDownloadKey:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("downloadKey"));
}

- (void)setDownloadPermalink:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("p0"));
}

- (void)setEpubRightsData:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("epr"));
}

- (void)setFileExtension:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("fileExtension"));
}

- (void)setKeyStyle:(int64_t)a3
{
  -[NSLock lock](self->_lock, "lock");
  self->_keyStyle = a3;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setMD5HashStrings:(id)a3 numberOfBytesToHash:(id)a4
{
  uint64_t v7;
  SSDownloadMetadata *v8;
  id v9;
  id v10;

  if (!objc_msgSend(a3, "count"))
  {
    -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", 0, CFSTR("chunks"));
    v8 = self;
    v7 = 0;
    goto LABEL_5;
  }
  if (objc_msgSend(a3, "count") == 1)
  {
    -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", 0, CFSTR("chunks"));
    v7 = objc_msgSend(a3, "objectAtIndex:", 0);
    v8 = self;
LABEL_5:
    -[SSDownloadMetadata setValue:forMetadataKey:](v8, "setValue:forMetadataKey:", v7, CFSTR("md5"));
    return;
  }
  v9 = (id)objc_msgSend(-[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("chunks"), 0), "mutableCopy");
  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  objc_msgSend(v9, "setObject:forKey:", a3, CFSTR("chunks"));
  objc_msgSend(v10, "setObject:forKey:", a4, CFSTR("chunkSize"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v10, CFSTR("chunks"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", 0, CFSTR("md5"));

}

- (void)setPageProgressionDirection:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("page-progression-direction"));
}

- (void)setPublicationVersion:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("publication-version"));
}

- (void)setPreferredAssetFlavor:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
  else
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v7 = v6;
  if (a3)
    objc_msgSend(v6, "setObject:forKey:", a3, CFSTR("preferredAssetFlavor"));
  else
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("preferredAssetFlavor"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v7, CFSTR("com.apple.iTunesStore.downloadInfo"));

}

- (void)setPreOrderIdentifier:(unint64_t)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithItemIdentifier:", a3), CFSTR("preorder-id"));
}

- (void)setPrimaryAssetURL:(id)a3
{
  -[SSDownloadMetadata _setValue:forTopLevelKey:](self, "_setValue:forTopLevelKey:", objc_msgSend(a3, "absoluteString"), CFSTR("URL"));
}

- (void)setRedownloadActionParameters:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("buy-params-256"));
}

- (void)setRedownloadDownload:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("is-redownload"));
}

- (void)setReleaseDateString:(id)a3
{
  const __CFString *v5;

  if (-[SSDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v5 = CFSTR("release-date");
  else
    v5 = CFSTR("releaseDate");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, v5);
}

- (void)setRequestPersistentID:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = -[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
  else
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v7 = v6;
  if (a3)
    objc_msgSend(v6, "setObject:forKey:", a3, CFSTR("requestPersistentID"));
  else
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("requestPersistentID"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v7, CFSTR("com.apple.iTunesStore.downloadInfo"));

}

- (void)setRequiredDeviceCapabilities:(id)a3
{
  -[SSDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("UIRequiredDeviceCapabilities"));
}

- (void)setShouldDownloadAutomatically:(BOOL)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("auto-download"));
}

- (void)setSinfs:(id)a3
{
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("sinfs"));
}

- (void)setTransitMapDataURL:(id)a3
{
  -[SSDownloadMetadata _setValue:forTopLevelKey:](self, "_setValue:forTopLevelKey:", objc_msgSend(a3, "absoluteString"), CFSTR("transitGeoFileURL"));
}

- (void)setValue:(id)a3 forMetadataKey:(id)a4
{
  NSMutableDictionary *dictionary;
  uint64_t v8;
  NSMutableDictionary *v9;

  -[NSLock lock](self->_lock, "lock");
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_dictionary = dictionary;
  }
  v8 = -[NSMutableDictionary objectForKey:](dictionary, "objectForKey:", CFSTR("metadata"));
  if (v8)
  {
    v9 = (NSMutableDictionary *)v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend((id)-[NSMutableDictionary classForCoder](v9, "classForCoder"), "isEqual:", objc_opt_class()) & 1) == 0)
    {
      v9 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v9, "mutableCopy");
      -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", v9, CFSTR("metadata"));

    }
  }
  else
  {
    v9 = self->_dictionary;
  }
  if (a3)
  {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a3, a4);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", a4);
    -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", a4);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setValuesFromDownload:(id)a3
{
  uint64_t (**v4)(_QWORD);
  uint64_t i;
  uint64_t v6;
  _BYTE v7[344];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[77];
  _QWORD v42[86];

  v42[85] = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(_QWORD))v42;
  v41[76] = sel_setArtistName_;
  v42[0] = 0;
  v42[1] = sel_setBetaExternalVersionIdentifier_;
  v42[2] = 0;
  v42[3] = sel_setBundleIdentifier_;
  v42[4] = 0;
  v42[5] = sel_setDownloadPermalink_;
  v42[6] = 0;
  v42[7] = sel_setCancelDownloadURL_;
  v42[8] = __URLValueForString;
  v42[9] = sel_setCloudIdentifier_;
  v42[10] = 0;
  v42[11] = sel_setCollectionArtistName_;
  v42[12] = 0;
  v42[13] = sel_setCollectionIndexInCollectionGroup_;
  v42[14] = 0;
  v42[15] = sel_setCollectionName_;
  v42[16] = 0;
  v42[17] = sel_setComposerName_;
  v42[18] = 0;
  v42[19] = sel_setDocumentTargetIdentifier_;
  v42[20] = 0;
  v42[21] = sel_setDownloadKey_;
  v42[22] = 0;
  v42[23] = sel_setDurationInMilliseconds_;
  v42[24] = 0;
  v42[25] = sel_setEnableExtensions_;
  v42[26] = 0;
  v42[27] = sel_setEpisodeIdentifier_;
  v42[28] = 0;
  v42[29] = sel_setEpisodeSortIdentifier_;
  v42[30] = 0;
  v42[31] = sel_setGenre_;
  v42[32] = 0;
  v42[33] = sel_setIndexInCollection_;
  v42[34] = 0;
  v42[35] = sel_setKind_;
  v42[36] = 0;
  v42[37] = sel_setLongDescription_;
  v42[38] = 0;
  v42[39] = sel_setLongSeasonDescription_;
  v42[40] = 0;
  v42[41] = sel_setMessagesArtworkURL_;
  v42[42] = __URLValueForString;
  v42[43] = sel_setNumberOfCollectionsInCollectionGroup_;
  v42[44] = 0;
  v42[45] = sel_setNumberOfItemsInCollection_;
  v42[46] = 0;
  v42[47] = sel_setPageProgressionDirection_;
  v42[48] = 0;
  v42[49] = sel_setPodcastEpisodeGUID_;
  v42[50] = 0;
  v42[51] = sel_setPodcastFeedURL_;
  v42[52] = __URLValueForString;
  v42[53] = sel_setPodcastType_;
  v42[54] = 0;
  v42[55] = sel_setPurchaseDate_;
  v42[56] = __DateValueForAbsoluteTime;
  v42[57] = sel_setReleaseDate_;
  v42[58] = __DateValueForAbsoluteTime;
  v42[59] = sel_setReleaseYear_;
  v42[60] = 0;
  v42[61] = sel_setSeasonNumber_;
  v42[62] = 0;
  v42[63] = sel_setSeriesName_;
  v42[64] = 0;
  v42[65] = sel_setShortDescription_;
  v42[66] = 0;
  v42[67] = sel_setThumbnailImageURL_;
  v42[68] = __URLValueForString;
  v42[69] = sel_setTitle_;
  v42[70] = 0;
  v42[71] = sel_setTransactionIdentifier_;
  v42[72] = 0;
  v42[73] = sel_setPublicationVersion_;
  v42[74] = 0;
  v42[75] = sel_setRedownloadActionParameters_;
  v42[76] = 0;
  v42[77] = sel_setThumbnailNewsstandBindingEdge_;
  v42[78] = 0;
  v42[79] = sel_setThumbnailNewsstandBindingType_;
  v42[80] = 0;
  v42[81] = sel_setViewStoreItemURL_;
  v42[82] = __URLValueForString;
  v42[83] = sel_setVariantIdentifier_;
  v42[84] = 0;
  v41[0] = CFSTR("d");
  v41[1] = CFSTR("27");
  v41[2] = CFSTR("c");
  v41[3] = CFSTR("p0");
  v41[4] = CFSTR("P");
  v41[5] = CFSTR("Y");
  v41[6] = CFSTR("e");
  v41[7] = CFSTR("k");
  v41[8] = CFSTR("f");
  v41[9] = CFSTR("g");
  v41[10] = CFSTR("E");
  v41[11] = CFSTR("F");
  v41[12] = CFSTR("h");
  v41[13] = CFSTR("EE");
  v41[14] = CFSTR("u");
  v41[15] = CFSTR("v");
  v41[16] = CFSTR("i");
  v41[17] = CFSTR("j");
  v41[18] = CFSTR("1");
  v41[19] = CFSTR("n");
  v41[20] = CFSTR("w");
  v41[21] = CFSTR("MA");
  v41[22] = CFSTR("o");
  v41[23] = CFSTR("p");
  v41[24] = CFSTR("13");
  v41[25] = CFSTR("A");
  v41[26] = CFSTR("B");
  v41[27] = CFSTR("C");
  v41[28] = CFSTR("8");
  v41[29] = CFSTR("q");
  v41[30] = CFSTR("r");
  v41[31] = CFSTR("y");
  v41[32] = CFSTR("z");
  v41[33] = CFSTR("s");
  v41[34] = CFSTR("G");
  v41[35] = CFSTR("2");
  v41[36] = CFSTR("9");
  v41[37] = CFSTR("p2");
  v41[38] = CFSTR("04");
  v41[39] = CFSTR("05");
  v41[40] = CFSTR("06");
  v41[41] = CFSTR("11");
  v41[42] = CFSTR("26");
  v41[43] = CFSTR("3");
  v41[44] = CFSTR("4");
  v41[45] = CFSTR("5");
  v41[46] = CFSTR("6");
  v41[47] = CFSTR("7");
  v41[48] = CFSTR("H");
  v41[49] = CFSTR("b");
  v41[50] = CFSTR("D");
  v41[51] = CFSTR("HM");
  v41[52] = CFSTR("l");
  v41[53] = CFSTR("vp");
  v41[54] = CFSTR("12");
  v41[55] = CFSTR("m");
  v41[56] = CFSTR("t");
  v41[57] = CFSTR("sr");
  v41[58] = CFSTR("tt");
  v41[59] = CFSTR("LP");
  v41[60] = CFSTR("N");
  v41[61] = CFSTR("R");
  v41[62] = CFSTR("T");
  v41[63] = CFSTR("X");
  v41[64] = CFSTR("L");
  v41[65] = CFSTR("03");
  v41[66] = CFSTR("22");
  v41[67] = CFSTR("09");
  v41[68] = CFSTR("15");
  v41[69] = CFSTR("10");
  v41[70] = CFSTR("ri");
  v41[71] = CFSTR("hl");
  v41[72] = CFSTR("PR");
  v41[73] = CFSTR("has-hdr");
  v41[74] = CFSTR("has-dolby-vision");
  v41[75] = CFSTR("has-4k");
  objc_msgSend(a3, "getValues:forProperties:count:", v7, v41, 76);
  for (i = 0; i != 344; i += 8)
  {
    v6 = *(_QWORD *)&v7[i];
    if (v6)
    {
      if (*v4)
      {
        v6 = (*v4)(*(_QWORD *)&v7[i]);
        *(_QWORD *)&v7[i] = v6;
      }
      -[SSDownloadMetadata performSelector:withObject:](self, "performSelector:withObject:", *(v4 - 1), v6);
    }
    v4 += 2;
  }
  -[SSDownloadMetadata setArtistIdentifier:](self, "setArtistIdentifier:", SSGetItemIdentifierFromValue(v8));
  -[SSDownloadMetadata setCollectionIdentifier:](self, "setCollectionIdentifier:", SSGetItemIdentifierFromValue(v9));
  -[SSDownloadMetadata setComposerIdentifier:](self, "setComposerIdentifier:", SSGetItemIdentifierFromValue(v10));
  -[SSDownloadMetadata setGenreIdentifier:](self, "setGenreIdentifier:", SSGetItemIdentifierFromValue(v11));
  -[SSDownloadMetadata setItemIdentifier:](self, "setItemIdentifier:", SSGetItemIdentifierFromValue(v12));
  -[SSDownloadMetadata setPreOrderIdentifier:](self, "setPreOrderIdentifier:", SSGetItemIdentifierFromValue(v13));
  -[SSDownloadMetadata setArtworkIsPrerendered:](self, "setArtworkIsPrerendered:", objc_msgSend(v14, "BOOLValue"));
  -[SSDownloadMetadata setAutomaticDownload:](self, "setAutomaticDownload:", objc_msgSend(v15, "BOOLValue"));
  -[SSDownloadMetadata setHasMessagesExtension:](self, "setHasMessagesExtension:", objc_msgSend(v16, "BOOLValue"));
  -[SSDownloadMetadata setCompilation:](self, "setCompilation:", objc_msgSend(v17, "BOOLValue"));
  -[SSDownloadMetadata setDeviceBasedVPP:](self, "setDeviceBasedVPP:", objc_msgSend(v18, "BOOLValue"));
  -[SSDownloadMetadata setExplicitContent:](self, "setExplicitContent:", objc_msgSend(v19, "BOOLValue"));
  -[SSDownloadMetadata setRental:](self, "setRental:", objc_msgSend(v20, "BOOLValue"));
  -[SSDownloadMetadata setSample:](self, "setSample:", objc_msgSend(v21, "BOOLValue"));
  -[SSDownloadMetadata setSharedResource:](self, "setSharedResource:", objc_msgSend(v22, "BOOLValue"));
  -[SSDownloadMetadata setTvTemplate:](self, "setTvTemplate:", objc_msgSend(v23, "BOOLValue"));
  -[SSDownloadMetadata setLaunchProhibited:](self, "setLaunchProhibited:", objc_msgSend(v24, "BOOLValue"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v25, CFSTR("software-type"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v26, CFSTR("softwareVersionExternalIdentifier"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v27, CFSTR("s"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v28, CFSTR("xid"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v29, CFSTR("artwork-template-name"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v30, CFSTR("is-in-queue"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v31, CFSTR("storeCohort"));
  -[SSDownloadMetadata setPreferredAssetFlavor:](self, "setPreferredAssetFlavor:", v32);
  -[SSDownloadMetadata setHighDefinition:](self, "setHighDefinition:", objc_msgSend(v33, "BOOLValue"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v34, CFSTR("cancelIfDuplicate"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v35, CFSTR("ri"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v36, CFSTR("hl"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v37, CFSTR("PR"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v38, CFSTR("HR"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v39, CFSTR("DV"));
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v40, CFSTR("FK"));
}

- (BOOL)shouldDownloadAutomatically
{
  id v2;

  v2 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("auto-download"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (NSArray)sinfs
{
  NSArray *v3;
  void *v4;

  v3 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("sinfs"), 0);
  if (SSDownloadKindIsSoftwareKind(-[SSDownloadMetadata kind](self, "kind")))
  {
    -[NSLock lock](self->_lock, "lock");
    v4 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("thinned-app"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (NSArray *)objc_msgSend(v4, "valueForKey:", CFSTR("sinfs"));
    -[NSLock unlock](self->_lock, "unlock");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (NSURL)transitMapDataURL
{
  id v2;

  v2 = -[SSDownloadMetadata _valueForFirstAvailableTopLevelKey:](self, "_valueForFirstAvailableTopLevelKey:", CFSTR("transitGeoFileURL"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  else
    return 0;
}

- (id)valueForFirstAvailableKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id *v9;
  BOOL v10;
  id *v12;
  uint64_t v13;

  -[NSLock lock](self->_lock, "lock");
  v5 = -[SSDownloadMetadata _assetDictionary](self, "_assetDictionary");
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("metadata"));
  if (!v6)
    v6 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("metadata"));
  v12 = (id *)&v13;
  if (a3)
  {
    do
    {
      v7 = (void *)objc_msgSend(v5, "objectForKey:", a3);
      if (!v7)
      {
        v7 = (void *)objc_msgSend(v6, "objectForKey:", a3);
        if (!v7)
          v7 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
      }
      v8 = v7;
      v9 = v12++;
      a3 = *v9;
      if (*v9)
        v10 = v7 == 0;
      else
        v10 = 0;
    }
    while (v10);
  }
  else
  {
    v7 = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v7;
}

- (id)valueForMetadataKey:(id)a3
{
  return -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", a3, 0);
}

- (id)_assetDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  const char *v17;
  id v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  const __CFString *v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("metadata"));
  v4 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("kind"));
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("assets"));
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v5 = 0;
  }
  if (!v4)
  {
    v4 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("kind"));
    if (!v4)
    {
      v6 = (void *)objc_msgSend(v5, "firstObject");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (v7 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("metadata")),
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        v4 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("kind"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          v4 = 0;
      }
      else
      {
        v4 = 0;
      }
    }
  }
  v8 = (id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("thinned-app"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (SSDownloadKindIsSoftwareKind(v4) & 1) == 0)
  {
    v9 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("hls-playlist-url"));
    v10 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("has-hdr"));
    v11 = SSDeviceSupportsHDRDownload();
    v12 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("is-premium"));
    if (v11 && (objc_msgSend(v10, "BOOLValue") & 1) != 0)
      v13 = 1;
    else
      v13 = objc_msgSend(v12, "BOOLValue");
    if (SSDownloadKindIsVideosAppKind(v4))
    {
      v9 = objc_msgSend((id)objc_opt_class(), "_addPlaybackTypeToHLSPlaylistURLString:", v9);
      v13 = 1;
    }
    if (!objc_msgSend(v5, "count"))
    {
      v19 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("asset-info"));
      v8 = 0;
LABEL_57:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & v13) == 1 && SSDownloadKindIsVideoKind(v4))
      {
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
        objc_msgSend(v32, "setObject:forKey:", v9, CFSTR("URL"));
        objc_msgSend(v32, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("is-hls"));
        objc_msgSend(v32, "setObject:forKey:", CFSTR("movpkg"), CFSTR("fileExtension"));
        if (v8 || (v8 = (id)v19) != 0)
        {
          v33 = objc_msgSend(v8, "objectForKey:", CFSTR("file-size"));
          if (v33)
          {
            v40 = CFSTR("file-size");
            v41 = v33;
            objc_msgSend(v32, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1), CFSTR("asset-info"));
          }
        }
        v8 = (id)objc_msgSend(v32, "copy");

      }
      return v8;
    }
    v35 = v13;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
    if (!v15)
      v15 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "objectForKey:", CFSTR("preferredAssetFlavor"));
      if (objc_msgSend(v16, "length"))
        objc_msgSend(v14, "addObject:", v16);
    }
    if (SSDownloadKindIsVideoKind(v4))
    {
      v18 = +[SSDevice currentDevice](SSDevice, "currentDevice");
      if (objc_msgSend(v18, "supportsDeviceCapability:", 2))
        objc_msgSend(v14, "addObject:", CFSTR("1080p"));
      if (objc_msgSend(v18, "supportsDeviceCapability:", 1))
      {
        objc_msgSend(v14, "addObject:", CFSTR("hdmv"));
        objc_msgSend(v14, "addObject:", CFSTR("720p"));
      }
      objc_msgSend(v14, "addObject:", CFSTR("480p"));
      objc_msgSend(v14, "addObject:", CFSTR("SDMV"));
      objc_msgSend(v14, "addObject:", CFSTR("SD"));
    }
    else if (SSDownloadKindIsEBookKind(v4, v17))
    {
      GSMainScreenScaleFactor();
      if (v20 == 1.0)
        objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("lrpluspub"), CFSTR("lrpub"), 0));
      objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("pluspub"), CFSTR("pub"), 0));
    }
    if (objc_msgSend(v14, "count"))
    {
      v21 = objc_msgSend(v5, "count");
      if (v21 >= 1)
      {
        v22 = v21;
        v23 = 0;
        v8 = 0;
        v24 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          v25 = (void *)objc_msgSend(v5, "objectAtIndex:", v23);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v26 = objc_msgSend(v25, "objectForKey:", CFSTR("flavor"));
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = objc_msgSend(v14, "indexOfObject:", v26);
              if (v27 < v24)
              {
                v8 = v25;
                v24 = v27;
              }
            }
          }
          ++v23;
        }
        while (v22 != v23);
        goto LABEL_56;
      }
    }
    else
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v28 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v37;
LABEL_48:
        v31 = 0;
        while (1)
        {
          if (*(_QWORD *)v37 != v30)
            objc_enumerationMutation(v5);
          v8 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * v31);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_56;
          if (v29 == ++v31)
          {
            v29 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
            v8 = 0;
            if (v29)
              goto LABEL_48;
            goto LABEL_56;
          }
        }
      }
    }
    v8 = 0;
LABEL_56:

    v19 = 0;
    v13 = v35;
    goto LABEL_57;
  }
  return v8;
}

- (id)_dateValueForValue:(id)a3
{
  id v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SSDownloadMetadata _newDateFormatter](self, "_newDateFormatter");
    a3 = (id)objc_msgSend(v5, "dateFromString:", a3);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a3;
  else
    return 0;
}

- (id)_newImageCollectionWithURLString:(id)a3
{
  id result;
  id v5;
  SSItemArtworkImage *v6;
  int v7;
  __CFString **v8;
  id v9;
  id v10;
  SSItemImageCollection *v11;
  SSItemImageCollection *v12;

  result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", a3);
  if (result)
  {
    v5 = result;
    v6 = objc_alloc_init(SSItemArtworkImage);
    -[SSItemArtworkImage setURL:](v6, "setURL:", v5);
    v7 = objc_msgSend(-[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("software-type")), "isEqualToString:", CFSTR("newsstand"));
    v8 = SSItemArtworkKindNewsstandIcon;
    if (!v7)
      v8 = SSItemArtworkKindDownloadQueueThumbnail;
    -[SSItemArtworkImage setImageKind:](v6, "setImageKind:", *v8);
    v9 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("thumbnail-newsstand-binding-edge"), 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SSItemArtworkImage setValue:forProperty:](v6, "setValue:forProperty:", v9, CFSTR("UINewsstandBindingEdge"));
    v10 = -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("thumbnail-newsstand-binding-type"), 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SSItemArtworkImage setValue:forProperty:](v6, "setValue:forProperty:", v10, CFSTR("UINewsstandBindingType"));
    v11 = [SSItemImageCollection alloc];
    v12 = -[SSItemImageCollection initWithItemImages:](v11, "initWithItemImages:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6));

    return v12;
  }
  return result;
}

- (id)_newDateFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
  objc_msgSend(v2, "setLenient:", 1);
  objc_msgSend(v2, "setTimeZone:", objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0));
  return v2;
}

- (id)_releaseDateValue
{
  return -[SSDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("releaseDate"), CFSTR("release-date"), 0);
}

- (void)_setValue:(id)a3 forTopLevelKey:(id)a4
{
  NSMutableDictionary *dictionary;

  -[NSLock lock](self->_lock, "lock");
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_dictionary = dictionary;
    if (a3)
      goto LABEL_3;
LABEL_5:
    -[NSMutableDictionary removeObjectForKey:](dictionary, "removeObjectForKey:", a4);
    goto LABEL_6;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", a3, a4);
LABEL_6:
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_setValueCopy:(id)a3 forMetadataKey:(id)a4
{
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[SSDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v6, a4);

}

- (id)_stringValueForValue:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a3 = (id)objc_msgSend(a3, "stringValue");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a3;
  else
    return 0;
}

- (id)_thumbnailArtworkImage
{
  SSItemImageCollection *v3;
  id v4;
  id result;

  v3 = -[SSDownloadMetadata thumbnailImageCollection](self, "thumbnailImageCollection");
  if (!objc_msgSend(-[SSDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("software-type")), "isEqualToString:", CFSTR("newsstand"))|| (v4 = -[SSItemImageCollection imagesForKind:](v3, "imagesForKind:", CFSTR("newsstand-latest-issue-icon.default"))) == 0)
  {
    v4 = -[SSItemImageCollection imagesForKind:](v3, "imagesForKind:", CFSTR("download-queue-item.default"));
  }
  result = (id)objc_msgSend(v4, "count");
  if (result)
    return (id)objc_msgSend(v4, "lastObject");
  return result;
}

- (id)_urlValueForValue:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a3 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a3;
  else
    return 0;
}

- (id)_valueForFirstAvailableTopLevelKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id *v9;
  BOOL v10;
  id *v12;
  uint64_t v13;

  -[NSLock lock](self->_lock, "lock");
  v5 = -[SSDownloadMetadata _assetDictionary](self, "_assetDictionary");
  v12 = (id *)&v13;
  if (a3)
  {
    v6 = v5;
    do
    {
      v7 = (void *)objc_msgSend(v6, "objectForKey:", a3);
      if (!v7)
        v7 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
      v8 = v7;
      v9 = v12++;
      a3 = *v9;
      if (*v9)
        v10 = v7 == 0;
      else
        v10 = 0;
    }
    while (v10);
  }
  else
  {
    v7 = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v7;
}

+ (id)_addPlaybackTypeToHLSPlaylistURLString:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  if (a3)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", a3);
    v5 = (id)objc_msgSend((id)objc_msgSend(v4, "percentEncodedQueryItems"), "mutableCopy");
    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("playback-type"), CFSTR("download"));
    if (v6)
      objc_msgSend(v5, "addObject:", v6);
    objc_msgSend(v4, "setPercentEncodedQueryItems:", v5);
    v7 = (void *)objc_msgSend((id)objc_msgSend(v4, "URL"), "absoluteString");
    if (v7)
      return v7;
  }
  return v3;
}

@end
