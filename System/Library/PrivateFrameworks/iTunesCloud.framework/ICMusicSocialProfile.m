@implementation ICMusicSocialProfile

- (ICMusicSocialProfile)initWithMediaAPIResponse:(id)a3
{
  void *v4;
  ICMusicSocialProfile *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *socialProfileID;
  uint64_t v10;
  NSString *handle;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  ICStoreArtworkInfo *v17;
  ICStoreArtworkInfo *v18;
  ICStoreArtworkInfo *v19;
  NSObject *p_super;
  ICMusicSocialProfile *v21;
  uint8_t v23[16];
  objc_super v24;

  +[ICMusicSocialProfile socialProfileInfoFromMediaAPIResponse:](ICMusicSocialProfile, "socialProfileInfoFromMediaAPIResponse:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v24.receiver = self;
    v24.super_class = (Class)ICMusicSocialProfile;
    v5 = -[ICMusicSocialProfile init](&v24, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.name"));
      v6 = objc_claimAutoreleasedReturnValue();
      name = v5->_name;
      v5->_name = (NSString *)v6;

      objc_msgSend(v4, "valueForKeyPath:", CFSTR("id"));
      v8 = objc_claimAutoreleasedReturnValue();
      socialProfileID = v5->_socialProfileID;
      v5->_socialProfileID = (NSString *)v8;

      objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.handle"));
      v10 = objc_claimAutoreleasedReturnValue();
      handle = v5->_handle;
      v5->_handle = (NSString *)v10;

      objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.isPrivate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_NSIsNSString() & 1) != 0 || (v13 = _NSIsNSNumber()) != 0)
        LOBYTE(v13) = objc_msgSend(v12, "BOOLValue");
      v5->_isPrivate = v13;
      objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.isVerified"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_NSIsNSString() & 1) != 0 || (v15 = _NSIsNSNumber()) != 0)
        LOBYTE(v15) = objc_msgSend(v14, "BOOLValue");
      v5->_isVerified = v15;
      objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.artwork"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        v17 = -[ICStoreArtworkInfo initWithArtworkResponseDictionary:]([ICStoreArtworkInfo alloc], "initWithArtworkResponseDictionary:", v16);
        v18 = v17;
        if (v17)
        {
          v19 = v17;
          p_super = &v5->_artworkInfo->super;
          v5->_artworkInfo = v19;
        }
        else
        {
          p_super = os_log_create("com.apple.amp.iTunesCloud", "UserState");
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_1A03E3000, p_super, OS_LOG_TYPE_ERROR, "[ICMusicSocialProfile initWithResponse:] invalid artwork response dictionary", v23, 2u);
          }
        }

      }
    }
    self = v5;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artworkInfo, CFSTR("artwork"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handle, CFSTR("handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_socialProfileID, CFSTR("socialProfileID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPrivate, CFSTR("isPrivate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isVerified, CFSTR("isVerified"));

}

- (ICMusicSocialProfile)initWithCoder:(id)a3
{
  id v4;
  ICMusicSocialProfile *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  ICStoreArtworkInfo *artworkInfo;
  uint64_t v10;
  NSString *handle;
  uint64_t v12;
  NSString *socialProfileID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICMusicSocialProfile;
  v5 = -[ICMusicSocialProfile init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artwork"));
    v8 = objc_claimAutoreleasedReturnValue();
    artworkInfo = v5->_artworkInfo;
    v5->_artworkInfo = (ICStoreArtworkInfo *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v10 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("socialProfileID"));
    v12 = objc_claimAutoreleasedReturnValue();
    socialProfileID = v5->_socialProfileID;
    v5->_socialProfileID = (NSString *)v12;

    v5->_isPrivate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrivate"));
    v5->_isVerified = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isVerified"));
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  char v7;
  id v9;
  id v10;
  int v11;
  id v12;
  id v13;
  int v14;
  id v15;
  id v16;
  int v17;
  void *v18;
  void *v19;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[ICMusicSocialProfile isPrivate](self, "isPrivate");
    if (v5 == objc_msgSend(v4, "isPrivate"))
    {
      v6 = -[ICMusicSocialProfile isVerified](self, "isVerified");
      if (v6 == objc_msgSend(v4, "isVerified"))
      {
        -[ICMusicSocialProfile name](self, "name");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v9 == v10)
        {

        }
        else
        {
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (!v11)
          {
            v7 = 0;
LABEL_24:

            goto LABEL_5;
          }
        }
        -[ICMusicSocialProfile handle](self, "handle");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handle");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v12 == v13)
        {

        }
        else
        {
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if (!v14)
          {
            v7 = 0;
LABEL_23:

            goto LABEL_24;
          }
        }
        -[ICMusicSocialProfile socialProfileID](self, "socialProfileID");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "socialProfileID");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v15 == v16)
        {

        }
        else
        {
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if (!v17)
          {
            v7 = 0;
LABEL_22:

            goto LABEL_23;
          }
        }
        -[ICMusicSocialProfile artworkInfo](self, "artworkInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "artworkInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 == v19)
          v7 = 1;
        else
          v7 = objc_msgSend(v18, "isEqual:", v19);

        goto LABEL_22;
      }
    }
  }
  v7 = 0;
