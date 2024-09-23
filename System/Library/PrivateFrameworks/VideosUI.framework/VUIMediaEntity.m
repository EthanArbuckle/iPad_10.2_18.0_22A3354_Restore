@implementation VUIMediaEntity

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[VUIMediaEntity mediaLibrary](self, "mediaLibrary");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIMediaEntity mediaLibrary](self, "mediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "hash");

  }
  -[VUIMediaEntity identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v3;

  return v6;
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (BOOL)isEqual:(id)a3
{
  VUIMediaEntity *v4;
  VUIMediaEntity *v5;
  VUIMediaEntity *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  _BOOL4 v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  BOOL v36;
  char v37;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = (VUIMediaEntity *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v21) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[VUIMediaEntity identifier](self, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaEntity identifier](v6, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (!v9)
          goto LABEL_13;
        -[VUIMediaEntity kind](self, "kind");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mediaEntityClassName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaEntity kind](v6, "kind");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mediaEntityClassName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "isEqualToString:", v13);

        if (!v14)
        {
LABEL_13:
          LOBYTE(v21) = 0;
LABEL_39:

          goto LABEL_40;
        }
        -[VUIMediaEntity mediaLibrary](self, "mediaLibrary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaEntity mediaLibrary](v6, "mediaLibrary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15;
        v18 = v16;
        if (v17 == v18)
        {

        }
        else
        {
          v19 = v18;
          if (!v17 || !v18)
          {

LABEL_17:
            LOBYTE(v21) = 0;
            goto LABEL_18;
          }
          v20 = objc_msgSend(v17, "isEqual:", v18);

          if ((v20 & 1) == 0)
            goto LABEL_17;
        }
        v22 = -[VUIMediaEntity hasLocalChanges](self, "hasLocalChanges");
        v21 = v22 ^ -[VUIMediaEntity hasLocalChanges](v6, "hasLocalChanges") ^ 1;
LABEL_18:
        -[VUIMediaEntity kind](self, "kind");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "propertyDescriptorsByName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "allKeys");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        obj = v25;
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v41;
          while (2)
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v41 != v28)
                objc_enumerationMutation(obj);
              v30 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
              -[VUIMediaEntity valueForKey:](self, "valueForKey:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[VUIMediaEntity valueForKey:](v6, "valueForKey:", v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v21)
                goto LABEL_36;
              v33 = v31;
              v34 = v32;
              if (v33 == v34)
              {

              }
              else
              {
                v35 = v34;
                if (v33)
                  v36 = v34 == 0;
                else
                  v36 = 1;
                if (v36)
                {

LABEL_36:
LABEL_37:
                  LOBYTE(v21) = 0;
                  goto LABEL_38;
                }
                v37 = objc_msgSend(v33, "isEqual:", v34);

                if ((v37 & 1) == 0)
                  goto LABEL_37;
              }
              LOBYTE(v21) = 1;
            }
            v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
            if (v27)
              continue;
            break;
          }
        }
LABEL_38:

        goto LABEL_39;
      }
    }
    LOBYTE(v21) = 0;
  }
LABEL_40:

  return v21;
}

- (VUIMediaEntityIdentifierInternal)identifierInternal
{
  return self->_identifierInternal;
}

- (id)_propertyValueForKey:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__VUIMediaEntity__propertyValueForKey___block_invoke;
  v4[3] = &unk_1E9FA13A8;
  v4[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_propertyValueWithBlock:(id)a3 forKey:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VUIMediaEntity *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = (void (**)(id, void *))a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("block"));
    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("key"));
LABEL_3:
  -[VUIMediaEntity kind](self, "kind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "propertyDescriptorForName:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[VUIMediaEntity _defaultValueForPropertyDescriptor:](self, "_defaultValueForPropertyDescriptor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = self;
  objc_sync_enter(v12);
  -[VUIMediaEntity firstAccessPropertiesCache](v12, "firstAccessPropertiesCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "objectForKey:", v8);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = v11;
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "setObject:forKey:", v15, v8);
    }

  }
  objc_sync_exit(v12);

  return v11;
}

uint64_t __39__VUIMediaEntity__propertyValueForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_valueForPropertyDescriptor:", a2);
}

- (VUIMediaEntityKind)kind
{
  return self->_kind;
}

- (NSMutableDictionary)firstAccessPropertiesCache
{
  NSMutableDictionary *v3;
  NSMutableDictionary *firstAccessPropertiesCache;

  if (!self->_firstAccessPropertiesCache
    && -[VUIMediaEntity cachesPropertiesOnFirstAccess](self, "cachesPropertiesOnFirstAccess"))
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    firstAccessPropertiesCache = self->_firstAccessPropertiesCache;
    self->_firstAccessPropertiesCache = v3;

  }
  return self->_firstAccessPropertiesCache;
}

