@implementation VUIMPShowMediaCollection

- (VUIMPShowMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 requestedProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  VUIMPShowMediaCollection *v14;
  VUIMPShowMediaCollection *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaItemCollection"));
    if (v10)
      goto LABEL_4;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
  if (!v9)
    goto LABEL_7;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("requestedProperties"));
LABEL_4:
  objc_msgSend(v9, "representativeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMPMediaEntityIdentifier showIdentifierWithMediaItem:](VUIMPMediaEntityIdentifier, "showIdentifierWithMediaItem:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    VUIMPShowMediaCollectionKind();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)VUIMPShowMediaCollection;
    v14 = -[VUIMPMediaCollection initWithMediaLibrary:mediaItemCollection:identifier:requestedProperties:kind:](&v17, sel_initWithMediaLibrary_mediaItemCollection_identifier_requestedProperties_kind_, v8, v9, v12, v10, v13);

    self = v14;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seasonCount, 0);
}

- (VUIMPShowMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 identifier:(id)a5 requestedProperties:(id)a6 kind:(id)a7
{
  void *v8;
  uint64_t v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "raise:format:", v9, CFSTR("The %@ initializer is not available."), v10);

  return 0;
}

- (id)seasonCount
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__VUIMPShowMediaCollection_seasonCount__block_invoke;
  v3[3] = &unk_1E9FA13A8;
  v3[4] = self;
  -[VUIMediaEntity _propertyValueWithBlock:forKey:](self, "_propertyValueWithBlock:forKey:", v3, CFSTR("seasonCount"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __39__VUIMPShowMediaCollection_seasonCount__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 32), "mediaItemCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "items", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          +[VUIMPSeasonMediaCollectionIdentifier seasonIdentifierWithMediaItem:](VUIMPSeasonMediaCollectionIdentifier, "seasonIdentifierWithMediaItem:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v3, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v11 = objc_msgSend(v3, "count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 72);
    *(_QWORD *)(v13 + 72) = v12;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  }
  return v2;
}

@end
