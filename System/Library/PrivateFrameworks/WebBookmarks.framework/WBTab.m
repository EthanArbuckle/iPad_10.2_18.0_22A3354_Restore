@implementation WBTab

- (BOOL)isPrivateBrowsing
{
  return self->_privateBrowsing;
}

- (NSString)tabGroupUUID
{
  return self->_tabGroupUUID;
}

- (int)identifier
{
  return -[WebBookmark identifier](self->_bookmark, "identifier");
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (WBTab)initWithUUID:(id)a3 title:(id)a4 url:(id)a5 deviceIdentifier:(id)a6 isPrivateBrowsing:(BOOL)a7
{
  WBTab *result;

  result = -[WBTab initWithUUID:title:url:deviceIdentifier:](self, "initWithUUID:title:url:deviceIdentifier:", a3, a4, a5, a6);
  result->_privateBrowsing = a7;
  return result;
}

- (WBTab)initWithUUID:(id)a3 title:(id)a4 url:(id)a5 deviceIdentifier:(id)a6
{
  return -[WBTab initWithUUID:title:url:deviceIdentifier:lastVisitTime:](self, "initWithUUID:title:url:deviceIdentifier:lastVisitTime:", a3, a4, a5, a6, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  WBTab *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!self->_isMutable)
    return self;
  v4 = +[WBTab allocWithZone:](WBTab, "allocWithZone:");
  v5 = -[WebBookmark copyWithZone:](self->_bookmark, "copyWithZone:", a3);
  v6 = -[WBTab initWithBookmark:](v4, "initWithBookmark:", v5);

  v7 = -[NSString copy](self->_tabGroupUUID, "copy");
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  *(_BYTE *)(v6 + 24) = self->_added;
  *(_BYTE *)(v6 + 26) = self->_moved;
  *(_BYTE *)(v6 + 25) = self->_modified;
  *(_BYTE *)(v6 + 27) = self->_inUnnamedTabGroup;
  *(_BYTE *)(v6 + 28) = self->_privateBrowsing;
  *(_BYTE *)(v6 + 29) = self->_shared;
  return (id)v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  WBMutableTab *v5;
  id v6;
  WBMutableTab *v7;

  v5 = [WBMutableTab alloc];
  v6 = -[WebBookmark copyWithZone:](self->_bookmark, "copyWithZone:", a3);
  v7 = -[WBTab initWithBookmark:](v5, "initWithBookmark:", v6);

  -[WBMutableTab setTabGroupUUID:](v7, "setTabGroupUUID:", self->_tabGroupUUID);
  -[WBMutableTab setAdded:](v7, "setAdded:", self->_added);
  -[WBMutableTab setMoved:](v7, "setMoved:", self->_moved);
  -[WBMutableTab setModified:](v7, "setModified:", self->_modified);
  -[WBMutableTab setInUnnamedTabGroup:](v7, "setInUnnamedTabGroup:", self->_inUnnamedTabGroup);
  -[WBMutableTab setPrivateBrowsing:](v7, "setPrivateBrowsing:", self->_privateBrowsing);
  -[WBMutableTab setShared:](v7, "setShared:", self->_shared);
  return v7;
}

- (WBTab)initWithUUID:(id)a3 title:(id)a4 url:(id)a5 deviceIdentifier:(id)a6 lastVisitTime:(id)a7
{
  id v12;
  __CFString *v13;
  id v14;
  id v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  WebBookmark *v19;
  WBTab *v20;
  WBTab *v21;
  WBTab *v22;

  v12 = a3;
  v13 = (__CFString *)a4;
  v14 = a5;
  v15 = a7;
  if (v13)
    v16 = v13;
  else
    v16 = &stru_24CB35168;
  v17 = v16;
  v18 = a6;
  v19 = -[WebBookmark initWithTitle:address:parentID:deviceIdentifier:collectionType:]([WebBookmark alloc], "initWithTitle:address:parentID:deviceIdentifier:collectionType:", v17, &stru_24CB35168, 0, v18, 1);

  if (v12)
    -[WebBookmark _setUUID:](v19, "_setUUID:", v12);
  if (v15)
  {
    -[WebBookmark setLocalAttributesValue:forKey:](v19, "setLocalAttributesValue:forKey:", v15, *MEMORY[0x24BE83308]);
    -[WebBookmark setTabDateLastViewed:](v19, "setTabDateLastViewed:", v15);
  }
  v20 = -[WBTab initWithBookmark:](self, "initWithBookmark:", v19);
  v21 = v20;
  if (v20)
  {
    -[WBTab _updateBookmarkWithURL:shouldSync:](v20, "_updateBookmarkWithURL:shouldSync:", v14, 0);
    -[WBTab _updateBookmarkWithURL:shouldSync:](v21, "_updateBookmarkWithURL:shouldSync:", v14, 1);
    v21->_modified = 0;
    -[WebBookmark setModifiedAttributes:](v19, "setModifiedAttributes:", 0);
    v22 = v21;
  }

  return v21;
}

- (void)_updateBookmarkWithURL:(id)a3 shouldSync:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id cachedURL;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  v14 = v6;
  if (v4)
  {
    -[WBTab _addressFromURL:](self, "_addressFromURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark address](self->_bookmark, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      cachedURL = self->_cachedURL;
      self->_cachedURL = 0;

      self->_modified = 1;
      -[WBTab _addressFromURL:](self, "_addressFromURL:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WebBookmark setAddress:](self->_bookmark, "setAddress:", v11);

    }
  }
  else
  {
    objc_msgSend(v6, "absoluteString");
    v12 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v12;
    if (v12)
      v13 = (const __CFString *)v12;
    else
      v13 = &stru_24CB35168;
    -[WBTab _setLocalURLString:](self, "_setLocalURLString:", v13);
  }

}

- (WBTab)initWithBookmark:(id)a3
{
  id v5;
  WBTab *v6;
  WBTab *v7;
  WBTab *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBTab;
  v6 = -[WBTab init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bookmark, a3);
    objc_opt_class();
    v7->_isMutable = objc_opt_isKindOfClass() & 1;
    v8 = v7;
  }

  return v7;
}

