@implementation TVPPlaylist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeContext, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_previousMediaItem, 0);
  objc_storeStrong((id *)&self->_nextMediaItem, 0);
  objc_storeStrong((id *)&self->_currentMediaItem, 0);
  objc_storeStrong((id *)&self->_upcomingItems, 0);
  objc_storeStrong((id *)&self->_activeList, 0);
  objc_storeStrong((id *)&self->_shuffledItems, 0);
  objc_storeStrong((id *)&self->_trackList, 0);
}

- (TVPPlaylist)initWithMediaItems:(id)a3 index:(int64_t)a4 isCollection:(BOOL)a5
{
  id v7;
  TVPPlaylist *v8;
  TVPPlaylist *v9;
  uint64_t v10;
  NSMutableArray *trackList;
  NSMutableArray *shuffledItems;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TVPPlaylist;
  v8 = -[TVPPlaylist init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_upcomingItemsLimit = 20;
    v8->_endAction = 0;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v7);
    trackList = v9->_trackList;
    v9->_trackList = (NSMutableArray *)v10;

    objc_storeStrong((id *)&v9->_activeList, v9->_trackList);
    shuffledItems = v9->_shuffledItems;
    v9->_shuffledItems = 0;
    v9->_activeListIndex = a4;

    -[TVPPlaylist _updateCurrent:andNextItems:withContext:](v9, "_updateCurrent:andNextItems:withContext:", 0, 0, 0);
  }

  return v9;
}

