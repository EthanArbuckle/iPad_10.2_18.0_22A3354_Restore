@implementation VUIGroupWatchActivityPreviewMetadata

- (VUIGroupWatchActivityPreviewMetadata)initWithTitle:(id)a3 subtitle:(id)a4 imageUrlFormat:(id)a5 artworkImage:(CGImage *)a6 fallbackUrl:(id)a7 allowsSceneAssociation:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  VUIGroupWatchActivityPreviewMetadata *v18;
  VUIGroupWatchActivityPreviewMetadata *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)VUIGroupWatchActivityPreviewMetadata;
  v18 = -[VUIGroupWatchActivityPreviewMetadata init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v19->_seasonTitle, a4);
    objc_storeStrong((id *)&v19->_imageUrlFormat, a5);
    v19->_artworkImage = a6;
    objc_storeStrong((id *)&v19->_fallbackUrl, a7);
    v19->_allowsSceneAssociation = a8;
  }

  return v19;
}

- (VUIGroupWatchActivityPreviewMetadata)initWithContextData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  VUIGroupWatchActivityPreviewMetadata *v13;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("showTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("seasonTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_numberForKey:", CFSTR("seasonNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_numberForKey:", CFSTR("episodeNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("imageUrlFormat"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_URLForKey:", CFSTR("fallbackUrl"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("isTVShow"), 0);
  v12 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("allowsSceneAssociation"), 1);

  BYTE1(v15) = v12;
  LOBYTE(v15) = v11;
  v13 = -[VUIGroupWatchActivityPreviewMetadata initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:](self, "initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:", v4, v5, v6, v7, v8, v9, 0, v10, v15);

  return v13;
}

- (VUIGroupWatchActivityPreviewMetadata)initWithPlayable:(id)a3 fallbackUrl:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
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
  VUIGroupWatchActivityPreviewMetadata *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;

  v5 = a3;
  v24 = a4;
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "contentType") == 3)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "contentType") == 1)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v5, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "contentType") == 4;

    }
  }

  objc_msgSend(v5, "metadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "title");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "showTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "seasonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "seasonNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "episodeNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "artworkURLFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackModes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v20) = objc_msgSend(v17, "containsObject:", CFSTR("Immersive")) ^ 1;
  LOBYTE(v20) = v7;
  v18 = -[VUIGroupWatchActivityPreviewMetadata initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:](self, "initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:", v27, v10, v11, v12, v14, v16, 0, v24, v20);

  return v18;
}

- (VUIGroupWatchActivityPreviewMetadata)initWithMediaItem:(id)a3 fallbackUrl:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  TVImageProxy *v9;
  TVImageProxy *imageProxy;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  VUIGroupWatchActivityPreviewMetadata *v17;
  uint64_t v19;

  v6 = *MEMORY[0x1E0DB19D8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "mediaItemMetadataForProperty:", v6);
  v9 = (TVImageProxy *)objc_claimAutoreleasedReturnValue();
  imageProxy = self->_imageProxy;
  self->_imageProxy = v9;

  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C48]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C40]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A98]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19E0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v19) = 1;
  LOBYTE(v19) = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0DB1DD8]);
  v17 = -[VUIGroupWatchActivityPreviewMetadata initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:](self, "initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:", v11, v12, 0, v13, v14, v15, 0, v7, v19);

  return v17;
}

