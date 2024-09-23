@implementation TPMessageIndicatorViewModel

- (NSUUID)messageUUID
{
  void *v2;

  if (self->_identifier)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_identifier);
  else
    v2 = 0;
  return (NSUUID *)v2;
}

- (TPMessageIndicatorViewModel)initWithDuration:(double)a3 identifier:(id)a4 mediaURL:(id)a5 thumbnailURL:(id)a6 isRead:(BOOL)a7 isSensitive:(BOOL)a8 isVideo:(BOOL)a9 fromHandle:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  TPMessageIndicatorViewModel *v21;
  TPMessageIndicatorViewModel *v22;
  uint64_t v23;
  NSString *identifier;
  uint64_t v25;
  NSURL *mediaURL;
  uint64_t v27;
  NSURL *thumbnailURL;
  TPMessageIndicatorViewModel *v29;
  objc_super v31;

  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a10;
  v31.receiver = self;
  v31.super_class = (Class)TPMessageIndicatorViewModel;
  v21 = -[TPMessageIndicatorViewModel init](&v31, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_duration = a3;
    v23 = objc_msgSend(v17, "copy");
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v23;

    v25 = objc_msgSend(v18, "copy");
    mediaURL = v22->_mediaURL;
    v22->_mediaURL = (NSURL *)v25;

    v27 = objc_msgSend(v19, "copy");
    thumbnailURL = v22->_thumbnailURL;
    v22->_thumbnailURL = (NSURL *)v27;

    v22->_isRead = a7;
    v22->_isSensitive = a8;
    v22->_isVideo = a9;
    objc_storeStrong((id *)&v22->_fromHandle, a10);
    v29 = v22;
  }

  return v22;
}

- (TPMessageIndicatorViewModel)initWithIdentifier:(id)a3
{
  return -[TPMessageIndicatorViewModel initWithDuration:identifier:mediaURL:thumbnailURL:isRead:isSensitive:isVideo:fromHandle:](self, "initWithDuration:identifier:mediaURL:thumbnailURL:isRead:isSensitive:isVideo:fromHandle:", a3, 0, 0, 0, 0, 0, 0.0, 0);
}

- (TPMessageIndicatorViewModel)init
{
  return -[TPMessageIndicatorViewModel initWithDuration:identifier:mediaURL:thumbnailURL:isRead:isSensitive:isVideo:fromHandle:](self, "initWithDuration:identifier:mediaURL:thumbnailURL:isRead:isSensitive:isVideo:fromHandle:", 0, 0, 0, 0, 0, 0, 0.0, 0);
}

- (id)indicatorImageWithDefaultTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[TPMessageIndicatorViewModel isSensitive](self, "isSensitive"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "videoMessageSensitiveGlyphImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[TPMessageIndicatorViewModel isRead](self, "isRead"))
    {
      v6 = v5;
LABEL_8:
      objc_msgSend(v6, "imageWithTintColor:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    if (!-[TPMessageIndicatorViewModel isRead](self, "isRead"))
    {
      UIImageGetUnreadIndicator();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "videoMessageRecordGlyphImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v8;
}

- (CGSize)indicatorImageSize
{
  _BOOL4 v3;
  double v4;
  double v5;
  CGSize result;

  if (-[TPMessageIndicatorViewModel isRead](self, "isRead")
    || (v3 = -[TPMessageIndicatorViewModel isSensitive](self, "isSensitive"), v4 = 11.0, v5 = 11.0, v3))
  {
    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p - duration: %f, identifier: %@, mediaURL: %@, thumbnailURL: %@, isRead: %d, isSensitive: %d, idVideo: %d>"), v5, self, *(_QWORD *)&self->_duration, self->_identifier, self->_mediaURL, self->_thumbnailURL, self->_isRead, self->_isSensitive, self->_isVideo);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDuration:identifier:mediaURL:thumbnailURL:isRead:isSensitive:isVideo:fromHandle:", self->_identifier, self->_mediaURL, self->_thumbnailURL, self->_isRead, self->_isSensitive, self->_isVideo, self->_duration, self->_fromHandle);
}

- (double)duration
{
  return self->_duration;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (TUHandle)fromHandle
{
  return self->_fromHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
