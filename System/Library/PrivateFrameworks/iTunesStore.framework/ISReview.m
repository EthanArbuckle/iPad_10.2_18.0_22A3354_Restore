@implementation ISReview

- (ISReview)init
{
  objc_super v4;

  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISReview;
  return -[ISReview init](&v4, sel_init);
}

- (ISReview)initWithCoder:(id)a3
{
  ISReview *v4;
  float v5;

  v4 = -[ISReview init](self, "init");
  if (v4)
  {
    v4->_assetType = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("assetType"));
    v4->_body = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
    v4->_bodyMaxLength = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body-max-length")), "unsignedIntegerValue");
    v4->_infoURL = (NSURL *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("infoURL"));
    v4->_itemIdentifier = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemID")), "itemIdentifierValue");
    v4->_nickname = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nickname"));
    v4->_nicknameIsConfirmed = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("nicknameConfirmed"));
    v4->_nicknameMaxLength = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nickname-max-length")), "unsignedIntegerValue");
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("rating"));
    v4->_rating = v5;
    v4->_submitURL = (NSURL *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("save-user-review-url"));
    v4->_title = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v4->_titleMaxLength = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title-max-length")), "unsignedIntegerValue");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_body = 0;
  self->_infoURL = 0;

  self->_nickname = 0;
  self->_submitURL = 0;

  self->_title = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISReview;
  -[ISReview dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = self->_assetType;
  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_body, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 24) = self->_bodyMaxLength;
  *(_QWORD *)(v5 + 32) = -[NSURL copyWithZone:](self->_infoURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 40) = self->_itemIdentifier;
  *(_QWORD *)(v5 + 48) = -[NSString copyWithZone:](self->_nickname, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 56) = self->_nicknameIsConfirmed;
  *(_QWORD *)(v5 + 64) = self->_nicknameMaxLength;
  *(float *)(v5 + 72) = self->_rating;
  *(_QWORD *)(v5 + 80) = -[NSURL copyWithZone:](self->_submitURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 88) = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 96) = self->_titleMaxLength;
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;

  objc_msgSend(a3, "encodeInteger:forKey:", self->_assetType, CFSTR("assetType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_body, CFSTR("body"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_bodyMaxLength), CFSTR("body-max-length"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_infoURL, CFSTR("infoURL"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithItemIdentifier:", self->_itemIdentifier), CFSTR("itemID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_nickname, CFSTR("nickname"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_nicknameIsConfirmed, CFSTR("nicknameConfirmed"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_nicknameMaxLength), CFSTR("nickname-max-length"));
  *(float *)&v5 = self->_rating;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("rating"), v5);
  objc_msgSend(a3, "encodeObject:forKey:", self->_submitURL, CFSTR("save-user-review-url"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_titleMaxLength), CFSTR("title-max-length"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasSavedDraft
{
  uint64_t v2;

  v2 = objc_msgSend(-[ISReview _draftsDirectoryPath](self, "_draftsDirectoryPath"), "stringByAppendingPathComponent:", -[ISReview _draftFileName](self, "_draftFileName"));
  if (v2)
    LOBYTE(v2) = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", v2);
  return v2;
}

- (void)loadFromDictionary:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("metadata"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("body-max-length"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "unsignedIntegerValue");
      v8 = 0x7FFFFFFFFFFFFFFFLL;
      if (v7)
        v8 = v7;
      self->_bodyMaxLength = v8;
    }
    v9 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("nickname-max-length"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "unsignedIntegerValue");
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10)
        v11 = v10;
      self->_nicknameMaxLength = v11;
    }
    v12 = objc_msgSend(v5, "objectForKey:", CFSTR("save-user-review-url"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      self->_submitURL = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v12);
    }
    v13 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("title-max-length"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(v13, "unsignedIntegerValue");
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      if (v14)
        v15 = v14;
      self->_titleMaxLength = v15;
    }
  }
  v16 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("review-info"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("body"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v17, "length"))
        v18 = v17;
      else
        v18 = 0;
      -[ISReview setBody:](self, "setBody:", v18);
    }
    v19 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("nickname"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ISReview setNicknameIsConfirmed:](self, "setNicknameIsConfirmed:", objc_msgSend(v19, "length") != 0);
      if (objc_msgSend(v19, "length"))
        v20 = v19;
      else
        v20 = 0;
      -[ISReview setNickname:](self, "setNickname:", v20);
    }
    v21 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("rating"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "floatValue");
      -[ISReview setRating:](self, "setRating:");
    }
    v22 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("title"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v22, "length"))
        v23 = v22;
      else
        v23 = 0;
      -[ISReview setTitle:](self, "setTitle:", v23);
    }
  }
}

