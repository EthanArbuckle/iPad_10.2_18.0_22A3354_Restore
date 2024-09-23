@implementation ICStorePlatformMetadata

- (ICStorePlatformMetadata)initWithMetadataDictionary:(id)a3
{
  return -[ICStorePlatformMetadata initWithMetadataDictionary:expirationDate:](self, "initWithMetadataDictionary:expirationDate:", a3, 0);
}

- (ICStorePlatformMetadata)initWithMetadataDictionary:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  ICStorePlatformMetadata *v8;
  uint64_t v9;
  NSDate *expirationDate;
  uint64_t v11;
  NSDictionary *metadataDictionary;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICStorePlatformMetadata;
  v8 = -[ICStorePlatformMetadata init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    expirationDate = v8->_expirationDate;
    v8->_expirationDate = (NSDate *)v9;

    v11 = objc_msgSend(v6, "copy");
    metadataDictionary = v8->_metadataDictionary;
    v8->_metadataDictionary = (NSDictionary *)v11;

  }
  return v8;
}

- (NSString)artistName
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("artistName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (int64_t)artistStoreAdamID
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("artistId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)cloudUniversalLibraryID
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("libraryTrackId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSString)collectionName
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("collectionName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (int64_t)collectionStoreAdamID
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("collectionId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)composerName
{
  void *v2;
  void *v3;
  id v4;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("composer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("name"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)copyrightText
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("copyright"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (int64_t)discNumber
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("discNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (double)duration
{
  ICStorePlatformMetadata *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  double v14;
  double v15;
  void *v16;
  double v17;
  ICStorePlatformMetadata *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v2 = self;
  v31 = *MEMORY[0x1E0C80C00];
  -[ICStorePlatformMetadata offers](self, "offers");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (!v3)
    goto LABEL_20;
  v4 = v3;
  v19 = v2;
  v5 = 0;
  v6 = *(_QWORD *)v26;
  v7 = 0.0;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v26 != v6)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "assets", v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "duration");
            if (v14 <= 2.22044605e-16)
              v14 = -0.0;
            else
              ++v5;
            v7 = v7 + v14;
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v11);
      }

    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  }
  while (v4);
  v2 = v19;
  if (v5)
  {
    v15 = v7 / (double)v5;
  }
  else
  {
LABEL_20:
    -[NSDictionary objectForKey:](v2->_metadataDictionary, "objectForKey:", CFSTR("duration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v16, "doubleValue");
      v15 = v17;
    }

  }
  return v15;
}

- (int64_t)explicitRating
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("contentRatingsBySystem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSDictionary())
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("value"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "integerValue");
  }
  else
  {
    -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("is-explicit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
      v7 = 1000;
    else
      v7 = 100;

  }
  return v7;
}

- (BOOL)isExplicit
{
  return -[ICStorePlatformMetadata explicitRating](self, "explicitRating") > 100;
}

- (NSArray)genreNames
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("genreNames"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          if (!_NSIsNSString())
          {

            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  if (!v3)
  {
LABEL_14:
    -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("genres"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSArray())
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v11)
      {
        v12 = v11;
        v3 = 0;
        v13 = *(_QWORD *)v19;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
            if (_NSIsNSDictionary())
            {
              objc_msgSend(v15, "objectForKey:", CFSTR("name"), (_QWORD)v18);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (_NSIsNSString())
              {
                if (!v3)
                  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v3, "addObject:", v16);
              }

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v12);
      }
      else
      {
        v3 = 0;
      }

    }
    else
    {
      v3 = 0;
    }

  }
  return (NSArray *)v3;
}

- (BOOL)hasLyrics
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("hasLyrics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)hasTimeSyncedLyrics
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("hasTimeSyncedLyrics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)kind
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (int64_t)movementCount
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("movementCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)movementName
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("movementName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (int64_t)movementNumber
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("movementNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)name
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSString)playlistGlobalID
{
  void *v3;
  int v4;
  void *v5;

  -[ICStorePlatformMetadata kind](self, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", ICStorePlatformMetadataKindPlaylist);

  if (!v4)
    goto LABEL_4;
  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

LABEL_4:
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSArray)offers
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ICStorePlatformOffer *v10;
  ICStorePlatformOffer *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("offers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
          if (_NSIsNSDictionary())
          {
            v10 = [ICStorePlatformOffer alloc];
            v11 = -[ICStorePlatformOffer initWithResponseDictionary:](v10, "initWithResponseDictionary:", v9, (_QWORD)v13);
            if (v11)
              objc_msgSend(v3, "addObject:", v11);

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (id)offerWithType:(id)a3
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
  -[ICStorePlatformMetadata offers](self, "offers", 0);
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
        objc_msgSend(v9, "offerType");
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

- (NSString)radioStationStringID
{
  void *v3;
  int v4;
  void *v5;

  -[ICStorePlatformMetadata kind](self, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", ICStorePlatformMetadataKindRadioStation);

  if (!v4)
    goto LABEL_4;
  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

LABEL_4:
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSDate)releaseDate
{
  void *v3;
  void *v4;
  void *v5;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("releaseDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    -[ICStorePlatformMetadata _storePlatformReleaseDateFormatter](self, "_storePlatformReleaseDateFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFromString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (BOOL)shouldShowComposer
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("showComposer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)storeAdamID
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (NSArray)formerStoreAdamIDs
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("formerIds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v13 = v2;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (_NSIsNSNumber())
            {
              v10 = v9;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
              v10 = (id)objc_claimAutoreleasedReturnValue();
            }
            v11 = v10;
            objc_msgSend(v3, "addObject:", v10);

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    v2 = v13;
  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSString)title
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (int64_t)trackNumber
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("trackNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)trackCount
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("trackCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)workName
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("workName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSArray)artworkInfos
{
  void *v2;
  ICStoreArtworkInfo *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ICStoreArtworkInfo *v10;
  ICStoreArtworkInfo *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("artwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    v3 = -[ICStoreArtworkInfo initWithArtworkResponseDictionary:]([ICStoreArtworkInfo alloc], "initWithArtworkResponseDictionary:", v2);
    v18[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!_NSIsNSArray())
    {
      v4 = 0;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v3 = v2;
    v5 = -[ICStoreArtworkInfo countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
          if (_NSIsNSDictionary())
          {
            v10 = [ICStoreArtworkInfo alloc];
            v11 = -[ICStoreArtworkInfo initWithArtworkResponseDictionary:](v10, "initWithArtworkResponseDictionary:", v9, (_QWORD)v13);
            objc_msgSend(v4, "addObject:", v11);

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = -[ICStoreArtworkInfo countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
  }

LABEL_15:
  return (NSArray *)v4;
}

- (NSArray)audioTraits
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary ic_arrayValueForKey:](self->_metadataDictionary, "ic_arrayValueForKey:", CFSTR("audioTraits"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__ICStorePlatformMetadata_audioTraits__block_invoke;
    v6[3] = &unk_1E438B280;
    v7 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
  return (NSArray *)v3;
}

- (NSURL)classicalURL
{
  void *v2;
  void *v3;

  -[NSDictionary ic_stringValueForKey:](self->_metadataDictionary, "ic_stringValueForKey:", CFSTR("classicalUrl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (BOOL)supportsVocalAttenuation
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", CFSTR("isVocalAttenuationAllowed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)_storePlatformReleaseDateFormatter
{
  if (_storePlatformReleaseDateFormatter_sOnceToken != -1)
    dispatch_once(&_storePlatformReleaseDateFormatter_sOnceToken, &__block_literal_global_118);
  return (id)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

void __61__ICStorePlatformMetadata__storePlatformReleaseDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter;
  _storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter = (uint64_t)v0;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend((id)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter, "setLocale:", v2);
  objc_msgSend((id)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter, "setDateFormat:", CFSTR("YYYY-MM-dd"));

}

void __38__ICStorePlatformMetadata_audioTraits__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (_NSIsNSString())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

+ (NSCalendar)storeServerCalendar
{
  if (storeServerCalendar_sOnceToken != -1)
    dispatch_once(&storeServerCalendar_sOnceToken, &__block_literal_global_8982);
  return (NSCalendar *)(id)storeServerCalendar_sGMTCalendar;
}

void __46__ICStorePlatformMetadata_storeServerCalendar__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)storeServerCalendar_sGMTCalendar;
  storeServerCalendar_sGMTCalendar = v1;

  v3 = (void *)storeServerCalendar_sGMTCalendar;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

}

@end
