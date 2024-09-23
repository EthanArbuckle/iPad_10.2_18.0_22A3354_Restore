@implementation WLKGenre

+ (id)genresWithDictionaries:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  WLKGenre *v11;
  WLKGenre *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = [WLKGenre alloc];
          v12 = -[WLKGenre initWithDictionary:](v11, "initWithDictionary:", v10, (_QWORD)v14);
          objc_msgSend(v4, "addObject:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (WLKGenre)initWithDictionary:(id)a3
{
  id v4;
  WLKGenre *v5;
  void *v6;
  uint64_t v7;
  NSString *uniqueID;
  void *v9;
  uint64_t v10;
  NSString *name;
  WLKGenre *v12;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)WLKGenre;
    v5 = -[WLKGenre init](&v14, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("id"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      uniqueID = v5->_uniqueID;
      v5->_uniqueID = (NSString *)v7;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("name"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v10;

    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WLKGenre)init
{
  return -[WLKGenre initWithDictionary:](self, "initWithDictionary:", 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueID;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    uniqueID = self->_uniqueID;
    objc_msgSend(v4, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](uniqueID, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
