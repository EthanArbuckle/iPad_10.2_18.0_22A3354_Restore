@implementation WLKLocale

- (WLKLocale)init
{
  return -[WLKLocale initWithDictionary:](self, "initWithDictionary:", 0);
}

- (WLKLocale)initWithDictionary:(id)a3
{
  id v4;
  WLKLocale *v5;
  uint64_t v6;
  NSString *displayName;
  void *v8;
  void *v9;
  uint64_t v10;
  NSLocale *locale;
  WLKLocale *v12;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)WLKLocale;
    v5 = -[WLKLocale init](&v14, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("displayName"));
      v6 = objc_claimAutoreleasedReturnValue();
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v6;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("locale"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "copy");
        locale = v5->_locale;
        v5->_locale = (NSLocale *)v10;

      }
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
