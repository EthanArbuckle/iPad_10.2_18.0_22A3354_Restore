@implementation WLKPlayable

+ (id)playablesWithDictionaries:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t isKindOfClass;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
        {
          v16 = (void *)MEMORY[0x1B5E47E50](isKindOfClass);
          v17 = objc_alloc((Class)a1);
          v18 = (void *)objc_msgSend(v17, "initWithDictionary:context:", v14, v7, (_QWORD)v20);
          objc_msgSend(v8, "addObject:", v18);

          objc_autoreleasePoolPop(v16);
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  return v8;
}

- (WLKPlayable)initWithDictionary:(id)a3
{
  return -[WLKPlayable initWithDictionary:context:](self, "initWithDictionary:context:", a3, 0);
}

- (WLKPlayable)initWithDictionary:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  WLKPlayable *v8;
  void *v9;
  uint64_t v10;
  WLKPlayable *v11;
  void *v12;
  uint64_t v13;
  NSArray *audioTrackFormats;
  void *v15;
  uint64_t v16;
  NSString *channelID;
  void *v18;
  uint64_t v19;
  NSString *playableID;
  void *v21;
  uint64_t v22;
  NSString *contentID;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  NSString *externalID;
  void *v29;
  uint64_t v30;
  NSString *externalServiceID;
  void *v32;
  uint64_t v33;
  NSString *videoQuality;
  void *v35;
  uint64_t v36;
  NSString *videoColorRange;
  id v38;
  uint64_t v39;
  NSString *canonicalID;
  void *v41;
  void *v42;
  uint64_t v43;
  WLKChannelDetails *channelDetails;
  void *v45;
  void *v46;
  uint64_t v47;
  NSDate *startAirTime;
  uint64_t v49;
  NSDate *endAirTime;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  WLKBasicContentMetadata *v54;
  WLKComingSoonInfo *v55;
  WLKComingSoonInfo *comingSoonInfo;
  void *v57;
  void *v58;
  uint64_t v59;
  NSArray *movieClips;
  void *v61;
  WLKOfferListing *v62;
  WLKOfferListing *offerListing;
  void *v64;
  uint64_t v65;
  NSArray *subscriptionOffers;
  void *v67;
  uint64_t v68;
  NSDictionary *punchoutUrls;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  NSURL *tvAppDeeplinkURL;
  uint64_t v74;
  NSArray *closedCaptionLocales;
  void *v76;
  uint64_t v77;
  NSArray *audioTrackLocales;
  uint64_t v79;
  NSArray *adLocales;
  WLKLocale *v81;
  void *v82;
  uint64_t v83;
  WLKLocale *primaryLocale;
  uint64_t v85;
  NSArray *SDHLocales;
  void *v87;
  WLKPlayEvent *v88;
  WLKPlayEvent *playEvent;
  NSDictionary *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  NSDictionary *v105;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  _QWORD v114[4];
  WLKPlayable *v115;
  objc_super v116;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v116.receiver = self;
    v116.super_class = (Class)WLKPlayable;
    v8 = -[WLKPlayable init](&v116, sel_init);
    if (!v8)
    {
LABEL_65:
      self = v8;
      v11 = self;
      goto LABEL_66;
    }
    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("airingType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqual:", CFSTR("Live")))
    {
      v10 = 1;
    }
    else if (objc_msgSend(v9, "isEqual:", CFSTR("Replay")))
    {
      v10 = 2;
    }
    else
    {
      if (objc_msgSend(v9, "isEqual:", CFSTR("OnDemand")))
      {
        v8->_airingType = 0;
        goto LABEL_12;
      }
      v10 = -1;
    }
    v8->_airingType = v10;
