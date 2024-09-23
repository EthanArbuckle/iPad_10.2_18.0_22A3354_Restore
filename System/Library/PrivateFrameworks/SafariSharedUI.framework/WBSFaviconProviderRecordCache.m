@implementation WBSFaviconProviderRecordCache

- (WBSFaviconProviderRecordCache)init
{
  WBSFaviconProviderRecordCache *v2;
  uint64_t v3;
  NSMutableDictionary *iconURLStringToInfoDictionary;
  uint64_t v5;
  NSMutableDictionary *iconUUIDToURLStringDictionary;
  WBSFaviconProviderRecordCache *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSFaviconProviderRecordCache;
  v2 = -[WBSFaviconProviderRecordCache init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    iconURLStringToInfoDictionary = v2->_iconURLStringToInfoDictionary;
    v2->_iconURLStringToInfoDictionary = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    iconUUIDToURLStringDictionary = v2->_iconUUIDToURLStringDictionary;
    v2->_iconUUIDToURLStringDictionary = (NSMutableDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)iconInfoForURLString:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_iconURLStringToInfoDictionary, "objectForKeyedSubscript:", a3);
}

- (void)setDateAdded:(id)a3 forFaviconURLString:(id)a4 iconUUID:(id)a5 iconSize:(CGSize)a6 hasGeneratedResolutions:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  NSMutableDictionary *iconUUIDToURLStringDictionary;
  id v14;
  id v15;
  id v16;
  WBSFaviconProviderIconInfo *v17;
  id v18;

  v7 = a7;
  height = a6.height;
  width = a6.width;
  iconUUIDToURLStringDictionary = self->_iconUUIDToURLStringDictionary;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[NSMutableDictionary objectForKey:](iconUUIDToURLStringDictionary, "objectForKey:", v14);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
    -[NSMutableDictionary removeObjectForKey:](self->_iconURLStringToInfoDictionary, "removeObjectForKey:", v18);
  -[NSMutableDictionary removeObjectForKey:](self->_iconUUIDToURLStringDictionary, "removeObjectForKey:", v14);
  v17 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:]([WBSFaviconProviderIconInfo alloc], "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", 0, v15, v14, v16, v7, 0, width, height);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iconURLStringToInfoDictionary, "setObject:forKeyedSubscript:", v17, v15);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iconUUIDToURLStringDictionary, "setObject:forKeyedSubscript:", v15, v14);

}

- (id)dateAddedForFaviconURLString:(id)a3 iconUUID:(id *)a4 size:(CGSize *)a5
{
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iconURLStringToInfoDictionary, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a5 && v7)
  {
    objc_msgSend(v7, "size");
    a5->width = v9;
    a5->height = v10;
  }
  if (a4 && v8)
  {
    objc_msgSend(v8, "UUIDString");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "dateAdded");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)removeAllRecords
{
  -[NSMutableDictionary removeAllObjects](self->_iconURLStringToInfoDictionary, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_iconUUIDToURLStringDictionary, "removeAllObjects");
}

- (void)removeRecordForIconUUIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_iconUUIDToURLStringDictionary, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          -[NSMutableDictionary removeObjectForKey:](self->_iconURLStringToInfoDictionary, "removeObjectForKey:", v10);
        -[NSMutableDictionary removeObjectForKey:](self->_iconUUIDToURLStringDictionary, "removeObjectForKey:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconUUIDToURLStringDictionary, 0);
  objc_storeStrong((id *)&self->_iconURLStringToInfoDictionary, 0);
}

@end
