@implementation SFNotificationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[SFNotificationInfo attachmentURL](self, "attachmentURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setAttachmentURL:", v6);

    -[SFNotificationInfo body](self, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setBody:", v8);

    objc_msgSend(v4, "setDeviceClass:", -[SFNotificationInfo deviceClass](self, "deviceClass"));
    -[SFNotificationInfo error](self, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setError:", v10);

    -[SFNotificationInfo header](self, "header");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v4, "setHeader:", v12);

    objc_msgSend(v4, "setInteractionBehavior:", -[SFNotificationInfo interactionBehavior](self, "interactionBehavior"));
    objc_msgSend(v4, "setInteractionDirection:", -[SFNotificationInfo interactionDirection](self, "interactionDirection"));
    objc_msgSend(v4, "setNotificationType:", -[SFNotificationInfo notificationType](self, "notificationType"));
    -[SFNotificationInfo title](self, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v4, "setTitle:", v14);

    objc_msgSend(v4, "setHomePodType:", -[SFNotificationInfo homePodType](self, "homePodType"));
  }
  return v4;
}

- (SFNotificationInfo)initWithCoder:(id)a3
{
  id v4;
  SFNotificationInfo *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  SFNotificationInfo *v10;
  objc_super v12;
  uint64_t v13;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFNotificationInfo;
  v5 = -[SFNotificationInfo init](&v12, sel_init);
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v13 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_deviceClass = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v13 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_interactionBehavior = v13;
    v13 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_interactionDirection = v13;
    v13 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_notificationType = v13;
    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("homePodType")))
      v5->_homePodType = objc_msgSend(v9, "decodeIntegerForKey:", CFSTR("homePodType"));

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSURL *attachmentURL;
  NSString *body;
  SFNotificationError *error;
  NSString *header;
  uint64_t notificationType;
  NSString *title;
  unint64_t homePodType;
  id v12;

  v4 = a3;
  attachmentURL = self->_attachmentURL;
  v12 = v4;
  if (attachmentURL)
  {
    objc_msgSend(v4, "encodeObject:forKey:", attachmentURL, CFSTR("url"));
    v4 = v12;
  }
  body = self->_body;
  if (body)
  {
    objc_msgSend(v12, "encodeObject:forKey:", body, CFSTR("bod"));
    v4 = v12;
  }
  if (self->_deviceClass)
  {
    objc_msgSend(v12, "encodeInteger:forKey:");
    v4 = v12;
  }
  error = self->_error;
  if (error)
  {
    objc_msgSend(v12, "encodeObject:forKey:", error, CFSTR("er"));
    v4 = v12;
  }
  header = self->_header;
  if (header)
  {
    objc_msgSend(v12, "encodeObject:forKey:", header, CFSTR("hea"));
    v4 = v12;
  }
  if (self->_interactionBehavior)
  {
    objc_msgSend(v12, "encodeInteger:forKey:");
    v4 = v12;
  }
  if (self->_interactionDirection)
  {
    objc_msgSend(v12, "encodeInteger:forKey:");
    v4 = v12;
  }
  notificationType = self->_notificationType;
  if ((_DWORD)notificationType)
  {
    objc_msgSend(v12, "encodeInt64:forKey:", notificationType, CFSTR("nt"));
    v4 = v12;
  }
  title = self->_title;
  if (title)
  {
    objc_msgSend(v12, "encodeObject:forKey:", title, CFSTR("tit"));
    v4 = v12;
  }
  homePodType = self->_homePodType;
  if (homePodType)
  {
    objc_msgSend(v12, "encodeInteger:forKey:", homePodType, CFSTR("homePodType"));
    v4 = v12;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t deviceClass;
  const char *v6;
  int interactionDirection;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  unsigned int v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SFNotificationInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_body)
    objc_msgSend(v3, "appendFormat:", CFSTR(", b=%@"), self->_body);
  if (self->_header)
    objc_msgSend(v4, "appendFormat:", CFSTR(", h=%@"), self->_header);
  if (self->_title)
    objc_msgSend(v4, "appendFormat:", CFSTR(", t=%@"), self->_title);
  deviceClass = (char)self->_deviceClass;
  if (deviceClass > 8)
    v6 = "?";
  else
    v6 = off_1E4831E78[deviceClass];
  objc_msgSend(v4, "appendFormat:", CFSTR(", d=%s"), v6);
  if (self->_attachmentURL)
    objc_msgSend(v4, "appendFormat:", CFSTR(", u=%@"), self->_attachmentURL);
  interactionDirection = self->_interactionDirection;
  v8 = CFSTR("?");
  v9 = CFSTR("Push");
  if (interactionDirection != 2)
    v9 = CFSTR("?");
  if (interactionDirection == 1)
    v10 = CFSTR("Pull");
  else
    v10 = v9;
  objc_msgSend(v4, "appendFormat:", CFSTR(", %@"), v10);
  v11 = self->_interactionBehavior - 1;
  if (v11 <= 2)
    v8 = off_1E4831EC0[(char)v11];
  objc_msgSend(v4, "appendFormat:", CFSTR(", %@"), v8);
  if (self->_error)
    objc_msgSend(v4, "appendFormat:", CFSTR(", e=%@"), self->_error);
  if (self->_homePodType)
    objc_msgSend(v4, "appendFormat:", CFSTR(", e=%lx"), self->_homePodType);
  return v4;
}