- (void)mergeWithReview:(id)a3 preferLocalValues:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (a4)
  {
    if (!-[NSString length](self->_body, "length"))
      -[ISReview setBody:](self, "setBody:", objc_msgSend(a3, "body"));
    if (self->_bodyMaxLength)
    {
LABEL_8:
      if (!self->_infoURL)
        -[ISReview setInfoURL:](self, "setInfoURL:", objc_msgSend(a3, "infoURL"));
      if (self->_itemIdentifier)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else
  {
    -[ISReview setBody:](self, "setBody:", objc_msgSend(a3, "body"));
  }
  -[ISReview setBodyMaxLength:](self, "setBodyMaxLength:", objc_msgSend(a3, "bodyMaxLength"));
  if (v4)
    goto LABEL_8;
  -[ISReview setInfoURL:](self, "setInfoURL:", objc_msgSend(a3, "infoURL"));
LABEL_13:
  -[ISReview setItemIdentifier:](self, "setItemIdentifier:", objc_msgSend(a3, "itemIdentifier"));
  if (!v4)
  {
    -[ISReview setNicknameIsConfirmed:](self, "setNicknameIsConfirmed:", objc_msgSend(a3, "nicknameIsConfirmed"));
    -[ISReview setNickname:](self, "setNickname:", objc_msgSend(a3, "nickname"));
    goto LABEL_19;
  }
LABEL_14:
  if (!-[NSString length](self->_nickname, "length"))
  {
    -[ISReview setNicknameIsConfirmed:](self, "setNicknameIsConfirmed:", objc_msgSend(a3, "nicknameIsConfirmed"));
    -[ISReview setNickname:](self, "setNickname:", objc_msgSend(a3, "nickname"));
  }
  if (self->_nicknameMaxLength)
  {
LABEL_20:
    if (self->_rating < 0.00000011921)
    {
      objc_msgSend(a3, "rating");
      -[ISReview setRating:](self, "setRating:");
    }
    if (self->_submitURL)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_19:
  -[ISReview setNicknameMaxLength:](self, "setNicknameMaxLength:", objc_msgSend(a3, "nicknameMaxLength"));
  if (v4)
    goto LABEL_20;
  objc_msgSend(a3, "rating");
  -[ISReview setRating:](self, "setRating:");
LABEL_25:
  -[ISReview setSubmitURL:](self, "setSubmitURL:", objc_msgSend(a3, "submitURL"));
  if (!v4)
  {
    -[ISReview setTitle:](self, "setTitle:", objc_msgSend(a3, "title"));
LABEL_31:
    -[ISReview setTitleMaxLength:](self, "setTitleMaxLength:", objc_msgSend(a3, "titleMaxLength"));
    return;
  }
LABEL_26:
  if (!-[NSString length](self->_title, "length"))
    -[ISReview setTitle:](self, "setTitle:", objc_msgSend(a3, "title"));
  if (!self->_titleMaxLength)
    goto LABEL_31;
}

- (BOOL)removeDraft
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = objc_msgSend(-[ISReview _draftsDirectoryPath](self, "_draftsDirectoryPath"), "stringByAppendingPathComponent:", -[ISReview _draftFileName](self, "_draftFileName"));
  if (!v4)
    return 1;
  v5 = v4;
  if (!objc_msgSend(v3, "fileExistsAtPath:", v4))
    return 1;
  v15 = 0;
  v6 = objc_msgSend(v3, "removeItemAtPath:error:", v5, &v15);
  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v7)
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v10 = objc_opt_class();
      v16 = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v15;
      LODWORD(v14) = 22;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v16, v14);
        free(v12);
        SSFileLog();
      }
    }
  }
  return v6;
}

