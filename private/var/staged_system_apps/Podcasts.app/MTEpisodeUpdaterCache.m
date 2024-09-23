@implementation MTEpisodeUpdaterCache

+ (id)defaultPropertiesToFetch
{
  _QWORD v3[10];

  v3[0] = kEpisodeEnclosureUrl;
  v3[1] = kEpisodePodcastUuid;
  v3[2] = kEpisodeTitle;
  v3[3] = kEpisodeUuid;
  v3[4] = kEpisodeGuid;
  v3[5] = kEpisodePubDate;
  v3[6] = kEpisodeByteSize;
  v3[7] = kEpisodeAssetURL;
  v3[8] = kEpisodePersistentID;
  v3[9] = kEpisodeStoreTrackId;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 10));
}

+ (id)episodeCacheWithPredicate:(id)a3 inCtx:(id)a4
{
  return _objc_msgSend(a1, "episodeCacheWithPredicate:inCtx:extraProperties:", a3, a4, 0);
}

+ (id)episodeCacheWithPredicate:(id)a3 inCtx:(id)a4 extraProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:inCtx:extraProperties:", v10, v9, v8);

  return v11;
}

- (MTEpisodeUpdaterCache)initWithPredicate:(id)a3 inCtx:(id)a4 extraProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTEpisodeUpdaterCache *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSCache *v23;
  NSMutableSet *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSMutableSet *unvisitedUUIDs;
  void *v31;
  uint64_t v32;
  NSDictionary *lookupDict;
  NSCache *managedObjectCache;
  NSCache *v35;
  MTEpisodeUpdaterCache *v36;
  void *v38;
  id v39;
  void *v40;
  id v41;
  NSMutableSet *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  NSCache *v54;
  id v55;
  NSMutableSet *v56;
  objc_super v57;
  _QWORD v58[6];
  _QWORD v59[6];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v57.receiver = self;
  v57.super_class = (Class)MTEpisodeUpdaterCache;
  v11 = -[MTEpisodeUpdaterCache init](&v57, "init");
  if (v11)
  {
    v44 = v8;
    v12 = &__NSArray0__struct;
    if (v10)
      v12 = v10;
    v13 = v12;

    v14 = objc_msgSend((id)objc_opt_class(v11), "defaultPropertiesToFetch");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v13));

    objc_storeStrong((id *)&v11->_propertiesToFetch, v16);
    objc_storeStrong((id *)&v11->_ctx, a4);
    v17 = v9;
    if ((-[MTManagedObjectContext isResetable](v11->_ctx, "isResetable") & 1) != 0)
      v41 = 0;
    else
      v41 = objc_alloc_init((Class)NSCache);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1001372F4;
    v45[3] = &unk_1004AC4C8;
    v43 = v17;
    v46 = v17;
    v47 = v44;
    v10 = v16;
    v48 = v10;
    v49 = v38;
    v50 = v18;
    v51 = v19;
    v52 = v40;
    v53 = v20;
    v23 = (NSCache *)v41;
    v54 = v23;
    v55 = v21;
    v24 = v22;
    v56 = v24;
    v25 = v21;
    v39 = v20;
    v26 = v40;
    v27 = v19;
    v28 = v18;
    v29 = v38;
    objc_msgSend(v46, "performBlockAndWait:", v45);
    unvisitedUUIDs = v11->_unvisitedUUIDs;
    v11->_unvisitedUUIDs = v24;
    v42 = v24;

    v58[0] = kEpisodeTitle;
    v58[1] = kEpisodeEnclosureUrl;
    v59[0] = v29;
    v59[1] = v28;
    v58[2] = kEpisodeGuid;
    v58[3] = kEpisodePersistentID;
    v59[2] = v27;
    v59[3] = v26;
    v31 = v26;
    v58[4] = kEpisodeAssetURL;
    v58[5] = kEpisodeUuid;
    v59[4] = v39;
    v59[5] = v25;
    v32 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 6));
    lookupDict = v11->_lookupDict;
    v11->_lookupDict = (NSDictionary *)v32;

    managedObjectCache = v11->_managedObjectCache;
    v11->_managedObjectCache = v23;
    v35 = v23;

    v8 = v44;
    v36 = v11;

    v9 = v43;
  }

  return v11;
}

- (id)searchCacheForEpisodeMatchingMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableSet *unvisitedUUIDs;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForPersistentID:](self, "episodeForPersistentID:", v5));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetUrl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForAssetUrl:](self, "episodeForAssetUrl:", v7));

    if (!v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForGuid:](self, "episodeForGuid:", v8));

      if (!v6)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByStrippingHTML"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pubDate"));
        objc_msgSend(v11, "timeIntervalSinceReferenceDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForTitle:pubDate:](self, "episodeForTitle:pubDate:", v10));

      }
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));

  if (v12)
  {
    unvisitedUUIDs = self->_unvisitedUUIDs;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    -[NSMutableSet removeObject:](unvisitedUUIDs, "removeObject:", v15);

  }
  else if (v6)
  {
    v16 = _MTLogCategoryDatabase(v13);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
      v20 = 138412290;
      v21 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "MTEpisodeUpdaterCache encountered episode without UUID %@", (uint8_t *)&v20, 0xCu);

    }
  }

  return v6;
}

- (id)searchCacheForEpisodeMatchingFeedItem:(id)a3 enclosureUrl:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableSet *unvisitedUUIDs;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guid"));

  if (!v8
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guid")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForGuid:](self, "episodeForGuid:", v9)),
        v9,
        !v10))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForEnclosure:](self, "episodeForEnclosure:", v7));
    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByStrippingHTML"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pubDate"));
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForTitle:pubDate:](self, "episodeForTitle:pubDate:", v12));

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));

  if (v14)
  {
    unvisitedUUIDs = self->_unvisitedUUIDs;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
    -[NSMutableSet removeObject:](unvisitedUUIDs, "removeObject:", v17);

  }
  else if (v10)
  {
    v18 = _MTLogCategoryDatabase(v15);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
      v22 = 138412290;
      v23 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "MTEpisodeUpdaterCache encountered episode without UUID %@", (uint8_t *)&v22, 0xCu);

    }
  }

  return v10;
}

- (id)unvisitedEpisodes
{
  void *v3;
  void *v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  MTManagedObjectContext *ctx;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSMutableSet count](self->_unvisitedUUIDs, "count")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", self->_unvisitedUUIDs));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_unvisitedUUIDs;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = kEpisodeUuid;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeWithValue:forPropertyKey:](self, "episodeWithValue:forPropertyKey:", v11, v9, (_QWORD)v19));
        if (v12)
        {
          objc_msgSend(v3, "addObject:", v12);
          objc_msgSend(v4, "removeObject:", v11);
        }

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    ctx = self->_ctx;
    v14 = kMTEpisodeEntityName;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuids:](MTEpisode, "predicateForEpisodeUuids:", v4));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTManagedObjectContext objectsInEntity:predicate:propertiesToFetch:batchSize:](ctx, "objectsInEntity:predicate:propertiesToFetch:batchSize:", v14, v15, self->_propertiesToFetch, 0));

    objc_msgSend(v3, "addObjectsFromArray:", v16);
  }
  v17 = objc_msgSend(v3, "copy", (_QWORD)v19);

  return v17;
}

