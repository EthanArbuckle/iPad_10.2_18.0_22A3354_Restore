@implementation SUSectionsResponse

- (SUSectionsResponse)init
{
  return -[SUSectionsResponse initWithClientInterface:sectionsDictionary:responseType:](self, "initWithClientInterface:sectionsDictionary:responseType:", +[SUClientDispatch clientInterface](SUClientDispatch, "clientInterface"), 0, 0);
}

- (SUSectionsResponse)initWithClientInterface:(id)a3 cacheDirectory:(id)a4
{
  uint64_t v7;
  void *v8;
  SUSectionsResponse *v9;

  v7 = objc_msgSend(a4, "stringByAppendingPathComponent:", CFSTR("Sections.plist"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v9 = -[SUSectionsResponse initWithClientInterface:sectionsDictionary:responseType:](self, "initWithClientInterface:sectionsDictionary:responseType:", a3, v8, 0), (self = v9) != 0)&& (!-[NSArray count](-[SUSectionsResponse allSections](v9, "allSections"), "count")|| !-[SUSectionsResponse _loadArtworkFromCacheDirectory:](self, "_loadArtworkFromCacheDirectory:", a4)))
  {

    self = 0;
  }

  return self;
}

- (SUSectionsResponse)initWithClientInterface:(id)a3 sectionsDictionary:(id)a4 responseType:(int64_t)a5
{
  SUSectionsResponse *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUSectionsResponse;
  v8 = -[SUSectionsResponse init](&v10, sel_init);
  if (v8)
  {
    v8->_clientInterface = (SUClientInterface *)a3;
    v8->_rawResponseDictionary = (NSMutableDictionary *)objc_msgSend(a4, "mutableCopy");
    v8->_responseType = a5;
    v8->_sectionsCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUSectionsResponse;
  -[SUSectionsResponse dealloc](&v3, sel_dealloc);
}

+ (id)lastCachedVersionIdentifier
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "stringForKey:", CFSTR("SULastSectionsVersion:7.1"));
}

+ (id)sectionsCacheDirectory
{
  id result;
  void *v3;
  void *v4;

  result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier");
  if (result)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", -[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"), result, CFSTR("Sections"), 0);
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v3);

    return v4;
  }
  return result;
}

+ (void)setLastCachedVersionIdentifier:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setObject:forKey:", a3, CFSTR("SULastSectionsVersion:7.1"));
}

- (NSArray)allSections
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F70]), "initWithDictionary:", self->_rawResponseDictionary);
  v4 = objc_msgSend(v3, "dictionaryByRemovingConditions");

  return (NSArray *)-[SUSectionsResponse _newSectionsFromDictionary:](self, "_newSectionsFromDictionary:", v4);
}

- (void)dropEmbeddedImages
{
  -[SUSectionsResponse _dropImageKeysFromDictionary:](self, "_dropImageKeysFromDictionary:", self->_rawResponseDictionary);
}

- (SSItemImageCollection)moreListImageCollection
{
  id v2;
  void *v3;

  v2 = -[NSDictionary objectForKey:](-[SUSectionsResponse sectionsDictionary](self, "sectionsDictionary"), "objectForKey:", CFSTR("more-list-artwork"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E60]), "initWithImageCollection:", v2);
  else
    v3 = 0;
  return (SSItemImageCollection *)v3;
}

- (NSString)moreListTitle
{
  id v2;

  v2 = -[NSDictionary objectForKey:](-[SUSectionsResponse sectionsDictionary](self, "sectionsDictionary"), "objectForKey:", CFSTR("more-list-title"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (NSArray)sections
{
  return (NSArray *)-[SUSectionsResponse _newSectionsFromDictionary:](self, "_newSectionsFromDictionary:", -[SUSectionsResponse sectionsDictionary](self, "sectionsDictionary"));
}

- (NSDictionary)sectionsDictionary
{
  void *v2;
  NSDictionary *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F70]), "initWithDictionary:", self->_rawResponseDictionary);
  v3 = (NSDictionary *)objc_msgSend(v2, "dictionaryByEvaluatingConditions");

  return v3;
}

- (void)setShouldResetUserOrdering:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;

  self->_shouldResetUserOrdering = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", v3);
}

