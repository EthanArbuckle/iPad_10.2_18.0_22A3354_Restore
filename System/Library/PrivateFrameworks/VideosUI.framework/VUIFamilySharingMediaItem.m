@implementation VUIFamilySharingMediaItem

- (VUIFamilySharingMediaItem)initWithAMSEntity:(id)a3 requestedProperties:(id)a4
{
  id v7;
  id v8;
  VUIFamilySharingMediaEntityIdentifier *v9;
  void *v10;
  void *v11;
  VUIFamilySharingMediaEntityIdentifier *v12;
  void *v13;
  VUIFamilySharingMediaItem *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = [VUIFamilySharingMediaEntityIdentifier alloc];
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VUIFamilySharingMediaEntityIdentifier initWithEntityIdentifier:mediaEntityType:](v9, "initWithEntityIdentifier:mediaEntityType:", v10, v11);

  VUIFamilySharingMediaItemKind();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)VUIFamilySharingMediaItem;
  v14 = -[VUIMediaEntity initWithMediaLibrary:identifier:requestedProperties:kind:](&v16, sel_initWithMediaLibrary_identifier_requestedProperties_kind_, 0, v12, v8, v13);

  if (v14)
    objc_storeStrong((id *)&v14->_entity, a3);

  return v14;
}

- (id)storeID
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v4, "setNumberStyle:", 1);
    objc_msgSend(v4, "numberFromString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VUIFamilySharingMediaItem entity](self, "entity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E9FF3598;
  }
  return v6;
}

- (NSString)artworkURL
{
  NSString **p_artworkURL;
  NSString *artworkURL;
  NSString *v4;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  p_artworkURL = &self->_artworkURL;
  artworkURL = self->_artworkURL;
  if (artworkURL)
  {
    v4 = artworkURL;
  }
  else
  {
    -[VUIFamilySharingMediaItem entity](self, "entity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "artworkURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[VUIFamilySharingMediaItem entity](self, "entity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "artworkURL");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)p_artworkURL, v9);
    }
    else
    {
      v9 = &stru_1E9FF3598;
    }
    v4 = *p_artworkURL;

  }
  return v4;
}

- (id)extrasURL
{
  void *v2;
  void *v3;
  void *v4;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iTunesExtrasUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (VUIExtrasInfo)iTunesExtrasInfo
{
  VUIExtrasInfo *iTunesExtrasInfo;
  VUIExtrasInfo *v3;
  void *v5;
  VUIExtrasInfo *v6;
  VUIExtrasInfo *v7;
  VUIExtrasInfo *v8;

  iTunesExtrasInfo = self->_iTunesExtrasInfo;
  if (iTunesExtrasInfo)
  {
    v3 = iTunesExtrasInfo;
  }
  else
  {
    -[VUIFamilySharingMediaItem _itunesExtrasDictionary](self, "_itunesExtrasDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VUIExtrasInfo initWithDictionary:]([VUIExtrasInfo alloc], "initWithDictionary:", v5);
    v7 = self->_iTunesExtrasInfo;
    self->_iTunesExtrasInfo = v6;
    v8 = v6;

    v3 = self->_iTunesExtrasInfo;
  }
  return v3;
}

- (NSString)previewArtworkURL
{
  NSString **p_previewArtworkURL;
  NSString *previewArtworkURL;
  NSString *v4;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  p_previewArtworkURL = &self->_previewArtworkURL;
  previewArtworkURL = self->_previewArtworkURL;
  if (previewArtworkURL)
  {
    v4 = previewArtworkURL;
  }
  else
  {
    -[VUIFamilySharingMediaItem entity](self, "entity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewArtworkURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[VUIFamilySharingMediaItem entity](self, "entity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "previewArtworkURL");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)p_previewArtworkURL, v9);
    }
    else
    {
      v9 = &stru_1E9FF3598;
    }
    v4 = *p_previewArtworkURL;

  }
  return v4;
}

