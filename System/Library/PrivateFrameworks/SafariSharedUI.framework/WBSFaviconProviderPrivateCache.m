@implementation WBSFaviconProviderPrivateCache

- (WBSFaviconProviderPrivateCache)init
{
  WBSFaviconProviderPrivateCache *v2;
  NSCache *v3;
  NSCache *uuidToImageDataCache;
  uint64_t v5;
  NSMutableDictionary *pageURLStringToIconInfoDict;
  uint64_t v7;
  NSMutableDictionary *iconURLStringToIconInfoDict;
  uint64_t v9;
  NSMutableDictionary *urlStringToRejectedResourceIconInfoDict;
  WBSFaviconProviderPrivateCache *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBSFaviconProviderPrivateCache;
  v2 = -[WBSFaviconProviderPrivateCache init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    uuidToImageDataCache = v2->_uuidToImageDataCache;
    v2->_uuidToImageDataCache = v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    pageURLStringToIconInfoDict = v2->_pageURLStringToIconInfoDict;
    v2->_pageURLStringToIconInfoDict = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    iconURLStringToIconInfoDict = v2->_iconURLStringToIconInfoDict;
    v2->_iconURLStringToIconInfoDict = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    urlStringToRejectedResourceIconInfoDict = v2->_urlStringToRejectedResourceIconInfoDict;
    v2->_urlStringToRejectedResourceIconInfoDict = (NSMutableDictionary *)v9;

    v11 = v2;
  }

  return v2;
}