- (void)setStoreFrontIdentifier:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = (id)objc_msgSend(a3, "copy");
    -[NSMutableDictionary setObject:forKey:](self->_rawResponseDictionary, "setObject:forKey:", v4, CFSTR("store-front-id"));

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_rawResponseDictionary, "removeObjectForKey:", CFSTR("store-front-id"));
  }
}

- (BOOL)shouldResetUserOrdering
{
  NSNumber *shouldResetUserOrdering;
  NSNumber *v3;

  if (self->_shouldResetUserOrdering)
  {
    shouldResetUserOrdering = self->_shouldResetUserOrdering;
    return -[NSNumber BOOLValue](shouldResetUserOrdering, "BOOLValue");
  }
  v3 = -[NSDictionary objectForKey:](-[SUSectionsResponse sectionsDictionary](self, "sectionsDictionary"), "objectForKey:", CFSTR("reset-user-ordering"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    shouldResetUserOrdering = v3;
    return -[NSNumber BOOLValue](shouldResetUserOrdering, "BOOLValue");
  }
  return 0;
}

- (NSString)storeFrontIdentifier
{
  return (NSString *)(id)-[NSMutableDictionary objectForKey:](self->_rawResponseDictionary, "objectForKey:", CFSTR("store-front-id"));
}

- (NSString)versionString
{
  id v2;

  v2 = -[NSDictionary objectForKey:](-[SUSectionsResponse sectionsDictionary](self, "sectionsDictionary"), "objectForKey:", CFSTR("version"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)objc_msgSend(v2, "stringValue");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (BOOL)writeToCacheDirectory:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  UIImage *moreListImage;
  UIImage *moreListSelectedImage;
  int *v27;
  uint64_t v28;
  BOOL v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  _BYTE v36[128];
  int v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  v6 = objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", self->_rawResponseDictionary, 200, 0, &v35);
  if (v6
    && (v7 = (void *)v6,
        v8 = objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("Sections.plist")),
        objc_msgSend(v7, "writeToFile:options:error:", v8, 0, &v35)))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v11 &= 2u;
    if (v11)
    {
      v12 = objc_opt_class();
      v37 = 138412546;
      v38 = v12;
      v39 = 2112;
      v40 = v8;
      LODWORD(v28) = 22;
      v27 = &v37;
      v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v37, v28);
        free(v14);
        v27 = (int *)v15;
        SSFileLog();
      }
    }
    v29 = 1;
  }
  else
  {
    v29 = 0;
  }
  v16 = -[SUSectionsResponse allSections](self, "allSections", v27);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v22 = objc_msgSend(v21, "identifier");
        if (v22)
        {
          v23 = v22;
          -[SUSectionsResponse _writeImage:toCachePath:forIdentifier:variant:](self, "_writeImage:toCachePath:forIdentifier:variant:", objc_msgSend(v21, "image"), a3, v22, 0);
          -[SUSectionsResponse _writeImage:toCachePath:forIdentifier:variant:](self, "_writeImage:toCachePath:forIdentifier:variant:", objc_msgSend(v21, "moreListImage"), a3, v23, CFSTR("-More"));
          -[SUSectionsResponse _writeImage:toCachePath:forIdentifier:variant:](self, "_writeImage:toCachePath:forIdentifier:variant:", objc_msgSend(v21, "selectedImage"), a3, v23, CFSTR("-Selected"));
          -[SUSectionsResponse _writeImage:toCachePath:forIdentifier:variant:](self, "_writeImage:toCachePath:forIdentifier:variant:", objc_msgSend(v21, "selectedMoreListImage"), a3, v23, CFSTR("-MoreSelected"));
          -[SUSectionsResponse _writeButtonImagesForSection:buttons:cachePath:](self, "_writeButtonImagesForSection:buttons:cachePath:", v21, objc_msgSend(v21, "leftSectionButtons"), a3);
          -[SUSectionsResponse _writeButtonImagesForSection:buttons:cachePath:](self, "_writeButtonImagesForSection:buttons:cachePath:", v21, objc_msgSend(v21, "rightSectionButtons"), a3);
        }
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v18);
  }
  moreListImage = self->_moreListImage;
  if (moreListImage)
    -[SUSectionsResponse _writeImage:toCachePath:forIdentifier:variant:](self, "_writeImage:toCachePath:forIdentifier:variant:", moreListImage, a3, CFSTR("more"), 0);
  moreListSelectedImage = self->_moreListSelectedImage;
  if (moreListSelectedImage)
    -[SUSectionsResponse _writeImage:toCachePath:forIdentifier:variant:](self, "_writeImage:toCachePath:forIdentifier:variant:", moreListSelectedImage, a3, CFSTR("more"), CFSTR("-Selected"));
  if (a4)
    *a4 = v35;
  return v29;
}

