@implementation VUIVideosPlayable

- (VUIVideosPlayable)initWithDictionary:(id)a3 andMetadataDictionary:(id)a4
{
  id v7;
  id v8;
  VUIVideosPlayable *v9;
  VUIContentMetadata *v10;
  VUIContentMetadata *metadata;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VUIVideosPlayable;
  v9 = -[VUIVideosPlayable init](&v13, sel_init);
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&v9->_videosPlayableDict, a3);
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = -[VUIContentMetadata initWithDictionary:]([VUIContentMetadata alloc], "initWithDictionary:", v8);
          metadata = v9->_metadata;
          v9->_metadata = v10;

        }
      }
    }
  }

  return v9;
}

- (BOOL)supportsStartOver
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("supportsStartOver"), 0);
}

- (NSURL)artworkURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;

  -[VUIVideosPlayable metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkURLFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "length"))
  {
    -[VUIVideosPlayable metadata](self, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artworkWidth");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    -[VUIVideosPlayable metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "artworkHeight");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIVideosPlayable metadata](self, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "previewFrameURLFormat");
    v12 = objc_claimAutoreleasedReturnValue();

    -[VUIVideosPlayable metadata](self, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "previewFrameWidth");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v8 = v15;

    -[VUIVideosPlayable metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previewFrameHeight");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)v12;
  }
  objc_msgSend(v10, "doubleValue");
  v17 = v16;

  v18 = 0;
  if (objc_msgSend(v4, "length") && v8 > 0.0 && v17 > 0.0)
  {
    if (v8 >= v17)
      v19 = v8;
    else
      v19 = v17;
    objc_msgSend(MEMORY[0x1E0DC6A00], "URLFromSource:extension:p3Specifier:cropCode:imageSize:displayScaleIsPointMultiplier:centerGrowth:focusSizeIncrease:", v4, CFSTR("jpeg"), 0, 0, 0, 0, v8 * (400.0 / v19), v17 * (400.0 / v19), 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v18;
}

- (VUIContentMetadata)metadata
{
  return self->_metadata;
}

- (BOOL)isiTunesPurchaseOrRental
{
  void *v3;
  uint64_t v4;
  BOOL v5;

  -[VUIVideosPlayable buyParams](self, "buyParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIVideosPlayable rentalID](self, "rentalID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = -[VUIVideosPlayable isFamilySharingContent](self, "isFamilySharingContent");
  if (objc_msgSend(v3, "length") | v4)
    v5 = 1;

  return v5;
}

- (BOOL)isFamilySharingContent
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("sharedPurchase"), 0);
}

- (NSNumber)rentalID
{
  void *v2;
  void *v3;

  -[NSDictionary vui_numberForKey:](self->_videosPlayableDict, "vui_numberForKey:", CFSTR("rentalId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "isEqualToNumber:", &unk_1EA0B9CB8))
  {

    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (NSString)buyParams
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("buyParams"));
}

- (NSURL)playbackURL
{
  void *v3;

  -[VUIVideosPlayable hlsURL](self, "hlsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary vui_URLForKey:](self->_videosPlayableDict, "vui_URLForKey:", CFSTR("playbackUrl"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)v3;
}

- (NSURL)hlsURL
{
  return (NSURL *)-[NSDictionary vui_URLForKey:](self->_videosPlayableDict, "vui_URLForKey:", CFSTR("hlsUrl"));
}

- (NSString)mediaType
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("mediaType"));
}

- (NSDictionary)mediaMetrics
{
  return (NSDictionary *)-[NSDictionary vui_dictionaryForKey:](self->_videosPlayableDict, "vui_dictionaryForKey:", CFSTR("mediaMetrics"));
}

- (NSString)canonicalID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("canonicalId"));
}

- (NSString)adamID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("adamId"));
}

- (NSDictionary)vpafMetrics
{
  return (NSDictionary *)-[NSDictionary vui_dictionaryForKey:](self->_videosPlayableDict, "vui_dictionaryForKey:", CFSTR("vpafMetrics"));
}

