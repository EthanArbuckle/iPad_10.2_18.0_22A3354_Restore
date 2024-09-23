@implementation VUIPlistMediaDatabaseShow

- (VUIPlistMediaDatabaseShow)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  VUIPlistMediaDatabaseShow *v4;
  VUIPlistMediaDatabaseShow *v5;
  NSArray *seasons;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIPlistMediaDatabaseShow;
  v4 = -[VUIPlistMediaDatabaseEntity initWithIdentifier:type:](&v8, sel_initWithIdentifier_type_, a3, a4);
  v5 = v4;
  if (v4)
  {
    seasons = v4->_seasons;
    v4->_seasons = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v5;
}

- (VUIPlistMediaDatabaseShow)initWithIdentifier:(id)a3
{
  return -[VUIPlistMediaDatabaseShow initWithIdentifier:type:](self, "initWithIdentifier:type:", a3, 4);
}

- (VUIPlistMediaDatabaseShow)initWithDictionary:(id)a3
{
  id v4;
  VUIPlistMediaDatabaseShow *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  VUIPlistMediaDatabaseSeason *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistMediaDatabaseShow;
  v5 = -[VUIPlistMediaDatabaseEntity initWithDictionary:](&v18, sel_initWithDictionary_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "vui_arrayForKey:", CFSTR("Seasons"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = -[VUIPlistMediaDatabaseSeason initWithDictionary:show:]([VUIPlistMediaDatabaseSeason alloc], "initWithDictionary:show:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), v5);
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }
    -[VUIPlistMediaDatabaseShow setSeasons:](v5, "setSeasons:", v6);

  }
  return v5;
}

- (void)setSeasons:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *seasons;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3928];
  v5 = a3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", CFSTR("seasonNumber"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();

  seasons = self->_seasons;
  self->_seasons = v8;

}

- (id)seasonForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VUIPlistMediaDatabaseShow seasons](self, "seasons", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)isLocal
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[VUIPlistMediaDatabaseShow seasons](self, "seasons", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isLocal");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          v3 = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)VUIPlistMediaDatabaseShow;
  -[VUIPlistMediaDatabaseEntity dictionaryRepresentation](&v17, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VUIPlistMediaDatabaseShow seasons](self, "seasons", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("Seasons"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIPlistMediaDatabaseShow;
  v4 = -[VUIPlistMediaDatabaseEntity copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_seasons, "copy");
  v6 = (void *)v4[8];
  v4[8] = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  VUIPlistMediaDatabaseShow *v4;
  VUIPlistMediaDatabaseShow *v5;
  VUIPlistMediaDatabaseShow *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (VUIPlistMediaDatabaseShow *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)VUIPlistMediaDatabaseShow;
    if (-[VUIPlistMediaDatabaseEntity isEqual:](&v14, sel_isEqual_, v6))
    {
      -[VUIPlistMediaDatabaseShow seasons](self, "seasons");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlistMediaDatabaseShow seasons](v6, "seasons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqual:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12.receiver = self;
  v12.super_class = (Class)VUIPlistMediaDatabaseShow;
  -[VUIPlistMediaDatabaseEntity description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseShow seasons](self, "seasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("seasons"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@>"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)seasons
{
  return self->_seasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seasons, 0);
}

@end
