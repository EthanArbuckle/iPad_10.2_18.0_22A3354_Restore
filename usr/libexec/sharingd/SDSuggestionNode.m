@implementation SDSuggestionNode

- (SDSuggestionNode)initWithSuggestion:(id)a3
{
  id v5;
  SDSuggestionNode *v6;
  SDSuggestionNode *v7;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSString *displayName;
  uint64_t v12;
  NSArray *formattedHandles;
  uint64_t v14;
  NSArray *actualHandles;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *identifier;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  NSString *suggestionReason;
  void *v26;
  uint64_t v27;
  NSArray *contactIDs;
  uint64_t v29;
  NSString *derivedIntentIdentifier;
  objc_super v32;

  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SDSuggestionNode;
  v6 = -[SDSuggestionNode init](&v32, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestion, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transportBundleIdentifier"));
    bundleID = v7->_bundleID;
    v7->_bundleID = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
    displayName = v7->_displayName;
    v7->_displayName = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "formattedHandles"));
    formattedHandles = v7->_formattedHandles;
    v7->_formattedHandles = (NSArray *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "handles"));
    actualHandles = v7->_actualHandles;
    v7->_actualHandles = (NSArray *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationIdentifier"));
    v17 = v16;
    if (v16)
    {
      v18 = v16;
      identifier = v7->_identifier;
      v7->_identifier = v18;
    }
    else
    {
      identifier = (NSString *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSString UUIDString](identifier, "UUIDString"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringWithRange:", 24, 12));
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lowercaseString"));
      v23 = v7->_identifier;
      v7->_identifier = (NSString *)v22;

    }
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reason"));
    suggestionReason = v7->_suggestionReason;
    v7->_suggestionReason = (NSString *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recipients"));
    v7->_hasGroupImage = (unint64_t)objc_msgSend(v26, "count") > 1;

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactsIdentifiers"));
    contactIDs = v7->_contactIDs;
    v7->_contactIDs = (NSArray *)v27;

    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "derivedIntentIdentifier"));
    derivedIntentIdentifier = v7->_derivedIntentIdentifier;
    v7->_derivedIntentIdentifier = (NSString *)v29;

    v7->_iconIndex = -1;
  }

  return v7;
}

- (void)dealloc
{
  CGImage *icon;
  objc_super v4;

  icon = self->_icon;
  if (icon)
    CFRelease(icon);
  v4.receiver = self;
  v4.super_class = (Class)SDSuggestionNode;
  -[SDSuggestionNode dealloc](&v4, "dealloc");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDSuggestionNode;
  v3 = -[SDSuggestionNode description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ bundleID:%@, displayName:%@, handles:%@, contactsIDs:%@, identifier:%@, suggestionreason:%@, iconIndex:%ld"), v4, self->_bundleID, self->_displayName, self->_formattedHandles, self->_contactIDs, self->_identifier, self->_suggestionReason, self->_iconIndex));

  return v5;
}

- (BOOL)isGroup
{
  return -[NSArray count](self->_formattedHandles, "count") > 1;
}

- (BOOL)isIntentsBased
{
  __CFString *v3;
  __CFString *v4;
  unsigned __int8 v5;
  __CFString *v6;
  __CFString *v7;
  unsigned __int8 v8;

  v3 = self->_bundleID;
  v4 = v3;
  if (v3 == CFSTR("com.apple.MobileSMS"))
  {
    v5 = 1;
  }
  else if (v3)
  {
    v5 = -[__CFString isEqual:](v3, "isEqual:", CFSTR("com.apple.MobileSMS"));
  }
  else
  {
    v5 = 0;
  }

  v6 = self->_bundleID;
  v7 = v6;
  if (v6 == CFSTR("com.apple.mobilemail"))
  {
    v8 = 1;
  }
  else if (v6)
  {
    v8 = -[__CFString isEqual:](v6, "isEqual:", CFSTR("com.apple.mobilemail"));
  }
  else
  {
    v8 = 0;
  }

  return (v5 | v8) ^ 1;
}

- (void)setIcon:(CGImage *)a3
{
  CGImage *icon;

  icon = self->_icon;
  if (icon != a3)
  {
    if (icon)
      CFRelease(icon);
    self->_icon = (CGImage *)CFRetain(a3);
  }
}

- (BOOL)loadIcon
{
  void *v3;
  BOOL v4;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  if (-[SDSuggestionNode icon](self, "icon"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionNode iconData](self, "iconData"));

  if (v3)
    return 1;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDSuggestionNode loadIconHandler](self, "loadIconHandler"));
  -[SDSuggestionNode setLoadIconHandler:](self, "setLoadIconHandler:", 0);
  if (v6)
  {
    v10 = 0;
    v11 = 0;
    ((void (**)(_QWORD, SDSuggestionNode *, uint64_t *, id *))v6)[2](v6, self, &v11, &v10);
    v7 = v10;
    -[SDSuggestionNode setIcon:](self, "setIcon:", v11);
    -[SDSuggestionNode setIconData:](self, "setIconData:", v7);
  }
  else
  {
    v8 = share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1002126CC((uint64_t)self, v7);
  }

  if (-[SDSuggestionNode icon](self, "icon"))
  {
    v4 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestionNode iconData](self, "iconData"));
    v4 = v9 != 0;

  }
  return v4;
}

- (SDSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)derivedIntentIdentifier
{
  return self->_derivedIntentIdentifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)formattedHandles
{
  return self->_formattedHandles;
}

- (NSArray)actualHandles
{
  return self->_actualHandles;
}

- (NSString)suggestionReason
{
  return self->_suggestionReason;
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (BOOL)hasGroupImage
{
  return self->_hasGroupImage;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)setIconData:(id)a3
{
  objc_storeStrong((id *)&self->_iconData, a3);
}

- (CGImage)icon
{
  return self->_icon;
}

- (int64_t)iconIndex
{
  return self->_iconIndex;
}

- (void)setIconIndex:(int64_t)a3
{
  self->_iconIndex = a3;
}

- (id)loadIconHandler
{
  return self->_loadIconHandler;
}

- (void)setLoadIconHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadIconHandler, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_suggestionReason, 0);
  objc_storeStrong((id *)&self->_actualHandles, 0);
  objc_storeStrong((id *)&self->_formattedHandles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_derivedIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