- (VUIRouterDataSource)upsellRouterDataSource
{
  void *v2;
  VUIRouterDataSource *v3;

  -[NSDictionary vui_dictionaryForKey:](self->_videosPlayableDict, "vui_dictionaryForKey:", CFSTR("upsellRouterDataSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[VUIRouterDataSource initWithRouterData:appContext:]([VUIRouterDataSource alloc], "initWithRouterData:appContext:", v2, 0);

  return v3;
}

- (NSURL)tvAppDeeplinkURL
{
  return (NSURL *)-[NSDictionary vui_URLForKey:](self->_videosPlayableDict, "vui_URLForKey:", CFSTR("url"));
}

- (NSArray)startTimeInfos
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  VUIMediaStartTimeInfo *v7;
  void *v8;
  VUIMediaStartTimeInfo *v9;
  VUIMediaStartTimeInfo *v10;
  void *v11;
  VUIMediaStartTimeInfo *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  VUIMediaStartTimeInfo *v18;
  VUIMediaStartTimeInfo *v19;
  id v21;
  id v22;
  id v23;
  id v24;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VUIVideosPlayable resumeTime](self, "resumeTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIVideosPlayable mainContentRelativeResumeTime](self, "mainContentRelativeResumeTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIVideosPlayable referenceID](self, "referenceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = [VUIMediaStartTimeInfo alloc];
    -[VUIVideosPlayable resumeTimeTimestamp](self, "resumeTimeTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:](v7, "initWithStartTime:timestamp:type:source:", v4, v8, 0, CFSTR("UTS/JS"));

    objc_msgSend(v3, "addObject:", v9);
  }
  if (v5)
  {
    v10 = [VUIMediaStartTimeInfo alloc];
    -[VUIVideosPlayable mainContentRelativeResumeTimeTimestamp](self, "mainContentRelativeResumeTimeTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:](v10, "initWithStartTime:timestamp:type:source:", v5, v11, 1, CFSTR("UTS/JS"));

    objc_msgSend(v3, "addObject:", v12);
  }
  if (objc_msgSend(v6, "length"))
  {
    +[VUIStreamingBookmarkCache sharedInstance](VUIStreamingBookmarkCache, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = 0;
    v21 = 0;
    v22 = 0;
    objc_msgSend(v13, "resumeTimeInfoForReferenceID:outAbsoluteResumeTime:outAbsoluteTimestamp:outMainContentRelativeResumeTime:outMainContentRelativeTimestamp:", v6, &v24, &v23, &v22, &v21);
    v14 = v24;
    v15 = v23;
    v16 = v22;
    v17 = v21;

    if (v14)
    {
      v18 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:]([VUIMediaStartTimeInfo alloc], "initWithStartTime:timestamp:type:source:", v14, v15, 0, CFSTR("VUIStreamingBookmarkCache"));
      objc_msgSend(v3, "addObject:", v18);

    }
    if (v16)
    {
      v19 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:]([VUIMediaStartTimeInfo alloc], "initWithStartTime:timestamp:type:source:", v16, v17, 1, CFSTR("VUIStreamingBookmarkCache"));
      objc_msgSend(v3, "addObject:", v19);

    }
  }

  return (NSArray *)v3;
}

- (NSString)referenceID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("referenceId"));
}

- (NSString)sharedWatchId
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[VUIVideosPlayable sharedWatchUrl](self, "sharedWatchUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3998]);
    -[VUIVideosPlayable sharedWatchUrl](self, "sharedWatchUrl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithURL:resolvingAgainstBaseURL:", v5, 1);

    if (v6)
    {
      objc_msgSend(v6, "queryItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");
      v9 = v8;
      if (v8)
        v10 = v8;
      else
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = v10;

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v18, "name", (_QWORD)v22);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("sharedWatchId"));

            if ((v20 & 1) != 0)
            {
              objc_msgSend(v18, "value");
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_20;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v15)
            continue;
          break;
        }
      }

    }
    goto LABEL_18;
  }
  if (!-[VUIVideosPlayable useSharedPlayableForCowatching](self, "useSharedPlayableForCowatching"))
  {
LABEL_18:
    v11 = 0;
    goto LABEL_21;
  }
  -[VUIVideosPlayable playbackURL](self, "playbackURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
  return (NSString *)v11;
}

