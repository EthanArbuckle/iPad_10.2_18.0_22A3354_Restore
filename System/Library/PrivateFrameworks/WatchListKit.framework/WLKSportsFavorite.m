@implementation WLKSportsFavorite

- (WLKSportsFavorite)initWithID:(id)a3
{
  id v4;
  WLKSportsFavorite *v5;
  uint64_t v6;
  NSString *ID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLKSportsFavorite;
  v5 = -[WLKSportsFavorite init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    ID = v5->_ID;
    v5->_ID = (NSString *)v6;

  }
  return v5;
}

- (WLKSportsFavorite)initWithDictionary:(id)a3
{
  id v4;
  WLKSportsFavorite *v5;
  uint64_t v6;
  NSString *abbreviation;
  uint64_t v8;
  NSString *backgroundColor;
  uint64_t v10;
  NSString *ID;
  uint64_t v12;
  NSString *leagueId;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *nickName;
  uint64_t v18;
  NSString *shortName;
  void *v20;
  void *v21;
  void *v22;
  WLKSportImageDetails *v23;
  WLKSportImageDetails *v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSDictionary *images;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WLKSportsFavorite;
  v5 = -[WLKSportsFavorite init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("abbreviation"));
    v6 = objc_claimAutoreleasedReturnValue();
    abbreviation = v5->_abbreviation;
    v5->_abbreviation = (NSString *)v6;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("backgroundColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (NSString *)v8;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("id"));
    v10 = objc_claimAutoreleasedReturnValue();
    ID = v5->_ID;
    v5->_ID = (NSString *)v10;

    v5->_isHome = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("isHome"), 0);
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("leagueId"));
    v12 = objc_claimAutoreleasedReturnValue();
    leagueId = v5->_leagueId;
    v5->_leagueId = (NSString *)v12;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("name"));
    v14 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v14;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("nickname"));
    v16 = objc_claimAutoreleasedReturnValue();
    nickName = v5->_nickName;
    v5->_nickName = (NSString *)v16;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("shortName"));
    v18 = objc_claimAutoreleasedReturnValue();
    shortName = v5->_shortName;
    v5->_shortName = (NSString *)v18;

    objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("images"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "wlk_dictionaryForKey:", CFSTR("masterArtLogo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "wlk_dictionaryForKey:", CFSTR("teamLogo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[WLKSportImageDetails initWithDictionary:]([WLKSportImageDetails alloc], "initWithDictionary:", v21);
    v24 = -[WLKSportImageDetails initWithDictionary:]([WLKSportImageDetails alloc], "initWithDictionary:", v22);
    v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v26 = v25;
    if (v23)
      objc_msgSend(v25, "setObject:forKey:", v23, CFSTR("masterArtLogo"));
    if (v24)
      objc_msgSend(v26, "setObject:forKey:", v24, CFSTR("teamLogo"));
    v27 = objc_msgSend(v26, "copy");
    images = v5->_images;
    v5->_images = (NSDictionary *)v27;

  }
  return v5;
}

- (NSString)abbreviation
{
  return self->_abbreviation;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)ID
{
  return self->_ID;
}

- (BOOL)isHome
{
  return self->_isHome;
}

- (NSString)leagueId
{
  return self->_leagueId;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)nickName
{
  return self->_nickName;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSDictionary)images
{
  return self->_images;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_leagueId, 0);
  objc_storeStrong((id *)&self->_ID, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_abbreviation, 0);
}

@end
