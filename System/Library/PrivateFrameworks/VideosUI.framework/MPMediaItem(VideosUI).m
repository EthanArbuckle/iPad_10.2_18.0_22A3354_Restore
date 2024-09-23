@implementation MPMediaItem(VideosUI)

- (uint64_t)vui_coverArtImageIdentifier
{
  return objc_msgSend(a1, "_vui_imageIdentifierWithImageType:", 0);
}

- (id)_vui_imageIdentifierWithImageType:()VideosUI
{
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (_vui_imageIdentifierWithImageType__onceToken != -1)
    dispatch_once(&_vui_imageIdentifierWithImageType__onceToken, &__block_literal_global_41);
  objc_msgSend(a1, "valuesForProperties:", _vui_imageIdentifierWithImageType____propertiesToFetch);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC1E90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(a1, "vui_artworkCatalogWithImageType:", a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = 0;
  if ((v7 & 1) == 0 && v8)
  {
    VUIImageTypeString(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC1ED0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedLongLongValue");

    objc_msgSend(v9, "visualIdenticalityIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tv_SHA256String");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "tv_filenameSafeString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu_%@_%@"), v13, v11, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)vui_artworkCatalogWithImageType:()VideosUI
{
  if (a3)
    objc_msgSend(a1, "screenshotArtworkCatalog");
  else
    objc_msgSend(a1, "artworkCatalog");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (VUIMPMediaEntityImageLoadParams)vui_imageLoadParamsWithImageType:()VideosUI
{
  void *v5;
  int v6;
  VUIMPMediaEntityImageLoadParams *v7;

  if (a3 == 1
    && (objc_msgSend(a1, "mediaLibrary"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "homeSharingDatabaseID"),
        v5,
        v6))
  {
    v7 = 0;
  }
  else
  {
    v7 = -[VUIMPMediaEntityImageLoadParams initWithMediaItem:andImageType:]([VUIMPMediaEntityImageLoadParams alloc], "initWithMediaItem:andImageType:", a1, a3);
  }
  return v7;
}

- (id)vui_imageIdentifierWithImageType:()VideosUI
{
  if (a3)
    objc_msgSend(a1, "vui_previewFrameImageIdentifier");
  else
    objc_msgSend(a1, "vui_coverArtImageIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)vui_MPMediaItemColorCapabilityFromVUIMediaEntityColorCapability:()VideosUI
{
  return a3 & 3;
}

- (id)vui_mediaEntityType
{
  __int16 v2;
  void *v3;

  v2 = objc_msgSend(a1, "mediaType");
  if ((v2 & 0x100) != 0)
  {
    if (objc_msgSend(a1, "isRental"))
      +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
    else
      +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((v2 & 0x200) != 0)
  {
    +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((v2 & 0x2000) != 0)
  {
    +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)vui_resolution
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1FE0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "vui_VUIMediaEntityResolutionFromMPMediaItemVideoQuality:", objc_msgSend(v1, "integerValue")));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)vui_colorCapability
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1DC8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "vui_VUIMediaEntityColorCapabilityFromMPMediaItemColorCapability:", objc_msgSend(v1, "integerValue")));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)vui_audioCapability
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1DB0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "vui_VUIMediaEntityAudioCapabilityFromMPMediaItemAudioCapability:", objc_msgSend(v1, "integerValue")));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)vui_HLSResolution
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *MEMORY[0x1E0CC1E48];
  v3 = *MEMORY[0x1E0CC1E30];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1E48], *MEMORY[0x1E0CC1E30], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valuesForProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "BOOLValue");

  v7 = 0;
  if ((_DWORD)v4)
  {
    objc_msgSend(v5, "objectForKey:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "vui_VUIMediaEntityResolutionFromMPMediaItemVideoQuality:", objc_msgSend(v8, "integerValue")));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)vui_HLSColorCapability
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *MEMORY[0x1E0CC1E48];
  v3 = *MEMORY[0x1E0CC1E20];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1E48], *MEMORY[0x1E0CC1E20], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valuesForProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "BOOLValue");

  v7 = 0;
  if ((_DWORD)v4)
  {
    objc_msgSend(v5, "objectForKey:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "vui_VUIMediaEntityColorCapabilityFromMPMediaItemColorCapability:", objc_msgSend(v8, "integerValue")));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)vui_HLSAudioCapability
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *MEMORY[0x1E0CC1E48];
  v3 = *MEMORY[0x1E0CC1E18];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1E48], *MEMORY[0x1E0CC1E18], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valuesForProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "BOOLValue");

  v7 = 0;
  if ((_DWORD)v4)
  {
    objc_msgSend(v5, "objectForKey:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "vui_VUIMediaEntityAudioCapabilityFromMPMediaItemAudioCapability:", objc_msgSend(v8, "integerValue")));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (uint64_t)vui_previewFrameImageIdentifier
{
  return objc_msgSend(a1, "_vui_imageIdentifierWithImageType:", 1);
}

- (id)vui_showIdentifier
{
  void *v2;

  if ((objc_msgSend(a1, "mediaType") & 0x200) != 0)
  {
    +[VUIMPMediaEntityIdentifier showIdentifierWithMediaItem:](VUIMPMediaEntityIdentifier, "showIdentifierWithMediaItem:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)vui_seasonIdentifier
{
  void *v2;

  if ((objc_msgSend(a1, "mediaType") & 0x200) != 0)
  {
    +[VUIMPSeasonMediaCollectionIdentifier seasonIdentifierWithMediaItem:](VUIMPSeasonMediaCollectionIdentifier, "seasonIdentifierWithMediaItem:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)vui_studio
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1EC8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_stringForKey:", CFSTR("studio"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (VUIMediaItemCredits)vui_credits
{
  void *v1;
  VUIMediaItemCredits *v2;
  void *v3;
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

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1EC8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(VUIMediaItemCredits);
  objc_msgSend(v1, "vui_arrayForKey:", CFSTR("cast"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    __36__MPMediaItem_VideosUI__vui_credits__block_invoke((uint64_t)v3, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaItemCredits setCast:](v2, "setCast:", v5);

  }
  objc_msgSend(v1, "vui_arrayForKey:", CFSTR("producers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    __36__MPMediaItem_VideosUI__vui_credits__block_invoke((uint64_t)v6, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaItemCredits setProducers:](v2, "setProducers:", v8);

  }
  objc_msgSend(v1, "vui_arrayForKey:", CFSTR("directors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    __36__MPMediaItem_VideosUI__vui_credits__block_invoke((uint64_t)v9, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaItemCredits setDirectors:](v2, "setDirectors:", v11);

  }
  objc_msgSend(v1, "vui_arrayForKey:", CFSTR("screenwriters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    __36__MPMediaItem_VideosUI__vui_credits__block_invoke((uint64_t)v12, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaItemCredits setScreenwriters:](v2, "setScreenwriters:", v14);

  }
  return v2;
}

- (id)vui_contentRating
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1DD8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_stringForKey:", CFSTR("localizedRating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_stringForKey:", CFSTR("localizedReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_stringForKey:", CFSTR("ratingLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_stringForKey:", CFSTR("ratingProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "integerValue");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC69A0]), "initWithRatingSystemString:ratingLabel:rank:ratingDescription:", v5, v2, v6, v3);

  return v7;
}

- (id)vui_isPlayable
{
  void *v1;
  _BOOL8 v2;
  void *v3;

  objc_msgSend(a1, "vui_assetType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue") != 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)vui_isLocalCheckingSidebandLibrary:()VideosUI
{
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1E80], *MEMORY[0x1E0CC1EB0], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valuesForProperties:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v25 = objc_msgSend((id)objc_opt_class(), "_vui_isLocalWithPropertyValues:", v6);
  v7 = *((unsigned __int8 *)v23 + 24);
  if (*((_BYTE *)v23 + 24))
    v8 = 1;
  else
    v8 = a3 == 0;
  if (!v8)
  {
    objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1FA0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "longLongValue"))
    {
      objc_msgSend(v10, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sidebandMediaLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "videoForAdamID:useMainThreadContext:", v11, objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
        {
          v15 = objc_msgSend(v14, "downloadState") == 2;
          *((_BYTE *)v23 + 24) = v15;
        }
        else
        {
          objc_msgSend(v14, "managedObjectContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __60__MPMediaItem_VideosUI__vui_isLocalCheckingSidebandLibrary___block_invoke;
          v19[3] = &unk_1E9F99D88;
          v21 = &v22;
          v20 = v14;
          objc_msgSend(v16, "performBlockAndWait:", v19);

        }
      }

    }
    v7 = *((unsigned __int8 *)v23 + 24);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 != 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v22, 8);

  return v17;
}

- (BOOL)vui_isDownloadedOrDownloading
{
  void *v2;
  void *v3;
  char v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1E80], *MEMORY[0x1E0CC1EB0], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valuesForProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v21 = objc_msgSend((id)objc_opt_class(), "_vui_isLocalWithPropertyValues:", v3);
  if (*((_BYTE *)v19 + 24)
    || (v4 = objc_msgSend(a1, "MPSD_isDownloadInProgress"), *((_BYTE *)v19 + 24) = v4, (v4 & 1) != 0))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1FA0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "longLongValue"))
    {
      objc_msgSend(v8, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sidebandMediaLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "videoForAdamID:useMainThreadContext:", v9, objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
        {
          v13 = (unint64_t)(objc_msgSend(v12, "downloadState") - 1) < 2;
          *((_BYTE *)v19 + 24) = v13;
        }
        else
        {
          objc_msgSend(v12, "managedObjectContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __54__MPMediaItem_VideosUI__vui_isDownloadedOrDownloading__block_invoke;
          v15[3] = &unk_1E9F99348;
          v16 = v12;
          v17 = &v18;
          objc_msgSend(v14, "performBlockAndWait:", v15);

        }
      }

    }
    v5 = *((_BYTE *)v19 + 24) != 0;
  }
  _Block_object_dispose(&v18, 8);

  return v5;
}

- (id)vui_extrasURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1F90]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)vui_playedState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  void *v14;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1ED8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1E40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1DB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1EE0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
    v7 = v3 == 0;
  else
    v7 = 1;
  if (v7 || v4 == 0 || v5 == 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v5, "doubleValue");
    v11 = v10;
    objc_msgSend(v4, "doubleValue");
    v13 = +[VUIPlaybackUtilities playedStateForDuration:elapsedTime:hasBeenPlayed:playCount:](VUIPlaybackUtilities, "playedStateForDuration:elapsedTime:hasBeenPlayed:playCount:", objc_msgSend(v3, "BOOLValue"), objc_msgSend(v2, "unsignedIntegerValue"), v11, v12);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)vui_rentalEndDate
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  v2 = *MEMORY[0x1E0CC1F28];
  v3 = *MEMORY[0x1E0CC1F08];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1F28], *MEMORY[0x1E0CC1F08], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valuesForProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v8 == 0.0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    v13 = 0;
    if (v9 && v12 != 0.0)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v9, v12);

  }
  return v13;
}

