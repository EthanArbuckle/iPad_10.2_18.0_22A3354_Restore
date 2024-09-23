@implementation VUIContentMetadata

- (NSNumber)videoResolutionClass
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("videoResolutionClass"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("4k")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("uhd")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hd")) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("sd"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v5;
}

- (NSNumber)videoDynamicRange
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("videoDynamicRange"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("dolbyvisionhdr")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hdr")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hdr10plus")) & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("sdr"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v5;
}

- (NSString)versionCount
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("versionCount"));
}

- (NSNumber)tomatoPercentage
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("tomatometerPercentage"));
}

- (unint64_t)tomatoFreshness
{
  void *v2;
  unint64_t v3;

  -[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("tomatometerFreshness"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Fresh")) & 1) != 0)
    {
      v3 = 1;
    }
    else if (objc_msgSend(v2, "isEqualToString:", CFSTR("CertifiedFresh")))
    {
      v3 = 2;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 3;
  }

  return v3;
}

- (NSString)title
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("title"));
}

- (NSString)timeTextBadge
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("timeTextBadge"));
}

- (NSString)teamAbbreviation
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("teamAbbreviation"));
}

- (NSString)subtitle
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("subtitle"));
}

- (NSString)seasonTitle
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("seasonTitle"));
}

- (NSNumber)seasonNumber
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("seasonNumber"));
}

- (NSDate)rentalExpiration
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;

  -[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("rentalExpiration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v4, "dateWithTimeIntervalSince1970:", v5 / 1000.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (NSDate *)v6;
}

- (NSDate)releasedDate
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;

  -[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("releaseDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v4, "dateWithTimeIntervalSince1970:", v5 / 1000.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (NSDate *)v6;
}

- (NSNumber)ratingValue
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("ratingValue"));
}

- (NSString)ratingSystem
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("ratingSystem"));
}

- (NSString)ratingName
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("ratingName"));
}

- (NSString)ratingAuxiliaryName
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("ratingAuxiliaryName"));
}

- (NSNumber)numberOfSeasons
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("numberOfSeasons"));
}

- (NSString)mediaDescription
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("description"));
}

- (NSString)liveTextBadge
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("liveTextBadge"));
}

- (NSString)leagueShortName
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("leagueShortName"));
}

- (BOOL)isSharedWatchEnabled
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_metadataDictionary, "vui_BOOLForKey:defaultValue:", CFSTR("sharedWatchEnabled"), 0);
}

- (BOOL)isFederated
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_metadataDictionary, "vui_BOOLForKey:defaultValue:", CFSTR("isFederated"), 0);
}

- (VUIContentMetadata)initWithDictionary:(id)a3
{
  id v4;
  VUIContentMetadata *v5;
  uint64_t v6;
  NSDictionary *metadataDictionary;
  uint64_t v8;
  NSDictionary *contentTypeMap;
  objc_super v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIContentMetadata;
  v5 = -[VUIContentMetadata init](&v11, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "count"))
    {
      v6 = objc_msgSend(v4, "copy");
      metadataDictionary = v5->_metadataDictionary;
      v5->_metadataDictionary = (NSDictionary *)v6;

    }
    v12[0] = CFSTR("Episode");
    v12[1] = CFSTR("Movie");
    v13[0] = &unk_1EA0B9988;
    v13[1] = &unk_1EA0B99A0;
    v12[2] = CFSTR("Show");
    v12[3] = CFSTR("Season");
    v13[2] = &unk_1EA0B99B8;
    v13[3] = &unk_1EA0B99D0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
    v8 = objc_claimAutoreleasedReturnValue();
    contentTypeMap = v5->_contentTypeMap;
    v5->_contentTypeMap = (NSDictionary *)v8;

  }
  return v5;
}

- (NSString)immersiveText
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("immersiveText"));
}

- (NSNumber)hasSDHLocales
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("hasSDH"));
}

- (NSNumber)hasImmersive
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("hasImmersive"));
}

- (NSNumber)hasDolbyAtmos
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("hasDolbyAtmos"));
}

- (NSNumber)hasClosedCaptions
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("hasClosedCaption"));
}

- (NSNumber)hasADLocales
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("hasAD"));
}

- (NSNumber)has3D
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("has3D"));
}

- (NSString)genre
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("genreName"));
}

- (NSString)gameVenue
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("gameVenue"));
}