- (SFNotificationInfo)mediumBubbleVersion
{
  SFNotificationInfo *v3;
  int v4;
  const __CFString *v5;
  __CFString *v6;
  int interactionDirection;
  const __CFString *v8;
  __CFString *v9;
  SFNotificationInfo *v10;
  void *v11;
  SFNotificationInfo *cachedMediumBubbleVersion;
  SFNotificationInfo *v13;

  v3 = self->_cachedMediumBubbleVersion;
  if (!v3)
  {
    if (SFDeviceClassCodeGet_sOnce != -1)
      dispatch_once(&SFDeviceClassCodeGet_sOnce, &__block_literal_global_36);
    v4 = SFDeviceClassCodeGet_sResult;
    if (SFDeviceClassCodeGet_sResult == 1)
    {
      v5 = CFSTR("HOMEPOD_HANDOFF_MEDIUM_BODY_IPHONE");
    }
    else
    {
      if (SFDeviceClassCodeGet_sResult != 2)
      {
        v3 = 0;
        v6 = &stru_1E483B8E8;
LABEL_18:

        return v3;
      }
      v5 = CFSTR("HOMEPOD_HANDOFF_MEDIUM_BODY_IPOD");
    }
    SFLocalizedStringForKey(v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    interactionDirection = self->_interactionDirection;
    if (interactionDirection == 2)
    {
      v8 = CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TRANSFER");
    }
    else
    {
      if (interactionDirection != 1)
      {
        v3 = 0;
        v9 = &stru_1E483B8E8;
LABEL_17:

        goto LABEL_18;
      }
      if (v4 == 1)
        v8 = CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TRANSFER_IPHONE");
      else
        v8 = CFSTR("HOMEPOD_HANDOFF_SUBTITLE_TRANSFER_IPOD");
    }
    SFLocalizedStringForKey(v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(SFNotificationInfo);
    -[SFNotificationInfo setBody:](v10, "setBody:", v6);
    -[SFNotificationInfo setTitle:](v10, "setTitle:", v9);
    SFLocalizedStringForKey(CFSTR("HOMEPOD_HANDOFF_HEADER_DEFAULT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNotificationInfo setHeader:](v10, "setHeader:", v11);

    -[SFNotificationInfo setInteractionBehavior:](v10, "setInteractionBehavior:", self->_interactionBehavior);
    -[SFNotificationInfo setInteractionDirection:](v10, "setInteractionDirection:", self->_interactionDirection);
    -[SFNotificationInfo setNotificationType:](v10, "setNotificationType:", self->_notificationType);
    -[SFNotificationInfo setHomePodType:](v10, "setHomePodType:", self->_homePodType);
    cachedMediumBubbleVersion = self->_cachedMediumBubbleVersion;
    self->_cachedMediumBubbleVersion = v10;
    v13 = v10;

    v3 = self->_cachedMediumBubbleVersion;
    goto LABEL_17;
  }
  return v3;
}

- (NSURL)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentURL, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(unsigned __int8)a3
{
  self->_deviceClass = a3;
}

- (SFNotificationError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (unsigned)interactionBehavior
{
  return self->_interactionBehavior;
}

- (void)setInteractionBehavior:(unsigned __int8)a3
{
  self->_interactionBehavior = a3;
}

- (unsigned)interactionDirection
{
  return self->_interactionDirection;
}

- (void)setInteractionDirection:(unsigned __int8)a3
{
  self->_interactionDirection = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (unint64_t)homePodType
{
  return self->_homePodType;
}

- (void)setHomePodType:(unint64_t)a3
{
  self->_homePodType = a3;
}

- (unsigned)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(unsigned int)a3
{
  self->_notificationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
  objc_storeStrong((id *)&self->_cachedMediumBubbleVersion, 0);
}

@end
