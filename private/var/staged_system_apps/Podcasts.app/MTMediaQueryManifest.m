@implementation MTMediaQueryManifest

- (MTMediaQueryManifest)initWithMediaQuery:(id)a3 initialItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  MTMediaQueryManifest *v20;
  MTMediaQueryManifest *v21;
  id v23;
  id v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];

  v25 = a3;
  v23 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTMLMediaItem itemWithMPMediaItem:](MTMLMediaItem, "itemWithMPMediaItem:"));
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_10004669C;
  v39 = sub_1000469C4;
  v40 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainOrPrivateContext"));

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100087B44;
  v31[3] = &unk_1004A6690;
  v8 = v7;
  v32 = v8;
  v9 = v5;
  v33 = v9;
  v34 = &v35;
  objc_msgSend(v8, "performBlockAndWait:", v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "items"));
  v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTMLMediaItem itemWithMPMediaItem:](MTMLMediaItem, "itemWithMPMediaItem:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v15)));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "persistentId"));
        objc_msgSend(v11, "addObject:", v17);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    }
    while (v13);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), kEpisodePersistentID, v11));
  v19 = v36[5];
  v26.receiver = self;
  v26.super_class = (Class)MTMediaQueryManifest;
  v20 = -[MTPredicateManifest initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:](&v26, "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:", v19, v18, 0);
  v21 = v20;
  if (v20)
  {
    -[MTMediaQueryManifest setQuery:](v20, "setQuery:", v25);
    -[MTMediaQueryManifest setPersistentIds:](v21, "setPersistentIds:", v11);
  }

  _Block_object_dispose(&v35, 8);
  return v21;
}

- (void)_processResults:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  -[MTMediaQueryManifest setPidToUuidMapping:](self, "setPidToUuidMapping:", v5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaQueryManifest pidToUuidMapping](self, "pidToUuidMapping", (_QWORD)v15));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v11, "persistentID")));
        objc_msgSend(v12, "setObject:forKey:", v13, v14);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[MTMediaQueryManifest _updateSortOrder](self, "_updateSortOrder");
}

- (void)_updateSortOrder
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaQueryManifest persistentIds](self, "persistentIds"));
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaQueryManifest persistentIds](self, "persistentIds", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaQueryManifest pidToUuidMapping](self, "pidToUuidMapping"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[MTPredicateManifest setExplicitSortOrder:](self, "setExplicitSortOrder:", v5);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (a6 == 2)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaQueryManifest pidToUuidMapping](self, "pidToUuidMapping"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v12, "persistentID")));
    objc_msgSend(v15, "removeObjectForKey:", v16);
    goto LABEL_5;
  }
  if (a6 == 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaQueryManifest pidToUuidMapping](self, "pidToUuidMapping"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v12, "persistentID")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringValue"));
    objc_msgSend(v15, "setValue:forKey:", v16, v18);

LABEL_5:
  }

}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[MTMediaQueryManifest _updateSortOrder](self, "_updateSortOrder");
  v5.receiver = self;
  v5.super_class = (Class)MTMediaQueryManifest;
  -[MTPredicateManifest controllerDidChangeContent:](&v5, "controllerDidChangeContent:", v4);

}

- (MPMediaQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSArray)persistentIds
{
  return self->_persistentIds;
}

- (void)setPersistentIds:(id)a3
{
  objc_storeStrong((id *)&self->_persistentIds, a3);
}

- (NSMutableDictionary)pidToUuidMapping
{
  return self->_pidToUuidMapping;
}

- (void)setPidToUuidMapping:(id)a3
{
  objc_storeStrong((id *)&self->_pidToUuidMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidToUuidMapping, 0);
  objc_storeStrong((id *)&self->_persistentIds, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