- (VUIVideosPlayable)videosPlayable
{
  VUIVideosPlayable *videosPlayable;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
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
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  __CFString **v38;
  void *v39;
  _QWORD *v40;
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
  uint64_t v52;
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
  VUIVideosPlayable *v63;
  VUIVideosPlayable *v64;
  VUIVideosPlayable *v65;
  VUIVideosPlayable *v66;
  __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint8_t buf[16];
  _QWORD v76[2];

  v76[1] = *MEMORY[0x1E0C80C00];
  videosPlayable = self->_videosPlayable;
  if (videosPlayable)
    return videosPlayable;
  -[VUIFamilySharingMediaItem _itunesExtrasDictionary](self, "_itunesExtrasDictionary");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingMediaItem _bestRedownloadOffer](self, "_bestRedownloadOffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "[VUIFamilySharingMediaItem] - No personalized redownload offer found. Falling back to buy offers", buf, 2u);
    }

    -[VUIFamilySharingMediaItem _bestOffer](self, "_bestOffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[VUIFamilySharingMediaItem entity](self, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionary");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "objectForKey:", CFSTR("hlsUrl"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v73, "length"))
  {
    objc_msgSend(v5, "setObject:forKey:", v73, CFSTR("hlsUrl"));
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v73);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "vui_URLByAddingQueryParamWithName:value:", CFSTR("playback-type"), CFSTR("download"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "length"))
      objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("hlsDownloadUrl"));

  }
  v72 = v7;
  objc_msgSend(v7, "buyParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v15, CFSTR("buyParams"));

  objc_msgSend(v5, "setValue:forKey:", v11, CFSTR("mediaType"));
  objc_msgSend(v5, "setValue:forKey:", &unk_1EA0B98B0, CFSTR("sharedPurchase"));
  objc_msgSend(v5, "setValue:forKey:", *MEMORY[0x1E0DC88E0], CFSTR("channelId"));
  -[VUIFamilySharingMediaItem entity](self, "entity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v17, CFSTR("externalId"));

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v19, CFSTR("bookmarkId"));

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v21, CFSTR("adamId"));

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "relationships");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "show");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = objc_claimAutoreleasedReturnValue();

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "relationships");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "season");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "identifier");
  v29 = objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v5, "setObject:forKey:", v25, CFSTR("showAdamID"));
  if (v29)
    objc_msgSend(v5, "setObject:forKey:", v29, CFSTR("seasonAdamID"));
  v69 = (void *)v25;
  if (v74)
    objc_msgSend(v5, "setValue:forKey:", v74, CFSTR("extras"));
  -[VUIFamilySharingMediaItem entity](self, "entity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "contentRating");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "rank");

  v33 = objc_msgSend(v11, "rangeOfString:", CFSTR("Movie"));
  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = (void *)v29;
  if (v10 == v34)
  {
    v38 = VUIContentMetadataTypeMovie;
  }
  else
  {
    +[VUIMediaEntityType show](VUIMediaEntityType, "show");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v35)
    {
      v38 = VUIContentMetadataTypeShow;
    }
    else
    {
      +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v36)
      {
        v37 = 0;
        goto LABEL_25;
      }
      v38 = VUIContentMetadataTypeEpisode;
    }
  }
  v37 = *v38;
LABEL_25:
  v71 = v11;
  v67 = v37;
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v37, CFSTR("type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v32);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v39, CFSTR("ratingValue"));

  v40 = (_QWORD *)MEMORY[0x1E0DB1A30];
  if (v33 == 0x7FFFFFFFFFFFFFFFLL)
    v40 = (_QWORD *)MEMORY[0x1E0DB1A38];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", *v40, CFSTR("ratingDomain"));
  -[VUIFamilySharingMediaItem entity](self, "entity");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "title");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v42, CFSTR("title"));

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "showTitle");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v44, CFSTR("showTitle"));

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "episodeNumber");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v46, CFSTR("episodeNumber"));

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "seasonNumber");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v48, CFSTR("seasonNumber"));

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "artworkURL");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v50, "length"))
    goto LABEL_34;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setObject:forKey:", v50, CFSTR("url"));
  objc_msgSend(v51, "setObject:forKey:", &unk_1EA0B98C8, CFSTR("width"));
  objc_msgSend(v51, "setObject:forKey:", &unk_1EA0B98E0, CFSTR("height"));
  objc_msgSend(v6, "setObject:forKey:", v51, CFSTR("artwork"));
  +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = v10;
  if (v10 == (void *)v52)
  {

LABEL_32:
    objc_msgSend(v6, "setObject:forKey:", v51, CFSTR("showArtwork"));
    goto LABEL_33;
  }
  v54 = (void *)v52;
  +[VUIMediaEntityType show](VUIMediaEntityType, "show");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v53;
  if (v53 == v55)
    goto LABEL_32;