- (BOOL)restoreFromDraft
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = objc_msgSend(-[ISReview _draftsDirectoryPath](self, "_draftsDirectoryPath"), "stringByAppendingPathComponent:", -[ISReview _draftFileName](self, "_draftFileName"));
  if (!v4)
    goto LABEL_6;
  v5 = v4;
  if (!objc_msgSend(v3, "fileExistsAtPath:", v4))
    goto LABEL_6;
  v17 = 0;
  v6 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v5);
  if (v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v17);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "setSubmitURL:", 0);
      -[ISReview mergeWithReview:preferLocalValues:](self, "mergeWithReview:preferLocalValues:", v8, 0);
LABEL_6:
      LOBYTE(v9) = 1;
      return v9;
    }
  }
  v10 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  if (!v10)
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v11 = objc_msgSend(v10, "shouldLog");
  if (objc_msgSend(v10, "shouldLogToDisk"))
    v12 = v11 | 2;
  else
    v12 = v11;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v12 &= 2u;
  if (v12)
  {
    v13 = objc_opt_class();
    v18 = 138412546;
    v19 = v13;
    v20 = 2114;
    v21 = v17;
    LODWORD(v16) = 22;
    v9 = _os_log_send_and_compose_impl();
    if (!v9)
      return v9;
    v14 = (void *)v9;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v18, v16);
    free(v14);
    SSFileLog();
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (BOOL)saveAsDraft
{
  id v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = -[ISReview _draftsDirectoryPath](self, "_draftsDirectoryPath");
  if (!v3 || (objc_msgSend(MEMORY[0x24BDD1580], "ensureDirectoryExists:", v3) & 1) == 0)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v15)
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v16 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v15, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v17 &= 2u;
    if (!v17)
      return 0;
    v23 = 138412546;
    v24 = objc_opt_class();
    v25 = 2112;
    v26 = v3;
    LODWORD(v21) = 22;
    v18 = _os_log_send_and_compose_impl();
    if (!v18)
      return 0;
    v19 = (void *)v18;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v23, v21);
    free(v19);
    goto LABEL_29;
  }
  v22 = 0;
  v4 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v22);
  if (v4)
    v5 = v22 == 0;
  else
    v5 = 0;
  if (!v5
    || (v6 = (void *)v4,
        v7 = objc_msgSend(v3, "stringByAppendingPathComponent:", -[ISReview _draftFileName](self, "_draftFileName")),
        v8 = 1,
        (objc_msgSend(v6, "writeToFile:options:error:", v7, 1, &v22) & 1) == 0))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v9)
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (!v11)
      return 0;
    v12 = objc_opt_class();
    v23 = 138543618;
    v24 = v12;
    v25 = 2114;
    v26 = v22;
    LODWORD(v21) = 22;
    v13 = _os_log_send_and_compose_impl();
    if (!v13)
      return 0;
    v14 = (void *)v13;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v23, v21);
    free(v14);
LABEL_29:
    SSFileLog();
    return 0;
  }
  return v8;
}

- (id)_draftFileName
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu.review"), self->_itemIdentifier);
}

- (id)_draftsDirectoryPath
{
  return (id)objc_msgSend((id)objc_msgSend(-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1), "lastObject"), "stringByAppendingPathComponent:", CFSTR("com.apple.iTunesStore")), "stringByAppendingPathComponent:", CFSTR("Reviews"));
}

- (int64_t)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(int64_t)a3
{
  self->_assetType = a3;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)bodyMaxLength
{
  return self->_bodyMaxLength;
}

- (void)setBodyMaxLength:(unint64_t)a3
{
  self->_bodyMaxLength = a3;
}

- (NSURL)infoURL
{
  return self->_infoURL;
}

- (void)setInfoURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(unint64_t)a3
{
  self->_itemIdentifier = a3;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)nicknameIsConfirmed
{
  return self->_nicknameIsConfirmed;
}

- (void)setNicknameIsConfirmed:(BOOL)a3
{
  self->_nicknameIsConfirmed = a3;
}

- (unint64_t)nicknameMaxLength
{
  return self->_nicknameMaxLength;
}

- (void)setNicknameMaxLength:(unint64_t)a3
{
  self->_nicknameMaxLength = a3;
}

- (float)rating
{
  return self->_rating;
}

- (void)setRating:(float)a3
{
  self->_rating = a3;
}

- (NSURL)submitURL
{
  return self->_submitURL;
}

- (void)setSubmitURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (unint64_t)titleMaxLength
{
  return self->_titleMaxLength;
}

- (void)setTitleMaxLength:(unint64_t)a3
{
  self->_titleMaxLength = a3;
}

@end