LABEL_5:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICMusicSocialProfile *v4;
  void *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  uint64_t v9;
  ICStoreArtworkInfo *artworkInfo;
  void *v11;
  uint64_t v12;
  NSString *handle;
  void *v14;
  uint64_t v15;
  NSString *socialProfileID;

  v4 = -[ICMusicSocialProfile init](+[ICMusicSocialProfile allocWithZone:](ICMusicSocialProfile, "allocWithZone:", a3), "init");
  -[ICMusicSocialProfile name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  name = v4->_name;
  v4->_name = (NSString *)v6;

  -[ICMusicSocialProfile artworkInfo](self, "artworkInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  artworkInfo = v4->_artworkInfo;
  v4->_artworkInfo = (ICStoreArtworkInfo *)v9;

  -[ICMusicSocialProfile handle](self, "handle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  handle = v4->_handle;
  v4->_handle = (NSString *)v12;

  -[ICMusicSocialProfile socialProfileID](self, "socialProfileID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  socialProfileID = v4->_socialProfileID;
  v4->_socialProfileID = (NSString *)v15;

  v4->_isPrivate = -[ICMusicSocialProfile isPrivate](self, "isPrivate");
  v4->_isVerified = -[ICMusicSocialProfile isVerified](self, "isVerified");
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)socialProfileID
{
  return self->_socialProfileID;
}

- (ICStoreArtworkInfo)artworkInfo
{
  return self->_artworkInfo;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkInfo, 0);
  objc_storeStrong((id *)&self->_socialProfileID, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)mediaAPIRequestURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://amp-api.music.apple.com/v1/me/account?include=social-profile&with=nonOnboarded"));
}

+ (id)socialProfileInfoFromMediaAPIResponse:(id)a3
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  uint8_t v20[16];
  uint8_t buf[16];

  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("data"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "[ICMusicSocialProfile] invalid response. userData=nil", v20, 2u);
      }
      v12 = 0;
      goto LABEL_22;
    }
    -[NSObject valueForKeyPath:](v4, "valueForKeyPath:", CFSTR("relationships.social-profile.data"));
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject firstObject](v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "valueForKeyPath:", CFSTR("id"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = _NSIsNSString();

      if ((v9 & 1) != 0)
      {
        objc_msgSend(v7, "valueForKeyPath:", CFSTR("attributes.name"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = _NSIsNSString();

        if ((v11 & 1) != 0)
        {
          v12 = v7;
LABEL_21:

LABEL_22:
          goto LABEL_23;
        }
        v13 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v17 = 0;
          v14 = "[ICMusicSocialProfile] invalid response. name=nil";
          v15 = (uint8_t *)&v17;
          goto LABEL_19;
        }
LABEL_20:

        v12 = 0;
        goto LABEL_21;
      }
      v13 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v18 = 0;
      v14 = "[ICMusicSocialProfile] invalid response. socialProfileID=nil";
      v15 = (uint8_t *)&v18;
    }
    else
    {
      v13 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v19 = 0;
      v14 = "[ICMusicSocialProfile] invalid response. socialProfileInfo=nil";
      v15 = (uint8_t *)&v19;
    }
LABEL_19:
    _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, v14, v15, 2u);
    goto LABEL_20;
  }
  v4 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "[ICMusicSocialProfile] invalid response. response=nil", buf, 2u);
  }
  v12 = 0;
LABEL_23:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