- (void)_updateCurrent:(BOOL)a3 andNextItems:(BOOL)a4 withContext:(id)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  NSArray *upcomingItems;
  void *v11;
  unint64_t activeListIndex;
  TVPMediaItem *v13;
  void *v14;
  TVPMediaItem *v15;
  int v16;
  TVPMediaItem *v17;
  unint64_t v18;
  uint64_t v19;
  TVPMediaItem *previousMediaItem;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  const __CFString *v27;
  _QWORD v28[2];

  v6 = a4;
  v7 = a3;
  v28[1] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  if (v9)
    objc_storeStrong((id *)&self->_changeContext, a5);
  upcomingItems = self->_upcomingItems;
  self->_upcomingItems = 0;

  -[TVPPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("upcomingItems"));
  -[TVPPlaylist upcomingItems](self, "upcomingItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  activeListIndex = self->_activeListIndex;
  v13 = 0;
  if (activeListIndex < -[NSArray count](self->_activeList, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_activeList, "objectAtIndexedSubscript:", self->_activeListIndex);
    v13 = (TVPMediaItem *)objc_claimAutoreleasedReturnValue();
  }
  if (v7 && v13 == self->_currentMediaItem)
  {
    v26 = 0;
  }
  else
  {
    if (!v9)
    {
      v27 = CFSTR("direction");
      v28[0] = &unk_24F1734B0;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlaylist setChangeContext:](self, "setChangeContext:", v14);

    }
    -[TVPPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentMediaItem"));
    objc_storeStrong((id *)&self->_currentMediaItem, v13);
    v26 = 1;
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v15 = (TVPMediaItem *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_15;
  }
  else
  {
    v15 = 0;
    if (!v6)
    {
LABEL_15:
      -[TVPPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("nextMediaItem"));
      objc_storeStrong((id *)&self->_nextMediaItem, v15);
      v16 = 1;
      goto LABEL_16;
    }
  }
  if (v15 != self->_nextMediaItem)
    goto LABEL_15;
  v16 = 0;
LABEL_16:
  if (-[TVPPlaylist moreItemsAvailable:](self, "moreItemsAvailable:", 1))
  {
    if (self->_repeatMode == 2)
      v17 = self->_currentMediaItem;
    else
      v17 = 0;
    v18 = self->_activeListIndex;
    if (v18 && v18 <= -[NSArray count](self->_activeList, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_activeList, "objectAtIndexedSubscript:", -[TVPPlaylist _previousActiveListIndex](self, "_previousActiveListIndex"));
      v19 = objc_claimAutoreleasedReturnValue();

      v17 = (TVPMediaItem *)v19;
    }
  }
  else
  {
    v17 = 0;
  }
  previousMediaItem = self->_previousMediaItem;
  if (previousMediaItem != v17)
  {
    -[TVPPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("previousMediaItem"));
    objc_storeStrong((id *)&self->_previousMediaItem, v17);
  }
  v21 = -[NSMutableArray count](self->_trackList, "count");
  if (v21 != self->_count)
    -[TVPPlaylist setCount:](self, "setCount:", v21);
  v22 = self->_activeListIndex;
  if (v22 + 1 < v21)
    v23 = v22 + 1;
  else
    v23 = v21;
  if (v23 != self->_currentIndex)
  {
    -[TVPPlaylist setCurrentIndex:](self, "setCurrentIndex:");
    v22 = self->_activeListIndex;
  }
  if (v22 >= self->_upNextIndex)
  {
    v24 = -[NSArray count](self->_activeList, "count");
    if (v22 + 1 < v24)
      v25 = v22 + 1;
    else
      v25 = v24;
    self->_upNextIndex = v25;
  }
  if (v26)
    -[TVPPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentMediaItem"));
  if (v16)
    -[TVPPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("nextMediaItem"));
  if (previousMediaItem != v17)
    -[TVPPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("previousMediaItem"));
  -[TVPPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("upcomingItems"));

}

- (NSArray)upcomingItems
{
  int64_t repeatMode;
  NSArray *v4;
  unint64_t v5;
  unint64_t activeListIndex;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  NSArray *activeList;
  unint64_t i;
  void *v12;
  BOOL v13;
  void *v14;
  NSArray *upcomingItems;

  if (!self->_upcomingItems)
  {
    repeatMode = self->_repeatMode;
    if (repeatMode == 1)
    {
      v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_upcomingItemsLimit);
      if (-[NSArray count](self->_activeList, "count"))
      {
        activeListIndex = self->_activeListIndex;
        if (-[NSArray count](v4, "count") < self->_upcomingItemsLimit)
        {
          v7 = activeListIndex + 1;
          do
          {
            -[NSArray objectAtIndex:](self->_activeList, "objectAtIndex:", v7 % -[NSArray count](self->_activeList, "count"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[TVPPlaylist skipExplicit](self, "skipExplicit")
              || !-[TVPPlaylist _isMediaItemExplicit:](self, "_isMediaItemExplicit:", v8))
            {
              -[NSArray addObject:](v4, "addObject:", v8);
            }

            ++v7;
          }
          while (-[NSArray count](v4, "count") < self->_upcomingItemsLimit);
        }
      }
    }
    else if (repeatMode == 2)
    {
      v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_upcomingItemsLimit);
      if (self->_upcomingItemsLimit)
      {
        v5 = 0;
        do
        {
          if (!self->_currentMediaItem)
            break;
          -[NSArray addObject:](v4, "addObject:");
          ++v5;
        }
        while (v5 < self->_upcomingItemsLimit);
      }
    }
    else
    {
      v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_upcomingItemsLimit);
      v9 = self->_activeListIndex;
      if (v9 < -[NSArray count](self->_activeList, "count"))
      {
        activeList = self->_activeList;
        for (i = self->_activeListIndex + 1;
              i < -[NSArray count](activeList, "count") && -[NSArray count](v4, "count") < self->_upcomingItemsLimit;
              ++i)
        {
          if (!-[TVPPlaylist skipExplicit](self, "skipExplicit")
            || (-[NSArray objectAtIndexedSubscript:](self->_activeList, "objectAtIndexedSubscript:", i),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                v13 = -[TVPPlaylist _isMediaItemExplicit:](self, "_isMediaItemExplicit:", v12),
                v12,
                !v13))
          {
            -[NSArray objectAtIndexedSubscript:](self->_activeList, "objectAtIndexedSubscript:", i);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v4, "addObject:", v14);

          }
          activeList = self->_activeList;
        }
      }
    }
    upcomingItems = self->_upcomingItems;
    self->_upcomingItems = v4;

  }
  return self->_upcomingItems;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndex = a3;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void)setChangeContext:(id)a3
{
  objc_storeStrong((id *)&self->_changeContext, a3);
}