- (void)_applyDefaultSearchFieldConfigurationsToSections:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = +[SUSearchFieldConfiguration defaultConfigurationWithClientInterface:](SUSearchFieldConfiguration, "defaultConfigurationWithClientInterface:", self->_clientInterface);
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (v5 != 1)
        {
          if (objc_msgSend(v10, "type") != 1)
            continue;
LABEL_11:
          objc_msgSend(v10, "setSearchFieldConfiguration:", v4);
          continue;
        }
        if (objc_msgSend(v10, "url") || objc_msgSend(v10, "urlBagKey"))
          goto LABEL_11;
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
}

- (void)_dropImageKeysFromArray:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = objc_msgSend(a3, "count");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_msgSend(a3, "objectAtIndex:", v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "mutableCopy");
        -[SUSectionsResponse _dropImageKeysFromArray:](self, "_dropImageKeysFromArray:", v9);
        goto LABEL_7;
      }
LABEL_8:
      if (v6 == ++v7)
        return;
    }
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    -[SUSectionsResponse _dropImageKeysFromDictionary:](self, "_dropImageKeysFromDictionary:", v9);
LABEL_7:
    objc_msgSend(a3, "replaceObjectAtIndex:withObject:", v7, v9);

    goto LABEL_8;
  }
}

- (void)_dropImageKeysFromDictionary:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "removeObjectForKey:", CFSTR("artwork-urls"));
  objc_msgSend(a3, "removeObjectForKey:", CFSTR("more-list-artwork"));
  objc_msgSend(a3, "removeObjectForKey:", CFSTR("image-url"));
  objc_msgSend(a3, "removeObjectForKey:", CFSTR("image-url@2x"));
  v5 = (void *)objc_msgSend(a3, "allKeys");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(a3, "objectForKey:", v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (void *)objc_msgSend(v11, "mutableCopy");
          -[SUSectionsResponse _dropImageKeysFromDictionary:](self, "_dropImageKeysFromDictionary:", v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v12 = (void *)objc_msgSend(v11, "mutableCopy");
          -[SUSectionsResponse _dropImageKeysFromArray:](self, "_dropImageKeysFromArray:", v12);
        }
        objc_msgSend(a3, "setObject:forKey:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
}

- (BOOL)_loadArtworkFromCacheDirectory:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int *v22;
  uint64_t v23;
  char v24;
  NSArray *obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = -[SUSectionsResponse allSections](self, "allSections");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    v24 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v10 = (id)objc_msgSend(v9, "identifier", v22, v23);
        if (v10)
        {
          v11 = -[SUSectionsResponse _newImageForIdentifier:variant:cacheDirectory:](self, "_newImageForIdentifier:variant:cacheDirectory:", v10, &stru_24DE83F60, a3);
          v12 = -[SUSectionsResponse _newImageForIdentifier:variant:cacheDirectory:](self, "_newImageForIdentifier:variant:cacheDirectory:", v10, CFSTR("-More"), a3);
          v13 = -[SUSectionsResponse _newImageForIdentifier:variant:cacheDirectory:](self, "_newImageForIdentifier:variant:cacheDirectory:", v10, CFSTR("-Selected"), a3);
          v10 = -[SUSectionsResponse _newImageForIdentifier:variant:cacheDirectory:](self, "_newImageForIdentifier:variant:cacheDirectory:", v10, CFSTR("-MoreSelected"), a3);
          -[SUSectionsResponse _loadButtonArtworkForSection:buttons:cachePath:](self, "_loadButtonArtworkForSection:buttons:cachePath:", v9, objc_msgSend(v9, "leftSectionButtons"), a3);
          -[SUSectionsResponse _loadButtonArtworkForSection:buttons:cachePath:](self, "_loadButtonArtworkForSection:buttons:cachePath:", v9, objc_msgSend(v9, "rightSectionButtons"), a3);
        }
        else
        {
          v12 = 0;
          v13 = 0;
          v11 = 0;
        }
        objc_msgSend(v9, "setMoreListImage:", v12);
        objc_msgSend(v9, "setSelectedImage:", v13);
        objc_msgSend(v9, "setSelectedMoreListImage:", v10);

        if (v11)
        {
          objc_msgSend(v9, "setImage:", v11);

        }
        else
        {
          v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v15 = objc_msgSend(v14, "shouldLog");
          if (objc_msgSend(v14, "shouldLogToDisk"))
            v16 = v15 | 2;
          else
            v16 = v15;
          if (!os_log_type_enabled((os_log_t)objc_msgSend(v14, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
            v16 &= 2u;
          if (v16)
          {
            v17 = objc_opt_class();
            v30 = 138412546;
            v31 = v17;
            v32 = 2112;
            v33 = v9;
            LODWORD(v23) = 22;
            v22 = &v30;
            v18 = _os_log_send_and_compose_impl();
            if (v18)
            {
              v19 = (void *)v18;
              v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v30, v23);
              free(v19);
              v22 = (int *)v20;
              SSFileLog();
            }
          }
          v24 = 0;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v6);
  }
  else
  {
    v24 = 1;
  }
  self->_moreListImage = (UIImage *)-[SUSectionsResponse _newImageForIdentifier:variant:cacheDirectory:](self, "_newImageForIdentifier:variant:cacheDirectory:", CFSTR("more"), &stru_24DE83F60, a3, v22);
  self->_moreListSelectedImage = (UIImage *)-[SUSectionsResponse _newImageForIdentifier:variant:cacheDirectory:](self, "_newImageForIdentifier:variant:cacheDirectory:", CFSTR("more"), CFSTR("-Selected"), a3);
  return v24 & 1;
}

- (void)_loadButtonArtworkForSection:(id)a3 buttons:(id)a4 cachePath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = objc_msgSend(a3, "identifier");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a4;
  v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v15 = -[SUSectionsResponse _newVariantStringForButton:](self, "_newVariantStringForButton:", v14);
        v16 = -[SUSectionsResponse _newImageForIdentifier:variant:cacheDirectory:](self, "_newImageForIdentifier:variant:cacheDirectory:", v9, v15, a5);
        objc_msgSend(a3, "setSectionButtonImage:forTag:", v16, objc_msgSend(v14, "tag"));

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
}

