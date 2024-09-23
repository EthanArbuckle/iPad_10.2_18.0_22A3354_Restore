@implementation ICMusicUserProfile

- (ICMusicUserProfile)initWithMediaAPIResponse:(id)a3
{
  id v4;
  void *v5;
  ICMusicUserProfile *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  ICMusicUserProfile *v10;
  uint64_t v11;
  NSArray *acceptedTerms;
  void *v13;
  ICStoreArtworkInfo *v14;
  ICStoreArtworkInfo *v15;
  ICStoreArtworkInfo *v16;
  NSObject *p_super;
  ICMusicUserProfile *v18;
  uint64_t v19;
  NSString *handle;
  ICMusicSocialProfile *v21;
  ICMusicSocialProfile *socialProfile;
  __int16 v24;
  _QWORD v25[4];
  ICMusicUserProfile *v26;
  objc_super v27;

  v4 = a3;
  +[ICMusicUserProfile attributesInfoFromMediaAPIResponse:](ICMusicUserProfile, "attributesInfoFromMediaAPIResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v27.receiver = self;
    v27.super_class = (Class)ICMusicUserProfile;
    v6 = -[ICMusicUserProfile init](&v27, sel_init);
    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v7 = objc_claimAutoreleasedReturnValue();
      name = v6->_name;
      v6->_name = (NSString *)v7;

      v6->_isPrivate = -[ICMusicUserProfile _capabilityForKey:fromAttributes:](v6, "_capabilityForKey:fromAttributes:", CFSTR("isPrivate"), v5);
      v6->_isDiscoverableByContact = -[ICMusicUserProfile _capabilityForKey:fromAttributes:](v6, "_capabilityForKey:fromAttributes:", CFSTR("isDiscoverableByContact"), v5);
      v6->_isContactCheckAllowed = -[ICMusicUserProfile _capabilityForKey:fromAttributes:](v6, "_capabilityForKey:fromAttributes:", CFSTR("isContactCheckAllowed"), v5);
      v6->_isVerified = -[ICMusicUserProfile _capabilityForKey:fromAttributes:](v6, "_capabilityForKey:fromAttributes:", CFSTR("isVerified"), v5);
      v6->_isOnboarded = -[ICMusicUserProfile _capabilityForKey:fromAttributes:](v6, "_capabilityForKey:fromAttributes:", CFSTR("isOnboarded"), v5);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("acceptedTerms"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_displayNameAccepted = objc_msgSend(v9, "containsObject:", CFSTR("displayName"));
      v6->_collaborationAllowed = objc_msgSend(v9, "containsObject:", CFSTR("collaboration"));
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __47__ICMusicUserProfile_initWithMediaAPIResponse___block_invoke;
      v25[3] = &unk_1E438E840;
      v10 = v6;
      v26 = v10;
      objc_msgSend(v9, "msv_map:", v25);
      v11 = objc_claimAutoreleasedReturnValue();
      acceptedTerms = v10->_acceptedTerms;
      v10->_acceptedTerms = (NSArray *)v11;

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        v14 = -[ICStoreArtworkInfo initWithArtworkResponseDictionary:]([ICStoreArtworkInfo alloc], "initWithArtworkResponseDictionary:", v13);
        v15 = v14;
        if (v14)
        {
          v16 = v14;
          p_super = &v10->_artworkInfo->super;
          v10->_artworkInfo = v16;
        }
        else
        {
          p_super = os_log_create("com.apple.amp.iTunesCloud", "UserState");
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          {
            v24 = 0;
            _os_log_impl(&dword_1A03E3000, p_super, OS_LOG_TYPE_ERROR, "[ICMusicUserProfile initWithResponse:] invalid artwork response dictionary", (uint8_t *)&v24, 2u);
          }
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("handle"));
      v19 = objc_claimAutoreleasedReturnValue();
      handle = v10->_handle;
      v10->_handle = (NSString *)v19;

      v21 = -[ICMusicSocialProfile initWithMediaAPIResponse:]([ICMusicSocialProfile alloc], "initWithMediaAPIResponse:", v4);
      socialProfile = v10->_socialProfile;
      v10->_socialProfile = v21;

    }
    self = v6;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICMusicUserProfile socialProfile](self, "socialProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[<ICMusicUserProfile:%p> socialProfile=%@; isOnboarded=%d, collaborationAllowed=%d]"),
    self,
    v4,
    self->_isOnboarded,
    self->_collaborationAllowed);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setSocialProfile:(id)a3
{
  objc_storeStrong((id *)&self->_socialProfile, a3);
}

