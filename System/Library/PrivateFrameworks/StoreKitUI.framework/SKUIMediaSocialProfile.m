@implementation SKUIMediaSocialProfile

- (SKUIMediaSocialProfile)initWithProfileDictionary:(id)a3
{
  id v4;
  SKUIMediaSocialProfile *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *profileType;
  void *v12;
  uint64_t v13;
  NSString *name;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *bio;
  objc_super v20;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialProfile initWithProfileDictionary:].cold.1();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIMediaSocialProfile;
  v5 = -[SKUIMediaSocialProfile init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("entityId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("entityType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      profileType = v5->_profileType;
      v5->_profileType = (NSString *)v10;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v13;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("handle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_handle, v15);
    objc_msgSend(v4, "objectForKey:", CFSTR("bio"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = objc_msgSend(v16, "copy");
      bio = v5->_bio;
      v5->_bio = (NSString *)v17;

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setBackgroundImageURL:", self->_backgroundImageURL);
  objc_msgSend(v4, "setBio:", self->_bio);
  objc_msgSend(v4, "setHandle:", self->_handle);
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setName:", self->_name);
  objc_msgSend(v4, "setProfileImageURL:", self->_profileImageURL);
  objc_msgSend(v4, "setProfileType:", self->_profileType);
  return v4;
}

- (NSURL)backgroundImageURL
{
  return self->_backgroundImageURL;
}

- (void)setBackgroundImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bio
{
  return self->_bio;
}

- (void)setBio:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)profileImageURL
{
  return self->_profileImageURL;
}

- (void)setProfileImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)profileType
{
  return self->_profileType;
}

- (void)setProfileType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileImageURL, 0);
  objc_storeStrong((id *)&self->_profileType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_bio, 0);
  objc_storeStrong((id *)&self->_backgroundImageURL, 0);
}

- (void)initWithProfileDictionary:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMediaSocialProfile initWithProfileDictionary:]";
}

@end