- (BOOL)moreItemsAvailable:(int64_t)a3
{
  _BOOL4 windowed;
  BOOL result;
  unint64_t activeListIndex;

  windowed = self->_windowed;
  result = a3 == 0;
  if (!windowed)
  {
    if (a3)
    {
      if ((unint64_t)(self->_repeatMode - 1) < 2)
        return 1;
      activeListIndex = self->_activeListIndex;
    }
    else
    {
      activeListIndex = (unint64_t)self->_nextMediaItem;
    }
    return activeListIndex != 0;
  }
  return result;
}

- (TVPMediaItem)currentMediaItem
{
  return self->_currentMediaItem;
}

- (void)setNumConsecutivePlaybackFailures:(unint64_t)a3
{
  self->_numConsecutivePlaybackFailures = a3;
}

- (TVPMediaItem)nextMediaItem
{
  return self->_nextMediaItem;
}

- (BOOL)isEqualToPlaylist:(id)a3
{
  TVPPlaylist *v4;
  TVPPlaylist *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  _BOOL4 v11;
  int64_t v12;
  _BOOL4 v13;
  BOOL v14;
  void *v16;
  _QWORD v17[4];
  TVPPlaylist *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = (TVPPlaylist *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v14 = 1;
      goto LABEL_10;
    }
    -[TVPPlaylist trackList](self, "trackList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    -[TVPPlaylist trackList](v5, "trackList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 == v9)
    {
      v10 = -[TVPPlaylist repeatMode](self, "repeatMode");
      if (v10 == -[TVPPlaylist repeatMode](v5, "repeatMode"))
      {
        v11 = -[TVPPlaylist shuffleEnabled](self, "shuffleEnabled");
        if (v11 == -[TVPPlaylist shuffleEnabled](v5, "shuffleEnabled"))
        {
          v12 = -[TVPPlaylist endAction](self, "endAction");
          if (v12 == -[TVPPlaylist endAction](v5, "endAction"))
          {
            v13 = -[TVPPlaylist skipExplicit](self, "skipExplicit");
            if (v13 == -[TVPPlaylist skipExplicit](v5, "skipExplicit"))
            {
              v20 = 0;
              v21 = &v20;
              v22 = 0x2020000000;
              v23 = 1;
              -[TVPPlaylist trackList](self, "trackList");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17[0] = MEMORY[0x24BDAC760];
              v17[1] = 3221225472;
              v17[2] = __33__TVPPlaylist_isEqualToPlaylist___block_invoke;
              v17[3] = &unk_24F15B960;
              v18 = v5;
              v19 = &v20;
              objc_msgSend(v16, "enumerateObjectsUsingBlock:", v17);

              v14 = *((_BYTE *)v21 + 24) != 0;
              _Block_object_dispose(&v20, 8);
              goto LABEL_10;
            }
          }
        }
      }
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (int64_t)endAction
{
  return self->_endAction;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___TVPPlaylist;
  objc_msgSendSuper2(&v8, sel_keyPathsForValuesAffectingValueForKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("supportsShuffle")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("supportsRepeat")))
  {
    objc_msgSend(v5, "setByAddingObject:", CFSTR("windowed"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("shuffleEnabled")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("endAction")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___TVPPlaylist;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (TVPPlaylist)init
{
  return -[TVPPlaylist initWithMediaItems:index:isCollection:](self, "initWithMediaItems:index:isCollection:", 0, 0, 0);
}

void __33__TVPPlaylist_isEqualToPlaylist___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "trackList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = objc_msgSend(v8, "isEqualToMediaItem:", v10);
  if ((a3 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (void)changeMedia:(int64_t)a3
{
  -[TVPPlaylist changeMedia:withContext:](self, "changeMedia:withContext:", a3, 0);
}

- (void)changeMedia:(int64_t)a3 withContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  int64_t repeatMode;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t activeListIndex;
  unint64_t v20;
  id v21;

  v6 = (void *)MEMORY[0x24BDD16D0];
  v7 = a4;
  objc_msgSend(v6, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("TVPPlaylistMediaChangeRequestedNotification"), self, v7);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v7);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_windowed)
  {
    if (a3 != 1)
    {
      if (a3)
        goto LABEL_32;
      repeatMode = self->_repeatMode;
      if (repeatMode != 2)
      {
        if (repeatMode == 1)
        {
          v15 = -[TVPPlaylist _nextActiveListIndex](self, "_nextActiveListIndex");
          self->_activeListIndex = v15 % -[NSMutableArray count](self->_trackList, "count");
        }
        else
        {
          activeListIndex = self->_activeListIndex;
          if (activeListIndex < -[NSArray count](self->_activeList, "count"))
          {
            v20 = -[TVPPlaylist _nextActiveListIndex](self, "_nextActiveListIndex");
            self->_activeListIndex = v20;
            if (v20 == -[NSArray count](self->_activeList, "count"))
              objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("TVPPlaylistDidHitEndKey"));
          }
        }
      }
      v11 = &unk_24F1734B0;
      goto LABEL_28;
    }
    if (!-[TVPPlaylist moreItemsAvailable:](self, "moreItemsAvailable:", 1))
    {
      objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_24F1734C8, CFSTR("direction"));
      v11 = (void *)MEMORY[0x24BDBD1C8];
      v12 = CFSTR("TVPPlaylistDidHitBeginningKey");
LABEL_29:
      v13 = v21;
      goto LABEL_30;
    }
    v16 = self->_repeatMode;
    if (v16 != 2)
    {
      if (v16 == 1)
      {
        if (!self->_activeListIndex)
        {
          v17 = -[NSArray count](self->_activeList, "count");
          if (v17 <= 1)
            v18 = 1;
          else
            v18 = v17;
          self->_activeListIndex = v18 - 1;
          goto LABEL_27;
        }
        goto LABEL_26;
      }
      if (self->_activeListIndex)
LABEL_26:
        self->_activeListIndex = -[TVPPlaylist _previousActiveListIndex](self, "_previousActiveListIndex");
    }
LABEL_27:
    v11 = &unk_24F1734C8;
LABEL_28:
    v12 = CFSTR("direction");
    goto LABEL_29;
  }
  if (a3 != 1)
  {
    if (-[NSMutableArray count](self->_trackList, "count"))
      -[NSMutableArray removeObjectAtIndex:](self->_trackList, "removeObjectAtIndex:", 0);
    self->_activeListIndex = 0;
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("direction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v21;
    if (v10)
      goto LABEL_31;
    v11 = &unk_24F1734B0;
    v12 = CFSTR("direction");
    v13 = v21;
LABEL_30:
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v12, v9);
    v9 = v21;
LABEL_31:
    -[TVPPlaylist _updateCurrent:andNextItems:withContext:](self, "_updateCurrent:andNextItems:withContext:", 0, 0, v9);
  }
LABEL_32:

}

- (BOOL)changeToActiveListIndex:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  if (-[NSArray count](self->_activeList, "count") <= a3
    || -[TVPPlaylist skipExplicit](self, "skipExplicit")
    && (-[NSArray objectAtIndex:](self->_activeList, "objectAtIndex:", a3),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[TVPPlaylist _isMediaItemExplicit:](self, "_isMediaItemExplicit:", v7),
        v7,
        v8))
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v6);
    v11 = v10;
    if (self->_windowed)
    {
      objc_msgSend(v10, "setObject:forKey:", &unk_24F1734B0, CFSTR("direction"));
      -[NSMutableArray removeObjectsInRange:](self->_trackList, "removeObjectsInRange:", 0, a3 - 1);
      self->_activeListIndex = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_activeListIndex >= a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("direction"));

      self->_activeListIndex = a3;
    }
    -[TVPPlaylist _updateCurrent:andNextItems:withContext:](self, "_updateCurrent:andNextItems:withContext:", 0, 0, v11);

    v9 = 1;
  }

  return v9;
}

