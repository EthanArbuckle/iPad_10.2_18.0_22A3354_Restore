@implementation WBSCloudTab

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_readerScrollPositionDictionary, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_lastSearchTerm, 0);
  objc_storeStrong((id *)&self->_URLStringComponents, 0);
  objc_storeStrong((id *)&self->_URLStringForLastSearch, 0);
  objc_storeStrong((id *)&self->_titleWords, 0);
  objc_storeStrong((id *)&self->_titleForLastSearch, 0);
}

- (WBSCloudTab)initWithURL:(id)a3 uuid:(id)a4 title:(id)a5 isShowingReader:(BOOL)a6 readerScrollPosition:(id)a7 sceneID:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  WBSCloudTabParameters *v19;
  WBSCloudTab *v20;

  v9 = a6;
  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[WBSCloudTabParameters initWithURL:]([WBSCloudTabParameters alloc], "initWithURL:", v18);

  -[WBSCloudTabParameters setUuid:](v19, "setUuid:", v17);
  -[WBSCloudTabParameters setTitle:](v19, "setTitle:", v16);

  -[WBSCloudTabParameters setShowingReader:](v19, "setShowingReader:", v9);
  -[WBSCloudTabParameters setReaderScrollPosition:](v19, "setReaderScrollPosition:", v15);

  -[WBSCloudTabParameters setSceneID:](v19, "setSceneID:", v14);
  v20 = -[WBSCloudTab initWithParameters:](self, "initWithParameters:", v19);

  return v20;
}

