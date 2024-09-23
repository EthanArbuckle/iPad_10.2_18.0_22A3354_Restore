@implementation SKUIGiftTheme

- (SKUIGiftTheme)initWithThemeDictionary:(id)a3
{
  id v4;
  SKUIGiftTheme *v5;
  SKUIUber *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *themeName;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  NSURL *headerImageURL;
  objc_super v23;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftTheme initWithThemeDictionary:].cold.1();
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIGiftTheme;
  v5 = -[SKUIGiftTheme init](&v23, sel_init);
  if (v5)
  {
    v6 = -[SKUIUber initWithUberDictionary:]([SKUIUber alloc], "initWithUberDictionary:", v4);
    -[SKUIUber colorScheme](v6, "colorScheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftTheme setBackgroundColor:](v5, "setBackgroundColor:", v8);

    objc_msgSend(v7, "primaryTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftTheme setBodyTextColor:](v5, "setBodyTextColor:", v9);

    objc_msgSend(v7, "secondaryTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftTheme setPrimaryTextColor:](v5, "setPrimaryTextColor:", v10);

    objc_msgSend(v4, "objectForKey:", CFSTR("fcId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_themeIdentifier = objc_msgSend(v11, "longLongValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("localized_name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      themeName = v5->_themeName;
      v5->_themeName = (NSString *)v13;

    }
    -[SKUIUber artworkProvider](v6, "artworkProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "hasArtwork"))
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scale");
      v18 = v17;

      if (v18 == 2.0)
        objc_msgSend(v15, "largestArtwork");
      else
        objc_msgSend(v15, "smallestArtwork");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "URL");
      v20 = objc_claimAutoreleasedReturnValue();
      headerImageURL = v5->_headerImageURL;
      v5->_headerImageURL = (NSURL *)v20;

    }
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SKUIGiftTheme;
  -[SKUIGiftTheme description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%lld, \"%@\", %@]"), v4, self->_themeIdentifier, self->_themeName, self->_headerImageURL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[UIColor copyWithZone:](self->_backgroundColor, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[UIColor copyWithZone:](self->_bodyTextColor, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  objc_storeStrong((id *)(v5 + 24), self->_headerImage);
  objc_storeStrong((id *)(v5 + 32), self->_headerImageURL);
  v10 = -[UIColor copyWithZone:](self->_primaryTextColor, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  *(_QWORD *)(v5 + 48) = self->_themeIdentifier;
  v12 = -[NSString copyWithZone:](self->_themeName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  return (id)v5;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIColor)bodyTextColor
{
  return self->_bodyTextColor;
}

- (void)setBodyTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (void)setHeaderImage:(id)a3
{
  objc_storeStrong((id *)&self->_headerImage, a3);
}

- (NSURL)headerImageURL
{
  return self->_headerImageURL;
}

- (void)setHeaderImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)themeIdentifier
{
  return self->_themeIdentifier;
}

- (void)setThemeIdentifier:(int64_t)a3
{
  self->_themeIdentifier = a3;
}

- (NSString)themeName
{
  return self->_themeName;
}

- (void)setThemeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeName, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_headerImageURL, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_bodyTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)initWithThemeDictionary:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftTheme initWithThemeDictionary:]";
}

@end