- (unint64_t)_nextActiveListIndex
{
  unint64_t v3;
  void *v4;
  _BOOL4 v5;

  v3 = self->_activeListIndex + 1;
  if (-[TVPPlaylist skipExplicit](self, "skipExplicit"))
  {
    while (v3 < -[NSArray count](self->_activeList, "count"))
    {
      -[NSArray objectAtIndex:](self->_activeList, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[TVPPlaylist _isMediaItemExplicit:](self, "_isMediaItemExplicit:", v4);

      if (!v5)
        break;
      ++v3;
    }
  }
  return v3;
}

- (unint64_t)_previousActiveListIndex
{
  unint64_t activeListIndex;
  unint64_t v4;
  void *v5;
  _BOOL4 v6;

  activeListIndex = self->_activeListIndex;
  if (activeListIndex)
    v4 = activeListIndex - 1;
  else
    v4 = 0;
  if (-[TVPPlaylist skipExplicit](self, "skipExplicit") && activeListIndex >= 2)
  {
    v4 = activeListIndex - 1;
    do
    {
      -[NSArray objectAtIndex:](self->_activeList, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[TVPPlaylist _isMediaItemExplicit:](self, "_isMediaItemExplicit:", v5);

      if (!v6)
        break;
      --v4;
    }
    while (v4);
  }
  return v4;
}

- (BOOL)_isMediaItemExplicit:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataContentRatingDomain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataContentRatingIsExplicitMusic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("music")))
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (void)setSkipExplicit:(BOOL)a3
{
  if (self->_skipExplicit != a3)
  {
    self->_skipExplicit = a3;
    -[TVPPlaylist _updateCurrent:andNextItems:withContext:](self, "_updateCurrent:andNextItems:withContext:", 1, 1, 0);
  }
}

