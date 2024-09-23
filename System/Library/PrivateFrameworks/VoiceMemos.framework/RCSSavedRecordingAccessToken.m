@implementation RCSSavedRecordingAccessToken

+ (id)tokenWithName:(id)a3 accessIntent:(int64_t)a4 compositionAVURL:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3A28];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:accessIntent:compositionAVURL:identifier:", v9, a4, v8, v10);

  return v11;
}

- (RCSSavedRecordingAccessToken)initWithName:(id)a3 accessIntent:(int64_t)a4 compositionAVURL:(id)a5 identifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  RCSSavedRecordingAccessToken *v14;
  RCSSavedRecordingAccessToken *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)RCSSavedRecordingAccessToken;
  v14 = -[RCSSavedRecordingAccessToken init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_accessIntent = a4;
    v14->_exclusive = a4 == 3;
    objc_storeStrong((id *)&v14->_identifier, a6);
    objc_storeStrong((id *)&v15->_compositionAVURL, a5);
    objc_storeStrong((id *)&v15->_accessName, a3);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  RCSSavedRecordingAccessToken *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (RCSSavedRecordingAccessToken *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[RCSSavedRecordingAccessToken identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCSSavedRecordingAccessToken identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[RCSSavedRecordingAccessToken identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  NSString *accessName;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_accessIntent - 1;
  if (v5 > 2)
    v6 = CFSTR("RCSSavedRecordingAccessIntentUnknown");
  else
    v6 = off_1E769C6D0[v5];
  accessName = self->_accessName;
  -[NSURL path](self->_compositionAVURL, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[RCSSavedRecordingAccessToken-%@ access=%@, name=%@, URL=%@]"), v4, v6, accessName, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RCSSavedRecordingAccessToken)initWithCoder:(id)a3
{
  id v4;
  RCSSavedRecordingAccessToken *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *accessName;
  uint64_t v10;
  NSURL *compositionAVURL;
  uint64_t v12;
  NSDictionary *userInfo;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RCSSavedRecordingAccessToken;
  v5 = -[RCSSavedRecordingAccessToken init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("RCSIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("RCSAccessName"));
    v8 = objc_claimAutoreleasedReturnValue();
    accessName = v5->_accessName;
    v5->_accessName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("RCSCompositionAVURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    compositionAVURL = v5->_compositionAVURL;
    v5->_compositionAVURL = (NSURL *)v10;

    v5->_accessIntent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RCSAccessIntent"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("RCSUserInfo"));
    v12 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("RCSIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessName, CFSTR("RCSAccessName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_compositionAVURL, CFSTR("RCSCompositionAVURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accessIntent, CFSTR("RCSAccessIntent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("RCSUserInfo"));

}

- (int64_t)accessIntent
{
  return self->_accessIntent;
}

- (BOOL)isExclusive
{
  return self->_exclusive;
}

- (NSURL)compositionAVURL
{
  return self->_compositionAVURL;
}

- (NSString)accessName
{
  return self->_accessName;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_accessName, 0);
  objc_storeStrong((id *)&self->_compositionAVURL, 0);
}

@end
