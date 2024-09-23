@implementation BTAVRCP_Library

- (BTAVRCP_Library)init
{
  BTAVRCP_Library *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BTAVRCP_RootFolder *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BTAVRCP_Library;
  v2 = -[BTAVRCP_Library init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "libraryDidChange", MPMediaLibraryDidChangeNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "libraryDidChange", MPRadioLibraryStationsDidChangeNotification, 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
    objc_msgSend(v5, "setCloudFilteringType:", 7);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
    objc_msgSend(v6, "beginGeneratingLibraryChangeNotifications");

    +[MPMediaQuery setFilteringDisabled:](MPMediaQuery, "setFilteringDisabled:", 1);
    v7 = objc_alloc((Class)NSMutableArray);
    v8 = objc_alloc_init(BTAVRCP_RootFolder);
    v9 = objc_msgSend(v7, "initWithObjects:", v8, 0);
    -[BTAVRCP_Library setCurrentVFSPath:](v2, "setCurrentVFSPath:", v9);

    -[BTAVRCP_Library setCurrentSearchQuery:](v2, "setCurrentSearchQuery:", 0);
    -[BTAVRCP_Library changePath:replyBlock:](v2, "changePath:replyBlock:", 1, &stru_1000189D8);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  objc_msgSend(v3, "endGeneratingLibraryChangeNotifications");

  v4.receiver = self;
  v4.super_class = (Class)BTAVRCP_Library;
  -[BTAVRCP_Library dealloc](&v4, "dealloc");
}

- (void)libraryDidChange
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library delegate](self, "delegate"));
  objc_msgSend(v2, "libraryDidChange");

}

- (void)getCurrentPath:(id)a3
{
  void (**v4)(id, uint64_t, void *);
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _BYTE v25[128];

  v4 = (void (**)(id, uint64_t, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

        if (v11 != v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
          objc_msgSend(v5, "addObject:", v14);

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v8);
  }

  v23[0] = CFSTR("kFolders");
  v23[1] = CFSTR("kNumItems");
  v24[0] = v5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "childrenCount")));
  v24[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
  v4[2](v4, 4, v18);

}

- (void)changePath:(unint64_t)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const __CFString *v22;
  void *v23;

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath"));
  v8 = v7;
  if (!a3)
  {
    v16 = objc_msgSend(v7, "count");

    if ((unint64_t)v16 >= 2)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath"));
      objc_msgSend(v11, "removeLastObject");
      goto LABEL_6;
    }
    v10 = 9;
LABEL_9:
    v6[2](v6, v10, 0);
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v21 = 0;
  v10 = (uint64_t)objc_msgSend(v9, "createFolderWithUid:folder:", a3, &v21);
  v11 = v21;

  if ((_DWORD)v10 != 4)
  {

    goto LABEL_9;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "predicates"));
  objc_msgSend(v11, "storePredicates:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath"));
  objc_msgSend(v15, "addObject:", v11);

LABEL_6:
  v22 = CFSTR("kNumItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "childrenCount")));
  v23 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  ((void (**)(id, uint64_t, void *))v6)[2](v6, 4, v20);

LABEL_10:
}

- (void)getVFSItemsFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 attributeIDs:(id)a5 replyBlock:(id)a6
{
  id v10;
  void (**v11)(id, uint64_t, void *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v10 = a5;
  v11 = (void (**)(id, uint64_t, void *))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  while (a3 <= a4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyItemAtIndex:attributeIDs:", a3, v10));

    if (!v15)
      break;
    objc_msgSend(v12, "addObject:", v15);

    ++a3;
  }
  if (objc_msgSend(v12, "count"))
  {
    v17 = CFSTR("kItems");
    v18 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v11[2](v11, 4, v16);

  }
  else
  {
    v11[2](v11, 11, 0);
  }

}

- (void)getSearchItemsFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 attributeIDs:(id)a5 replyBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;

  v10 = a5;
  v11 = a6;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  if (self->_currentSearchQuery)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    while (a3 <= a4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaQuery itemAtIndex:](self->_currentSearchQuery, "itemAtIndex:", a3));
      if (!v14)
        break;
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyItemWithAttributeIDs:", v10));
      objc_msgSend(v13, "addObject:", v16);

      ++a3;
    }
    if (objc_msgSend(v13, "count"))
    {
      v18 = CFSTR("kItems");
      v19 = v13;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
      ((void (**)(_QWORD, uint64_t, void *))v12)[2](v12, 4, v17);

    }
    else
    {
      v12[2](v12, 11, 0);
    }

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 20, 0);
  }

}