- (BOOL)useSharedPlayableForCowatching
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("useSharedPlayableForCowatching"), 0);
}

- (NSURL)sharedWatchUrl
{
  return (NSURL *)-[NSDictionary vui_URLForKey:](self->_videosPlayableDict, "vui_URLForKey:", CFSTR("sharedWatchUrl"));
}

- (BOOL)sendMescalHeaderToPlaybackKeyServer
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("sendMescalHeaderToPlaybackKeyServer"), 0);
}

- (BOOL)sendLocationToPlaybackKeyServerWhenOptedIn
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("sendLocationToPlaybackKeyServerWhenOptedIn"), 0);
}

- (NSURL)scrubVideoURL
{
  return (NSURL *)-[NSDictionary vui_URLForKey:](self->_videosPlayableDict, "vui_URLForKey:", CFSTR("scrubVideoUrl"));
}

- (NSString)rtcServiceIdentifier
{
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  __CFString **v9;

  -[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("rtcServiceIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    if (-[VUIVideosPlayable isiTunesPurchaseOrRental](self, "isiTunesPurchaseOrRental"))
    {
      if (-[VUIVideosPlayable isRental](self, "isRental"))
      {
        v4 = CFSTR("com.apple.videos.movies.rental.cloud");
      }
      else
      {
        -[VUIVideosPlayable mediaType](self, "mediaType");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Movie"));
        v9 = VUIStoreMediaItemRTCServiceIdentifierMoviePurchase_iOS_cloud;
        if (!v8)
          v9 = VUIStoreMediaItemRTCServiceIdentifierTVShowPurchase_iOS_cloud;
        v4 = *v9;

        v3 = v7;
      }
      goto LABEL_10;
    }
    -[VUIVideosPlayable mediaMetrics](self, "mediaMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v4 = CFSTR("com.apple.tv.external");
LABEL_10:

      v3 = v4;
    }
  }
  return (NSString *)v3;
}

- (NSNumber)resumeTime
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_videosPlayableDict, "vui_numberForKey:", CFSTR("resumeTime"));
}

- (NSNumber)requiredAgeForPlayback
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_videosPlayableDict, "vui_numberForKey:", CFSTR("requiredAgeForPlayback"));
}

- (BOOL)playsFromStartOfLiveStream
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("playsFromStartOfLiveStream"), 0);
}

- (unint64_t)playableType
{
  void *v2;
  unint64_t v3;

  -[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("playableType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
    goto LABEL_8;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Event")) & 1) == 0)
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("EbsEvent")) & 1) != 0)
    {
      v3 = 2;
      goto LABEL_9;
    }
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Vod")) & 1) != 0)
    {
      v3 = 3;
      goto LABEL_9;
    }
LABEL_8:
    v3 = 0;
    goto LABEL_9;
  }
  v3 = 1;
LABEL_9:

  return v3;
}

- (NSNumber)mainContentRelativeResumeTime
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_videosPlayableDict, "vui_numberForKey:", CFSTR("mainContentRelativeResumeTime"));
}

- (NSString)locale
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("locale"));
}

- (NSString)liveStreamServiceID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("liveStreamServiceId"));
}

- (BOOL)isAmbientVideo
{
  void *v2;
  char v3;

  -[VUIVideosPlayable utsEntityType](self, "utsEntityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AmbientVideo"));

  return v3;
}

- (NSString)utsEntityType
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("utsEntityType"));
}

- (NSNumber)frequencyOfAgeConfirmation
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_videosPlayableDict, "vui_numberForKey:", CFSTR("frequencyOfAgeConfirmation"));
}