- (VUIGroupWatchActivityPreviewMetadata)initWithTitle:(id)a3 showTitle:(id)a4 seasonTitle:(id)a5 seasonNumber:(id)a6 episodeNumber:(id)a7 imageUrlFormat:(id)a8 artworkImage:(CGImage *)a9 fallbackUrl:(id)a10 isTVShow:(BOOL)a11 allowsSceneAssociation:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  VUIGroupWatchActivityPreviewMetadata *v21;
  VUIGroupWatchActivityPreviewMetadata *v22;
  void **p_title;
  void *v24;
  id v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  v32.receiver = self;
  v32.super_class = (Class)VUIGroupWatchActivityPreviewMetadata;
  v21 = -[VUIGroupWatchActivityPreviewMetadata init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    p_title = (void **)&v21->_title;
    if (a11)
    {
      objc_storeStrong((id *)&v21->_title, a4);
      objc_storeStrong((id *)&v22->_seasonTitle, a5);
      objc_storeStrong((id *)&v22->_seasonNumber, a6);
      p_title = (void **)&v22->_episodeNumber;
      v24 = v18;
    }
    else
    {
      v24 = v31;
    }
    v25 = v24;
    v26 = *p_title;
    *p_title = v25;

    objc_storeStrong((id *)&v22->_imageUrlFormat, a8);
    v22->_artworkImage = a9;
    objc_storeStrong((id *)&v22->_fallbackUrl, a10);
    v22->_allowsSceneAssociation = a12;
  }

  return v22;
}

- (id)subtitleWithSeasonTitlesEnabled:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!a3
    && (-[VUIGroupWatchActivityPreviewMetadata seasonNumber](self, "seasonNumber"),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v5 = (void *)v4,
        -[VUIGroupWatchActivityPreviewMetadata episodeNumber](self, "episodeNumber"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    -[VUIGroupWatchActivityPreviewMetadata seasonNumber](self, "seasonNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIGroupWatchActivityPreviewMetadata episodeNumber](self, "episodeNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIGroupWatchActivityPreviewMetadata localizedSubtitleForSeasonNumber:episodeNumber:](self, "localizedSubtitleForSeasonNumber:episodeNumber:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VUIGroupWatchActivityPreviewMetadata seasonTitle](self, "seasonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)localizedSubtitleForSeasonNumber:(id)a3 episodeNumber:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:", CFSTR("TV.SeasonEpisode.Abbreviated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_languageAwareDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("@@seasonNumber@@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_languageAwareDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("@@episodeNumber@@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)serializedDataWithSeasonTitlesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIGroupWatchActivityPreviewMetadata title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v6, CFSTR("title"));

  -[VUIGroupWatchActivityPreviewMetadata subtitleWithSeasonTitlesEnabled:](self, "subtitleWithSeasonTitlesEnabled:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v7, CFSTR("subtitle"));

  -[VUIGroupWatchActivityPreviewMetadata imageUrlFormat](self, "imageUrlFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v8, CFSTR("imageUrlFormat"));

  -[VUIGroupWatchActivityPreviewMetadata fallbackUrl](self, "fallbackUrl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v10, CFSTR("fallbackUrl"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIGroupWatchActivityPreviewMetadata allowsSceneAssociation](self, "allowsSceneAssociation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("allowsSceneAssociation"));

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)metadataFromSerializedData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VUIGroupWatchActivityPreviewMetadata *v8;
  uint64_t v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("subtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("imageUrlFormat"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_URLForKey:", CFSTR("fallbackUrl"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VUIGroupWatchActivityPreviewMetadata initWithTitle:subtitle:imageUrlFormat:artworkImage:fallbackUrl:allowsSceneAssociation:]([VUIGroupWatchActivityPreviewMetadata alloc], "initWithTitle:subtitle:imageUrlFormat:artworkImage:fallbackUrl:allowsSceneAssociation:", v4, v5, v6, 0, v7, objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("allowsSceneAssociation"), 1));

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)imageUrlFormat
{
  return self->_imageUrlFormat;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (BOOL)allowsSceneAssociation
{
  return self->_allowsSceneAssociation;
}

- (CGImage)artworkImage
{
  return self->_artworkImage;
}

- (NSURL)fallbackUrl
{
  return self->_fallbackUrl;
}

- (NSString)seasonTitle
{
  return self->_seasonTitle;
}

- (void)setSeasonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(id)a3
{
  objc_storeStrong((id *)&self->_seasonNumber, a3);
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(id)a3
{
  objc_storeStrong((id *)&self->_episodeNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_storeStrong((id *)&self->_seasonTitle, 0);
  objc_storeStrong((id *)&self->_fallbackUrl, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_imageUrlFormat, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