- (id)vui_rentalPlaybackEndDate
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  v2 = *MEMORY[0x1E0CC1F20];
  v3 = *MEMORY[0x1E0CC1F18];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1F20], *MEMORY[0x1E0CC1F18], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valuesForProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v8 == 0.0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    v13 = 0;
    if (v9 && v12 != 0.0)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v9, v12);

  }
  return v13;
}

- (id)vui_rentalExpirationDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a1, "vui_rentalPlaybackEndDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vui_rentalEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2 && v3)
  {
    objc_msgSend(v2, "earlierDate:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v2)
  {
    v5 = v2;
  }
  else if (v3)
  {
    v5 = v3;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (uint64_t)vui_assetType
{
  return objc_msgSend(a1, "vui_assetTypeIgnoringLocalAsset:", 0);
}

- (id)vui_assetTypeIgnoringLocalAsset:()VideosUI
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;

  v5 = *MEMORY[0x1E0CC1EA8];
  v6 = *MEMORY[0x1E0CC1E48];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1E80], *MEMORY[0x1E0CC1EA8], *MEMORY[0x1E0CC1EB0], *MEMORY[0x1E0CC1E48], *MEMORY[0x1E0CC1E58], *MEMORY[0x1E0CC1FA0], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valuesForProperties:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if ((a3 & 1) == 0)
  {
    objc_msgSend(a1, "vui_isLocalCheckingSidebandLibrary:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    v9 = v11;
  }
  objc_msgSend(v8, "objectForKey:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    +[VUIMediaLibraryApplicationController defaultController](VUIMediaLibraryApplicationController, "defaultController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 |= objc_msgSend(v14, "assetTypeForRentalMediaItem:", a1);

  }
  else if (objc_msgSend((id)objc_opt_class(), "_vui_isNetworkPlayableWithPropertyValues:", v8))
  {
    objc_msgSend(v8, "objectForKey:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    v17 = 4;
    if (v16)
      v17 = 6;
    v9 |= v17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)vui_adamIDString
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1FA0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && objc_msgSend(v1, "longLongValue"))
  {
    objc_msgSend(v2, "stringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)vui_isHomeSharingMediaItem
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "vui_homeSharingLibrary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)vui_homeSharingLibrary
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "mediaLibrary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "libraryDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "homeSharingLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (uint64_t)vui_MPMediaItemVideoQualityFromVUIMediaEntityResolution:()VideosUI
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (uint64_t)vui_VUIMediaEntityResolutionFromMPMediaItemVideoQuality:()VideosUI
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (uint64_t)vui_VUIMediaEntityColorCapabilityFromMPMediaItemColorCapability:()VideosUI
{
  return a3 & 3;
}

+ (uint64_t)vui_MPMediaItemAudioCapabilityFromVUIMediaEntityAudioCapability:()VideosUI
{
  return a3 & 1;
}

+ (uint64_t)vui_VUIMediaEntityAudioCapabilityFromMPMediaItemAudioCapability:()VideosUI
{
  return a3 & 1;
}

+ (id)vui_mediaItemForPersistentIdentifier:()VideosUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", a3, *MEMORY[0x1E0CC1ED0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0CC2438]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithFilterPredicates:", v5);

    objc_msgSend(v6, "setIgnoreSystemFilterPredicates:", 1);
    objc_msgSend(v6, "setEntityLimit:", 1);
    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)vui_mediaItemForStoreIdentifierString:()VideosUI
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "length") && (v4 = objc_msgSend(v3, "longLongValue")) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CC23F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vui_mediaItemForStoreIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)vui_mediaItemForStoreIdentifier:()VideosUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", a3, *MEMORY[0x1E0CC1FA0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0CC2438]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithFilterPredicates:", v5);

    objc_msgSend(v6, "setIgnoreSystemFilterPredicates:", 1);
    objc_msgSend(v6, "setEntityLimit:", 1);
    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (uint64_t)_vui_isLocalWithPropertyValues:()VideosUI
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v3 = *MEMORY[0x1E0CC1E80];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CC1EB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7 || !objc_msgSend(v5, "BOOLValue"))
    v8 = 0;
  else
    v8 = objc_msgSend(v6, "BOOLValue") ^ 1;

  return v8;
}

+ (uint64_t)_vui_isNetworkPlayableWithPropertyValues:()VideosUI
{
  uint64_t v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;

  v3 = *MEMORY[0x1E0CC1EA8];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CC1FA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CC1E58]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v9, "BOOLValue");
  return v6 | v8 | v4;
}

@end