- (NSURL)fpsKeyServerURL
{
  return (NSURL *)-[NSDictionary vui_URLForKey:](self->_videosPlayableDict, "vui_URLForKey:", CFSTR("fpsKeyServerUrl"));
}

- (NSURL)fpsCertificateURL
{
  return (NSURL *)-[NSDictionary vui_URLForKey:](self->_videosPlayableDict, "vui_URLForKey:", CFSTR("fpsCertificateUrl"));
}

- (NSDictionary)fpsAdditionalServerParams
{
  return (NSDictionary *)-[NSDictionary vui_dictionaryForKey:](self->_videosPlayableDict, "vui_dictionaryForKey:", CFSTR("fpsKeyServerQueryParameters"));
}

- (NSString)externalServiceID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("externalServiceId"));
}

- (NSString)externalID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("externalId"));
}

- (BOOL)disableScrubbing
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("disableScrubbing"), 0);
}

- (NSString)channelName
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("channelName"));
}

- (NSString)channelID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("channelId"));
}

- (NSString)bookmarkID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("bookmarkId"));
}

+ (id)videosPlayablesFromDictionaries:(id)a3 andMetadataDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  VUIVideosPlayable *v14;
  VUIVideosPlayable *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          v14 = [VUIVideosPlayable alloc];
          v15 = -[VUIVideosPlayable initWithDictionary:andMetadataDictionary:](v14, "initWithDictionary:andMetadataDictionary:", v13, v6, (_QWORD)v18);
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }
  v16 = (void *)objc_msgSend(v7, "copy", (_QWORD)v18);

  return v16;
}

+ (id)_sharedPlayableAllowList
{
  if (_sharedPlayableAllowList_onceToken != -1)
    dispatch_once(&_sharedPlayableAllowList_onceToken, &__block_literal_global_102);
  return (id)_sharedPlayableAllowList_allowList;
}

void __45__VUIVideosPlayable__sharedPlayableAllowList__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];

  v2[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("hlsUrl");
  v2[1] = CFSTR("useSharedPlayableForCowatching");
  v2[2] = CFSTR("mediaType");
  v2[3] = CFSTR("fpsKeyServerUrl");
  v2[4] = CFSTR("fpsCertificateUrl");
  v2[5] = CFSTR("fpsKeyServerQueryParameters");
  v2[6] = CFSTR("disableScrubbing");
  v2[7] = CFSTR("vpafMetrics");
  v2[8] = CFSTR("playbackModes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_sharedPlayableAllowList_allowList;
  _sharedPlayableAllowList_allowList = v0;

}

- (id)serializedData
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSDictionary *videosPlayableDict;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[VUIContentMetadata backingDictionary](self->_metadata, "backingDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  videosPlayableDict = self->_videosPlayableDict;
  v12[0] = CFSTR("videosPlayable");
  v12[1] = CFSTR("contentMetadata");
  v13[0] = videosPlayableDict;
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 0, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)serializedSharedData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend((id)objc_opt_class(), "_sharedPlayableAllowList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_videosPlayableDict, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

  -[VUIContentMetadata backingDictionary](self->_metadata, "backingDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v23[0] = CFSTR("videosPlayable");
  v23[1] = CFSTR("contentMetadata");
  v24[0] = v3;
  v24[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v15, 0, &v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)videosPlayableFromSerializedData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  VUIVideosPlayable *v6;
  uint64_t v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_dictionaryForKey:", CFSTR("videosPlayable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_dictionaryForKey:", CFSTR("contentMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VUIVideosPlayable initWithDictionary:andMetadataDictionary:]([VUIVideosPlayable alloc], "initWithDictionary:andMetadataDictionary:", v4, v5);

  return v6;
}

+ (id)videosPlayableFromSerializedSharedData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  VUIVideosPlayable *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v25;
  objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("videosPlayable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a1, "_sharedPlayableAllowList", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "vui_setObjectIfNotNil:forKey:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v10);
  }

  objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("contentMetadata"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  v19 = -[VUIVideosPlayable initWithDictionary:andMetadataDictionary:]([VUIVideosPlayable alloc], "initWithDictionary:andMetadataDictionary:", v7, v18);
  return v19;
}

