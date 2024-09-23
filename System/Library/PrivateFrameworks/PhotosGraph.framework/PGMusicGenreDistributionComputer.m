@implementation PGMusicGenreDistributionComputer

- (PGMusicGenreDistributionComputer)init
{
  PGMusicGenreDistributionComputer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGMusicGenreDistributionComputer;
  result = -[PGMusicGenreDistributionComputer init](&v3, sel_init);
  if (result)
    result->_useTaggedGenres = 1;
  return result;
}

- (id)musicGenreDistributionForGenres:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t j;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "length"))
        {
          if (self->_useTaggedGenres)
          {
            objc_msgSend(MEMORY[0x1E0D4B278], "taggedGenreForGenre:isExactMatch:", v12, 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(v5, "addObject:", v13);

          }
          else
          {
            objc_msgSend(v5, "addObject:", v12);
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  v14 = objc_msgSend(v5, "pg_accumulatedCount");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    v20 = (double)v14;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        v23 = objc_msgSend(v16, "countForObject:", v22, (_QWORD)v26);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v23 / v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v18);
  }

  return v15;
}

- (BOOL)useTaggedGenres
{
  return self->_useTaggedGenres;
}

- (void)setUseTaggedGenres:(BOOL)a3
{
  self->_useTaggedGenres = a3;
}

@end