- (void)setCachesPropertiesOnFirstAccess:(BOOL)a3
{
  self->_cachesPropertiesOnFirstAccess = a3;
}

- (VUIMediaEntity)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VUIMediaEntity *v15;
  VUIMediaEntity *v16;
  uint64_t v17;
  VUIMediaEntityIdentifierInternal *identifierInternal;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("requestedProperties"));
    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("identifier"));
  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("kind"));
LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)VUIMediaEntity;
  v15 = -[VUIMediaEntity init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mediaLibrary, a3);
    v17 = objc_msgSend(v12, "copy");
    identifierInternal = v16->_identifierInternal;
    v16->_identifierInternal = (VUIMediaEntityIdentifierInternal *)v17;

    objc_storeStrong((id *)&v16->_requestedProperties, a5);
    objc_storeStrong((id *)&v16->_kind, a6);
  }

  return v16;
}

- (NSString)title
{
  return (NSString *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("title"));
}

- (NSString)genreTitle
{
  return (NSString *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("genreTitle"));
}

- (BOOL)cachesPropertiesOnFirstAccess
{
  return self->_cachesPropertiesOnFirstAccess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedProperties, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_firstAccessPropertiesCache, 0);
  objc_storeStrong((id *)&self->_identifierInternal, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

- (VUIMediaEntity)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VUIMediaEntityType)type
{
  void *v2;
  void *v3;

  -[VUIMediaEntity identifierInternal](self, "identifierInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaEntityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VUIMediaEntityType *)v3;
}

- (NSNumber)isLocal
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("isLocal"));
}

- (NSNumber)resolution
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("resolution"));
}

- (NSNumber)colorCapability
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("colorCapability"));
}

- (NSNumber)audioCapability
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("audioCapability"));
}

- (NSNumber)HLSResolution
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("HLSResolution"));
}

- (NSNumber)HLSColorCapability
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("HLSColorCapability"));
}

- (NSNumber)HLSAudioCapability
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("HLSAudioCapability"));
}

- (NSString)sortTitle
{
  void *v3;

  -[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("sortTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[VUIMediaEntity title](self, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)contentDescription
{
  return (NSString *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("contentDescription"));
}

- (NSDate)addedDate
{
  return (NSDate *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("addedDate"));
}

- (NSDate)releaseDate
{
  return (NSDate *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("releaseDate"));
}

- (NSNumber)releaseYear
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__VUIMediaEntity_releaseYear__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("releaseYear"));
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

id __29__VUIMediaEntity_releaseYear__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "releaseDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "components:fromDate:", 4, v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "year"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (VUIContentRating)contentRating
{
  return (VUIContentRating *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("contentRating"));
}

- (NSString)coverArtImageIdentifier
{
  return (NSString *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("coverArtImageIdentifier"));
}

- (NSNumber)storeID
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("storeID"));
}

- (NSNumber)purchaseHistoryID
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("purchaseHistoryID"));
}

- (NSString)canonicalID
{
  return (NSString *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("canonicalID"));
}

- (BOOL)markedAsDeleted
{
  void *v2;
  BOOL v3;

  -[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("markedAsDeleted"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)brandID
{
  return (NSString *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("brandID"));
}

- (NSString)brandName
{
  return (NSString *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("brandName"));
}

- (NSNumber)playedState
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("playedState"));
}

- (VUIMediaEntityIdentifier)showIdentifier
{
  return (VUIMediaEntityIdentifier *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("showIdentifier"));
}

- (NSString)showTitle
{
  return (NSString *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("showTitle"));
}

- (NSNumber)seasonNumber
{
  return (NSNumber *)-[VUIMediaEntity _propertyValueForKey:](self, "_propertyValueForKey:", CFSTR("seasonNumber"));
}

- (void)populateMetadata
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[VUIMediaEntity kind](self, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyDescriptorsByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (id)-[VUIMediaEntity dictionaryWithValuesForKeys:](self, "dictionaryWithValuesForKeys:", v6);
}

- (BOOL)isFetchedPropertiesEqualToFetchedMediaEntity:(id)a3
{
  VUIMediaEntity *v4;
  VUIMediaEntity *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  VUIMediaEntity *v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  char v31;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (VUIMediaEntity *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v13) = 1;
    goto LABEL_39;
  }
  if (!v4)
  {
    LOBYTE(v13) = 0;
    goto LABEL_39;
  }
  -[VUIMediaEntity mediaLibrary](self, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VUIMediaEntity mediaLibrary](self, "mediaLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntity mediaLibrary](v5, "mediaLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      if (!v9 || !v10)
      {

LABEL_14:
        LOBYTE(v13) = 0;
        goto LABEL_15;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if ((v12 & 1) == 0)
        goto LABEL_14;
    }
  }
  v14 = -[VUIMediaEntity hasLocalChanges](self, "hasLocalChanges");
  v13 = v14 ^ -[VUIMediaEntity hasLocalChanges](v5, "hasLocalChanges") ^ 1;
