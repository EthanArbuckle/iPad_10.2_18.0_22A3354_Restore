@implementation VUIPlistMediaDatabaseSeason

- (VUIPlistMediaDatabaseSeason)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  VUIPlistMediaDatabaseSeason *v4;
  VUIPlistMediaDatabaseSeason *v5;
  NSArray *episodes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIPlistMediaDatabaseSeason;
  v4 = -[VUIPlistMediaDatabaseEntity initWithIdentifier:type:](&v8, sel_initWithIdentifier_type_, a3, a4);
  v5 = v4;
  if (v4)
  {
    episodes = v4->_episodes;
    v4->_episodes = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v5;
}

- (VUIPlistMediaDatabaseSeason)initWithIdentifier:(id)a3 show:(id)a4
{
  id v6;
  VUIPlistMediaDatabaseSeason *v7;
  VUIPlistMediaDatabaseSeason *v8;

  v6 = a4;
  v7 = -[VUIPlistMediaDatabaseSeason initWithIdentifier:type:](self, "initWithIdentifier:type:", a3, 5);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_show, v6);

  return v8;
}

- (VUIPlistMediaDatabaseSeason)initWithDictionary:(id)a3 show:(id)a4
{
  id v6;
  id v7;
  VUIPlistMediaDatabaseSeason *v8;
  VUIPlistMediaDatabaseSeason *v9;
  void *v10;
  uint64_t v11;
  NSNumber *seasonNumber;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  VUIPlistMediaDatabaseItem *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)VUIPlistMediaDatabaseSeason;
  v8 = -[VUIPlistMediaDatabaseEntity initWithDictionary:](&v25, sel_initWithDictionary_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_show, v7);
    objc_msgSend(v6, "vui_numberForKey:", CFSTR("SeasonNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    seasonNumber = v9->_seasonNumber;
    v9->_seasonNumber = (NSNumber *)v11;

    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "vui_arrayForKey:", CFSTR("Episodes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          v19 = -[VUIPlistMediaDatabaseItem initWithDictionary:]([VUIPlistMediaDatabaseItem alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18));
          -[VUIPlistMediaDatabaseItem setSeason:](v19, "setSeason:", v9);
          objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v16);
    }
    -[VUIPlistMediaDatabaseSeason setEpisodes:](v9, "setEpisodes:", v13);

  }
  return v9;
}

- (void)setEpisodes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *episodes;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3928];
  v5 = a3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", CFSTR("episodeNumber"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();

  episodes = self->_episodes;
  self->_episodes = v8;

}

- (id)episodeForIdentifier:(id)a3
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
  -[VUIPlistMediaDatabaseSeason episodes](self, "episodes", 0);
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
  -[VUIPlistMediaDatabaseSeason episodes](self, "episodes", 0);
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
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistMediaDatabaseSeason;
  -[VUIPlistMediaDatabaseEntity dictionaryRepresentation](&v18, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  -[VUIPlistMediaDatabaseSeason seasonNumber](self, "seasonNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v5, CFSTR("SeasonNumber"));

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[VUIPlistMediaDatabaseSeason episodes](self, "episodes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "dictionaryRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("Episodes"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VUIPlistMediaDatabaseSeason;
  v4 = -[VUIPlistMediaDatabaseEntity copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_seasonNumber, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSArray copy](self->_episodes, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  VUIPlistMediaDatabaseSeason *v4;
  VUIPlistMediaDatabaseSeason *v5;
  VUIPlistMediaDatabaseSeason *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;

  v4 = (VUIPlistMediaDatabaseSeason *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v18.receiver = self;
        v18.super_class = (Class)VUIPlistMediaDatabaseSeason;
        if (!-[VUIPlistMediaDatabaseEntity isEqual:](&v18, sel_isEqual_, v6))
        {
LABEL_9:
          v12 = 0;
LABEL_19:

          goto LABEL_20;
        }
        -[VUIPlistMediaDatabaseSeason seasonNumber](self, "seasonNumber");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseSeason seasonNumber](v6, "seasonNumber");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          v12 = 0;
          if (!v9 || !v10)
          {
LABEL_18:

            goto LABEL_19;
          }
          v13 = objc_msgSend(v9, "isEqual:", v10);

          if ((v13 & 1) == 0)
            goto LABEL_9;
        }
        -[VUIPlistMediaDatabaseSeason episodes](self, "episodes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseSeason episodes](v6, "episodes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v14;
        v16 = v15;
        v11 = v16;
        if (v9 == v16)
        {
          v12 = 1;
        }
        else
        {
          v12 = 0;
          if (v9 && v16)
            v12 = objc_msgSend(v9, "isEqual:", v16);
        }
        goto LABEL_18;
      }
    }
    v12 = 0;
  }
LABEL_20:

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
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15.receiver = self;
  v15.super_class = (Class)VUIPlistMediaDatabaseSeason;
  -[VUIPlistMediaDatabaseEntity description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseSeason seasonNumber](self, "seasonNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("seasonNumber"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseSeason episodes](self, "episodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("episodes"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@>"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (VUIPlistMediaDatabaseShow)show
{
  return (VUIPlistMediaDatabaseShow *)objc_loadWeakRetained((id *)&self->_show);
}

- (void)setShow:(id)a3
{
  objc_storeWeak((id *)&self->_show, a3);
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)episodes
{
  return self->_episodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodes, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_destroyWeak((id *)&self->_show);
}

@end