LABEL_12:
    objc_msgSend(v6, "wlk_arrayForKey:", CFSTR("audioTrackFormats"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    audioTrackFormats = v8->_audioTrackFormats;
    v8->_audioTrackFormats = (NSArray *)v13;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("channelId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    channelID = v8->_channelID;
    v8->_channelID = (NSString *)v16;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("id"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    playableID = v8->_playableID;
    v8->_playableID = (NSString *)v19;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("contentId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    contentID = v8->_contentID;
    v8->_contentID = (NSString *)v22;

    v8->_duration = (NSNumber *)(id)objc_msgSend(v6, "wlk_numberForKey:", CFSTR("duration"));
    objc_msgSend(v6, "valueForKey:", CFSTR("isEntitledToPlayOnDevice"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      v25 = CFSTR("isEntitledToPlayOnDevice");
    else
      v25 = CFSTR("isEntitled");
    v8->_entitled = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", v25, 0);
    v8->_entitledAnywhere = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("isEntitledToPlay"), 0);
    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("externalId"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    externalID = v8->_externalID;
    v8->_externalID = (NSString *)v27;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("externalServiceId"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copy");
    externalServiceID = v8->_externalServiceID;
    v8->_externalServiceID = (NSString *)v30;

    v8->_itunes = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("isItunes"), 0);
    v8->_subtitled = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("isSubtitled"), 0);
    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("videoQuality"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    videoQuality = v8->_videoQuality;
    v8->_videoQuality = (NSString *)v33;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("videoColorRange"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    videoColorRange = v8->_videoColorRange;
    v8->_videoColorRange = (NSString *)v36;

    v38 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v38, "wlk_stringForKey:", CFSTR("WLKModelContextKeyCanonicalID"));
      v39 = objc_claimAutoreleasedReturnValue();
      canonicalID = v8->_canonicalID;
      v8->_canonicalID = (NSString *)v39;

      objc_msgSend(v38, "wlk_arrayForKey:", CFSTR("WLKModelContextKeyChannels"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = __42__WLKPlayable_initWithDictionary_context___block_invoke;
      v114[3] = &unk_1E68A8430;
      v115 = v8;
      objc_msgSend(v41, "enumerateObjectsUsingBlock:", v114);

    }
    if (!v8->_channelDetails)
    {
      +[WLKChannelUtilities sharedInstance](WLKChannelUtilities, "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "channelForID:", v8->_channelID);
      v43 = objc_claimAutoreleasedReturnValue();
      channelDetails = v8->_channelDetails;
      v8->_channelDetails = (WLKChannelDetails *)v43;

    }
    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("eventTime"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "wlk_dictionaryForKey:", CFSTR("tuneInTime"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("startTime"));
    v47 = objc_claimAutoreleasedReturnValue();
    startAirTime = v8->_startAirTime;
    v8->_startAirTime = (NSDate *)v47;

    v112 = v46;
    objc_msgSend(v46, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("endTime"));
    v49 = objc_claimAutoreleasedReturnValue();
    endAirTime = v8->_endAirTime;
    v8->_endAirTime = (NSDate *)v49;

    v8->_contentSourceType = -1;
    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("type"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "length"))
    {
      if ((objc_msgSend(v51, "isEqualToString:", CFSTR("Vod")) & 1) != 0)
      {
        v52 = 0;
      }
      else
      {
        if (!objc_msgSend(v51, "isEqualToString:", CFSTR("Event")))
          goto LABEL_25;
        v52 = 1;
      }
      v8->_contentSourceType = v52;
    }
LABEL_25:
    v111 = v51;
    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("content"));
    v53 = objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v54 = -[WLKBasicContentMetadata initWithDictionary:]([WLKBasicContentMetadata alloc], "initWithDictionary:", v53);
      if (v54)
        objc_storeStrong((id *)&v8->_content, v54);

    }
    v55 = -[WLKComingSoonInfo initWithDictionary:brandID:]([WLKComingSoonInfo alloc], "initWithDictionary:brandID:", v6, v8->_channelID);
    comingSoonInfo = v8->_comingSoonInfo;
    v8->_comingSoonInfo = v55;

    v110 = (void *)v53;
    if (v8->_itunes)
    {
      objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("itunesMediaApiData"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "wlk_arrayForKey:", CFSTR("movieClips"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        +[WLKMovieClip movieClipsWithArray:](WLKMovieClip, "movieClipsWithArray:", v58);
        v59 = objc_claimAutoreleasedReturnValue();
        movieClips = v8->_movieClips;
        v8->_movieClips = (NSArray *)v59;

      }
      v113 = v57;
      objc_msgSend(v57, "wlk_arrayForKey:", CFSTR("offers"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        v62 = -[WLKOfferListing initWithMAPIDictionaries:]([WLKOfferListing alloc], "initWithMAPIDictionaries:", v61);
        offerListing = v8->_offerListing;
        v8->_offerListing = v62;

      }
    }
    else
    {
      v113 = 0;
    }
    objc_msgSend(v6, "wlk_arrayForKey:", CFSTR("subscriptionOffers"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      +[WLKStoreOffer offersWithSubscriptionDictionaries:](WLKStoreOffer, "offersWithSubscriptionDictionaries:", v64);
      v65 = objc_claimAutoreleasedReturnValue();
      subscriptionOffers = v8->_subscriptionOffers;
      v8->_subscriptionOffers = (NSArray *)v65;

    }
    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("punchoutUrls"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "copy");
    punchoutUrls = v8->_punchoutUrls;
    v8->_punchoutUrls = (NSDictionary *)v68;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("url"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "copy");

    v109 = (void *)v71;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v71);
    v72 = objc_claimAutoreleasedReturnValue();
    tvAppDeeplinkURL = v8->_tvAppDeeplinkURL;
    v8->_tvAppDeeplinkURL = (NSURL *)v72;

    -[WLKPlayable _localesArrayForDictionary:andKey:](v8, "_localesArrayForDictionary:andKey:", v6, CFSTR("closedCaptionedLocales"));
    v74 = objc_claimAutoreleasedReturnValue();
    closedCaptionLocales = v8->_closedCaptionLocales;
    v8->_closedCaptionLocales = (NSArray *)v74;

    -[WLKPlayable _localesArrayForDictionary:andKey:](v8, "_localesArrayForDictionary:andKey:", v6, CFSTR("subtitledLocales"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (v76)
      objc_storeStrong((id *)&v8->_subtitledLocales, v76);
    -[WLKPlayable _localesArrayForDictionary:andKey:](v8, "_localesArrayForDictionary:andKey:", v6, CFSTR("audioTrackLocales"));
    v77 = objc_claimAutoreleasedReturnValue();
    audioTrackLocales = v8->_audioTrackLocales;
    v8->_audioTrackLocales = (NSArray *)v77;

    -[WLKPlayable _localesArrayForDictionary:andKey:](v8, "_localesArrayForDictionary:andKey:", v6, CFSTR("adLocales"));
    v79 = objc_claimAutoreleasedReturnValue();
    adLocales = v8->_adLocales;
    v8->_adLocales = (NSArray *)v79;

    v81 = [WLKLocale alloc];
    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("primaryLocale"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = -[WLKLocale initWithDictionary:](v81, "initWithDictionary:", v82);
    primaryLocale = v8->_primaryLocale;
    v8->_primaryLocale = (WLKLocale *)v83;

    -[WLKPlayable _localesArrayForDictionary:andKey:](v8, "_localesArrayForDictionary:andKey:", v6, CFSTR("sdhLocales"));
    v85 = objc_claimAutoreleasedReturnValue();
    SDHLocales = v8->_SDHLocales;
    v8->_SDHLocales = (NSArray *)v85;

    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("playEvent"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (v87)
    {
      v88 = -[WLKPlayEvent initWithDictionary:]([WLKPlayEvent alloc], "initWithDictionary:", v87);
      playEvent = v8->_playEvent;
      v8->_playEvent = v88;

    }
    v8->_appInstalled = -[WLKChannelDetails isAppInstalled](v8->_channelDetails, "isAppInstalled");
    if (!v8->_itunes && !-[WLKChannelDetails isApSubscription](v8->_channelDetails, "isApSubscription"))
      goto LABEL_64;
    v90 = v8->_punchoutUrls;
    v107 = v45;
    v108 = v38;
    v91 = v9;
    v92 = v7;
    if (v90)
    {
      v93 = (void *)-[NSDictionary mutableCopy](v90, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v94 = v93;
    objc_msgSend(v93, "wlk_stringForKey:", CFSTR("open"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "length");

    if (!v96)
    {
      -[NSURL absoluteString](v8->_tvAppDeeplinkURL, "absoluteString");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      if (v97)
        objc_msgSend(v94, "setObject:forKey:", v97, CFSTR("open"));

    }
    if (!v8->_entitled
      || (objc_msgSend(v94, "wlk_stringForKey:", CFSTR("play")),
          v98 = (void *)objc_claimAutoreleasedReturnValue(),
          v99 = objc_msgSend(v98, "length"),
          v98,
          v99))
    {
LABEL_63:
      v104 = objc_msgSend(v94, "copy");
      v105 = v8->_punchoutUrls;
      v8->_punchoutUrls = (NSDictionary *)v104;

      v7 = v92;
      v9 = v91;
      v45 = v107;
      v38 = v108;
LABEL_64:

      goto LABEL_65;
    }
    if (objc_msgSend((id)objc_opt_class(), "isFullTVAppEnabled"))
    {
      +[WLKPlayableUtilities _punchoutURLForDirectPlayback:ignoreExtras:](WLKPlayableUtilities, "_punchoutURLForDirectPlayback:ignoreExtras:", v8->_tvAppDeeplinkURL, 1);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v100;
      if (v100)
      {
        objc_msgSend(v100, "absoluteString");
        v102 = objc_claimAutoreleasedReturnValue();
LABEL_58:
        v103 = (void *)v102;
LABEL_60:

        if (v103)
          objc_msgSend(v94, "setObject:forKey:", v103, CFSTR("play"));

        goto LABEL_63;
      }
    }
    else
    {
      objc_msgSend(v113, "wlk_stringForKey:", CFSTR("id"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      if (v101)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videos://play?adam-id=%@&allowCloudPlayback=1"), v101);
        v102 = objc_claimAutoreleasedReturnValue();
        goto LABEL_58;
      }
    }
    v103 = 0;
    goto LABEL_60;
  }
  v11 = 0;
LABEL_66:

  return v11;
}

void __42__WLKPlayable_initWithDictionary_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "channelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
    *a4 = 1;
  }

}

- (WLKPlayable)init
{
  return -[WLKPlayable initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WLKPlayable canonicalID](self, "canonicalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlayable channelDetails](self, "channelDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>; ID: %@, Channel: %@, Source Type: %ld, Entitled: %d"),
    v4,
    self,
    v5,
    v7,
    -[WLKPlayable contentSourceType](self, "contentSourceType"),
    -[WLKPlayable isEntitled](self, "isEntitled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)storeOffers
{
  void *v2;
  void *v3;

  -[WLKPlayable offerListing](self, "offerListing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeOffers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[WLKPlayable playableID](self, "playableID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playableID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[WLKPlayable canonicalID](self, "canonicalID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "canonicalID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_playableID, "hash");
  return -[NSString hash](self->_canonicalID, "hash") ^ v3;
}

- (id)playPunchoutURL
{
  return -[NSDictionary objectForKey:](self->_punchoutUrls, "objectForKey:", CFSTR("play"));
}

- (id)openPunchoutURL
{
  return -[NSDictionary objectForKey:](self->_punchoutUrls, "objectForKey:", CFSTR("open"));
}

- (WLKStoreOffer)bestStoreBuyOffer
{
  void *v2;
  void *v3;

  -[WLKPlayable offerListing](self, "offerListing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestStoreBuyOffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WLKStoreOffer *)v3;
}

- (WLKStoreOffer)bestStoreRentalOffer
{
  void *v2;
  void *v3;

  -[WLKPlayable offerListing](self, "offerListing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestStoreRentalOffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WLKStoreOffer *)v3;
}

- (WLKStoreOffer)bestStoreSubscriptionOffer
{
  void *v2;
  void *v3;

  -[WLKPlayable subscriptionOffers](self, "subscriptionOffers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WLKStoreOffer *)v3;
}

- (id)_localesArrayForDictionary:(id)a3 andKey:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a3, "wlk_arrayForKey:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__WLKPlayable__localesArrayForDictionary_andKey___block_invoke;
    v9[3] = &unk_1E68A8738;
    v10 = v5;
    v6 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    v7 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __49__WLKPlayable__localesArrayForDictionary_andKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WLKLocale *v4;
  WLKLocale *v5;

  v3 = a2;
  v5 = -[WLKLocale initWithDictionary:]([WLKLocale alloc], "initWithDictionary:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (NSString)playableID
{
  return self->_playableID;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (WLKChannelDetails)channelDetails
{
  return self->_channelDetails;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (int64_t)contentSourceType
{
  return self->_contentSourceType;
}

- (BOOL)isEntitled
{
  return self->_entitled;
}

- (BOOL)isEntitledAnywhere
{
  return self->_entitledAnywhere;
}

- (BOOL)isAppInstalled
{
  return self->_appInstalled;
}

- (BOOL)isiTunes
{
  return self->_itunes;
}

- (int64_t)airingType
{
  return self->_airingType;
}

- (WLKBasicContentMetadata)content
{
  return self->_content;
}

- (NSArray)adLocales
{
  return self->_adLocales;
}

- (NSArray)audioTrackLocales
{
  return self->_audioTrackLocales;
}

- (NSArray)audioTrackFormats
{
  return self->_audioTrackFormats;
}

- (NSArray)closedCaptionLocales
{
  return self->_closedCaptionLocales;
}

- (NSArray)SDHLocales
{
  return self->_SDHLocales;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (WLKLocale)primaryLocale
{
  return self->_primaryLocale;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)externalServiceID
{
  return self->_externalServiceID;
}

- (BOOL)isSubtitled
{
  return self->_subtitled;
}

- (NSArray)subtitledLocales
{
  return self->_subtitledLocales;
}

- (NSString)videoQuality
{
  return self->_videoQuality;
}

- (NSString)videoColorRange
{
  return self->_videoColorRange;
}

- (NSDate)endAirTime
{
  return self->_endAirTime;
}

- (NSDate)startAirTime
{
  return self->_startAirTime;
}

- (WLKPlayEvent)playEvent
{
  return self->_playEvent;
}

- (NSURL)tvAppDeeplinkURL
{
  return self->_tvAppDeeplinkURL;
}

- (NSDictionary)punchoutUrls
{
  return self->_punchoutUrls;
}

- (WLKComingSoonInfo)comingSoonInfo
{
  return self->_comingSoonInfo;
}

- (NSArray)movieClips
{
  return self->_movieClips;
}

- (NSArray)subscriptionOffers
{
  return self->_subscriptionOffers;
}

- (WLKOfferListing)offerListing
{
  return self->_offerListing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerListing, 0);
  objc_storeStrong((id *)&self->_subscriptionOffers, 0);
  objc_storeStrong((id *)&self->_movieClips, 0);
  objc_storeStrong((id *)&self->_comingSoonInfo, 0);
  objc_storeStrong((id *)&self->_punchoutUrls, 0);
  objc_storeStrong((id *)&self->_tvAppDeeplinkURL, 0);
  objc_storeStrong((id *)&self->_playEvent, 0);
  objc_storeStrong((id *)&self->_startAirTime, 0);
  objc_storeStrong((id *)&self->_endAirTime, 0);
  objc_storeStrong((id *)&self->_videoColorRange, 0);
  objc_storeStrong((id *)&self->_videoQuality, 0);
  objc_storeStrong((id *)&self->_subtitledLocales, 0);
  objc_storeStrong((id *)&self->_externalServiceID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_primaryLocale, 0);
  objc_storeStrong((id *)&self->_SDHLocales, 0);
  objc_storeStrong((id *)&self->_closedCaptionLocales, 0);
  objc_storeStrong((id *)&self->_audioTrackFormats, 0);
  objc_storeStrong((id *)&self->_audioTrackLocales, 0);
  objc_storeStrong((id *)&self->_adLocales, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_channelDetails, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_playableID, 0);
}

@end
