@implementation VUIMediaItem

+ (id)_mediaItemWithMPMediaItem:(id)a3
{
  id v3;
  VUIMPMediaItem *v4;
  void *v5;
  void *v6;
  void *v7;
  VUIMPMediaItem *v8;

  v3 = a3;
  v4 = [VUIMPMediaItem alloc];
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceMediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VUIMediaEntityFetchRequestAllPropertiesSet();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VUIMPMediaItem initWithMediaLibrary:mediaItem:requestedProperties:](v4, "initWithMediaLibrary:mediaItem:requestedProperties:", v6, v3, v7);

  return v8;
}

- (NSNumber)assetType
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("assetType"));
}

- (NSNumber)duration
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("duration"));
}

- (id)creationDate
{
  return -[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("creationDate"));
}

- (id)modifiedDate
{
  return -[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("modifiedDate"));
}

- (id)lastPlayedDate
{
  return -[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("lastPlayedDate"));
}

- (NSString)previewFrameImageIdentifier
{
  return (NSString *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("previewFrameImageIdentifier"));
}

- (NSURL)extrasURL
{
  return (NSURL *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("extrasURL"));
}

- (NSString)seasonTitle
{
  return (NSString *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("seasonTitle"));
}

- (VUIMediaEntityIdentifier)seasonIdentifier
{
  return (VUIMediaEntityIdentifier *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("seasonIdentifier"));
}

- (NSNumber)episodeNumber
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("episodeNumber"));
}

- (NSNumber)fractionalEpisodeNumber
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("fractionalEpisodeNumber"));
}

- (NSNumber)episodeIndexInSeries
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("episodeIndexInSeries"));
}

- (NSString)studio
{
  return (NSString *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("studio"));
}

- (VUIMediaItemCredits)credits
{
  return (VUIMediaItemCredits *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("credits"));
}

- (NSNumber)rentalPlaybackDuration
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("rentalPlaybackDuration"));
}

- (NSDate)rentalExpirationDate
{
  return (NSDate *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("rentalExpirationDate"));
}

- (NSNumber)hasBeenPlayed
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("hasBeenPlayed"));
}

- (NSNumber)playCount
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("playCount"));
}

- (NSNumber)bookmark
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("bookmark"));
}

- (NSDate)downloadExpirationDate
{
  return (NSDate *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("downloadExpirationDate"));
}

- (NSDate)availabilityEndDate
{
  return (NSDate *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("availabilityEndDate"));
}

- (BOOL)allowsManualDownloadRenewal
{
  void *v2;
  BOOL v3;

  -[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("allowsManualDownloadRenewal"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)renewsOfflineKeysAutomatically
{
  void *v2;
  BOOL v3;

  -[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("renewsOfflineKeysAutomatically"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (MPMediaItem)mediaPlayerMediaItem
{
  return 0;
}

- (BOOL)isFamilySharingContent
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if (automaticallyNotifiesObserversForKey____onceToken_0 != -1)
    dispatch_once(&automaticallyNotifiesObserversForKey____onceToken_0, &__block_literal_global_105);
  if ((objc_msgSend((id)automaticallyNotifiesObserversForKey____keysToNotifyManually_0, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VUIMediaItem;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

void __53__VUIMediaItem_automaticallyNotifiesObserversForKey___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("hasBeenPlayed"), CFSTR("playCount"), CFSTR("bookmark"), CFSTR("rentalExpirationDate"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)automaticallyNotifiesObserversForKey____keysToNotifyManually_0;
  automaticallyNotifiesObserversForKey____keysToNotifyManually_0 = v0;

}

+ (id)keyPathsForValuesAffectingPlayedState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  NSStringFromSelector(sel_hasBeenPlayed);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_playCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bookmark);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  objc_super v66;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66.receiver = self;
  v66.super_class = (Class)VUIMediaItem;
  -[VUIMediaEntity description](&v66, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem duration](self, "duration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("duration"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("creationDate"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem modifiedDate](self, "modifiedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("modifiedDate"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem lastPlayedDate](self, "lastPlayedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("lastPlayedDate"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem previewFrameImageIdentifier](self, "previewFrameImageIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("previewFrameImageIdentifier"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem extrasURL](self, "extrasURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("extrasURL"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  v23 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem seasonIdentifier](self, "seasonIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("seasonIdentifier"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v25);

  v26 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem seasonTitle](self, "seasonTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("seasonTitle"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  v29 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem episodeNumber](self, "episodeNumber");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("episodeNumber"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v31);

  v32 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem fractionalEpisodeNumber](self, "fractionalEpisodeNumber");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("fractionalEpisodeNumber"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v34);

  v35 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem episodeIndexInSeries](self, "episodeIndexInSeries");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("episodeIndexInSeries"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v37);

  v38 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem studio](self, "studio");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("studio"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v40);

  v41 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem credits](self, "credits");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("credits"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v43);

  v44 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem rentalPlaybackDuration](self, "rentalPlaybackDuration");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("rentalPlaybackDuration"), v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v46);

  v47 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem rentalExpirationDate](self, "rentalExpirationDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("rentalExpirationDate"), v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v49);

  v50 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem downloadExpirationDate](self, "downloadExpirationDate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("downloadExpirationDate"), v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v52);

  v53 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem hasBeenPlayed](self, "hasBeenPlayed");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("hasBeenPlayed"), v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v55);

  v56 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem playCount](self, "playCount");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("playCount"), v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v58);

  v59 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItem bookmark](self, "bookmark");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("bookmark"), v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v61);

  v62 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "stringWithFormat:", CFSTR("<%@>"), v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

- (NSNumber)isPlayable
{
  return self->_isPlayable;
}

- (NSString)seasonCanonicalID
{
  return self->_seasonCanonicalID;
}

- (NSString)showCanonicalID
{
  return self->_showCanonicalID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showCanonicalID, 0);
  objc_storeStrong((id *)&self->_seasonCanonicalID, 0);
  objc_storeStrong((id *)&self->_isPlayable, 0);
}

@end
