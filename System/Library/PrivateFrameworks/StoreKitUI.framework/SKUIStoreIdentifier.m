@implementation SKUIStoreIdentifier

- (SKUIStoreIdentifier)initWithLongLong:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIStoreIdentifier *v13;
  SKUIStoreIdentifier *v14;
  uint64_t v15;
  NSNumber *itemIdentifier;
  objc_super v18;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIStoreIdentifier initWithLongLong:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIStoreIdentifier;
  v13 = -[SKUIStoreIdentifier init](&v18, sel_init);
  v14 = v13;
  if (a3 && v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v15 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v14->_itemIdentifier;
    v14->_itemIdentifier = (NSNumber *)v15;

  }
  return v14;
}

- (SKUIStoreIdentifier)initWithNumber:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIStoreIdentifier *v13;
  uint64_t v14;
  NSNumber *itemIdentifier;
  objc_super v17;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIStoreIdentifier initWithNumber:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIStoreIdentifier;
  v13 = -[SKUIStoreIdentifier init](&v17, sel_init);
  if (v13 && objc_msgSend(v4, "longLongValue"))
  {
    v14 = objc_msgSend(v4, "copy");
    itemIdentifier = v13->_itemIdentifier;
    v13->_itemIdentifier = (NSNumber *)v14;

  }
  return v13;
}

- (SKUIStoreIdentifier)initWithPodcastFeedURL:(id)a3
{
  id v5;
  SKUIStoreIdentifier *v6;
  SKUIStoreIdentifier *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStoreIdentifier initWithPodcastFeedURL:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIStoreIdentifier;
  v6 = -[SKUIStoreIdentifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_podcastFeedURLIdentifier, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKUIStoreIdentifier *v4;
  id *p_isa;

  v4 = -[SKUIStoreIdentifier init](+[SKUIStoreIdentifier allocWithZone:](SKUIStoreIdentifier, "allocWithZone:", a3), "init");
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_itemIdentifier, self->_itemIdentifier);
    objc_storeStrong(p_isa + 2, self->_podcastFeedURLIdentifier);
    objc_storeStrong(p_isa + 3, self->_bundleIdentifier);
  }
  return p_isa;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SKUIStoreIdentifier;
  -[SKUIStoreIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStoreIdentifier numberValue](self, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@, %@]"), v4, v5, self->_podcastFeedURLIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  -[SKUIStoreIdentifier numberValue](self, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_podcastFeedURLIdentifier, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SKUIStoreIdentifier *v4;
  NSNumber *itemIdentifier;
  NSNumber *v6;
  BOOL v7;
  NSString *bundleIdentifier;
  NSString *podcastFeedURLIdentifier;
  void *v11;

  v4 = (SKUIStoreIdentifier *)a3;
  if (self == v4)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    LOBYTE(bundleIdentifier) = 0;
    goto LABEL_13;
  }
  itemIdentifier = self->_itemIdentifier;
  if (itemIdentifier)
  {
    v6 = v4->_itemIdentifier;
    if (itemIdentifier != v6)
    {
      if (v6)
      {
        v7 = -[NSNumber isEqualToNumber:](itemIdentifier, "isEqualToNumber:");
LABEL_11:
        LOBYTE(bundleIdentifier) = v7;
        goto LABEL_13;
      }
      goto LABEL_7;
    }
LABEL_12:
    LOBYTE(bundleIdentifier) = 1;
    goto LABEL_13;
  }
  podcastFeedURLIdentifier = self->_podcastFeedURLIdentifier;
  if (podcastFeedURLIdentifier)
  {
    if (podcastFeedURLIdentifier != v4->_podcastFeedURLIdentifier)
    {
      v7 = -[NSString isEqualToString:](podcastFeedURLIdentifier, "isEqualToString:");
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    -[SKUIStoreIdentifier bundleIdentifier](v4, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(bundleIdentifier) = -[NSString isEqualToString:](bundleIdentifier, "isEqualToString:", v11);

  }
LABEL_13:

  return (char)bundleIdentifier;
}

- (int64_t)longLongValue
{
  int64_t result;

  result = (int64_t)self->_itemIdentifier;
  if (result)
    return objc_msgSend((id)result, "longLongValue");
  return result;
}

- (id)numberValue
{
  return self->_itemIdentifier;
}

- (id)stringValue
{
  NSString *v3;
  NSString *podcastFeedURLIdentifier;

  if (self->_itemIdentifier && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSNumber stringValue](self->_itemIdentifier, "stringValue");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    podcastFeedURLIdentifier = self->_podcastFeedURLIdentifier;
    if (podcastFeedURLIdentifier)
      v3 = podcastFeedURLIdentifier;
    else
      v3 = 0;
  }
  return v3;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)podcastFeedURLIdentifier
{
  return self->_podcastFeedURLIdentifier;
}

- (void)setPodcastFeedURLIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_podcastFeedURLIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_podcastFeedURLIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (void)initWithLongLong:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithNumber:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithPodcastFeedURL:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStoreIdentifier initWithPodcastFeedURL:]";
  OUTLINED_FUNCTION_1();
}

@end
