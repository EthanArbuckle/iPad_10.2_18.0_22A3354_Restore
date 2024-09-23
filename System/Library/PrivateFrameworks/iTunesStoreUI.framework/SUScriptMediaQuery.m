@implementation SUScriptMediaQuery

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDDBCF0], 0);

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaQuery;
  -[SUScriptObject dealloc](&v4, sel_dealloc);
}

- (MPMediaQuery)nativeQuery
{
  return (MPMediaQuery *)-[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
}

- (void)addFilterPredicate:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __41__SUScriptMediaQuery_addFilterPredicate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "nativePredicate");
  if (result)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "nativeObject"), "object"), "addFilterPredicate:", result);
    return objc_msgSend(*(id *)(a1 + 40), "_resetCaches");
  }
  return result;
}

- (id)canFilterByProperty:(id)a3
{
  void **v3;
  void *v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  if (*((_BYTE *)v7 + 24))
    v3 = (void **)MEMORY[0x24BDBD270];
  else
    v3 = (void **)MEMORY[0x24BDBD268];
  v4 = *v3;
  _Block_object_dispose(&v6, 8);
  return v4;
}

uint64_t __42__SUScriptMediaQuery_canFilterByProperty___block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_msgSend(MEMORY[0x24BDDC7B8], "canFilterByProperty:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    result = 1;
  else
    result = objc_msgSend(MEMORY[0x24BDDC800], "canFilterByProperty:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)makeFilterPredicateWithProperty:(id)a3 value:(id)a4 comparisonType:(id)a5
{
  return -[SUScriptMediaPropertyPredicate initWithProperty:value:comparisonType:]([SUScriptMediaPropertyPredicate alloc], "initWithProperty:value:comparisonType:", a3, a4, a5);
}

- (void)removeFilterPredicate:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __44__SUScriptMediaQuery_removeFilterPredicate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "nativePredicate");
  if (result)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "nativeObject"), "object"), "removeFilterPredicate:", result);
    return objc_msgSend(*(id *)(a1 + 40), "_resetCaches");
  }
  return result;
}

- (id)_className
{
  return CFSTR("iTunesMediaQuery");
}

- (NSArray)collections
{
  void *v2;
  NSArray *v3;
  NSArray *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__22;
  v12 = __Block_byref_object_dispose__22;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __33__SUScriptMediaQuery_collections__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __33__SUScriptMediaQuery_collections__block_invoke(uint64_t a1)
{
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __objc2_class **v9;
  id v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  result = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "collections");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    obj = v3;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 = off_24DE79E10;
          else
            v9 = off_24DE79DD0;
          v10 = objc_alloc_init(*v9);
          objc_msgSend(v10, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v8));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "checkInScriptObjects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    return (id)objc_msgSend(*(id *)(a1 + 32), "_beginWatchingLibraryIfNecessary");
  }
  return result;
}

- (id)filterPredicates
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__22;
  v12 = __Block_byref_object_dispose__22;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __38__SUScriptMediaQuery_filterPredicates__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __38__SUScriptMediaQuery_filterPredicates__block_invoke(uint64_t a1)
{
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SUScriptMediaPropertyPredicate *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  result = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "filterPredicates");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
          v9 = objc_alloc_init(SUScriptMediaPropertyPredicate);
          -[SUScriptObject setNativeObject:](v9, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v8));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v9);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    return (id)objc_msgSend(*(id *)(a1 + 32), "checkInScriptObjects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (NSString)groupingType
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__22;
  v12 = __Block_byref_object_dispose__22;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __34__SUScriptMediaQuery_groupingType__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

unint64_t __34__SUScriptMediaQuery_groupingType__block_invoke(uint64_t a1)
{
  unint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "groupingType");
  if (result <= 7)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", off_24DE7CBE0[result]);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSArray)items
{
  void *v2;
  NSArray *v3;
  NSArray *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__22;
  v12 = __Block_byref_object_dispose__22;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __27__SUScriptMediaQuery_items__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __27__SUScriptMediaQuery_items__block_invoke(uint64_t a1)
{
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SUScriptMediaItem *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  result = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "items");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
          v9 = objc_alloc_init(SUScriptMediaItem);
          -[SUScriptObject setNativeObject:](v9, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v8));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v9);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "checkInScriptObjects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    return (id)objc_msgSend(*(id *)(a1 + 32), "_beginWatchingLibraryIfNecessary");
  }
  return result;
}

