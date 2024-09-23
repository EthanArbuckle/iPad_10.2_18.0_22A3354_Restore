@implementation SKUIJSMediaSocialAuthor

- (SKUIJSMediaSocialAuthor)initWithSKUIMediaSocialAuthor:(id)a3
{
  id v5;
  SKUIJSMediaSocialAuthor *v6;
  SKUIJSMediaSocialAuthor *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIJSMediaSocialAuthor initWithSKUIMediaSocialAuthor:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIJSMediaSocialAuthor;
  v6 = -[SKUIJSMediaSocialAuthor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaSocialAuthor, a3);

  return v7;
}

- (NSString)dsId
{
  return -[SKUIMediaSocialAuthor dsid](self->_mediaSocialAuthor, "dsid");
}

- (NSString)entityIdentifier
{
  return -[SKUIMediaSocialAuthor identifier](self->_mediaSocialAuthor, "identifier");
}

- (NSString)entityType
{
  return -[SKUIMediaSocialAuthor authorType](self->_mediaSocialAuthor, "authorType");
}

- (NSString)name
{
  return -[SKUIMediaSocialAuthor name](self->_mediaSocialAuthor, "name");
}

- (NSArray)permissions
{
  return -[SKUIMediaSocialAuthor permissions](self->_mediaSocialAuthor, "permissions");
}

- (NSDictionary)storePlatformData
{
  return -[SKUIMediaSocialAuthor storePlatformData](self->_mediaSocialAuthor, "storePlatformData");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSocialAuthor, 0);
}

- (void)initWithSKUIMediaSocialAuthor:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIJSMediaSocialAuthor initWithSKUIMediaSocialAuthor:]";
}

@end