- (void)getNowPlayingItemsFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 attributeIDs:(id)a5 replyBlock:(id)a6
{
  id v9;
  void (**v10)(id, uint64_t, void *);
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;

  v9 = a5;
  v10 = (void (**)(id, uint64_t, void *))a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MPMusicPlayerController systemMusicPlayer](MPMusicPlayerController, "systemMusicPlayer"));
  v13 = objc_msgSend(v12, "numberOfItems");
  if (a3 <= a4)
  {
    if ((unint64_t)v13 <= a3)
      v14 = a3;
    else
      v14 = (unint64_t)v13;
    v15 = a4 + 1;
    do
    {
      if (v14 == a3)
        break;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nowPlayingItemAtIndex:", a3));
      if (!v16)
        break;
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyItemWithAttributeIDs:", v9));
      objc_msgSend(v11, "addObject:", v18);

      ++a3;
    }
    while (v15 != a3);
  }
  if (objc_msgSend(v11, "count"))
  {
    v20 = CFSTR("kItems");
    v21 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v10[2](v10, 4, v19);

  }
  else
  {
    v10[2](v10, 11, 0);
  }

}

- (unsigned)getVFSItemWithUid:(unint64_t)a3 attributeIDs:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyAttributesForUid:attributeIDs:", a3, v9));

  if (v12)
  {
    objc_msgSend(v8, "addEntriesFromDictionary:", v12);
    v13 = 4;
  }
  else
  {
    v13 = 9;
  }

  return v13;
}

- (unsigned)getSearchItemWithUid:(unint64_t)a3 attributeIDs:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  MPMediaQuery *currentSearchQuery;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v8 = a4;
  v9 = a5;
  currentSearchQuery = self->_currentSearchQuery;
  if (currentSearchQuery)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaQuery itemWithUid:](currentSearchQuery, "itemWithUid:", a3));
    v12 = v11;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyAttributesForIDs:", v8));
      objc_msgSend(v9, "addEntriesFromDictionary:", v13);

      v14 = 4;
    }
    else
    {
      v14 = 9;
    }

  }
  else
  {
    v14 = 20;
  }

  return v14;
}

- (unsigned)getNowPlayingItemWithUid:(unint64_t)a3 attributeIDs:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMusicPlayerController systemMusicPlayer](MPMusicPlayerController, "systemMusicPlayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nowPlayingItem"));
  v11 = v10;
  if (v10 && objc_msgSend(v10, "persistentID") == (id)a3)
  {
    v12 = objc_msgSend(v9, "indexOfNowPlayingItem");
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
      v14 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v14 = (uint64_t)v12 + 1;
    v15 = objc_msgSend(v9, "numberOfItems");
    if (v15)
      v13 = (uint64_t)v15;
  }
  else
  {

    v16 = objc_alloc_init((Class)MPMediaQuery);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "itemWithUid:", a3));

    if (!v11)
    {
      v18 = 9;
      goto LABEL_13;
    }
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100005B70;
  v20[3] = &unk_100018A00;
  v23 = v14;
  v24 = v13;
  v21 = v8;
  v22 = v11;
  v17 = v11;
  objc_msgSend(v7, "enumerateAttributeIDs:", v20);

  v18 = 4;