LABEL_33:

LABEL_34:
  v56 = v10;
  -[VUIFamilySharingMediaItem entity](self, "entity");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "previewArtworkURL");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v58, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setObject:forKey:", v58, CFSTR("url"));
    objc_msgSend(v59, "setObject:forKey:", &unk_1EA0B98C8, CFSTR("width"));
    objc_msgSend(v59, "setObject:forKey:", &unk_1EA0B98E0, CFSTR("height"));
    objc_msgSend(v6, "setObject:forKey:", v59, CFSTR("previewFrameArtwork"));

  }
  v60 = (void *)objc_msgSend(v5, "copy");
  v76[0] = v60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIVideosPlayable videosPlayablesFromDictionaries:andMetadataDictionary:](VUIVideosPlayable, "videosPlayablesFromDictionaries:andMetadataDictionary:", v61, v6);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v62, "firstObject");
  v63 = (VUIVideosPlayable *)objc_claimAutoreleasedReturnValue();
  v64 = self->_videosPlayable;
  self->_videosPlayable = v63;
  v65 = v63;

  v66 = self->_videosPlayable;
  return v66;
}

- (id)showIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VUIFamilySharingMediaEntityIdentifier *v9;
  void *v10;
  VUIFamilySharingMediaEntityIdentifier *v11;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relationships");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VUIFamilySharingMediaItem entity](self, "entity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relationships");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "show");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [VUIFamilySharingMediaEntityIdentifier alloc];
    +[VUIMediaEntityType show](VUIMediaEntityType, "show");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[VUIFamilySharingMediaEntityIdentifier initWithEntityIdentifier:mediaEntityType:](v9, "initWithEntityIdentifier:mediaEntityType:", v8, v10);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)seasonIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VUIFamilySharingMediaEntityIdentifier *v9;
  void *v10;
  VUIFamilySharingMediaEntityIdentifier *v11;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relationships");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VUIFamilySharingMediaItem entity](self, "entity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relationships");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "season");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [VUIFamilySharingMediaEntityIdentifier alloc];
    +[VUIMediaEntityType season](VUIMediaEntityType, "season");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[VUIFamilySharingMediaEntityIdentifier initWithEntityIdentifier:mediaEntityType:](v9, "initWithEntityIdentifier:mediaEntityType:", v8, v10);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)seasonCanonicalID
{
  return &stru_1E9FF3598;
}

- (id)showCanonicalID
{
  return &stru_1E9FF3598;
}