- (void)setWindowed:(BOOL)a3
{
  if (a3 && self->_endAction != 2)
    -[TVPPlaylist setEndAction:](self, "setEndAction:", 2);
  self->_windowed = a3;
  -[TVPPlaylist _updateCurrent:andNextItems:withContext:](self, "_updateCurrent:andNextItems:withContext:", 1, 1, 0);
}

- (void)setEndAction:(int64_t)a3
{
  if (!self->_windowed && self->_endAction != a3)
  {
    -[TVPPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("endAction"));
    self->_endAction = a3;
    -[TVPPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("endAction"));
  }
}

- (BOOL)supportsShuffle
{
  return !-[TVPPlaylist windowed](self, "windowed");
}

- (void)setShuffleEnabled:(BOOL)a3 preserveCurrentItem:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  NSMutableArray *shuffledItems;
  unint64_t v8;
  uint64_t v9;

  if (self->_shuffleEnabled != a3)
  {
    v4 = a4;
    v5 = a3;
    if (-[TVPPlaylist supportsShuffle](self, "supportsShuffle"))
    {
      -[TVPPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("shuffleEnabled"));
      self->_shuffleEnabled = v5;
      if (v5)
      {
        -[TVPPlaylist _shuffle:](self, "_shuffle:", v4);
      }
      else
      {
        shuffledItems = self->_shuffledItems;
        self->_shuffledItems = 0;

        v8 = 0;
        if (v4)
        {
          v9 = -[NSMutableArray indexOfObject:](self->_trackList, "indexOfObject:", self->_currentMediaItem);
          if (v9 == 0x7FFFFFFFFFFFFFFFLL)
            v8 = 0;
          else
            v8 = v9;
        }
        self->_activeListIndex = v8;
        objc_storeStrong((id *)&self->_activeList, self->_trackList);
      }
      -[TVPPlaylist _updateCurrent:andNextItems:withContext:](self, "_updateCurrent:andNextItems:withContext:", 1, 1, 0);
      -[TVPPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("shuffleEnabled"));
    }
  }
}