- (id)imageDataForPageURLString:(id)a3
{
  void *v4;
  void *v5;
  NSCache *uuidToImageDataCache;
  void *v7;
  void *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_pageURLStringToIconInfoDict, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    uuidToImageDataCache = self->_uuidToImageDataCache;
    objc_msgSend(v4, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](uuidToImageDataCache, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)imageDataForIconURLString:(id)a3
{
  void *v4;
  void *v5;
  NSCache *uuidToImageDataCache;
  void *v7;
  void *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iconURLStringToIconInfoDict, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    uuidToImageDataCache = self->_uuidToImageDataCache;
    objc_msgSend(v4, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](uuidToImageDataCache, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)firstImageDataMatchingPageURLStringIn:(id)a3 matchedPageURLString:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[WBSFaviconProviderPrivateCache imageDataForPageURLString:](self, "imageDataForPageURLString:", v11, (_QWORD)v15);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          if (a4)
            *a4 = objc_retainAutorelease(v11);
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (id)pageURLStringsWithPrefixesIn:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMutableDictionary allKeys](self->_pageURLStringToIconInfoDict, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v11 = v4;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              if (!objc_msgSend(v10, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), 3))
                objc_msgSend(v5, "addObject:", v10);
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)imageInfoForPageURLString:(id)a3
{
  void *v4;
  void *v5;
  NSCache *uuidToImageDataCache;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_pageURLStringToIconInfoDict, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    uuidToImageDataCache = self->_uuidToImageDataCache;
    objc_msgSend(v4, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](uuidToImageDataCache, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v5;
    else
      v9 = 0;
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)imageInfoForIconURLString:(id)a3
{
  void *v4;
  void *v5;
  NSCache *uuidToImageDataCache;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iconURLStringToIconInfoDict, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    uuidToImageDataCache = self->_uuidToImageDataCache;
    objc_msgSend(v4, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](uuidToImageDataCache, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v5;
    else
      v9 = 0;
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setImageData:(id)a3 forPageURLString:(id)a4 iconURLString:(id)a5 iconSize:(CGSize)a6 hasGeneratedResolutions:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSCache *uuidToImageDataCache;
  void *v22;
  WBSFaviconProviderIconInfo *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  WBSFaviconProviderIconInfo *v28;
  NSCache *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  WBSFaviconProviderIconInfo *v34;
  WBSFaviconProviderIconInfo *v35;
  id v36;

  v7 = a7;
  height = a6.height;
  width = a6.width;
  v36 = a3;
  v13 = a4;
  v14 = a5;
  -[WBSFaviconProviderPrivateCache imageInfoForPageURLString:](self, "imageInfoForPageURLString:", v13);
  v15 = objc_claimAutoreleasedReturnValue();
  -[WBSFaviconProviderPrivateCache imageInfoForIconURLString:](self, "imageInfoForIconURLString:", v14);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 && !v16)
  {
LABEL_8:
    -[WBSFaviconProviderPrivateCache removeImageDataForPageURLString:](self, "removeImageDataForPageURLString:", v13);

    v15 = 0;
    goto LABEL_9;
  }
  if (v15 && v16)
  {
    objc_msgSend((id)v15, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (v20)
    {
      if (v36)
      {
        uuidToImageDataCache = self->_uuidToImageDataCache;
        objc_msgSend((id)v15, "UUIDString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache setObject:forKey:](uuidToImageDataCache, "setObject:forKey:", v36, v22);

      }
      else
      {
        -[WBSFaviconProviderPrivateCache removeImageDataForPageURLString:](self, "removeImageDataForPageURLString:", v13);
      }
      goto LABEL_16;
    }
    goto LABEL_8;
  }
LABEL_9:
  if (!v36)
    goto LABEL_16;
  if (!(v15 | v17))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "UUIDString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:]([WBSFaviconProviderIconInfo alloc], "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v13, v14, v32, v33, v7, 0, width, height);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pageURLStringToIconInfoDict, "setObject:forKeyedSubscript:", v34, v13);

    v35 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:]([WBSFaviconProviderIconInfo alloc], "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", 0, v14, v32, v33, v7, 0, width, height);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iconURLStringToIconInfoDict, "setObject:forKeyedSubscript:", v35, v14);

    -[NSCache setObject:forKey:](self->_uuidToImageDataCache, "setObject:forKey:", v36, v32);
    goto LABEL_15;
  }
  if (!v15 && v17)
  {
    v23 = [WBSFaviconProviderIconInfo alloc];
    objc_msgSend((id)v17, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "dateAdded");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "size");
    v28 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v23, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v13, v14, v24, v25, objc_msgSend((id)v17, "hasGeneratedResolutions"), 0, v26, v27);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pageURLStringToIconInfoDict, "setObject:forKeyedSubscript:", v28, v13);

    v29 = self->_uuidToImageDataCache;
    objc_msgSend((id)v17, "UUIDString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](v29, "setObject:forKey:", v36, v30);

LABEL_15:
    v15 = 0;
  }
LABEL_16:

}

- (void)setIsRejectedResource:(BOOL)a3 forPageURLString:(id)a4 iconURLString:(id)a5
{
  _BOOL4 v6;
  id v8;
  WBSFaviconProviderIconInfo *v9;
  void *v10;
  WBSFaviconProviderIconInfo *v11;
  id v12;

  v6 = a3;
  v12 = a4;
  v8 = a5;
  if (v6)
  {
    v9 = [WBSFaviconProviderIconInfo alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v9, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v12, v8, 0, v10, 0, 1, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

  }
  else
  {
    v11 = 0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_urlStringToRejectedResourceIconInfoDict, "setObject:forKeyedSubscript:", v11, v12);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_urlStringToRejectedResourceIconInfoDict, "setObject:forKeyedSubscript:", v11, v8);

}

- (id)rejectedResourceInfosForPageURLString:(id)a3 iconURLString:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  objc_msgSend(v7, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_urlStringToRejectedResourceIconInfoDict, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v9, "addObject:", v10);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_urlStringToRejectedResourceIconInfoDict, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v9, "addObject:", v11);

  return v9;
}