- (BOOL)isMovie
{
  void *v2;
  void *v3;
  char v4;

  -[VUIVideosPlayable mediaType](self, "mediaType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("movie"));

  return v4;
}

- (BOOL)isCowatchingProhibited
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("isCowatchingProhibited"), 0);
}

- (NSString)cowatchingProhibitedReason
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("cowatchingProhibitedReason"));
}

- (NSString)groupActivityDay
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("groupActivityDay"));
}

- (void)setHlsURL:(id)a3
{
  NSDictionary *videosPlayableDict;
  id v5;
  NSDictionary *v6;
  NSDictionary *v7;
  id v8;

  if (a3)
  {
    videosPlayableDict = self->_videosPlayableDict;
    v5 = a3;
    v8 = (id)-[NSDictionary mutableCopy](videosPlayableDict, "mutableCopy");
    objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("hlsUrl"));

    v6 = (NSDictionary *)objc_msgSend(v8, "copy");
    v7 = self->_videosPlayableDict;
    self->_videosPlayableDict = v6;

  }
}

- (NSURL)downloadURL
{
  return (NSURL *)-[NSDictionary vui_URLForKey:](self->_videosPlayableDict, "vui_URLForKey:", CFSTR("hlsDownloadUrl"));
}

- (NSURL)fpsNonceURL
{
  return (NSURL *)-[NSDictionary vui_URLForKey:](self->_videosPlayableDict, "vui_URLForKey:", CFSTR("fpsNonceServerUrl"));
}

- (NSDate)mainContentRelativeResumeTimeTimestamp
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;

  -[NSDictionary vui_numberForKey:](self->_videosPlayableDict, "vui_numberForKey:", CFSTR("mainContentRelativeResumeTimeTimeStamp"));
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

- (NSDate)resumeTimeTimestamp
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;

  -[NSDictionary vui_numberForKey:](self->_videosPlayableDict, "vui_numberForKey:", CFSTR("resumeTimeTimeStamp"));
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

- (BOOL)isRental
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("isRental"), 0);
}

- (NSString)hlsProgramID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("hlsProgramID"));
}

- (NSString)showAdamID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("showAdamID"));
}

- (NSString)seasonAdamID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("seasonAdamID"));
}

- (NSString)showCanonicalID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("showCanonicalId"));
}

- (NSString)seasonCanonicalID
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("seasonCanonicalId"));
}

- (BOOL)isSubscription
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("isApSubscription"), 0);
}

- (void)setVpafMetrics:(id)a3
{
  NSDictionary *videosPlayableDict;
  id v5;
  NSDictionary *v6;
  NSDictionary *v7;
  id v8;

  if (a3)
  {
    videosPlayableDict = self->_videosPlayableDict;
    v5 = a3;
    v8 = (id)-[NSDictionary mutableCopy](videosPlayableDict, "mutableCopy");
    objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("vpafMetrics"));

    v6 = (NSDictionary *)objc_msgSend(v8, "copy");
    v7 = self->_videosPlayableDict;
    self->_videosPlayableDict = v6;

  }
}

- (id)_allPlaybackModes
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  const __CFString *v11;
  char v12;
  char v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSDictionary vui_arrayForKey:](self->_videosPlayableDict, "vui_arrayForKey:", CFSTR("playbackModes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Monoscopic"));
        v11 = CFSTR("Monoscopic");
        if ((v10 & 1) == 0)
        {
          v12 = objc_msgSend(v9, "isEqualToString:", CFSTR("Stereoscopic"));
          v11 = CFSTR("Stereoscopic");
          if ((v12 & 1) == 0)
          {
            v13 = objc_msgSend(v9, "isEqualToString:", CFSTR("Immersive"));
            v11 = CFSTR("Immersive");
            if ((v13 & 1) == 0)
            {
              v14 = objc_msgSend(v9, "isEqualToString:", CFSTR("BlendedImmersive"));
              v11 = CFSTR("Blended");
              if (!v14)
                continue;
            }
          }
        }
        objc_msgSend(v3, "addObject:", v11);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSArray)playbackModes
{
  return 0;
}