- (WBSCloudTab)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSURL *v9;
  NSURL *url;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  WBSCloudTab *v14;
  void *v15;
  NSUUID *v16;
  NSUUID *uuid;
  void *v18;
  NSString *v19;
  NSString *sceneID;
  NSDictionary *v21;
  NSDictionary *readerScrollPositionDictionary;
  void *v23;
  double v24;
  objc_super v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26.receiver = self;
    v26.super_class = (Class)WBSCloudTab;
    self = -[WBSCloudTab init](&v26, sel_init);
    if (self)
    {
      v5 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v4, "safari_stringForKey:", CFSTR("URL"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safari_URLWithUserTypedString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safari_originalDataAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)(objc_msgSend(v8, "length") - 8193) < 0xFFFFFFFFFFFFE000
        || (objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithDataAsString:", v8),
            v9 = (NSURL *)objc_claimAutoreleasedReturnValue(),
            url = self->_url,
            self->_url = v9,
            url,
            !self->_url))
      {
        v14 = 0;
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v4, "safari_stringForKey:", CFSTR("Title"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");
      if (v12 < 0x81)
      {
        if (v12)
        {
LABEL_12:
          objc_storeStrong((id *)&self->_title, v11);
          objc_msgSend(v4, "safari_stringForKey:", CFSTR("UUID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v15);
            uuid = self->_uuid;
            self->_uuid = v16;

          }
          objc_msgSend(v4, "safari_stringForKey:", CFSTR("OwningSceneID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (NSString *)objc_msgSend(v18, "copy");
          sceneID = self->_sceneID;
          self->_sceneID = v19;

          self->_showingReader = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("IsShowingReader"));
          objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("ReaderScrollPosition"));
          v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          readerScrollPositionDictionary = self->_readerScrollPositionDictionary;
          self->_readerScrollPositionDictionary = v21;

          self->_pinned = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("IsPinned"));
          objc_msgSend(v4, "safari_numberForKey:", CFSTR("DateLastViewed"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          self->_lastViewedTime = v24;

          v14 = self;
          goto LABEL_15;
        }
        v13 = &stru_1E4B40D18;
      }
      else
      {
        objc_msgSend(v11, "substringToIndex:", 128);
        v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }

      v11 = (void *)v13;
      goto LABEL_12;
    }
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (WBSCloudTab)initWithDictionaryFromUserActivityUserInfo:(id)a3
{
  id v4;
  void *v5;
  WBSCloudTab *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("com.apple.Safari.CloudTab"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WBSCloudTab initWithDictionary:](self, "initWithDictionary:", v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WBSCloudTab)initWithURL:(id)a3 uuid:(id)a4 title:(id)a5 isShowingReader:(BOOL)a6 readerScrollPosition:(id)a7 isPinned:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  WBSCloudTabParameters *v18;
  WBSCloudTab *v19;

  v8 = a8;
  v9 = a6;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = -[WBSCloudTabParameters initWithURL:]([WBSCloudTabParameters alloc], "initWithURL:", v17);

  -[WBSCloudTabParameters setUuid:](v18, "setUuid:", v16);
  -[WBSCloudTabParameters setTitle:](v18, "setTitle:", v15);

  -[WBSCloudTabParameters setShowingReader:](v18, "setShowingReader:", v9);
  -[WBSCloudTabParameters setReaderScrollPosition:](v18, "setReaderScrollPosition:", v14);

  -[WBSCloudTabParameters setPinned:](v18, "setPinned:", v8);
  v19 = -[WBSCloudTab initWithParameters:](self, "initWithParameters:", v18);

  return v19;
}

- (WBSCloudTab)initWithParameters:(id)a3
{
  id v4;
  void *v5;
  WBSCloudTab *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_dictionaryWithParameters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WBSCloudTab initWithDictionary:](self, "initWithDictionary:", v5);
  return v6;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

- (NSString)uuidString
{
  return -[NSUUID UUIDString](self->_uuid, "UUIDString");
}

- (BOOL)isEqual:(id)a3
{
  WBSCloudTab *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WBSCloudTab *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WBSCloudTab dictionaryRepresentation](self, "dictionaryRepresentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSCloudTab dictionaryRepresentation](v4, "dictionaryRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToDictionary:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)hasSameUUIDAndURLAsTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "uuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCloudTab uuidString](self, "uuidString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(v4, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", self->_url);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)URLString
{
  return -[NSURL absoluteString](self->_url, "absoluteString");
}

- (NSDictionary)dictionaryRepresentation
{
  WBSCloudTabParameters *v3;
  void *v4;

  v3 = -[WBSCloudTabParameters initWithURL:]([WBSCloudTabParameters alloc], "initWithURL:", self->_url);
  -[WBSCloudTabParameters setUuid:](v3, "setUuid:", self->_uuid);
  -[WBSCloudTabParameters setTitle:](v3, "setTitle:", self->_title);
  -[WBSCloudTabParameters setShowingReader:](v3, "setShowingReader:", self->_showingReader);
  -[WBSCloudTabParameters setReaderScrollPosition:](v3, "setReaderScrollPosition:", self->_readerScrollPositionDictionary);
  -[WBSCloudTabParameters setPinned:](v3, "setPinned:", self->_pinned);
  -[WBSCloudTabParameters setSceneID:](v3, "setSceneID:", self->_sceneID);
  -[WBSCloudTabParameters setLastViewedTime:](v3, "setLastViewedTime:", self->_lastViewedTime);
  objc_msgSend((id)objc_opt_class(), "_dictionaryWithParameters:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSDictionary)dictionaryRepresentationForUserActivityUserInfo
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[WBSCloudTab dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (v3)
  {
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("Title"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("UUID"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("IsPinned"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("DateLastViewed"));
    v6 = CFSTR("com.apple.Safari.CloudTab");
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *title;
  NSURL *url;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  url = self->_url;
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title = \"%@\"; url = \"%@\"; uuid = \"%@\"; showingReader = %d; readerScrollPositionDictionary = %@; isPinned = %d; sceneID = \"%@\">"),
    v5,
    self,
    title,
    url,
    v8,
    self->_showingReader,
    self->_readerScrollPositionDictionary,
    self->_pinned,
    self->_sceneID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

+ (id)_dictionaryWithParameters:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isShowingReader");
  objc_msgSend(v3, "readerScrollPosition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "isPinned");
  objc_msgSend(v3, "sceneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastViewedTime");
  v12 = v11;

  if ((objc_msgSend(v4, "safari_isURLTooLongToDisplay") & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v4, "safari_userVisibleString");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
    {
      if (!v6)
        v6 = &stru_1E4B40D18;
      v20[0] = CFSTR("URL");
      v20[1] = CFSTR("Title");
      v21[0] = v14;
      v21[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v16, "mutableCopy");

      if (v5)
      {
        objc_msgSend(v5, "UUIDString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("UUID"));

      }
      if (v9)
        objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsPinned"));
      if (v10)
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("OwningSceneID"));
      if (v12 != 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("DateLastViewed"));

      }
      if (v7)
      {
        objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsShowingReader"));
        if (objc_msgSend(v8, "count"))
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("ReaderScrollPosition"));
      }
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (BOOL)isShowingReader
{
  return self->_isShowingReader;
}

- (NSString)titleForLastSearch
{
  return self->_titleForLastSearch;
}

- (void)setTitleForLastSearch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)titleWords
{
  return self->_titleWords;
}

- (void)setTitleWords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)URLStringForLastSearch
{
  return self->_URLStringForLastSearch;
}

- (void)setURLStringForLastSearch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)URLStringComponents
{
  return self->_URLStringComponents;
}

- (void)setURLStringComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)lastSearchTerm
{
  return self->_lastSearchTerm;
}

- (void)setLastSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)matchedLastSearch
{
  return self->_matchedLastSearch;
}

- (void)setMatchedLastSearch:(BOOL)a3
{
  self->_matchedLastSearch = a3;
}

- (double)lastViewedTime
{
  return self->_lastViewedTime;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setIsShowingReader:(BOOL)a3
{
  self->_isShowingReader = a3;
}

- (NSDictionary)readerScrollPositionDictionary
{
  return self->_readerScrollPositionDictionary;
}

- (void)setReaderScrollPositionDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

@end