- (void)_shuffle:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v5;
  NSMutableArray *shuffledItems;

  v3 = a3;
  v5 = (NSMutableArray *)-[NSMutableArray mutableCopy](self->_trackList, "mutableCopy");
  shuffledItems = self->_shuffledItems;
  self->_shuffledItems = v5;

  -[NSMutableArray tvp_shuffle](self->_shuffledItems, "tvp_shuffle");
  if (v3 && self->_currentMediaItem)
  {
    -[NSMutableArray removeObject:](self->_shuffledItems, "removeObject:");
    -[NSMutableArray insertObject:atIndex:](self->_shuffledItems, "insertObject:atIndex:", self->_currentMediaItem, 0);
  }
  self->_activeListIndex = 0;
  objc_storeStrong((id *)&self->_activeList, self->_shuffledItems);
}

- (void)setRepeatMode:(int64_t)a3
{
  if (self->_repeatMode != a3)
  {
    if (-[TVPPlaylist supportsRepeat](self, "supportsRepeat"))
    {
      self->_repeatMode = a3;
      -[TVPPlaylist _updateCurrent:andNextItems:withContext:](self, "_updateCurrent:andNextItems:withContext:", 1, 1, 0);
    }
  }
}

- (BOOL)supportsRepeat
{
  return !-[TVPPlaylist windowed](self, "windowed");
}

- (void)addItem:(id)a3
{
  NSMutableArray *trackList;
  id v5;

  trackList = self->_trackList;
  v5 = a3;
  -[TVPPlaylist insertItem:atIndex:](self, "insertItem:atIndex:", v5, -[NSMutableArray count](trackList, "count"));

}

- (void)addItems:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BDD15E0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithIndexesInRange:", -[NSMutableArray count](self->_trackList, "count"), objc_msgSend(v5, "count"));
  -[TVPPlaylist insertItems:atIndexes:](self, "insertItems:atIndexes:", v5, v6);

}

- (void)insertItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[NSMutableArray count](self->_trackList, "count") < a4)
    a4 = -[NSMutableArray count](self->_trackList, "count");
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlaylist insertItems:atIndexes:](self, "insertItems:atIndexes:", v7, v8);

}

- (void)insertItems:(id)a3 atIndexes:(id)a4
{
  id v6;
  id v7;
  unint64_t activeListIndex;
  unint64_t v9;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  activeListIndex = self->_activeListIndex;
  if (activeListIndex < -[NSArray count](self->_activeList, "count"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v9 = self->_activeListIndex;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __37__TVPPlaylist_insertItems_atIndexes___block_invoke;
    v10[3] = &unk_24F15B988;
    v10[4] = self;
    v10[5] = &v15;
    v10[6] = &v11;
    v10[7] = v9;
    objc_msgSend(v7, "enumerateRangesUsingBlock:", v10);
    self->_activeListIndex += v16[3];
    self->_upNextIndex += v12[3];
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
  }
  if (self->_shuffleEnabled)
  {
    -[NSMutableArray insertObjects:atIndexes:](self->_shuffledItems, "insertObjects:atIndexes:", v6, v7);
    -[NSMutableArray addObjectsFromArray:](self->_trackList, "addObjectsFromArray:", v6);
  }
  else
  {
    -[NSMutableArray insertObjects:atIndexes:](self->_trackList, "insertObjects:atIndexes:", v6, v7);
  }
  -[TVPPlaylist _updateCurrent:andNextItems:withContext:](self, "_updateCurrent:andNextItems:withContext:", 1, 1, 0);

}

_QWORD *__37__TVPPlaylist_insertItems_atIndexes___block_invoke(_QWORD *result, unint64_t a2, uint64_t a3)
{
  if (a2 <= result[7])
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) += a3;
  if (a2 <= *(_QWORD *)(result[4] + 144))
    *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) += a3;
  return result;
}