- (BOOL)linkPageURLString:(id)a3 toIconURLString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  WBSFaviconProviderIconInfo *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  WBSFaviconProviderIconInfo *v18;

  v6 = a3;
  v7 = a4;
  -[WBSFaviconProviderPrivateCache imageInfoForPageURLString:](self, "imageInfoForPageURLString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFaviconProviderPrivateCache imageInfoForIconURLString:](self, "imageInfoForIconURLString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
      -[WBSFaviconProviderPrivateCache removeImageDataForPageURLString:](self, "removeImageDataForPageURLString:", v6);
      v13 = [WBSFaviconProviderIconInfo alloc];
      objc_msgSend(v9, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateAdded");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "size");
      v18 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v13, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v6, v7, v14, v15, objc_msgSend(v9, "hasGeneratedResolutions"), 0, v16, v17);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pageURLStringToIconInfoDict, "setObject:forKeyedSubscript:", v18, v6);

    }
  }

  return v9 != 0;
}

- (void)removeImageDataForPageURLString:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *pageURLStringToIconInfoDict;
  uint64_t v7;
  id v8;
  NSMutableDictionary *iconURLStringToIconInfoDict;
  id v10;
  NSCache *uuidToImageDataCache;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v4 = a3;
  -[WBSFaviconProviderPrivateCache imageInfoForPageURLString:](self, "imageInfoForPageURLString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_pageURLStringToIconInfoDict, "removeObjectForKey:", v4);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 1;
    pageURLStringToIconInfoDict = self->_pageURLStringToIconInfoDict;
    v7 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __66__WBSFaviconProviderPrivateCache_removeImageDataForPageURLString___block_invoke;
    v25[3] = &unk_1E5443540;
    v8 = v5;
    v26 = v8;
    v27 = &v28;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](pageURLStringToIconInfoDict, "enumerateKeysAndObjectsUsingBlock:", v25);
    if (*((_BYTE *)v29 + 24))
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__4;
      v23 = __Block_byref_object_dispose__4;
      v24 = 0;
      iconURLStringToIconInfoDict = self->_iconURLStringToIconInfoDict;
      v13 = v7;
      v14 = 3221225472;
      v15 = __66__WBSFaviconProviderPrivateCache_removeImageDataForPageURLString___block_invoke_7;
      v16 = &unk_1E5443540;
      v10 = v8;
      v17 = v10;
      v18 = &v19;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](iconURLStringToIconInfoDict, "enumerateKeysAndObjectsUsingBlock:", &v13);
      if (v20[5])
      {
        -[NSMutableDictionary removeObjectForKey:](self->_iconURLStringToIconInfoDict, "removeObjectForKey:", v13, v14, v15, v16);
        uuidToImageDataCache = self->_uuidToImageDataCache;
        objc_msgSend(v10, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache removeObjectForKey:](uuidToImageDataCache, "removeObjectForKey:", v12);

      }
      _Block_object_dispose(&v19, 8);

    }
    _Block_object_dispose(&v28, 8);
  }

}

void __66__WBSFaviconProviderPrivateCache_removeImageDataForPageURLString___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v8, "isEqual:", v9);
  if ((_DWORD)v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __66__WBSFaviconProviderPrivateCache_removeImageDataForPageURLString___block_invoke_7(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = a3;
  objc_msgSend(v8, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v10, "isEqual:", v11);
  if ((_DWORD)v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)removeAllImageDataWithCompletionHandler:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[NSMutableDictionary allKeys](self->_pageURLStringToIconInfoDict, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache removeAllObjects](self->_uuidToImageDataCache, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_pageURLStringToIconInfoDict, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_iconURLStringToIconInfoDict, "removeAllObjects");
  if (v5)
    v5[2](v5, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlStringToRejectedResourceIconInfoDict, 0);
  objc_storeStrong((id *)&self->_iconURLStringToIconInfoDict, 0);
  objc_storeStrong((id *)&self->_pageURLStringToIconInfoDict, 0);
  objc_storeStrong((id *)&self->_uuidToImageDataCache, 0);
}

@end