LABEL_13:

  return v18;
}

- (void)search:(id)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t, void *);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  MPMediaQuery *v13;
  MPMediaQuery *v14;
  void *v15;
  void *v16;
  MPMediaQuery *currentSearchQuery;
  MPMediaQuery *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;

  v6 = (void (**)(id, uint64_t, void *))a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "query"));
  v11 = objc_msgSend(v10, "copy");
  v12 = v11;
  if (v11)
    v13 = (MPMediaQuery *)v11;
  else
    v13 = (MPMediaQuery *)objc_alloc_init((Class)MPMediaQuery);
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", MPMediaItemPropertyTitle, MPMediaItemPropertyAlbumTitle, MPMediaItemPropertyArtist, MPMediaItemPropertyPodcastTitle, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_MPMediaSearchStringPredicate predicateWithSearchString:forProperties:](_MPMediaSearchStringPredicate, "predicateWithSearchString:forProperties:", v7, v15));

  -[MPMediaQuery addFilterPredicate:](v14, "addFilterPredicate:", v16);
  currentSearchQuery = self->_currentSearchQuery;
  self->_currentSearchQuery = v14;
  v18 = v14;

  v22 = CFSTR("kNumItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaQuery items](v18, "items"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count")));
  v23 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));

  v6[2](v6, 4, v21);
}

- (unint64_t)getVFSItemsCount
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));
  v4 = objc_msgSend(v3, "childrenCount");

  return (unint64_t)v4;
}

- (unint64_t)getSearchItemsCount
{
  unint64_t result;
  void *v3;
  id v4;

  result = (unint64_t)self->_currentSearchQuery;
  if (result)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)result, "items"));
    v4 = objc_msgSend(v3, "count");

    return (unint64_t)v4;
  }
  return result;
}

- (unint64_t)getNowPlayingItemsCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPMusicPlayerController systemMusicPlayer](MPMusicPlayerController, "systemMusicPlayer"));
  v3 = objc_msgSend(v2, "numberOfItems");

  return (unint64_t)v3;
}

- (unsigned)playVFSItemWithUid:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Library currentVFSPath](self, "currentVFSPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  LOBYTE(a3) = objc_msgSend(v5, "playItemWithUid:", a3);

  return a3;
}

- (unsigned)playSearchItemWithUid:(unint64_t)a3
{
  MPMediaQuery *currentSearchQuery;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  currentSearchQuery = self->_currentSearchQuery;
  if (!currentSearchQuery)
    return 20;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaQuery itemWithUid:](currentSearchQuery, "itemWithUid:", a3));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMusicPlayerController systemMusicPlayer](MPMusicPlayerController, "systemMusicPlayer"));
    objc_msgSend(v6, "setQueueWithQuery:firstItem:", self->_currentSearchQuery, v5);
    objc_msgSend(v6, "play");

    v7 = 4;
  }
  else
  {
    v7 = 9;
  }

  return v7;
}

- (unsigned)playNowPlayingItemWithUid:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = objc_alloc_init((Class)MPMediaQuery);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemWithUid:", a3));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMusicPlayerController systemMusicPlayer](MPMusicPlayerController, "systemMusicPlayer"));
    objc_msgSend(v6, "setNowPlayingItem:", v5);
    objc_msgSend(v6, "play");

    v7 = 4;
  }
  else
  {
    v7 = 9;
  }

  return v7;
}

- (BTAVRCP_LibraryDelegate)delegate
{
  return (BTAVRCP_LibraryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)currentVFSPath
{
  return self->_currentVFSPath;
}

- (void)setCurrentVFSPath:(id)a3
{
  objc_storeStrong((id *)&self->_currentVFSPath, a3);
}

- (MPMediaQuery)currentSearchQuery
{
  return self->_currentSearchQuery;
}

- (void)setCurrentSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_currentSearchQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSearchQuery, 0);
  objc_storeStrong((id *)&self->_currentVFSPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