LABEL_15:
  -[VUIMediaEntity kind](self, "kind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "propertyDescriptorsByName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = self;
  objc_sync_enter(v18);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v17;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v19)
  {
    v34 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v36 != v34)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[VUIMediaEntity firstAccessPropertiesCache](v18, "firstAccessPropertiesCache");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (!v22
          || (objc_msgSend(v22, "objectForKey:", v21), (v24 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          -[VUIMediaEntity valueForKey:](v18, "valueForKey:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if (v26)
        {

          v24 = 0;
        }
        -[VUIMediaEntity valueForKey:](v5, "valueForKey:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_36;
        v28 = v24;
        v29 = v27;
        if (v28 == v29)
        {

        }
        else
        {
          v30 = v29;
          if (!v28 || !v29)
          {

LABEL_36:
LABEL_37:
            LOBYTE(v13) = 0;
            goto LABEL_38;
          }
          v31 = objc_msgSend(v28, "isEqual:", v29);

          if ((v31 & 1) == 0)
            goto LABEL_37;
        }
        LOBYTE(v13) = 1;
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v19)
        continue;
      break;
    }
  }
LABEL_38:

  objc_sync_exit(v18);
LABEL_39:

  return v13;
}

- (id)assetController
{
  return 0;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  objc_super v83;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v83.receiver = self;
  v83.super_class = (Class)VUIMediaEntity;
  -[VUIMediaEntity description](&v83, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity mediaLibrary](self, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%p"), CFSTR("mediaLibrary"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("identifier"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity isLocal](self, "isLocal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("isLocal"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity resolution](self, "resolution");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("resolution"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  v18 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity colorCapability](self, "colorCapability");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("colorCapability"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  v21 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity audioCapability](self, "audioCapability");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("audioCapability"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  v24 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity HLSResolution](self, "HLSResolution");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("HLSResolution"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  v27 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity HLSColorCapability](self, "HLSColorCapability");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("HLSColorCapability"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  v30 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity HLSAudioCapability](self, "HLSAudioCapability");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("HLSAudioCapability"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v32);

  v33 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity title](self, "title");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("title"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v35);

  v36 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity genreTitle](self, "genreTitle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("genreTitle"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v38);

  v39 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity contentDescription](self, "contentDescription");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("contentDescription"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v41);

  v42 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity addedDate](self, "addedDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("addedDate"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v44);

  v45 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity releaseDate](self, "releaseDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("releaseDate"), v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v47);

  v48 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity releaseYear](self, "releaseYear");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("releaseYear"), v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v50);

  v51 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity contentRating](self, "contentRating");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("contentRating"), v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v53);

  v54 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity coverArtImageIdentifier](self, "coverArtImageIdentifier");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("coverArtImageIdentifier"), v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v56);

  v57 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity storeID](self, "storeID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("storeID"), v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v59);

  v60 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity purchaseHistoryID](self, "purchaseHistoryID");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("purchaseHistoryID"), v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v62);

  v63 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity playedState](self, "playedState");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  VUIMediaEntityPlayedStateLogString(objc_msgSend(v64, "unsignedIntegerValue"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("playedState"), v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v66);

  v67 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity showIdentifier](self, "showIdentifier");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("showIdentifier"), v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v69);

  v70 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity showTitle](self, "showTitle");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("showTitle"), v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v72);

  v73 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity seasonNumber](self, "seasonNumber");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("seasonNumber"), v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v75);

  v76 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntity canonicalID](self, "canonicalID");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("canonicalID"), v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v78);

  v79 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "stringWithFormat:", CFSTR("<%@>"), v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  return v81;
}

- (BOOL)_didRequestPropertyWithKey:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[VUIMediaEntity requestedProperties](self, "requestedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (VUIMediaEntityFetchRequestIsAllPropertiesSet(v5) & 1) != 0
    || objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)_valueForPropertyDescriptor:(id)a3
{
  return 0;
}

- (id)_defaultValueForPropertyDescriptor:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "allowsDefaultValue"))
  {
    objc_msgSend(v3, "defaultValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (BOOL)hasLocalChanges
{
  return self->_localChanges;
}

- (void)setLocalChanges:(BOOL)a3
{
  self->_localChanges = a3;
}

- (void)setIdentifierInternal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFirstAccessPropertiesCache:(id)a3
{
  objc_storeStrong((id *)&self->_firstAccessPropertiesCache, a3);
}

- (NSSet)requestedProperties
{
  return self->_requestedProperties;
}

@end