- (NSString)gameStartTime
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("gameStartTime"));
}

- (NSString)formattedReleaseDate
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("formattedReleaseDate"));
}

- (NSNumber)episodeNumber
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("episodeNumber"));
}

- (NSNumber)duration
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("duration"));
}

- (NSString)contentUnavailabilityText
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("contentUnavailabilityText"));
}

- (NSNumber)commonSenseRecommendedAge
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("recommendedAge"));
}

- (NSString)channelName
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("channelName"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTypeMap, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

+ (id)validMediaTags
{
  if (validMediaTags_onceToken != -1)
    dispatch_once(&validMediaTags_onceToken, &__block_literal_global_77);
  return (id)validMediaTags__validMediaTags;
}

void __36__VUIContentMetadata_validMediaTags__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("hasAD");
  v2[1] = CFSTR("hasSDH");
  v2[2] = CFSTR("hasImmersive");
  v2[3] = CFSTR("has3D");
  v2[4] = CFSTR("hasDolbyAtmos");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)validMediaTags__validMediaTags;
  validMediaTags__validMediaTags = v0;

}

- (VUIContentMetadata)initWithTitle:(id)a3 showTitle:(id)a4 seasonTitle:(id)a5 seasonNumber:(id)a6 episodeNumber:(id)a7 artworkURL:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  VUIContentMetadata *v22;

  v14 = (void *)MEMORY[0x1E0C99E08];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v14, "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "vui_setObjectIfNotNil:forKey:", v20, CFSTR("title"));

  objc_msgSend(v21, "vui_setObjectIfNotNil:forKey:", v19, CFSTR("showTitle"));
  objc_msgSend(v21, "vui_setObjectIfNotNil:forKey:", v18, CFSTR("seasonTitle"));

  objc_msgSend(v21, "vui_setObjectIfNotNil:forKey:", v17, CFSTR("seasonNumber"));
  objc_msgSend(v21, "vui_setObjectIfNotNil:forKey:", v16, CFSTR("episodeNumber"));

  objc_msgSend(v21, "vui_setObjectIfNotNil:forKey:", v15, CFSTR("artwork"));
  v22 = -[VUIContentMetadata initWithDictionary:](self, "initWithDictionary:", v21);

  return v22;
}

- (id)backingDictionary
{
  return (id)-[NSDictionary copy](self->_metadataDictionary, "copy");
}

- (id)rawBackingDictionary
{
  return self->_metadataDictionary;
}

- (NSString)type
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("type"));
}

- (unint64_t)contentType
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary vui_numberForKey:](self->_contentTypeMap, "vui_numberForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 0;

  return v6;
}

