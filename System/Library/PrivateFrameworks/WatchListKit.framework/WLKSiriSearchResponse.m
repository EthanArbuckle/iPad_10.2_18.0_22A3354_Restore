@implementation WLKSiriSearchResponse

- (WLKSiriSearchResponse)initWithDictionary:(id)a3
{
  id v5;
  WLKSiriSearchResponse *v6;
  WLKSiriSearchResponse *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  WLKBasicContentMetadata *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  WLKBasicContentMetadata *v21;
  WLKBasicContentMetadata *v22;
  uint64_t v23;
  NSArray *items;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WLKSiriSearchResponse;
  v6 = -[WLKSiriSearchResponse init](&v32, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "wlk_dictionaryForKey:", CFSTR("data"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(v9, "wlk_dictionaryForKey:", CFSTR("pagedList"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v10, "wlk_arrayForKey:", CFSTR("items"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v11, "firstObject");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "wlk_dictionaryForKey:", CFSTR("content"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = [WLKBasicContentMetadata alloc];
        if (v13)
          v15 = v13;
        else
          v15 = v12;
        v22 = -[WLKBasicContentMetadata initWithDictionary:](v14, "initWithDictionary:", v15);
        if (v22)
          objc_msgSend(v8, "addObject:", v22);

      }
    }
    else
    {
      if ((unint64_t)objc_msgSend(v11, "count") < 2)
      {
LABEL_26:
        v23 = objc_msgSend(v8, "copy");
        items = v7->_items;
        v7->_items = (NSArray *)v23;

        goto LABEL_27;
      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v12 = v11;
      v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v16)
      {
        v17 = v16;
        v26 = v11;
        v27 = v9;
        v18 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v12);
            v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = -[WLKBasicContentMetadata initWithDictionary:]([WLKBasicContentMetadata alloc], "initWithDictionary:", v20);
              if (v21)
                objc_msgSend(v8, "addObject:", v21);

            }
          }
          v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v17);
        v9 = v27;
        v11 = v26;
      }
    }

    goto LABEL_26;
  }
LABEL_29:

  return v7;
}

- (WLKSiriSearchResponse)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKSiriSearchResponse"), CFSTR("-init is not supported"));

  return 0;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