- (void)_setLocalURLString:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id cachedURL;
  id v8;

  v8 = a3;
  -[WebBookmark extraAttributes](self->_bookmark, "extraAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LocalURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    cachedURL = self->_cachedURL;
    self->_cachedURL = 0;

    self->_modified = 1;
    -[WebBookmark setExtraAttributesValue:forKey:](self->_bookmark, "setExtraAttributesValue:forKey:", v8, CFSTR("LocalURL"));
  }

}

- (id)_addressFromURL:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "safari_isHTTPFamilyURL"))
  {
    objc_msgSend(v3, "absoluteString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24CB35168;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WBTab *v4;
  WBTab *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (WBTab *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WBTab uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBTab uuid](v5, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = WBSIsEqual();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)uuid
{
  return -[WebBookmark UUID](self->_bookmark, "UUID");
}

- (BOOL)isBlank
{
  void *v2;
  BOOL v3;

  -[WBTab url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (NSURL)url
{
  id *p_cachedURL;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSURL *v9;

  p_cachedURL = &self->_cachedURL;
  v4 = self->_cachedURL;
  if (!v4)
  {
    -[WBTab _determineURL](self, "_determineURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v7;

    objc_storeStrong(p_cachedURL, v4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = 0;
  else
    v8 = v4;
  v9 = v8;

  return v9;
}

- (id)_determineURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[WebBookmark extraAttributes](self->_bookmark, "extraAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LocalURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WebBookmark address](self->_bookmark, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length") && objc_msgSend(v7, "safari_isHTTPFamilyURL"))
      v5 = v7;
    else
      v5 = 0;

  }
  return v5;
}

- (BOOL)wasAdded
{
  return self->_added;
}

- (BOOL)isSyncable
{
  return -[WebBookmark isSyncable](self->_bookmark, "isSyncable");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSearchTerm, 0);
  objc_storeStrong((id *)&self->_URLStringComponents, 0);
  objc_storeStrong((id *)&self->_URLStringForLastSearch, 0);
  objc_storeStrong((id *)&self->_titleWords, 0);
  objc_storeStrong((id *)&self->_titleForLastSearch, 0);
  objc_storeStrong(&self->_cachedURL, 0);
  objc_storeStrong((id *)&self->_tabGroupUUID, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
}

+ (id)startPageTabWithDeviceIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTitle:url:deviceIdentifier:", v6, 0, v4);

  return v7;
}

+ (id)pinnedTabWithTitle:(id)a3 url:(id)a4 deviceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:title:url:pinned:pinnedTitle:pinnedURL:localAttributes:deviceIdentifier:", 0, v10, v9, 1, v10, v9, 0, v8);

  return v11;
}

- (WBTab)initWithUUID:(id)a3 deviceIdentifier:(id)a4
{
  return -[WBTab initWithUUID:title:url:deviceIdentifier:](self, "initWithUUID:title:url:deviceIdentifier:", a3, 0, 0, a4);
}

- (WBTab)initWithUUID:(id)a3 deviceIdentifier:(id)a4 lastVisitTime:(id)a5
{
  return -[WBTab initWithUUID:title:url:deviceIdentifier:lastVisitTime:](self, "initWithUUID:title:url:deviceIdentifier:lastVisitTime:", a3, 0, 0, a4, a5);
}

- (WBTab)initWithTitle:(id)a3 url:(id)a4 deviceIdentifier:(id)a5
{
  return -[WBTab initWithUUID:title:url:deviceIdentifier:](self, "initWithUUID:title:url:deviceIdentifier:", 0, a3, a4, a5);
}

- (WBTab)initWithUUID:(id)a3 title:(id)a4 url:(id)a5 pinned:(BOOL)a6 pinnedTitle:(id)a7 pinnedURL:(id)a8 localAttributes:(id)a9 deviceIdentifier:(id)a10
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  WBTab *v19;
  WBTab *v20;
  WebBookmark *bookmark;
  void *v22;
  void *v23;
  WBTab *v24;

  v11 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = -[WBTab initWithUUID:title:url:deviceIdentifier:](self, "initWithUUID:title:url:deviceIdentifier:", a3, a4, a5, a10);
  v20 = v19;
  if (v19)
  {
    bookmark = v19->_bookmark;
    objc_msgSend(v17, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark setPinned:title:address:](bookmark, "setPinned:title:address:", v11, v16, v22);

    objc_msgSend(v18, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark setLocalAttributes:](v20->_bookmark, "setLocalAttributes:", v23);

    -[WebBookmark setNeedsSyncUpdate:](v20->_bookmark, "setNeedsSyncUpdate:", 0);
    -[WebBookmark setModifiedAttributes:](v20->_bookmark, "setModifiedAttributes:", 0);
    v24 = v20;
  }

  return v20;
}

- (WBTab)initWithBookmark:(id)a3 isPrivateBrowsing:(BOOL)a4
{
  WBTab *v5;
  WBTab *v6;
  WBTab *v7;

  v5 = -[WBTab initWithBookmark:](self, "initWithBookmark:", a3);
  v6 = v5;
  if (v5)
  {
    v5->_privateBrowsing = a4;
    v7 = v5;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WBTab uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBTab)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WBTab *v6;
  uint64_t v7;
  NSString *tabGroupUUID;
  WBTab *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookmark"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBTab initWithBookmark:](self, "initWithBookmark:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tabGroupUUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    tabGroupUUID = v6->_tabGroupUUID;
    v6->_tabGroupUUID = (NSString *)v7;

    v6->_privateBrowsing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("privateBrowsing"));
    v6->_inUnnamedTabGroup = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("local"));
    v6->_shared = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shared"));
    v9 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  WebBookmark *bookmark;
  id v5;

  bookmark = self->_bookmark;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bookmark, CFSTR("bookmark"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tabGroupUUID, CFSTR("tabGroupUUID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_privateBrowsing, CFSTR("privateBrowsing"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_inUnnamedTabGroup, CFSTR("local"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shared, CFSTR("shared"));

}

- (WBTab)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  WebBookmark *v5;
  void *v6;
  WebBookmark *v7;
  NSString *v8;
  NSString *tabGroupUUID;
  WBTab *v10;

  v4 = a3;
  v5 = [WebBookmark alloc];
  objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("bookmark"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WebBookmark initWithDictionaryRepresentationForInMemoryChangeTracking:](v5, "initWithDictionaryRepresentationForInMemoryChangeTracking:", v6);

  if (-[WebBookmark isFolder](v7, "isFolder")
    || (self = -[WBTab initWithBookmark:](self, "initWithBookmark:", v7)) == 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("tabGroupUUID"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    tabGroupUUID = self->_tabGroupUUID;
    self->_tabGroupUUID = v8;

    self->_privateBrowsing = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("privateBrowsing"));
    self->_inUnnamedTabGroup = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("local"));
    self->_shared = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("shared"));
    self = self;
    v10 = self;
  }

  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark dictionaryRepresentationForInMemoryChangeTracking](self->_bookmark, "dictionaryRepresentationForInMemoryChangeTracking");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("bookmark"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tabGroupUUID, CFSTR("tabGroupUUID"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_privateBrowsing);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("privateBrowsing"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_inUnnamedTabGroup);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("local"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shared);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("shared"));

  return (NSDictionary *)v3;
}

