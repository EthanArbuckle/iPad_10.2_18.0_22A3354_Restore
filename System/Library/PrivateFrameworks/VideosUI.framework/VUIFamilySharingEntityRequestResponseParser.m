@implementation VUIFamilySharingEntityRequestResponseParser

- (VUIFamilySharingEntityRequestResponseParser)init
{
  VUIFamilySharingEntityRequestResponseParser *v2;
  os_log_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIFamilySharingEntityRequestResponseParser;
  v2 = -[VUIFamilySharingEntityRequestResponseParser init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.tv.mediaAPI", "VUIFamilySharingEntityRequestResponseParser");
    v4 = (void *)sLogObject;
    sLogObject = (uint64_t)v3;

  }
  return v2;
}

- (id)parseAMSURLResult:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[16];

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vui_arrayForKey:", CFSTR("data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIFamilySharingEntityRequestResponseParser _processRawMediaEntities:](self, "_processRawMediaEntities:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = sLogObject;
    if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Parsing AMS Purchases Fetch with no object dictionary", v12, 2u);
    }
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

+ (id)mediaEntityFromAMSEntityDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  VUIFamilySharingMediaItem *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  VUIFamilySharingEntity *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  VUIFamilySharingMediaItem *v32;
  void *v33;
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
  uint8_t v57[16];
  uint8_t v58[16];
  uint8_t v59[16];
  uint8_t v60[16];
  uint8_t v61[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "vui_stringForKey:", CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("relationships"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(a1, "_parseRelationshipBag:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("attributes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "vui_arrayForKey:", CFSTR("offers"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v55 = v13;
          objc_msgSend(v12, "vui_arrayForKey:", CFSTR("personalizedOffers"));
          v14 = objc_claimAutoreleasedReturnValue();
          v53 = (void *)v14;
          if (v14)
            v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC87E8]), "initWithMAPIDictionaries:", v14);
          else
            v56 = 0;
          objc_msgSend(v12, "vui_arrayForKey:", CFSTR("genreNames"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v54 = v17;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v17, "firstObject");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "vui_numberForKey:", CFSTR("episodeSeasonNumber"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "vui_numberForKey:", CFSTR("episodeNumber"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "vui_stringForKey:", CFSTR("iTunesExtrasUrl"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v55;
            v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC87E8]), "initWithMAPIDictionaries:", v55);
            objc_msgSend(v12, "vui_dictionaryForKey:", CFSTR("description"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "vui_stringForKey:", CFSTR("standard"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "vui_dictionaryForKey:", CFSTR("widescreenArtwork"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v40 = v18;
              objc_msgSend(v18, "vui_stringForKey:", CFSTR("url"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "vui_stringForKey:", CFSTR("releaseDate"));
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = objc_alloc_init(MEMORY[0x1E0CB3578]);
              objc_msgSend(v20, "setDateFormat:", CFSTR("yyyy-MM-dd"));
              v38 = v20;
              objc_msgSend(v20, "dateFromString:", v19);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "vui_dictionaryForKey:", CFSTR("contentRatingsBySystem"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "_parseContentRatingBag:");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "vui_dictionaryForKey:", CFSTR("previewArtwork"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "vui_stringForKey:", CFSTR("url"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "vui_stringForKey:", CFSTR("name"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = (void *)v19;
              if (objc_msgSend(v6, "isEqualToString:", CFSTR("movies")))
              {
                +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else if (objc_msgSend(v6, "isEqualToString:", CFSTR("tv-episodes")))
              {
                +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                NSLog(CFSTR("UNEXPECTEDTYPE:%@"), v6);
                v22 = v21;
              }
              objc_msgSend(v12, "vui_arrayForKey:", CFSTR("capabilities"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_alloc_init(VUIFamilySharingEntity);
              +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v22, "isEqual:", v28);

              if (v29)
              {
                objc_msgSend(v12, "vui_stringForKey:", CFSTR("artistName"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[VUIFamilySharingEntity setShowTitle:](v27, "setShowTitle:", v30);

              }
              -[VUIFamilySharingEntity setIdentifier:](v27, "setIdentifier:", v5);
              -[VUIFamilySharingEntity setType:](v27, "setType:", v22);
              -[VUIFamilySharingEntity setTitle:](v27, "setTitle:", v41);
              -[VUIFamilySharingEntity setArtworkURL:](v27, "setArtworkURL:", v45);
              -[VUIFamilySharingEntity setPreviewArtworkURL:](v27, "setPreviewArtworkURL:", v42);
              -[VUIFamilySharingEntity setOfferListing:](v27, "setOfferListing:", v48);
              -[VUIFamilySharingEntity setRelationships:](v27, "setRelationships:", v8);
              -[VUIFamilySharingEntity setEpisodeNumber:](v27, "setEpisodeNumber:", v50);
              -[VUIFamilySharingEntity setSeasonNumber:](v27, "setSeasonNumber:", v51);
              -[VUIFamilySharingEntity setStandardDescription:](v27, "setStandardDescription:", v47);
              -[VUIFamilySharingEntity setReleaseDate:](v27, "setReleaseDate:", v44);
              -[VUIFamilySharingEntity setContentRating:](v27, "setContentRating:", v43);
              -[VUIFamilySharingEntity setGenreTitle:](v27, "setGenreTitle:", v52);
              -[VUIFamilySharingEntity setPersonalizedOfferListing:](v27, "setPersonalizedOfferListing:", v56);
              -[VUIFamilySharingEntity setITunesExtrasUrl:](v27, "setITunesExtrasUrl:", v49);
              if (objc_msgSend(v35, "count"))
              {
                objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v35);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[VUIFamilySharingEntity setCapabilities:](v27, "setCapabilities:", v31);

              }
              v32 = [VUIFamilySharingMediaItem alloc];
              VUIMediaEntityFetchRequestAllPropertiesSet();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = -[VUIFamilySharingMediaItem initWithAMSEntity:requestedProperties:](v32, "initWithAMSEntity:requestedProperties:", v27, v33);

              v13 = v55;
              v25 = v40;
              v24 = v53;
            }
            else
            {
              v25 = v18;
              v26 = sLogObject;
              if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v57 = 0;
                _os_log_impl(&dword_1D96EE000, v26, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no preview artwork dictionary", v57, 2u);
              }
              v10 = 0;
              v24 = v53;
            }

          }
          else
          {
            v23 = sLogObject;
            if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v58 = 0;
              _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no genre array", v58, 2u);
            }
            v10 = 0;
            v13 = v55;
            v24 = v53;
          }

        }
        else
        {
          v16 = sLogObject;
          if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v59 = 0;
            _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no offers array", v59, 2u);
          }
          v10 = 0;
        }

      }
      else
      {
        v15 = sLogObject;
        if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v60 = 0;
          _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no attribute dictionary", v60, 2u);
        }
        v10 = 0;
      }

    }
    else
    {
      v11 = sLogObject;
      if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v61 = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no type provided", v61, 2u);
      }
      v10 = 0;
    }

  }
  else
  {
    v9 = sLogObject;
    if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no entity provided", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)_processRawMediaEntities:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[VUIFamilySharingEntityRequestResponseParser mediaEntityFromAMSEntityDictionary:](VUIFamilySharingEntityRequestResponseParser, "mediaEntityFromAMSEntityDictionary:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v4, "addObject:", v11);

        }
        else
        {
          v12 = sLogObject;
          if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch invalid entity dictionary", v15, 2u);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

+ (id)_parseRelationshipBag:(id)a3
{
  id v4;
  VUIFamilySharingRelationships *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v14[16];

  v4 = a3;
  v5 = objc_alloc_init(VUIFamilySharingRelationships);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("seasons"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_parseRelationship:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFamilySharingRelationships setSeason:](v5, "setSeason:", v7);
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("shows"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_parseRelationship:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFamilySharingRelationships setShow:](v5, "setShow:", v9);
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("playback-position"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_parsePlaybackPositionBag:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFamilySharingRelationships setPlaybackPosition:](v5, "setPlaybackPosition:", v11);

  }
  else
  {
    v12 = sLogObject;
    if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Parsing relationship bag thats not a dictionary", v14, 2u);
    }
  }

  return v5;
}

+ (id)_parsePlaybackPositionBag:(id)a3
{
  id v3;
  VUIFamilySharingPlaybackPositionRelationship *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init(VUIFamilySharingPlaybackPositionRelationship);
  objc_msgSend(v3, "vui_arrayForKey:", CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "vui_stringForKey:", CFSTR("id"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIFamilySharingRelationship setIdentifier:](v4, "setIdentifier:", v8);
      objc_msgSend(v7, "vui_dictionaryForKey:", CFSTR("attributes"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "vui_dateForKey:", CFSTR("recordedAtTimestamp"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIFamilySharingPlaybackPositionRelationship setRecordedAtTimestamp:](v4, "setRecordedAtTimestamp:", v11);
        objc_msgSend(v10, "vui_numberForKey:", CFSTR("positionInMilliseconds"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIFamilySharingPlaybackPositionRelationship setPositionInMilliseconds:](v4, "setPositionInMilliseconds:", v12);

      }
    }

  }
  return v4;
}

+ (id)_parseContentRatingBag:(id)a3
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
  __CFString *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint8_t v18[16];

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "vui_stringForKey:", CFSTR("name"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "vui_numberForKey:", CFSTR("value"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "vui_arrayForKey:", CFSTR("advisories"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "firstObject");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = &stru_1E9FF3598;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v16 = objc_msgSend(v9, "unsignedIntegerValue");
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC69A0]), "initWithRatingSystemString:ratingLabel:rank:ratingDescription:", v5, v8, v16, v12);
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
    v14 = v15;

  }
  else
  {
    v13 = sLogObject;
    if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Parsing content rating bag thats not a dictionary", v18, 2u);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)_parseRelationship:(id)a3
{
  id v4;
  VUIFamilySharingRelationship *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  VUIFamilySharingRelationship *v19;
  NSObject *v20;
  VUIFamilySharingRelationship *v21;
  VUIFamilySharingRelationship *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_alloc_init(VUIFamilySharingRelationship);
  objc_msgSend(v4, "vui_arrayForKey:", CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_14;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "vui_stringForKey:", CFSTR("id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFamilySharingRelationship setIdentifier:](v5, "setIdentifier:", v9);
    objc_msgSend(v8, "vui_dictionaryForKey:", CFSTR("attributes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "vui_dictionaryForKey:", CFSTR("contentRatingsBySystem"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_parseContentRatingBag:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIFamilySharingRelationship setContentRating:](v5, "setContentRating:");
      objc_msgSend(v10, "vui_dictionaryForKey:", CFSTR("description"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "vui_stringForKey:", CFSTR("standard"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIFamilySharingRelationship setStandardDescription:](v5, "setStandardDescription:");
      objc_msgSend(v10, "vui_stringForKey:", CFSTR("releaseDate"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v12, "setDateFormat:", CFSTR("yyyy-MM-dd"));
      v25 = (void *)v11;
      objc_msgSend(v12, "dateFromString:", v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIFamilySharingRelationship setReleaseDate:](v5, "setReleaseDate:");
      objc_msgSend(v10, "vui_arrayForKey:", CFSTR("genreNames"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIFamilySharingRelationship setGenreTitle:](v5, "setGenreTitle:", v15);

      }
      objc_msgSend(v10, "vui_dictionaryForKey:", CFSTR("widescreenArtwork"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v16, "vui_stringForKey:", CFSTR("url"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIFamilySharingRelationship setArtworkURL:](v5, "setArtworkURL:", v18);

      }
      else
      {
        v20 = sLogObject;
        if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no preview artwork dictionary", buf, 2u);
        }
        v21 = v5;
      }

      if ((isKindOfClass & 1) != 0)
        goto LABEL_13;
    }
    else
    {
      v19 = v5;

    }
    goto LABEL_16;
  }
LABEL_13:

LABEL_14:
  v22 = v5;
LABEL_16:

  return v5;
}

@end