- (id)episodeForUUID:(id)a3
{
  id v4;
  MTManagedObjectContext *ctx;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  void *v9;
  MTManagedObjectContext *v10;
  _QWORD v12[7];
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = sub_100046944;
    v18 = sub_100046B0C;
    v19 = 0;
    if (-[MTManagedObjectContext isResetable](self->_ctx, "isResetable"))
    {
      ctx = self->_ctx;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100137E40;
      v13[3] = &unk_1004A6F10;
      v6 = v13;
      v13[6] = &v14;
      v13[4] = self;
      v13[5] = v4;
      -[MTManagedObjectContext performBlockAndWait:](ctx, "performBlockAndWait:", v13);
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_managedObjectCache, "objectForKey:", v4));
      v9 = (void *)v15[5];
      v15[5] = v8;

      if (v15[5])
      {
LABEL_8:
        v7 = (id)v15[5];
        _Block_object_dispose(&v14, 8);

        goto LABEL_9;
      }
      v10 = self->_ctx;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100137E88;
      v12[3] = &unk_1004A6F10;
      v6 = v12;
      v12[6] = &v14;
      v12[4] = self;
      v12[5] = v4;
      -[MTManagedObjectContext performBlockAndWait:](v10, "performBlockAndWait:", v12);
    }

    goto LABEL_8;
  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (id)episodeWithValue:(id)a3 forPropertyKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "isEqualToString:", kEpisodeTitle) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_lookupDict, "objectForKey:", v8));
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v6));
      if (v12)
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForUUID:](self, "episodeForUUID:", v12));
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)episodeForGuid:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeWithValue:forPropertyKey:](self, "episodeWithValue:forPropertyKey:", v4, kEpisodeGuid));
  else
    v5 = 0;

  return v5;
}

- (id)episodeForEnclosure:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeWithValue:forPropertyKey:](self, "episodeWithValue:forPropertyKey:", v4, kEpisodeEnclosureUrl));
  else
    v5 = 0;

  return v5;
}

- (id)episodeForAssetUrl:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeWithValue:forPropertyKey:](self, "episodeWithValue:forPropertyKey:", v4, kEpisodeAssetURL));
  else
    v5 = 0;

  return v5;
}

- (id)episodeForPersistentID:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeWithValue:forPropertyKey:](self, "episodeWithValue:forPropertyKey:", a3, kEpisodePersistentID));
  else
    return 0;
}

- (id)episodeForTitle:(id)a3 pubDate:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache lookupDict](self, "lookupDict"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", kEpisodeTitle));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v25;
      v15 = 1.79769313e308;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForUUID:](self, "episodeForUUID:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16), (_QWORD)v24));
        if (!v17)
          break;
        v18 = v17;
        objc_msgSend(v17, "pubDate");
        v20 = vabdd_f64(v19, a4);
        if (v20 < v15)
        {
          v21 = v18;

          v13 = v21;
          v15 = v20;
        }

        if (v12 == (id)++v16)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v12)
            goto LABEL_4;

          if (v15 < 604800.0)
          {
            v13 = v13;
            v22 = v13;
            goto LABEL_18;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
      v13 = 0;
    }

LABEL_17:
    v22 = 0;
LABEL_18:

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (NSDictionary)lookupDict
{
  return self->_lookupDict;
}

- (void)setLookupDict:(id)a3
{
  objc_storeStrong((id *)&self->_lookupDict, a3);
}

- (NSCache)managedObjectCache
{
  return self->_managedObjectCache;
}

- (void)setManagedObjectCache:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectCache, a3);
}

- (MTManagedObjectContext)ctx
{
  return self->_ctx;
}

- (void)setCtx:(id)a3
{
  objc_storeStrong((id *)&self->_ctx, a3);
}

- (NSArray)propertiesToFetch
{
  return self->_propertiesToFetch;
}

- (void)setPropertiesToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_propertiesToFetch, a3);
}

- (NSMutableSet)unvisitedUUIDs
{
  return self->_unvisitedUUIDs;
}

- (void)setUnvisitedUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_unvisitedUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unvisitedUUIDs, 0);
  objc_storeStrong((id *)&self->_propertiesToFetch, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
  objc_storeStrong((id *)&self->_managedObjectCache, 0);
  objc_storeStrong((id *)&self->_lookupDict, 0);
}

@end