- (id)episodeNumber
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "episodeNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)seasonNumber
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "seasonNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)showTitle
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)genreTitle
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "genreTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bookmark
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;

  -[VUIFamilySharingMediaItem relationships](self, "relationships");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackPosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  if (v3)
  {
    objc_msgSend(v3, "positionInMilliseconds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    *(float *)&v9 = v8 / 1000.0;
    objc_msgSend(v6, "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LODWORD(v4) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)duration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  -[VUIFamilySharingMediaItem _bestOffer](self, "_bestOffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vui_numberForKey:", CFSTR("durationInMilliseconds"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v5, "doubleValue"), v6 / 1000.0 > 0.0))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)releaseDate
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)releaseYear
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[VUIFamilySharingMediaItem releaseDate](self, "releaseDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "components:fromDate:", 4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "year");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contentRating
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentRating");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contentDescription
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "standardDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (VUIFamilySharingRelationships)relationships
{
  VUIFamilySharingRelationships *relationships;
  void *v4;
  VUIFamilySharingRelationships *v5;
  VUIFamilySharingRelationships *v6;

  relationships = self->_relationships;
  if (!relationships)
  {
    -[VUIFamilySharingMediaItem entity](self, "entity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relationships");
    v5 = (VUIFamilySharingRelationships *)objc_claimAutoreleasedReturnValue();
    v6 = self->_relationships;
    self->_relationships = v5;

    relationships = self->_relationships;
  }
  return relationships;
}

- (BOOL)isFamilySharingContent
{
  return 1;
}

- (id)_bestOffer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "offerListing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestStoreBuyOffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[VUIFamilySharingMediaItem entity](self, "entity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "offerListing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bestStoreGetOffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_bestRedownloadOffer
{
  void *v2;
  void *v3;
  void *v4;

  -[VUIFamilySharingMediaItem entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personalizedOfferListing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestStoreRedownloadOffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)buyParams
{
  NSString *buyParams;
  NSString *v3;
  void *v5;
  void *v6;
  __CFString *v7;
  NSString *v8;

  buyParams = self->_buyParams;
  if (buyParams)
  {
    v3 = buyParams;
  }
  else
  {
    -[VUIFamilySharingMediaItem _bestOffer](self, "_bestOffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "buyParameters");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = &stru_1E9FF3598;
    }
    v8 = self->_buyParams;
    self->_buyParams = &v7->isa;

    v3 = self->_buyParams;
  }
  return v3;
}

- (NSString)personalizedBuyParams
{
  NSString *personalizedBuyParams;
  NSString *v3;
  void *v5;
  void *v6;
  __CFString *v7;
  NSString *v8;

  personalizedBuyParams = self->_personalizedBuyParams;
  if (personalizedBuyParams)
  {
    v3 = personalizedBuyParams;
  }
  else
  {
    -[VUIFamilySharingMediaItem _bestRedownloadOffer](self, "_bestRedownloadOffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "buyParameters");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = &stru_1E9FF3598;
    }
    v8 = self->_personalizedBuyParams;
    self->_personalizedBuyParams = &v7->isa;

    v3 = self->_personalizedBuyParams;
  }
  return v3;
}

- (VUIMediaEntityAssetController)assetController
{
  VUIMediaEntityAssetController *assetController;
  VUIUniversalAssetController *v4;
  void *v5;
  VUIMediaEntityAssetController *v6;
  VUIMediaEntityAssetController *v7;

  assetController = self->_assetController;
  if (!assetController)
  {
    v4 = [VUIUniversalAssetController alloc];
    -[VUIFamilySharingMediaItem videosPlayable](self, "videosPlayable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VUIUniversalAssetController initWithVideosPlayable:](v4, "initWithVideosPlayable:", v5);
    v7 = self->_assetController;
    self->_assetController = v6;

    assetController = self->_assetController;
  }
  return assetController;
}

- (id)_itunesExtrasDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VUIFamilySharingMediaItem entity](self, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iTunesExtrasUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("extrasUrl"));
    -[VUIFamilySharingMediaItem _bestRedownloadOffer](self, "_bestRedownloadOffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buyParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("buyParams"));

    -[VUIFamilySharingMediaItem storeID](self, "storeID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("adamId"));

    -[VUIFamilySharingMediaItem contentRating](self, "contentRating");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "rank");
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setValue:forKey:", v12, CFSTR("ratingValue"));

      }
    }

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (id)resolution
{
  void *v2;
  int v3;

  -[VUIFamilySharingEntity capabilities](self->_entity, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("4K"));

  if (v3)
    return &unk_1EA0B98F8;
  else
    return 0;
}

- (id)colorCapability
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  int v8;

  -[VUIFamilySharingEntity capabilities](self->_entity, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("dolbyVision"));

  if ((v4 & 1) != 0)
    return &unk_1EA0B9910;
  -[VUIFamilySharingEntity capabilities](self->_entity, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", CFSTR("HDR")))
  {

    return &unk_1EA0B9928;
  }
  -[VUIFamilySharingEntity capabilities](self->_entity, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("HDR10+"));

  if (v8)
    return &unk_1EA0B9928;
  return 0;
}

- (id)audioCapability
{
  void *v2;
  int v3;

  -[VUIFamilySharingEntity capabilities](self->_entity, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("dolbyAtmos"));

  if (v3)
    return &unk_1EA0B9928;
  else
    return 0;
}

- (void)setArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURL, a3);
}

- (void)setPreviewArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_previewArtworkURL, a3);
}

- (void)setITunesExtrasInfo:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesExtrasInfo, a3);
}

- (void)setRelationships:(id)a3
{
  objc_storeStrong((id *)&self->_relationships, a3);
}

- (void)setVideosPlayable:(id)a3
{
  objc_storeStrong((id *)&self->_videosPlayable, a3);
}

- (void)setBuyParams:(id)a3
{
  objc_storeStrong((id *)&self->_buyParams, a3);
}

- (void)setPersonalizedBuyParams:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedBuyParams, a3);
}

- (VUIFamilySharingEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (void)setAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_assetController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_personalizedBuyParams, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_videosPlayable, 0);
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_iTunesExtrasInfo, 0);
  objc_storeStrong((id *)&self->_previewArtworkURL, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
}

@end