- (NSString)artworkURLFormat
{
  void *v2;
  void *v3;

  -[NSDictionary vui_dictionaryForKey:](self->_metadataDictionary, "vui_dictionaryForKey:", CFSTR("artwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_stringForKey:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)artworkWidth
{
  void *v2;
  void *v3;

  -[NSDictionary vui_dictionaryForKey:](self->_metadataDictionary, "vui_dictionaryForKey:", CFSTR("artwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_numberForKey:", CFSTR("width"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)artworkHeight
{
  void *v2;
  void *v3;

  -[NSDictionary vui_dictionaryForKey:](self->_metadataDictionary, "vui_dictionaryForKey:", CFSTR("artwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_numberForKey:", CFSTR("height"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSString)previewFrameURLFormat
{
  void *v2;
  void *v3;

  -[NSDictionary vui_dictionaryForKey:](self->_metadataDictionary, "vui_dictionaryForKey:", CFSTR("previewFrameArtwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_stringForKey:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)previewFrameWidth
{
  void *v2;
  void *v3;

  -[NSDictionary vui_dictionaryForKey:](self->_metadataDictionary, "vui_dictionaryForKey:", CFSTR("previewFrameArtwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_numberForKey:", CFSTR("width"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)previewFrameHeight
{
  void *v2;
  void *v3;

  -[NSDictionary vui_dictionaryForKey:](self->_metadataDictionary, "vui_dictionaryForKey:", CFSTR("previewFrameArtwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_numberForKey:", CFSTR("height"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSString)showArtworkURLFormat
{
  void *v2;
  void *v3;

  -[NSDictionary vui_dictionaryForKey:](self->_metadataDictionary, "vui_dictionaryForKey:", CFSTR("showArtwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_stringForKey:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)showArtworkWidth
{
  void *v2;
  void *v3;

  -[NSDictionary vui_dictionaryForKey:](self->_metadataDictionary, "vui_dictionaryForKey:", CFSTR("showArtwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_numberForKey:", CFSTR("width"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)showArtworkHeight
{
  void *v2;
  void *v3;

  -[NSDictionary vui_dictionaryForKey:](self->_metadataDictionary, "vui_dictionaryForKey:", CFSTR("showArtwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_numberForKey:", CFSTR("height"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)rentalDurationInMilliseconds
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("rentalDurationInMilliseconds"));
}

- (NSNumber)rentalPlaybackDurationInMilliseconds
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("playbackDurationInMilliseconds"));
}

- (NSString)rentalPurchasedTimestamp
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("purchasedTimestamp"));
}

- (NSString)rentalStartedWatchingTimestamp
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("startedWatchingTimestamp"));
}

- (NSNumber)hasHighMotion
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("hasHighMotion"));
}

- (NSString)highMotionText
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("highMotionText"));
}

- (NSString)ratingDomain
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("ratingDomain"));
}

- (NSNumber)fractionalEpisodeNumber
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("fractionalEpisodeNumber"));
}

- (NSNumber)episodeIndexInSeries
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("episodeIndex"));
}

- (NSString)showTitle
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("showTitle"));
}

- (BOOL)isAdultContent
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_metadataDictionary, "vui_BOOLForKey:defaultValue:", CFSTR("isAdultContent"), 0);
}

- (NSString)showCanonicalId
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("showCanonicalId"));
}

- (NSString)seasonCanonicalId
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("seasonCanonicalId"));
}

- (NSDictionary)mediaShareMetadata
{
  return (NSDictionary *)-[NSDictionary vui_dictionaryForKey:](self->_metadataDictionary, "vui_dictionaryForKey:", CFSTR("mediaShareMetadata"));
}

- (NSDictionary)showMediaShareMetadata
{
  return (NSDictionary *)-[NSDictionary vui_dictionaryForKey:](self->_metadataDictionary, "vui_dictionaryForKey:", CFSTR("showMediaShareMetadata"));
}

- (NSString)studio
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("studio"));
}

- (NSArray)roles
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  VUIRolesEntity *v10;
  VUIRolesEntity *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSDictionary vui_arrayForKey:](self->_metadataDictionary, "vui_arrayForKey:", CFSTR("roles"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [VUIRolesEntity alloc];
        v11 = -[VUIRolesEntity initWithDictionary:](v10, "initWithDictionary:", v9, (_QWORD)v13);
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)isEligibleForPlayerTabs
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_metadataDictionary, "vui_BOOLForKey:defaultValue:", CFSTR("isEligibleForPlayerTabs"), 1);
}

- (BOOL)isEligibleForInfoTab
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_metadataDictionary, "vui_BOOLForKey:defaultValue:", CFSTR("isEligibleForInfoTab"), 1);
}

- (VUIUpsellOnExitPolicy)upsellOnExitPolicy
{
  void *v2;
  VUIUpsellOnExitPolicy *v3;

  -[NSDictionary vui_dictionaryForKey:](self->_metadataDictionary, "vui_dictionaryForKey:", CFSTR("upsellExitPolicy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[VUIUpsellOnExitPolicy initWithDictionary:]([VUIUpsellOnExitPolicy alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSString)leagueName
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("leagueName"));
}

- (NSString)venueName
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("venueName"));
}

- (NSString)venueAddress
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("venueAddr"));
}

- (NSString)sportName
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("sportName"));
}

- (NSNumber)startTime
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("startTime"));
}

- (NSNumber)endTime
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("endTime"));
}

- (NSNumber)hasEventEnded
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("hasEventEnded"));
}

- (NSNumber)scheduleStartTime
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("scheduleStartTime"));
}

- (NSNumber)scheduleEndTime
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("scheduleEndTime"));
}

- (NSNumber)transportBarStartTime
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("startTime"));
}

- (NSNumber)transportBarEndTime
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_metadataDictionary, "vui_numberForKey:", CFSTR("endTime"));
}

- (NSString)shootoutsText
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_metadataDictionary, "vui_stringForKey:", CFSTR("shootoutsText"));
}

@end
