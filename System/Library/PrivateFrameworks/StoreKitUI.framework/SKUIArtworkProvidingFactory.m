@implementation SKUIArtworkProvidingFactory

+ (id)artworkProviderForStoreResponse:(id)a3
{
  id v3;
  SKUIArtworkList *v4;
  SKUIArtworkList *v5;

  v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:].cold.1();
  }
  if (+[SKUIArtworkList canHandleArtworkFormat:](SKUIArtworkList, "canHandleArtworkFormat:", v3))
  {
    v4 = -[SKUIArtworkList initWithArtworkListArray:]([SKUIArtworkList alloc], "initWithArtworkListArray:", v3);
  }
  else
  {
    if (!+[SKUIArtworkTemplate canHandleArtworkFormat:](SKUIArtworkTemplate, "canHandleArtworkFormat:", v3))
    {
      v5 = 0;
      goto LABEL_11;
    }
    v4 = -[SKUIArtworkTemplate initWithTemplateDictionary:]([SKUIArtworkTemplate alloc], "initWithTemplateDictionary:", v3);
  }
  v5 = v4;
LABEL_11:

  return v5;
}

+ (id)artworkCacheCandidatesForProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    +[SKUIArtworkProvidingFactory artworkCacheCandidatesForProvider:].cold.1();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "artworks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "servedArtworks");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allObjects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

+ (void)artworkProviderForStoreResponse:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:]";
}

+ (void)artworkCacheCandidatesForProvider:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUIArtworkProvidingFactory artworkCacheCandidatesForProvider:]";
}

@end