- (NSString)preferredPlaybackMode
{
  return 0;
}

- (NSString)preferredAudioLanguageCode
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("preferredAudioLanguageCode"));
}

- (unint64_t)sourceRef
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  -[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("sourceRef"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
    goto LABEL_12;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("sharedWatchJoin")) & 1) == 0)
  {
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("sharedWatchJoinBinge")))
    {
      VUIDefaultLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "JS provided legacy sharedWatchJoinBinge param", v6, 2u);
      }

      goto LABEL_9;
    }
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("sharedWatchPostPlayBinge")) & 1) != 0)
    {
LABEL_9:
      v3 = 2;
      goto LABEL_13;
    }
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("sharedWatchPostPlayNonBinge")) & 1) != 0)
    {
      v3 = 3;
      goto LABEL_13;
    }
LABEL_12:
    v3 = 0;
    goto LABEL_13;
  }
  v3 = 1;
LABEL_13:

  return v3;
}

- (VUIExtrasInfo)extrasInfo
{
  void *v2;
  VUIExtrasInfo *v3;

  -[NSDictionary vui_dictionaryForKey:](self->_videosPlayableDict, "vui_dictionaryForKey:", CFSTR("extras"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = -[VUIExtrasInfo initWithDictionary:]([VUIExtrasInfo alloc], "initWithDictionary:", v2);
  else
    v3 = 0;

  return v3;
}

- (BOOL)fullscreenTransferEligible
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("continuesFromPreview"), 0);
}

- (NSArray)knownAudioVariantIDs
{
  return (NSArray *)objc_msgSend((id)objc_opt_class(), "knownAudioVariantIDs");
}

+ (id)knownAudioVariantIDs
{
  void *v2;
  void *v3;
  void *v4;

  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nowPlayingConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaCharacteristicsToLocalize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isMediaCharacteristicAnAudioVariantID:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "isMediaCharacteristicAnAudioVariantID:", v3);

  return v4;
}

+ (BOOL)isMediaCharacteristicAnAudioVariantID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "knownAudioVariantIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if ((v6 & 1) != 0)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nowPlayingConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "audioIDPrefixes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v11 = v10;
      v7 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
      {
        v12 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v11);
            if ((objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15) & 1) != 0)
            {
              LOBYTE(v7) = 1;
              goto LABEL_15;
            }
          }
          v7 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_15:

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (NSNumber)repeatLoopCount
{
  return (NSNumber *)-[NSDictionary vui_numberForKey:](self->_videosPlayableDict, "vui_numberForKey:", CFSTR("repeatLoopCount"));
}

- (BOOL)isEligibleForMultiview
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("isEligibleForMultiView"), 0);
}

- (NSString)playablePassThrough
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_videosPlayableDict, "vui_stringForKey:", CFSTR("playablePassThrough"));
}

- (BOOL)isKeyPlayAvailable
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("isKeyPlayAvailable"), 0);
}

- (BOOL)makeAdditionalPlayerTabsRequest
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("makeAdditionalPlayerTabsRequest"), 0);
}

- (BOOL)containsEligiblePlaybackMode
{
  void *v2;
  BOOL v3;

  -[VUIVideosPlayable _allPlaybackModes](self, "_allPlaybackModes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "containsObject:", CFSTR("Monoscopic")) & 1) != 0 || objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)reportVPAFWhenPlayingInBackground
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_videosPlayableDict, "vui_BOOLForKey:defaultValue:", CFSTR("reportVPAFWhenPlayingInBackground"), 0);
}

- (NSURL)previewArtwork
{
  return self->_previewArtwork;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_previewArtwork, 0);
  objc_storeStrong((id *)&self->_videosPlayableDict, 0);
}

@end
