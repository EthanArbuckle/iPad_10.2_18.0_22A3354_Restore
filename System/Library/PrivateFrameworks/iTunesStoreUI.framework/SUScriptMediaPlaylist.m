@implementation SUScriptMediaPlaylist

+ (unint64_t)nativePlaylistAttributesForScriptPlaylistAttributes:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(a3);
      v9 = 0;
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
      do
      {
        if (objc_msgSend((id)__MediaPlaylistAttributeMapping[v9 + 1], "isEqual:", v10))
          v6 |= __MediaPlaylistAttributeMapping[v9];
        v9 += 2;
      }
      while (v9 != 8);
    }
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v5);
  return v6;
}

+ (id)scriptPlaylistAttributesForNativePlaylistAttributes:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = 0;
  while (1)
  {
    v6 = __MediaPlaylistAttributeMapping[v5];
    if (v6 == a3)
      break;
    if ((v6 & a3) != 0)
      objc_msgSend(v4, "addObject:", __MediaPlaylistAttributeMapping[v5 + 1]);
    v5 += 2;
    if (v5 == 8)
      return v4;
  }
  objc_msgSend(v4, "removeAllObjects");
  objc_msgSend(v4, "addObject:", __MediaPlaylistAttributeMapping[v5 + 1]);
  return v4;
}

- (MPMediaPlaylist)nativePlaylist
{
  return (MPMediaPlaylist *)-[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
}

- (id)valueForProperty:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  SUScriptMediaItem *v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t);
  void *v23;
  SUScriptMediaPlaylist *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__25;
  v31 = __Block_byref_object_dispose__25;
  v32 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    goto LABEL_16;
  }
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __42__SUScriptMediaPlaylist_valueForProperty___block_invoke;
  v23 = &unk_24DE7CBC0;
  v25 = a3;
  v26 = &v27;
  v24 = self;
  WebThreadRunOnMainThread();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend((id)v28[5], "reason"));

    v5 = 0;
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("attributes")))
  {
    v5 = (id)objc_msgSend((id)objc_opt_class(), "scriptPlaylistAttributesForNativePlaylistAttributes:", objc_msgSend((id)v28[5], "integerValue"));
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("seed-items")))
      goto LABEL_16;
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = (void *)v28[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v33, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          v11 = objc_alloc_init(SUScriptMediaItem);
          -[SUScriptObject setNativeObject:](v11, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v10));
          -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v11);
          objc_msgSend(v5, "addObject:", v11);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v33, 16);
      }
      while (v7);
    }
  }
  v28[5] = (uint64_t)v5;
LABEL_16:
  v12 = (void *)v28[5];
  if (v12)
    v13 = v12;
  else
    v13 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v14 = v13;
  _Block_object_dispose(&v27, 8);
  return v14;
}

id __42__SUScriptMediaPlaylist_valueForProperty___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "valueForProperty:", *(_QWORD *)(a1 + 40));
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
}

- (id)_className
{
  return CFSTR("iTunesMediaPlaylist");
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_31, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaPlaylist;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_31 = (uint64_t)sel_valueForProperty_;
    *(_QWORD *)algn_2551868C8 = CFSTR("valueForProperty");
  }
}

@end