- (void)removeItemAtIndex:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TVPPlaylist removeItemsAtIndexes:](self, "removeItemsAtIndexes:", v4);

}

- (void)removeItemsAtIndexes:(id)a3
{
  int v4;
  id v5;
  id v6;
  unint64_t v7;
  unint64_t activeListIndex;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t upNextIndex;
  unint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v14 = a3;
  v4 = objc_msgSend(v14, "containsIndex:", self->_activeListIndex);
  if (self->_shuffleEnabled)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD1698]);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __36__TVPPlaylist_removeItemsAtIndexes___block_invoke;
    v15[3] = &unk_24F15B9B0;
    v15[4] = self;
    v16 = v5;
    v6 = v5;
    objc_msgSend(v14, "enumerateIndexesUsingBlock:", v15);
    -[NSMutableArray removeObjectsAtIndexes:](self->_trackList, "removeObjectsAtIndexes:", v6);
    -[NSMutableArray removeObjectsAtIndexes:](self->_shuffledItems, "removeObjectsAtIndexes:", v14);

  }
  else
  {
    -[NSMutableArray removeObjectsAtIndexes:](self->_trackList, "removeObjectsAtIndexes:", v14);
  }
  v7 = objc_msgSend(v14, "countOfIndexesInRange:", 0, self->_activeListIndex);
  activeListIndex = self->_activeListIndex;
  v9 = activeListIndex >= v7;
  v10 = activeListIndex - v7;
  if (!v9)
    v10 = 0;
  self->_activeListIndex = v10;
  v11 = objc_msgSend(v14, "countOfIndexesInRange:", 0, self->_upNextIndex);
  upNextIndex = self->_upNextIndex;
  v9 = upNextIndex >= v11;
  v13 = upNextIndex - v11;
  if (!v9)
    v13 = 0;
  self->_upNextIndex = v13;
  -[TVPPlaylist _updateCurrent:andNextItems:withContext:](self, "_updateCurrent:andNextItems:withContext:", v4 ^ 1u, 1, 0);

}

unint64_t __36__TVPPlaylist_removeItemsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t result;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  objc_msgSend(*(id *)(v3 + 16), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  if (v6 < result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", v6);
  return result;
}

- (void)setUpcomingItemsLimit:(unint64_t)a3
{
  unint64_t v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  self->_upcomingItemsLimit = v3;
}

- (void)addItemsToUpNext:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v5 = -[TVPPlaylist upNextIndex](self, "upNextIndex");
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v5, objc_msgSend(v4, "count"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TVPPlaylist insertItems:atIndexes:](self, "insertItems:atIndexes:", v4, v6);

}

- (void)setCurrentMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentMediaItem, a3);
}

- (void)setNextMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_nextMediaItem, a3);
}

- (TVPMediaItem)previousMediaItem
{
  return self->_previousMediaItem;
}

- (void)setPreviousMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_previousMediaItem, a3);
}

- (NSArray)trackList
{
  return &self->_trackList->super;
}

- (NSArray)activeList
{
  return self->_activeList;
}

- (unint64_t)activeListIndex
{
  return self->_activeListIndex;
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (unint64_t)count
{
  return self->_count;
}

- (BOOL)windowed
{
  return self->_windowed;
}

- (unint64_t)numConsecutivePlaybackFailures
{
  return self->_numConsecutivePlaybackFailures;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)shuffleEnabled
{
  return self->_shuffleEnabled;
}

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (BOOL)skipExplicit
{
  return self->_skipExplicit;
}

- (NSDictionary)changeContext
{
  return self->_changeContext;
}

- (unint64_t)upcomingItemsLimit
{
  return self->_upcomingItemsLimit;
}

- (unint64_t)upNextIndex
{
  return self->_upNextIndex;
}

@end
