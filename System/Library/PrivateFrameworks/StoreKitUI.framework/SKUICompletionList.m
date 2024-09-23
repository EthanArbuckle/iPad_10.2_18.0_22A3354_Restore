@implementation SKUICompletionList

- (SKUICompletionList)initWithCompletionListDictionary:(id)a3
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
  SKUICompletionList *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  SKUICompletion *v23;
  NSArray *completions;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICompletionList initWithCompletionListDictionary:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)SKUICompletionList;
  v13 = -[SKUICompletionList init](&v31, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("item"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v13->_title, v14);
    objc_msgSend(v4, "objectForKey:", CFSTR("hints"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v4;
      v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v28;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v21);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = -[SKUICompletion initWithCompletionDictionary:]([SKUICompletion alloc], "initWithCompletionDictionary:", v22);
              -[NSArray addObject:](v16, "addObject:", v23);

            }
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v19);
      }

      completions = v13->_completions;
      v13->_completions = v16;

      v4 = v26;
    }

  }
  return v13;
}

- (SKUICompletionList)initWithCacheRepresentation:(id)a3
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
  SKUICompletionList *v13;
  void *v14;
  uint64_t v15;
  NSString *title;
  objc_class *v17;
  uint64_t v18;
  NSArray *completions;
  objc_super v21;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICompletionList initWithCacheRepresentation:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUICompletionList;
  v13 = -[SKUICompletionList init](&v21, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "copy");
      title = v13->_title;
      v13->_title = (NSString *)v15;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("completions"));
    self = (SKUICompletionList *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (objc_class *)objc_opt_class();
      SKUICacheCodingDecodeArray(self, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      completions = v13->_completions;
      v13->_completions = (NSArray *)v18;

    }
    goto LABEL_12;
  }
LABEL_13:

  return v13;
}

- (NSMutableDictionary)cacheRepresentation
{
  void *v3;
  NSArray *completions;
  void *v5;
  NSString *title;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  completions = self->_completions;
  if (completions)
  {
    SKUICacheCodingEncodeArray(completions);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("completions"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  return (NSMutableDictionary *)v3;
}

- (NSArray)completions
{
  return self->_completions;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

- (void)initWithCompletionListDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithCacheRepresentation:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
