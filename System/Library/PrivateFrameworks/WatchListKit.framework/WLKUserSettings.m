@implementation WLKUserSettings

- (WLKUserSettings)initWithDictionary:(id)a3
{
  id v4;
  WLKUserSettings *v5;
  void *v6;
  uint64_t v7;
  NSString *country;
  uint64_t v9;
  NSDictionary *brandSidebarSetting;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WLKUserSettings;
  v5 = -[WLKUserSettings init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activeUser = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("activeUser"), 0);
    v5->_ageVerified = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("ageVerified"), 0);
    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("country"));
    v7 = objc_claimAutoreleasedReturnValue();
    country = v5->_country;
    v5->_country = (NSString *)v7;

    v5->_favoritesSyncEnabled = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("favoritesSyncEnabled"), 0);
    v5->_globalAccountConsent = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("gac"), 0);
    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("brandSidebarSetting"));
    v9 = objc_claimAutoreleasedReturnValue();
    brandSidebarSetting = v5->_brandSidebarSetting;
    v5->_brandSidebarSetting = (NSDictionary *)v9;

    *(_WORD *)&v5->_initWithFavoritesSync = 0;
  }

  return v5;
}

- (WLKUserSettings)initWithFavoritesSyncEnabled:(BOOL)a3
{
  WLKUserSettings *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLKUserSettings;
  result = -[WLKUserSettings init](&v5, sel_init);
  if (result)
  {
    result->_favoritesSyncEnabled = a3;
    *(_WORD *)&result->_initWithFavoritesSync = 1;
  }
  return result;
}

- (WLKUserSettings)initWithBrandId:(id)a3 shouldHide:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  WLKUserSettings *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *brandSidebarSetting;
  objc_super v13;
  const __CFString *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v4 = a4;
  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WLKUserSettings;
  v7 = -[WLKUserSettings init](&v13, sel_init);
  if (v7)
  {
    v16 = v6;
    v14 = CFSTR("isHidden");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    brandSidebarSetting = v7->_brandSidebarSetting;
    v7->_brandSidebarSetting = (NSDictionary *)v10;

    *(_WORD *)&v7->_initWithFavoritesSync = 256;
  }

  return v7;
}

- (WLKUserSettings)initWithTabId:(id)a3 shouldPin:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  WLKUserSettings *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *brandSidebarSetting;
  objc_super v13;
  const __CFString *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v4 = a4;
  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WLKUserSettings;
  v7 = -[WLKUserSettings init](&v13, sel_init);
  if (v7)
  {
    v16 = v6;
    v14 = CFSTR("isPinned");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    brandSidebarSetting = v7->_brandSidebarSetting;
    v7->_brandSidebarSetting = (NSDictionary *)v10;

    *(_WORD *)&v7->_initWithFavoritesSync = 256;
  }

  return v7;
}

- (id)_patchJSONDictionary
{
  void *v2;
  void *v3;
  NSDictionary *brandSidebarSetting;
  const __CFString *v6;
  NSDictionary *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self->_initWithFavoritesSync)
  {
    v8 = CFSTR("favoritesSyncEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_favoritesSyncEnabled);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  else if (self->_initWithBrandSidebarSetting)
  {
    brandSidebarSetting = self->_brandSidebarSetting;
    v6 = CFSTR("brandSidebarSetting");
    v7 = brandSidebarSetting;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
}

- (id)_patchData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v7;

  -[WLKUserSettings _patchJSONDictionary](self, "_patchJSONDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0;
  if (!v7)
    v5 = v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v5 + 8) = self->_activeUser;
  *(_BYTE *)(v5 + 9) = self->_ageVerified;
  v6 = -[NSString copyWithZone:](self->_country, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_BYTE *)(v5 + 10) = self->_favoritesSyncEnabled;
  *(_BYTE *)(v5 + 11) = self->_globalAccountConsent;
  v8 = -[NSDictionary copyWithZone:](self->_brandSidebarSetting, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)activeUser
{
  return self->_activeUser;
}

- (BOOL)ageVerified
{
  return self->_ageVerified;
}

- (NSString)country
{
  return self->_country;
}

- (BOOL)favoritesSyncEnabled
{
  return self->_favoritesSyncEnabled;
}

- (BOOL)globalAccountConsent
{
  return self->_globalAccountConsent;
}

- (NSDictionary)brandSidebarSetting
{
  return self->_brandSidebarSetting;
}

- (WLKUserSettings)initWithFavoritesSync
{
  return (WLKUserSettings *)self->_initWithFavoritesSync;
}

- (void)setInitWithFavoritesSync:(BOOL)a3
{
  self->_initWithFavoritesSync = a3;
}

- (WLKUserSettings)initWithBrandSidebarSetting
{
  return (WLKUserSettings *)self->_initWithBrandSidebarSetting;
}

- (void)setInitWithBrandSidebarSetting:(BOOL)a3
{
  self->_initWithBrandSidebarSetting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandSidebarSetting, 0);
  objc_storeStrong((id *)&self->_country, 0);
}

@end