- (id)_newImageForIdentifier:(id)a3 variant:(id)a4 cacheDirectory:(id)a5
{
  double v8;
  uint64_t v9;
  id result;
  uint64_t v11;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
  if (v8 != 2.0
    || (v9 = objc_msgSend((id)objc_msgSend(a3, "stringByAppendingFormat:", CFSTR("%@@2x"), a4), "stringByAppendingPathExtension:", CFSTR("png")), (result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithContentsOfFile:", objc_msgSend(a5, "stringByAppendingPathComponent:", v9))) == 0))
  {
    v11 = objc_msgSend((id)objc_msgSend(a3, "stringByAppendingString:", a4), "stringByAppendingPathExtension:", CFSTR("png"));
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithContentsOfFile:", objc_msgSend(a5, "stringByAppendingPathComponent:", v11));
  }
  return result;
}

- (id)_newSectionsFromDictionary:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  uint64_t v13;
  SUSection *v14;
  id v15;
  SUSection *v16;
  SUSection *v17;
  void *v18;
  SUSection *v19;
  SUSearchFieldConfiguration *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_msgSend(a3, "objectForKey:", CFSTR("search-field"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = -[SUSearchFieldConfiguration initWithDictionary:clientInterface:]([SUSearchFieldConfiguration alloc], "initWithDictionary:clientInterface:", v6, self->_clientInterface);
  else
    v21 = 0;
  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("tabs"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("tabs"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (!v8)
      goto LABEL_22;
    v9 = v8;
    v10 = *(_QWORD *)v23;
    v11 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = -[SUSection initWithClientInterface:]([SUSection alloc], "initWithClientInterface:", self->_clientInterface);
          if (-[SUSection loadFromDictionary:searchField:](v14, "loadFromDictionary:searchField:", v13, v21))
          {
            v15 = v5;
            v16 = (SUSection *)-[NSMutableDictionary objectForKey:](self->_sectionsCache, "objectForKey:", -[SUSection identifier](v14, "identifier"));
            if (v16)
            {
              v17 = v16;
              -[SUSection loadFromDictionary:searchField:](v16, "loadFromDictionary:searchField:", v13, v21);
              v18 = v15;
              v19 = v17;
              v5 = v15;
            }
            else
            {
              -[NSMutableDictionary setObject:forKey:](self->_sectionsCache, "setObject:forKey:", v14, -[SUSection identifier](v14, "identifier"));
              v18 = v5;
              v19 = v14;
            }
            objc_msgSend(v18, "addObject:", v19);
            v11 &= objc_msgSend((id)objc_msgSend(v5, "lastObject"), "searchFieldConfiguration") == 0;
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
    if ((v11 & 1) != 0)
LABEL_22:
      -[SUSectionsResponse _applyDefaultSearchFieldConfigurationsToSections:](self, "_applyDefaultSearchFieldConfigurationsToSections:", v5);
  }

  return v5;
}

- (id)_newVariantStringForButton:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("-button-%ld"), objc_msgSend(a3, "tag"));
}

- (void)_writeButtonImagesForSection:(id)a3 buttons:(id)a4 cachePath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = objc_msgSend(a3, "identifier");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(a4);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v15 = objc_msgSend(a3, "imageForSectionButtonWithTag:", objc_msgSend(v14, "tag"));
        if (v15)
        {
          v16 = v15;
          v17 = -[SUSectionsResponse _newVariantStringForButton:](self, "_newVariantStringForButton:", v14);
          -[SUSectionsResponse _writeImage:toCachePath:forIdentifier:variant:](self, "_writeImage:toCachePath:forIdentifier:variant:", v16, a5, v9, v17);

        }
      }
      v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
}

- (void)_writeImage:(id)a3 toCachePath:(id)a4 forIdentifier:(id)a5 variant:(id)a6
{
  id v6;
  double v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v6 = a5;
    if (a6)
      v6 = (id)objc_msgSend(a5, "stringByAppendingString:", a6);
    objc_msgSend(a3, "scale");
    if (v9 == 2.0)
      v6 = (id)objc_msgSend(v6, "stringByAppendingString:", CFSTR("@2x"));
    v10 = objc_msgSend(a4, "stringByAppendingPathComponent:", objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("png")));
    if (-[NSData writeToFile:options:error:](UIImagePNGRepresentation((UIImage *)a3), "writeToFile:options:error:", v10, 0, 0))
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v12 = objc_msgSend(v11, "shouldLog");
      if (objc_msgSend(v11, "shouldLogToDisk"))
        v13 = v12 | 2;
      else
        v13 = v12;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v13 &= 2u;
      if (v13)
      {
        v17 = 138412546;
        v18 = objc_opt_class();
        v19 = 2112;
        v20 = v10;
        LODWORD(v16) = 22;
        v14 = _os_log_send_and_compose_impl();
        if (v14)
        {
          v15 = (void *)v14;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v17, v16);
          free(v15);
          SSFileLog();
        }
      }
    }
  }
}

- (BOOL)isCacheable
{
  return self->_cacheable;
}

- (void)setCacheable:(BOOL)a3
{
  self->_cacheable = a3;
}

- (UIImage)moreListImage
{
  return self->_moreListImage;
}

- (void)setMoreListImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (UIImage)moreListSelectedImage
{
  return self->_moreListSelectedImage;
}

- (void)setMoreListSelectedImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSDictionary)rawResponseDictionary
{
  return &self->_rawResponseDictionary->super;
}

- (int64_t)responseType
{
  return self->_responseType;
}

@end
