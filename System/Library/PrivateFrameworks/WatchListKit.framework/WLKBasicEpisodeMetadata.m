@implementation WLKBasicEpisodeMetadata

+ (id)episodesWithDictionaries:(id)a3 context:(id)a4
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
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = objc_alloc((Class)a1);
          v16 = (void *)objc_msgSend(v15, "initWithDictionary:context:", v14, v7, (_QWORD)v18);
          objc_msgSend(v8, "addObject:", v16);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

- (WLKBasicEpisodeMetadata)initWithDictionary:(id)a3
{
  return -[WLKBasicEpisodeMetadata initWithDictionary:context:](self, "initWithDictionary:context:", a3, 0);
}

- (WLKBasicEpisodeMetadata)initWithDictionary:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  WLKBasicEpisodeMetadata *v8;
  void *v9;
  uint64_t v10;
  NSString *showTitle;
  void *v12;
  uint64_t v13;
  NSString *canonicalShowID;
  void *v15;
  uint64_t v16;
  NSString *canonicalSeasonID;
  uint64_t v18;
  NSNumber *seasonNumber;
  uint64_t v20;
  NSNumber *episodeNumber;
  uint64_t v22;
  NSString *seasonTitle;
  void *v24;
  double v25;
  uint64_t v26;
  NSDate *releaseDate;
  uint64_t v28;
  WLKArtworkVariantListing *showImages;
  uint64_t v30;
  WLKArtworkVariantListing *seasonImages;
  WLKPlayable *v32;
  void *v33;
  uint64_t v34;
  WLKPlayable *playable;
  objc_super v37;

  v6 = a3;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)WLKBasicEpisodeMetadata;
  v8 = -[WLKBasicContentMetadata initWithDictionary:](&v37, sel_initWithDictionary_, v6);
  if (v8)
  {
    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("showTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    showTitle = v8->_showTitle;
    v8->_showTitle = (NSString *)v10;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("showId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    canonicalShowID = v8->_canonicalShowID;
    v8->_canonicalShowID = (NSString *)v13;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("seasonId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    canonicalSeasonID = v8->_canonicalSeasonID;
    v8->_canonicalSeasonID = (NSString *)v16;

    objc_msgSend(v6, "wlk_numberForKey:", CFSTR("seasonNumber"));
    v18 = objc_claimAutoreleasedReturnValue();
    seasonNumber = v8->_seasonNumber;
    v8->_seasonNumber = (NSNumber *)v18;

    objc_msgSend(v6, "wlk_numberForKey:", CFSTR("episodeNumber"));
    v20 = objc_claimAutoreleasedReturnValue();
    episodeNumber = v8->_episodeNumber;
    v8->_episodeNumber = (NSNumber *)v20;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("seasonTitle"));
    v22 = objc_claimAutoreleasedReturnValue();
    seasonTitle = v8->_seasonTitle;
    v8->_seasonTitle = (NSString *)v22;

    objc_msgSend(v6, "wlk_numberForKey:", CFSTR("duration"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v8->_duration = v25;

    objc_msgSend(v6, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("releaseDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    releaseDate = v8->_releaseDate;
    v8->_releaseDate = (NSDate *)v26;

    objc_msgSend(v6, "wlk_artworkVariantListingForKey:", CFSTR("showImages"));
    v28 = objc_claimAutoreleasedReturnValue();
    showImages = v8->_showImages;
    v8->_showImages = (WLKArtworkVariantListing *)v28;

    objc_msgSend(v6, "wlk_artworkVariantListingForKey:", CFSTR("seasonImages"));
    v30 = objc_claimAutoreleasedReturnValue();
    seasonImages = v8->_seasonImages;
    v8->_seasonImages = (WLKArtworkVariantListing *)v30;

    v32 = [WLKPlayable alloc];
    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("playable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[WLKPlayable initWithDictionary:context:](v32, "initWithDictionary:context:", v33, v7);
    playable = v8->_playable;
    v8->_playable = (WLKPlayable *)v34;

  }
  return v8;
}

- (WLKBasicEpisodeMetadata)initWithDictionary:(id)a3 context:(id)a4 playablesDict:(id)a5 playablesId:(id)a6 seasonsDict:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WLKBasicEpisodeMetadata *v17;
  void *v18;
  uint64_t v19;
  NSString *showTitle;
  void *v21;
  uint64_t v22;
  NSString *canonicalShowID;
  void *v24;
  uint64_t v25;
  NSString *canonicalSeasonID;
  uint64_t v27;
  NSNumber *seasonNumber;
  uint64_t v29;
  NSNumber *episodeNumber;
  uint64_t v31;
  NSString *seasonTitle;
  void *v33;
  double v34;
  uint64_t v35;
  NSDate *releaseDate;
  uint64_t v37;
  WLKArtworkVariantListing *showImages;
  uint64_t v39;
  WLKArtworkVariantListing *seasonImages;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  WLKPlayable *v48;
  WLKPlayable *playable;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v58.receiver = self;
  v58.super_class = (Class)WLKBasicEpisodeMetadata;
  v17 = -[WLKBasicContentMetadata initWithDictionary:](&v58, sel_initWithDictionary_, v12);
  if (v17)
  {
    objc_msgSend(v12, "wlk_stringForKey:", CFSTR("showTitle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    showTitle = v17->_showTitle;
    v17->_showTitle = (NSString *)v19;

    objc_msgSend(v12, "wlk_stringForKey:", CFSTR("showId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    canonicalShowID = v17->_canonicalShowID;
    v17->_canonicalShowID = (NSString *)v22;

    objc_msgSend(v12, "wlk_stringForKey:", CFSTR("seasonId"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    canonicalSeasonID = v17->_canonicalSeasonID;
    v17->_canonicalSeasonID = (NSString *)v25;

    objc_msgSend(v12, "wlk_numberForKey:", CFSTR("seasonNumber"));
    v27 = objc_claimAutoreleasedReturnValue();
    seasonNumber = v17->_seasonNumber;
    v17->_seasonNumber = (NSNumber *)v27;

    objc_msgSend(v12, "wlk_numberForKey:", CFSTR("episodeNumber"));
    v29 = objc_claimAutoreleasedReturnValue();
    episodeNumber = v17->_episodeNumber;
    v17->_episodeNumber = (NSNumber *)v29;

    objc_msgSend(v12, "wlk_stringForKey:", CFSTR("seasonTitle"));
    v31 = objc_claimAutoreleasedReturnValue();
    seasonTitle = v17->_seasonTitle;
    v17->_seasonTitle = (NSString *)v31;

    objc_msgSend(v12, "wlk_numberForKey:", CFSTR("duration"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v17->_duration = v34;

    objc_msgSend(v12, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("releaseDate"));
    v35 = objc_claimAutoreleasedReturnValue();
    releaseDate = v17->_releaseDate;
    v17->_releaseDate = (NSDate *)v35;

    objc_msgSend(v12, "wlk_artworkVariantListingForKey:", CFSTR("images"));
    v37 = objc_claimAutoreleasedReturnValue();
    showImages = v17->_showImages;
    v17->_showImages = (WLKArtworkVariantListing *)v37;

    v52 = v16;
    objc_msgSend(v16, "wlk_artworkVariantListingForKey:", CFSTR("images"));
    v39 = objc_claimAutoreleasedReturnValue();
    seasonImages = v17->_seasonImages;
    v17->_seasonImages = (WLKArtworkVariantListing *)v39;

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v53 = v15;
    v41 = v15;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v55;
      v51 = v13;
      while (2)
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v55 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "wlk_stringForKey:", CFSTR("playableId"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "wlk_dictionaryForKey:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            v13 = v51;
            v48 = -[WLKPlayable initWithDictionary:context:]([WLKPlayable alloc], "initWithDictionary:context:", v47, v51);
            playable = v17->_playable;
            v17->_playable = v48;

            goto LABEL_12;
          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        v13 = v51;
        if (v43)
          continue;
        break;
      }
    }
LABEL_12:

    v16 = v52;
    v15 = v53;
  }

  return v17;
}

- (NSString)showTitle
{
  return self->_showTitle;
}

- (NSString)canonicalShowID
{
  return self->_canonicalShowID;
}

- (NSString)canonicalSeasonID
{
  return self->_canonicalSeasonID;
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (NSString)seasonTitle
{
  return self->_seasonTitle;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (WLKArtworkVariantListing)showImages
{
  return self->_showImages;
}

- (WLKArtworkVariantListing)seasonImages
{
  return self->_seasonImages;
}

- (WLKPlayable)playable
{
  return self->_playable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playable, 0);
  objc_storeStrong((id *)&self->_seasonImages, 0);
  objc_storeStrong((id *)&self->_showImages, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_seasonTitle, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_storeStrong((id *)&self->_canonicalSeasonID, 0);
  objc_storeStrong((id *)&self->_canonicalShowID, 0);
  objc_storeStrong((id *)&self->_showTitle, 0);
}

@end
