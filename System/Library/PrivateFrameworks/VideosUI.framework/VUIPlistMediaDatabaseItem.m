@implementation VUIPlistMediaDatabaseItem

- (VUIPlistMediaDatabaseItem)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  VUIPlistMediaDatabaseItem *v4;
  VUIPlistMediaDatabaseItem *v5;
  NSNumber *colorCapability;
  NSNumber *HLSColorCapability;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VUIPlistMediaDatabaseItem;
  v4 = -[VUIPlistMediaDatabaseEntity initWithIdentifier:type:](&v9, sel_initWithIdentifier_type_, a3, a4);
  v5 = v4;
  if (v4)
  {
    colorCapability = v4->_colorCapability;
    v4->_colorCapability = (NSNumber *)&unk_1EA0B9DD8;

    HLSColorCapability = v5->_HLSColorCapability;
    v5->_HLSColorCapability = (NSNumber *)&unk_1EA0B9DD8;

    objc_storeStrong((id *)&v5->_downloadState, VUIPlistDatabaseItemDownloadStateNotDownloaded);
  }
  return v5;
}

- (VUIPlistMediaDatabaseItem)initWithDictionary:(id)a3
{
  id v4;
  VUIPlistMediaDatabaseItem *v5;
  void *v6;
  uint64_t v7;
  NSNumber *local;
  void *v9;
  uint64_t v10;
  NSNumber *duration;
  void *v12;
  uint64_t v13;
  NSDate *releaseDate;
  void *v15;
  uint64_t v16;
  NSNumber *episodeNumber;
  void *v18;
  uint64_t v19;
  NSString *studio;
  void *v21;
  uint64_t v22;
  NSNumber *colorCapability;
  void *v24;
  uint64_t v25;
  NSNumber *HLSColorCapability;
  void *v27;
  uint64_t v28;
  NSDictionary *offlineFPSKeys;
  void *v30;
  uint64_t v31;
  NSString *downloadState;
  void *v33;
  uint64_t v34;
  VUIContentRating *contentRating;
  void *v36;
  uint64_t v37;
  NSURL *previewFrameURL;
  void *v39;
  VUIMediaItemCredits *v40;
  VUIMediaItemCredits *credits;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSURL *filePathURL;
  void *v48;
  void *v49;
  uint64_t v50;
  NSURL *playbackURL;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)VUIPlistMediaDatabaseItem;
  v5 = -[VUIPlistMediaDatabaseEntity initWithDictionary:](&v53, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "vui_numberForKey:", CFSTR("Local"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    local = v5->_local;
    v5->_local = (NSNumber *)v7;

    objc_msgSend(v4, "vui_numberForKey:", CFSTR("Duration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v10;

    objc_msgSend(v4, "vui_dateForKey:", CFSTR("ReleaseDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v13;

    objc_msgSend(v4, "vui_numberForKey:", CFSTR("EpisodeNumber"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    episodeNumber = v5->_episodeNumber;
    v5->_episodeNumber = (NSNumber *)v16;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("Studio"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    studio = v5->_studio;
    v5->_studio = (NSString *)v19;

    objc_msgSend(v4, "vui_numberForKey:", CFSTR("ColorCapability"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    colorCapability = v5->_colorCapability;
    v5->_colorCapability = (NSNumber *)v22;

    objc_msgSend(v4, "vui_numberForKey:", CFSTR("ColorCapability"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    HLSColorCapability = v5->_HLSColorCapability;
    v5->_HLSColorCapability = (NSNumber *)v25;

    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("OfflineFPSKeys"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    offlineFPSKeys = v5->_offlineFPSKeys;
    v5->_offlineFPSKeys = (NSDictionary *)v28;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("DownloadState"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    downloadState = v5->_downloadState;
    v5->_downloadState = (NSString *)v31;

    if (!v5->_downloadState)
      objc_storeStrong((id *)&v5->_downloadState, VUIPlistDatabaseItemDownloadStateNotDownloaded);
    if (!v5->_colorCapability)
    {
      v5->_colorCapability = (NSNumber *)&unk_1EA0B9DD8;

    }
    if (!v5->_HLSColorCapability)
    {
      v5->_HLSColorCapability = (NSNumber *)&unk_1EA0B9DD8;

    }
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("ContentRating"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC69A0]), "initWithStringRepresentation:", v33);
      contentRating = v5->_contentRating;
      v5->_contentRating = (VUIContentRating *)v34;

    }
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("PreviewFrameURL"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v36);
      v37 = objc_claimAutoreleasedReturnValue();
      previewFrameURL = v5->_previewFrameURL;
      v5->_previewFrameURL = (NSURL *)v37;

    }
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("Credits"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v40 = -[VUIMediaItemCredits initWithStringRepresentation:]([VUIMediaItemCredits alloc], "initWithStringRepresentation:", v39);
      credits = v5->_credits;
      v5->_credits = v40;

    }
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("RelativeFilePathString"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "length"))
    {
      v43 = (void *)MEMORY[0x1E0C99E98];
      NSHomeDirectory();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "fileURLWithPath:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "fileURLWithPath:relativeToURL:", v42, v45);
      v46 = objc_claimAutoreleasedReturnValue();
      filePathURL = v5->_filePathURL;
      v5->_filePathURL = (NSURL *)v46;

    }
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("PlaybackURL"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48 && objc_msgSend(v48, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v49);
      v50 = objc_claimAutoreleasedReturnValue();
      playbackURL = v5->_playbackURL;
      v5->_playbackURL = (NSURL *)v50;

    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
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
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)VUIPlistMediaDatabaseItem;
  -[VUIPlistMediaDatabaseEntity dictionaryRepresentation](&v26, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  -[VUIPlistMediaDatabaseItem isLocal](self, "isLocal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v5, CFSTR("Local"));

  -[VUIPlistMediaDatabaseItem duration](self, "duration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v6, CFSTR("Duration"));

  -[VUIPlistMediaDatabaseItem releaseDate](self, "releaseDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v7, CFSTR("ReleaseDate"));

  -[VUIPlistMediaDatabaseItem episodeNumber](self, "episodeNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v8, CFSTR("EpisodeNumber"));

  -[VUIPlistMediaDatabaseItem studio](self, "studio");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v9, CFSTR("Studio"));

  -[VUIPlistMediaDatabaseItem credits](self, "credits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v11, CFSTR("Credits"));

  -[VUIPlistMediaDatabaseItem previewFrameURL](self, "previewFrameURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v13, CFSTR("PreviewFrameURL"));

  -[VUIPlistMediaDatabaseItem contentRating](self, "contentRating");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v15, CFSTR("ContentRating"));

  -[VUIPlistMediaDatabaseItem colorCapability](self, "colorCapability");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v16, CFSTR("ColorCapability"));

  -[VUIPlistMediaDatabaseItem HLSColorCapability](self, "HLSColorCapability");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v17, CFSTR("HLSColorCapability"));

  -[VUIPlistMediaDatabaseItem playbackURL](self, "playbackURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "absoluteString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v19, CFSTR("PlaybackURL"));

  -[VUIPlistMediaDatabaseItem filePathURL](self, "filePathURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "relativeString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByRemovingPercentEncoding");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v22, CFSTR("RelativeFilePathString"));

  -[VUIPlistMediaDatabaseItem offlineFPSKeys](self, "offlineFPSKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v23, CFSTR("OfflineFPSKeys"));

  -[VUIPlistMediaDatabaseItem downloadState](self, "downloadState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v24, CFSTR("DownloadState"));

  return v4;
}

- (NSNumber)isPlayable
{
  return (NSNumber *)MEMORY[0x1E0C9AAB0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)VUIPlistMediaDatabaseItem;
  v4 = -[VUIPlistMediaDatabaseEntity copyWithZone:](&v34, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_local, "copy");
  v6 = (void *)v4[8];
  v4[8] = v5;

  v7 = -[NSNumber copy](self->_duration, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSDate copy](self->_releaseDate, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_episodeNumber, "copy");
  v12 = (void *)v4[16];
  v4[16] = v11;

  v13 = -[NSString copy](self->_studio, "copy");
  v14 = (void *)v4[17];
  v4[17] = v13;

  v15 = -[VUIMediaItemCredits copy](self->_credits, "copy");
  v16 = (void *)v4[18];
  v4[18] = v15;

  v17 = -[NSURL copy](self->_previewFrameURL, "copy");
  v18 = (void *)v4[12];
  v4[12] = v17;

  v19 = -[VUIContentRating copy](self->_contentRating, "copy");
  v20 = (void *)v4[13];
  v4[13] = v19;

  v21 = -[NSNumber copy](self->_colorCapability, "copy");
  v22 = (void *)v4[14];
  v4[14] = v21;

  v23 = -[NSNumber copy](self->_HLSColorCapability, "copy");
  v24 = (void *)v4[15];
  v4[15] = v23;

  v25 = -[NSURL copy](self->_playbackURL, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  v27 = -[NSURL copy](self->_filePathURL, "copy");
  v28 = (void *)v4[20];
  v4[20] = v27;

  v29 = -[NSDictionary copy](self->_offlineFPSKeys, "copy");
  v30 = (void *)v4[21];
  v4[21] = v29;

  v31 = -[NSString copy](self->_downloadState, "copy");
  v32 = (void *)v4[22];
  v4[22] = v31;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  VUIPlistMediaDatabaseItem *v4;
  VUIPlistMediaDatabaseItem *v5;
  VUIPlistMediaDatabaseItem *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  void *v30;
  void *v31;
  id v32;
  char v33;
  void *v34;
  void *v35;
  id v36;
  char v37;
  void *v38;
  void *v39;
  id v40;
  char v41;
  void *v42;
  void *v43;
  id v44;
  char v45;
  void *v46;
  void *v47;
  id v48;
  char v49;
  void *v50;
  void *v51;
  id v52;
  char v53;
  void *v54;
  void *v55;
  id v56;
  char v57;
  void *v58;
  void *v59;
  id v60;
  char v61;
  void *v62;
  void *v63;
  id v64;
  objc_super v66;

  v4 = (VUIPlistMediaDatabaseItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v66.receiver = self;
        v66.super_class = (Class)VUIPlistMediaDatabaseItem;
        if (!-[VUIPlistMediaDatabaseEntity isEqual:](&v66, sel_isEqual_, v6))
        {
LABEL_83:
          v12 = 0;
LABEL_91:

          goto LABEL_92;
        }
        -[VUIPlistMediaDatabaseItem isPlayable](self, "isPlayable");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem isPlayable](v6, "isPlayable");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          v12 = 0;
          if (!v9 || !v10)
            goto LABEL_90;
          v13 = objc_msgSend(v9, "isEqual:", v10);

          if ((v13 & 1) == 0)
            goto LABEL_83;
        }
        -[VUIPlistMediaDatabaseItem duration](self, "duration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem duration](v6, "duration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v14;
        v16 = v15;
        if (v9 == v16)
        {

        }
        else
        {
          v11 = v16;
          v12 = 0;
          if (!v9 || !v16)
            goto LABEL_90;
          v17 = objc_msgSend(v9, "isEqual:", v16);

          if ((v17 & 1) == 0)
            goto LABEL_83;
        }
        -[VUIPlistMediaDatabaseItem releaseDate](self, "releaseDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem releaseDate](v6, "releaseDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v18;
        v20 = v19;
        if (v9 == v20)
        {

        }
        else
        {
          v11 = v20;
          v12 = 0;
          if (!v9 || !v20)
            goto LABEL_90;
          v21 = objc_msgSend(v9, "isEqual:", v20);

          if ((v21 & 1) == 0)
            goto LABEL_83;
        }
        -[VUIPlistMediaDatabaseItem episodeNumber](self, "episodeNumber");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem episodeNumber](v6, "episodeNumber");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v22;
        v24 = v23;
        if (v9 == v24)
        {

        }
        else
        {
          v11 = v24;
          v12 = 0;
          if (!v9 || !v24)
            goto LABEL_90;
          v25 = objc_msgSend(v9, "isEqual:", v24);

          if ((v25 & 1) == 0)
            goto LABEL_83;
        }
        -[VUIPlistMediaDatabaseItem studio](self, "studio");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem studio](v6, "studio");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v26;
        v28 = v27;
        if (v9 == v28)
        {

        }
        else
        {
          v11 = v28;
          v12 = 0;
          if (!v9 || !v28)
            goto LABEL_90;
          v29 = objc_msgSend(v9, "isEqual:", v28);

          if ((v29 & 1) == 0)
            goto LABEL_83;
        }
        -[VUIPlistMediaDatabaseItem credits](self, "credits");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem credits](v6, "credits");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v30;
        v32 = v31;
        if (v9 == v32)
        {

        }
        else
        {
          v11 = v32;
          v12 = 0;
          if (!v9 || !v32)
            goto LABEL_90;
          v33 = objc_msgSend(v9, "isEqual:", v32);

          if ((v33 & 1) == 0)
            goto LABEL_83;
        }
        -[VUIPlistMediaDatabaseItem previewFrameURL](self, "previewFrameURL");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem previewFrameURL](v6, "previewFrameURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v34;
        v36 = v35;
        if (v9 == v36)
        {

        }
        else
        {
          v11 = v36;
          v12 = 0;
          if (!v9 || !v36)
            goto LABEL_90;
          v37 = objc_msgSend(v9, "isEqual:", v36);

          if ((v37 & 1) == 0)
            goto LABEL_83;
        }
        -[VUIPlistMediaDatabaseItem contentRating](self, "contentRating");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem contentRating](v6, "contentRating");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v38;
        v40 = v39;
        if (v9 == v40)
        {

        }
        else
        {
          v11 = v40;
          v12 = 0;
          if (!v9 || !v40)
            goto LABEL_90;
          v41 = objc_msgSend(v9, "isEqual:", v40);

          if ((v41 & 1) == 0)
            goto LABEL_83;
        }
        -[VUIPlistMediaDatabaseItem colorCapability](self, "colorCapability");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem colorCapability](v6, "colorCapability");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v42;
        v44 = v43;
        if (v9 == v44)
        {

        }
        else
        {
          v11 = v44;
          v12 = 0;
          if (!v9 || !v44)
            goto LABEL_90;
          v45 = objc_msgSend(v9, "isEqual:", v44);

          if ((v45 & 1) == 0)
            goto LABEL_83;
        }
        -[VUIPlistMediaDatabaseItem HLSColorCapability](self, "HLSColorCapability");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem HLSColorCapability](v6, "HLSColorCapability");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v46;
        v48 = v47;
        if (v9 == v48)
        {

        }
        else
        {
          v11 = v48;
          v12 = 0;
          if (!v9 || !v48)
            goto LABEL_90;
          v49 = objc_msgSend(v9, "isEqual:", v48);

          if ((v49 & 1) == 0)
            goto LABEL_83;
        }
        -[VUIPlistMediaDatabaseItem playbackURL](self, "playbackURL");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem playbackURL](v6, "playbackURL");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v50;
        v52 = v51;
        if (v9 == v52)
        {

        }
        else
        {
          v11 = v52;
          v12 = 0;
          if (!v9 || !v52)
            goto LABEL_90;
          v53 = objc_msgSend(v9, "isEqual:", v52);

          if ((v53 & 1) == 0)
            goto LABEL_83;
        }
        -[VUIPlistMediaDatabaseItem filePathURL](self, "filePathURL");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem filePathURL](v6, "filePathURL");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v54;
        v56 = v55;
        if (v9 == v56)
        {

        }
        else
        {
          v11 = v56;
          v12 = 0;
          if (!v9 || !v56)
            goto LABEL_90;
          v57 = objc_msgSend(v9, "isEqual:", v56);

          if ((v57 & 1) == 0)
            goto LABEL_83;
        }
        -[VUIPlistMediaDatabaseItem offlineFPSKeys](self, "offlineFPSKeys");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseItem offlineFPSKeys](v6, "offlineFPSKeys");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v58;
        v60 = v59;
        if (v9 == v60)
        {

LABEL_85:
          -[VUIPlistMediaDatabaseItem downloadState](self, "downloadState");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIPlistMediaDatabaseItem downloadState](v6, "downloadState");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v62;
          v64 = v63;
          v11 = v64;
          if (v9 == v64)
          {
            v12 = 1;
          }
          else
          {
            v12 = 0;
            if (v9 && v64)
              v12 = objc_msgSend(v9, "isEqual:", v64);
          }
          goto LABEL_90;
        }
        v11 = v60;
        v12 = 0;
        if (v9 && v60)
        {
          v61 = objc_msgSend(v9, "isEqual:", v60);

          if ((v61 & 1) == 0)
            goto LABEL_83;
          goto LABEL_85;
        }
LABEL_90:

        goto LABEL_91;
      }
    }
    v12 = 0;
  }
LABEL_92:

  return v12;
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
  objc_super v50;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50.receiver = self;
  v50.super_class = (Class)VUIPlistMediaDatabaseItem;
  -[VUIPlistMediaDatabaseEntity description](&v50, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem isPlayable](self, "isPlayable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "BOOLValue");
  VUIBoolLogString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("isPlayable"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem duration](self, "duration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("duration"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem releaseDate](self, "releaseDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("releaseDate"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem episodeNumber](self, "episodeNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("episodeNumber"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  v18 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem studio](self, "studio");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("studio"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  v21 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem credits](self, "credits");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("credits"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  v24 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem previewFrameURL](self, "previewFrameURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("previewFrameURL"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  v27 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem contentRating](self, "contentRating");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("contentRating"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  v30 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem colorCapability](self, "colorCapability");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("colorCapability"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v32);

  v33 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem HLSColorCapability](self, "HLSColorCapability");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("HLSColorCapability"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v35);

  v36 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem playbackURL](self, "playbackURL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("playbackURL"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v38);

  v39 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem filePathURL](self, "filePathURL");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("filePathURL"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v41);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("offlineFPSKeys"), CFSTR("[omitted]"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v42);

  v43 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseItem downloadState](self, "downloadState");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("downloadState"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v45);

  v46 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "stringWithFormat:", CFSTR("<%@>"), v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (id)isLocal
{
  return self->_local;
}

- (VUIPlistMediaDatabaseSeason)season
{
  return (VUIPlistMediaDatabaseSeason *)objc_loadWeakRetained((id *)&self->_season);
}

- (void)setSeason:(id)a3
{
  objc_storeWeak((id *)&self->_season, a3);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)previewFrameURL
{
  return self->_previewFrameURL;
}

- (void)setPreviewFrameURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (VUIContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)colorCapability
{
  return self->_colorCapability;
}

- (void)setColorCapability:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)HLSColorCapability
{
  return self->_HLSColorCapability;
}

- (void)setHLSColorCapability:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)studio
{
  return self->_studio;
}

- (void)setStudio:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (VUIMediaItemCredits)credits
{
  return self->_credits;
}

- (void)setCredits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSURL)playbackURL
{
  return self->_playbackURL;
}

- (void)setPlaybackURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSURL)filePathURL
{
  return self->_filePathURL;
}

- (void)setFilePathURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDictionary)offlineFPSKeys
{
  return self->_offlineFPSKeys;
}

- (void)setOfflineFPSKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadState, 0);
  objc_storeStrong((id *)&self->_offlineFPSKeys, 0);
  objc_storeStrong((id *)&self->_filePathURL, 0);
  objc_storeStrong((id *)&self->_playbackURL, 0);
  objc_storeStrong((id *)&self->_credits, 0);
  objc_storeStrong((id *)&self->_studio, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_HLSColorCapability, 0);
  objc_storeStrong((id *)&self->_colorCapability, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_previewFrameURL, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_destroyWeak((id *)&self->_season);
  objc_storeStrong((id *)&self->_local, 0);
}

@end
