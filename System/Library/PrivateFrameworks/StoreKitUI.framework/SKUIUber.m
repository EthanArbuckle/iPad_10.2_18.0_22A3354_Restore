@implementation SKUIUber

- (SKUIUber)initWithUberDictionary:(id)a3
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
  SKUIUber *v13;
  void *v14;
  uint64_t v15;
  SKUIArtworkProviding *artworkProvider;
  void *v17;
  uint64_t v18;
  NSString *text;
  SKUIColorScheme *v20;
  SKUIColorScheme *colorScheme;
  objc_super v23;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIUber initWithUberDictionary:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIUber;
  v13 = -[SKUIUber init](&v23, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("masterArt"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:](SKUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    artworkProvider = v13->_artworkProvider;
    v13->_artworkProvider = (SKUIArtworkProviding *)v15;

    objc_msgSend(v4, "objectForKey:", CFSTR("description"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(v17, "copy");
      text = v13->_text;
      v13->_text = (NSString *)v18;

    }
    v20 = -[SKUIColorScheme initWithColorSchemeDictionary:]([SKUIColorScheme alloc], "initWithColorSchemeDictionary:", v4);
    colorScheme = v13->_colorScheme;
    v13->_colorScheme = v20;

  }
  return v13;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (NSString)text
{
  return self->_text;
}

- (SKUIArtworkProviding)artworkProvider
{
  return self->_artworkProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

- (void)initWithUberDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
