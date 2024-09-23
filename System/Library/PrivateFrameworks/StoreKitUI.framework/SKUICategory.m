@implementation SKUICategory

- (SKUICategory)initWithCategoryDictionary:(id)a3
{
  id v4;
  SKUICategory *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  uint64_t v10;
  NSURL *url;
  void *v12;
  uint64_t v13;
  NSString *parentLabel;
  void *v15;
  uint64_t v16;
  SKUIArtworkProviding *artworkProvider;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *children;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICategory initWithCategoryDictionary:].cold.1();
  }
  v37.receiver = self;
  v37.super_class = (Class)SKUICategory;
  v5 = -[SKUICategory init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v9);
      url = v5->_url;
      v5->_url = (NSURL *)v10;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("parentCategoryLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      parentLabel = v5->_parentLabel;
      v5->_parentLabel = (NSString *)v13;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("artwork"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:](SKUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    artworkProvider = v5->_artworkProvider;
    v5->_artworkProvider = (SKUIArtworkProviding *)v16;

    objc_msgSend(v4, "objectForKey:", CFSTR("genreId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_categoryIdentifier = objc_msgSend(v18, "longLongValue");
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "objectForKey:", CFSTR("children"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = (objc_class *)objc_opt_class();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v32 = v20;
      v22 = v20;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v34;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v34 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v26);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = (void *)objc_msgSend([v21 alloc], "initWithCategoryDictionary:", v27);
              if (v28)
                objc_msgSend(v19, "addObject:", v28);

            }
            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v24);
      }

      v20 = v32;
    }
    v29 = objc_msgSend(v19, "copy");
    children = v5->_children;
    v5->_children = (NSArray *)v29;

  }
  return v5;
}

- (BOOL)containsURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUICategory URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SKUICategory children](self, "children", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "containsURL:", v4) & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v7;
}

- (id)subcategoryContainingURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SKUICategory children](self, "children", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "containsURL:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSArray)children
{
  return self->_children;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)parentLabel
{
  return self->_parentLabel;
}

- (NSURL)URL
{
  return self->_url;
}

- (SKUIArtworkProviding)artworkProvider
{
  return self->_artworkProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_parentLabel, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

- (void)initWithCategoryDictionary:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICategory initWithCategoryDictionary:]";
}

@end
