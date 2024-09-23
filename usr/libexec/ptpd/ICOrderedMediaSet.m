@implementation ICOrderedMediaSet

- (ICOrderedMediaSet)initWithTypes:(id)a3
{
  id v4;
  ICOrderedMediaSet *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *mediaItems;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICOrderedMediaSet;
  v5 = -[ICOrderedMediaSet init](&v20, "init");
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mediaItems = v5->_mediaItems;
    v5->_mediaItems = v6;

    v5->_mediaLock._os_unfair_lock_opaque = 0;
    if (v4)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet", (_QWORD)v16));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_mediaItems, "setObject:forKeyedSubscript:", v14, v13);

            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v10);
      }

    }
  }

  return v5;
}

- (unint64_t)mediaItemCount
{
  os_unfair_lock_s *p_mediaLock;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_mediaItems, "allKeys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i)));
        v7 += (unint64_t)objc_msgSend(v10, "count");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  os_unfair_lock_unlock(p_mediaLock);
  return v7;
}

- (void)addMediaItemToIndex:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *p_mediaLock;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaItemType"));
  if (v5)
  {
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaItemType"));
    v14 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICOrderedMediaSet mediaItemWithHandle:inTypes:](self, "mediaItemWithHandle:inTypes:", v6, v8));

    if (!v9)
    {
      p_mediaLock = &self->_mediaLock;
      os_unfair_lock_lock(&self->_mediaLock);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", v5));
      v12 = v11;
      if (v11)
      {
        v13 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v11, "count"), 1024, &stru_1000489E8);
        if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "insertObject:atIndex:", v4, v13);
      }
      os_unfair_lock_unlock(p_mediaLock);

    }
  }

}

- (BOOL)removeMediaItemFromIndex:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_mediaLock;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaItemType"));
  if (v5)
  {
    p_mediaLock = &self->_mediaLock;
    os_unfair_lock_lock(&self->_mediaLock);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", v5));
    v8 = v7;
    v9 = v7 != 0;
    if (v7)
      objc_msgSend(v7, "removeObject:", v4);
    os_unfair_lock_unlock(p_mediaLock);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)removeMediaItemsFromIndex:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  v6 = v5;
  if (v5)
  {
    v7 = *(_QWORD *)v12;
    v8 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[ICOrderedMediaSet removeMediaItemFromIndex:](self, "removeMediaItemFromIndex:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v8 != v9);
      v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  return v6 != 0;
}

- (BOOL)removeMediaItemWithHandleFromIndex:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICOrderedMediaSet mediaItemWithHandle:inTypes:](self, "mediaItemWithHandle:inTypes:", a3, 0));
  if (v4)
    -[ICOrderedMediaSet removeMediaItemFromIndex:](self, "removeMediaItemFromIndex:", v4);

  return v4 != 0;
}

- (void)removeAllItems
{
  os_unfair_lock_s *p_mediaLock;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_mediaItems, "allKeys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8)));
        objc_msgSend(v9, "removeAllObjects");

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_mediaLock);
}

- (id)mediaItemWithHandle:(unint64_t)a3 inTypes:(id)a4
{
  id v6;
  os_unfair_lock_s *p_mediaLock;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a4;
  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_mediaItems, "allKeys"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v19 = v6;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i)));
        v14 = objc_msgSend(v13, "count");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
        v16 = objc_msgSend(v13, "indexOfObject:inSortedRange:options:usingComparator:", v15, 0, v14, 256, &stru_100048A28);

        if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v16));

          goto LABEL_14;
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
        continue;
      break;
    }
    v17 = 0;
LABEL_14:
    p_mediaLock = &self->_mediaLock;
    v6 = v19;
  }
  else
  {
    v17 = 0;
  }

  os_unfair_lock_unlock(p_mediaLock);
  return v17;
}

- (id)orderedSetForType:(id)a3
{
  os_unfair_lock_s *p_mediaLock;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    p_mediaLock = &self->_mediaLock;
    v5 = a3;
    os_unfair_lock_lock(p_mediaLock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", v5));

    v7 = objc_msgSend(v6, "copy");
    os_unfair_lock_unlock(p_mediaLock);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)arrayForType:(id)a3
{
  os_unfair_lock_s *p_mediaLock;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    p_mediaLock = &self->_mediaLock;
    v5 = a3;
    os_unfair_lock_lock(p_mediaLock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "array"));
    v8 = objc_msgSend(v7, "copy");

    os_unfair_lock_unlock(p_mediaLock);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)performSelector:(id)a3 onTypes:(id)a4
{
  id v6;
  SEL v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
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

  v6 = a4;
  v7 = NSSelectorFromString((NSString *)a3);
  os_unfair_lock_lock(&self->_mediaLock);
  v19 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_mediaItems, "allKeys"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i)));
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
              if ((objc_opt_respondsToSelector(v18, v7) & 1) != 0)
                objc_msgSend(v18, "performSelector:", v7);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v15);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_mediaLock);
}

- (os_unfair_lock_s)mediaLock
{
  return self->_mediaLock;
}

- (void)setMediaLock:(os_unfair_lock_s)a3
{
  self->_mediaLock = a3;
}

- (NSMutableDictionary)mediaItems
{
  return self->_mediaItems;
}

- (void)setMediaItems:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItems, 0);
}

@end
