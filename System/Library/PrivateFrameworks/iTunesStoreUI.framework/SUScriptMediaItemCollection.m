@implementation SUScriptMediaItemCollection

- (SUScriptMediaItemCollection)initWithItems:(id)a3
{
  SUScriptMediaItemCollection *v4;

  v4 = -[SUScriptObject init](self, "init");
  if (v4)
  {
    if (!a3
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (a3 = (id)objc_msgSend(a3, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class())) != 0)
    {
      WebThreadRunOnMainThread();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));

      a3 = 0;
      v4 = 0;
    }

  }
  return v4;
}

void __45__SUScriptMediaItemCollection_initWithItems___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "nativeItem");
        if (v8)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDDC7C8]), "initWithItems:", v2);
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(*(id *)(a1 + 40), "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v9));

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDDBCF0], 0);

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaItemCollection;
  -[SUScriptObject dealloc](&v4, sel_dealloc);
}

- (MPMediaItemCollection)nativeCollection
{
  return (MPMediaItemCollection *)-[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
}

- (id)_className
{
  return CFSTR("iTunesMediaItemCollection");
}

- (int64_t)count
{
  int64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __36__SUScriptMediaItemCollection_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
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
  v11 = __Block_byref_object_copy__23;
  v12 = __Block_byref_object_dispose__23;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __36__SUScriptMediaItemCollection_items__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __36__SUScriptMediaItemCollection_items__block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SUScriptMediaItem *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "nativeObject"), "object"), "items");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
          v8 = objc_alloc_init(SUScriptMediaItem);
          -[SUScriptObject setNativeObject:](v8, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v7));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40), "addObject:", v8);

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }
    *(_QWORD *)(*(_QWORD *)(v1 + 32) + 72) = *(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(v1 + 32), "checkInScriptObjects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40));
    return objc_msgSend(*(id *)(v1 + 32), "_beginWatchingLibraryIfNecessary");
  }
  return result;
}

- (NSArray)mediaTypes
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  WebThreadRunOnMainThread();
  return (NSArray *)v2;
}

uint64_t __41__SUScriptMediaItemCollection_mediaTypes__block_invoke(uint64_t a1)
{
  uint64_t result;
  const __CFString *v3;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "mediaTypes");
  if (result > 254)
  {
    if (result == 65280)
    {
      v3 = CFSTR("any-video");
      return objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    }
    if (result == 255)
    {
      v3 = CFSTR("any-audio");
      return objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    }
  }
  else
  {
    if (result == -1)
    {
      v3 = CFSTR("any");
      return objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    }
    if (result == 4)
    {
      v3 = CFSTR("audiobook");
      return objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    }
  }
  if ((result & 1) != 0)
  {
    v3 = CFSTR("music");
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  if ((result & 2) != 0)
  {
    v3 = CFSTR("podcast");
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  if ((result & 0x100) != 0)
  {
    v3 = CFSTR("movie");
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  if ((result & 0x200) != 0)
  {
    v3 = CFSTR("tv-show");
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  if ((result & 0x400) != 0)
  {
    v3 = CFSTR("video-podcast");
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  if ((result & 0x800) != 0)
  {
    v3 = CFSTR("music-video");
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  return result;
}

- (SUScriptMediaItem)representativeItem
{
  void *v2;
  SUScriptMediaItem *v3;
  SUScriptMediaItem *v4;
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
  v11 = __Block_byref_object_copy__23;
  v12 = __Block_byref_object_dispose__23;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (SUScriptMediaItem *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __49__SUScriptMediaItemCollection_representativeItem__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __49__SUScriptMediaItemCollection_representativeItem__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  id result;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[10])
  {
    v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "nativeObject"), "object"), "representativeItem");
    if (v3)
    {
      v4 = v3;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_alloc_init(SUScriptMediaItem);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v4));
      objc_msgSend(*(id *)(a1 + 32), "checkInScriptObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
      objc_msgSend(*(id *)(a1 + 32), "_beginWatchingLibraryIfNecessary");
    }
  }
  result = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_libraryChangedNotification:(id)a3
{

  self->_items = 0;
  self->_representativeItem = 0;
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

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_36, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaItemCollection;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaItemCollection;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_36, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_36 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("count"), CFSTR("items"), CFSTR("items"), CFSTR("mediaTypes"), CFSTR("mediaTypes"), CFSTR("representativeItem"), CFSTR("representativeItem"), 0);
}

@end