- (void)setFilterPredicates:(id)a3
{
  id v3;

  v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      v3 = 0;
      goto LABEL_7;
    }
    v3 = (id)objc_msgSend(v3, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      goto LABEL_7;
    }
  }
  WebThreadRunOnMainThread();
LABEL_7:

}

void __42__SUScriptMediaQuery_setFilterPredicates___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "nativePredicate");
        if (v8)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "_resetCaches");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "nativeObject"), "object"), "setFilterPredicates:", v2);

}

- (void)setGroupingType:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __38__SUScriptMediaQuery_setGroupingType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("album")) & 1) != 0)
  {
    v3 = 1;
LABEL_17:
    objc_msgSend(v2, "setGroupingType:", v3);
    return objc_msgSend(*(id *)(a1 + 32), "_resetCaches");
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("album-artist")) & 1) != 0)
  {
    v3 = 3;
    goto LABEL_17;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("artist")) & 1) != 0)
  {
    v3 = 2;
    goto LABEL_17;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("composer")) & 1) != 0)
  {
    v3 = 4;
    goto LABEL_17;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("genre")) & 1) != 0)
  {
    v3 = 5;
    goto LABEL_17;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("playlist")) & 1) != 0)
  {
    v3 = 6;
    goto LABEL_17;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("podcast-title")) & 1) != 0)
  {
    v3 = 7;
    goto LABEL_17;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("title")))
  {
    v3 = 0;
    goto LABEL_17;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_resetCaches");
}

- (NSString)comparisonTypeContains
{
  return (NSString *)CFSTR("contains");
}

- (NSString)comparisonTypeEquals
{
  return (NSString *)CFSTR("equals");
}

- (NSString)groupingTypeAlbum
{
  return (NSString *)CFSTR("album");
}

- (NSString)groupingTypeAlbumArtist
{
  return (NSString *)CFSTR("album-artist");
}

- (NSString)groupingTypeArtist
{
  return (NSString *)CFSTR("artist");
}

- (NSString)groupingTypeComposer
{
  return (NSString *)CFSTR("composer");
}

- (NSString)groupingTypeGenre
{
  return (NSString *)CFSTR("genre");
}

- (NSString)groupingTypePlaylist
{
  return (NSString *)CFSTR("playlist");
}

- (NSString)groupingTypePodcastTitle
{
  return (NSString *)CFSTR("podcast-title");
}

- (NSString)groupingTypeTitle
{
  return (NSString *)CFSTR("title");
}

- (void)_beginWatchingLibraryIfNecessary
{
  void *v3;

  if (!self->_watchingLibrary)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    self->_watchingLibrary = 1;
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__libraryChangedNotification_, *MEMORY[0x24BDDBCF0], 0);
  }
}

- (void)_resetCaches
{

  self->_collections = 0;
  self->_filterPredicates = 0;

  self->_items = 0;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_35, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaQuery;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_30, 4);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaQuery;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaQuery;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_35, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_30 = (uint64_t)sel_addFilterPredicate_;
    *(_QWORD *)algn_255186878 = CFSTR("addFilterPredicate");
    qword_255186880 = (uint64_t)sel_canFilterByProperty_;
    unk_255186888 = CFSTR("canFilterByProperty");
    qword_255186890 = (uint64_t)sel_makeFilterPredicateWithProperty_value_comparisonType_;
    unk_255186898 = CFSTR("createFilterPredicate");
    qword_2551868A0 = (uint64_t)sel_removeFilterPredicate_;
    unk_2551868A8 = CFSTR("removeFilterPredicate");
    __KeyMapping_35 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("collections"), CFSTR("filterPredicates"), CFSTR("filterPredicates"), CFSTR("groupingType"), CFSTR("groupingType"), CFSTR("items"), CFSTR("items"), 0);
  }
}

@end
