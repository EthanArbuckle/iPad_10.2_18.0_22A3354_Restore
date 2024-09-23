@implementation WLKBasicContentRequestResponse

- (WLKBasicContentRequestResponse)initWithDictionary:(id)a3
{
  id v4;
  WLKBasicContentRequestResponse *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  WLKBasicContentMetadata *v14;
  WLKBasicContentMetadata *v15;
  uint64_t v16;
  NSArray *items;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WLKBasicContentRequestResponse;
  v5 = -[WLKBasicContentRequestResponse init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "wlk_arrayForKey:", CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [WLKBasicContentMetadata alloc];
            v15 = -[WLKBasicContentMetadata initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v19);
            if (v15)
              objc_msgSend(v7, "addObject:", v15);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    v16 = objc_msgSend(v7, "copy");
    items = v5->_items;
    v5->_items = (NSArray *)v16;

  }
  return v5;
}

- (WLKBasicContentRequestResponse)init
{
  return -[WLKBasicContentRequestResponse initWithDictionary:](self, "initWithDictionary:", 0);
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
