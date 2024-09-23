@implementation TVRCUpNextInfo

+ (id)upNextInfoWithDictionary:(id)a3
{
  id v4;
  TVRCUpNextInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = objc_alloc_init(TVRCUpNextInfo);
  +[TVRCMediaInfo mediaInfoWithDictionary:](TVRCMediaInfo, "mediaInfoWithDictionary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCUpNextInfo setMediaInfo:](v5, "setMediaInfo:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizedContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCUpNextInfo setReason:](v5, "setReason:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCUpNextInfo setTimestamp:](v5, "setTimestamp:", v8);

  objc_msgSend(a1, "serviceNameFromDict:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCUpNextInfo setService:](v5, "setService:", v9);

  v10 = objc_msgSend(a1, "isAppleOriginalFromDict:", v4);
  -[TVRCUpNextInfo setIsAppleOriginal:](v5, "setIsAppleOriginal:", v10);
  return v5;
}

+ (id)upNextInfoWithMediaInfo:(id)a3 reason:(id)a4 service:(id)a5 isAppleOriginal:(BOOL)a6 progress:(id)a7 timeRemaining:(id)a8 actionURL:(id)a9 shareURL:(id)a10 shareShowURL:(id)a11 artworkNeedsCornerBlur:(BOOL)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  TVRCUpNextInfo *v25;
  _BOOL4 v27;

  v27 = a6;
  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = objc_alloc_init(TVRCUpNextInfo);
  -[TVRCUpNextInfo setMediaInfo:](v25, "setMediaInfo:", v24);

  -[TVRCUpNextInfo setReason:](v25, "setReason:", v23);
  -[TVRCUpNextInfo setService:](v25, "setService:", v22);

  -[TVRCUpNextInfo setIsAppleOriginal:](v25, "setIsAppleOriginal:", v27);
  -[TVRCUpNextInfo setProgress:](v25, "setProgress:", v21);

  -[TVRCUpNextInfo setTimeRemaining:](v25, "setTimeRemaining:", v20);
  -[TVRCUpNextInfo setActionURL:](v25, "setActionURL:", v19);

  -[TVRCUpNextInfo setShareURL:](v25, "setShareURL:", v18);
  -[TVRCUpNextInfo setShareShowURL:](v25, "setShareShowURL:", v17);

  -[TVRCUpNextInfo setArtworkNeedsCornerBlur:](v25, "setArtworkNeedsCornerBlur:", a12);
  return v25;
}

- (BOOL)isEqualToUpNextInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  _BOOL4 v58;
  int v59;

  v4 = a3;
  if (!v4)
    goto LABEL_24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_24;
  -[TVRCUpNextInfo progress](self, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (v5 == 0) ^ (v6 == 0);

  if ((v7 & 1) != 0)
    goto LABEL_24;
  -[TVRCUpNextInfo timeRemaining](self, "timeRemaining");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeRemaining");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (v8 == 0) ^ (v9 == 0);

  if ((v10 & 1) != 0)
    goto LABEL_24;
  -[TVRCUpNextInfo actionURL](self, "actionURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (v11 == 0) ^ (v12 == 0);

  if ((v13 & 1) != 0)
    goto LABEL_24;
  -[TVRCUpNextInfo shareURL](self, "shareURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shareURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (v14 == 0) ^ (v15 == 0);

  if ((v16 & 1) != 0)
    goto LABEL_24;
  -[TVRCUpNextInfo shareShowURL](self, "shareShowURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shareShowURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (v17 == 0) ^ (v18 == 0);

  if ((v19 & 1) != 0)
    goto LABEL_24;
  -[TVRCUpNextInfo reason](self, "reason");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  if (!v22)
    goto LABEL_24;
  -[TVRCUpNextInfo timestamp](self, "timestamp");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqualToNumber:", v24);

  if (!v25)
    goto LABEL_24;
  -[TVRCUpNextInfo service](self, "service");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqualToString:", v27);

  if (!v28)
    goto LABEL_24;
  v29 = -[TVRCUpNextInfo isAppleOriginal](self, "isAppleOriginal");
  if (v29 != objc_msgSend(v4, "isAppleOriginal"))
    goto LABEL_24;
  -[TVRCUpNextInfo mediaInfo](self, "mediaInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "isEqualToMediaInfo:", v31);

  if (!v32)
    goto LABEL_24;
  -[TVRCUpNextInfo progress](self, "progress");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[TVRCUpNextInfo progress](self, "progress");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "progress");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_24;
  }
  -[TVRCUpNextInfo timeRemaining](self, "timeRemaining");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[TVRCUpNextInfo timeRemaining](self, "timeRemaining");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeRemaining");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_24;
  }
  -[TVRCUpNextInfo actionURL](self, "actionURL");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[TVRCUpNextInfo actionURL](self, "actionURL");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionURL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_24;
  }
  -[TVRCUpNextInfo shareURL](self, "shareURL");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[TVRCUpNextInfo shareURL](self, "shareURL");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shareURL");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_24;
  }
  -[TVRCUpNextInfo shareShowURL](self, "shareShowURL");
  v53 = objc_claimAutoreleasedReturnValue();
  if (!v53)
    goto LABEL_23;
  v54 = (void *)v53;
  -[TVRCUpNextInfo shareShowURL](self, "shareShowURL");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shareShowURL");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v55, "isEqual:", v56);

  if (v57)
  {
LABEL_23:
    v58 = -[TVRCUpNextInfo artworkNeedsCornerBlur](self, "artworkNeedsCornerBlur");
    v59 = v58 ^ objc_msgSend(v4, "artworkNeedsCornerBlur") ^ 1;
  }
  else
  {
LABEL_24:
    LOBYTE(v59) = 0;
  }

  return v59;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
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

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[TVRCUpNextInfo mediaInfo](self, "mediaInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setMediaInfo:", v7);

  -[TVRCUpNextInfo reason](self, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReason:", v8);

  -[TVRCUpNextInfo service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v9);

  -[TVRCUpNextInfo timestamp](self, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimestamp:", v10);

  objc_msgSend(v5, "setIsAppleOriginal:", -[TVRCUpNextInfo isAppleOriginal](self, "isAppleOriginal"));
  -[TVRCUpNextInfo progress](self, "progress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProgress:", v11);

  -[TVRCUpNextInfo timeRemaining](self, "timeRemaining");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeRemaining:", v12);

  -[TVRCUpNextInfo actionURL](self, "actionURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActionURL:", v13);

  -[TVRCUpNextInfo shareURL](self, "shareURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShareURL:", v14);

  -[TVRCUpNextInfo shareShowURL](self, "shareShowURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShareShowURL:", v15);

  objc_msgSend(v5, "setArtworkNeedsCornerBlur:", -[TVRCUpNextInfo artworkNeedsCornerBlur](self, "artworkNeedsCornerBlur"));
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCUpNextInfo)initWithCoder:(id)a3
{
  id v4;
  TVRCUpNextInfo *v5;
  uint64_t v6;
  TVRCMediaInfo *mediaInfo;
  uint64_t v8;
  NSString *reason;
  uint64_t v10;
  NSString *service;
  uint64_t v12;
  NSNumber *timestamp;
  uint64_t v14;
  NSNumber *progress;
  uint64_t v16;
  NSNumber *timeRemaining;
  uint64_t v18;
  NSURL *actionURL;
  uint64_t v20;
  NSURL *shareURL;
  uint64_t v22;
  NSURL *shareShowURL;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TVRCUpNextInfo;
  v5 = -[TVRCUpNextInfo init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    mediaInfo = v5->_mediaInfo;
    v5->_mediaInfo = (TVRCMediaInfo *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v8 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service"));
    v10 = objc_claimAutoreleasedReturnValue();
    service = v5->_service;
    v5->_service = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v12 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v12;

    v5->_isAppleOriginal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAppleOriginal"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("progress"));
    v14 = objc_claimAutoreleasedReturnValue();
    progress = v5->_progress;
    v5->_progress = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeRemaining"));
    v16 = objc_claimAutoreleasedReturnValue();
    timeRemaining = v5->_timeRemaining;
    v5->_timeRemaining = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareURL"));
    v20 = objc_claimAutoreleasedReturnValue();
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareShowURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    shareShowURL = v5->_shareShowURL;
    v5->_shareShowURL = (NSURL *)v22;

    v5->_artworkNeedsCornerBlur = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("artworkNeedsCornerBlur"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  TVRCMediaInfo *mediaInfo;
  id v5;

  mediaInfo = self->_mediaInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mediaInfo, CFSTR("mediaInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_service, CFSTR("service"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAppleOriginal, CFSTR("isAppleOriginal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_progress, CFSTR("progress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeRemaining, CFSTR("timeRemaining"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionURL, CFSTR("actionURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shareURL, CFSTR("shareURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shareShowURL, CFSTR("shareShowURL"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_artworkNeedsCornerBlur, CFSTR("artworkNeedsCornerBlur"));

}

+ (id)serviceNameFromDict:(id)a3
{
  return &stru_24DCDC4B0;
}

+ (BOOL)isAppleOriginalFromDict:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isAppleOriginal"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (TVRCMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

- (void)setMediaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mediaInfo, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (BOOL)isAppleOriginal
{
  return self->_isAppleOriginal;
}

- (void)setIsAppleOriginal:(BOOL)a3
{
  self->_isAppleOriginal = a3;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSNumber)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(id)a3
{
  objc_storeStrong((id *)&self->_timeRemaining, a3);
}

- (NSNumber)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareURL, a3);
}

- (NSURL)shareShowURL
{
  return self->_shareShowURL;
}

- (void)setShareShowURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareShowURL, a3);
}

- (BOOL)artworkNeedsCornerBlur
{
  return self->_artworkNeedsCornerBlur;
}

- (void)setArtworkNeedsCornerBlur:(BOOL)a3
{
  self->_artworkNeedsCornerBlur = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareShowURL, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_timeRemaining, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_mediaInfo, 0);
}

@end
