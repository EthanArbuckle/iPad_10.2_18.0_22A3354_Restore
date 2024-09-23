@implementation WLKBasicSeasonMetadata

+ (id)seasonsWithDictionaries:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  WLKBasicSeasonMetadata *v11;
  WLKBasicSeasonMetadata *v12;
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
          v11 = [WLKBasicSeasonMetadata alloc];
          v12 = -[WLKBasicSeasonMetadata initWithDictionary:](v11, "initWithDictionary:", v10, (_QWORD)v14);
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

- (WLKBasicSeasonMetadata)initWithDictionary:(id)a3
{
  id v4;
  WLKBasicSeasonMetadata *v5;
  uint64_t v6;
  NSNumber *seasonNumber;
  void *v8;
  uint64_t v9;
  NSString *canonicalShowID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WLKBasicSeasonMetadata;
  v5 = -[WLKBasicContentMetadata initWithDictionary:](&v12, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "wlk_numberForKey:", CFSTR("seasonNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    seasonNumber = v5->_seasonNumber;
    v5->_seasonNumber = (NSNumber *)v6;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("showId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    canonicalShowID = v5->_canonicalShowID;
    v5->_canonicalShowID = (NSString *)v9;

  }
  return v5;
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (NSString)canonicalShowID
{
  return self->_canonicalShowID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalShowID, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
}

@end
