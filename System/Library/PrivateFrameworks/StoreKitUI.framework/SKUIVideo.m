@implementation SKUIVideo

- (SKUIVideo)initWithVideoDictionary:(id)a3
{
  id v4;
  SKUIVideo *v5;
  void *v6;
  uint64_t v7;
  SKUIArtworkProviding *artworks;
  void *v9;
  uint64_t v10;
  void *url;
  uint64_t v12;
  NSURL *v13;
  objc_super v15;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIVideo initWithVideoDictionary:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIVideo;
  v5 = -[SKUIVideo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("previewFrame"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:](SKUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    artworks = v5->_artworks;
    v5->_artworks = (SKUIArtworkProviding *)v7;

    objc_msgSend(v4, "objectForKey:", CFSTR("video"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v9);
      url = v5->_url;
      v5->_url = (NSURL *)v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
      objc_msgSend(v9, "objectForKey:", CFSTR("url"));
      url = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", url);
        v13 = v5->_url;
        v5->_url = (NSURL *)v12;

      }
    }

LABEL_12:
  }

  return v5;
}

- (SKUIArtworkProviding)artworks
{
  return self->_artworks;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_artworks, 0);
}

- (void)initWithVideoDictionary:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIVideo initWithVideoDictionary:]";
}

@end
