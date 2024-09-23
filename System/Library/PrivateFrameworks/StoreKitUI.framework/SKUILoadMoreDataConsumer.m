@implementation SKUILoadMoreDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v20;

  v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUILoadMoreDataConsumer objectForData:response:error:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v20;
  objc_opt_class();
  v18 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SKUILoadMoreDataConsumer _itemsWithDictionary:](self, "_itemsWithDictionary:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a5 && !v18)
    *a5 = objc_retainAutorelease(v17);

  return v18;
}

- (id)_itemsWithDictionary:(id)a3
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUILoadMoreDataConsumer _itemsWithDictionary:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "objectForKey:", CFSTR("charts"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("contentIds"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = v15;
        v30 = v4;
        objc_msgSend(v4, "objectForKey:", CFSTR("storePlatformData"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_opt_class();
        SKUIStorePageItemsWithStorePlatformDictionary(v17, 0, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v28 = v16;
        v20 = v16;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v32 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && !-[NSSet containsObject:](self->_unavailableItemIdentifiers, "containsObject:", v25))
              {
                objc_msgSend(v19, "objectForKey:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (v26)
                  objc_msgSend(v13, "addObject:", v26);

              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          }
          while (v22);
        }

        v4 = v30;
        v16 = v28;
        v15 = v29;
      }

    }
  }

  return v13;
}

- (NSSet)unavailableItemIdentifiers
{
  return self->_unavailableItemIdentifiers;
}

- (void)setUnavailableItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableItemIdentifiers, 0);
}

- (void)objectForData:(uint64_t)a3 response:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_itemsWithDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