- (BOOL)hasSameUUIDAndURLAsTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "uuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTab uuidString](self, "uuidString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(v4, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTab url](self, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isShowingReader
{
  return 0;
}

- (NSDictionary)readerScrollPositionDictionary
{
  return 0;
}

- (double)lastViewedTime
{
  void *v2;
  double v3;
  double v4;

  -[WebBookmark dateLastViewed](self->_bookmark, "dateLastViewed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (NSString)URLString
{
  void *v2;
  void *v3;

  -[WBTab url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)deviceIdentifier
{
  return -[WebBookmark deviceIdentifier](self->_bookmark, "deviceIdentifier");
}

- (int)parentIdentifier
{
  return -[WebBookmark parentID](self->_bookmark, "parentID");
}

- (WBLocalTabAttributes)localAttributes
{
  WBLocalTabAttributes *v3;
  void *v4;
  WBLocalTabAttributes *v5;

  v3 = [WBLocalTabAttributes alloc];
  -[WebBookmark localAttributes](self->_bookmark, "localAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WBLocalTabAttributes initWithDictionaryRepresentation:](v3, "initWithDictionaryRepresentation:", v4);

  return v5;
}

- (NSURL)syncableURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  -[WebBookmark address](self->_bookmark, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSString)title
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WebBookmark extraAttributes](self->_bookmark, "extraAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LocalTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[WebBookmark title](self->_bookmark, "title");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (BOOL)isMarkedAsRead
{
  return -[WebBookmark isMarkedAsRead](self->_bookmark, "isMarkedAsRead");
}

- (WBSCRDTPosition)syncPosition
{
  return -[WebBookmark syncPosition](self->_bookmark, "syncPosition");
}

- (int)orderIndex
{
  return -[WebBookmark orderIndex](self->_bookmark, "orderIndex");
}

- (BOOL)isInserted
{
  return -[WebBookmark isInserted](self->_bookmark, "isInserted");
}

- (BOOL)isPinned
{
  return -[WebBookmark isPinned](self->_bookmark, "isPinned");
}

- (NSString)pinnedTitle
{
  return -[WebBookmark pinnedTitle](self->_bookmark, "pinnedTitle");
}

- (NSURL)pinnedURL
{
  void *v2;
  void *v3;

  -[WebBookmark pinnedAddress](self->_bookmark, "pinnedAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (BOOL)isIdentical:(id)a3
{
  id *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (id *)a3;
  if (!WBSIsEqual())
    goto LABEL_6;
  v5 = -[WBTab isPinned](self, "isPinned");
  if (v5 != objc_msgSend(v4, "isPinned"))
    goto LABEL_6;
  -[WBTab title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBSIsEqual();

  if (!v8)
    goto LABEL_6;
  -[WebBookmark extraAttributes](self->_bookmark, "extraAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LocalURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4[1], "extraAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("LocalURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = WBSIsEqual();

  if (v13)
  {
    -[WebBookmark address](self->_bookmark, "address");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[1], "address");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = WBSIsEqual();

  }
  else
  {
LABEL_6:
    v16 = 0;
  }

  return v16;
}

- (id)duplicate
{
  WBMutableTab *v3;
  void *v4;
  WBMutableTab *v5;
  void *v6;

  v3 = [WBMutableTab alloc];
  -[WBTab deviceIdentifier](self, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WBTab initWithUUID:deviceIdentifier:](v3, "initWithUUID:deviceIdentifier:", 0, v4);

  -[WBMutableTab adoptAttributesFromTab:](v5, "adoptAttributesFromTab:", self);
  v6 = (void *)-[WBMutableTab copy](v5, "copy");

  return v6;
}

- (id)mutableDuplicate
{
  WBMutableTab *v3;
  void *v4;
  WBMutableTab *v5;

  v3 = [WBMutableTab alloc];
  -[WBTab deviceIdentifier](self, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WBTab initWithUUID:deviceIdentifier:](v3, "initWithUUID:deviceIdentifier:", 0, v4);

  -[WBMutableTab adoptAttributesFromTab:](v5, "adoptAttributesFromTab:", self);
  return v5;
}

- (BOOL)canSetPinned
{
  return 1;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTab tabGroupUUID](self, "tabGroupUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTab title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTab url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTab uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; tabGroupUUID = %@; title = %@; url = %@; uuid = %@>"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)privacyPreservingDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTab uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; uuid = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)debugSyncDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  WebBookmark *bookmark;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x24BDD16A8];
  -[WBTab title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTab uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, UUID: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  bookmark = self->_bookmark;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __29__WBTab_debugSyncDescription__block_invoke;
  v11[3] = &unk_24CB325B0;
  v12 = v6;
  v8 = v6;
  -[WebBookmark getReadOnlyCachedBookmarkSyncDataUsingBlock:](bookmark, "getReadOnlyCachedBookmarkSyncDataUsingBlock:", v11);
  v9 = (void *)objc_msgSend(v8, "copy");

  return (NSString *)v9;
}

void __29__WBTab_debugSyncDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "record");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ckShortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR(", recordID: %@"), v4);

}

- (BOOL)canCloseAutomaticallyForInterval:(double)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  __int16 v18;
  uint8_t v19[16];
  uint8_t buf[16];
  __int16 v21;
  __int16 v22;
  __int16 v23;

  if (-[WBTab isSyncable](self, "isSyncable"))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v23 = 0;
      v6 = "Not automatically closable because the tab is syncable.";
      v7 = (uint8_t *)&v23;
LABEL_19:
      _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
      return 0;
    }
    return 0;
  }
  if (-[WBTab isPinned](self, "isPinned"))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v22 = 0;
      v6 = "Not automatically closable because tab is pinned.";
      v7 = (uint8_t *)&v22;
      goto LABEL_19;
    }
    return 0;
  }
  -[WBTab localAttributes](self, "localAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastVisitTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v21 = 0;
      v6 = "Not automatically closable because lastViewedTime is unknown.";
      v7 = (uint8_t *)&v21;
      goto LABEL_19;
    }
    return 0;
  }
  if (-[WBTab isBlank](self, "isBlank"))
  {
    v10 = WBS_LOG_CHANNEL_PREFIXTabs();
    v11 = 1;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_INFO, "Tab is automatically closable because it is blank.", buf, 2u);
    }
  }
  else
  {
    -[WBTab localAttributes](self, "localAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastVisitTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceNow");
    v15 = -v14;

    v16 = WBS_LOG_CHANNEL_PREFIXTabs();
    v5 = v16;
    if (v15 <= a3)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v18 = 0;
        v6 = "Not automatically closable because its lastVisitTime does not cross threshold.";
        v7 = (uint8_t *)&v18;
        goto LABEL_19;
      }
      return 0;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_DEFAULT, "Tab is automatically closable because lastVisitTime is beyond threshold from user preference.", v19, 2u);
    }
    return 1;
  }
  return v11;
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (NSString)titleForLastSearch
{
  return self->_titleForLastSearch;
}

- (void)setTitleForLastSearch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)titleWords
{
  return self->_titleWords;
}

- (void)setTitleWords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)URLStringForLastSearch
{
  return self->_URLStringForLastSearch;
}

- (void)setURLStringForLastSearch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)URLStringComponents
{
  return self->_URLStringComponents;
}

- (void)setURLStringComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)lastSearchTerm
{
  return self->_lastSearchTerm;
}

- (void)setLastSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)matchedLastSearch
{
  return self->_matchedLastSearch;
}

- (void)setMatchedLastSearch:(BOOL)a3
{
  self->_matchedLastSearch = a3;
}

- (BOOL)isInUnnamedTabGroup
{
  return self->_inUnnamedTabGroup;
}

- (BOOL)isShared
{
  return self->_shared;
}

- (BOOL)wasModified
{
  return self->_modified;
}

- (BOOL)wasMoved
{
  return self->_moved;
}

- (BOOL)_isMutable
{
  return self->_isMutable;
}

@end
