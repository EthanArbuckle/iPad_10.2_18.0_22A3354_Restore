@implementation MTMediaLibraryDebugProvider

- (id)debugData
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery mt_allItemsForPodcastsApp](MPMediaQuery, "mt_allItemsForPodcastsApp"));
  v3 = objc_alloc_init((Class)NSMutableArray);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v7);
        v9 = objc_alloc_init((Class)NSMutableDictionary);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTMLMediaItem propertiesForMediaItem](MTMLMediaItem, "propertiesForMediaItem"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000051C4;
        v17[3] = &unk_1000083A8;
        v18 = v9;
        v12 = v9;
        objc_msgSend(v8, "enumerateValuesForProperties:usingBlock:", v11, v17);

        objc_msgSend(v3, "addObject:", v12);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMJSONUtil toJSONString:](IMJSONUtil, "toJSONString:", v3));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataUsingEncoding:", 4));

  return v14;
}

- (id)debugDataFileName
{
  return CFSTR("MediaLibrary.json");
}

@end