- (NSString)socialProfileID
{
  return -[ICMusicSocialProfile socialProfileID](self->_socialProfile, "socialProfileID");
}

- (BOOL)_capabilityForKey:(id)a3 fromAttributes:(id)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) != 0 || _NSIsNSString())
  {
    v7 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "[ICMusicUserProfile] attributesInfo missing value for key '%@'. Defaulting to \"NO\", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_socialProfile, CFSTR("socialProfile"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPrivate, CFSTR("isPrivate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDiscoverableByContact, CFSTR("isDiscoverableByContact"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isContactCheckAllowed, CFSTR("isContactCheckAllowed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isVerified, CFSTR("isVerified"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isOnboarded, CFSTR("isOnboarded"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_collaborationAllowed, CFSTR("collaborationAllowed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_displayNameAccepted, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_acceptedTerms, CFSTR("acceptedTerms"));

}

- (ICMusicUserProfile)initWithCoder:(id)a3
{
  id v4;
  ICMusicUserProfile *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  ICStoreArtworkInfo *artworkInfo;
  uint64_t v10;
  NSString *handle;
  uint64_t v12;
  ICMusicSocialProfile *socialProfile;
  uint64_t v14;
  NSArray *acceptedTerms;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICMusicUserProfile;
  v5 = -[ICMusicUserProfile init](&v17, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("socialProfile"));
    v12 = objc_claimAutoreleasedReturnValue();
    socialProfile = v5->_socialProfile;
    v5->_socialProfile = (ICMusicSocialProfile *)v12;

    v5->_isPrivate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrivate"));
    v5->_isDiscoverableByContact = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDiscoverableByContact"));
    v5->_isContactCheckAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isContactCheckAllowed"));
    v5->_isVerified = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isVerified"));
    v5->_isOnboarded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOnboarded"));
    v5->_collaborationAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("collaborationAllowed"));
    v5->_displayNameAccepted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("displayName"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("acceptedTerms"));
    v14 = objc_claimAutoreleasedReturnValue();
    acceptedTerms = v5->_acceptedTerms;
    v5->_acceptedTerms = (NSArray *)v14;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  char v12;
  id v14;
  id v15;
  int v16;
  id v17;
  id v18;
  int v19;
  id v20;
  id v21;
  int v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  int v30;
  id v31;
  id v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[ICMusicUserProfile isPrivate](self, "isPrivate");
    if (v5 == objc_msgSend(v4, "isPrivate"))
    {
      v6 = -[ICMusicUserProfile isDiscoverableByContact](self, "isDiscoverableByContact");
      if (v6 == objc_msgSend(v4, "isDiscoverableByContact"))
      {
        v7 = -[ICMusicUserProfile isContactCheckAllowed](self, "isContactCheckAllowed");
        if (v7 == objc_msgSend(v4, "isContactCheckAllowed"))
        {
          v8 = -[ICMusicUserProfile isVerified](self, "isVerified");
          if (v8 == objc_msgSend(v4, "isVerified"))
          {
            v9 = -[ICMusicUserProfile isOnboarded](self, "isOnboarded");
            if (v9 == objc_msgSend(v4, "isOnboarded"))
            {
              v10 = -[ICMusicUserProfile collaborationAllowed](self, "collaborationAllowed");
              if (v10 == objc_msgSend(v4, "collaborationAllowed"))
              {
                v11 = -[ICMusicUserProfile displayNameAccepted](self, "displayNameAccepted");
                if (v11 == objc_msgSend(v4, "displayNameAccepted"))
                {
                  -[ICMusicUserProfile name](self, "name");
                  v14 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "name");
                  v15 = (id)objc_claimAutoreleasedReturnValue();
                  if (v14 == v15)
                  {

                  }
                  else
                  {
                    v16 = objc_msgSend(v14, "isEqual:", v15);

                    if (!v16)
                    {
                      v12 = 0;
LABEL_39:

                      goto LABEL_10;
                    }
                  }
                  -[ICMusicUserProfile handle](self, "handle");
                  v17 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "handle");
                  v18 = (id)objc_claimAutoreleasedReturnValue();
                  if (v17 == v18)
                  {

                  }
                  else
                  {
                    v19 = objc_msgSend(v17, "isEqual:", v18);

                    if (!v19)
                    {
                      v12 = 0;
LABEL_38:

                      goto LABEL_39;
                    }
                  }
                  -[ICMusicUserProfile socialProfileID](self, "socialProfileID");
                  v20 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "socialProfileID");
                  v21 = (id)objc_claimAutoreleasedReturnValue();
                  if (v20 == v21)
                  {

                  }
                  else
                  {
                    v22 = objc_msgSend(v20, "isEqual:", v21);

                    if (!v22)
                    {
                      v12 = 0;
LABEL_37:

                      goto LABEL_38;
                    }
                  }
                  -[ICMusicUserProfile artworkInfo](self, "artworkInfo");
                  v23 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "artworkInfo");
                  v24 = (id)objc_claimAutoreleasedReturnValue();
                  v40 = v24;
                  if (v23 == v24)
                  {

                  }
                  else
                  {
                    v38 = v14;
                    v25 = v20;
                    v26 = v18;
                    v27 = v17;
                    v28 = v21;
                    v29 = v24;
                    v30 = objc_msgSend(v23, "isEqual:", v24);

                    v21 = v28;
                    v17 = v27;
                    v18 = v26;
                    v20 = v25;
                    v14 = v38;
                    if (!v30)
                    {
                      v12 = 0;
LABEL_36:

                      goto LABEL_37;
                    }
                  }
                  v39 = v23;
                  -[ICMusicUserProfile socialProfile](self, "socialProfile");
                  v31 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "socialProfile");
                  v32 = (id)objc_claimAutoreleasedReturnValue();
                  v37 = v31;
                  if (v31 == v32)
                  {

                  }
                  else
                  {
                    v33 = objc_msgSend(v31, "isEqual:", v32);

                    if (!v33)
                    {
                      v12 = 0;
LABEL_35:

                      v23 = v39;
                      goto LABEL_36;
                    }
                  }
                  -[ICMusicUserProfile acceptedTerms](self, "acceptedTerms", v20, v37);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "acceptedTerms");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v34 == v35)
                    v12 = 1;
                  else
                    v12 = objc_msgSend(v34, "isEqual:", v35);

                  v20 = v36;
                  goto LABEL_35;
                }
              }
            }
          }
        }
      }
    }
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICMusicUserProfile *v4;
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
  ICMusicSocialProfile *socialProfile;
  void *v17;
  uint64_t v18;
  NSArray *acceptedTerms;

  v4 = -[ICMusicUserProfile init](+[ICMusicUserProfile allocWithZone:](ICMusicUserProfile, "allocWithZone:", a3), "init");
  -[ICMusicUserProfile name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  name = v4->_name;
  v4->_name = (NSString *)v6;

  -[ICMusicUserProfile artworkInfo](self, "artworkInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  artworkInfo = v4->_artworkInfo;
  v4->_artworkInfo = (ICStoreArtworkInfo *)v9;

  -[ICMusicUserProfile handle](self, "handle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  handle = v4->_handle;
  v4->_handle = (NSString *)v12;

  -[ICMusicUserProfile socialProfile](self, "socialProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  socialProfile = v4->_socialProfile;
  v4->_socialProfile = (ICMusicSocialProfile *)v15;

  v4->_isPrivate = -[ICMusicUserProfile isPrivate](self, "isPrivate");
  v4->_isDiscoverableByContact = -[ICMusicUserProfile isDiscoverableByContact](self, "isDiscoverableByContact");
  v4->_isContactCheckAllowed = -[ICMusicUserProfile isContactCheckAllowed](self, "isContactCheckAllowed");
  v4->_isVerified = -[ICMusicUserProfile isVerified](self, "isVerified");
  v4->_isOnboarded = -[ICMusicUserProfile isOnboarded](self, "isOnboarded");
  v4->_collaborationAllowed = -[ICMusicUserProfile collaborationAllowed](self, "collaborationAllowed");
  v4->_displayNameAccepted = -[ICMusicUserProfile displayNameAccepted](self, "displayNameAccepted");
  -[ICMusicUserProfile acceptedTerms](self, "acceptedTerms");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copy");
  acceptedTerms = v4->_acceptedTerms;
  v4->_acceptedTerms = (NSArray *)v18;

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

- (NSArray)acceptedTerms
{
  return self->_acceptedTerms;
}

- (ICStoreArtworkInfo)artworkInfo
{
  return self->_artworkInfo;
}

- (ICMusicSocialProfile)socialProfile
{
  return self->_socialProfile;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (BOOL)isDiscoverableByContact
{
  return self->_isDiscoverableByContact;
}

- (BOOL)isContactCheckAllowed
{
  return self->_isContactCheckAllowed;
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (BOOL)isOnboarded
{
  return self->_isOnboarded;
}

- (BOOL)collaborationAllowed
{
  return self->_collaborationAllowed;
}

- (BOOL)displayNameAccepted
{
  return self->_displayNameAccepted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialProfile, 0);
  objc_storeStrong((id *)&self->_artworkInfo, 0);
  objc_storeStrong((id *)&self->_acceptedTerms, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

__CFString *__47__ICMusicUserProfile_initWithMediaAPIResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (_NSIsNSString())
  {
    v4 = (__CFString *)v3;
LABEL_5:
    v5 = v4;
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "stringValue");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 134218242;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_FAULT, "<ICMusicUserProfile %p> initWithMediaAPIResponse: unable to convert acceptedTerm to valid string. item=%@", (uint8_t *)&v9, 0x16u);
  }

  v5 = &stru_1E4391778;
LABEL_9:

  return v5;
}

+ (id)mediaAPIRequestURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://amp-api.music.apple.com/v1/me/social/profile?include=social-profile&with=nonOnboarded"));
}

+ (id)attributesInfoFromMediaAPIResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  os_log_t v14;
  os_log_t v15;
  NSObject *v16;
  _QWORD v18[4];
  os_log_t v19;
  uint64_t *v20;
  uint8_t buf[16];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("data"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("attributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _NSIsNSDictionary();

    if ((v8 & 1) != 0)
    {
      -[NSObject objectForKey:](v6, "objectForKey:", CFSTR("attributes"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("name"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = _NSIsNSString();

      if ((v11 & 1) == 0)
      {
        v12 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "[ICMusicUserProfile] invalid entry for key 'name'", buf, 2u);
        }

        *((_BYTE *)v23 + 24) = 0;
      }
      v26[0] = CFSTR("isPrivate");
      v26[1] = CFSTR("isDiscoverableByContact");
      v26[2] = CFSTR("isContactCheckAllowed");
      v26[3] = CFSTR("isVerified");
      v26[4] = CFSTR("isOnboarded");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __57__ICMusicUserProfile_attributesInfoFromMediaAPIResponse___block_invoke;
      v18[3] = &unk_1E438E818;
      v14 = v9;
      v19 = v14;
      v20 = &v22;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v18);
      if (*((_BYTE *)v23 + 24))
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

    }
    else
    {
      v14 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "[ICMusicUserProfile] invalid response. response missing attributes", buf, 2u);
      }
      v16 = 0;
    }

  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "[ICMusicUserProfile] invalid response. response=nil", buf, 2u);
    }
    v16 = 0;
  }

  _Block_object_dispose(&v22, 8);
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __57__ICMusicUserProfile_attributesInfoFromMediaAPIResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) == 0 && (_NSIsNSString() & 1) == 0)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "[ICMusicUserProfile] invalid entry for key '%@'", (uint8_t *)&v6, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

@end
